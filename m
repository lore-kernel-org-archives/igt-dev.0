Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3811A10E9AA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 16:29:28 +0000 (UTC)
Date: Thu, 5 May 2022 12:29:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <YnP7ZWA+SmfHX/4X@intel.com>
References: <20220505110354.30768-1-anshuman.gupta@intel.com>
 <20220505110354.30768-6-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505110354.30768-6-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 5/9] tools/intel_pm_rpm: Add an
 option to configure autosuspend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, igt-dev@lists.freedesktop.org,
 badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 05, 2022 at 04:33:50PM +0530, Anshuman Gupta wrote:
> Few PCI devices under DGFX card tree don't have any kernel driver.
> These devices will block D3cold state of gfx root port.
> Adding support to configure autosuspend for all PCI devices
> under the gfx root port. This will not save/restore pci devices
> power attributes. This will be useful to tune D3Cold after boot.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tools/intel_pm_rpm.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index bf8212b3c..92ce4f00b 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -45,10 +45,12 @@ typedef struct {
>  const char *help_str =
>  	"  --disable-display\t\tDisable all screen and try to go into runtime pm.\n"
>  	"  --setup-d3cold\t\tPrepare dgfx gfx card to enter runtime D3Cold.\n"
> +	"  --configure-autosuspend\t\tConfigure dgfx gfx card pci tree autosuspend.\n"
>  	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
>  static struct option long_options[] = {
>  	{"disable-display", 0, 0, 'd'},
>  	{"setup-d3cold", 0, 0, 's'},
> +	{"configure-autosuspend", 0, 0, 'c'},

I know, my fault! but I believe these names are confusing...


* disable-display is okay... but it is disabling display and waiting in the loop and restoring display at ctrl+c

* setup-d3cold would be an okay name, if we are exiting and never restoring any state and leaving it auto in all cases.

* configure-autosuspend: that is exactly what my brain things about the setup-d3cold. After all, anyone willing to use
this use case here is looking after setting up a d3cold possible environment....


so, we either:

1. ensure setup-d3cold never restore the runtime_pm controls. and we use only that case.

2. we ensure we have 2 options setup-d3cold that never restores the runtime_pm and a new
force-d3cold-wait that loops until the ctrl+c and restore everything at exit.
then it would probably be good to rename the display one to disable-display-wait

>  	{"help", 0, 0, 'h'},
>  	{ 0, 0, 0, 0 }
>  };
> @@ -72,6 +74,22 @@ static void disable_all_displays(data_t *data)
>  	}
>  }
>  
> +static void
> +configure_gfx_card_autosuspend(data_t *data)
> +{
> +	struct pci_device *root;
> +
> +	root = igt_device_get_pci_root_port(data->drm_fd);
> +
> +	igt_info("Configuring pci devs autosuspend under Root port %04x:%02x:%02x.%01x\n",
> +		  root->domain, root->bus, root->dev, root->func);
> +
> +	if  (igt_pm_enbale_pci_card_autosuspend(root) < 0) {
> +		igt_warn("Unable to configure pci devs autosuspend under Root port"
> +			 "%04x:%02x:%02x.%01x\n", root->domain, root->bus, root->dev, root->func);
> +	}
> +}
> +
>  static void setup_gfx_card_d3cold(data_t *data)
>  {
>  	struct pci_device *root;
> @@ -102,7 +120,7 @@ static void setup_gfx_card_d3cold(data_t *data)
>  
>  int main(int argc, char *argv[])
>  {
> -	bool disable_display = false, setup_d3cold = false;
> +	bool disable_display = false, setup_d3cold = false, configure_autosuspend = false;
>  	struct igt_device_card card;
>  	char *env_device = NULL;
>  	int c, option_index = 0;
> @@ -140,6 +158,9 @@ int main(int argc, char *argv[])
>  		case 's':
>  			setup_d3cold = true;
>  			break;
> +		case 'c':
> +			configure_autosuspend = true;
> +			break;
>  		default:
>  		case 'h':
>  			usage(argv[0]);
> @@ -192,6 +213,9 @@ int main(int argc, char *argv[])
>  	if (setup_d3cold)
>  		setup_gfx_card_d3cold(&data);
>  
> +	if (configure_autosuspend)
> +		configure_gfx_card_autosuspend(&data);
> +
>  exit:
>  	igt_restore_runtime_pm();
>  
> -- 
> 2.26.2
> 
