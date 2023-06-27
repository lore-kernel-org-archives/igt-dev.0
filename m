Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B354B10E317
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 16:12:37 +0000 (UTC)
Date: Tue, 27 Jun 2023 18:09:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230627160933.otbknb2s4mcvnrs7@kamilkon-desk1>
References: <20230625122948.535456-1-priyanka.dandamudi@intel.com>
 <20230625122948.535456-4-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230625122948.535456-4-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] xe/xe_sysfs_preempt_timeout: Verify
 preempt_timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tejas.upadhyay@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,

On 2023-06-25 at 17:59:46 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Basic tests idempotent and invalid are added to verify
> preempt_timeout for each engine.
> It verifies whether parameter value within in the range.
> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/meson.build                   |   1 +
>  tests/xe/xe_sysfs_preempt_timeout.c | 139 ++++++++++++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 tests/xe/xe_sysfs_preempt_timeout.c
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index b24bae5c..ea6c9239 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -271,6 +271,7 @@ xe_progs = [
>  	'xe_waitfence',
>  	'xe_spin_batch',
>  	'xe_sysfs_defaults',
> +	'xe_sysfs_preempt_timeout',

Why not just one test xe_sysfs_scheduler and adding more subtests
into it? So we can limit number of files.

>  ]
>  
>  msm_progs = [
> diff --git a/tests/xe/xe_sysfs_preempt_timeout.c b/tests/xe/xe_sysfs_preempt_timeout.c
> new file mode 100644
> index 00000000..5a357128
> --- /dev/null
> +++ b/tests/xe/xe_sysfs_preempt_timeout.c
> @@ -0,0 +1,139 @@
> +/*
> + * Copyright © 2023 Intel Corporation
> + *
> + * Permission is hereby ggit ranted, free of charge, to any person obtaining a

Same here, use SPDX.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <dirent.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: xe sysfs preempt timeout
> + * Run type: FULL
> + *
> + * SUBTEST: idempotent
> + * Description: Test to check whether the preempt_timeout_us parameter reports the values set.
> + * Test category: SysMan
> + *
> + * SUBTEST: invalid
> + * Description: Test to check if preempt_timeout parameter rejects any unrepresentable intervals.
> + * Test category: SysMan
> + */
> +
> +#define ATTR "preempt_timeout_us"
> +#define ATTR_MIN "preempt_timeout_min"
> +#define ATTR_MAX "preempt_timeout_max"
> +
> +static void set_preempt_timeout(int engine, unsigned int value)
> +{
> +	unsigned int delay;
> +
> +	igt_assert_lte(0, igt_sysfs_printf(engine, ATTR, "%u", value));
> +	igt_sysfs_scanf(engine, ATTR, "%u", &delay);
> +	igt_assert_eq(delay, value);
> +}
> +
> +static void test_idempotent(int xe, int engine)
> +{
> +	unsigned int delays[] = { 1, 1000, 1234, 54321 };
> +	unsigned int saved;
> +
> +	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
> +	igt_debug("Initial %s:%u\n", ATTR, saved);
> +
> +	for (int i = 0; i < ARRAY_SIZE(delays); i++)
> +		set_preempt_timeout(engine, delays[i]);
> +
> +	set_preempt_timeout(engine, saved);
> +}
> +
> +static void test_invalid(int xe, int engine)
> +{
> +	unsigned int saved, set;
> +	unsigned int min, max;
> +
> +	igt_sysfs_scanf(engine, ATTR_MAX, "%u", &max);
> +	igt_sysfs_scanf(engine, ATTR_MIN, "%u", &min);
> +
> +	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
> +	igt_debug("Initial %s:%u\n", ATTR, saved);
> +
> +	igt_sysfs_printf(engine, ATTR, "%d", max+1);
> +	igt_sysfs_scanf(engine, ATTR, "%u", &set);
> +	igt_assert_eq(set, saved);
> +
> +	igt_sysfs_printf(engine, ATTR, "%d", min-1);
> +	igt_sysfs_scanf(engine, ATTR, "%u", &set);
> +	igt_assert_eq(set, saved);
> +}
> +
> +igt_main
> +{
> +	static const struct {
> +		const char *name;
> +		void (*fn)(int, int);
> +	} tests[] = {
> +		{ "idempotent", test_idempotent },
> +		{ "invalid", test_invalid },
> +		{ }
> +	};
> +	int xe = -1;
> +	int sys;
> +	int gt;
> +
> +	igt_fixture {
> +		xe = drm_open_driver(DRIVER_XE);
> +		xe_device_get(xe);
> +
> +		sys = igt_sysfs_open(xe);
> +		igt_require(sys != -1);
> +	}
> +
> +	for (typeof(*tests) *t = tests; t->name; t++)
> +	    igt_subtest_with_dynamic(t->name) {
> +		    xe_for_each_gt(xe, gt) {
> +			    int engines = -1;
> +			    char buf[100];
> +
> +			    sprintf(buf, "device/gt%d/engines", gt);
> +			    engines = openat(sys, buf, O_RDONLY);
> +			    igt_require(engines != -1);
> +
> +			    igt_sysfs_engines(xe, engines, ATTR, t->fn);
> +
> +			    close(engines);
> +			}
> +		}
> +
> +	igt_fixture {
> +		close(sys);
> +		xe_device_put(xe);
> +		close(xe);

May we wait a little here? There is patchset by Bhanuprakash
with drm_close_driver() which may help here and with open above.

Regards,
Kamil

> +	}
> +}
> +
> -- 
> 2.25.1
> 
