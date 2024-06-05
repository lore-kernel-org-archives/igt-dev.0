Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69412C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 16:36:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1360F10E190;
	Wed,  5 Jun 2024 16:36:51 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035A910E190;
 Wed,  5 Jun 2024 16:36:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EBUILD=3A_failure_for_tests/chamelium=3A_Integr?=
 =?utf-8?q?ate_the_chamelium_v3?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Jun 2024 16:36:48 -0000
Message-ID: <171760540800.79.6032726551653996999@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
In-Reply-To: <20240605-dev-remove-static-ports-v1-0-665f25b7a4db@bootlin.com>
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

Series: tests/chamelium: Integrate the chamelium v3
URL   : https://patchwork.freedesktop.org/series/134506/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
08560f766a505e729dfee2846c1c11d28dd0e3d0 tools/intel_vbt_decode: Decode device handle as a bitmask

Tail of build.log:
[1573/1687] Generating xe_pat.testlist with a meson_exe.py custom command.
[1574/1687] Linking target tools/intel_bios_dumper.
[1575/1687] Generating xe_pm.testlist with a meson_exe.py custom command.
[1576/1687] Linking target benchmarks/gem_userptr_benchmark.
[1577/1687] Generating xe_peer2peer.testlist with a meson_exe.py custom command.
[1578/1687] Generating xe_pm_residency.testlist with a meson_exe.py custom command.
[1579/1687] Generating xe_noexec_ping_pong.testlist with a meson_exe.py custom command.
[1580/1687] Linking target benchmarks/gem_exec_nop.
[1581/1687] Linking target benchmarks/gem_exec_fault.
[1582/1687] Linking target benchmarks/gem_syslatency.
[1583/1687] Linking target benchmarks/gem_exec_trace.
[1584/1687] Generating xe_vm.testlist with a meson_exe.py custom command.
[1585/1687] Linking target benchmarks/gem_latency.
[1586/1687] Generating xe_query.testlist with a meson_exe.py custom command.
[1587/1687] Linking target benchmarks/gem_prw.
[1588/1687] Linking target benchmarks/gem_set_domain.
[1589/1687] Generating xe_render_copy.testlist with a meson_exe.py custom command.
[1590/1687] Generating xe_prime_self_import.testlist with a meson_exe.py custom command.
[1591/1687] Generating kms_chamelium_hpd.testlist with a meson_exe.py custom command.
[1592/1687] Linking target benchmarks/gem_exec_reloc.
[1593/1687] Generating kms_chamelium_audio.testlist with a meson_exe.py custom command.
[1594/1687] Generating xe_spin_batch.testlist with a meson_exe.py custom command.
[1595/1687] Generating xe_sysfs_scheduler.testlist with a meson_exe.py custom command.
[1596/1687] Linking target benchmarks/gem_wsim.
[1597/1687] Generating xe_waitfence.testlist with a meson_exe.py custom command.
[1598/1687] Generating xe_sysfs_defaults.testlist with a meson_exe.py custom command.
[1599/1687] Generating kms_chamelium_color.testlist with a meson_exe.py custom command.
[1600/1687] Generating kms_chamelium_edid.testlist with a meson_exe.py custom command.
[1601/1687] Generating kms_chamelium_frames.testlist with a meson_exe.py custom command.
[1602/1687] Generating kms_chamelium_v3_basic.testlist with a meson_exe.py custom command.
[1603/1687] Linking target benchmarks/kms_vblank.
[1604/1687] Linking target benchmarks/intel_upload_blit_large_gtt.
[1605/1687] Linking target benchmarks/intel_upload_blit_small.
[1606/1687] Linking target benchmarks/prime_lookup.
[1607/1687] Linking target benchmarks/intel_upload_blit_large.
[1608/1687] Linking target benchmarks/vgem_mmap.
[1609/1687] Linking target benchmarks/kms_fb_stress.
[1610/1687] Linking target benchmarks/intel_upload_blit_large_map.
[1611/1687] Linking target tools/igt_stats.
[1612/1687] Linking target tools/intel_display_poller.
[1613/1687] Linking target tools/intel_display_crc.
[1614/1687] Linking target tools/intel_dump_decode.
[1615/1687] Linking target tools/skl_compute_wrpll.
[1616/1687] Linking target tools/intel_audio_dump.
[1617/1687] Linking target tools/hsw_compute_wrpll.
[1618/1687] Linking target tools/intel_backlight.
[1619/1687] Compiling C object 'runner/527aa9f@@runner_test@exe/runner_tests.c.o'.
[1620/1687] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt2.c.o'.
[1621/1687] Compiling C object 'lib/76b5a35@@i915_perf@sha/meson-generated_.._i915_perf_metrics_acmgt3.c.o'.
ninja: build stopped: subcommand failed.


