{include file='user/setup_css.tpl'} 

<style>
	.nav-pills .nav-link {
		font-weight: 500;
		transition: all .15s ease;
		box-shadow: 0 4px 6px rgba(50,50,93,.11),0 1px 3px rgba(0,0,0,.08);
	}
	
	@media (max-width:575.98px) {
		.nav-pills .nav-item {
			margin-bottom: 1rem
		}
	}
	
	@media (max-width:767.98px) {
		.nav-pills:not(.nav-pills-circle) .nav-item {
			padding-right: 0
		}
	}

	.btn:not(:last-child){
		margin-right:.5rem
	}
	
	@keyframes flame {
  50% {
    -webkit-transform: scale(0.8) rotate(45deg);
            transform: scale(0.8) rotate(45deg);
  }
}
</style>
<script>
window.addEventListener('load', () => { 
	$(".mlist li a").first().addClass("active");
	$(".applist:first-child").addClass("active");
	$(".applist li a").first().addClass("active");
	$(".configlist:first-child").addClass("active");	
}); 
</script>
<div class="col-xl-8 col-lg-8 col-md-6 col-sm-12 col-12">
         <div class="card" >
            <div class="card mlist ">
			   </br></br>
			   <ul class="nav nav-pills justify-content-center" id="rounded-pills-icon-tab" role="tablist">
			    {$a = 0}
				{foreach $setup as $app}
				{if $app['type'] != $a}
				{$a = $app['type']}
                  <li class="nav-item ml-1 mr-1">
                     <a class="nav-link mb-2   text-center " id="rounded-pills-icon-A{$app['type']}-tab" data-toggle="pill" href="#rounded-pills-icon-A{$app['type']}" role="tab" aria-controls="rounded-pills-icon-A{$app['type']}" aria-selected="true" style="width:100px">{$setup_name->SetupName({$app['type']})}</a>
                  </li> 
				{/if}  
				{/foreach}
               </ul>
            </div>
		    
            <div class="card tab-content apps" id="rounded-pills-icon-tabContent">			
				{$b = 0}
				{foreach $setup as $listo}
				{if $listo['type'] != $b}
				{$b = $listo['type']}
               <div class="tab-pane  fade show applist" id="rounded-pills-icon-A{$listo['type']}" role="tabpanel" aria-labelledby="rounded-pills-icon-A{$listo['type']}-tab">
				  <ul class="nav nav-pills N{$listo['type']} justify-content-center" id="rounded-pills-icon-tab" role="tablist">
					{$c = 0}
                    {foreach $setup as $list}
					{if $list['id'] != $c }
					{$c = $list['id']}
					{if $list['type'] == $listo['type'] }
						<li class="nav-item ml-1 mr-1 ap">
							<a class="nav-link mb-2 {if $list['id'] ==1 || $list['id'] == 4 || $list['id'] == 6 || $list['id'] == 8 || $list['id'] == 10 || $list['id'] == 11 || $list['id'] == 13}active{/if}  text-center" id="rounded-pills-icon-{$list['id']}-tab" data-toggle="pill" href="#rounded-pills-icon-{$list['id']}" role="tab" aria-controls="rounded-pills-icon-{$list['id']}" aria-selected="false"><i class="{$list['icon']}"></i> {$list['title']} </a>
						</li>
                    {/if}
					{/if} 					
					{/foreach}
                  </ul>
                  <hr>
                  <div class="card-body tab-content" id="rounded-pills-icon-tabContent">
					{$d = 0}
					{foreach $setup as $lists}
					{if $lists['id'] != $d}
					{$d = $lists['id']}
					{if $lists['type'] == $listo['type'] }
					
                     <div class="tab-pane  fade show configlist" id="rounded-pills-icon-{$lists['id']}" role="tabpanel" aria-labelledby="rounded-pills-icon-{$lists['id']}-tab">
							<p>
							   {$lang->get('downloads')}  
							   <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="{$lists['url']}" target="_blank"><i class="fas fa-cloud-download-alt"></i> {$lang->get('App')}</a>
							</p>
							{if $Config['TutorialState'] != 1}
							<p>
							   {$lang->get('setup')} 
							   <button  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white" type="button" style="background-color: #1572e8;" data-toggle="modal" data-target="#modal_{$lists['id']}"><i class="fas fa-bookmark"></i> {$lang->get('View')} </button>
							</p>
							{/if}
						{if $lists['type'] == 1 || $lists['type'] == 2 || $lists['type'] == 3 || $lists['type'] == 4 || $lists['type'] == 5 || $lists['type'] == 6}	
							<p>
							  {$lang->get('ConfigLink')}  
							  <a  class="copy-text btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  data-clipboard-text="{$Config['subUrl']}{$sub_token}?{$lists['link']}"><i class="fas fa-paper-plane"></i>  {$lang->get('CopyLink')}</a>
							{if $lists['id'] == 1 ||$lists['id'] == 4 || $lists['id'] == 8 || $lists['id'] == 9}
							   <a  class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  href="clash://install-config?url={urlencode($Config["subUrl"])}{urlencode($sub_token)}?{urlencode($lists['link'])}"><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')}</a>
							{/if}
							{if $lists['id'] == 6}
								<a class="btn-dl btn btn-sm btn-flat-primary" style="background-color:#1572e8;color:white"  onclick=AddSub("{$Config["subUrl"]}{$sub_token}?{$lists['link']}","shadowrocket://add/sub://")><i class="fas fa-paper-plane"></i> {$lang->get('ToApp')} </a>
							{/if}
							</p>
						{/if}                         
					 </div>
					{/if} 
					{/if}
					{/foreach} 
                  </div>
				  
			   </div> 
			{/if}  
			{/foreach}   
            </div>
			
         </div>
      </div>
	   


<style>				
.modal-body {
    max-height: calc(65vh - 200px);
    overflow-y: auto;
}
</style>
{foreach $setup as $modals}
<div class="modal fade" id="modal_{$modals['id']}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
      <div class="modal-content" >
         <div class="modal-header">
            <h5 class="modal-title" >{$modals['title']} </h5>
         </div>
         <div class="modal-body">
           {$modals['content']}
         </div>
      </div>
   </div> 
</div>
{/foreach}

