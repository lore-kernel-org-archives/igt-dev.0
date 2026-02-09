Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4239EF0702
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 03:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7332910E130;
	Mon,  9 Feb 2026 03:14:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1359C10E04F;
 Mon,  9 Feb 2026 03:14:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9087297328666105064=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi?=
 =?utf-8?q?-g-t=2C1/1=5D_Skip_kms=5Fflip_for_mtk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiandong Wang" <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 09 Feb 2026 03:14:27 -0000
Message-ID: <177060686705.236561.17107532252204599454@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260209020357.32744-1-xiandong.wang@mediatek.com>
In-Reply-To: <20260209020357.32744-1-xiandong.wang@mediatek.com>
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

--===============9087297328666105064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/1] Skip kms_flip for mtk
URL   : https://patchwork.freedesktop.org/series/161324/
State : success

== Summary ==

CI Bug Log - changes from IGT_8744 -> IGTPW_14511
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/index.html

Participating hosts (43 -> 40)
------------------------------

  Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m 

New tests
---------

  New tests have been introduced between IGT_8744 and IGTPW_14511:

### New IGT tests (115) ###

  * igt@gem_basic@bad-close:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_basic@create-close:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_basic@create-fd-close:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_close_race@basic-process:
    - Statuses : 40 pass(s)
    - Exec time: [0.04, 0.20] s

  * igt@gem_close_race@basic-threads:
    - Statuses : 40 pass(s)
    - Exec time: [1.14, 6.16] s

  * igt@gem_ctx_create@basic:
    - Statuses : 39 pass(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_create@basic-files:
    - Statuses : 39 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.12] s

  * igt@gem_ctx_exec@basic:
    - Statuses : 39 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_exec_basic@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.06] s

  * igt@gem_exec_create@basic:
    - Statuses : 40 pass(s)
    - Exec time: [2.00, 4.56] s

  * igt@gem_exec_fence@basic-await:
    - Statuses : 40 pass(s)
    - Exec time: [0.12, 0.83] s

  * igt@gem_exec_fence@basic-await@bcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@gem_exec_fence@basic-await@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.07, 0.21] s

  * igt@gem_exec_fence@basic-await@vcs0:
    - Statuses : 39 pass(s)
    - Exec time: [0.07, 0.18] s

  * igt@gem_exec_fence@basic-await@vcs1:
    - Statuses : 20 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@gem_exec_fence@basic-await@vecs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.07, 0.19] s

  * igt@gem_exec_fence@basic-busy:
    - Statuses : 40 pass(s)
    - Exec time: [0.03, 0.61] s

  * igt@gem_exec_fence@basic-busy@bcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.03, 0.07] s

  * igt@gem_exec_fence@basic-busy@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.02, 0.16] s

  * igt@gem_exec_fence@basic-busy@vcs0:
    - Statuses : 39 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@gem_exec_fence@basic-busy@vcs1:
    - Statuses : 20 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_fence@basic-busy@vecs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_fence@basic-wait:
    - Statuses : 40 pass(s)
    - Exec time: [0.04, 0.56] s

  * igt@gem_exec_fence@basic-wait@bcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.02, 0.08] s

  * igt@gem_exec_fence@basic-wait@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.01, 0.14] s

  * igt@gem_exec_fence@basic-wait@vcs0:
    - Statuses : 39 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_fence@basic-wait@vcs1:
    - Statuses : 20 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_fence@basic-wait@vecs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_fence@nb-await:
    - Statuses : 40 pass(s)
    - Exec time: [0.07, 0.61] s

  * igt@gem_exec_fence@nb-await@bcs0:
    - Statuses : 37 pass(s)
    - Exec time: [0.05, 0.10] s

  * igt@gem_exec_fence@nb-await@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.05, 0.12] s

  * igt@gem_exec_fence@nb-await@vcs0:
    - Statuses : 39 pass(s)
    - Exec time: [0.05, 0.11] s

  * igt@gem_exec_fence@nb-await@vcs1:
    - Statuses : 20 pass(s)
    - Exec time: [0.06, 0.09] s

  * igt@gem_exec_fence@nb-await@vecs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.05, 0.11] s

  * igt@gem_exec_gttfill@basic:
    - Statuses : 39 pass(s) 1 skip(s)
    - Exec time: [1.63, 33.09] s

  * igt@gem_flink_basic@bad-flink:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@gem_flink_basic@bad-open:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@gem_flink_basic@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_flink_basic@double-flink:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_flink_basic@flink-lifetime:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.05] s

  * igt@gem_linear_blits@basic:
    - Statuses : 39 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_mmap@basic:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gem_mmap_gtt@basic:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_render_linear_blits@basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.02, 0.14] s

  * igt@gem_render_tiled_blits@basic:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.17] s

  * igt@gem_sync@basic-all:
    - Statuses : 40 pass(s)
    - Exec time: [2.05, 3.93] s

  * igt@gem_sync@basic-each:
    - Statuses : 40 pass(s)
    - Exec time: [2.07, 2.79] s

  * igt@gem_tiled_blits@basic:
    - Statuses : 27 pass(s) 13 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@gem_tiled_fence_blits@basic:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@i915_getparams_basic@basic-eu-total:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_getparams_basic@basic-subslice-total:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@i915_hangman@error-state-basic:
    - Statuses : 40 pass(s)
    - Exec time: [0.01, 0.40] s

  * igt@i915_module_load@reload:
    - Statuses : 40 pass(s)
    - Exec time: [1.59, 10.65] s

  * igt@i915_pm_rps@basic-api:
    - Statuses : 19 pass(s) 21 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@i915_selftest@live:
    - Statuses : 4 dmesg-fail(s) 36 pass(s)
    - Exec time: [93.85, 361.54] s

  * igt@i915_selftest@live@active:
    - Statuses : 40 pass(s)
    - Exec time: [1.14, 8.28] s

  * igt@i915_selftest@live@client:
    - Statuses : 40 pass(s)
    - Exec time: [1.19, 8.24] s

  * igt@i915_selftest@live@coherency:
    - Statuses : 40 pass(s)
    - Exec time: [2.02, 14.37] s

  * igt@i915_selftest@live@dmabuf:
    - Statuses : 40 pass(s)
    - Exec time: [1.23, 8.34] s

  * igt@i915_selftest@live@evict:
    - Statuses : 40 pass(s)
    - Exec time: [1.62, 13.98] s

  * igt@i915_selftest@live@execlists:
    - Statuses : 40 pass(s)
    - Exec time: [1.31, 16.24] s

  * igt@i915_selftest@live@gem:
    - Statuses : 40 pass(s)
    - Exec time: [1.40, 10.06] s

  * igt@i915_selftest@live@gem_contexts:
    - Statuses : 40 pass(s)
    - Exec time: [4.91, 40.71] s

  * igt@i915_selftest@live@gt_contexts:
    - Statuses : 40 pass(s)
    - Exec time: [1.26, 8.31] s

  * igt@i915_selftest@live@gt_engines:
    - Statuses : 40 pass(s)
    - Exec time: [1.64, 8.23] s

  * igt@i915_selftest@live@gt_heartbeat:
    - Statuses : 40 pass(s)
    - Exec time: [1.12, 8.21] s

  * igt@i915_selftest@live@gt_lrc:
    - Statuses : 40 pass(s)
    - Exec time: [1.70, 9.20] s

  * igt@i915_selftest@live@gt_mocs:
    - Statuses : 40 pass(s)
    - Exec time: [1.35, 8.21] s

  * igt@i915_selftest@live@gt_pm:
    - Statuses : 40 pass(s)
    - Exec time: [2.39, 20.37] s

  * igt@i915_selftest@live@gt_timelines:
    - Statuses : 40 pass(s)
    - Exec time: [5.16, 62.48] s

  * igt@i915_selftest@live@gtt:
    - Statuses : 40 pass(s)
    - Exec time: [4.59, 24.76] s

  * igt@i915_selftest@live@hangcheck:
    - Statuses : 40 pass(s)
    - Exec time: [3.44, 33.59] s

  * igt@i915_selftest@live@hugepages:
    - Statuses : 40 pass(s)
    - Exec time: [1.82, 20.43] s

  * igt@i915_selftest@live@late_gt_pm:
    - Statuses : 40 pass(s)
    - Exec time: [1.19, 8.33] s

  * igt@i915_selftest@live@memory_region:
    - Statuses : 40 pass(s)
    - Exec time: [1.16, 8.49] s

  * igt@i915_selftest@live@mman:
    - Statuses : 40 pass(s)
    - Exec time: [3.56, 15.38] s

  * igt@i915_selftest@live@objects:
    - Statuses : 40 pass(s)
    - Exec time: [1.57, 9.07] s

  * igt@i915_selftest@live@perf:
    - Statuses : 40 pass(s)
    - Exec time: [1.27, 8.27] s

  * igt@i915_selftest@live@requests:
    - Statuses : 40 pass(s)
    - Exec time: [5.48, 18.41] s

  * igt@i915_selftest@live@reset:
    - Statuses : 40 pass(s)
    - Exec time: [1.40, 109.47] s

  * igt@i915_selftest@live@ring_submission:
    - Statuses : 40 pass(s)
    - Exec time: [1.13, 8.34] s

  * igt@i915_selftest@live@sanitycheck:
    - Statuses : 40 pass(s)
    - Exec time: [1.17, 8.33] s

  * igt@i915_selftest@live@uncore:
    - Statuses : 40 pass(s)
    - Exec time: [1.14, 8.20] s

  * igt@i915_selftest@live@vma:
    - Statuses : 40 pass(s)
    - Exec time: [1.17, 8.23] s

  * igt@i915_selftest@live@workarounds:
    - Statuses : 4 dmesg-fail(s) 36 pass(s)
    - Exec time: [1.44, 20.35] s

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@clobberred-modifier:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_busy@basic:
    - Statuses : 31 pass(s) 9 skip(s)
    - Exec time: [0.0, 5.53] s

  * igt@kms_force_connector_basic@force-load-detect:
    - Statuses : 5 pass(s) 35 skip(s)
    - Exec time: [0.0, 0.53] s

  * igt@prime_self_import@basic-llseek-bad:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.05] s

  * igt@prime_self_import@basic-llseek-size:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.05] s

  * igt@prime_self_import@basic-with_fd_dup:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.06] s

  * igt@prime_self_import@basic-with_one_bo:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.08] s

  * igt@prime_self_import@basic-with_two_bos:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.07] s

  * igt@prime_vgem@basic-fence-flip:
    - Statuses : 26 pass(s) 14 skip(s)
    - Exec time: [0.0, 1.81] s

  * igt@prime_vgem@basic-fence-mmap:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@prime_vgem@basic-fence-read:
    - Statuses : 19 pass(s) 21 skip(s)
    - Exec time: [0.00, 0.31] s

  * igt@prime_vgem@basic-gtt:
    - Statuses : 28 pass(s) 12 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@prime_vgem@basic-read:
    - Statuses : 19 pass(s) 21 skip(s)
    - Exec time: [0.00, 0.12] s

  * igt@prime_vgem@basic-write:
    - Statuses : 19 pass(s) 21 skip(s)
    - Exec time: [0.00, 0.17] s

  * igt@vgem_basic@create:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@vgem_basic@debugfs:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@vgem_basic@dmabuf-export:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.05] s

  * igt@vgem_basic@dmabuf-fence:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@vgem_basic@dmabuf-fence-before:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@vgem_basic@dmabuf-mmap:
    - Statuses : 40 pass(s)
    - Exec time: [0.01, 0.08] s

  * igt@vgem_basic@mmap:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.06] s

  * igt@vgem_basic@second-client:
    - Statuses : 40 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@vgem_basic@setversion:
    - Statuses : 40 pass(s)
    - Exec time: [0.0] s

  * igt@vgem_basic@sysfs:
    - Statuses : 40 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@vgem_basic@unload:
    - Statuses : 40 pass(s)
    - Exec time: [28.88, 29.66] s

  

Known issues
------------

  Here are the changes found in IGTPW_14511 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds (NEW):
    - bat-dg2-14:         [PASS][1] -> [DMESG-FAIL][2] ([i915#12061]) +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-mtlp-9:         [PASS][3] -> [DMESG-FAIL][4] ([i915#12061]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-mtlp-9/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_selftest@live (NEW):
    - bat-mtlp-8:         [DMESG-FAIL][5] ([i915#12061]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-mtlp-8/igt@i915_selftest@live.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@kms_pm_rpm@basic-rte:
    - bat-rpls-4:         [DMESG-WARN][7] ([i915#13400]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#13400]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8744 -> IGTPW_14511
  * Linux: CI_DRM_17954 -> CI_DRM_17956

  CI-20190529: 20190529
  CI_DRM_17954: e294156cfd0b6db73e96c58789049e8b504bb165 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_17956: 1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14511: 14511
  IGT_8744: 8744

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/index.html

--===============9087297328666105064==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/1] Skip kms_flip for mtk</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161324/">https://patchwork.freedesktop.org/series/161324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8744 -&gt; IGTPW_14511</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/index.html</p>
<h2>Participating hosts (43 -&gt; 40)</h2>
<p>Missing    (3): bat-dg2-13 fi-glk-j4005 fi-snb-2520m </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8744 and IGTPW_14511:</p>
<h3>New IGT tests (115)</h3>
<ul>
<li>
<p>igt@gem_basic@bad-close:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_basic@create-close:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_basic@create-fd-close:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.04, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-threads:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.14, 6.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic:</p>
<ul>
<li>Statuses : 39 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_create@basic-files:</p>
<ul>
<li>Statuses : 39 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic:</p>
<ul>
<li>Statuses : 39 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [2.00, 4.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.12, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.07, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 39 pass(s)</li>
<li>Exec time: [0.07, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 20 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.07, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.03, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.03, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.02, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 39 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 20 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.04, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.01, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 39 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 20 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.07, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.05, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 39 pass(s)</li>
<li>Exec time: [0.05, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs1:</p>
<ul>
<li>Statuses : 20 pass(s)</li>
<li>Exec time: [0.06, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.05, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>Statuses : 39 pass(s) 1 skip(s)</li>
<li>Exec time: [1.63, 33.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-open:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@double-flink:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@flink-lifetime:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>Statuses : 39 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.02, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-all:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [2.05, 3.93] s</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [2.07, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>Statuses : 27 pass(s) 13 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@i915_getparams_basic@basic-eu-total:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_getparams_basic@basic-subslice-total:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-basic:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.01, 0.40] s</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.59, 10.65] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>Statuses : 19 pass(s) 21 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>Statuses : 4 dmesg-fail(s) 36 pass(s)</li>
<li>Exec time: [93.85, 361.54] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.14, 8.28] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.19, 8.24] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [2.02, 14.37] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@dmabuf:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.23, 8.34] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@evict:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.62, 13.98] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.31, 16.24] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.40, 10.06] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [4.91, 40.71] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_contexts:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.26, 8.31] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.64, 8.23] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.12, 8.21] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.70, 9.20] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.35, 8.21] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [2.39, 20.37] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [5.16, 62.48] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [4.59, 24.76] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [3.44, 33.59] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.82, 20.43] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.19, 8.33] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@memory_region:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.16, 8.49] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [3.56, 15.38] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.57, 9.07] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.27, 8.27] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [5.48, 18.41] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.40, 109.47] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.13, 8.34] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.17, 8.33] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@uncore:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.14, 8.20] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@vma:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [1.17, 8.23] s</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>Statuses : 4 dmesg-fail(s) 36 pass(s)</li>
<li>Exec time: [1.44, 20.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>Statuses : 31 pass(s) 9 skip(s)</li>
<li>Exec time: [0.0, 5.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>Statuses : 5 pass(s) 35 skip(s)</li>
<li>Exec time: [0.0, 0.53] s</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-llseek-bad:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-llseek-size:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_two_bos:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>Statuses : 26 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 1.81] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>Statuses : 19 pass(s) 21 skip(s)</li>
<li>Exec time: [0.00, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>Statuses : 28 pass(s) 12 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>Statuses : 19 pass(s) 21 skip(s)</li>
<li>Exec time: [0.00, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>Statuses : 19 pass(s) 21 skip(s)</li>
<li>Exec time: [0.00, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@create:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@debugfs:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-export:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-fence:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-fence-before:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@dmabuf-mmap:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.01, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@mmap:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@second-client:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.00, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@setversion:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@sysfs:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [28.88, 29.66] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14511 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds (NEW):<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-mtlp-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live (NEW):</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>bat-rpls-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8744/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13400">i915#13400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14511/bat-rpls-4/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8744 -&gt; IGTPW_14511</li>
<li>Linux: CI_DRM_17954 -&gt; CI_DRM_17956</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17954: e294156cfd0b6db73e96c58789049e8b504bb165 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_17956: 1d8de8bfed023d4f1e11f6978a0fcdbddc0f9b36 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_14511: 14511<br />
  IGT_8744: 8744</p>

</body>
</html>

--===============9087297328666105064==--
