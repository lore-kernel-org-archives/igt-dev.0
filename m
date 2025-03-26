Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56716C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 10:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C0810E6AE;
	Wed, 26 Mar 2025 10:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxbUMsSN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBDA10E6AE
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742986261; x=1774522261;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=exglPuq9rEPOTAfvHDZcV8jwdY3JsnFCP1na1KlS2Ks=;
 b=LxbUMsSNyG7mz16Jtz7hPbbKEBSTYtJwjtOVTC+BqNlIs65cIRvGwdwx
 6KyfDG9G40pDbDDs5jZlhBesyJB6tsGUVTIJiz/Wfpu9nR1xnFvklwqNA
 YPrzl9zwfLKtPHpF2vv9f3vB/wyrpqwyK/GEHI/51pGi8Qv4KWyBaHGI+
 edp4JkFazShQ30xxGvUatCIBldPdvs4GW2wsIh0XYcc3YKRGLSX9NXZbI
 OEs9xkb/KHUMct3Ckzx/+QMDHmrFvs8fnuzNud+Clnk9pwmsxWeKJsKF4
 ouz5lj1KanCcDix8ytS8digovfFfBKSMPzklCLFPgEBrXjGxbROTs/ZlO g==;
X-CSE-ConnectionGUID: covEmPnHQvCJa+tBDDHe1Q==
X-CSE-MsgGUID: LSziI0ahTAK2Ve2J75P18Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44427730"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44427730"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:50:59 -0700
X-CSE-ConnectionGUID: EMmOpIYPSkirO6+vXUEHgw==
X-CSE-MsgGUID: cGjFNzMDRYaxsi3DoAeBrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125181298"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.13])
 ([10.246.3.13])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 03:50:58 -0700
Message-ID: <a5717516-fdc9-4006-b5f2-e2392787813b@linux.intel.com>
Date: Wed, 26 Mar 2025 11:50:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity test
 for all functions
To: Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, umesh.nerlige.ramappa@intel.com,
 lucas.demarchi@intel.com, michal.wajdeczko@intel.com,
 satyanarayana.k.v.p@intel.com
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-3-riana.tauro@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250321110958.3557106-3-riana.tauro@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 3/21/2025 12:09 PM, Riana Tauro wrote:
> Provision and enable 2 VFs with execution quantum and scheduling policy
> set. Add a test that runs workload on all functions simultaneously and
> validates that all engines are equally and fully loaded for the
> entire execution quantum of the function
> 
> v2: add a different function for function config
>      add function details to log
>      move pmu_fd to struct
>      enable and provision VF's (Umesh)
> 
> v3: split patches
>      move exec_quantum to variables
>      skip test if vfs are already provisioned
>      fix assert (Umesh)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 129 insertions(+)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index f0959abe2..9a1f9b39e 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -14,11 +14,13 @@
>   
>   #include "igt.h"
>   #include "igt_perf.h"
> +#include "igt_sriov_device.h"
>   #include "igt_sysfs.h"
>   
>   #include "xe/xe_gt.h"
>   #include "xe/xe_ioctl.h"
>   #include "xe/xe_spin.h"
> +#include "xe/xe_sriov_provisioning.h"
>   
>   #define SLEEP_DURATION 2 /* in seconds */
>   /* flag masks */
> @@ -124,6 +126,12 @@ static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_ins
>   	return pmu_config;
>   }
>   
> +static uint64_t get_event_config_fn(unsigned int gt, int function,
> +				    struct drm_xe_engine_class_instance *eci, const char *event)
> +{
> +	return get_event_config(gt, eci, event) | add_format_config("function", function);
> +}
> +
>   /**
>    * SUBTEST: engine-activity-idle
>    * Description: Test to validate engine activity shows no load when idle
> @@ -187,6 +195,73 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
>   		igt_assert(!engine_active_ticks);
>   }
>   
> +/**
> + * SUBTEST: all-fn-engine-activity-load
> + * Description: Test to validate engine activity by running load on all functions simultaneously
> + */
> +static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
> +{
> +	uint64_t config, engine_active_ticks, engine_total_ticks;
> +	uint64_t after[2 * num_fns], before[2 * num_fns];
> +	struct pmu_function {
> +		struct xe_cork *cork;
> +		uint32_t vm;
> +		uint64_t pmu_fd[2];
> +		int fd;
> +	} fn[num_fns];
> +	int i;
> +
> +	fn[0].pmu_fd[0] = -1;
> +	for (i = 0; i < num_fns; i++) {
> +		config = get_event_config_fn(eci->gt_id, i, eci, "engine-active-ticks");
> +		fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
> +
> +		config = get_event_config_fn(eci->gt_id, i, eci, "engine-total-ticks");
> +		fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
> +
> +		if (i > 0)
> +			fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
> +		else
> +			fn[i].fd = fd;
> +
> +		igt_assert_fd(fn[i].fd);
> +
> +		fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
> +		fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
> +		xe_cork_sync_start(fn[i].fd, fn[i].cork);
> +	}
> +
> +	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
> +	usleep(SLEEP_DURATION * USEC_PER_SEC);
> +	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
> +
> +	for (i = 0; i < num_fns; i++) {
> +		int idx = i * 2;
> +
> +		xe_cork_sync_end(fn[i].fd, fn[i].cork);
> +		engine_active_ticks = after[idx] - before[idx];
> +		engine_total_ticks = after[idx + 1] - before[idx + 1];
> +
> +		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", i,
> +			  after[idx], before[idx], engine_active_ticks);
> +		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", i,
> +			  after[idx + 1], before[idx + 1], engine_total_ticks);
> +
> +		if (fn[i].cork)
> +			xe_cork_destroy(fn[i].fd, fn[i].cork);
> +
> +		xe_vm_destroy(fn[i].fd, fn[i].vm);
> +
> +		close(fn[i].pmu_fd[0]);
> +		close(fn[i].pmu_fd[1]);
> +
> +		if (i > 0)
> +			close(fn[i].fd);
> +
> +		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
> +	}
> +}
> +
>   /**
>    * SUBTEST: gt-c6-idle
>    * Description: Basic residency test to validate idle residency
> @@ -225,6 +300,33 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>   	close(pmu_fd);
>   }
>   
> +static unsigned int enable_and_provision_vfs(int fd)
> +{
> +	unsigned int gt, num_vfs;
> +	int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;

Are those arbirtrary exec_quantum values ?

> +
> +	/* Enable VF's */
> +	igt_sriov_disable_driver_autoprobe(fd);
> +	igt_sriov_enable_vfs(fd, 2);

Perhaps we want to skip if sriov_totalvfs < 2 ?

> +	num_vfs = igt_sriov_get_enabled_vfs(fd);
> +	igt_require(num_vfs == 2);
> +
> +	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
> +	xe_for_each_gt(fd, gt) {
> +		xe_sriov_set_sched_if_idle(fd, gt, 0);
> +		for (int fn = 0; fn <= num_vfs; fn++)
> +			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
> +						     pf_exec_quantum);
> +	}
> +
> +	/* probe VFs */
> +	igt_sriov_enable_driver_autoprobe(fd);
> +	for (vf = 1; vf <= num_vfs; vf++)
> +		igt_sriov_bind_vf_drm_driver(fd, vf);
> +
> +	return num_vfs;
> +}
> +
>   igt_main
>   {
>   	int fd, gt;
> @@ -254,6 +356,33 @@ igt_main
>   	test_each_engine("engine-activity-load", fd, eci)
>   		engine_activity(fd, eci, TEST_LOAD);
>   
> +	igt_subtest_group {
> +		bool autoprobe;
> +		unsigned int num_fns;
> +
> +		igt_fixture {
> +			igt_require(igt_sriov_is_pf(fd));
> +			igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
> +			autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
> +			num_fns = enable_and_provision_vfs(fd) + 1;

The drawback of enabling VFs inside this fixture is that it executes for 
each subtest outside the subtest group (e.g., engine-activity-load 
above). It might be worth creating a dedicated test with sriov in its 
name and considering not limiting it to just two VFs.

> +		}
> +
> +		igt_describe("Validate engine activity on all functions");
> +		test_each_engine("all-fn-engine-activity-load", fd, eci)
> +			engine_activity_all_fn(fd, eci, num_fns);
> +
> +		igt_fixture {
> +			igt_sriov_disable_vfs(fd);
> +			/* abort to avoid execution of next tests with enabled VFs */
> +			igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
> +				       "Failed to disable VF(s)");
> +			autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
> +				    igt_sriov_disable_driver_autoprobe(fd);
> +			igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(fd),
> +				       "Failed to restore sriov_drivers_autoprobe value\n");
> +		}
> +	}
> +
>   	igt_fixture {
>   		close(fd);
>   	}

