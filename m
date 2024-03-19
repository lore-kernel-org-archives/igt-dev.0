Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CF8CD11BF
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 15:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1212E10FB93;
	Tue, 19 Mar 2024 15:35:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BDA10FB93;
 Tue, 19 Mar 2024 15:35:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_lib/drmtest=3A_idle_all_G?=
 =?utf-8?q?PUs_before_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 Mar 2024 15:35:35 -0000
Message-ID: <171086253528.903241.10117255037736070144@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240319111932.30401-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240319111932.30401-1-kamil.konieczny@linux.intel.com>
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

Series: lib/drmtest: idle all GPUs before test
URL   : https://patchwork.freedesktop.org/series/131321/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
fef0422fd296f7c65724315f2a455ffb6959fb0d tests/intel/xe_ccs: fix bo size for ccs

Tail of build.log:
[154/1672] Compiling C object 'lib/76b5a35@@igt-igt_taints_c@sta/igt_taints.c.o'.
[155/1672] Compiling C object 'lib/76b5a35@@igt-i915_gem_mman_c@sta/i915_gem_mman.c.o'.
[156/1672] Compiling C object 'lib/76b5a35@@igt-igt_params_c@sta/igt_params.c.o'.
[157/1672] Compiling C object 'lib/76b5a35@@igt-igt_device_c@sta/igt_device.c.o'.
[158/1672] Compiling C object 'lib/76b5a35@@igt-igt_primes_c@sta/igt_primes.c.o'.
[159/1672] Compiling C object 'lib/76b5a35@@igt-igt_thread_c@sta/igt_thread.c.o'.
[160/1672] Compiling C object 'lib/76b5a35@@igt-igt_types_c@sta/igt_types.c.o'.
[161/1672] Compiling C object 'tests/59830eb@@kms_content_protection@exe/kms_content_protection.c.o'.
[162/1672] Compiling C object 'tests/59830eb@@core_hotunplug@exe/core_hotunplug.c.o'.
[163/1672] Compiling C object 'lib/76b5a35@@igt-igt_perf_c@sta/igt_perf.c.o'.
[164/1672] Compiling C object 'lib/76b5a35@@igt-igt_vec_c@sta/igt_vec.c.o'.
[165/1672] Compiling C object 'lib/76b5a35@@igt-igt_drm_fdinfo_c@sta/igt_drm_fdinfo.c.o'.
[166/1672] Compiling C object 'tests/59830eb@@kms_hdr@exe/kms_hdr.c.o'.
[167/1672] Compiling C object 'lib/76b5a35@@igt-igt_gt_c@sta/igt_gt.c.o'.
[168/1672] Generating i915-perf-registers-acmgt2 with a custom command.
[169/1672] Compiling C object 'lib/76b5a35@@igt-igt_os_c@sta/igt_os.c.o'.
[170/1672] Compiling C object 'lib/76b5a35@@igt-igt_vgem_c@sta/igt_vgem.c.o'.
[171/1672] Compiling C object 'lib/76b5a35@@igt-igt_power_c@sta/igt_power.c.o'.
[172/1672] Compiling C object 'lib/76b5a35@@igt-igt_sriov_device_c@sta/igt_sriov_device.c.o'.
[173/1672] Compiling C object 'lib/76b5a35@@igt-igt_collection_c@sta/igt_collection.c.o'.
[174/1672] Compiling C object 'lib/76b5a35@@igt-igt_x86_c@sta/igt_x86.c.o'.
[175/1672] Compiling C object 'lib/76b5a35@@igt-igt_debugfs_c@sta/igt_debugfs.c.o'.
[176/1672] Compiling C object 'tests/59830eb@@kms_color@exe/kms_color.c.o'.
[177/1672] Compiling C object 'lib/76b5a35@@igt-igt_pipe_crc_c@sta/igt_pipe_crc.c.o'.
[178/1672] Compiling C object 'tests/59830eb@@kms_getfb@exe/kms_getfb.c.o'.
[179/1672] Compiling C object 'lib/76b5a35@@igt-intel_allocator_reloc_c@sta/intel_allocator_reloc.c.o'.
[180/1672] Compiling C object 'lib/76b5a35@@igt_device_scan@sta/igt_device_scan.c.o'.
[181/1672] Compiling C object 'lib/76b5a35@@igt-igt_syncobj_c@sta/igt_syncobj.c.o'.
[182/1672] Compiling C object 'lib/76b5a35@@igt-igt_stats_c@sta/igt_stats.c.o'.
[183/1672] Generating i915-perf-metrics-acmgt2 with a custom command.
[184/1672] Compiling C object 'tests/59830eb@@kms_cursor_crc@exe/kms_cursor_crc.c.o'.
[185/1672] Compiling C object 'lib/76b5a35@@igt-i915_intel_memory_region_c@sta/i915_intel_memory_region.c.o'.
[186/1672] Compiling C object 'tests/59830eb@@kms_atomic_transition@exe/kms_atomic_transition.c.o'.
[187/1672] Compiling C object 'lib/76b5a35@@igt-intel_allocator_msgchannel_c@sta/intel_allocator_msgchannel.c.o'.
[188/1672] Compiling C object 'tests/59830eb@@kms_addfb_basic@exe/kms_addfb_basic.c.o'.
[189/1672] Compiling C object 'lib/76b5a35@@igt-igt_halffloat_c@sta/igt_halffloat.c.o'.
[190/1672] Compiling C object 'lib/76b5a35@@igt-igt_sysfs_c@sta/igt_sysfs.c.o'.
[191/1672] Compiling C object 'tests/59830eb@@kms_lease@exe/kms_lease.c.o'.
[192/1672] Compiling C object 'lib/76b5a35@@igt-igt_device_scan_c@sta/igt_device_scan.c.o'.
[193/1672] Compiling C object 'lib/76b5a35@@igt-instdone_c@sta/instdone.c.o'.
[194/1672] Compiling C object 'tests/59830eb@@kms_flip@exe/kms_flip.c.o'.
[195/1672] Compiling C object 'lib/76b5a35@@igt-igt_aux_c@sta/igt_aux.c.o'.
[196/1672] Generating i915-perf-registers-acmgt3 with a custom command.
[197/1672] Compiling C object 'tests/59830eb@@kms_atomic@exe/kms_atomic.c.o'.
[198/1672] Generating i915-perf-metrics-acmgt3 with a custom command.
[199/1672] Compiling C object 'tests/59830eb@@kms_cursor_legacy@exe/kms_cursor_legacy.c.o'.
[200/1672] Compiling C object 'tests/59830eb@@gem_userptr_blits@exe/intel_gem_userptr_blits.c.o'.
[201/1672] Compiling C object 'lib/76b5a35@@igt-i915_intel_decode_c@sta/i915_intel_decode.c.o'.
[202/1672] Generating i915-perf-equations with a custom command.
ninja: build stopped: subcommand failed.


