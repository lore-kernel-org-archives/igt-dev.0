Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F28C0218B
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 17:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BEB10E348;
	Thu, 23 Jan 2025 17:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e38+KcZ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAE510E348
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737654362; x=1769190362;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b4/RgFYo4UZ+gTnKnsqhHMsF/f1O7qLaZBHi29Zhqkg=;
 b=e38+KcZ4KclMsK/D2VTbCkBpUWAwr4Epq3Q6LLxzrvhBYOKtgVoygx5C
 dgW2+N4mWd5CvSSfW3bn6zV3cWolXNcrUaSIDuB9nsAK3bsb+FXeOsqgy
 vGQ8xZNBgSMOs08mHpjA/sFaIEpMeFuWXWVoTsdZRtmOXTCkCfC3dyLT5
 U/hsEdfR/6jv2dwWazzmYBOsSRxkVosGlEkdvob3iRsnOvO94kR8ciJg9
 Rty0s+vwB/xbnM8f48fwPr6e/DGZuKGzjpGBM++xkg+aq8iRSvqLR/MsE
 wXVvJnsbMM/QZIjtb7QhlUBI5cOxbsw2oIXbt3ZUQEM3aLEI4XsvvaCIH A==;
X-CSE-ConnectionGUID: lKw7f334QAq7KVYPmVUrLw==
X-CSE-MsgGUID: iCa56zRJS7yTlWx8cA/Cnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="25772791"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="25772791"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:46:02 -0800
X-CSE-ConnectionGUID: l/Vd0c5lSF++G0PdlW+ZKQ==
X-CSE-MsgGUID: N/NYw4CRSMifr9FAwzPv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="107345690"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:46:01 -0800
Date: Thu, 23 Jan 2025 11:45:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t] tests/intel/perf_pmu: Drop cpu-hotplug subtest
Message-ID: <3espfbwzjk7b6hapbi5pgdlrtketnlbidyclxezzpdbq22cybe@t2otyvqm7cdi>
References: <20250123053039.1948302-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250123053039.1948302-1-lucas.demarchi@intel.com>
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

On Wed, Jan 22, 2025 at 09:30:39PM -0800, Lucas De Marchi wrote:
>This test has been skipping since a long time (forever?) in CI. The

s/(forever?)//

looking at the CI repo it was actually tested because it had a kconfig
set for making CPU0 hotpluggable. That capability went way in the kernel
by ...

>reason is that cpu0 is not really hot pluggable. There was an initial
>attempt that got removed with kernel commits 5475abbde77f ("x86/smpboot:
>Remove the CPU0 hotplug kludge") and e59e74dc48a3 ("x86/topology: Remove
>CPU0 hotplug option").

^ these commits, so it's dead code since then.

Lucas De Marchi

>
>With those commits there are no more cpu0_hotplug kernel parameter and
>no more BOOTPARAM_HOTPLUG_CPU0 build config.
>
>The current i915 pmu integration always returns the first cpu in the
>system, which means that it's always cpu0.  The cpu migration is also
>currently wrong and was never detected by this test: it tries to find a
>sibling cpu rather than allowing to migrate to any cpu in the system.
>In order to clean up the i915 side, the hotplug code is being removed in
>favor of the generic one, provided by perf infra. That too has the same
>"issue" that there's no easy way to test, but hopefully receives more
>visibility since it's shared by several drivers.
>
>If we ever find a way to instrument the kernel to test the hotplug, this
>code can be partially restored.
>
>References: https://lore.kernel.org/all/20250116222426.77757-1-lucas.demarchi@intel.com/
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/intel/perf_pmu.c | 142 -----------------------------------------
> 1 file changed, 142 deletions(-)
>
>diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>index 5d0467c02..084ef9631 100644
>--- a/tests/intel/perf_pmu.c
>+++ b/tests/intel/perf_pmu.c
>@@ -101,9 +101,6 @@
>  * SUBTEST: busy-start
>  * Description: Test to verify gpu busyness through engine business pmu counters
>  *
>- * SUBTEST: cpu-hotplug
>- * Description: Test the i915 pmu perf interface
>- *
>  * SUBTEST: enable-race
>  * Description: Test the i915 pmu perf interface
>  *
>@@ -1362,139 +1359,6 @@ static void open_invalid(int i915)
> 	igt_assert_lt(fd, 0);
> }
>
>-static bool cpu0_hotplug_support(void)
>-{
>-	return access("/sys/devices/system/cpu/cpu0/online", W_OK) == 0;
>-}
>-
>-static void cpu_hotplug(int gem_fd)
>-{
>-	igt_spin_t *spin[2];
>-	uint64_t ts[2];
>-	uint64_t val;
>-	int link[2];
>-	int fd, ret;
>-	int cur = 0;
>-	char buf;
>-	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
>-
>-	igt_require(cpu0_hotplug_support());
>-
>-	fd = open_pmu(gem_fd,
>-		      I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0));
>-
>-	/*
>-	 * Create two spinners so test can ensure shorter gaps in engine
>-	 * busyness as it is terminating one and re-starting the other.
>-	 */
>-	spin[0] = igt_spin_new(gem_fd, .ahnd = ahnd,
>-			       .engine = I915_EXEC_DEFAULT);
>-	spin[1] = __igt_spin_new(gem_fd, .ahnd = ahnd,
>-				 .engine = I915_EXEC_DEFAULT);
>-
>-	val = __pmu_read_single(fd, &ts[0]);
>-
>-	ret = pipe2(link, O_NONBLOCK);
>-	igt_assert_eq(ret, 0);
>-
>-	/*
>-	 * Toggle online status of all the CPUs in a child process and ensure
>-	 * this has not affected busyness stats in the parent.
>-	 */
>-	igt_fork(child, 1) {
>-		int cpu = 0;
>-
>-		close(link[0]);
>-
>-		for (;;) {
>-			char name[128];
>-			int cpufd;
>-
>-			igt_assert_lt(snprintf(name, sizeof(name),
>-					       "/sys/devices/system/cpu/cpu%d/online",
>-					       cpu), sizeof(name));
>-			cpufd = open(name, O_WRONLY);
>-			if (cpufd == -1) {
>-				igt_assert_lt(0, cpu);
>-				/*
>-				 * Signal parent that we cycled through all
>-				 * CPUs and we are done.
>-				 */
>-				igt_assert_eq(write(link[1], "*", 1), 1);
>-				break;
>-			}
>-
>-			/* Offline followed by online a CPU. */
>-
>-			ret = write(cpufd, "0", 2);
>-			if (ret < 0) {
>-				/*
>-				 * If we failed to offline a CPU we don't want
>-				 * to proceed.
>-				 */
>-				igt_warn("Failed to offline cpu%u! (%d)\n",
>-					 cpu, errno);
>-				igt_assert_eq(write(link[1], "s", 1), 1);
>-				break;
>-			}
>-
>-			usleep(1e6);
>-
>-			ret = write(cpufd, "1", 2);
>-			if (ret < 0) {
>-				/*
>-				 * Failed to bring a CPU back online is fatal
>-				 * for the sanity of a test run so stop further
>-				 * testing.
>-				 */
>-				igt_warn("Failed to online cpu%u! (%d)\n",
>-					 cpu, errno);
>-				igt_fatal_error();
>-			}
>-
>-			close(cpufd);
>-			cpu++;
>-		}
>-	}
>-
>-	close(link[1]);
>-
>-	/*
>-	 * Very long batches can be declared as GPU hangs so emit shorter ones
>-	 * until the CPU core shuffler finishes one loop.
>-	 */
>-	for (;;) {
>-		usleep(500e3);
>-		end_spin(gem_fd, spin[cur], 0);
>-
>-		/* Check if the child is signaling completion. */
>-		ret = read(link[0], &buf, 1);
>-		if ( ret == 1 || (ret < 0 && errno != EAGAIN))
>-			break;
>-
>-		igt_spin_free(gem_fd, spin[cur]);
>-		spin[cur] = __igt_spin_new(gem_fd, .ahnd = ahnd,
>-					   .engine = I915_EXEC_DEFAULT);
>-		cur ^= 1;
>-	}
>-
>-	val = __pmu_read_single(fd, &ts[1]) - val;
>-
>-	end_spin(gem_fd, spin[0], FLAG_SYNC);
>-	end_spin(gem_fd, spin[1], FLAG_SYNC);
>-	igt_spin_free(gem_fd, spin[0]);
>-	igt_spin_free(gem_fd, spin[1]);
>-	igt_waitchildren();
>-	close(fd);
>-	close(link[0]);
>-	put_ahnd(ahnd);
>-
>-	/* Skip if child signals a problem with offlining a CPU. */
>-	igt_skip_on(buf == 's');
>-
>-	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
>-}
>-
> static int target_num_interrupts(int i915)
> {
> 	const intel_ctx_cfg_t cfg = intel_ctx_cfg_all_physical(i915);
>@@ -2650,12 +2514,6 @@ igt_main
> 		all_busy_check_all(fd, ctx, num_engines,
> 				   TEST_BUSY | TEST_TRAILING_IDLE);
>
>-	/**
>-	 * Test counters are not affected by CPU offline/online events.
>-	 */
>-	igt_subtest("cpu-hotplug")
>-		cpu_hotplug(fd);
>-
> 	/**
> 	 * Test GPU frequency.
> 	 */
>-- 
>2.48.0
>
