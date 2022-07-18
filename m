Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CE612A275
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jul 2022 06:46:41 +0000 (UTC)
Date: Mon, 18 Jul 2022 08:46:37 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <YtUBzS+wIh22DMls@zkempczy-mobl2>
References: <20220714041733.19044-1-zbigniew.kempczynski@intel.com>
 <20220714041733.19044-7-zbigniew.kempczynski@intel.com>
 <YtGbUQlWjXvKXslm@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YtGbUQlWjXvKXslm@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v3 6/6] lib/igt_device_scan: Simulate
 udev drm and pci device events
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

On Fri, Jul 15, 2022 at 06:52:33PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> 
> On 2022-07-14 at 06:17:33 +0200, Zbigniew Kempczyński wrote:
> > For all udev_*() calls used in device scan add its static counterparts.
> > Instead of transplanting real udev data structures (private ones) some
> > primitive replacement were added. Devices are added directly from code
> > - such implementation was a little bit faster than parsing some config
> > files (especially pci slot manipulation to provide some properties which
> > slightly differs).
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  lib/igt_device_scan.c          |   7 +
> >  lib/igt_device_scan_simulate.c | 450 +++++++++++++++++++++++++++++++++
> >  2 files changed, 457 insertions(+)
> >  create mode 100644 lib/igt_device_scan_simulate.c
> > 
> > diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> > index aad7966764..f4e7659e42 100644
> > --- a/lib/igt_device_scan.c
> > +++ b/lib/igt_device_scan.c
> > @@ -904,6 +904,13 @@ static void index_pci_devices(void)
> >   * Function sorts all found devices to keep same order of bus devices
> >   * for providing predictable search.
> >   */
> > +
> > +#ifdef SIMULATE_UDEV_DEVICES
> --------- ^
> > +
> > +#include "igt_device_scan_simulate.c"
> ---------------------------- ^
> 
> I am not convinced about name "simulate", because there is
> already use of this for HW simulation. May we use "test" here ?
> Or some other name ?

But this is true. I replace udev events to simulated ones. I wondered
to provide separate function which feeds igt_device list but this way
I wouldn't test production code.

> 
> > +
> > +#endif
> > +
> >  static void scan_drm_devices(void)
> >  {
> >  	struct udev *udev;
> > diff --git a/lib/igt_device_scan_simulate.c b/lib/igt_device_scan_simulate.c
> > new file mode 100644
> > index 0000000000..5108f55924
> > --- /dev/null
> > +++ b/lib/igt_device_scan_simulate.c
> > @@ -0,0 +1,450 @@
> > +/*
> > + * Example: Skylake
> > +1656514333.437262: --------------------
> > +1656514333.437263: SYSPATH: /sys/devices/pci0000:00/0000:00:02.0/drm/card0
> > +1656514333.437294: SUBSYSTEM: drm
> > +1656514333.437377: prop: CURRENT_TAGS, val: :seat:mutter-device-disable-kms-modifiers:master-of-seat:uaccess:
> > +1656514333.437378: prop: DEVLINKS, val: /dev/dri/by-path/pci-0000:00:02.0-card
> > +1656514333.437378: prop: DEVNAME, val: /dev/dri/card0
> > +1656514333.437379: prop: DEVPATH, val: /devices/pci0000:00/0000:00:02.0/drm/card0
> > +1656514333.437379: prop: DEVTYPE, val: drm_minor
> > +1656514333.437380: prop: ID_FOR_SEAT, val: drm-pci-0000_00_02_0
> > +1656514333.437380: prop: ID_PATH, val: pci-0000:00:02.0
> > +1656514333.437382: prop: ID_PATH_TAG, val: pci-0000_00_02_0
> > +1656514333.437383: prop: MAJOR, val: 226
> > +1656514333.437383: prop: MINOR, val: 0
> > +1656514333.437383: prop: SUBSYSTEM, val: drm
> > +1656514333.437384: prop: TAGS, val: :seat:mutter-device-disable-kms-modifiers:master-of-seat:uaccess:
> > +1656514333.437384: prop: USEC_INITIALIZED, val: 31377470
> > +1656514333.438273: attr: dev, val: 226:0
> > +1656406120.387751: attr: subsystem, val: drm
> > +
> > +1656514333.440217: --------------------
> > +1656514333.440217: parent: 0000:00:02.0
> > +1656514333.440223: subsystem: pci
> > +1656514333.440224: syspath: /sys/devices/pci0000:00/0000:00:02.0
> > +1656514333.440297: prop: DEVPATH, val: /devices/pci0000:00/0000:00:02.0
> > +1656514333.440298: prop: DRIVER, val: i915
> > +1656514333.440298: prop: ID_MODEL_FROM_DATABASE, val: Iris Graphics 540
> > +1656514333.440299: prop: ID_PCI_CLASS_FROM_DATABASE, val: Display controller
> > +1656514333.440299: prop: ID_PCI_INTERFACE_FROM_DATABASE, val: VGA controller
> > +1656514333.440300: prop: ID_PCI_SUBCLASS_FROM_DATABASE, val: VGA compatible controller
> > +1656514333.440300: prop: ID_VENDOR_FROM_DATABASE, val: Intel Corporation
> > +1656514333.440301: prop: MODALIAS, val: pci:v00008086d00001926sv00008086sd00002063bc03sc00i00
> > +1656514333.440302: prop: PCI_CLASS, val: 30000
> > +1656514333.440302: prop: PCI_ID, val: 8086:1926
> > +1656514333.440303: prop: PCI_SLOT_NAME, val: 0000:00:02.0
> > +1656514333.440303: prop: PCI_SUBSYS_ID, val: 8086:2063
> > +1656514333.440304: prop: SUBSYSTEM, val: pci
> > +1656514333.440304: prop: SWITCHEROO_CONTROL_PRODUCT_NAME, val: Iris(R) Graphics 540
> > +1656514333.440305: prop: SWITCHEROO_CONTROL_VENDOR_NAME, val: Intel(R)
> > +1656514333.440306: prop: USEC_INITIALIZED, val: 6111540
> > +1656514333.440692: attr: class, val: 0x030000
> > +1656514333.440750: attr: device, val: 0x1926
> > +1656514333.441116: attr: subsystem, val: pci
> > +1656514333.441130: attr: subsystem_device, val: 0x2063
> > +1656514333.441141: attr: subsystem_vendor, val: 0x8086
> > +1656514333.441162: attr: vendor, val: 0x8086
> > +
> > +1656514333.441271: --------------------
> > +1656514333.441272: SYSPATH: /sys/devices/pci0000:00/0000:00:02.0/drm/renderD128
> > +1656514333.441305: SUBSYSTEM: drm
> > +1656514333.441390: prop: CURRENT_TAGS, val: :seat:mutter-device-disable-kms-modifiers:uaccess:
> > +1656514333.441391: prop: DEVLINKS, val: /dev/dri/by-path/pci-0000:00:02.0-render
> > +1656514333.441391: prop: DEVNAME, val: /dev/dri/renderD128
> > +1656514333.441392: prop: DEVPATH, val: /devices/pci0000:00/0000:00:02.0/drm/renderD128
> > +1656514333.441392: prop: DEVTYPE, val: drm_minor
> > +1656514333.441393: prop: ID_FOR_SEAT, val: drm-pci-0000_00_02_0
> > +1656514333.441393: prop: ID_PATH, val: pci-0000:00:02.0
> > +1656514333.441395: prop: ID_PATH_TAG, val: pci-0000_00_02_0
> > +1656514333.441395: prop: MAJOR, val: 226
> > +1656514333.441396: prop: MINOR, val: 128
> > +1656514333.441396: prop: SUBSYSTEM, val: drm
> > +1656514333.441396: prop: TAGS, val: :seat:mutter-device-disable-kms-modifiers:uaccess:
> > +1656514333.441397: prop: USEC_INITIALIZED, val: 31377515
> > +1656514333.441525: attr: dev, val: 226:128
> > +1656514333.441657: attr: subsystem, val: drm
> > +*/
> > +
> > +enum entry_type {
> > +	TYPE_DEVICE,
> > +	TYPE_PROP,
> > +	TYPE_ATTR,
> > +};
> > +
> > +struct udev_list_entry {
> > +	enum entry_type entry_type;
> > +	int curr;
> > +} _entry_dev, _entry_prop, _entry_attr;
> > +
> > +struct keyval {
> > +	char key[NAME_MAX];
> > +	char val[NAME_MAX];
> > +};
> > +
> > +#define MAXDEVS 16
> > +#define MAXPROPS 16
> > +#define MAXATTRS 8
> > +struct udev_device {
> > +	struct udev_device *parent;
> > +	char syspath[NAME_MAX];
> > +	char devnode[NAME_MAX];
> > +	char subsystem[8];
> > +	struct keyval prop[MAXPROPS];
> > +	struct udev_list_entry *prop_head;
> > +	struct keyval attr[MAXATTRS];
> > +	struct udev_list_entry *attr_head;
> > +	int props;
> > +	int attrs;
> > +};
> > +
> > +struct udev {
> > +	struct udev_device *dev[MAXDEVS];
> > +} _udev;
> > +
> > +struct udev_enumerate {
> > +	struct udev *udev;
> > +} _udev_enumerate;
> > +
> > +static void print_udev_device(const struct udev_device *dev)
> > +{
> > +//#define DEBUG_SCAN_SIMULATE

Unfortunatelly // left in series sent.

> > +#ifdef DEBUG_SCAN_SIMULATE
> 
> Isn't this a little too redundand ? You already have this code
> included only when user defines name in other file, so maybe
> here just use igt_debug() and drop this ifdef/endif ?

My intention is to have this disabled on production code. Even with
SIMULATE_UDEV_DEVICES I want to have this disabled from default.

I won't insist to merge this patch. I use this to verify device scan
functions works I expect. This is far away from being perfect (I think
to provide devices template from files, not from the code) so I may
drop it. Code I want to merge was already reviewed so this one may be
send in the future with better shape. 

> 
> > +	int i;
> > +
> > +	printf("[%s]\n", dev->syspath);
> > +
> > +	printf("props:\n");
> > +	for (i = 0; i < dev->props; i++)
> > +		printf("   %s: %s\n", dev->prop[i].key, dev->prop[i].val);
> > +
> > +	printf("attrs:\n");
> > +	for (i = 0; i < dev->attrs; i++)
> > +		printf("   %s: %s\n", dev->attr[i].key, dev->attr[i].val);
> > +#endif
> > +}
> > +
> > +#define __ADD_PROP(_dev, _key, args...) do { \
> --------------------- ^
> You use some global vars with underscore, so maybe here use
> longer names without '_' ? For example prop_dev, prop_key or
> add_dev, add_key ? Or use double underscore '__' ?

I don't want to clash do double __ looks good for me. 

> 
> > +	struct keyval *kv; \
> > +	igt_assert(dev->props <= MAXPROPS); \
> ------------------ ^
> Here and below in second macro you should use _dev.

You're right. Thanks for spotting this.

> 
> > +	kv = &(dev)->prop[(dev)->props]; \
> 
> Same here.
> 
> > +	strncpy(kv->key, (_key), NAME_MAX); \
> > +	snprintf(kv->val, NAME_MAX, args); \
> > +	(dev)->props++; \
> 
> Same here.
> 
> > +	} while (0)
> > +
> > +#define __ADD_ATTR(_dev, _key, args...) do { \
> 
> Same note about names used in macro.
> 
> > +	struct keyval *kv; \
> > +	igt_assert(dev->attrs <= MAXATTRS); \
> 
> Same here.
> 
> > +	kv = &(dev)->attr[(dev)->attrs]; \
> 
> Same here.
> 
> > +	strncpy(kv->key, (_key), NAME_MAX); \
> > +	snprintf(kv->val, NAME_MAX, args); \
> > +	(dev)->attrs++; \
> 
> Same here.
> 
> > +	} while (0)
> > +
> > +static struct udev_device *
> > +create_pci_udev_device(struct udev *udev,
> > +		       const char *syspath, const char *bdf,
> > +		       uint16_t vendor, uint16_t device, uint16_t subsystem)
> > +{
> > +	struct udev_device *dev;
> > +	char bus[13];
> > +
> > +	igt_assert(strlen(bdf) == 12);
> > +
> > +	dev = calloc(1, sizeof(*dev));
> > +	igt_assert(dev);
> > +
> > +	dev->parent = dev;
> > +	snprintf(dev->syspath, NAME_MAX, "%s", syspath);
> > +	strncpy(dev->subsystem, "pci", 4);
> > +
> > +	/* avoid compiler warning when copying less than 12 */
> > +	strncpy(bus, bdf, 13);
> > +	bus[7] = '\0';
> > +
> > +	__ADD_PROP(dev, "DEVPATH", "/devices/pci%s/%s", bus, bdf);
> > +	__ADD_PROP(dev, "DRIVER", "i915");
> > +	__ADD_PROP(dev, "PCI_CLASS", "30000");
> > +	__ADD_PROP(dev, "PCI_ID", "%04x:%04x", vendor, device);
> > +	__ADD_PROP(dev, "PCI_SLOT_NAME", "%s", bdf);
> > +	__ADD_PROP(dev, "PCI_SUBSYS_ID", "%04x:%04x", vendor, subsystem);
> > +	__ADD_PROP(dev, "SUBSYSTEM", "pci");
> > +
> > +	__ADD_ATTR(dev, "class", "0x030000");
> > +	__ADD_ATTR(dev, "device", "0x%04x", device);
> > +	__ADD_ATTR(dev, "subsystem", "pci");
> > +	__ADD_ATTR(dev, "subsystem_device", "0x%04x", subsystem);
> > +	__ADD_ATTR(dev, "subsystem_vendor", "0x%04x", vendor);
> > +	__ADD_ATTR(dev, "vendor", "0x%04x", vendor);
> > +
> > +	return dev;
> > +}
> > +
> > +static struct udev_device *
> > +create_drm_udev_device(struct udev *udev, struct udev_device *parent,
> > +		       const char *syspath, const char *bdf, int card,
> > +		       int major, int minor)
> > +{
> > +	struct udev_device *dev;
> > +	const char *name = card < 128 ? "card" : "render";
> > +	const char *drmname = card < 128 ? "card" : "renderD";
> > +	char bus[13];
> > +
> > +	igt_assert(strlen(bdf) == 12);
> > +
> > +	dev = calloc(1, sizeof(*dev));
> > +	igt_assert(dev);
> > +
> > +	dev->parent = parent;
> > +	snprintf(dev->syspath, NAME_MAX, "%s", syspath);
> > +	strncpy(dev->subsystem, "drm", 4);
> > +	snprintf(dev->devnode, NAME_MAX, "/dev/dri/%s%d", drmname, card);
> > +
> > +	/* avoid compiler warning when copying less than 12 */
> > +	strncpy(bus, bdf, 13);
> > +	bus[7] = '\0';
> > +
> > +	__ADD_PROP(dev, "DEVLINKS", "/dev/dri/by-path/pci-%s-%s", bdf, name);
> > +	__ADD_PROP(dev, "DEVNAME", "/dev/dri/%s%d", drmname, card);
> > +	__ADD_PROP(dev, "DEVPATH", "/devices/pci%s/%s/drm/%s%d", bus, bdf,
> > +		   drmname, card);
> > +	__ADD_PROP(dev, "DEVTYPE", "drm_minor");
> > +	__ADD_PROP(dev, "ID_PATH", "pci-%s", bdf);
> > +	__ADD_PROP(dev, "MAJOR", "%d", major);
> > +	__ADD_PROP(dev, "MINOR", "%d", minor);
> > +	__ADD_PROP(dev, "SUBSYSTEM", "drm");
> > +
> > +	__ADD_ATTR(dev, "dev", "%d:%d", major, minor);
> > +	__ADD_ATTR(dev, "subsystem", "drm");
> > +
> > +	return dev;
> > +}
> > +
> > +static struct udev_device **add_intel_dev(struct udev *udev, struct udev_device **dev,
> > +					  const char *pci_slot, uint16_t pci_device)
> > +{
> > +	struct udev_device **parent;
> > +	char bd[13], path[NAME_MAX];
> > +	static int card;
> > +
> > +	strncpy(bd, pci_slot, 13);
> > +	bd[7] = 0;
> > +
> > +	parent = dev;
> > +
> > +	snprintf(path, NAME_MAX, "/sys/devices/pci%s/%s", bd, pci_slot);
> > +	*dev++ = create_pci_udev_device(udev, path, pci_slot,
> > +					0x8086, pci_device, 0x2063);
> > +
> > +	snprintf(path, NAME_MAX, "/sys/devices/pci%s/%s/drm/card%d",
> > +		 bd, pci_slot, card);
> > +	*dev++ = create_drm_udev_device(udev, *parent, path, pci_slot,
> > +					card, 226, card);
> > +
> > +	snprintf(path, NAME_MAX, "/sys/devices/pci%s/%s/drm/renderD%d",
> > +		 bd, pci_slot, card + 128);
> > +	*dev++ = create_drm_udev_device(udev, *parent, path, pci_slot,
> > +					card + 128, 226, card + 128);
> > +
> > +	card++;
> > +
> > +	return dev;
> > +}
> > +
> > +struct udev *udev_new(void)
> > +{
> > +	struct udev *udev = &_udev;
> > +	struct udev_device **dev = udev->dev;
> > +
> > +	memset(dev, 0, sizeof(_udev.dev));
> > +
> > +	dev = add_intel_dev(udev, dev, "0000:00:02.0", 0x1926); /* skl */
> > +	dev = add_intel_dev(udev, dev, "0000:01:00.0", 0x56a1); /* dg2 */
> > +	dev = add_intel_dev(udev, dev, "0000:02:02.1", 0x9a40); /* tgl */
> > +	dev = add_intel_dev(udev, dev, "0000:03:01.0", 0x56a0); /* dg2 */
> > +	dev = add_intel_dev(udev, dev, "0000:04:02.0", 0x56a2); /* dg2 */
> > +
> > +	dev = udev->dev;
> > +	while (*dev)
> > +		print_udev_device(*dev++);
> > +
> > +	return &_udev;
> > +}
> > +
> > +struct udev_enumerate *udev_enumerate_new(struct udev *udev)
> > +{
> > +	_udev_enumerate.udev = udev;
> > +
> > +	return &_udev_enumerate;
> > +}
> > +
> > +int udev_enumerate_add_match_subsystem(struct udev_enumerate *udev_enumerate,
> > +				       const char *subsystem)
> > +{
> > +	return 0;
> > +}
> > +
> > +int udev_enumerate_add_match_property(struct udev_enumerate *udev_enumerate,
> > +				      const char *property, const char *value)
> > +{
> > +	return 0;
> > +}
> > +
> > +int udev_enumerate_scan_devices(struct udev_enumerate *udev_enumerate)
> > +{
> > +	return 0;
> > +}
> > +
> > +struct udev_list_entry *
> > +udev_enumerate_get_list_entry(struct udev_enumerate *udev_enumerate)
> > +{
> > +
> 
> Remove empty line.

Ack, thanks for the review. I will fix and resend.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> > +	_entry_dev.entry_type = TYPE_DEVICE;
> > +	_entry_dev.curr = 0;
> > +
> > +	return &_entry_dev;
> > +}
> > +
> > +struct udev_list_entry *
> > +udev_list_entry_get_next(struct udev_list_entry *list_entry)
> > +{
> > +	int curr, currdev = _entry_dev.curr;
> > +
> > +	switch (list_entry->entry_type) {
> > +	case TYPE_DEVICE:
> > +		if (_udev.dev[++list_entry->curr])
> > +			return list_entry;
> > +		break;
> > +	case TYPE_PROP:
> > +		curr = ++list_entry->curr;
> > +		if (curr < _udev.dev[currdev]->props)
> > +			return list_entry;
> > +		break;
> > +	case TYPE_ATTR:
> > +		curr = ++list_entry->curr;
> > +		if (curr < _udev.dev[currdev]->attrs)
> > +			return list_entry;
> > +		break;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +const char *udev_list_entry_get_name(struct udev_list_entry *list_entry)
> > +{
> > +	int curr, currdev = _entry_dev.curr;
> > +
> > +	switch (list_entry->entry_type) {
> > +	case TYPE_DEVICE:
> > +		return _udev.dev[list_entry->curr]->syspath;
> > +	case TYPE_PROP:
> > +		curr = _entry_prop.curr;
> > +		return _udev.dev[currdev]->prop[curr].key;
> > +	case TYPE_ATTR:
> > +		curr = _entry_attr.curr;
> > +		return _udev.dev[currdev]->attr[curr].key;
> > +	}
> > +
> > +	return "UNKNOWN";
> > +}
> > +
> > +const char *udev_list_entry_get_value(struct udev_list_entry *list_entry)
> > +{
> > +	int curr, currdev = _entry_dev.curr;
> > +
> > +	switch (list_entry->entry_type) {
> > +	case TYPE_DEVICE:
> > +		return "";
> > +	case TYPE_PROP:
> > +		curr = _entry_prop.curr;
> > +		return _udev.dev[currdev]->prop[curr].val;
> > +	case TYPE_ATTR:
> > +		curr = _entry_attr.curr;
> > +		return _udev.dev[currdev]->attr[curr].val;
> > +	}
> > +
> > +	return "UNKNOWN";
> > +}
> > +
> > +struct udev_device *udev_device_new_from_syspath(struct udev *udev,
> > +						 const char *syspath)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < sizeof(udev->dev); i++) {
> > +		if (!udev->dev[i])
> > +			return NULL;
> > +
> > +		if (strcmp(udev->dev[i]->syspath, syspath) == 0)
> > +			return udev->dev[i];
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +const char *udev_device_get_subsystem(struct udev_device *udev_device)
> > +{
> > +	return udev_device->subsystem;
> > +}
> > +
> > +const char *udev_device_get_syspath(struct udev_device *udev_device)
> > +{
> > +	return udev_device->syspath;
> > +}
> > +
> > +const char *udev_device_get_devnode(struct udev_device *udev_device)
> > +{
> > +	if (udev_device->devnode[0] == '\0')
> > +		return NULL;
> > +
> > +	return udev_device->devnode;
> > +}
> > +
> > +struct udev_list_entry *
> > +udev_device_get_properties_list_entry(struct udev_device *udev_device)
> > +{
> > +	_entry_prop.entry_type = TYPE_PROP;
> > +	_entry_prop.curr = 0;
> > +
> > +	return &_entry_prop;
> > +}
> > +
> > +struct udev_list_entry *
> > +udev_device_get_sysattr_list_entry(struct udev_device *udev_device)
> > +{
> > +	_entry_attr.entry_type = TYPE_ATTR;
> > +	_entry_attr.curr = 0;
> > +
> > +	return &_entry_attr;
> > +}
> > +
> > +const char *
> > +udev_device_get_sysattr_value(struct udev_device *udev_device, const char *sysattr)
> > +{
> > +	for (int i = 0; i < udev_device->attrs; i++)
> > +		if (strcmp(udev_device->attr[i].key, sysattr) == 0)
> > +			return udev_device->attr[i].val;
> > +
> > +	return "UNKNOWN";
> > +}
> > +
> > +const char *udev_device_get_sysname(struct udev_device *udev_device)
> > +{
> > +	return udev_device->syspath;
> > +}
> > +
> > +struct udev_device *udev_device_get_parent(struct udev_device *udev_device)
> > +{
> > +	return udev_device->parent;
> > +}
> > +
> > +struct udev_enumerate *udev_enumerate_unref(struct udev_enumerate *udev_enumerate)
> > +{
> > +	return NULL;
> > +}
> > +
> > +struct udev_device *udev_device_unref(struct udev_device *udev_device)
> > +{
> > +	return NULL;
> > +}
> > -- 
> > 2.34.1
> > 
