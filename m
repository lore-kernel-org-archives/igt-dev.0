Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D5C10F135
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Aug 2022 10:21:45 +0000 (UTC)
Date: Mon, 29 Aug 2022 13:20:48 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YwyTANICvV87txh4@platvala-desk.ger.corp.intel.com>
References: <20220824043451.21272-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824043451.21272-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_device_scan: Retry when parent
 pci device lacks properties
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 06:34:51AM +0200, Zbigniew Kempczyński wrote:
> When driver is loaded or binded and device scanning is performed immediate
> after that we observed sometimes parent pci device lacks properties.
> Device selection is built on top of this so we need to solve this
> situation somehow.
> 
> Unfortunately reproduction of this bug is extremely hard and likely
> is located in libudev or libsystemd libraries. Situation complicates
> fact udev_device_get_parent() internally scans parent device once so
> consecutive calls returns stale (and maybe properties missing) parent
> device.
> 
> We know syspath of parent device so we can enforce scanning of such
> device calling udev_device_new_from_syspath() which returns freshly
> scanned device. To increase probability we get properly scanned device
> retry loop tries to do this several times.
> 
> Previous code which dumps properties, attributes and uevent was removed.
> We don't need it anymore as it was temporary code to get some picture
> what's wrong.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_device_scan.c | 93 +++++++++++++++++++------------------------
>  1 file changed, 41 insertions(+), 52 deletions(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index d61d79276c..eb6b45b876 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -241,6 +241,8 @@ static struct {
>  	bool devs_scanned;
>  } igt_devs;
>  
> +static void igt_device_free(struct igt_device *dev);
> +
>  typedef char *(*devname_fn)(uint16_t, uint16_t);
>  typedef enum dev_type (*devtype_fn)(uint16_t, uint16_t, const char *);
>  
> @@ -568,28 +570,6 @@ static void dump_props_and_attrs(const struct igt_device *dev)
>  	printf("\n");
>  }
>  
> -static void dump_uevent_file(struct igt_device *dev)
> -{
> -	char filename[FILENAME_MAX];
> -	const char *devpath = get_prop(dev, "DEVPATH");
> -	char *line = NULL;
> -	FILE *in;
> -	size_t n;
> -
> -	igt_assert_f(devpath, "DEVPATH property doesn't exist\n");
> -	snprintf(filename, FILENAME_MAX, "/sys%s/uevent", devpath);
> -
> -	in = fopen(filename, "r");
> -	igt_assert(in);
> -
> -	printf("[uevent: %s]\n", filename);
> -	while (getline(&line, &n, in) >= 0)
> -		printf("%s", line);
> -
> -	free(line);
> -	fclose(in);
> -}
> -
>  /*
>   * Get PCI_SLOT_NAME property, it should be in format of
>   * xxxx:yy:zz.z
> @@ -597,22 +577,9 @@ static void dump_uevent_file(struct igt_device *dev)
>  static bool set_pci_slot_name(struct igt_device *dev)
>  {
>  	const char *pci_slot_name = get_prop(dev, "PCI_SLOT_NAME");
> -	int len;
>  
> -	if (!pci_slot_name) {
> -		dump_props_and_attrs(dev);
> -		igt_warn("PCI_SLOT_NAME property == NULL\n");
> -		dump_uevent_file(dev);
> +	if (!pci_slot_name || strlen(pci_slot_name) != PCI_SLOT_NAME_SIZE)
>  		return false;
> -	}
> -
> -	len = strlen(pci_slot_name);
> -	if (len != PCI_SLOT_NAME_SIZE) {
> -		dump_props_and_attrs(dev);
> -		igt_warn("PCI_SLOT_NAME length != %d [%s]\n", len, pci_slot_name);
> -		dump_uevent_file(dev);
> -		return false;
> -	}
>  
>  	dev->pci_slot_name = strdup(pci_slot_name);
>  	return true;
> @@ -623,14 +590,17 @@ static bool set_pci_slot_name(struct igt_device *dev)
>   * xxxx to dev->vendor and yyyy to dev->device for
>   * faster access.
>   */
> -static void set_vendor_device(struct igt_device *dev)
> +static bool set_vendor_device(struct igt_device *dev)
>  {
>  	const char *pci_id = get_prop(dev, "PCI_ID");
>  
>  	if (!pci_id || strlen(pci_id) != 9)
> -		return;
> +		return false;
> +
>  	dev->vendor = strndup(pci_id, 4);
>  	dev->device = strndup(pci_id + 5, 4);
> +
> +	return true;
>  }
>  
>  /* Initialize lists for keeping scanned devices */
> @@ -674,16 +644,9 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
>  	if (is_pci_subsystem(idev)) {
>  		uint16_t vendor, device;
>  
> -		set_vendor_device(idev);
> -
> -		/*
> -		 * Very rare we observe there's no PCI_SLOT_NAME property.
> -		 * We depend on it so retry acquiring properties from udev.
> -		 */
> -		if (!set_pci_slot_name(idev)) {
> -			g_hash_table_remove_all(idev->props_ht);
> -			get_props(dev, idev);
> -			igt_assert(set_pci_slot_name(idev));
> +		if (!set_vendor_device(idev) || !set_pci_slot_name(idev)) {
> +			igt_device_free(idev);
> +			return NULL;
>  		}
>  		get_pci_vendor_device(idev, &vendor, &device);
>  		idev->codename = __pci_codename(vendor, device);
> @@ -847,17 +810,24 @@ static struct igt_device *igt_device_from_syspath(const char *syspath)
>  	return NULL;
>  }
>  
> +#define RETRIES_GET_PARENT 5
>  /* For each drm igt_device add or update its parent igt_device to the array.
>   * As card/render drm devices mostly have same parent (vkms is an exception)
>   * link to it and update corresponding drm_card / drm_render fields.
>   */
> -static void update_or_add_parent(struct udev_device *dev,
> +static void update_or_add_parent(struct udev *udev,
> +				 struct udev_device *dev,
>  				 struct igt_device *idev)
>  {
>  	struct udev_device *parent_dev;
>  	struct igt_device *parent_idev;
>  	const char *subsystem, *syspath, *devname;
> +	int retries = RETRIES_GET_PARENT;
>  
> +	/*
> +	 * Get parent for drm node. It caches parent in udev device
> +	 * and will be destroyed along with the node.
> +	 */
>  	parent_dev = udev_device_get_parent(dev);
>  	igt_assert(parent_dev);
>  
> @@ -865,10 +835,29 @@ static void update_or_add_parent(struct udev_device *dev,
>  	syspath = udev_device_get_syspath(parent_dev);
>  
>  	parent_idev = igt_device_find(subsystem, syspath);
> -	if (!parent_idev) {
> +	while (!parent_idev && retries--) {
> +		/*
> +		 * Don't care about previous parent_dev, it is tracked
> +		 * by the child node. There's very rare race when driver module
> +		 * is loaded or binded - in this moment getting parent device
> +		 * may finish with incomplete properties. Unfortunately even
> +		 * if we notice this (missing PCI_ID or PCI_SLOT_NAME)
> +		 * consecutive calling udev_device_get_parent() will return
> +		 * stale (cached parent) device. We don't want this so
> +		 * only udev_device_new*() will scan sys directory and
> +		 * return fresh udev device.
> +		 */
> +		parent_dev = udev_device_new_from_syspath(udev, syspath);
>  		parent_idev = igt_device_new_from_udev(parent_dev);
> -		igt_list_add_tail(&parent_idev->link, &igt_devs.all);
> +		udev_device_unref(parent_dev);
> +
> +		if (parent_idev)
> +			igt_list_add_tail(&parent_idev->link, &igt_devs.all);
> +		else
> +			usleep(100000); /* arbitrary, 100ms should be enough */
>  	}
> +	igt_assert(parent_idev);
> +
>  	devname = udev_device_get_devnode(dev);
>  	if (devname != NULL && strstr(devname, "/dev/dri/card"))
>  		parent_idev->drm_card = strdup(devname);
> @@ -997,7 +986,7 @@ static void scan_drm_devices(void)
>  		udev_dev = udev_device_new_from_syspath(udev, path);
>  		idev = igt_device_new_from_udev(udev_dev);
>  		igt_list_add_tail(&idev->link, &igt_devs.all);
> -		update_or_add_parent(udev_dev, idev);
> +		update_or_add_parent(udev, udev_dev, idev);
>  
>  		udev_device_unref(udev_dev);
>  	}
> -- 
> 2.34.1
> 
