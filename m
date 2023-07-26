Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AC210E04B
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 17:54:18 +0000 (UTC)
Date: Wed, 26 Jul 2023 19:54:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230726175414.li26piwnirqy3vct@kamilkon-desk1>
References: <20230725121852.3749558-1-himal.prasad.ghimiray@intel.com>
 <20230725173013.val5xlhg4uffj6iq@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230725173013.val5xlhg4uffj6iq@kamilkon-desk1>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/1] tests/xe/xe_uevent: add new test
 for uevent gt reset failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-07-25 at 19:30:13 +0200, Kamil Konieczny wrote:
> Hi Himal,
> 
> On 2023-07-25 at 17:48:52 +0530, Himal Prasad Ghimiray wrote:
> > This test is to cause the fake reset failure and capture the uevent
> > sent in case of gt reset failure. We are relying on debugfs to
> > cause fake reset failure because there is no hardware mechanism using
> > which we can force gt to fail its reset.
> > 
> > v2:
> > - Make fake reset for all GT's in platform.
> > - Add test names in order (Rahul)
> > - Add headers in order.
> > - Instead of system call use igt helper for reading debugfs.
> > - Use igt_debug instead of prints.
> > - Use break instead of unnecessary goto.
> > - Change test name.
> > - Define values as constants. (Kamil)
> > 
> > v3:
> > - Use fault injection exposed debugfs.
> > 
> > v4:
> > - Use pci subsystem for uevent listening.
> > 
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> > The sending of Uevent and fault injection is handled by:
> > https://patchwork.freedesktop.org/series/120919/
> > 
> >  tests/meson.build    |   1 +
> >  tests/xe/xe_uevent.c | 130 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 131 insertions(+)
> >  create mode 100644 tests/xe/xe_uevent.c
> > 
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 944a0941f..b9f0a9c15 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -291,6 +291,7 @@ xe_progs = [
> >  	'xe_prime_self_import',
> >  	'xe_query',
> >  	'xe_sysfs_tile',
> > +	'xe_uevent',
> >  	'xe_vm',
> >  	'xe_waitfence',
> >  	'xe_spin_batch',
> > diff --git a/tests/xe/xe_uevent.c b/tests/xe/xe_uevent.c
> > new file mode 100644
> > index 000000000..aabeb89b8
> > --- /dev/null
> > +++ b/tests/xe/xe_uevent.c
> > @@ -0,0 +1,130 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: cause fake gt reset failure and listen uevent from KMD
> > + * SUBTEST:fake_reset_uevent_listener
> > + * Description:
> > + *		Test creates uevent listener and causes fake reset failure for gt0
> > + *		and returns success if uevent is sent by driver and listened by listener.
> > + */
> > +
> > +#include <libudev.h>
> > +#include <string.h>
> > +#include <sys/stat.h>
> > +
> > +#include "igt.h"
> > +
> > +#include "xe_drm.h"
> > +#include "xe/xe_ioctl.h"
> > +#include "xe/xe_query.h"
> > +
> > +static bool xe_fail_gt_reset(int fd, int gt)
> > +{
> > +	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
> > +	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
> > +
> > +	xe_force_gt_reset(fd, gt);
> > +
> > +	return true;
> -------------- ^^^^
> Better make this function void with no return.
> 
> > +}
> > +
> > +static bool listen_reset_fail_uevent(struct udev_device *device, const char *source, int gt_id)
> > +{
> > +	struct udev_list_entry *list_entry;
> > +	bool dev_needs_reset = false;
> > +	bool reset_unit_is_gt = false;
> > +	bool gt_id_matches = false;
> > +	const char *name, *val;
> > +
> > +	udev_list_entry_foreach(list_entry, udev_device_get_properties_list_entry(device))
> > +	{
> > +		name = udev_list_entry_get_name(list_entry);
> > +		val = udev_list_entry_get_value(list_entry);
> > +
> > +		if (!strcmp(name, "DEVICE_STATUS") && !strcmp(val, "NEEDS_RESET")) {
> > +			igt_debug("%s = %s\n", name, val);
> > +			dev_needs_reset = true;
> > +			continue;
> > +		}
> > +
> > +		if (!strcmp(name, "RESET_FAILED") && !strcmp(val, "gt")) {
> > +			igt_debug("%s = %s\n", name, val);
> > +			reset_unit_is_gt = true;
> > +			continue;
> > +		}
> > +
> > +		if (!strcmp(name, "RESET_ID") && (atoi(val) == gt_id)) {
> > +			igt_debug("%s = %s\n", name, val);
> > +			gt_id_matches = true;
> > +			continue;
> > +		}
> > +	}
> > +
> > +	return (dev_needs_reset && reset_unit_is_gt && gt_id_matches);
> > +}
> > +
> > +static void fake_reset_uevent_listener(int fd, int gt_id)
> > +{
> > +	struct udev *udev;
> > +	struct udev_device *dev;
> > +	struct udev_monitor *mon;
> > +	bool event_received = false;
> > +	bool event_sent = false;
> > +	const u32 listener_timeout = 5;
> > +
> > +	/* create udev object */
> > +	udev = udev_new();
> > +	if (!udev)
> > +		igt_assert_f(false, "New udev object creation failed");
> > +
> > +	mon = udev_monitor_new_from_netlink(udev, "kernel");
> > +	udev_monitor_filter_add_match_subsystem_devtype(mon, "pci", NULL);
> > +	udev_monitor_enable_receiving(mon);
> > +	igt_until_timeout(listener_timeout) {
> > +		if (event_sent) {
> > +			dev = udev_monitor_receive_device(mon);
> > +			if (dev) {
> > +				event_received = listen_reset_fail_uevent(dev, "kernel", gt_id);
> > +				udev_device_unref(dev);
> > +			}
> > +		}
> > +
> > +		if (event_received)
> > +			break;
> 
> > +
> > +		if (!event_sent)
> > +			event_sent = xe_fail_gt_reset(fd, gt_id);
> ----------------------- ^^^^^^^^^^^^
> This looks like the only purpose function return true is to set
> this var here. Loop looks convoluted, why not:
> 
> 	igt_until_timeout(listener_timeout) {
> 		if (event_sent) {
> 			...your old code here...
> 		} else {
> 			event_sent = true;
> 			xe_fail_gt_reset(fd, gt_id);
> 		}
> 
> 
> > +			}
> > +		}
> > +	}
> 
> Add newline here.
> 
> > +	udev_unref(udev);
> ------------ ^
> Why unref here?

Sorry, it is other unref and is ok here,

Regards,
Kamil

> 
> > +	igt_assert_f(event_received, "Event not received");
> > +}
> > +
> > +igt_main
> > +{
> > +	int fd;
> > +	int gt;
> > +	const u32 settle_xe_load_uevents = 50000;
> > +
> > +	igt_fixture {
> > +		fd = drm_open_driver(DRIVER_XE);
> > +		xe_device_get(fd);
> --------------- ^
> Not needed as drm_open_driver will do this.
> 
> > +	}
> > +
> > +	/* Ensures uevents triggered in case of driver
> > +	 * load are settled down.
> > +	 */
> > +	usleep(settle_xe_load_uevents);
> > +
> > +	igt_subtest("fake_reset_uevent_listener")
> > +		xe_for_each_gt(fd, gt) {
> > +			fake_reset_uevent_listener(fd, gt);
> > +		}
> > +
> > +	igt_fixture {
> > +		xe_device_put(fd);
> --------------- ^
> > +		close(fd);
> --------------- ^
> Same here, just use drm_close_driver(fd);
> 
> Regards,
> Kamil
> 
> > +	}
> > +}
> > -- 
> > 2.25.1
> > 
