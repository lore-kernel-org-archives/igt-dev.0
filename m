Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98FA6E328
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jul 2019 08:20:42 +0000 (UTC)
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Date: Fri, 12 Jul 2019 08:20:37 +0000
Message-ID: <61fe74ca7de94da06a3a97012c2e008064377ffe.camel@intel.com>
References: <20190711103057.25693-1-zbigniew.kempczynski@intel.com>
 <20190711103057.25693-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20190711103057.25693-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 1/1] Introduce new method of device
 selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1699836494=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1699836494==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-qXGorOFC9w0Wct05WTtt"

--=-qXGorOFC9w0Wct05WTtt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-07-11 at 12:30 +0200, Zbigniew Kempczy=C5=84ski wrote:
> Change adds device selection based on implemented filters.
> Different filters can be added to address different device
> selection possibilities.
>=20
> New device selection uses --device filter or IGT_DEVICE environent
> variable. Selection of many devices can be done by using --device
> argument multiple times. As IGT_DEVICE enviroment can be set
> once ';' is recognized as filter separator.
>=20
> Tool 'lsgpu' which uses device scanning feature was added.

Hi,

Would you mind splitting the patch into several commits? It is quite
hard to review this as a whole. For example:
1. Device selection
2. lsgpu
3. Documentation
4. ...

There are some comments below.

>=20
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>  docs/multi-device-selection.txt |  115 +++
>  lib/Makefile.sources            |    2 +
>  lib/drmtest.c                   |  151 +++-
>  lib/drmtest.h                   |    9 +
>  lib/igt_core.c                  |   13 +
>  lib/igt_device_scan.c           | 1425
> +++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h           |   72 ++
>  lib/meson.build                 |    1 +
>  tools/Makefile.sources          |    1 +
>  tools/lsgpu.c                   |  285 +++++++
>  tools/meson.build               |    1 +
>  11 files changed, 2073 insertions(+), 2 deletions(-)
>  create mode 100644 docs/multi-device-selection.txt
>  create mode 100644 lib/igt_device_scan.c
>  create mode 100644 lib/igt_device_scan.h
>  create mode 100644 tools/lsgpu.c
>=20
> diff --git a/docs/multi-device-selection.txt b/docs/multi-device-
> selection.txt
> new file mode 100644
> index 00000000..5b13cfcc
> --- /dev/null
> +++ b/docs/multi-device-selection.txt
> @@ -0,0 +1,115 @@
> +Multi-device scanning and selection
> +-----------------------------------
> +
> +1. Scanning
> +
> +Device selection is build around scanning buses using udev (PCI and
> platform),
> +gathering information about matching devices and using filters on
> discovered
> +data.
> +
> +PCI scanning is easy and gives all information regarding devices
> (module doesn't
> +need to be loaded). Problems occurs when platform devices are taken
> into
> +account. Some of them have appropriate entries in device tree (like
> +Raspberry Pi vc4 driver), so displaying them without loaded module
> is possible.
> +Such devices expose OF_COMPATIBLE_X properties which are matched
> against
> +appropriate driver. Some devices are registered inside platform tree
> at driver
> +loading time so discovering such devices is not possible unless
> driver is loaded.
> +
> +
> +2. Filtering
> +
> +After scanning all gathered information are stored in devices array.
> Filtering
> +means creating a view that matches filter on devices array. Filters
> defined
> +on non-discoverable devices loads module (if not already loaded) and
> execute
> +device discovery again.
> +
> +Using 'lsgpu' tool we can get list of defined filter types ('-l'
> switch):
> +...
> +pci       pci:[vendor=3D%04x/name][,device=3D%04x][,card=3D%d]
> +	  vendor is hex number or name
> +...
> +
> +pci is filter name, it calls filter on devices array to select only
> PCI
> +devices. For example:
> +
> +pci:vendor=3D8086
> +find first pci card on the bus with 8086 PCI device ID
> +
> +pci:vendor=3Dintel
> +same as above but uses vendor name (see lsgpu -v)
> +
> +pci:vendor=3D8086,card=3D0
> +same as above, card=3D0 is default
> +
> +pci:vendor=3Dintel,device=3D1234,card=3D1
> +finds second Intel card which device ID is 0x1234
> +
> +
> +3. lsgpu
> +
> +To play with devices 'lsgpu' tool was written. It is mostly wrapper
> to igt
> +devices scan code (igt_device_scan.c).
> +
> +If run without arguments it displays all recognized cards.
> +Usage examples:
> +
> +# lsgpu -ra
> +displays devices in 'simple' mode with only few properties and
> attributes
> +
> +# lsgpu -d
> +displays devices in 'detail' mode, with all properties and
> attributes. Some
> +attributes are skipped because acquiring value can take even seconds
> (there's
> +special blacklist hash table inside the code)
> +
> +# lsgpu -v
> +displays recognized vendors
> +
> +# lsgpu -l
> +displays defined filter types
> +
> +# lsgpu -m 'vgem:card=3D0'
> +matches first vgem card at index 0. I
> +
> +
> +# lsgpu --device 'pci:card=3D0;vgem:card=3D0;vkms:card=3D0'
> +and
> +# lsgpu --device 'pci:card=3D0' --device 'vgem:card=3D0' --device
> 'vkms:card=3D0'
> +and
> +# export IGT_DEVICE=3D'pci:card=3D0;vgem:card=3D0;vkms:card=3D0'
> +# lsgpu
> +matches multiple cards. IGT_DEVICE uses ';' separated filter syntax,
> it is also
> +permitted in --device (function splits argument against ';').
> +
> +
> +4. Compatibility with current device open API
> +
> +Practically all IGT tests use:
> +int __drm_open_driver(int chipset);
> +int __drm_open_driver_render(int chipset);
> +
> +Above functions were extended to use --device / env IGT_DEVICE
> filters
> +(if given during IGT test run). If more than single device were
> passed
> +first matching filter against chipset is selected. This allows test
> like
> +prime_vgem to work, ex:
> +
> +# ./prime_vgem --r basic-read --device 'pci:card=3D0' --device
> 'vgem:card=3D0'
> +# ./prime_vgem --r basic-read --device 'vgem:card=3D0' --device
> 'pci:card=3D0'
> +
> +
> +5. New device selection API
> +
> +Following prototypes define new API:
> +
> +/* Multi device API */
> +int __drm_open_card_with_nth_filter(int num, int chipset);
> +int __drm_open_render_with_nth_filter(int num, int chipset);
> +
> +When test require DRIVER_INTEL it has to be sure that user didn't
> passed
> +another device (vc4 for example). So if user passed --device
> vc4:card=3D0
> +this open will fail.
> +
> +struct igt_device_card;
> +int __drm_open_card(struct igt_device_card *card);
> +int __drm_open_render(struct igt_device_card *card);
> +
> +These functions allows to open device regardless chip requirement.
> diff --git a/lib/Makefile.sources b/lib/Makefile.sources
> index e16de86e..c383a817 100644
> --- a/lib/Makefile.sources
> +++ b/lib/Makefile.sources
> @@ -25,6 +25,8 @@ lib_source_list =3D	 	\
>  	igt_debugfs.h		\
>  	igt_device.c		\
>  	igt_device.h		\
> +	igt_device_scan.c	\
> +	igt_device_scan.h	\
>  	igt_aux.c		\
>  	igt_aux.h		\
>  	igt_color_encoding.c	\
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 25f20353..5a9cadc1 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -55,6 +55,7 @@
>  #include "igt_gt.h"
>  #include "igt_kmod.h"
>  #include "igt_sysfs.h"
> +#include "igt_device_scan.h"
>  #include "version.h"
>  #include "config.h"
>  #include "intel_reg.h"
> @@ -296,25 +297,171 @@ static int __open_driver(const char *base, int
> offset, unsigned int chipset)
>  	return __search_and_open(base, offset, chipset);
>  }
> =20
> +static int __open_driver_exact(const char *name, unsigned int
> chipset)
> +{
> +	static pthread_mutex_t mutex =3D PTHREAD_MUTEX_INITIALIZER;
> +	int fd;
> +
> +	fd =3D open_device(name, chipset);
> +	if (fd !=3D -1)
> +		return fd;
> +
> +	pthread_mutex_lock(&mutex);
> +	for (const struct module *m =3D modules; m->module; m++) {
> +		if (chipset & m->bit) {
> +			if (m->modprobe)
> +				m->modprobe(m->module);
> +			else
> +				modprobe(m->module);
> +		}
> +	}
> +	pthread_mutex_unlock(&mutex);
> +
> +	return open_device(name, chipset);
> +}
> +
> +/**
> + * __find_card_with_chipset
> + * @chipset: chipset for compare with card match
> + * @card: pointer where card information will be stored
> + *
> + * For compatibility mode when multiple --device argument were
> passed
> + * this function tries to be smart enough to handle tests which
> opens
> + * more than single device. It iterates over filter list and
> + * compares chipset to card chipset for filter matched.
> + *
> + * Returns:
> + * True if card according to filters added and chipset was found,
> + * false othwerwise.
> + */
> +static bool __find_card_with_chipset(int chipset, struct
> igt_device_card *card)
> +{
> +	int i, n =3D igt_device_filter_count();
> +	const char *filter;
> +	bool match;
> +
> +	for (i =3D 0; i < n; i++) {
> +		filter =3D igt_device_filter_get(i);
> +		match =3D igt_device_card_match(filter, card);
> +		if (match && (card->chipset =3D=3D chipset || chipset =3D=3D
> DRIVER_ANY))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * __drm_open_driver:
>   * @chipset: OR'd flags for each chipset to search, eg.
> #DRIVER_INTEL
>   *
> - * Open the first DRM device we can find, searching up to 16 device
> nodes
> + * Function opens device with following order:
> + * 1. when --device arguments are present device scanning will be
> executed,
> + * then matching considers all device which matches filter argument
> will be selected.
> + * 2. compatibility mode - open the first DRM device we can find,
> + * searching up to 16 device nodes.
>   *
>   * Returns:
>   * An open DRM fd or -1 on error
>   */
>  int __drm_open_driver(int chipset)
>  {
> +	int n =3D igt_device_filter_count();
> +
> +	if (n) {
> +		bool found;
> +		struct igt_device_card card;
> +
> +		found =3D __find_card_with_chipset(chipset, &card);
> +		if (!found || !strlen(card.card))
> +			return -1;
> +
> +		return __open_driver_exact(card.card, chipset);
> +	}
> +
>  	return __open_driver("/dev/dri/card", 0, chipset);
>  }
> =20
> -static int __drm_open_driver_render(int chipset)
> +int __drm_open_driver_render(int chipset)
>  {
> +	int n =3D igt_device_filter_count();
> +
> +	if (n) {
> +		bool found;
> +		struct igt_device_card card;
> +
> +		found =3D __find_card_with_chipset(chipset, &card);
> +		if (!found || !strlen(card.render))
> +			return -1;
> +
> +		return __open_driver_exact(card.render, chipset);
> +	}
> +
>  	return __open_driver("/dev/dri/renderD", 128, chipset);
>  }
> =20
> +static int __drm_open_with_nth_filter(int num, int chipset, bool
> open_render)
> +{
> +	struct igt_device_card card;
> +	const char *filter, *devname;
> +	bool match;
> +	int n =3D igt_device_filter_count();
> +
> +	if (!n || num < 0 || num >=3D n) {
> +		igt_warn("No device filter num =3D=3D %d passed\n", num);
> +		return -1;
> +	}
> +
> +	filter =3D igt_device_filter_get(num);
> +	match =3D igt_device_card_match(filter, &card);
> +	if (!match) {
> +		igt_warn("No device match filter: %s\n", filter);
> +		return -1;
> +	}
> +
> +	if (chipset !=3D card.chipset) {
> +		igt_warn("Filtered device doesn't match chipset (%d !=3D
> %d)\n",
> +			 chipset, card.chipset);
> +		return -1;
> +	}
> +	if (!strlen(card.card))
> +		return -1;
> +
> +	devname =3D open_render ? card.render : card.card;
> +	if (!strlen(devname)) {
> +		igt_warn("No %s node matching filter: %s\n",
> +			 open_render ? "render" : "card", filter);
> +		return -1;
> +	}
> +	return __open_driver_exact(devname, card.chipset);
> +}
> +
> +int __drm_open_card_with_nth_filter(int num, int chipset)
> +{
> +	return __drm_open_with_nth_filter(num, chipset, false);
> +}
> +
> +int __drm_open_render_with_nth_filter(int num, int chipset)
> +{
> +	return __drm_open_with_nth_filter(num, chipset, true);
> +}
> +
> +int __drm_open_card(struct igt_device_card *card)
> +{
> +	if (!card || !strlen(card->card))
> +		return -1;
> +
> +	return __open_driver_exact(card->card, card->chipset);
> +}
> +
> +int __drm_open_render(struct igt_device_card *card)
> +{
> +	if (!card || !strlen(card->render))
> +		return -1;
> +
> +	return __open_driver_exact(card->render, card->chipset);
> +}
> +
> +
>  static int at_exit_drm_fd =3D -1;
>  static int at_exit_drm_render_fd =3D -1;
> =20
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 6c4c3899..8f5888a9 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -45,6 +45,7 @@
>  #define DRIVER_AMDGPU	(1 << 4)
>  #define DRIVER_V3D	(1 << 5)
>  #define DRIVER_PANFROST	(1 << 6)
> +
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
>   * with vgem as well as a supported driver, you can end up with a
> @@ -76,6 +77,14 @@ int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
>  int __drm_open_driver(int chipset);
> +int __drm_open_driver_render(int chipset);
> +
> +/* Multi device API */
> +int __drm_open_card_with_nth_filter(int num, int chipset);
> +int __drm_open_render_with_nth_filter(int num, int chipset);
> +struct igt_device_card;
> +int __drm_open_card(struct igt_device_card *card);
> +int __drm_open_render(struct igt_device_card *card);
> =20
>  void gem_quiescent_gpu(int fd);
> =20
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 1cbb09f9..9b851175 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -71,6 +71,7 @@
>  #include "igt_sysrq.h"
>  #include "igt_rc.h"
>  #include "igt_list.h"
> +#include "igt_device_scan.h"
> =20
>  #define UNW_LOCAL_ONLY
>  #include <libunwind.h>
> @@ -304,6 +305,7 @@ enum {
>  	OPT_DEBUG,
>  	OPT_INTERACTIVE_DEBUG,
>  	OPT_SKIP_CRC,
> +	OPT_DEVICE,
>  	OPT_HELP =3D 'h'
>  };
> =20
> @@ -624,6 +626,7 @@ static void print_usage(const char *help_str,
> bool output_on_stderr)
>  		   "  --skip-crc-compare\n"
>  		   "  --help-description\n"
>  		   "  --describe\n"
> +		   "  --device filter\n"
>  		   "  --help|-h\n");
>  	if (help_str)
>  		fprintf(f, "%s\n", help_str);
> @@ -725,6 +728,11 @@ static void common_init_env(void)
>  	if (env) {
>  		__set_forced_driver(env);
>  	}
> +
> +	env =3D getenv("IGT_DEVICE");
> +	if (env) {
> +		igt_device_filter_add(env);
> +	}
>  }
> =20
>  static int common_init(int *argc, char **argv,
> @@ -743,6 +751,7 @@ static int common_init(int *argc, char **argv,
>  		{"debug",             optional_argument, NULL,
> OPT_DEBUG},
>  		{"interactive-debug", optional_argument, NULL,
> OPT_INTERACTIVE_DEBUG},
>  		{"skip-crc-compare",  no_argument,       NULL,
> OPT_SKIP_CRC},
> +		{"device",            required_argument, NULL,
> OPT_DEVICE},
>  		{"help",              no_argument,       NULL,
> OPT_HELP},
>  		{0, 0, 0, 0}
>  	};
> @@ -865,6 +874,10 @@ static int common_init(int *argc, char **argv,
>  		case OPT_SKIP_CRC:
>  			igt_skip_crc_compare =3D true;
>  			goto out;
> +		case OPT_DEVICE:
> +			assert(optarg);
> +			igt_device_filter_add(optarg);
> +			break;
>  		case OPT_HELP:
>  			print_usage(help_str, false);
>  			ret =3D -1;
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> new file mode 100644
> index 00000000..6cf0aea6
> --- /dev/null
> +++ b/lib/igt_device_scan.c
> @@ -0,0 +1,1425 @@
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice (including
> the next
> + * paragraph) shall be included in all copies or substantial
> portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +#include "igt_device.h"
> +#include "igt_device_scan.h"
> +#include <glib.h>
> +#include <libudev.h>
> +#include <linux/limits.h>
> +#include <sys/stat.h>
> +
> +//#define DEBUG_DEVICE_SCAN
> +#ifdef DEBUG_DEVICE_SCAN
> +#define DBG(...) \
> +{ \
> +	struct timeval tm; \
> +	gettimeofday(&tm, NULL); \
> +	printf("%10ld.%03ld: ", tm.tv_sec, tm.tv_usec); \
> +	printf(__VA_ARGS__); \
> +	}
> +
> +#else
> +#define DBG(...) {}
> +#endif
> +
> +#define IGT_BUS_PCI_DRIVERS_DIR "/sys/bus/pci/drivers"
> +#define IGT_DRM_PATH "/dev/dri"
> +
> +/* Scanning PCI is simple and well defined. Platform devices
> + * are listed in device tree but until driver is really loaded
> + * we only 'expect' their existence.
> + *
> + * From this reason platform scanning was separated to two
> + * distinct scan types - non-discoverable and discoverable.
> + *
> + * 1. Non-discoverable scan type checks modalias attribute.
> + * Such devices will occur within platform subsystem only
> + * after driver is loaded. Example are 'platform:vgem'
> + * 'platform:vkms' and 'platform:exynos'.
> + *
> + * 2. Discoverable scan type checks OF_COMPATIBLE_0 property.
> + * This simple check should be enough to display platform
> + * gpu defined in device tree even if driver wasn't already
> + * loaded.
> + */
> +enum igt_devices_scan_type {
> +	IGT_SCAN_PCI                       =3D 1,
> +	IGT_SCAN_PLATFORM_NON_DISCOVERABLE =3D 2,
> +	IGT_SCAN_PLATFORM_DISCOVERABLE     =3D 3,
> +};
> +
> +static GHashTable *blacklist_keys_ht;      //sysattrs we don't want
> to read
> +static GHashTable *gpu_pci_class_ht;       //gpu pci classes we know
> +static GHashTable *gpu_vendor_ht;          //search id ->
> vendor_spec mapping
> +static GHashTable *filter_definition_ht;   //supported filters
> (pci=3D..., etc.)

Are you sure we need hashtables for all this stuff? Mappings with 5-20
records should work with linear search well enough...

> +
> +/* Generic name->value struct, used to fill hash tables */
> +struct name_value {
> +	const char *name;
> +	gpointer *value;
> +};
> +
> +/* Vendor specific data */
> +struct vendor_spec {
> +	enum igt_device_type dev_type;
> +	const char *vendor;
> +	const char *modname;
> +	const char *modopts;
> +	const char *match_driver; //reported driver name not always
> equal module name
> +	int chipset;
> +};
> +
> +/* Single igt_device found in PCI / platform subsystems */
> +struct igt_device {
> +	char *pretty_name;
> +	struct vendor_spec *vs;
> +	GHashTable *props_ht;
> +	GHashTable *attrs_ht;
> +	char *syspath;
> +	char *drvpath;
> +	char *drm_card_path;
> +	char *drm_render_path;
> +	char *vendor;
> +	char *device;
> +	enum igt_device_type dev_type;
> +};
> +
> +/* Scanned devices struct */
> +struct igt_devices {
> +	GPtrArray *devs;		//all gpu devices array
> +	GPtrArray *view;		//filtered view
> +	bool devs_scanned;
> +};
> +
> +/* Scanned devices holder */
> +static struct igt_devices igt_devs;
> +
> +/* PCI device classes we take into account during scan.
> + * Attribute PCI_CLASS is compared with key beneath. */
> +struct name_value gpu_pci_class_list[] =3D {
> +	{ "30000", (gpointer) "VGA compatibile controller" },
> +	{ "30100", (gpointer) "XGA compatibile controller" },
> +	{ "30200", (gpointer) "3D controller" },
> +	{ "38000", (gpointer) "Display controller" },
> +	{ NULL, },
> +};
> +
> +static struct vendor_spec v_intel  =3D { .dev_type =3D DEV_PCI,
> +				       .vendor =3D "Intel",
> +				       .modname =3D "i915",
> +				       .chipset =3D DRIVER_INTEL
> +				     };
> +static struct vendor_spec v_amd    =3D { .dev_type =3D DEV_PCI,
> +				       .vendor =3D "AMD",
> +				       .modname =3D "amdgpu",
> +				       .chipset =3D DRIVER_AMDGPU
> +				     };
> +static struct vendor_spec v_nvidia  =3D { .dev_type =3D DEV_PCI,
> +					.vendor =3D "NVIDIA",
> +					.modname =3D "nvidia",
> +					.chipset =3D DRIVER_ANY
> +				      };
> +static struct vendor_spec v_vgem    =3D { .dev_type =3D
> DEV_PLATFORM_NON_DISCOVERABLE,
> +					.vendor =3D "Virtual-GEM",
> +					.modname =3D "vgem",
> +					.chipset =3D DRIVER_VGEM
> +				      };
> +static struct vendor_spec v_vkms   =3D { .dev_type =3D
> DEV_PLATFORM_NON_DISCOVERABLE,
> +				       .vendor =3D "Virtual-KMS",
> +				       .modname =3D "vkms",
> +				       .chipset =3D DRIVER_ANY
> +				     };
> +static struct vendor_spec v_exynos  =3D { .dev_type =3D
> DEV_PLATFORM_NON_DISCOVERABLE,
> +					.vendor =3D "Samsung",
> +					.modname =3D "exynosdrm",
> +					.match_driver =3D "exynos-drm",
> +					.chipset =3D DRIVER_ANY
> +				      };
> +static struct vendor_spec v_vc4    =3D { .dev_type =3D
> DEV_PLATFORM_DISCOVERABLE,
> +				       .vendor =3D "Broadcom",
> +				       .modname =3D "vc4",
> +				       .match_driver =3D "vc4-drm",
> +				       .chipset =3D DRIVER_VC4
> +				     };
> +
> +/* Mapping vendor id =3D> vendor_spec should be unique (vendor
> matching
> + * is written around this).
> + *
> + * Keys must be defined as follows:
> + * PCI devices: PCI_SLOT_ID,
> + * Non-discoverable platform devices: MODALIAS,
> + * Discoverable platform devices: OF_COMPATIBLE_0.
> +*/
> +struct name_value gpu_vendor_list[] =3D {
> +	{ "8086",                (gpointer) &v_intel },
> +	{ "1002",                (gpointer) &v_amd },
> +	{ "10DE",                (gpointer) &v_nvidia },
> +	{ "platform:vgem",       (gpointer) &v_vgem },
> +	{ "platform:vkms",       (gpointer) &v_vkms },
> +	{ "platform:exynos-drm", (gpointer) &v_exynos },
> +	{ "brcm,bcm2835-vc4",    (gpointer) &v_vc4 },
> +	{ NULL, },
> +};
> +
> +/* Generic hash table fill function, requires name / value ptrs
> array */
> +static void fill_ht(GHashTable **ht, struct name_value *data)
> +{
> +	if (*ht)
> +		return;
> +
> +	*ht =3D g_hash_table_new(g_str_hash, g_str_equal);
> +	igt_assert(*ht);
> +
> +	while (data->name) {
> +		g_hash_table_insert(*ht,
> +				    (gpointer) data->name,
> +				    data->value);
> +		data++;
> +	}
> +}
> +
> +#define get_vendor_spec(prop) \
> +	g_hash_table_lookup(gpu_vendor_ht, prop)
> +
> +/* Go through whole vendor hash table and compare against vendor
> field.
> + * Used mostly with vendor=3D... filter parameter when PCI id is not
> matched.
> +*/
> +static bool is_pci_vendor_name(const char *name)
> +{
> +	bool ret =3D false;
> +	GList *keys =3D g_hash_table_get_keys(gpu_vendor_ht);
> +
> +	if (!name)
> +		return false;
> +
> +	while (keys) {
> +		char *k =3D (char *) keys->data;
> +		struct vendor_spec *vs =3D
> g_hash_table_lookup(gpu_vendor_ht, k);
> +		keys =3D g_list_next(keys);
> +
> +		if (vs->dev_type !=3D DEV_PCI)
> +			continue;
> +
> +		if (!strcasecmp(name, vs->vendor)) {
> +			ret =3D true;
> +			break;
> +		}
> +	}
> +	g_list_free(keys);
> +
> +	return ret;
> +}
> +
> +/* Reading sysattr values can take time (even seconds),
> + * we want to avoid reading such keys.
> +*/
> +static void populate_blacklist_keys(void)
> +{
> +	const char *keys[] =3D { "config", "modalias",
> +			       "resource",
> +			       "resource0", "resource1", "resource2",
> +			       "resource3", "resource4", "resource5",
> +			       "resource0_wc", "resource1_wc",
> "resource2_wc",
> +			       "resource3_wc", "resource4_wc",
> "resource5_wc",
> +			       "driver",
> +			       "uevent", NULL};
> +	const char *key;
> +	int i =3D 0;
> +
> +	if (blacklist_keys_ht)
> +		return;
> +
> +	blacklist_keys_ht =3D g_hash_table_new(g_str_hash, g_str_equal);
> +	igt_assert(blacklist_keys_ht);
> +
> +	while ((key =3D keys[i++]))
> +		g_hash_table_add(blacklist_keys_ht, (gpointer) key);
> +}
> +
> +#define is_on_blacklist(key) \
> +	g_hash_table_contains(blacklist_keys_ht, key)
> +
> +static struct igt_device *igt_device_new(void)
> +{
> +	struct igt_device *dev;
> +	dev =3D calloc(1, sizeof(struct igt_device));
> +	if (!dev)
> +		return NULL;
> +
> +	dev->attrs_ht =3D g_hash_table_new_full(g_str_hash, g_str_equal,
> +					      free, free);
> +	dev->props_ht =3D g_hash_table_new_full(g_str_hash, g_str_equal,
> +					      free, free);
> +
> +	if (dev->attrs_ht && dev->props_ht)
> +		return dev;
> +
> +	return NULL;
> +}
> +
> +static void igt_device_add_prop(struct igt_device *dev,
> +				const char *key, const char *value)
> +{
> +	if (!key || !value)
> +		return;
> +
> +	g_hash_table_insert(dev->props_ht, strdup(key), strdup(value));
> +}
> +
> +static void igt_device_add_attr(struct igt_device *dev,
> +				const char *key, const char *value)
> +{
> +	const char *v =3D value;
> +
> +	if (!key)
> +		return;
> +
> +	/* It's possible we have symlink at key filename, but udev
> +	 * library resolves only few of them */
> +	if (!v) {
> +		struct stat st;
> +		char path[PATH_MAX];
> +		char linkto[PATH_MAX];
> +		int len;
> +
> +		snprintf(path, sizeof(path), "%s/%s", dev->syspath,
> key);
> +		if (lstat(path, &st) !=3D 0)
> +			return;
> +
> +		len =3D readlink(path, linkto, sizeof(linkto));
> +		if (len <=3D 0 || len =3D=3D (ssize_t) sizeof(linkto))
> +			return;
> +		linkto[len] =3D '\0';
> +		v =3D strrchr(linkto, '/');
> +		if (v =3D=3D NULL)
> +			return;
> +		v++;
> +	}
> +
> +	g_hash_table_insert(dev->attrs_ht, strdup(key), strdup(v));
> +}
> +
> +static void scan_props(struct udev_device *dev, struct igt_device
> *idev)
> +{
> +	struct udev_list_entry *entry;
> +
> +	entry =3D udev_device_get_properties_list_entry(dev);
> +	while (entry) {
> +		const char *name =3D udev_list_entry_get_name(entry);
> +		const char *value =3D udev_list_entry_get_value(entry);
> +		igt_device_add_prop(idev, name, value);
> +		entry =3D udev_list_entry_get_next(entry);
> +		DBG("prop: %s, val: %s\n", name, value);
> +	}
> +}
> +
> +static void scan_attrs(struct udev_device *dev, struct igt_device
> *idev)
> +{
> +	struct udev_list_entry *entry;
> +
> +	entry =3D udev_device_get_sysattr_list_entry(dev);
> +	while (entry) {
> +		const char *key =3D udev_list_entry_get_name(entry);
> +		const char *value;
> +
> +		if (is_on_blacklist(key)) {
> +			entry =3D udev_list_entry_get_next(entry);
> +			continue;
> +		}
> +
> +		value =3D udev_device_get_sysattr_value(dev, key);
> +		igt_device_add_attr(idev, key, value);
> +		entry =3D udev_list_entry_get_next(entry);
> +		DBG("attr: %s, val: %s\n", key, value);
> +	}
> +}
> +
> +#define get_prop(dev, prop) (char *) g_hash_table_lookup(dev-
> >props_ht, prop)
> +#define get_attr(dev, attr) (char *) g_hash_table_lookup(dev-
> >attrs_ht, attr)
> +#define get_prop_pci_id(dev)    get_prop(dev, "PCI_ID")
> +#define get_prop_pci_slot(dev)  get_prop(dev, "PCI_SLOT_NAME")
> +#define get_prop_devpath(dev)   get_prop(dev, "DEVPATH")
> +#define get_prop_driver(dev)    get_prop(dev, "DRIVER")
> +#define get_prop_modalias(dev)  get_prop(dev, "MODALIAS")
> +#define get_prop_of_compatible_0(dev) get_prop(dev,
> "OF_COMPATIBLE_0")
> +
> +/* Gets PCI_ID property, splits to xxxx:yyyy and stores
> + * xxxx to dev->vendor and yyyy to dev->device for
> + * faster access.
> + */
> +static void set_vendor_device(struct igt_device *dev)
> +{
> +	const char *pci_id =3D get_prop_pci_id(dev);
> +	if (!pci_id || strlen(pci_id) !=3D 9)
> +		return;
> +	dev->vendor =3D strndup(pci_id, 4);
> +	dev->device =3D strndup(pci_id + 5, 4);
> +}
> +
> +static void find_drm_paths(struct igt_device *dev, bool
> platform_check)
> +{
> +	char dirname[PATH_MAX];
> +	DIR *dir;
> +	const char *driver =3D get_prop_driver(dev);
> +	const char *devpath =3D get_prop_devpath(dev);
> +	struct dirent *e;
> +
> +	/* There's no DRIVER, so no /dev/dri/cardX and /dev/dri/renderD
> +	 * files exists. If there's no DEVPATH there's something wrong
> +	 * as well. */
> +	if (!platform_check && (!driver || !devpath))
> +		return;
> +
> +	snprintf(dirname, PATH_MAX, "%s/drm", dev->syspath);
> +	dir =3D opendir(dirname);
> +	if (!dir)
> +		return;
> +
> +	while((e =3D readdir(dir))) {
> +		int n;
> +		if (sscanf(e->d_name, "card%d", &n) =3D=3D 1)
> +			dev->drm_card_path =3D g_strdup_printf("%s/%s",
> +							     IGT_DRM_PA
> TH,
> +							     e-
> >d_name);
> +		else if (sscanf(e->d_name, "renderD%d", &n) =3D=3D 1)
> +			dev->drm_render_path =3D g_strdup_printf("%s/%s",
> +							       IGT_DRM_
> PATH,
> +							       e-
> >d_name);
> +	}
> +	closedir(dir);
> +
> +	if (dev->drm_card_path)
> +		DBG("card: %s\n", dev->drm_card_path);
> +	if (dev->drm_render_path)
> +		DBG("rend: %s\n", dev->drm_render_path);
> +}
> +
> +static bool prepare_scan(void)
> +{
> +	if (!igt_devs.devs)
> +		igt_devs.devs =3D g_ptr_array_sized_new(4);
> +	if (!igt_devs.view)
> +		igt_devs.view =3D g_ptr_array_sized_new(4);
> +
> +	if (!igt_devs.devs || !igt_devs.view)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool is_valid_pci_gpu(const char *prop)
> +{
> +	return g_hash_table_contains(gpu_pci_class_ht, prop);
> +}
> +
> +static bool is_valid_platform_gpu(const char *prop)
> +{
> +	struct vendor_spec *vs =3D g_hash_table_lookup(gpu_vendor_ht,
> prop);
> +	if (!vs)
> +		return false;
> +
> +	return vs->dev_type =3D=3D DEV_PLATFORM_NON_DISCOVERABLE ||
> +			vs->dev_type =3D=3D DEV_PLATFORM_DISCOVERABLE;
> +}
> +
> +static void add_pci_gpu(struct igt_device *dev)
> +{
> +	find_drm_paths(dev, false);
> +
> +	g_ptr_array_add(igt_devs.devs, dev);
> +	g_ptr_array_add(igt_devs.view, dev);
> +}
> +
> +static void add_platform_non_discoverable_gpu(struct igt_device
> *dev)
> +{
> +	find_drm_paths(dev, true);
> +	if (!get_prop_driver(dev))
> +		igt_device_add_prop(dev, "DRIVER", dev->vs->modname);
> +
> +	g_ptr_array_add(igt_devs.devs, dev);
> +	g_ptr_array_add(igt_devs.view, dev);
> +}
> +
> +static void add_platform_discoverable_gpu(struct igt_device *dev)
> +{
> +	find_drm_paths(dev, true);
> +	g_ptr_array_add(igt_devs.devs, dev);
> +	g_ptr_array_add(igt_devs.view, dev);
> +}
> +
> +/* Classifier table.
> + * Scanning udev devices looks same for pci and platform devices,
> but differs
> + * in logic regarding adding devices to the device array.
> +*/
> +struct {
> +	bool (*is_valid)(const char *prop); //check is device belongs
> to the class
> +	void (*add)(struct igt_device *dev); //add device to the array
> and aux stuff
> +	unsigned int dev_type;
> +	const char *subsys;
> +	const char *findprop;
> +} cls[] =3D {
> +	[IGT_SCAN_PCI] =3D { .subsys =3D "pci",
> +			   .findprop =3D "PCI_CLASS",
> +			   .dev_type =3D DEV_PCI,
> +			   .is_valid =3D is_valid_pci_gpu,
> +			   .add =3D add_pci_gpu,
> +			 },
> +	[IGT_SCAN_PLATFORM_NON_DISCOVERABLE] =3D { .subsys =3D "platform",
> +						 .findprop =3D
> "MODALIAS",
> +						 .dev_type =3D
> DEV_PLATFORM_NON_DISCOVERABLE,
> +						 .is_valid =3D
> is_valid_platform_gpu,
> +						 .add =3D
> add_platform_non_discoverable_gpu,
> +					       },
> +	[IGT_SCAN_PLATFORM_DISCOVERABLE] =3D { .subsys =3D "platform",
> +					     .findprop =3D
> "OF_COMPATIBLE_0",
> +					     .dev_type =3D
> DEV_PLATFORM_DISCOVERABLE,
> +					     .is_valid =3D
> is_valid_platform_gpu,
> +					     .add =3D
> add_platform_discoverable_gpu,
> +					   },
> +};
> +
> +static void scan_devices(enum igt_devices_scan_type scantype)
> +{
> +	struct udev *udev;
> +	struct udev_device *dev;
> +	struct udev_enumerate *enumerate;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	int ret;
> +
> +	udev =3D udev_new();
> +	igt_assert(udev);
> +
> +	enumerate =3D udev_enumerate_new(udev);
> +	igt_assert(enumerate);
> +
> +	DBG("Scanning subsystem %s\n", cls[scantype].subsys);
> +	ret =3D udev_enumerate_add_match_subsystem(enumerate,
> cls[scantype].subsys);
> +	igt_assert(!ret);
> +
> +	ret =3D udev_enumerate_scan_devices(enumerate);
> +	igt_assert(!ret);
> +
> +	devices =3D udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		return;
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		struct igt_device *idev;
> +		const char *path;
> +		const char *prop;
> +
> +		path =3D udev_list_entry_get_name(dev_list_entry);
> +		dev =3D udev_device_new_from_syspath(udev, path);
> +		prop =3D udev_device_get_property_value(dev,
> cls[scantype].findprop);
> +		if (!prop || !cls[scantype].is_valid(prop)) {
> +			udev_device_unref(dev);
> +			continue;
> +		}
> +		idev =3D igt_device_new();
> +		igt_assert(idev);
> +
> +		idev->dev_type =3D cls[scantype].dev_type;
> +		idev->syspath =3D strdup(udev_device_get_syspath(dev));
> +		scan_props(dev, idev);
> +		scan_attrs(dev, idev);
> +
> +		switch (idev->dev_type) {
> +		case DEV_PCI:
> +			set_vendor_device(idev);
> +			idev->pretty_name =3D
> strdup(get_prop_pci_slot(idev));
> +			idev->vs =3D get_vendor_spec(idev->vendor);
> +			break;
> +		default:
> +			idev->pretty_name =3D strdup(prop);
> +			idev->vs =3D get_vendor_spec(prop);
> +		}
> +		igt_assert(idev->vs);
> +
> +		cls[scantype].add(idev);
> +		udev_device_unref(dev);
> +	}
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +struct name_value filter_definition_list[];
> +static void populate_gpu_data(void)
> +{
> +	fill_ht(&gpu_pci_class_ht, &gpu_pci_class_list[0]);
> +	fill_ht(&gpu_vendor_ht, &gpu_vendor_list[0]);
> +	fill_ht(&filter_definition_ht, &filter_definition_list[0]);
> +}
> +
> +static void igt_device_free(struct igt_device *dev)
> +{
> +	free(dev->pretty_name);
> +	free(dev->device);
> +	free(dev->drm_card_path);
> +	free(dev->drm_render_path);
> +	free(dev->drvpath);
> +	free(dev->syspath);
> +	free(dev->vendor);
> +	g_hash_table_destroy(dev->attrs_ht);
> +	g_hash_table_destroy(dev->props_ht);
> +}
> +
> +void igt_devices_scan(bool force)
> +{
> +	if (force && igt_devs.devs_scanned) {
> +		for (int i =3D 0; i < igt_devs.devs->len; i++) {
> +			struct igt_device *dev =3D
> g_ptr_array_index(igt_devs.devs, i);
> +			igt_device_free(dev);
> +			free(dev);
> +		}
> +		igt_devs.devs_scanned =3D false;
> +		g_ptr_array_free(igt_devs.view, true);
> +		g_ptr_array_free(igt_devs.devs, true);
> +		igt_devs.view =3D NULL;
> +		igt_devs.devs =3D NULL;
> +	}
> +
> +	if (igt_devs.devs_scanned)
> +		return;
> +
> +	populate_blacklist_keys();      //keys from sysattr we skip
> +	populate_gpu_data();
> +
> +	prepare_scan();
> +	scan_devices(IGT_SCAN_PCI);
> +	scan_devices(IGT_SCAN_PLATFORM_NON_DISCOVERABLE);
> +	scan_devices(IGT_SCAN_PLATFORM_DISCOVERABLE);
> +	igt_devs.devs_scanned =3D true;
> +}
> +
> +#define pr_simple(k, v) printf("    %-16s: %s\n", k, v)
> +#define pr_simple_prop(dev, key) pr_simple(key, get_prop(dev, key))
> +#define pr_simple_attr(dev, key) pr_simple(key, get_attr(dev, key))
> +
> +static void print_vendor(struct igt_device *dev)
> +{
> +	struct vendor_spec *vs =3D dev->vs;
> +	char *info =3D alloca(256);
> +
> +	snprintf(info, 256, "%s (%s, module: %s%s)", dev->vendor,
> +		 vs ? vs->vendor : "unknown",
> +		 vs ? vs->modname : "unknown",
> +		 dev->drm_card_path ? "" : " [not binded/loaded]");
> +	pr_simple("vendor", info);
> +}
> +
> +static void igt_devs_print_simple(GPtrArray *view,
> +				  bool show_props, bool show_attrs)
> +{
> +	struct igt_device *dev;
> +	int i;
> +
> +	if (!view)
> +		return;
> +
> +	for (i =3D 0; i < view->len; i++) {
> +		dev =3D g_ptr_array_index(view, i);
> +		printf("%s\n", dev->pretty_name);
> +		pr_simple("syspath", dev->syspath);
> +		pr_simple("drm card", dev->drm_card_path);
> +		pr_simple("drm render", dev->drm_render_path);
> +
> +		if (show_props) {
> +			if (get_prop_pci_id(dev))
> +				pr_simple_prop(dev, "PCI_ID");
> +			pr_simple_prop(dev, "DRIVER");
> +		}
> +
> +		/* We show attrs only for PCI devices */
> +		if (show_attrs && dev->dev_type =3D=3D DEV_PCI) {
> +			print_vendor(dev);
> +			pr_simple("device", dev->device);
> +		}
> +	}
> +}
> +
> +#define pr_detail(k, v) printf("%-32s: %s\n", k, v)
> +
> +static void print_ht(GHashTable *ht)
> +{
> +	GList *keys =3D g_hash_table_get_keys(ht);
> +	keys =3D g_list_sort(keys, (GCompareFunc) strcmp);
> +	while (keys) {
> +		char *k =3D (char *) keys->data;
> +		char *v =3D g_hash_table_lookup(ht, k);
> +		pr_detail(k, v);
> +		keys =3D g_list_next(keys);
> +	}
> +	g_list_free(keys);
> +}
> +
> +static void igt_devs_print_detail(GPtrArray *view,
> +				  bool show_props, bool show_attrs)
> +{
> +	struct igt_device *dev;
> +	int i;
> +	(void) show_props;
> +	(void) show_attrs;
> +
> +	if (!view)
> +		return;
> +
> +	for (i =3D 0; i < view->len; i++) {
> +		dev =3D g_ptr_array_index(view, i);
> +		printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D %s =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D\n", dev->pretty_name);
> +		printf("[drm]\n");
> +		pr_detail("card device", dev->drm_card_path);
> +		pr_detail("render device", dev->drm_render_path);
> +		pr_detail("syspath", dev->syspath);
> +
> +		printf("\n[properties]\n");
> +		print_ht(dev->props_ht);
> +		printf("\n[attributes]\n");
> +		print_ht(dev->attrs_ht);
> +	}
> +}
> +
> +static struct print_func {
> +	void (*prn)(GPtrArray *, bool, bool);
> +} print_functions[] =3D {
> +	[IGT_PRINT_SIMPLE] =3D { .prn =3D igt_devs_print_simple },
> +	[IGT_PRINT_DETAIL] =3D { .prn =3D igt_devs_print_detail },
> +};
> +
> +void igt_devices_print(enum igt_devices_print_type printtype,
> +		       bool show_props,
> +		       bool show_attrs)
> +{
> +	print_functions[printtype].prn(igt_devs.view,
> +				       show_props, show_attrs);
> +}
> +
> +void igt_devices_print_vendors(void)
> +{
> +	struct name_value *list =3D &gpu_vendor_list[0];
> +	printf("Recognized vendors:\n");
> +
> +	printf("%-16s %-32s %-32s %-16s\n", "Device type", "id",

Theese %-32s and %-16s look very bulky when you run the command in non-
fullscreen terminal.=20

> +	       "vendor", "module");
> +	while (list->name) {
> +		char *k =3D (char *) list->name;
> +		struct vendor_spec *vs =3D
> g_hash_table_lookup(gpu_vendor_ht, k);
> +		if (vs->dev_type =3D=3D DEV_PCI)
> +			printf("%-16s %-32s %-32s %-16s\n", "pci",
> +			       k, vs->vendor, vs->modname);
> +		else if (vs->dev_type =3D=3D DEV_PLATFORM_NON_DISCOVERABLE)
> +			printf("%-16s %-32s %-32s %-16s\n", "non-
> discoverable",
> +			       k, vs->vendor, vs->modname);
> +		else if (vs->dev_type =3D=3D DEV_PLATFORM_DISCOVERABLE)
> +			printf("%-16s %-32s %-32s %-16s\n",
> "discoverable",
> +			       k, vs->vendor, vs->modname);
> +		list++;
> +	}
> +}
> +
> +static bool sys_write_attr(const char *dirname, const char *attr,
> +			   const char *str)
> +{
> +	int dir;
> +
> +	dir =3D open(dirname, O_RDONLY);
> +	if (dir < 0)
> +		return false;
> +
> +	if (igt_sysfs_printf(dir, attr, "%s", str) < 0) {
> +		printf("Error, can't write to %s, err: %s\n",
> +		       attr, strerror(errno));
> +		close(dir);
> +		return false;
> +	}
> +
> +	close(dir);
> +	return true;
> +}
> +
> +static bool ensure_driver_is_loaded(const char *modname, const char
> *modopts)
> +{
> +	if (!modname)
> +		return false;
> +
> +	if (!igt_kmod_is_loaded(modname)) {
> +		int ret;
> +		igt_debug("Loading module %s\n", modname);
> +		ret =3D igt_kmod_load(modname, modopts);
> +		if (ret) {
> +			igt_warn("Can't load module %s\n", modname);
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
> +#define ensure_device_has_driver_loaded(dev) \
> +	ensure_driver_is_loaded(dev->vs->modname, dev->vs->modopts)
> +
> +static struct igt_device *igt_devices_find_pci_id(const char
> *pci_slot)
> +{
> +	struct igt_device *dev;
> +	int i;
> +	GPtrArray *arr =3D igt_devs.devs;
> +
> +	if (!pci_slot)
> +		return NULL;
> +
> +	for (i =3D 0; i < arr->len; i++) {
> +		dev =3D g_ptr_array_index(arr, i);
> +		if (dev->dev_type !=3D DEV_PCI)
> +			continue;
> +		if (!strcmp(pci_slot, get_prop_pci_slot(dev)))
> +			return dev;
> +	}
> +
> +	return NULL;
> +}
> +
> +bool igt_device_pci_unbind_module(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	struct igt_device *dev =3D igt_devices_find_pci_id(pci_slot);
> +
> +	if (!dev)
> +		return false;
> +
> +	if (dev->dev_type !=3D DEV_PCI)
> +		return false;
> +
> +	igt_assert(dev->vs);
> +
> +	if (!ensure_driver_is_loaded(dev->vs->modname, dev->vs-
> >modopts))
> +		return false;
> +
> +	igt_info("Unbinding driver %s on %s\n", dev->vs->modname,
> pci_slot);
> +	snprintf(path, PATH_MAX, "%s/%s", IGT_BUS_PCI_DRIVERS_DIR,
> +		 dev->vs->modname);
> +
> +	return sys_write_attr(path, "unbind", pci_slot);
> +}
> +
> +bool igt_device_pci_bind_module(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	struct igt_device *dev =3D igt_devices_find_pci_id(pci_slot);
> +
> +	if (!dev)
> +		return false;
> +
> +	if (dev->dev_type !=3D DEV_PCI)
> +		return false;
> +
> +	igt_assert(dev->vs);
> +
> +	if (!ensure_driver_is_loaded(dev->vs->modname, dev->vs-
> >modopts))
> +		return false;
> +
> +	igt_info("Binding driver %s to %s\n", dev->vs->modname,
> pci_slot);
> +	snprintf(path, PATH_MAX, "%s/%s", IGT_BUS_PCI_DRIVERS_DIR,
> +		 dev->vs->modname);
> +
> +	return sys_write_attr(path, "bind", pci_slot);
> +}
> +
> +static bool pci_rebind_module(struct igt_device *dev)
> +{
> +	if (dev && dev->dev_type !=3D DEV_PCI)
> +		return false;
> +
> +	igt_device_pci_unbind_module(get_prop_pci_slot(dev));
> +	igt_device_pci_bind_module(get_prop_pci_slot(dev));
> +
> +	return true;
> +}
> +
> +void igt_devices_bind_modules(void)
> +{
> +	struct igt_device *dev;
> +	int i;
> +	GPtrArray *arr;
> +	printf("Binding modules...\n");
> +
> +	arr =3D igt_devs.devs;
> +	for (i =3D 0; i < arr->len; i++) {
> +		dev =3D g_ptr_array_index(arr, i);
> +		if (!dev->drm_card_path) {
> +			pci_rebind_module(dev);
> +		}
> +	}
> +}
> +
> +/* ---------------------------------------------------------------
> ---------- */
> +#define FILTER_SPEC_NAME_LEN 32
> +#define FILTER_SPEC_DATA_LEN 256
> +struct filter_spec {
> +	char name[FILTER_SPEC_NAME_LEN];
> +	char data[FILTER_SPEC_DATA_LEN];
> +};
> +
> +struct filter_func {
> +	GPtrArray *(*filter_function)(struct filter_spec *fspec,
> +				      struct filter_func *ffunc);
> +	const char *help;
> +	const char *detail;
> +
> +	struct vendor_spec *vs; //pointer to vs (if any)
> +};
> +
> +union filter_data {
> +	struct {
> +		char *card;
> +	} drm;
> +	struct {
> +		char *vendor;
> +		char *device;
> +		char *card;
> +	} pci;
> +	struct {
> +		char *card;
> +	} module;
> +	struct {
> +		char *card;
> +	} compatible;
> +};
> +
> +static GHashTable *split_filter_data(const char *data)
> +{
> +	GHashTable *ht =3D g_hash_table_new_full(g_str_hash, g_str_equal,
> +					       free, free);
> +	gchar **s;
> +	gchar **strv =3D g_strsplit(data, ",", -1);
> +
> +	s =3D strv;
> +	while (*s) {
> +		char *k, *v;
> +		v =3D strchr(*s, '=3D');
> +		if (!v) {
> +			s++;
> +			continue;
> +		}
> +		k =3D strndup(*s, v - (*s));
> +		v =3D strdup(v + 1);
> +		g_hash_table_insert(ht, k, v);
> +		s++;
> +	}
> +	g_strfreev(strv);
> +
> +	return ht;
> +}
> +
> +static bool get_filter_spec(const char *filter, struct filter_spec
> *spec)
> +{
> +	if (!filter)
> +		return false;
> +
> +	if (sscanf(filter, "%31[^:]:%255s", spec->name, spec->data) =3D=3D
> 2)
> +		return true;
> +
> +	return false;
> +}
> +
> +static GPtrArray *filter_drm(struct filter_spec *fspec,
> +			     struct filter_func *ffunc)
> +{
> +	GHashTable *ht;
> +	GPtrArray *devs, *view;
> +	union filter_data fdata;
> +	int card =3D -1;
> +	char cardstr[NAME_MAX];
> +
> +	(void) ffunc;
> +	DBG("filter drm\n");
> +
> +	ht =3D split_filter_data(fspec->data);
> +	fdata.drm.card =3D g_hash_table_lookup(ht, "card");
> +
> +	view =3D igt_devs.view;
> +	devs =3D igt_devs.devs;
> +
> +	if (fdata.drm.card) {
> +		sscanf(fdata.drm.card, "%d", &card);
> +		if (card < 0) {
> +			g_hash_table_destroy(ht);
> +			return view;
> +		}
> +	}
> +
> +	snprintf(cardstr, NAME_MAX, "%s/card%d", IGT_DRM_PATH, card);
> +	for (int i =3D 0; i < devs->len; i++) {
> +		struct igt_device *dev =3D g_ptr_array_index(devs, i);
> +		if (dev->drm_card_path && !strcmp(cardstr, dev-
> >drm_card_path)) {
> +			g_ptr_array_add(view, dev);
> +			break;
> +		}
> +	}
> +
> +	DBG("Filter drm view size: %d\n", view->len);
> +
> +	g_hash_table_destroy(ht);
> +
> +	return view;
> +}
> +
> +static GPtrArray *filter_pci(struct filter_spec *fspec,
> +			     struct filter_func *ffunc)
> +{
> +	GHashTable *ht;
> +	GPtrArray *devs, *view;
> +	union filter_data fdata;
> +
> +	DBG("filter pci\n");
> +
> +	(void) ffunc;
> +	ht =3D split_filter_data(fspec->data);
> +	fdata.pci.vendor =3D g_hash_table_lookup(ht, "vendor");
> +	fdata.pci.device =3D g_hash_table_lookup(ht, "device");
> +	fdata.pci.card =3D g_hash_table_lookup(ht, "card");
> +
> +	view =3D igt_devs.view;
> +	devs =3D igt_devs.devs;
> +
> +	for (int i =3D 0; i < devs->len; i++) {
> +		struct igt_device *dev =3D g_ptr_array_index(devs, i);
> +
> +		if (dev->dev_type !=3D DEV_PCI)
> +			continue;
> +
> +		/* Skip if 'vendor' doesn't match (hex or name) */
> +		if (fdata.pci.vendor &&
> +				strcasecmp(fdata.pci.vendor, dev-
> >vendor) &&
> +				!is_pci_vendor_name(fdata.pci.vendor))
> +			continue;
> +
> +		/* Skip if 'device' doesn't match */
> +		if (fdata.pci.device &&
> +				strcasecmp(fdata.pci.device, dev-
> >device))
> +			continue;
> +
> +		g_ptr_array_add(view, dev);
> +	}
> +
> +	/* Leave only n-th element if card is set */
> +	if (fdata.pci.card) {
> +		int card =3D -1;
> +		sscanf(fdata.pci.card, "%d", &card);
> +
> +		if (card >=3D 0 && card < view->len) {
> +			struct igt_device *dev =3D
> g_ptr_array_index(view, card);
> +			g_ptr_array_remove_range(view, 0, view->len);
> +			g_ptr_array_add(view, dev);
> +		} else {
> +			g_ptr_array_remove_range(view, 0, view->len);
> +		}
> +	}
> +	DBG("Filter pci view size: %d\n", view->len);
> +
> +	g_hash_table_destroy(ht);
> +
> +	return view;
> +}
> +
> +/*
> + * Refresh view finding first card matching with
> + * vs->match_driver or vs->modname if vs->match_driver is not set
> + */
> +static GPtrArray *filter_module(struct filter_spec *fspec,
> +				struct filter_func *ffunc)
> +{
> +	GHashTable *ht;
> +	GPtrArray *devs, *view;
> +	union filter_data fdata;
> +	int card =3D -1;
> +	const char *driver =3D ffunc->vs->match_driver ?: ffunc->vs-
> >modname;
> +
> +	DBG("filter module [%s]\n", driver);
> +
> +	ht =3D split_filter_data(fspec->data);
> +	fdata.module.card =3D g_hash_table_lookup(ht, "card");
> +
> +	view =3D igt_devs.view;
> +	devs =3D igt_devs.devs;
> +
> +	if (fdata.module.card) {
> +		sscanf(fdata.module.card, "%d", &card);
> +		if (card < 0) {
> +			g_hash_table_destroy(ht);
> +			return view;
> +		}
> +	}
> +
> +	for (int i =3D 0; i < devs->len; i++) {
> +		const char *modname;
> +		struct igt_device *dev =3D g_ptr_array_index(devs, i);
> +
> +		modname =3D get_prop_driver(dev);
> +		if (!modname)
> +			continue;
> +
> +		if (!strcmp(modname, driver)) {
> +			if (!card) {
> +				g_ptr_array_add(view, dev);
> +				break;
> +			}
> +			card--;
> +		}
> +	}
> +
> +	DBG("Filter view size: %d\n", view->len);
> +
> +	g_hash_table_destroy(ht);
> +
> +	return view;
> +}
> +
> +static const char *find_vendor_id_by_vendor_spec(struct vendor_spec
> *vs)
> +{
> +	struct name_value *list =3D &gpu_vendor_list[0];
> +
> +	while (list->name) {
> +		if ((struct vendor_spec *) list->value =3D=3D vs)
> +			return list->name;
> +		list++;
> +	}
> +	return NULL;
> +}
> +
> +static GPtrArray *filter_compatible(struct filter_spec *fspec,
> +				    struct filter_func *ffunc)
> +{
> +	GHashTable *ht;
> +	GPtrArray *devs, *view;
> +	union filter_data fdata;
> +	int card =3D -1;
> +	const char *of_compatible =3D
> find_vendor_id_by_vendor_spec(ffunc->vs);
> +
> +	DBG("filter compatible[%s]\n", of_compatible);
> +
> +	ht =3D split_filter_data(fspec->data);
> +	fdata.module.card =3D g_hash_table_lookup(ht, "card");
> +
> +	view =3D igt_devs.view;
> +	devs =3D igt_devs.devs;
> +
> +	if (fdata.module.card) {
> +		sscanf(fdata.module.card, "%d", &card);
> +		if (card < 0) {
> +			g_hash_table_destroy(ht);
> +			return view;
> +		}
> +	}
> +
> +	for (int i =3D 0; i < devs->len; i++) {
> +		const char *compat;
> +		struct igt_device *dev =3D g_ptr_array_index(devs, i);
> +
> +		if (!of_compatible)
> +			break;
> +
> +		compat =3D get_prop_of_compatible_0(dev);
> +		if (compat && !strcmp(compat, of_compatible)) {
> +			if (!card) {
> +				g_ptr_array_add(view, dev);
> +				break;
> +			}
> +			card--;
> +		}
> +	}
> +
> +	DBG("Filter view size: %d\n", view->len);
> +
> +	g_hash_table_destroy(ht);
> +
> +	return view;
> +}
> +
> +
> +static struct filter_func f_drm =3D { .filter_function =3D filter_drm,
> +				    .help =3D "drm:[card=3D%d]",
> +				    .detail =3D "card is N-card number
> (from /dev/dri/cardN)\n",
> +				  };
> +
> +static struct filter_func f_pci =3D { .filter_function =3D filter_pci,
> +				    .help =3D
> "pci:[vendor=3D%04x/name][,device=3D%04x][,card=3D%d]",
> +				    .detail =3D "vendor is hex number or
> name",
> +				  };
> +
> +static struct filter_func f_vgem =3D { .filter_function =3D
> filter_module,
> +				     .help =3D "vgem:[card=3D%d]",
Can we use simpler syntax for filters with only card=3D%d?

Like vkms:0 instead of vkms:card=3D0. Or maybe set a default such that
"vkms" would equal to "vkms:card=3D0".

> +				     .detail =3D "card is n-th vgem card
> number\n",
> +				     .vs =3D &v_vgem,
> +				   };
> +
> +static struct filter_func f_vkms =3D { .filter_function =3D
> filter_module,
> +				     .help =3D "vkms:[card=3D%d]",
> +				     .detail =3D "card is n-th vkms card
> number\n",
> +				     .vs =3D &v_vkms,
> +				   };
> +
> +static struct filter_func f_exynos =3D { .filter_function =3D
> filter_module,
> +				       .help =3D "exynos:[card=3D%d]",
> +				       .detail =3D "card is n-th exynos-
> drm card number\n",
> +				       .vs =3D &v_exynos,
> +				     };
> +
> +static struct filter_func f_vc4 =3D { .filter_function =3D
> filter_compatible,
> +				    .help =3D "vc4:[card=3D%d]",
> +				    .detail =3D "card is n-th vc4 card
> number\n",
> +				    .vs =3D &v_vc4,
> +				  };
> +
> +struct name_value filter_definition_list[] =3D {
> +	{ "drm",     (gpointer) &f_drm },
> +	{ "pci",     (gpointer) &f_pci },
> +	{ "vgem",    (gpointer) &f_vgem },
> +	{ "vkms",    (gpointer) &f_vkms },
> +	{ "exynos",  (gpointer) &f_exynos },
> +	{ "vc4",     (gpointer) &f_vc4 },
> +	{ NULL, },
> +};
> +
> +void igt_device_print_filter_types(void)
> +{
> +	GList *keys =3D g_hash_table_get_keys(filter_definition_ht);
> +
> +	printf("Filter types:\n---\n");
> +	printf("%-8s  %s\n---\n", "filter", "syntax");
> +	while (keys) {
> +		char *k =3D (char *) keys->data;
> +		struct filter_func *v =3D
> g_hash_table_lookup(filter_definition_ht, k);
> +		printf("%-8s  %s\n", k, v->help);
> +		printf("%-8s  %s\n", "", v->detail);
> +		keys =3D g_list_next(keys);
> +	}
> +	g_list_free(keys);
> +}
> +
> +static GPtrArray *device_filters =3D NULL;
> +
> +#define DEVICE_FILTER_CHECK_ALLOC() \
> +	do { \
> +		if (!device_filters) \
> +			device_filters =3D g_ptr_array_new_full(2, free);
> \
> +		igt_assert(device_filters); \
> +	} while(0)
> +
> +int igt_device_filter_count(void)
> +{
> +	DEVICE_FILTER_CHECK_ALLOC();
> +
> +	return device_filters->len;
> +}
> +
> +int igt_device_filter_add(const char *filter)
> +{
> +	gchar **strv, **s;
> +	int c =3D 0;
> +
> +	DEVICE_FILTER_CHECK_ALLOC();
> +
> +	strv =3D g_strsplit(filter, ";", -1);
> +
> +	s =3D strv;
> +	while (*s) {
> +		g_ptr_array_add(device_filters, strdup(*s));
> +		s++;
> +	}
> +	g_strfreev(strv);
> +
> +	return c;
> +}
> +
> +const char *igt_device_filter_get(int num)
> +{
> +	DEVICE_FILTER_CHECK_ALLOC();
> +
> +	if (num < 0 || num >=3D device_filters->len)
> +		return NULL;
> +
> +	return g_ptr_array_index(device_filters, num);
> +}
> +
> +#define dev_is_non_discoverable(vs) \
> +	((vs)->dev_type =3D=3D DEV_PLATFORM_NON_DISCOVERABLE)
> +
> +bool igt_device_filter_apply(const char *filter)
> +{
> +	struct filter_spec fspec;
> +	struct filter_func *ffunc;
> +	bool ret;
> +
> +	if (!filter)
> +		return false;
> +
> +	ret =3D get_filter_spec(filter, &fspec);
> +	if (!ret) {
> +		igt_warn("Can't split filter [%s]\n", filter);
> +		return false;
> +	}
> +
> +	ffunc =3D g_hash_table_lookup(filter_definition_ht, fspec.name);
> +	if (!ffunc) {
> +		igt_warn("No filter with name [%s]\n", fspec.name);
> +		return false;
> +	}
> +
> +	/* Clean view */
> +	g_ptr_array_remove_range(igt_devs.view, 0, igt_devs.view->len);
> +
> +	/* Load module only for non-discoverable devices.
> +	 * For discoverables / PCI defer this to card match path
> +	*/
> +	if (ffunc->vs && dev_is_non_discoverable(ffunc->vs) &&
> +			!igt_kmod_is_loaded(ffunc->vs->modname)) {
> +		if (!igt_kmod_load(ffunc->vs->modname, ffunc->vs-
> >modopts)) {
> +			igt_info("Module %s loaded, rescanning
> devices\n",
> +				 ffunc->vs->modname);
> +			igt_devices_scan(true);
> +		} else {
> +			return false;
> +		}
> +	}
> +
> +	ffunc->filter_function(&fspec, ffunc);
> +
> +	return true;
> +}
> +
> +bool igt_device_filter_apply_nth(int num)
> +{
> +	const char *filter =3D igt_device_filter_get(num);
> +	if (!filter)
> +		return false;
> +
> +	return igt_device_filter_apply(filter);
> +}
> +
> +/* For PCI devices load or unbind / bind is called in card matching
> path.
> + * This is for 'lsgpu' tool which doesn't want to make magic driver
> + * loading job in filter apply path (it really want to display PCI
> devices
> + * in the state they really are).
> +*/
> +static bool ensure_device_is_ready(struct igt_device *dev,
> +				   const char *filter)
> +{
> +	if (dev->dev_type !=3D DEV_PCI &&
> +		dev->dev_type !=3D DEV_PLATFORM_DISCOVERABLE)
> +		return false;
> +
> +	if (dev->drm_card_path || dev->drm_render_path)
> +		return true;
> +
> +	/* So, we have PCI device or discoverable device without
> +	 * card/render node, lets try at the beginning to simply
> +	 * load the module */
> +	if (!ensure_device_has_driver_loaded(dev))
> +		return false; //oops!
> +
> +	/* Rescan devices, filter again and get the device */
> +	igt_devices_scan(true);
> +	if (igt_device_filter_apply(filter) =3D=3D false)
> +		return false;
> +
> +	if (!igt_devs.view->len)
> +		return false;
> +
> +	dev =3D g_ptr_array_index(igt_devs.view, 0);
> +	if (dev->drm_card_path || dev->drm_render_path)
> +		return true;
> +
> +	/* For platform device unbind/bind is not performed */
> +	if (dev->dev_type =3D=3D DEV_PLATFORM_DISCOVERABLE)
> +		return false;
> +
> +	/* In this moment we likely already had driver loaded,
> +	 * but it wasn't binded to this device. */
> +	igt_device_pci_unbind_module(get_prop_pci_slot(dev));
> +	igt_device_pci_bind_module(get_prop_pci_slot(dev));
> +	igt_devices_scan(true);
> +	if (igt_device_filter_apply(filter) =3D=3D false)
> +		return false;
> +
> +	if (!igt_devs.view->len)
> +		return false;
> +
> +	dev =3D g_ptr_array_index(igt_devs.view, 0);
> +	if (dev->drm_card_path || dev->drm_render_path)
> +		return true;
> +
> +	return false;
> +}
> +
> +#define safe_strncpy(dst, src, size) \
> +	if (src) strncpy((dst), (src), (size))
> +/*
> + * Returns:
> + * false - no card pointer was passed or card wasn't matched,
> + * true - card matched and returned.
> + */
> +bool igt_device_card_match(const char *filter, struct
> igt_device_card *card)
> +{=09
> +	struct igt_device *dev =3D NULL;
> +
> +	if (!card)
> +		return false;
> +	memset(card, 0, sizeof(*card));
> +
> +	igt_devices_scan(false);
> +
> +	if (igt_device_filter_apply(filter) =3D=3D false)
> +		return false;
> +
> +	if (!igt_devs.view->len)
> +		return false;
> +
> +	dev =3D g_ptr_array_index(igt_devs.view, 0);
> +	if (dev->dev_type =3D=3D DEV_PCI ||
> +		dev->dev_type =3D=3D DEV_PLATFORM_DISCOVERABLE) {
> +		if (!ensure_device_is_ready(dev, filter))
> +			return false;
> +	}
> +
> +	if (!igt_devs.view->len) //additional check because rescan
> could happen
> +		return false;
> +
> +	/* We take first one if more than one card matches filter */
> +	dev =3D g_ptr_array_index(igt_devs.view, 0);
> +	card->dev_type =3D dev->dev_type;
> +	card->chipset =3D dev->vs->chipset;
> +	if (dev->dev_type =3D=3D DEV_PCI) {
> +		safe_strncpy(card->module, dev->vs->modname, NAME_MAX);
> +		safe_strncpy(card->pci_slot, get_prop_pci_slot(dev),
> +			PCI_SLOT_LENGTH);
> +	} else {
> +		safe_strncpy(card->module, get_prop_driver(dev),
> NAME_MAX);
> +	}
> +	safe_strncpy(card->card, dev->drm_card_path, NAME_MAX);
> +	safe_strncpy(card->render, dev->drm_render_path, NAME_MAX);
> +
> +	return true;
> +}
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> new file mode 100644
> index 00000000..0e2adf13
> --- /dev/null
> +++ b/lib/igt_device_scan.h
> @@ -0,0 +1,72 @@
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice (including
> the next
> + * paragraph) shall be included in all copies or substantial
> portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __IGT_DEVICE_SCAN_H__
> +#define __IGT_DEVICE_SCAN_H__
> +
> +#include <limits.h>
> +#include <igt.h>
> +
> +enum igt_devices_print_type {
> +	IGT_PRINT_SIMPLE,
> +	IGT_PRINT_DETAIL,
> +};
> +
> +enum igt_device_type {
> +	DEV_PCI,
> +	DEV_PLATFORM_NON_DISCOVERABLE,
> +	DEV_PLATFORM_DISCOVERABLE,
> +};
> +
> +#define PCI_SLOT_LENGTH 13
> +struct igt_device_card {
> +	enum igt_device_type dev_type;
> +	unsigned int chipset; //contains DRIVER_XXX value
> +	char module[NAME_MAX];
> +	char card[NAME_MAX];
> +	char render[NAME_MAX];
> +	char pci_slot[PCI_SLOT_LENGTH];
> +};
> +
> +void igt_devices_scan(bool force);
> +void igt_devices_print(enum igt_devices_print_type printtype,
> +		       bool show_props, bool show_attrs);
> +
> +void igt_devices_print_vendors(void);
> +
> +bool igt_device_pci_unbind_module(const char *pci_slot);
> +bool igt_device_pci_bind_module(const char *pci_slot);
> +void igt_devices_bind_modules(void);
> +
> +void igt_device_print_filter_types(void);
> +
> +int igt_device_filter_count(void);
> +int igt_device_filter_add(const char *filter);
> +const char *igt_device_filter_get(int num);
> +bool igt_device_filter_apply(const char *filter);
> +bool igt_device_filter_apply_nth(int num);
> +
> +bool igt_device_card_match(const char *filter, struct
> igt_device_card *card);
> +
> +#endif /* __IGT_DEVICE_SCAN_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 157624e7..826ebbe3 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -10,6 +10,7 @@ lib_sources =3D [
>  	'igt_color_encoding.c',
>  	'igt_debugfs.c',
>  	'igt_device.c',
> +	'igt_device_scan.c',
>  	'igt_aux.c',
>  	'igt_gpu_power.c',
>  	'igt_gt.c',
> diff --git a/tools/Makefile.sources b/tools/Makefile.sources
> index 50706f41..0e67b654 100644
> --- a/tools/Makefile.sources
> +++ b/tools/Makefile.sources
> @@ -33,6 +33,7 @@ tools_prog_lists =3D		\
>  	intel_watermark		\
>  	intel_gem_info		\
>  	intel_gvtg_test     \
> +	lsgpu			\
>  	$(NULL)
> =20
>  dist_bin_SCRIPTS =3D intel_gpu_abrt
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> new file mode 100644
> index 00000000..b784ca65
> --- /dev/null
> +++ b/tools/lsgpu.c
> @@ -0,0 +1,285 @@
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person
> obtaining a
> + * copy of this software and associated documentation files (the
> "Software"),
> + * to deal in the Software without restriction, including without
> limitation
> + * the rights to use, copy, modify, merge, publish, distribute,
> sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom
> the
> + * Software is furnished to do so, subject to the following
> conditions:
> + *
> + * The above copyright notice and this permission notice (including
> the next
> + * paragraph) shall be included in all copies or substantial
> portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> OTHER DEALINGS
> + * IN THE SOFTWARE.
> + *
> + */
> +
> +#include "igt_device_scan.h"
> +#include "igt.h"
> +#include <sys/ioctl.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <signal.h>
> +
> +enum {
> +	OPT_SHOW_PROPS     =3D 'r',
> +	OPT_SHOW_ATTRS     =3D 'a',
> +	OPT_PRINT_SIMPLE   =3D 'i',
> +	OPT_PRINT_DETAIL   =3D 'd',
> +	OPT_LIST_VENDORS   =3D 'v',
> +	OPT_BIND_MODULES   =3D 'B',
> +	OPT_UNBIND_MODULE  =3D 'u',
> +	OPT_BIND_MODULE    =3D 'b',
> +	OPT_LIST_FILTERS   =3D 'l',
> +	OPT_SET_FILTER     =3D 's',
> +	OPT_MATCH_DEVICE   =3D 'm',
> +	OPT_DEVICE         =3D 'D',
> +	OPT_HELP           =3D 'h'
> +};
> +
> +bool g_show_props;
> +bool g_show_attrs;
> +bool g_show_vendors;
> +bool g_bind_modules;
> +char *g_pci_id;
> +bool g_unbind_module;
> +bool g_bind_module;
> +bool g_list_filters;
> +char *g_filter;
> +char *g_match_filter;
> +bool g_device;
> +bool g_help;
> +
> +static const char *usage_str =3D
> +	"usage: lsgpu [options]\n\n"
> +	"Options:\n"
> +	"  -r, --show-props            Show device properties\n"
> +	"  -a, --show-attrs            Show device attributes\n"

What is the difference between those?
Maybe merge those two options into one?

> +	"  -i, --print-simple          Print devices as simple list
> (default)\n"
> +	"  -d, --print-details         Print devices with details\n"
> +	"  -v, --list-vendors          List recognized vendors\n"
> +	"  -B, --bind-modules          Bind modules to unbound PCI
> cards\n"
> +	"  -u, --unbind-module pci_id  Unbind module from pci id
> device\n"
> +	"  -b, --bind-module pci_id    Bind module to pci id device\n"
> +	"  -l, --list-filter-types     List registered device filters
> types\n"

Maybe add those to help?

> +	"  -s, --set-filter filter     Set filter for processing
> devices\n"
> +	"  -m, --match-device filter   Find device matching to
> filter\n"
> +	"  -D, --device filter         Device filter, can be given
> multiple times\n"

What is the difference between theese three options?

What is the semantics of multiple --device?=20

Oleg

> +	"  -h, --help                  Show this help message and
> exit\n";
> +
> +static void test_device_open(struct igt_device_card *card)
> +{
> +	int fd;
> +
> +	if (!card)
> +		return;
> +
> +	fd =3D __drm_open_card(card);
> +	if (fd >=3D 0) {
> +		printf("Device %s successfully opened\n", card->card);
> +		close(fd);
> +	} else {
> +		if (strlen(card->card))
> +			printf("Cannot open card %s device\n", card-
> >card);
> +		else
> +			printf("Cannot open card device, empty
> name\n");
> +	}
> +
> +	fd =3D __drm_open_render(card);
> +	if (fd >=3D 0) {
> +		printf("Device %s successfully opened\n", card-
> >render);
> +		close(fd);
> +	} else {
> +		if (strlen(card->render))
> +			printf("Cannot open render %s device\n", card-
> >render);
> +		else
> +			printf("Cannot open render device, empty
> name\n");
> +	}
> +}
> +
> +static void print_card(struct igt_device_card *card)
> +{
> +	if (!card)
> +		return;
> +
> +	switch (card->dev_type) {
> +	case DEV_PCI:
> +		printf("dev type    : %s\n", "PCI");
> +		printf("PCI slot    : %s\n", card->pci_slot);
> +		break;
> +	case DEV_PLATFORM_NON_DISCOVERABLE:
> +		printf("dev type    : %s\n", "PLATFORM (NON-
> DISCOVERABLE)");
> +		break;
> +	case DEV_PLATFORM_DISCOVERABLE:
> +		printf("dev type    : %s\n", "PLATFORM
> (DISCOVERABLE)");
> +		break;
> +	}
> +	printf("drv chipset : %x\n", card->chipset);
> +	printf("drm card    : %s\n", card->card);
> +	printf("drm render  : %s\n", card->render);
> +	printf("drv module  : %s\n", card->module);
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	static struct option long_options[] =3D {
> +		{"show-props",        no_argument,       NULL,
> OPT_SHOW_PROPS},
> +		{"show-attrs",        no_argument,       NULL,
> OPT_SHOW_ATTRS},
> +		{"print-simple",      no_argument,       NULL,
> OPT_PRINT_SIMPLE},
> +		{"print-detail",      no_argument,       NULL,
> OPT_PRINT_DETAIL},
> +		{"list-vendors",      no_argument,       NULL,
> OPT_LIST_VENDORS},
> +		{"bind-modules",      no_argument,       NULL,
> OPT_BIND_MODULES},
> +		{"unbind-module",     required_argument, NULL,
> OPT_UNBIND_MODULE},
> +		{"bind-module",       required_argument, NULL,
> OPT_BIND_MODULE},
> +		{"list-filter-types", no_argument,       NULL,
> OPT_LIST_FILTERS},
> +		{"set-filter",        required_argument, NULL,
> OPT_SET_FILTER},
> +		{"match-device",      required_argument, NULL,
> OPT_MATCH_DEVICE},
> +		{"device",            required_argument, NULL,
> OPT_DEVICE},
> +		{"help",              no_argument,       NULL,
> OPT_HELP},
> +		{0, 0, 0, 0}
> +	};
> +	int c, index =3D 0;
> +	const char *env;
> +	enum igt_devices_print_type printtype =3D IGT_PRINT_SIMPLE;
> +
> +	while ((c =3D getopt_long(argc, argv, "PpraidvBu:b:ls:m:D:h",
> +				long_options, &index)) !=3D -1) {
> +		switch(c) {
> +		case OPT_SHOW_PROPS:
> +			g_show_props =3D true;
> +			break;
> +		case OPT_SHOW_ATTRS:
> +			g_show_attrs =3D true;
> +			break;
> +		case OPT_PRINT_SIMPLE:
> +			printtype =3D IGT_PRINT_SIMPLE;
> +			break;
> +		case OPT_PRINT_DETAIL:
> +			printtype =3D IGT_PRINT_DETAIL;
> +			break;
> +		case OPT_LIST_VENDORS:
> +			g_show_vendors =3D true;
> +			break;
> +		case OPT_BIND_MODULES:
> +			g_bind_modules =3D true;
> +			break;
> +		case OPT_UNBIND_MODULE:
> +			g_pci_id =3D strdup(optarg);
> +			g_unbind_module =3D true;
> +			break;
> +		case OPT_BIND_MODULE:
> +			g_pci_id =3D strdup(optarg);
> +			g_bind_module =3D true;
> +			break;
> +		case OPT_SET_FILTER:
> +			g_filter =3D strdup(optarg);
> +			break;
> +		case OPT_LIST_FILTERS:
> +			g_list_filters =3D true;
> +			break;
> +		case OPT_MATCH_DEVICE:
> +			g_match_filter =3D strdup(optarg);
> +			break;
> +		case OPT_DEVICE:
> +			g_device =3D true;
> +			igt_device_filter_add(optarg);
> +			break;
> +		case OPT_HELP:
> +			g_help =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (g_help) {
> +		printf("%s\n", usage_str);
> +		exit(0);
> +	}
> +
> +	env =3D getenv("IGT_DEVICE");
> +	if (env) {
> +		igt_device_filter_add(env);
> +		g_device =3D true;
> +	}
> +
> +	igt_devices_scan(false);
> +	if (g_show_vendors) {
> +		igt_devices_print_vendors();
> +		return 0;
> +	}
> +	if (g_bind_modules) {
> +		igt_devices_bind_modules();
> +		return 0;
> +	}
> +
> +	if (g_unbind_module) {
> +		igt_device_pci_unbind_module(g_pci_id);
> +		return 0;
> +	}
> +
> +	if (g_bind_module) {
> +		igt_device_pci_bind_module(g_pci_id);
> +		return 0;
> +	}
> +
> +	if (g_list_filters) {
> +		igt_device_print_filter_types();
> +		return 0;
> +	}
> +
> +	if (g_filter) {
> +		igt_device_filter_apply(g_filter);
> +	}
> +
> +	if (g_match_filter) {
> +		struct igt_device_card card;
> +		if (igt_device_card_match(g_match_filter, &card)) {
> +			print_card(&card);
> +		} else {
> +			printf("No device matching filter [%s]
> found.\n",
> +			       g_match_filter);
> +			return 0;
> +		}
> +		test_device_open(&card);
> +
> +		return 0;
> +	}
> +
> +	if (g_device) {
> +		int n =3D igt_device_filter_count();
> +		printf("=3D=3D=3D Device filter list =3D=3D=3D\n");
> +		for (int i =3D 0; i < n; i++) {
> +			printf("[%2d]: %s\n", i,
> +			       igt_device_filter_get(i));
> +			igt_device_filter_apply_nth(i);
> +			igt_devices_print(printtype, g_show_props,
> g_show_attrs);
> +		}
> +		printf("\n");
> +
> +		printf("=3D=3D=3D Testing device open =3D=3D=3D\n");
> +		for (int i =3D 0; i < n; i++) {
> +			struct igt_device_card card;
> +			const char *filter =3D igt_device_filter_get(i);
> +
> +			if (!igt_device_card_match(filter, &card))
> +				continue;
> +			print_card(&card);
> +			test_device_open(&card);
> +			printf("---\n");
> +		}
> +
> +		return 0;
> +	}
> +
> +	igt_devices_print(printtype, g_show_props, g_show_attrs);
> +
> +	return 0;
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 6e72b263..9b3a2a69 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -36,6 +36,7 @@ tools_progs =3D [
>  	'intel_gem_info',
>  	'intel_gvtg_test',
>  	'dpcd_reg',
> +	'lsgpu',
>  ]
>  tool_deps =3D igt_deps
> =20

--=-qXGorOFC9w0Wct05WTtt
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKaDCCBOsw
ggPToAMCAQICEFLpAsoR6ESdlGU4L6MaMLswDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzAzMTkwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
4LDMgJ3YSVX6A9sE+jjH3b+F3Xa86z3LLKu/6WvjIdvUbxnoz2qnvl9UKQI3sE1zURQxrfgvtP0b
Pgt1uDwAfLc6H5eqnyi+7FrPsTGCR4gwDmq1WkTQgNDNXUgb71e9/6sfq+WfCDpi8ScaglyLCRp7
ph/V60cbitBvnZFelKCDBh332S6KG3bAdnNGB/vk86bwDlY6omDs6/RsfNwzQVwo/M3oPrux6y6z
yIoRulfkVENbM0/9RrzQOlyK4W5Vk4EEsfW2jlCV4W83QKqRccAKIUxw2q/HoHVPbbETrrLmE6RR
Z/+eWlkGWl+mtx42HOgOmX0BRdTRo9vH7yeBowIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFB5pKrTcKP5HGE4hCz+8rBEv8Jj1MA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAKcLNo/2So1Jnoi8G7W5Q6FSPq1fmyKW3
sSDf1amvyHkjEgd25n7MKRHGEmRxxoziPKpcmbfXYU+J0g560nCo5gPF78Wd7ZmzcmCcm1UFFfIx
fw6QA19bRpTC8bMMaSSEl8y39Pgwa+HENmoPZsM63DdZ6ziDnPqcSbcfYs8qd/m5d22rpXq5IGVU
tX6LX7R/hSSw/3sfATnBLgiJtilVyY7OGGmYKCAS2I04itvSS1WtecXTt9OZDyNbl7LtObBrgMLh
ZkpJW+pOR9f3h5VG2S5uKkA7Th9NC9EoScdwQCAIw+UWKbSQ0Isj2UFL7fHKvmqWKVTL98sRzvI3
seNC4DCCBXUwggRdoAMCAQICEzMAANF/7HEPN+Xh96oAAAAA0X8wDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEEwHhcNMTkwNDE3MTYxMzE1WhcNMjAwNDExMTYxMzE1WjA/MRYwFAYDVQQDEw1WYXNpbGV2
LCBPbGVnMSUwIwYJKoZIhvcNAQkBFhZvbGVnLnZhc2lsZXZAaW50ZWwuY29tMIIBIjANBgkqhkiG
9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxIxxAmTWhwU/z/xSIjnSYoLHqbo9B24rRkDhTaOaWQprEnPg
e52BaM6UN7JWpoXh1Xue+5kxGoVtVPNy58yYAO/E1Wbl/e8O1Vbpi4jQ1aCK1Y1yBYeE5dmJ8moD
0XFcgQGFZ5KVSyIJ8zmPfPbLyQX6rPw4MhOqWEmvY8Is/HlwLcUlnkzL+FOp5DlhJGVw62cpDSBy
d7HbU+wKZpT19ji161kPStRFN4HGvF0hC/9TpIAVCtQkUhUG4w9nvTQkGhyN039Tax99yrC1noca
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MTIwODIwMzZaMCMGCSqGSIb3DQEJBDEWBBTHadhC
qxL30qSBMp/zINyL8DazuDANBgkqhkiG9w0BAQEFAASCAQCVPespRm2QUlcMMX2Pd8VeHYJ9hlc9
/gwx0VsKwQxx1LAp5qiA6Fp/fwOVpAyJQgCHE3KJ1MQFj6kQiuMaSiBc3NuyJT80yRTib0H7OnL7
0EPeKy1ysuXaLxv/Eaj3HRfce5Kit0A991wQ+2Xh+qfgL79SN3XSY0InZ/RHPPYXHudN1rUBgnKp
j1PVc0uFVOmKVRwkK85pYTkVCthg6XdNOpTXVKr2W17NCSKdfY2mlkl76Zak3hPMIvXeBt4CGwea
q3jaLZJJeuof0f2oHBV3pjGBFCEZO/lcJXoIwWHhKb5Q7kJ/aWPDbvWkbf5s5Yr0yz895xHTcN90
GGJcvTaBAAAAAAAA


--=-qXGorOFC9w0Wct05WTtt--

--===============1699836494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1699836494==--
