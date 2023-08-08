Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1F110E0E8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 20:46:39 +0000 (UTC)
Date: Tue, 8 Aug 2023 16:46:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <ZNKppCx1L72ohckE@intel.com>
References: <20230808115913.1064831-1-anshuman.gupta@intel.com>
 <20230808115913.1064831-2-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230808115913.1064831-2-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_pm: Remove pci_system_{init,
 cleanup}
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 05:29:12PM +0530, Anshuman Gupta wrote:
> From: Anshuamn Gupta <anshuman.gupta@intel.com>
> 
> igt core library has already initialized libpciaccess
> pci_systeam_init() and registered a exit handler for its

           ^ typo

> cleanup, remove these unnecessary calls from igt_pm lib.

maybe worth mention that this is true because we are calling
igt_device_get_pci_device() on the desired cases.


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Anshuamn Gupta <anshuman.gupta@intel.com>
> ---
>  lib/igt_pm.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 704acf7d1..d1d7be9a1 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1140,9 +1140,6 @@ igt_pm_setup_pci_card_power_attrs(struct pci_device *pci_dev, bool save_attrs, i
>  	ret = pci_device_get_bridge_buses(pci_dev, &primary, &secondary, &subordinate);
>  	igt_assert(!ret);
>  
> -	ret = pci_system_init();
> -	igt_assert(!ret);
> -
>  	match.domain = pci_dev->domain;
>  	match.bus = PCI_MATCH_ANY;
>  	match.dev = PCI_MATCH_ANY;
> @@ -1185,7 +1182,6 @@ void igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
>  		delay = igt_pm_get_autosuspend_delay(i915);
>  
>  	igt_pm_setup_pci_card_power_attrs(root, false, delay);
> -	pci_system_cleanup();
>  }
>  
>  /**
> @@ -1289,7 +1285,6 @@ void igt_pm_restore_pci_card_runtime_pm(void)
>  	}
>  
>  	memset(__pci_dev_pwrattr, 0, sizeof(__pci_dev_pwrattr));
> -	pci_system_cleanup();
>  }
>  
>  static void igt_pm_print_pci_dev_runtime_status(struct pci_device *pci_dev)
> -- 
> 2.25.1
> 
