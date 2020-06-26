Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9E06E184
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jun 2020 08:55:14 +0000 (UTC)
From: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
Date: Fri, 26 Jun 2020 08:55:09 +0000
Message-ID: <6cf13722d1e4029aa1d6788752573cc497ebcfae.camel@intel.com>
References: <20200626063045.5207-1-marcin.bernatowicz@intel.com>
 <20200626084710.GB5425@kdec5-desk.ger.corp.intel.com>
In-Reply-To: <20200626084710.GB5425@kdec5-desk.ger.corp.intel.com>
Content-Language: en-US
Content-ID: <41283AE3B245A1428142070DE5BDCC35@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC,
 i-g-t] tests/device_reset: Test device sysfs reset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dec, Katarzyna" <katarzyna.dec@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Winiarski, Michal" <michal.winiarski@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2020-06-26 at 10:47 +0200, Katarzyna Dec wrote:
> On Fri, Jun 26, 2020 at 08:30:45AM +0200, Marcin Bernatowicz wrote:
> > Device reset is initiated by writing "1" to reset sysfs file,
> > which should initiatie device FLR if supported by device.
> > 
> > Test scenarios:
> > 1. unbind driver from device then rebind
> > 2. unbind driver from device, initiate sysfs reset, rebind driver
> > to
> > device
> > 3. device reset with bound driver
> > 
> > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
> > ---
> >  tests/device_reset.c | 298
> > +++++++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build    |   1 +
> >  2 files changed, 299 insertions(+)
> >  create mode 100644 tests/device_reset.c
> > 
> > diff --git a/tests/device_reset.c b/tests/device_reset.c
> > new file mode 100644
> > index 000000000..bafe9fd41
> > --- /dev/null
> > +++ b/tests/device_reset.c
> > @@ -0,0 +1,298 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright(c) 2020 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#include <fcntl.h>
> > +#include <sys/stat.h>
> > +#include "igt.h"
> > +#include "igt_device_scan.h"
> > +#include "igt_sysfs.h"
> > +
> > +IGT_TEST_DESCRIPTION("Examine behavior of a driver on device sysfs
> > reset");
> > +
> > +
> > +#define DEV_PATH_LEN 80
> > +#define DEV_BUS_ADDR_LEN 13 /* addr has form 0000:00:00.0 */
> > +
> > +/**
> > + * Helper structure containing sysfs file descriptors
> > + * and path related to tested device
> > + */
> > +struct sysfs_fds {
> > +	struct {
> > +		int dev;
> > +		int dev_dir;
> > +		int drv_dir;
> > +	} fds;
> > +	char dev_bus_addr[DEV_BUS_ADDR_LEN];
> > +};
> > +
> > +static int __open_sysfs_dir(int fd, const char* path)
> > +{
> > +	int sysfs;
> > +
> > +	sysfs = igt_sysfs_open(fd);
> > +	if (sysfs < 0) {
> > +		return -1;
> > +	}
> > +
> > +	return openat(sysfs, path, O_DIRECTORY);
> > +}
> > +
> > +static int open_device_sysfs_dir(int fd)
> > +{
> > +	return __open_sysfs_dir(fd, "device");
> > +}
> > +
> > +static int open_driver_sysfs_dir(int fd)
> > +{
> > +	return __open_sysfs_dir(fd, "device/driver");
> > +}
> > +
> > +/**
> > + * device_sysfs_path:
> > + * @fd: opened device file descriptor
> > + * @path: buffer to store sysfs path to device directory
> > + *
> > + * Returns:
> > + * On successfull path resolution sysfs path to device directory,
> > + * NULL otherwise
> > + */
> > +static char *device_sysfs_path(int fd, char *path)
> > +{
> > +	char sysfs[DEV_PATH_LEN];
> > +
> > +	if (!igt_sysfs_path(fd, sysfs, sizeof(sysfs)))
> > +		return NULL;
> > +
> > +	if (DEV_PATH_LEN <= (strlen(sysfs) + strlen("/device")))
> > +		return NULL;
> > +
> > +	strcat(sysfs, "/device");
> > +
> > +	return realpath(sysfs, path);
> > +}
> > +
> > +static void init_sysfs_fds(struct sysfs_fds *sysfs)
> > +{
> > +	char dev_path[PATH_MAX];
> > +	char *addr_pos;
> > +
> > +	igt_debug("open device\n");
> > +	/**
> > +	 * As subtests must be able to close examined devices
> > +	 * completely, don't use drm_open_driver() as it keeps
> > +	 * a device file descriptor open for exit handler use.
> > +	 */
> > +	sysfs->fds.dev = __drm_open_driver(DRIVER_ANY);
> > +	igt_assert_fd(sysfs->fds.dev);
> > +
> > +	igt_assert(device_sysfs_path(sysfs->fds.dev, dev_path));
> > +	addr_pos = strrchr(dev_path, '/');
> > +	snprintf(sysfs->dev_bus_addr, sizeof(sysfs->dev_bus_addr),
> > +		 "%s", (addr_pos ? addr_pos + 1 : ""));
> > +	igt_assert(sysfs->dev_bus_addr[0]);
> > +
> > +	sysfs->fds.dev_dir = open_device_sysfs_dir(sysfs->fds.dev);
> > +	igt_assert_fd(sysfs->fds.dev_dir);
> > +
> > +	sysfs->fds.drv_dir = open_driver_sysfs_dir(sysfs->fds.dev);
> > +	igt_assert_fd(sysfs->fds.drv_dir);
> > +}
> > +
> > +static int close_if_opened(int *fd)
> > +{
> > +	int rc = 0;
> > +	if (fd && *fd != -1) {
> > +		rc = close(*fd);
> > +		*fd = -1;
> > +	}
> > +	return rc;
> > +}
> > +
> > +static void open_if_closed(struct sysfs_fds *sysfs)
> > +{
> > +	if (sysfs->fds.dev == -1) {
> > +		/* refresh device list */
> > +		igt_devices_scan(true);
> > +		igt_debug("reopen the device\n");
> > +		sysfs->fds.dev = __drm_open_driver(DRIVER_ANY);
> > +	}
> > +	igt_assert_fd(sysfs->fds.dev);
> > +}
> > +
> > +static void cleanup_sysfs_fds(struct sysfs_fds *sysfs)
> > +{
> > +	close_if_opened(&sysfs->fds.dev);
> > +	close_if_opened(&sysfs->fds.dev_dir);
> > +	close_if_opened(&sysfs->fds.drv_dir);
> > +	sysfs->dev_bus_addr[0] = '\0';
> > +}
> > +
> > +
> > +/**
> > + * is_sysfs_reset_supported:
> > + * @fd: opened device file descriptor
> > + *
> > + * Check if device supports reset based on sysfs file presence.
> > + *
> > + * Returns:
> > + * True if device supports reset, false otherwise.
> > + */
> > +static bool is_sysfs_reset_supported(int fd)
> > +{
> > +	struct stat st;
> > +	int rc;
> > +	int sysfs;
> > +	int reset_fd = -1;
> > +
> > +	sysfs = igt_sysfs_open(fd);
> > +
> > +	if (sysfs >= 0) {
> > +		reset_fd = openat(sysfs, "device/reset", O_WRONLY);
> > +		close(sysfs);
> > +	}
> > +
> > +	if (reset_fd < 0)
> > +		return false;
> > +
> > +	rc = fstat(reset_fd, &st);
> > +	close(reset_fd);
> > +
> > +	if (rc || !S_ISREG(st.st_mode))
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +/* Unbind the driver from the device */
> > +static void driver_unbind(struct sysfs_fds *sysfs)
> > +{
> > +	igt_debug("unbind the driver from the device\n");
> > +	igt_assert(igt_sysfs_set(sysfs->fds.drv_dir, "unbind",
> > +		   sysfs->dev_bus_addr));
> > +}
> > +
> > +/* Re-bind the driver to the device */
> > +static void driver_bind(struct sysfs_fds *sysfs)
> > +{
> > +	igt_debug("rebind the driver to the device\n");
> > +	igt_abort_on_f(!igt_sysfs_set(sysfs->fds.drv_dir, "bind",
> > +		       sysfs->dev_bus_addr), "driver rebind failed");
> > +}
> > +
> > +/* Initiate device reset */
> > +static void initiate_device_reset(struct sysfs_fds *sysfs)
> > +{
> > +	igt_debug("reset device\n");
> > +	igt_assert(igt_sysfs_set(sysfs->fds.dev_dir, "reset", "1"));
> > +}
> > +
> > +/**
> > + * healthcheck:
> > + * @sysfs: structure with device descriptor, if descriptor equals
> > -1
> > + * 	   the device is reopened
> > + */
> > +static void healthcheck(struct sysfs_fds *sysfs)
> > +{
> > +	open_if_closed(sysfs);
> > +	gem_test_engine(sysfs->fds.dev, ALL_ENGINES);
> 
> This test is located in tests/ and looks like could be applicable to
> any
> device. If that is true - gem_test_engine is from i915 familiy. Is
> there a way
> to test engines for any driver? Naming is one thing, but what if amd
> card will
> try to execute engines with i915 functions?
> 
> Kasia

healthcheck is used in subtest_group where igt_require_intel is
prerequisite, so the tests will be skipped on non intel platforms

> > +}
> > +
> > +/**
> > + * set_device_filter:
> > + *
> > + * Sets device filter to ensure subtests always reopen the same
> > device
> > + *
> > + * @dev_path: path to device under tests
> > + */
> > +static void set_device_filter(const char* dev_path)
> > +{
> > +	char filter[strlen("sys:") + strlen(dev_path) + 1];
> > +
> > +	snprintf(filter, sizeof(filter), "sys:%s", dev_path);
> > +	igt_device_filter_free_all();
> > +	igt_assert_eq(igt_device_filter_add(filter), 1);
> > +}
> > +
> > +static void unbind_rebind(struct sysfs_fds *sysfs)
> > +{
> > +	igt_debug("close the device\n");
> > +	close_if_opened(&sysfs->fds.dev);
> > +
> > +	driver_unbind(sysfs);
> > +
> > +	driver_bind(sysfs);
> > +}
> > +
> > +static void unbind_reset_rebind(struct sysfs_fds *sysfs)
> > +{
> > +	igt_debug("close the device\n");
> > +	close_if_opened(&sysfs->fds.dev);
> > +
> > +	driver_unbind(sysfs);
> > +
> > +	initiate_device_reset(sysfs);
> > +
> > +	driver_bind(sysfs);
> > +}
> > +
> > +igt_main
> > +{
> > +	struct sysfs_fds sysfs;
> > +
> > +	igt_fixture {
> > +		char dev_path[PATH_MAX];
> > +
> > +		igt_debug("opening device\n");
> > +		init_sysfs_fds(&sysfs);
> > +
> > +		/* Make sure subtests always reopen the same device */
> > +		igt_assert(device_sysfs_path(sysfs.fds.dev, dev_path));
> > +		set_device_filter(dev_path);
> > +
> > +		igt_skip_on(!is_sysfs_reset_supported(sysfs.fds.dev));
> > +
> > +		igt_set_timeout(60, "device reset tests timed out after
> > 60s");
> > +	}
> > +
> > +	igt_describe("Tests driver unbind from/rebind to device
> > sequence");
> > +	igt_subtest("unbind-rebind")
> > +		unbind_rebind(&sysfs);
> > +
> > +	igt_describe("Unbinds driver from device, initiates reset"
> > +		     " then rebinds driver to device");
> > +	igt_subtest("unbind-reset-rebind")
> > +		unbind_reset_rebind(&sysfs);
> > +
> > +	igt_describe("Resets device with bound driver");
> > +	igt_subtest("reset-bound")
> > +		initiate_device_reset(&sysfs);
> > +
> > +	igt_describe("Subtests with additional healthchecks");
> > +	igt_subtest_group {
> > +		igt_fixture {
> > +			open_if_closed(&sysfs);
> > +			igt_require_intel(sysfs.fds.dev);
> > +		}
> > +
> > +		igt_subtest("healthcheck")
> > +			healthcheck(&sysfs);
> > +
> > +		igt_subtest("unbind-reset-rebind-healthcheck") {
> > +			unbind_reset_rebind(&sysfs);
> > +			healthcheck(&sysfs);
> > +		}
> > +
> > +		igt_subtest("reset-bound-healthcheck") {
> > +			initiate_device_reset(&sysfs);
> > +			healthcheck(&sysfs);
> > +		}
> > +	}
> > +
> > +	igt_fixture {
> > +		igt_reset_timeout();
> > +		cleanup_sysfs_fds(&sysfs);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 28091794f..b0acdf7c0 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -8,6 +8,7 @@ test_progs = [
> >  	'core_setmaster_vs_auth',
> >  	'debugfs_test',
> >  	'dmabuf',
> > +	'device_reset',
> >  	'drm_import_export',
> >  	'drm_mm',
> >  	'drm_read',
> > -- 
> > 2.25.1
> > 
---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Sowackiego 173 | 80-298 Gdask | Sd Rejonowy Gdask Pnoc | VII Wydzia Gospodarczy Krajowego Rejestru Sdowego - KRS 101882 | NIP 957-07-52-316 | Kapita zakadowy 200.000 PLN.
Ta wiadomo wraz z zacznikami jest przeznaczona dla okrelonego adresata i moe zawiera informacje poufne. W razie przypadkowego otrzymania tej wiadomoci, prosimy o powiadomienie nadawcy oraz trwae jej usunicie; jakiekolwiek przegldanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
