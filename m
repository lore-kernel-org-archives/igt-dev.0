Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B4E10E24E
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 09:36:03 +0000 (UTC)
Date: Fri, 9 Jun 2023 11:35:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230609093558.lxt65lzbseb7fw55@kamilkon-desk1>
References: <20230605055059.2942855-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230605055059.2942855-1-himal.prasad.ghimiray@intel.com>
Subject: Re: [igt-dev] [i-g-t,
 1/1] Uevent listener for fake gt reset failure.
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

Hi Himal,

please do not put dot at the end of subject:

Uevent listener for fake gt reset failure.
-----------------------------------------^

Remove this '.' from the end. Also please add at begin what
part of igt you modify, here it is adding new xe test so:

tests/xe/xe_uevent: add new test for uevent gt reset failure

On 2023-06-05 at 11:20:59 +0530, Himal Prasad Ghimiray wrote:
> This test is to cause the fake reset failure and capture the uevent
--------------------------- ^^^^
Describe why we need a fake one, not real one.

> sent in case of gt reset failure.
> 
> The sending of Uevent is taken care by series:
> drm/xe: Notify Userspace when engine/gt reset fails.

Please write here link to public patchwork or GitLab or, if you
prefer to not include it inot this description, put it after
signed-off-by line and afer "---" line, see below.

> 
> The infra to cause fake reset failure is in series:
> drm/xe: Add a debugfs for faking gt reset failure.

Same here, please also provide link.

> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---

---
Write here other comments or links which you do not want to be merged.


>  tests/meson.build                             |   1 +
>  .../xe_uevent_listener_fake_reset_failure.c   | 128 ++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 tests/xe/xe_uevent_listener_fake_reset_failure.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index f71be1db..cc5843d7 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -268,6 +268,7 @@ xe_progs = [
>  	'xe_query',
>  	'xe_vm',
>  	'xe_waitfence',
> +	'xe_uevent_listener_fake_reset_failure',
----------------- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is too long for a name and also looks like one-only test,
so please make it short, something like:

	'xe_uevent',

This way we can extend it in future for new subtests.
Also, as noted by Rahul, keep it sorted alphabetiacally.

>  ]
>  
>  msm_progs = [
> diff --git a/tests/xe/xe_uevent_listener_fake_reset_failure.c b/tests/xe/xe_uevent_listener_fake_reset_failure.c
> new file mode 100644
> index 00000000..dd22e4c2
> --- /dev/null
> +++ b/tests/xe/xe_uevent_listener_fake_reset_failure.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: cause fake gt reset failure and listen uevent from KMD
> + * SUBTEST:fake_reset_uevent_listener
> + * Description:
> + *		Test creates uevent listener and causes fake reset failure for gt0
> + *		and returns success if uevent is sent by driver and listened by listener.
> + */
> +
> +#include "igt.h"
------------ ^
> +#include "xe_drm.h"
------------ ^
Keep includes sorted alphabetically, also please put system
includes first, then write one newline, then igt includes.
> +#include "xe/xe_query.h"

Newline here to separate system and igt includes.

> +#include <string.h>
------------ ^
> +#include <libudev.h>
------------ ^
> +#include <sys/stat.h>
------------ ^
Same here, sort them and swap (first system headers, then igt).

> +
> +static bool xe_force_gt_fake_reset(int fd, int gt)
> +{
> +	char reset_string[128];
> +	struct stat st;
> +
> +	igt_assert_eq(fstat(fd, &st), 0);
> +	snprintf(reset_string, sizeof(reset_string),
> +		 "cat /sys/kernel/debug/dri/%d/gt%d/fake_reset_failure", minor(st.st_rdev), gt);
----------------- ^
Just open and write to this file, search for igt helper in lib.

> +
> +	if (system(reset_string))
----------- ^
Direct write is better for error handling.

> +		return false;
> +
> +	return true;
> +}
> +
> +static bool listen_reset_fail_uevent(struct udev_device *device, const char *source, int gt_id)
> +{
> +	struct udev_list_entry *list_entry;
> +	bool reset_failed = false;
> +	bool reset_unit_is_gt = false;
> +	bool gt_id_matches = false;
> +	const char *name, *val;
> +
> +	udev_list_entry_foreach(list_entry, udev_device_get_properties_list_entry(device))
> +	{
> +		name = udev_list_entry_get_name(list_entry);
> +		val = udev_list_entry_get_value(list_entry);
> +
> +		if (!strcmp(name, "RESET_FAILED") && !strcmp(val, "1")) {
> +			printf("%s = %s\n", name, val);
----------------------- ^
Do not use printf, use igt_debug or igt_info. Use of igt_debug
is preferable as to not clobber output.

> +			reset_failed = true;
> +			continue;
> +		}
> +
> +		if (!strcmp(name, "RESET_UNIT") && !strcmp(val, "gt")) {
> +			printf("%s = %s\n", name, val);
----------------------- ^
Same here.

> +			reset_unit_is_gt = true;
> +			continue;
> +		}
> +
> +		if (!strcmp(name, "RESET_ID") && (atoi(val) == gt_id)) {
> +			printf("%s = %s\n", name, val);
----------------------- ^
Same here.

> +			gt_id_matches = true;
> +			continue;
> +		}
> +	}
> +
> +	return (reset_failed && reset_unit_is_gt && gt_id_matches);
> +}
> +
> +static void fake_reset_uevent_listener(int fd, int gt_id)
> +{
> +	struct udev *udev;
> +	struct udev_device *dev;
> +	struct udev_monitor *mon;
> +	bool event_recieved = false;
> +	bool event_sent = false;
> +
> +	/* create udev object */
> +	udev = udev_new();
> +	if (!udev) {
> +		fprintf(stderr, "Can't create udev\n");
--------------- ^
use igt_debug

> +		goto no_udev;
--------------- ^
Instead of goto please use igt_assert_f(false, "describe fail here\n");

> +	}
> +
> +	mon = udev_monitor_new_from_netlink(udev, "kernel");
> +	udev_monitor_filter_add_match_subsystem_devtype(mon, "drm", "drm_minor");
> +	udev_monitor_enable_receiving(mon);
> +	igt_until_timeout(5) {
------------------------- ^
Write it as define or constant.

> +			dev = udev_monitor_receive_device(mon);
> +
> +			if (dev) {
> +				event_recieved = listen_reset_fail_uevent(dev, "kernel", gt_id);
> +				udev_device_unref(dev);
> +			}
> +
> +			if (event_sent)
> +				goto free_udev;
------------------------------- ^
Just
				break;

is imho better.

> +
> +		event_sent = xe_force_gt_fake_reset(fd, gt_id);
> +		usleep(50 * 1000);
---------------------- ^
Write it as define or constant also comment why you want to sleep here.

> +	}
> +
> +free_udev:
> +	udev_unref(udev);
> +no_udev:
> +	igt_assert(event_recieved);
> +}
> +
> +igt_main
> +{
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +	}
> +
> +	usleep(50 * 1000);
------- ^
Do not make such sleeps here, why do you need it here?

Regards,
Kamil

> +
> +	igt_subtest("fake_reset_uevent_listener")
> +		fake_reset_uevent_listener(fd, 0);
> +
> +	igt_fixture {
> +		xe_device_put(fd);
> +		close(fd);
> +	}
> +}
> -- 
> 2.25.1
> 
