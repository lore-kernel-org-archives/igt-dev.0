Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD60114A429
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jul 2022 09:08:14 +0000 (UTC)
Date: Tue, 12 Jul 2022 11:08:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <Ys05+f0+1CdVSG1Q@zkempczy-mobl2>
References: <20220707065939.33453-1-zbigniew.kempczynski@intel.com>
 <20220707065939.33453-3-zbigniew.kempczynski@intel.com>
 <YswzEFU4GYlg/hby@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YswzEFU4GYlg/hby@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] lib/igt_device_scan: Introduce
 codename for platform selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 04:26:24PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2022-07-07 at 08:59:35 +0200, Zbigniew Kempczyński wrote:
> > Platform rare is defined by single pci device id. Adding platform group
> ---------- ^
> Maybe s/rare/rarely/ ? or maybe seldom ?
> 
> > selection will make device selection more convenient. Now instead using
> > 
> > pci:vendor=8086,device=0x1927
> > 
> > we may pass:
> > 
> > pci:vendor=8086,device=skylake
> 
> As we are at this, even better would be:
> vendor=intel,device=skylake
> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  lib/igt_device_scan.c | 89 +++++++++++++++++++++++++++++++++++++++----
> >  lib/igt_device_scan.h |  1 +
> >  2 files changed, 83 insertions(+), 7 deletions(-)
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index 83a488aa7c..afb6f07e18 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -85,7 +85,7 @@
> >   *
> >   * - pci: select device using PCI slot or vendor and device properties
> >   *   |[<!-- language="plain" -->
> > - *   pci:[vendor=%04x/name][,device=%04x][,card=%d] | [slot=%04x:%02x:%02x.%x]
> > + *   pci:[vendor=%04x/name][,device=%04x/codename][,card=%d] | [slot=%04x:%02x:%02x.%x]
> >   *   ]|
> >   *
> >   *   Filter allows device selection using vendor (hex or name), device id
> > @@ -117,6 +117,12 @@
> >   *
> >   *   It selects the second one.
> >   *
> > + *   We may use device codename instead pci device id:
> > + *
> > + *   |[<!-- language="plain" -->
> > + *   pci:vendor=8086,device=skylake
> > + *   ]|
> > + *
> >   *   Another possibility is to select device using a PCI slot:
> >   *
> >   *   |[<!-- language="plain" -->
> > @@ -131,7 +137,7 @@
> >   *
> >   * - sriov: select pf or vf
> >   *   |[<!-- language="plain" -->
> > - *   sriov:[vendor=%04x/name][,device=%04x][,card=%d][,pf=%d][,vf=%d]
> > + *   sriov:[vendor=%04x/name][,device=%04x/codename][,card=%d][,pf=%d][,vf=%d]
> >   *   ]|
> >   *
> >   *   Filter extends pci selector to allow pf/vf selection:
> > @@ -205,6 +211,9 @@ struct igt_device {
> >  	char *pci_slot_name;
> >  	int gpu_index; /* For more than one GPU with same vendor and device. */
> >  
> > +	/* For grouping by codename */
> 
> Please put this comment after var name, just like above at
> gpu_index.
> 
> > +	char *codename;
> > +
> >  	struct igt_list_head link;
> >  };
> >  
> > @@ -248,13 +257,30 @@ static char *devname_intel(uint16_t vendor, uint16_t device)
> >  	return s;
> >  }
> >  
> > +static char *codename_intel(uint16_t vendor, uint16_t device)
> > +{
> > +	const struct intel_device_info *info = intel_get_device_info(device);
> > +	char *codename = NULL;
> > +
> > +	if (info->codename) {
> > +		codename = strdup(info->codename);
> > +		igt_assert(codename);
> > +	}
> > +
> > +	if (!codename)
> > +		codename = devname_hex(vendor, device);
> > +
> > +	return codename;
> > +}
> > +
> >  static struct {
> >  	const char *name;
> >  	const char *vendor_id;
> >  	devname_fn devname;
> > +	devname_fn codename;
> >  } pci_vendor_mapping[] = {
> > -	{ "intel", "8086", devname_intel },
> > -	{ "amd", "1002", devname_hex },
> > +	{ "intel", "8086", devname_intel, codename_intel },
> > +	{ "amd", "1002", devname_hex, devname_hex },
> >  	{ NULL, },
> >  };
> >  
> > @@ -283,6 +309,20 @@ static devname_fn get_pci_vendor_device_fn(uint16_t vendor)
> >  	return devname_hex;
> >  }
> >  
> > +static devname_fn get_pci_vendor_device_codename_fn(uint16_t vendor)
> > +{
> > +	char vendorstr[5];
> > +
> > +	snprintf(vendorstr, sizeof(vendorstr), "%04x", vendor);
> > +
> > +	for (typeof(*pci_vendor_mapping) *vm = pci_vendor_mapping; vm->name; vm++) {
> > +		if (!strcasecmp(vendorstr, vm->vendor_id))
> > +			return vm->codename;
> > +	}
> > +
> > +	return devname_hex;
> > +}
> > +
> >  static void get_pci_vendor_device(const struct igt_device *dev,
> >  				  uint16_t *vendorp, uint16_t *devicep)
> >  {
> > @@ -305,6 +345,18 @@ static char *__pci_pretty_name(uint16_t vendor, uint16_t device, bool numeric)
> >  	return fn(vendor, device);
> >  }
> >  
> > +static char *__pci_codename(uint16_t vendor, uint16_t device, bool numeric)
> ---------------------------------------------------------------  ^
> imho you should drop this bool param here.
> 
> > +{
> > +	devname_fn fn;
> > +
> > +	if (!numeric)
> > +		fn = get_pci_vendor_device_codename_fn(vendor);
> 
> Use this unconditionally for getting fn.
> 
> > +	else
> > +		fn = devname_hex;
> > +
> > +	return fn(vendor, device);
> > +}
> > +
> >  /* Reading sysattr values can take time (even seconds),
> >   * we want to avoid reading such keys.
> >   */
> > @@ -514,8 +566,12 @@ static struct igt_device *igt_device_new_from_udev(struct udev_device *dev)
> >  	get_attrs(dev, idev);
> >  
> >  	if (is_pci_subsystem(idev)) {
> > +		uint16_t vendor, device;
> > +
> >  		set_vendor_device(idev);
> >  		set_pci_slot_name(idev);
> > +		get_pci_vendor_device(idev, &vendor, &device);
> > +		idev->codename = __pci_codename(vendor, device, false);
> --------------------------------------------------------------  ^
> This looks bad, imho you drop this param.
> 
> >  	}
> >  
> >  	return idev;
> > @@ -558,6 +614,19 @@ static bool is_vendor_matched(struct igt_device *dev, const char *vendor)
> >  	return !strcasecmp(dev->vendor, vendor_id);
> >  }
> >  
> > +static bool is_device_matched(struct igt_device *dev, const char *device)
> > +{
> > +	if (!dev->device || !device)
> > +		return false;
> > +
> > +	/* First we compare device id, like 1926 */
> > +	if (!strcasecmp(dev->device, device))
> > +		return true;
> > +
> > +	/* Try codename */
> > +	return !strcasecmp(dev->codename, device);
> > +}
> > +
> >  static char *safe_strncpy(char *dst, const char *src, int n)
> >  {
> >  	char *s;
> > @@ -824,6 +893,7 @@ static void scan_drm_devices(void)
> >  
> >  static void igt_device_free(struct igt_device *dev)
> >  {
> > +	free(dev->codename);
> >  	free(dev->devnode);
> >  	free(dev->subsystem);
> >  	free(dev->syspath);
> > @@ -935,6 +1005,7 @@ igt_devs_print_simple(struct igt_list_head *view,
> >  			if (is_pci_subsystem(dev)) {
> >  				_pr_simple("vendor", dev->vendor);
> >  				_pr_simple("device", dev->device);
> > +				_pr_simple("codename", dev->codename);
> >  			}
> >  		}
> >  		printf("\n");
> > @@ -1022,7 +1093,10 @@ igt_devs_print_user(struct igt_list_head *view,
> >  			char *devname;
> >  
> >  			get_pci_vendor_device(pci_dev, &vendor, &device);
> > -			devname = __pci_pretty_name(vendor, device, fmt->numeric);
> > +			if (fmt->codename)
> > +				devname = __pci_codename(vendor, device, fmt->numeric);
> 
> This mixing codename and fmt->numeric looks bad. Is it OK to use
> both -c option and numeric here ? so imho this should be just
> 				devname = __pci_codename(vendor, device);

Agree, I will fix this in next series.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> > +			else
> > +				devname = __pci_pretty_name(vendor, device, fmt->numeric);
> >  
> >  			__print_filter(filter, sizeof(filter), fmt, pci_dev,
> >  				       false);
> > @@ -1106,6 +1180,7 @@ igt_devs_print_detail(struct igt_list_head *view,
> >  		if (!is_drm_subsystem(dev)) {
> >  			_print_key_value("card device", dev->drm_card);
> >  			_print_key_value("render device", dev->drm_render);
> > +			_print_key_value("codename", dev->codename);
> >  		}
> >  
> >  		printf("\n[properties]\n");
> > @@ -1332,7 +1407,7 @@ static struct igt_list_head *filter_pci(const struct filter_class *fcls,
> >  			continue;
> >  
> >  		/* Skip if 'device' doesn't match */
> > -		if (filter->data.device && strcasecmp(filter->data.device, dev->device))
> > +		if (filter->data.device && !is_device_matched(dev, filter->data.device))
> >  			continue;
> >  
> >  		/* We get n-th card */
> > @@ -1412,7 +1487,7 @@ static struct igt_list_head *filter_sriov(const struct filter_class *fcls,
> >  			continue;
> >  
> >  		/* Skip if 'device' doesn't match */
> > -		if (filter->data.device && strcasecmp(filter->data.device, dev->device))
> > +		if (filter->data.device && !is_device_matched(dev, filter->data.device))
> >  			continue;
> >  
> >  		/* We get n-th card */
> > diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> > index 5f583a0666..e6b0f1b90a 100644
> > --- a/lib/igt_device_scan.h
> > +++ b/lib/igt_device_scan.h
> > @@ -50,6 +50,7 @@ struct igt_devices_print_format {
> >  	enum igt_devices_print_type   type;
> >  	enum igt_devices_print_option option;
> >  	bool numeric;
> > +	bool codename;
> >  };
> >  
> >  #define INTEGRATED_I915_GPU_PCI_ID "0000:00:02.0"
> > -- 
> > 2.34.1
> > 
