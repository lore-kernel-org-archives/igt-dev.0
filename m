Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB742C48BC1
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 15:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD3610E1F4;
	Wed, 14 Feb 2024 15:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XFvyzbxQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61AD10E37E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 15:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707923307; x=1739459307;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3OXTpH5epuHZu25bSgQifFi95hbiNCVQlDH9rxulgOc=;
 b=XFvyzbxQak1Pvv8Wh08z+OccP/zBM5p9YBz+1vooE7ZqD9tGTcNoXilh
 rGzWjxpyl4MMpKoO4+9oxmGHvWTOp9nXIHMy6T7vFh2a2gnIYdXFfLuww
 arfe++4CAxcKIaLq2hHmqMbHw/WKTSOoRKQxYMO3Pbr/91Gz9aEu4cdmK
 EbUfWer2B3YxtRlSoeIAPQofFFk/cOARc475V2daIbfl8XMm5kI8ckcdr
 dfVDFKKVPp0mr5zrDLmn8Boe6b3MAfTmiwUWRb2+zH5FHCA9/K/6FsqxR
 F84dScOuMSFCgbkxFiQOdHlZ8FijmuDJb2355JPrumgfLHLApomUVpen3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2350751"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2350751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 07:08:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3205663"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 07:08:24 -0800
Date: Wed, 14 Feb 2024 16:08:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH i-g-t] i915/pmu: Add pmu tests to catch unbind cleanup
 issues
Message-ID: <20240214150803.pxmnzxltdpazdzak@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20240213062948.32735-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240213062948.32735-1-umesh.nerlige.ramappa@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Umesh,
On 2024-02-12 at 22:29:48 -0800, Umesh Nerlige Ramappa wrote:
> Doing an flr (unbind followed by bind) on i915 device while a user holds
> a reference to the PMU events results in null-pointer-dereferences
> (npd). Add some tests to validate the fix for this issue.
> 

Could you rename tests? Here you are testing functionality of
unbind-bind with a user holding ref to PMU events, so what about
naming it explicitly as such? NPD is only one of bugs you
encountered.

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  tests/intel/perf_pmu.c | 202 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 202 insertions(+)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index 4ae2b60ae..4d60c8bd3 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -249,6 +249,41 @@
>   * Description: Test the i915 pmu perf interface
>   * Feature: i915 pmu perf interface, pmu
>   * Test category: Perf
> + *
> + * SUBTEST: flr-npd
-------------- ^^^^^^^
imho better name would be: rebind or unbind-bind
I do not know of good short name for 'ref to PMU event', what
about 'pmu-event-ref-rebind' ?
ref-event-unbind-bind ?

rebind-with-pmu-event-ref ?

> + * Description: Test null pointer dereference case
------------------ ^^^^
Write here same description you wrote in commit description:

Verify unbind-bind with holding reference to PMU event

Correct also descriptions below.

> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
> + *
> + * SUBTEST: flr-npd-close-after-unbind
> + * Description: Test null pointer dereference close perf after unbind
----------------------- ^^^^^^^^^^^^^^^
Same here and below, drop NPD from descriptons and write a sequence of
user actions you are validating (here and below).

> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
> + *
> + * SUBTEST: flr-npd-event-group
> + * Description: Test null pointer dereference case with event groups
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
> + *
> + * SUBTEST: flr-npd-separate-events
> + * Description: Test null pointer dereference case with separate events
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
> + *
> + * SUBTEST: forked-flr-npd
> + * Description: Test null pointer dereference case with forked FLR
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
> + *
> + * SUBTEST: forked-flr-npd-event-group
> + * Description: Test null pointer dereference case with forked FLR and event groups
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
> + *
> + * SUBTEST: forked-flr-npd-separate-events
> + * Description: Test null pointer dereference case with forked FLR and separate events
> + * Feature: i915 pmu perf interface, pmu
> + * Test category: Perf
>   */
>  
>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
> @@ -2417,6 +2452,151 @@ static void test_unload(unsigned int num_engines)
>  	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
>  }
>  
> +static int sysfs_driver(int i915)
> +{
> +	int dir, drv;
> +
> +	dir = igt_sysfs_open(i915);
> +	igt_assert(dir != -1);
> +
> +	drv = openat(dir, "device/driver", O_DIRECTORY);
> +	close(dir);
> +
> +	igt_assert(drv != -1);
> +	return drv;
> +}
> +
> +#define CLOSE_FD_AFTER_UNBIND	0x00000001
> +#define GROUP_FDS		0x00000002
> +#define SEPARATE_FDS		0x00000004
> +
> +#define NPD_MAX_FDS 4
> +static void test_flr_npd(uint32_t flags)
----------------------- ^^^
This should be unbind_bind or rebind:

static void test_flr_unbind_bind(uint32_t flags)
or
static void test_flr_rebind(uint32_t flags)

> +{
> +	struct pci_device *pdev;
> +	int fd[NPD_MAX_FDS], i915, drv;
> +	uint64_t buf[NPD_MAX_FDS];
> +	int count = 0, i;
> +	char *snd = NULL;
> +	char addr[80];
> +
> +	i915 = __drm_open_driver(DRIVER_INTEL);
> +	pdev = igt_device_get_pci_device(i915);
> +
> +	snprintf(addr, sizeof(addr), "%04x:%02x:%02x.%d",
> +		 pdev->domain, pdev->bus, pdev->dev, pdev->func);
> +	igt_debug("Opened %s\n", addr);
> +
> +	if (flags & GROUP_FDS) {
> +		fd[count++] = open_group(i915, I915_PMU_REQUESTED_FREQUENCY, -1);
> +		fd[count++] = open_group(i915, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
> +		fd[count++] = open_group(i915, I915_PMU_RC6_RESIDENCY, fd[0]);
> +		fd[count++] = open_group(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME, fd[0]);
> +		pmu_read_multi(fd[0], count, buf);
> +	} else if (flags & SEPARATE_FDS) {
> +		fd[count++] = open_pmu(i915, I915_PMU_REQUESTED_FREQUENCY);
> +		fd[count++] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
> +		fd[count++] = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
> +		fd[count++] = open_pmu(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
> +		pmu_read_single(fd[0]);
> +		pmu_read_single(fd[1]);
> +		pmu_read_single(fd[2]);
> +		pmu_read_single(fd[3]);
> +	} else {
> +		fd[0] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
> +		pmu_read_single(fd[0]);
> +	}
> +
> +	drv = sysfs_driver(i915);
> +	close(i915);
> +	igt_audio_driver_unload(&snd);
> +
> +	igt_set_timeout(30, "Driver unbind timeout!");
------------------- ^^
Why that long? Isn't 5 seconds enough?

> +	igt_assert_f(igt_sysfs_set(drv, "unbind", addr),
> +		     "Driver unbind failure (%s)!\n", addr);
> +	igt_reset_timeout();
> +
> +	if (flags & CLOSE_FD_AFTER_UNBIND)
> +		for (i = 0; i < count; i++)
> +			close(fd[i]);
> +
> +	igt_set_timeout(30, "Driver bind timeout!");
------------------- ^^
Same repeated value, consider making it define or const.

> +	igt_assert_f(igt_sysfs_set(drv, "bind", addr),
> +		     "Driver bind failure (%s)!\n", addr);
> +	igt_reset_timeout();
> +
> +	close(drv);
> +
> +	if (!(flags & CLOSE_FD_AFTER_UNBIND))
> +		for (i = 0; i < count; i++)
> +			close(fd[i]);
> +}
> +
> +static void test_forked_flr_npd(uint32_t flags)
------------------------------ ^^^
Same here, don't use npd in function name, use
unbind_bind or rebind.

> +{
> +	struct pci_device *pdev;
> +	int fd[NPD_MAX_FDS], i915, drv;
> +	uint64_t buf[NPD_MAX_FDS];
> +	int count = 0, i;
> +	char *snd = NULL;
> +	char addr[80];
> +
> +	/* not supported for the forked version */
> +	igt_assert(!(flags & CLOSE_FD_AFTER_UNBIND));
> +
> +	i915 = __drm_open_driver(DRIVER_INTEL);
> +	pdev = igt_device_get_pci_device(i915);
> +
> +	snprintf(addr, sizeof(addr), "%04x:%02x:%02x.%d",
> +		 pdev->domain, pdev->bus, pdev->dev, pdev->func);
> +	igt_debug("Opened %s\n", addr);
> +
> +	if (flags & GROUP_FDS) {
> +		fd[count++] = open_group(i915, I915_PMU_REQUESTED_FREQUENCY, -1);
> +		fd[count++] = open_group(i915, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
> +		fd[count++] = open_group(i915, I915_PMU_RC6_RESIDENCY, fd[0]);
> +		fd[count++] = open_group(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME, fd[0]);
> +		pmu_read_multi(fd[0], count, buf);
> +	} else if (flags & SEPARATE_FDS) {
> +		fd[count] = open_pmu(i915, I915_PMU_REQUESTED_FREQUENCY);
> +		pmu_read_single(fd[count++]);
> +		fd[count] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
> +		pmu_read_single(fd[count++]);
> +		fd[count] = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
> +		pmu_read_single(fd[count++]);
> +		fd[count] = open_pmu(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
> +		pmu_read_single(fd[count++]);
> +	} else {
> +		fd[count] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
> +		pmu_read_single(fd[count++]);
> +	}
> +
> +	drv = sysfs_driver(i915);
> +	close(i915);
> +	igt_audio_driver_unload(&snd);
> +
> +	igt_fork(child, 1) {
> +		igt_set_timeout(30, "Driver unbind timeout!");
------------------------^^
Same here.

> +		igt_assert_f(igt_sysfs_set(drv, "unbind", addr),
> +				"Driver unbind failure (%s)!\n", addr);
> +		igt_reset_timeout();
> +	}
> +	igt_waitchildren();
> +
> +
> +	igt_fork(child, 1) {
> +		igt_set_timeout(30, "Driver bind timeout!");
------------------------^^
Same here.

> +		igt_assert_f(igt_sysfs_set(drv, "bind", addr),
> +				"Driver bind failure (%s)!\n", addr);
> +		igt_reset_timeout();
> +	}
> +	igt_waitchildren();
> +
> +	close(drv);
> +	for (i = 0; i < count; i++)
> +		close(fd[i]);
> +}
> +
>  static void pmu_read(int i915)
>  {
>  	char val[128];
> @@ -2810,4 +2990,26 @@ igt_main
>  		for (int pass = 0; pass < 3; pass++)
>  			test_unload(num_engines);
>  	}
> +
> +	igt_subtest("flr-npd")
-------------------- ^^^
Please change 'npd' error you see from subtest name, use a name
describing sequence you are testing, here and below, for example:

s/npd/rebind-with-pmu-event-ref/

> +		test_flr_npd(0);
> +
> +	igt_subtest("flr-npd-close-after-unbind")
imho better:
rebind-with-event-close-after-unbind

> +		test_flr_npd(CLOSE_FD_AFTER_UNBIND);
> +
> +	igt_subtest("flr-npd-event-group")
Same here, change test name.

> +		test_flr_npd(GROUP_FDS);
> +
> +	igt_subtest("flr-npd-separate-events")
Same here, change test name.

> +		test_flr_npd(SEPARATE_FDS);
> +
> +	igt_subtest("forked-flr-npd")
Same here, change test name.

> +		test_forked_flr_npd(0);
> +
> +	igt_subtest("forked-flr-npd-event-group")
Same here, change test name.

> +		test_forked_flr_npd(GROUP_FDS);
> +
> +	igt_subtest("forked-flr-npd-separate-events")
Same here, change test name.

> +		test_forked_flr_npd(SEPARATE_FDS);
> +

Regards,
Kamil

>  }
> -- 
> 2.34.1
> 
