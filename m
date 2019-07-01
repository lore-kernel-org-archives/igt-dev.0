Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4CF489B69
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2019 20:57:44 +0000 (UTC)
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Date: Mon, 1 Jul 2019 20:57:40 +0000
Message-ID: <d22e4f02cb7876ccf6d6a5501ca2a07d45411bd1.camel@intel.com>
References: <20190701130326.8887-1-zbigniew.kempczynski@intel.com>
 <20190701130326.8887-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20190701130326.8887-2-zbigniew.kempczynski@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [EARLY RFC 1/1] Introduce new method of device
 selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0671414421=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0671414421==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-L2OTYy4WLgtT7R8iryYW"

--=-L2OTYy4WLgtT7R8iryYW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

First of all, thanks for working on this. This will definitely be
useful.

On Mon, 2019-07-01 at 15:03 +0200, Zbigniew Kempczy=C5=84ski wrote:
> Change adds device selection based on implemented filters. Currently
> drm, dev and pci filters were added to address different device
> selection possibilities.
>=20
> drm filter allows selection /dev/dri/cardN node by using filter
>         drm:card=3DN
> where N is number of card.
>=20
> dev filter allows selection of N-th device in all gpus avilable
> (PCI devices at the moment). Regardless of driver load time
> and /dev/dri/cardN this filter will select same device until
> new card will be added. Filter syntax is as follows:
>         dev:card=3DN

I am not sure I understand the purpose of this method. The first is
mostly for debugging. The third one is used to specify the exact
device. Why do we need this?

>=20
> pci filter gives vendor / device / card number selection. Only
> cards which match this filter will be returned. Filter syntax:
>         pci:vendor=3Dxxxx,device=3Dyyyy,card=3DN
> where xxxx, yyyy are hex numbers which identify vendor and device,
> card selects N-th matching card.
> New device selection uses --device filter or IGT_DEVICE environent
> variable.

I think, we are still missing a method for specifying the device in a
human-readable format. Is there any reliable way of projecting strings
like "intel", "amd", "vkms", etc to an actual device, or we still need
to maintain this mapping inside IGT runner?

Also, should IGT_FORCE_DRIVER be kept? Seems like IGT_FORCE_DRIVER and
IGT_DEVICE serve quite a similar purpose.

>=20
> Tool 'lsgpu' which uses device scanning feature was added.
>=20
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Petri Latvala <petri.latvala@intel.com>

BTW, about multiple devices tests and drm_open_driver(DRIVER_INTEL).
One approach could be this:

1. We add another instance of this --device property, called for
example --device2, which would correspond to an auxiliary device. This
approach allows us to have the same generic device selection mechanism
in all places. Also, if we ever have the test involving 3 devices, this
can scale :)
2. With new selection mechanism active
fd =3D drm_open_driver(DRIVER_SOMETHING)
is an alias for
fd =3D drm_open_driver(DRIVER_ANY)
igt_require_something(fd)

Oleg


> ---
>  lib/Makefile.sources   |   2 +
>  lib/drmtest.c          |  53 ++-
>  lib/drmtest.h          |   1 +
>  lib/igt_core.c         |  12 +
>  lib/igt_core.h         |   1 +
>  lib/igt_device_scan.c  | 936
> +++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h  |  64 +++
>  lib/meson.build        |   1 +
>  tools/Makefile.sources |   1 +
>  tools/lsgpu.c          | 222 ++++++++++
>  tools/meson.build      |   1 +
>  11 files changed, 1292 insertions(+), 2 deletions(-)
>  create mode 100644 lib/igt_device_scan.c
>  create mode 100644 lib/igt_device_scan.h
>  create mode 100644 tools/lsgpu.c
>=20
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
> index 25f20353..eaffb9b3 100644
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
> @@ -296,22 +297,70 @@ static int __open_driver(const char *base, int
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
> +
>  /**
>   * __drm_open_driver:
>   * @chipset: OR'd flags for each chipset to search, eg.
> #DRIVER_INTEL
>   *
> - * Open the first DRM device we can find, searching up to 16 device
> nodes
> + * Function opens device with following order:
> + * 1. when --device argument is present device scanning will be
> executed,
> + * then device which matches filter argument will be selected.
> + * 2. compatibility mode - open the first DRM device we can find,
> + * searching up to 16 device nodes.
>   *
>   * Returns:
>   * An open DRM fd or -1 on error
>   */
>  int __drm_open_driver(int chipset)
>  {
> +	if (igt_device_arg) {
> +		struct igt_device_card card;
> +		int match;
> +		igt_devices_scan(IGT_SCAN_PCI, false);
> +		match =3D igt_device_card_match(igt_device_arg, &card);
> +		if (match < 0 || (card.chipset !=3D chipset && chipset !=3D
> DRIVER_ANY))
> +			return -1;
> +		return __open_driver_exact(card.card, chipset);
> +	}
> +
>  	return __open_driver("/dev/dri/card", 0, chipset);
>  }
> =20
> -static int __drm_open_driver_render(int chipset)
> +int __drm_open_driver_render(int chipset)
>  {
> +	if (igt_device_arg) {
> +		struct igt_device_card card;
> +		int match;
> +		igt_devices_scan(IGT_SCAN_PCI, false);
> +		match =3D igt_device_card_match(igt_device_arg, &card);
> +		if (match < 0 || (card.chipset !=3D chipset && chipset !=3D
> DRIVER_ANY))
> +			return -1;
> +		return __open_driver_exact(card.render, chipset);
> +	}
> +
>  	return __open_driver("/dev/dri/renderD", 128, chipset);
>  }
> =20
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 6c4c3899..42b7d58c 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -76,6 +76,7 @@ int drm_open_driver(int chipset);
>  int drm_open_driver_master(int chipset);
>  int drm_open_driver_render(int chipset);
>  int __drm_open_driver(int chipset);
> +int __drm_open_driver_render(int chipset);
> =20
>  void gem_quiescent_gpu(int fd);
> =20
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 6b9f0425..3d4f8833 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -257,6 +257,9 @@
>  static unsigned int exit_handler_count;
>  const char *igt_interactive_debug;
> =20
> +/* device selection */
> +const char *igt_device_arg =3D NULL;
> +
>  /* subtests helpers */
>  static bool list_subtests =3D false;
>  static char *run_single_subtest =3D NULL;
> @@ -289,6 +292,7 @@ enum {
>  	OPT_DESCRIPTION,
>  	OPT_DEBUG,
>  	OPT_INTERACTIVE_DEBUG,
> +	OPT_DEVICE,
>  	OPT_HELP =3D 'h'
>  };
> =20
> @@ -558,6 +562,7 @@ static void print_usage(const char *help_str,
> bool output_on_stderr)
>  		   "  --debug[=3Dlog-domain]\n"
>  		   "  --interactive-debug[=3Ddomain]\n"
>  		   "  --help-description\n"
> +		   "  --device filter\n"
>  		   "  --help|-h\n");
>  	if (help_str)
>  		fprintf(f, "%s\n", help_str);
> @@ -659,6 +664,8 @@ static void common_init_env(void)
>  	if (env) {
>  		__set_forced_driver(env);
>  	}
> +
> +	igt_device_arg =3D getenv("IGT_DEVICE");
>  }
> =20
>  static int common_init(int *argc, char **argv,
> @@ -675,6 +682,7 @@ static int common_init(int *argc, char **argv,
>  		{"help-description",  no_argument,       NULL,
> OPT_DESCRIPTION},
>  		{"debug",             optional_argument, NULL,
> OPT_DEBUG},
>  		{"interactive-debug", optional_argument, NULL,
> OPT_INTERACTIVE_DEBUG},
> +		{"device",            required_argument, NULL,
> OPT_DEVICE},
>  		{"help",              no_argument,       NULL,
> OPT_HELP},
>  		{0, 0, 0, 0}
>  	};
> @@ -786,6 +794,10 @@ static int common_init(int *argc, char **argv,
>  			print_test_description();
>  			ret =3D -1;
>  			goto out;
> +		case OPT_DEVICE:
> +			assert(optarg);
> +				igt_device_arg =3D strdup(optarg);
> +			break;
>  		case OPT_HELP:
>  			print_usage(help_str, false);
>  			ret =3D -1;
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 88a95ec2..6a67bec0 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -877,6 +877,7 @@ bool igt_run_in_simulation(void);
>  void igt_skip_on_simulation(void);
> =20
>  extern const char *igt_interactive_debug;
> +extern const char *igt_device_arg;
> =20
>  /**
>   * igt_log_level:
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> new file mode 100644
> index 00000000..4e981ae7
> --- /dev/null
> +++ b/lib/igt_device_scan.c
> @@ -0,0 +1,936 @@
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
> +static GHashTable *blacklist_keys_ht; //sysattrs we don't want to
> read
> +static GHashTable *gpu_pci_class_ht;  //gpu pci classes we know
> +static GHashTable *gpu_vendor_ht;
> +static GHashTable *filter_def_ht;
> +
> +struct igt_device {
> +	GHashTable *props_ht;
> +	GHashTable *attrs_ht;
> +	char *syspath;
> +	char *drvpath;
> +	char *drm_card_path;
> +	char *drm_render_path;
> +	char *vendor;
> +	char *device;
> +};
> +
> +struct igt_devices {
> +	const char *filter_name;
> +	const char *filter_data;
> +	GPtrArray *pci_devs;		//all gpu devices array
> +	GPtrArray *pci_devs_view;	//filtered view
> +};
> +
> +static struct igt_devices igt_devs;
> +static char *igt_devs_filter;
> +static bool igt_devs_scanned =3D false;
> +
> +struct name_value {
> +	const char *name;
> +	gpointer *value;
> +};
> +
> +struct vendor_spec {
> +	const char *vendor;
> +	const char *module;
> +	int chipset;
> +};
> +
> +struct name_value gpu_pci_class_list[] =3D {
> +	{ "30000", (gpointer) "VGA compatibile controller" },
> +	{ "30100", (gpointer) "XGA compatibile controller" },
> +	{ "30200", (gpointer) "3D controller" },
> +	{ "38000", (gpointer) "Display controller" },
> +	{ NULL, },
> +};
> +
> +static struct vendor_spec v_intel  =3D { .vendor =3D "Intel", .module =
=3D
> "i915",
> +				     .chipset =3D DRIVER_INTEL };
> +static struct vendor_spec v_amd    =3D { .vendor =3D "AMD", .module =3D
> "amdgpu",
> +				     .chipset =3D DRIVER_AMDGPU };
> +static struct vendor_spec v_nvidia =3D { .vendor =3D "NVIDIA", .module =
=3D
> "nvidia",
> +				     .chipset =3D DRIVER_ANY };
> +
> +struct name_value gpu_vendor_list[] =3D {
> +	{ "8086", (gpointer) &v_intel },
> +	{ "1002", (gpointer) &v_amd },
> +	{ "1022", (gpointer) &v_amd },
> +	{ "10de", (gpointer) &v_nvidia },
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
> +#define get_gpu_pci_class(pci_class) \
> +	g_hash_table_lookup(gpu_pci_class_ht, pci_class)
> +
> +#define is_pci_class_gpu(pci_class) \
> +	g_hash_table_contains(gpu_pci_class_ht, pci_class)
> +
> +#define get_vendor_spec(id) \
> +	g_hash_table_lookup(gpu_vendor_ht, id)
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
> +static bool is_on_blacklist(const char *key)
> +{
> +	return g_hash_table_contains(blacklist_keys_ht, key);
> +}
> +
> +static struct igt_device *igt_device_new(void)
> +{
> +	struct igt_device *dev;
> +	dev =3D calloc(1, sizeof(struct igt_device));
> +	if (!dev)
> +		return NULL;
> +
> +	dev->attrs_ht =3D g_hash_table_new(g_str_hash, g_str_equal);
> +	dev->props_ht =3D g_hash_table_new(g_str_hash, g_str_equal);
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
> +#define get_prop_pci_id(dev) get_prop(dev, "PCI_ID")
> +#define get_prop_pci_slot(dev) get_prop(dev, "PCI_SLOT_NAME")
> +
> +/* scans PCI_ID property, splits to xxxx:yyyy and stores
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
> +static void find_drm_paths(struct igt_device *dev)
> +{
> +	char dirname[PATH_MAX];
> +	DIR *dir;
> +	const char *driver =3D get_prop(dev, "DRIVER");
> +	const char *devpath =3D get_prop(dev, "DEVPATH");
> +	struct dirent *e;
> +
> +	/* There's no DRIVER, so no /dev/dri/cardX and /dev/dri/renderD
> +	 * files exists. If there's no DEVPATH there's something wrong
> +	 * as well. */
> +	if (!driver || !devpath)
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
> +static void scan_pci_devices(void)
> +{
> +	struct udev *udev;
> +	struct udev_device *dev;
> +	struct udev_enumerate *enumerate;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +
> +	udev =3D udev_new();
> +	igt_assert(udev);
> +
> +	enumerate =3D udev_enumerate_new(udev);
> +	igt_assert(enumerate);
> +
> +	udev_enumerate_add_match_subsystem(enumerate, "pci");
> +	udev_enumerate_scan_devices(enumerate);
> +
> +	devices =3D udev_enumerate_get_list_entry(enumerate);
> +	igt_assert(devices);
> +
> +	if (!igt_devs.pci_devs)
> +		igt_devs.pci_devs =3D g_ptr_array_sized_new(4);
> +	if (!igt_devs.pci_devs_view)
> +		igt_devs.pci_devs_view =3D g_ptr_array_sized_new(4);
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		struct igt_device *idev;
> +		const char *path;
> +		const char *pci_class;
> +
> +		path =3D udev_list_entry_get_name(dev_list_entry);
> +		dev =3D udev_device_new_from_syspath(udev, path);
> +
> +		pci_class =3D udev_device_get_property_value(dev,
> "PCI_CLASS");
> +		if (!is_pci_class_gpu(pci_class)) {
> +			udev_device_unref(dev);
> +			continue;
> +		}
> +		idev =3D igt_device_new();
> +		igt_assert(idev);
> +
> +		idev->syspath =3D strdup(udev_device_get_syspath(dev));
> +		scan_props(dev, idev);
> +		scan_attrs(dev, idev);
> +		set_vendor_device(idev);
> +		find_drm_paths(idev);
> +
> +		DBG("---\n");
> +
> +		g_ptr_array_add(igt_devs.pci_devs, idev);
> +		g_ptr_array_add(igt_devs.pci_devs_view, idev);
> +
> +		udev_device_unref(dev);
> +	}
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +static void scan_platform_devices(void)
> +{
> +}
> +
> +struct name_value filter_def_list[];
> +static void populate_gpu_data(void)
> +{
> +	fill_ht(&gpu_pci_class_ht, &gpu_pci_class_list[0]);
> +	fill_ht(&gpu_vendor_ht, &gpu_vendor_list[0]);
> +	fill_ht(&filter_def_ht, &filter_def_list[0]);
> +}
> +
> +void igt_devices_scan(enum igt_devices_scan_type scantype, bool
> force)
> +{
> +	/* Skip scanning if already done */
> +	if (igt_devs_scanned && !force)
> +		return;
> +
> +	populate_blacklist_keys();      //keys from sysattr we skip
> +	populate_gpu_data();
> +
> +	if (scantype & IGT_SCAN_PCI)
> +		scan_pci_devices();
> +	if (scantype & IGT_SCAN_PLATFORM)
> +		scan_platform_devices();
> +
> +	igt_devs_scanned =3D true;
> +}
> +
> +#define pr_simple(k, v) printf("    %-16s: %s\n", k, v)
> +#define pr_simple_prop(dev, key) pr_simple(key, get_prop(dev, key))
> +#define pr_simple_attr(dev, key) pr_simple(key, get_attr(dev, key))
> +
> +static void __print_vendor(struct igt_device *dev)
> +{
> +	struct vendor_spec *vs;
> +	char *info =3D alloca(256);
> +
> +	vs =3D get_vendor_spec(dev->vendor);
> +	snprintf(info, 256, "%s (%s, module: %s%s)", dev->vendor,
> +		 vs ? vs->vendor : "unknown",
> +		 vs ? vs->module : "unknown",
> +		 dev->drm_card_path ? "" : " [not binded/loaded]");
> +	pr_simple("vendor", info);
> +}
> +
> +static void igt_devs_print_simple(bool show_props, bool show_attrs)
> +{
> +	struct igt_device *dev;
> +	int i;
> +	GPtrArray *view =3D igt_devs.pci_devs_view;
> +
> +	if (!view)
> +		return;
> +
> +	for (i =3D 0; i < view->len; i++) {
> +		dev =3D g_ptr_array_index(view, i);
> +		printf("%s\n", get_prop_pci_slot(dev));
> +		pr_simple("syspath", dev->syspath);
> +		pr_simple("drm card", dev->drm_card_path);
> +		pr_simple("drm render", dev->drm_render_path);
> +
> +		if (show_props) {
> +			pr_simple_prop(dev, "PCI_ID");
> +			pr_simple_prop(dev, "DRIVER");
> +		}
> +
> +		if (show_attrs) {
> +			__print_vendor(dev);
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
> +static void igt_devs_print_detail(bool show_props, bool show_attrs)
> +{
> +	struct igt_device *dev;
> +	int i;
> +	GPtrArray *view =3D igt_devs.pci_devs_view;
> +
> +	if (!view)
> +		return;
> +
> +	for (i =3D 0; i < view->len; i++) {
> +		dev =3D g_ptr_array_index(view, i);
> +
> +		printf("=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D %s =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D\n",
> +		       get_prop(dev, "PCI_SLOT_NAME"));
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
> +	void (*prn)(bool, bool);
> +} print_functions[] =3D {
> +	[IGT_PRINT_SIMPLE] =3D { .prn =3D igt_devs_print_simple },
> +	[IGT_PRINT_DETAIL] =3D { .prn =3D igt_devs_print_detail },
> +};
> +
> +void igt_devices_print(enum igt_devices_print_type printtype,
> +		       bool show_props,
> +		       bool show_attrs)
> +{
> +	print_functions[printtype].prn(show_props, show_attrs);
> +}
> +
> +void igt_devices_print_vendors(void)
> +{
> +	GList *keys =3D g_hash_table_get_keys(gpu_vendor_ht);
> +	printf("Recognized vendors:\n");
> +
> +	printf("%-8s  %-16s %-16s\n", "PCI ID:", "vendor", "module");
> +	while (keys) {
> +		char *k =3D (char *) keys->data;
> +		struct vendor_spec *v =3D
> g_hash_table_lookup(gpu_vendor_ht, k);
> +		printf("%-8s  %-16s %-16s\n", k, v->vendor, v->module);
> +		keys =3D g_list_next(keys);
> +	}
> +	g_list_free(keys);
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
> +static struct igt_device *igt_devices_find_pci_id(const char
> *pci_slot)
> +{
> +	struct igt_device *dev;
> +	int i;
> +	GPtrArray *arr =3D igt_devs.pci_devs;
> +
> +	if (!pci_slot)
> +		return NULL;
> +
> +	for (i =3D 0; i < arr->len; i++) {
> +		dev =3D g_ptr_array_index(arr, i);
> +		if (!strcmp(pci_slot, get_prop_pci_slot(dev)))
> +			return dev;
> +	}
> +
> +	return NULL;
> +}
> +
> +static const char *find_module_for_dev(struct igt_device *dev)
> +{
> +	struct vendor_spec *vs;
> +
> +	if (!dev)
> +		return NULL;
> +
> +	vs =3D get_vendor_spec(dev->vendor);
> +	if (!vs)
> +		return NULL;
> +
> +	return vs->module;
> +}
> +
> +bool igt_device_pci_unbind_module(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	const char *modname;
> +	struct igt_device *dev =3D igt_devices_find_pci_id(pci_slot);
> +
> +	if (!dev)
> +		return false;
> +
> +	modname =3D find_module_for_dev(dev);
> +	if (!modname)
> +		return false;
> +
> +	printf("Unbinding driver %s on %s\n", modname, pci_slot);
> +	snprintf(path, PATH_MAX, "%s/%s", IGT_BUS_PCI_DRIVERS_DIR,
> modname);
> +
> +	return sys_write_attr(path, "unbind", pci_slot);
> +}
> +
> +bool igt_device_pci_bind_module(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	const char *modname;
> +	struct igt_device *dev =3D igt_devices_find_pci_id(pci_slot);
> +
> +	if (!dev)
> +		return false;
> +
> +	modname =3D find_module_for_dev(dev);
> +	if (!modname)
> +		return false;
> +
> +	printf("Binding driver %s to %s\n", modname, pci_slot);
> +	snprintf(path, PATH_MAX, "%s/%s", IGT_BUS_PCI_DRIVERS_DIR,
> modname);
> +
> +	return sys_write_attr(path, "bind", pci_slot);
> +}
> +
> +static bool pci_rebind_module(struct igt_device *dev)
> +{
> +	const char *modname;
> +
> +	modname =3D find_module_for_dev(dev);
> +	if (!modname)
> +		return false;
> +
> +	if (!igt_kmod_is_loaded(modname)) {
> +		int ret;
> +		printf("Loading module %s\n", modname);
> +		ret =3D igt_kmod_load(modname, NULL);
> +		if (ret) {
> +			printf("Can't load module, error: %s",
> +			       strerror(errno));
> +			return false;
> +		}
> +	}
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
> +	GPtrArray *arr =3D igt_devs.pci_devs_view;
> +	printf("Binding modules...\n");
> +
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
> +struct filter_func {
> +	GPtrArray *(*filter_function)(void);
> +	const char *help;
> +	const char *detail;
> +};
> +
> +union filter_spec {
> +	struct {
> +		char *card;
> +	} drm;
> +	struct {
> +		char *card;
> +	} dev;
> +	struct {
> +		char *vendor;
> +		char *device;
> +		char *card;
> +	} pci;
> +};
> +
> +static GHashTable *split_filter_data(const char *data)
> +{
> +	GHashTable *ht =3D g_hash_table_new(g_str_hash, g_str_equal);
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
> +static GPtrArray *filter_drm(void)
> +{
> +	GHashTable *ht;
> +	GPtrArray *devs, *view;
> +	union filter_spec fspec;
> +	int card =3D -1;
> +	char cardstr[NAME_MAX];
> +
> +	DBG("filter drm\n");
> +
> +	ht =3D split_filter_data(igt_devs.filter_data);
> +	fspec.drm.card =3D g_hash_table_lookup(ht, "card");
> +	g_hash_table_destroy(ht);
> +
> +	g_ptr_array_free(igt_devs.pci_devs_view, FALSE);
> +	view =3D igt_devs.pci_devs_view =3D g_ptr_array_sized_new(1);
> +	devs =3D igt_devs.pci_devs;
> +
> +	g_ptr_array_remove_range(view, 0, view->len);
> +
> +	if (fspec.drm.card) {
> +		sscanf(fspec.drm.card, "%d", &card);
> +		if (card < 0) {
> +			g_ptr_array_free(view, FALSE);
> +			return view;
> +		}
> +	}
> +
> +	snprintf(cardstr, NAME_MAX, "%s/card%d", IGT_DRM_PATH, card);
> +	for (int i =3D 0; i < devs->len; i++) {
> +		struct igt_device *dev =3D g_ptr_array_index(devs, i);
> +		if (!strcmp(cardstr, dev->drm_card_path)) {
> +			g_ptr_array_add(view, dev);
> +			break;
> +		}
> +	}
> +
> +	DBG("Filter drm view size: %d\n", view->len);
> +
> +	free(fspec.drm.card);
> +
> +	return view;
> +}
> +
> +static GPtrArray *filter_dev(void)
> +{
> +	GHashTable *ht;
> +	GPtrArray *devs, *view;
> +	union filter_spec fspec;
> +
> +	DBG("filter dev\n");
> +
> +	ht =3D split_filter_data(igt_devs.filter_data);
> +	fspec.dev.card =3D g_hash_table_lookup(ht, "card");
> +	g_hash_table_destroy(ht);
> +
> +	g_ptr_array_free(igt_devs.pci_devs_view, FALSE);
> +	view =3D igt_devs.pci_devs_view =3D g_ptr_array_sized_new(4);
> +	devs =3D igt_devs.pci_devs;
> +
> +	for (int i =3D 0; i < devs->len; i++) {
> +		struct igt_device *dev =3D g_ptr_array_index(devs, i);
> +		g_ptr_array_add(view, dev);
> +	}
> +
> +	if (fspec.dev.card) {
> +		int card =3D -1;
> +		sscanf(fspec.dev.card, "%d", &card);
> +
> +		if (card >=3D 0 && card < view->len) {
> +			struct igt_device *dev =3D
> g_ptr_array_index(view, card);
> +			g_ptr_array_remove_range(view, 0, view->len);
> +			g_ptr_array_add(view, dev);
> +		} else {
> +			g_ptr_array_free(view, FALSE);
> +		}
> +	}
> +	DBG("Filter dev view size: %d\n", view->len);
> +
> +	free(fspec.dev.card);
> +
> +	return view;
> +}
> +
> +static GPtrArray *filter_pci(void)
> +{
> +	GHashTable *ht;
> +	GPtrArray *devs, *view;
> +	union filter_spec fspec;
> +
> +	DBG("filter pci\n");
> +
> +	ht =3D split_filter_data(igt_devs.filter_data);
> +	fspec.pci.vendor =3D g_hash_table_lookup(ht, "vendor");
> +	fspec.pci.device =3D g_hash_table_lookup(ht, "device");
> +	fspec.pci.card =3D g_hash_table_lookup(ht, "card");
> +	g_hash_table_destroy(ht);
> +
> +	g_ptr_array_free(igt_devs.pci_devs_view, FALSE);
> +	view =3D igt_devs.pci_devs_view =3D g_ptr_array_sized_new(4);
> +	devs =3D igt_devs.pci_devs;
> +
> +	for (int i =3D 0; i < devs->len; i++) {
> +		struct igt_device *dev =3D g_ptr_array_index(devs, i);
> +
> +		/* Skip if 'vendor' doesn't match */
> +		if (fspec.pci.vendor &&
> +			strcasecmp(fspec.pci.vendor, dev->vendor))
> +			continue;
> +
> +		/* Skip if 'device' doesn't match */
> +		if (fspec.pci.device &&
> +			strcasecmp(fspec.pci.device, dev->device))
> +			continue;
> +
> +		g_ptr_array_add(view, dev);
> +	}
> +
> +	/* Leave only n-th element if card is set */
> +	if (fspec.pci.card) {
> +		int card =3D -1;
> +		sscanf(fspec.pci.card, "%d", &card);
> +
> +		if (card >=3D 0 && card < view->len) {
> +			struct igt_device *dev =3D
> g_ptr_array_index(view, card);
> +			g_ptr_array_remove_range(view, 0, view->len);
> +			g_ptr_array_add(view, dev);
> +		} else {
> +			g_ptr_array_free(view, FALSE);
> +		}
> +	}
> +	DBG("Filter pci view size: %d\n", view->len);
> +
> +	free(fspec.pci.vendor);
> +	free(fspec.pci.device);
> +	free(fspec.pci.card);
> +
> +	return view;
> +}
> +
> +static struct filter_func f_drm =3D { .filter_function =3D filter_drm,
> +				    .help =3D "drm:[card=3D%d]",
> +				    .detail =3D "card is N-card number
> (from /dev/dri/cardN)\n"};
> +
> +static struct filter_func f_dev =3D { .filter_function =3D filter_dev,
> +				    .help =3D "dev:[card=3D%d]",
> +				    .detail =3D "card is card number in
> PCI gpu sorted list\n"};
> +
> +static struct filter_func f_pci =3D { .filter_function =3D filter_pci,
> +				    .help =3D
> "pci:[vendor=3D%04x][,device=3D%04x][,card=3D%d]",
> +				    .detail =3D "vendor is hex number,
> ex. 8086"};
> +
> +struct name_value filter_def_list[] =3D {
> +	{ "drm",  (gpointer) &f_drm },
> +	{ "dev",  (gpointer) &f_dev },
> +	{ "pci",  (gpointer) &f_pci },
> +	{ NULL, },
> +};
> +
> +void igt_device_list_filters(void)
> +{
> +	GList *keys =3D g_hash_table_get_keys(filter_def_ht);
> +
> +	printf("List of registered filters:\n---\n");
> +	printf("%-8s  %s\n---\n", "filter", "syntax");
> +	while (keys) {
> +		char *k =3D (char *) keys->data;
> +		struct filter_func *v =3D
> g_hash_table_lookup(filter_def_ht, k);
> +		printf("%-8s  %s\n", k, v->help);
> +		printf("%-8s  %s\n", "", v->detail);
> +		keys =3D g_list_next(keys);
> +	}
> +	g_list_free(keys);
> +}
> +
> +bool igt_device_set_filter(const char *filter)
> +{
> +	struct filter_func *fspec;
> +	char *data;
> +
> +	if (!filter)
> +		return false;
> +
> +	free(igt_devs_filter);
> +	igt_devs_filter =3D strdup(filter);
> +	data =3D strchr(igt_devs_filter, ':');
> +	if (!data) {
> +		printf("Invalid filter [%s]\n\n", filter);
> +		igt_device_list_filters();
> +		igt_devs.filter_name =3D NULL;
> +		igt_devs.filter_data =3D NULL;
> +		return false;
> +	}
> +	*data =3D '\0';
> +	igt_devs.filter_name =3D igt_devs_filter;
> +	igt_devs.filter_data =3D data + 1;
> +	fspec =3D g_hash_table_lookup(filter_def_ht,
> igt_devs.filter_name);
> +	if (!fspec) {
> +		printf("Filter [%s] not supported\n\n",
> igt_devs.filter_name);
> +		igt_device_list_filters();
> +		return false;
> +	}
> +
> +	fspec->filter_function();
> +
> +	return true;
> +}
> +
> +/*
> + * Returns: -1 (no card pointer was passed or card wasn't matched,
> + * 0 - card matched and returned.
> + */
> +int igt_device_card_match(const char *filter, struct igt_device_card
> *card)
> +{=09
> +	struct igt_device *dev =3D NULL;
> +	int ret =3D -1;
> +
> +	if (!card)
> +		return ret;
> +	memset(card, 0, sizeof(*card));
> +
> +	if (igt_device_set_filter(filter) =3D=3D false)
> +		return ret;
> +
> +	/* We take first one if more than one card matches filter */
> +	if (igt_devs.pci_devs_view->len) {
> +		struct vendor_spec *vs;
> +		dev =3D g_ptr_array_index(igt_devs.pci_devs_view, 0);
> +		vs =3D get_vendor_spec(dev->vendor);
> +		if (vs) {
> +			card->chipset =3D vs->chipset;
> +			strncpy(card->module, vs->module, NAME_MAX);
> +		}
> +		strncpy(card->pci_slot, get_prop_pci_slot(dev),
> +			PCI_SLOT_LENGTH);
> +		strncpy(card->card, dev->drm_card_path, NAME_MAX);
> +		strncpy(card->render, dev->drm_render_path, NAME_MAX);
> +		ret =3D 0;
> +	}
> +
> +	return ret;
> +}
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> new file mode 100644
> index 00000000..05bae1a6
> --- /dev/null
> +++ b/lib/igt_device_scan.h
> @@ -0,0 +1,64 @@
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
> +enum igt_devices_scan_type {
> +	IGT_SCAN_PCI           =3D (1 << 0),
> +	IGT_SCAN_PLATFORM      =3D (1 << 1),
> +};
> +
> +enum igt_devices_print_type {
> +	IGT_PRINT_SIMPLE,
> +	IGT_PRINT_DETAIL,
> +};
> +
> +#define PCI_SLOT_LENGTH 13
> +struct igt_device_card {
> +	unsigned int chipset; //contains DRIVER_XXX value
> +	char module[NAME_MAX];
> +	char card[NAME_MAX];
> +	char render[NAME_MAX];
> +	char pci_slot[PCI_SLOT_LENGTH];
> +};
> +
> +void igt_devices_scan(enum igt_devices_scan_type scantype, bool
> force);
> +void igt_devices_print(enum igt_devices_print_type printtype,
> +		       bool show_props, bool show_attrs);
> +
> +void igt_devices_print_vendors(void);
> +
> +bool igt_device_pci_unbind_module(const char *pci_slot);
> +bool igt_device_pci_bind_module(const char *pci_slot);
> +void igt_devices_bind_modules(void);
> +
> +void igt_device_list_filters(void);
> +bool igt_device_set_filter(const char *filter);
> +int igt_device_card_match(const char *filter, struct igt_device_card
> *card);
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
> index 00000000..48e1e881
> --- /dev/null
> +++ b/tools/lsgpu.c
> @@ -0,0 +1,222 @@
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
> +#include "igt_device_scan.h"
> +#include <sys/ioctl.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <signal.h>
> +
> +enum {
> +	OPT_SCAN_PCI       =3D 'P',
> +	OPT_SCAN_PLATFORM  =3D 'p',
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
> +bool g_help;
> +
> +static const char *usage_str =3D
> +	"usage: lsgpu [options]\n\n"
> +	"Options:\n"
> +	"  -P, --scan-pci              Scan PCI devices (default)\n"
> +	"  -p, --scan-platform         Scan platform devices\n"
> +	"  -r, --show-props            Show device properties\n"
> +	"  -a, --show-attrs            Show device attributes\n"
> +	"  -i, --print-simple          Print devices as simple list
> (default)\n"
> +	"  -d, --print-details         Print devices with details\n"
> +	"  -v, --list-vendors          List recognized vendors\n"
> +	"  -B, --bind-modules          Bind modules to unbound PCI
> cards\n"
> +	"  -u, --unbind-module pci_id  Unbind module from pci id
> device\n"
> +	"  -b, --bind-module pci_id    Bind module to pci id device\n"
> +	"  -l, --list-filters          List registered device
> filters\n"
> +	"  -s, --set-filter filter     Set filter for processing
> devices\n"
> +	"  -m, --match-device filter   Find device matching to
> filter\n"
> +	"  -h, --help                  Show this help message and
> exit\n";
> +
> +int main(int argc, char *argv[])
> +{
> +	static struct option long_options[] =3D {
> +		{"scan-pci",          no_argument,       NULL,
> OPT_SCAN_PCI},
> +		{"scan-platform",     no_argument,       NULL,
> OPT_SCAN_PLATFORM},
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
> +		{"list-filters",      no_argument,       NULL,
> OPT_LIST_FILTERS},
> +		{"set-filter",        required_argument, NULL,
> OPT_SET_FILTER},
> +		{"match-device",      required_argument, NULL,
> OPT_MATCH_DEVICE},
> +		{"help",              no_argument,       NULL,
> OPT_HELP},
> +		{0, 0, 0, 0}
> +	};
> +	int c, index =3D 0, scantype =3D 0;
> +	enum igt_devices_print_type printtype =3D IGT_PRINT_SIMPLE;
> +
> +	while ((c =3D getopt_long(argc, argv, "PpraidvBu:b:ls:m:h",
> +				long_options, &index)) !=3D -1) {
> +		switch(c) {
> +		case OPT_SCAN_PCI:
> +			scantype |=3D IGT_SCAN_PCI;
> +			break;
> +		case OPT_SCAN_PLATFORM:
> +			scantype |=3D IGT_SCAN_PLATFORM;
> +			break;
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
> +	if (!scantype) //if no scantype choosen set pci scanning
> +		scantype |=3D IGT_SCAN_PCI;
> +
> +	igt_devices_scan(scantype, false);
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
> +		igt_device_list_filters();
> +		return 0;
> +	}
> +
> +	if (g_filter) {
> +		igt_device_set_filter(g_filter);
> +	}
> +
> +	if (g_match_filter) {
> +		struct igt_device_card card;
> +		int fd;
> +		if (igt_device_card_match(g_match_filter, &card) =3D=3D 0)
> {
> +			printf("PCI slot    : %s\n", card.pci_slot);
> +			printf("drm card    : %s\n", card.card);
> +			printf("drm render  : %s\n", card.render);
> +			printf("drv chipset : %x\n", card.chipset);
> +			printf("drv module  : %s\n", card.module);
> +		} else {
> +			printf("No device matching filter [%s]
> found.\n",
> +			       g_match_filter);
> +			return 0;
> +		}
> +
> +		fd =3D __drm_open_driver(DRIVER_ANY);
> +		if (fd >=3D 0) {
> +			printf("Device %s successfully opened\n",
> card.card);
> +			close(fd);
> +		}
> +
> +		fd =3D __drm_open_driver_render(DRIVER_ANY);
> +		if (fd >=3D 0) {
> +			printf("Device %s successfully opened\n",
> card.render);
> +			close(fd);
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

--=-L2OTYy4WLgtT7R8iryYW
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
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MDEyMDU3MzlaMCMGCSqGSIb3DQEJBDEWBBTs2RbN
LOZmk8QJv8vpwmGAH0d5UzANBgkqhkiG9w0BAQEFAASCAQCWkIStGiEu28GM8cGt4b9ChlZh4Pdb
7//SZqtx8BAAfkNMvkk6WC4EbZXd42njCF5Cbf3cBUViyDBVuWweLNhCRh9GsRjOgQC7yezb3fGp
9KzVtzFDjlItOy9rhHnRGRBeO5J624mfYFvpYw/0ddHKN3RQbnJKdpDoimwlpg0EYDT26e/OlYpm
d9qV+BwmiKI1Ba5+WbeeyxvPaCi8N3aODAZtxuqDjdftZoj4HgQ9ikoGUgOPxce+FXJSm5bV+3HE
+n731FLpmvA/RjKbKmePmDee3mjDxATUb8NC9q8HaKo05jPje/02SlyK5uWEC0HH3g6ZpdQTvnow
F1Xd0J6sAAAAAAAA


--=-L2OTYy4WLgtT7R8iryYW--

--===============0671414421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0671414421==--
