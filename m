Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4838B112DAF
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 08:22:08 +0000 (UTC)
Date: Fri, 29 Jul 2022 10:22:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YuOYq1z4GSqi8BQQ@kamilkon-desk1>
References: <20220728070024.21158-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728070024.21158-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_device_scan: Assert if there's
 empty PCI_SLOT_NAME
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-07-28 at 09:00:24 +0200, Zbigniew Kempczyński wrote:
> On one of our testing machines executed i915_pm_rpm@module-reload subtest
> catches SIGSEGV with following callstack:
> 
> Received signal SIGSEGV.
> Stack trace:

You could put here a few relevant lines, but it's not blocker.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> There's single suspicious code line in devtype_intel() which might trigger
> this behavior - it is strncmp(). But that means pci_slot variable would be
> null or point to some garbage. This variable is initialized before from
> uevent property so lets verify and assert if there's no PCI_SLOT_NAME
> passed from the kernel for pci device. Additionally dump all properties
> and attributes to get bigger picture what comes from the kernel to device
> scanning library.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  lib/igt_device_scan.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index aad7966764..d6fae0650c 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -558,6 +558,16 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
>  #define is_drm_subsystem(dev)  (strequal(get_prop_subsystem(dev), "drm"))
>  #define is_pci_subsystem(dev)  (strequal(get_prop_subsystem(dev), "pci"))
>  
> +static void print_ht(GHashTable *ht);
> +static void dump_props_and_attrs(const struct igt_device *dev)
> +{
> +	printf("\n[properties]\n");
> +	print_ht(dev->props_ht);
> +	printf("\n[attributes]\n");
> +	print_ht(dev->attrs_ht);
> +	printf("\n");
> +}
> +
>  /*
>   * Get PCI_SLOT_NAME property, it should be in format of
>   * xxxx:yy:zz.z
> @@ -565,9 +575,20 @@ static void get_attrs(struct udev_device *dev, struct igt_device *idev)
>  static void set_pci_slot_name(struct igt_device *dev)
>  {
>  	const char *pci_slot_name = get_prop(dev, "PCI_SLOT_NAME");
> +	int len;
> +
> +	if (!pci_slot_name) {
> +		dump_props_and_attrs(dev);
> +		igt_assert_f(pci_slot_name, "PCI_SLOT_NAME property == NULL\n");
> +	}
> +
> +	len = strlen(pci_slot_name);
> +	if (len != PCI_SLOT_NAME_SIZE) {
> +		dump_props_and_attrs(dev);
> +		igt_assert_f(len != PCI_SLOT_NAME_SIZE,
> +			     "PCI_SLOT_NAME length != %d [%s]\n", len, pci_slot_name);
> +	}
>  
> -	if (!pci_slot_name || (strlen(pci_slot_name) != PCI_SLOT_NAME_SIZE))
> -		return;
>  	dev->pci_slot_name = strdup(pci_slot_name);
>  }
>  
> @@ -1249,11 +1270,7 @@ igt_devs_print_detail(struct igt_list_head *view,
>  			_print_key_value("codename", dev->codename);
>  		}
>  
> -		printf("\n[properties]\n");
> -		print_ht(dev->props_ht);
> -		printf("\n[attributes]\n");
> -		print_ht(dev->attrs_ht);
> -		printf("\n");
> +		dump_props_and_attrs(dev);
>  	}
>  }
>  
> -- 
> 2.34.1
> 
