Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 27 Jan 2023 13:39:39 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <Y9O3+wLrQNr/pyNf@platvala-desk.ger.corp.intel.com>
References: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
 <20230127111241.3624629-7-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230127111241.3624629-7-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] lib/igt_device_scan: Improve Intel
 discrete GPU selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 27, 2023 at 11:12:41AM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Now that DRM subsystem can contain PCI cards with the vendor set to Intel
> but they are not Intel GPUs, we need a better selection logic than looking
> at the vendor. Use the driver name instead.
> 
> Caveat that the driver key was on a blacklist so far, and although I can't
> imagine it can be slow to probe, this is something to double check.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_device_scan.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index ed128d24dd10..8b767eed202d 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -237,6 +237,7 @@ struct igt_device {
>  	char *vendor;
>  	char *device;
>  	char *pci_slot_name;
> +	char *driver;
>  	int gpu_index; /* For more than one GPU with same vendor and device. */
>  
>  	char *codename; /* For grouping by codename */
> @@ -440,7 +441,6 @@ static bool is_on_blacklist(const char *what)
>  				      "resource3", "resource4", "resource5",
>  				      "resource0_wc", "resource1_wc", "resource2_wc",
>  				      "resource3_wc", "resource4_wc", "resource5_wc",
> -				      "driver",
>  				      "uevent", NULL};
>  	const char *key;
>  	int i = 0;
> @@ -662,6 +662,8 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
>  		get_pci_vendor_device(idev, &vendor, &device);
>  		idev->codename = __pci_codename(vendor, device);
>  		idev->dev_type = __pci_devtype(vendor, device, idev->pci_slot_name);
> +		idev->driver = strdup_nullsafe(get_attr(idev, "driver"));
> +		igt_assert(idev->driver);
>  	}
>  
>  	return idev;
> @@ -776,7 +778,7 @@ static bool __find_first_i915_card(struct igt_device_card *card, bool discrete)
>  
>  	igt_list_for_each_entry(dev, &igt_devs.all, link) {
>  
> -		if (!is_pci_subsystem(dev) || !is_vendor_matched(dev, "intel"))
> +		if (!is_pci_subsystem(dev) || strcmp(dev->driver, "i915"))

Is this the time to prepare for that other driver as well?


-- 
Petri Latvala


>  			continue;
>  
>  		cmp = strncmp(dev->pci_slot_name, INTEGRATED_I915_GPU_PCI_ID,
> @@ -1023,6 +1025,7 @@ static void igt_device_free(struct igt_device *dev)
>  	free(dev->drm_render);
>  	free(dev->vendor);
>  	free(dev->device);
> +	free(dev->driver);
>  	free(dev->pci_slot_name);
>  	g_hash_table_destroy(dev->attrs_ht);
>  	g_hash_table_destroy(dev->props_ht);
> -- 
> 2.34.1
> 
