Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81E6C3DA4B
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 18:20:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAABE10E4AF;
	Mon, 15 Jul 2024 18:20:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAEB710E4AF;
 Mon, 15 Jul 2024 18:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/gem=5Fctx=5Fexec=3A?=
 =?utf-8?q?_Fix_failing_preempt_timeout_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 15 Jul 2024 18:20:23 -0000
Message-ID: <172106762388.231758.1001070719725052361@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715181523.2825921-7-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20240715181523.2825921-7-janusz.krzysztofik@linux.intel.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_ctx_exec: Fix failing preempt timeout updates
URL   : https://patchwork.freedesktop.org/series/136109/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
9c28c27d4d48cecf8b7692a2975bde1cc1632096 tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests

Tail of build.log:
[175/1751] Compiling C object 'lib/76b5a35@@igt-i915_intel_drrs_c@sta/i915_intel_drrs.c.o'.
[176/1751] Compiling C object 'lib/76b5a35@@igt-igt_params_c@sta/igt_params.c.o'.
[177/1751] Compiling C object 'lib/76b5a35@@igt-i915_intel_fbc_c@sta/i915_intel_fbc.c.o'.
[178/1751] Compiling C object 'lib/76b5a35@@igt-dmabuf_sync_file_c@sta/dmabuf_sync_file.c.o'.
[179/1751] Compiling C object 'lib/76b5a35@@igt-i915_i915_crc_c@sta/i915_i915_crc.c.o'.
[180/1751] Compiling C object 'lib/76b5a35@@igt-i915_gem_context_c@sta/i915_gem_context.c.o'.
[181/1751] Compiling C object 'lib/76b5a35@@igt-i915_gem_submission_c@sta/i915_gem_submission.c.o'.
[182/1751] Compiling C object 'lib/76b5a35@@igt-igt_device_c@sta/igt_device.c.o'.
[183/1751] Compiling C object 'tests/59830eb@@dmabuf_sync_file@exe/dmabuf_sync_file.c.o'.
[184/1751] Compiling C object 'lib/76b5a35@@igt-igt_perf_c@sta/igt_perf.c.o'.
[185/1751] Generating i915-perf-metrics-acmgt1 with a custom command.
[186/1751] Compiling C object 'lib/76b5a35@@igt-igt_drm_fdinfo_c@sta/igt_drm_fdinfo.c.o'.
[187/1751] Compiling C object 'tests/59830eb@@vgem_basic@exe/vgem_basic.c.o'.
[188/1751] Compiling C object 'lib/76b5a35@@igt-igt_os_c@sta/igt_os.c.o'.
[189/1751] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color_helper.c.o'.
[190/1751] Compiling C object 'lib/76b5a35@@igt-igt_sriov_device_c@sta/igt_sriov_device.c.o'.
[191/1751] Compiling C object 'lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o'.
[192/1751] Compiling C object 'lib/76b5a35@@igt-igt_gt_c@sta/igt_gt.c.o'.
[193/1751] Compiling C object 'lib/76b5a35@@igt-igt_collection_c@sta/igt_collection.c.o'.
[194/1751] Compiling C object 'lib/76b5a35@@igt-igt_stats_c@sta/igt_stats.c.o'.
[195/1751] Compiling C object 'tests/59830eb@@kms_atomic_interruptible@exe/kms_atomic_interruptible.c.o'.
[196/1751] Compiling C object 'tests/59830eb@@fbdev@exe/fbdev.c.o'.
[197/1751] Compiling C object 'lib/76b5a35@@igt-igt_power_c@sta/igt_power.c.o'.
[198/1751] Compiling C object 'tests/59830eb@@api_intel_allocator@exe/intel_api_intel_allocator.c.o'.
[199/1751] Compiling C object 'lib/76b5a35@@igt-igt_debugfs_c@sta/igt_debugfs.c.o'.
[200/1751] Compiling C object 'lib/76b5a35@@igt-igt_pipe_crc_c@sta/igt_pipe_crc.c.o'.
[201/1751] Compiling C object 'lib/76b5a35@@igt-intel_allocator_reloc_c@sta/intel_allocator_reloc.c.o'.
[202/1751] Compiling C object 'lib/76b5a35@@igt-drmtest_c@sta/drmtest.c.o'.
[203/1751] Compiling C object 'lib/76b5a35@@igt-igt_syncobj_c@sta/igt_syncobj.c.o'.
[204/1751] Compiling C object 'tests/59830eb@@core_hotunplug@exe/core_hotunplug.c.o'.
[205/1751] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device_scan.c.o'.
[206/1751] Compiling C object 'tests/59830eb@@kms_async_flips@exe/kms_async_flips.c.o'.
[207/1751] Generating i915-perf-registers-acmgt2 with a custom command.
[208/1751] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color.c.o'.
[209/1751] Compiling C object 'lib/76b5a35@@igt-igt_halffloat_c@sta/igt_halffloat.c.o'.
[210/1751] Compiling C object 'lib/76b5a35@@igt-i915_intel_memory_region_c@sta/i915_intel_memory_region.c.o'.
[211/1751] Compiling C object 'lib/76b5a35@@igt-igt_sysfs_c@sta/igt_sysfs.c.o'.
[212/1751] Generating i915-perf-metrics-acmgt2 with a custom command.
[213/1751] Compiling C object 'tests/59830eb@@kms_addfb_basic@exe/kms_addfb_basic.c.o'.
[214/1751] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[215/1751] Compiling C object 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o'.
[216/1751] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[217/1751] Compiling C object 'tests/59830eb@@gem_concurrent_blit@exe/intel_gem_concurrent_blit.c.o'.
[218/1751] Compiling C object 'lib/76b5a35@@xe_oa@sha/meson-generated_.._xe_oa_equations.c.o'.
[219/1751] Generating i915-perf-registers-acmgt3 with a custom command.
[220/1751] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[221/1751] Generating i915-perf-metrics-acmgt3 with a custom command.
[222/1751] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[223/1751] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


