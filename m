Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2E5CA1002
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 02:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE25710E359;
	Fri,  5 Sep 2025 02:39:31 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF24210E353;
 Fri,  5 Sep 2025 02:39:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0766845495033335827=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel/kms=5Ffrontb?=
 =?utf-8?q?uffer=5Ftracking=3A_Remove_FBC_modulo_4_restriction_for_ADL-P+?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Sep 2025 02:39:30 -0000
Message-ID: <175703997067.305944.58281253145637102@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250903075924.282801-1-uma.shankar@intel.com>
In-Reply-To: <20250903075924.282801-1-uma.shankar@intel.com>
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

--===============0766845495033335827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_frontbuffer_tracking: Remove FBC modulo 4 restriction for ADL-P+
URL   : https://patchwork.freedesktop.org/series/153924/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_17124_full -> IGTPW_13683_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_13683_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_13683_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index.html

Participating hosts (10 -> 11)
------------------------------

  Additional (1): shard-tglu-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13683_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-rkl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@gem_ctx_persistence@smoketest.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_ctx_persistence@smoketest.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24]) -> ([PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [FAIL][45], [PASS][46])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-6/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-6/igt@i915_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@i915_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-1/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-1/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-6/igt@i915_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@i915_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-1/igt@i915_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@i915_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@i915_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@i915_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@i915_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@i915_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@i915_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@i915_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@i915_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@i915_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@i915_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@i915_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@i915_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_module_load@load.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][47] -> [FAIL][48] +38 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@i915_selftest@live@objects.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_selftest@live@objects.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-mtlp:         [PASS][49] -> [FAIL][50] +3 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@perf_pmu@busy-idle-no-semaphores:
    - shard-dg2:          [PASS][51] -> [SKIP][52] +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-6/igt@perf_pmu@busy-idle-no-semaphores.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@perf_pmu@busy-idle-no-semaphores.html

  * igt@perf_pmu@faulting-read:
    - shard-dg2:          NOTRUN -> [SKIP][53]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@perf_pmu@faulting-read.html

  
#### Warnings ####

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2:          [SKIP][54] ([i915#14118]) -> [SKIP][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-dg2:          [SKIP][56] ([i915#4077]) -> [SKIP][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@i915_pm_rpm@gem-evict-pwrite.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][58] ([i915#12061]) -> [FAIL][59] +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@i915_selftest@live@workarounds.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_selftest@live@workarounds.html

  
New tests
---------

  New tests have been introduced between CI_DRM_17124_full and IGTPW_13683_full:

### New IGT tests (49) ###

  * igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_cursor_crc@cursor-offscreen-256x85@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.60] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.44] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.59] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.39] s

  * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.56] s

  * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.40] s

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.62] s

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.45] s

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [4.23] s

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.22] s

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [3.92] s

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.73] s

  * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.20] s

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.71] s

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.42] s

  * igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [4.28] s

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.93] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [1.13] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.46] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.57] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.47] s

  * igt@kms_plane_cursor@primary@pipe-b-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.43] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.48] s

  * igt@kms_plane_cursor@primary@pipe-c-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_plane_cursor@primary@pipe-d-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.50] s

  * igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.56] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.55] s

  * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-128:
    - Statuses : 1 pass(s)
    - Exec time: [3.53] s

  * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-256:
    - Statuses : 1 pass(s)
    - Exec time: [3.52] s

  * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-64:
    - Statuses : 1 pass(s)
    - Exec time: [3.59] s

  

Known issues
------------

  Here are the changes found in IGTPW_13683_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#8411])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#8411])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@fbdev@nullptr:
    - shard-rkl:          [PASS][62] -> [SKIP][63] ([i915#14544] / [i915#2582])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@fbdev@nullptr.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@fbdev@nullptr.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3555] / [i915#9323])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#9323])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][66] ([i915#12392] / [i915#13356])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2-9:        NOTRUN -> [ABORT][67] ([i915#13427])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg1:          NOTRUN -> [SKIP][68] +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][69] ([i915#1099]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb5/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2-9:        NOTRUN -> [SKIP][70] ([i915#8555])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][71] ([i915#280])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#280])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#280])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg2-9:        NOTRUN -> [SKIP][74] ([i915#280])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#280])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html
    - shard-tglu:         NOTRUN -> [SKIP][76] ([i915#280])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4812]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4771])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4036])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#8555]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#4525])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_exec_balancer@parallel-contexts.html
    - shard-tglu:         NOTRUN -> [SKIP][82] ([i915#4525])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][83] -> [ABORT][84] ([i915#11713] / [i915#14756])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-tglu-10/igt@gem_exec_big@single.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-5/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2-9:        NOTRUN -> [SKIP][85] ([i915#6334]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_capture@capture-invisible.html
    - shard-glk10:        NOTRUN -> [SKIP][86] ([i915#6334]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk10/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2-9:        NOTRUN -> [SKIP][87] ([i915#4812])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3539] / [i915#4852]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][89] ([i915#3539])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2-9:        NOTRUN -> [SKIP][90] ([i915#3539] / [i915#4852]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5107])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-dg2-9:        NOTRUN -> [SKIP][92] ([i915#3281]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3281]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gem_exec_reloc@basic-softpin.html
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#3281]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@gem_exec_reloc@basic-softpin.html
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#3281])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3281]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#14544] / [i915#3281]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4537] / [i915#4812])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4860])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gem_fence_thrash@bo-copy.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4860]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@gem_fence_thrash@bo-copy.html
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4860]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][102] ([i915#4860])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#4613] / [i915#7582])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> [SKIP][104] ([i915#4613]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#4613])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][106] -> [TIMEOUT][107] ([i915#5493]) +1 other test timeout
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][108] ([i915#4613]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#14544] / [i915#4613])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#4613]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4083]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-dg2-9:        NOTRUN -> [SKIP][112] ([i915#4077]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4077]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#4077]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4077]) +14 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg2-9:        NOTRUN -> [SKIP][116] ([i915#4083]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3282]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#3282])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@gem_partial_pwrite_pread@write-uncached.html
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#3282])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2-9:        NOTRUN -> [SKIP][120] ([i915#3282]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#3282]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          [PASS][122] -> [TIMEOUT][123] ([i915#12917] / [i915#12964])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@gem_pxp@create-regular-context-1.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2-9:        NOTRUN -> [SKIP][124] ([i915#4270]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4270])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#4270]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#14544] / [i915#4270])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#14544] / [i915#3282])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
    - shard-dg2-9:        NOTRUN -> [SKIP][129] ([i915#5190] / [i915#8428]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#8428])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-3/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html

  * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#5190] / [i915#8428]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][132] +394 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#4079])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][134] ([i915#4079]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4885])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2-9:        NOTRUN -> [SKIP][136] ([i915#3297]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][137] ([i915#3323])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2-9:        NOTRUN -> [SKIP][138] ([i915#3282] / [i915#3297])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#3297]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#3297] / [i915#4880])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate.html
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#3297])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2-9:        NOTRUN -> [SKIP][142] ([i915#3297] / [i915#4880]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-rkl:          [PASS][143] -> [INCOMPLETE][144] ([i915#13356])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html
    - shard-glk:          [PASS][145] -> [INCOMPLETE][146] ([i915#13356] / [i915#14586])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#2856]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#2527] / [i915#2856])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][149] ([i915#2527] / [i915#2856]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.html
    - shard-dg2-9:        NOTRUN -> [SKIP][150] ([i915#2856]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#14544] / [i915#2527])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#14123])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@busy@rcs0:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#14073]) +5 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@i915_drm_fdinfo@busy@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#14073]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@i915_drm_fdinfo@busy@rcs0.html

  * igt@i915_drm_fdinfo@busy@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#14073]) +15 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@i915_drm_fdinfo@busy@vecs1.html

  * igt@i915_drm_fdinfo@isolation@vcs0:
    - shard-dg2-9:        NOTRUN -> [SKIP][156] ([i915#14073]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@i915_drm_fdinfo@isolation@vcs0.html

  * igt@i915_drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#14118]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#14118])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-idle-all.html
    - shard-dg2-9:        NOTRUN -> [SKIP][159] ([i915#14118])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][160] -> [DMESG-WARN][161] ([i915#13029] / [i915#14545])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@i915_module_load@reload-no-display.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [PASS][162] -> [DMESG-WARN][163] ([i915#13029] / [i915#14545])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-15/igt@i915_module_load@reload-no-display.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu-1:       NOTRUN -> [WARN][164] ([i915#13790] / [i915#2681]) +1 other test warn
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [PASS][165] -> [INCOMPLETE][166] ([i915#13356])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#11681] / [i915#6621]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][168] ([i915#8346])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@i915_pm_rps@waitboost.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][169] -> [SKIP][170] ([i915#7984])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-6/igt@i915_power@sanity.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@i915_power@sanity.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#6245])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#5723])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][173] ([i915#4817] / [i915#7443])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][174] -> [INCOMPLETE][175] ([i915#4817])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html
    - shard-snb:          [PASS][176] -> [INCOMPLETE][177] ([i915#4817])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-snb4/igt@i915_suspend@fence-restore-untiled.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb6/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][178] ([i915#4817])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk9/igt@i915_suspend@sysfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][179] ([i915#7707])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-glk:          [PASS][180] -> [FAIL][181] ([i915#14888])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][182] ([i915#14888])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#10333])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#9531])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#1769] / [i915#3555])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-mtlp:         [PASS][186] -> [FAIL][187] ([i915#5956]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#5286]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-9:        NOTRUN -> [SKIP][189] +7 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#5286]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#5286]) +5 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-mtlp:         [PASS][192] -> [FAIL][193] ([i915#5138])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][194] +52 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3638])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][196] -> [SKIP][197] +8 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg1:          [PASS][198] -> [DMESG-WARN][199] ([i915#4391] / [i915#4423])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-18/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#5190]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#14544]) +23 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-9:        NOTRUN -> [SKIP][202] ([i915#4538] / [i915#5190]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][203] +4 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-9:        NOTRUN -> [SKIP][204] ([i915#5190])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][205] +15 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#4538]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#4538] / [i915#5190]) +9 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#6095]) +135 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#10307] / [i915#6095]) +133 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] ([i915#12313])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
    - shard-dg2-9:        NOTRUN -> [SKIP][211] ([i915#12313])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#6095]) +48 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2:
    - shard-dg2-9:        NOTRUN -> [SKIP][213] ([i915#10307] / [i915#6095]) +44 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#12313]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#6095]) +13 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#6095]) +59 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#14098] / [i915#6095]) +46 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#6095]) +9 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#4423] / [i915#6095])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#6095]) +44 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#13781]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-c-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#13783]) +3 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-c-dp-3.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][224] +13 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-dg1:          NOTRUN -> [SKIP][225] ([i915#11151] / [i915#7828]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-16/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#11151] / [i915#7828]) +5 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#11151] / [i915#7828]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#11151] / [i915#7828]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#11151] / [i915#7828]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#11151] / [i915#7828])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd.html
    - shard-dg2-9:        NOTRUN -> [SKIP][231] ([i915#11151] / [i915#7828]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-rkl:          [PASS][233] -> [SKIP][234] ([i915#12655] / [i915#14544])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_color@ctm-red-to-blue.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#12655] / [i915#14544])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [FAIL][236] ([i915#7173]) +1 other test fail
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_content_protection@atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#7118] / [i915#9424])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-9:        NOTRUN -> [SKIP][239] ([i915#3299])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#3299]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#3299])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#3116] / [i915#3299])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3299])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#9424])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#13049])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-tglu:         [PASS][246] -> [FAIL][247] ([i915#13566]) +5 other tests fail
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#13049]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#3555]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-rkl:          [PASS][250] -> [FAIL][251] ([i915#13566])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][252] ([i915#13566])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#3555]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#13049])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#13049])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#13049])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#3555]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-snb:          NOTRUN -> [SKIP][258] +158 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#8814])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][260] ([i915#12358] / [i915#14152] / [i915#7882])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk8/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][261] ([i915#14152])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#9809])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - shard-rkl:          [PASS][263] -> [SKIP][264] ([i915#11190] / [i915#14544]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-glk10:        NOTRUN -> [SKIP][265] ([i915#11190]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk10/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-dg2-9:        NOTRUN -> [SKIP][266] ([i915#13046] / [i915#5354]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#13046] / [i915#5354]) +10 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-rkl:          [PASS][268] -> [FAIL][269] ([i915#2346])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#4103])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg2-9:        NOTRUN -> [SKIP][271] ([i915#4103] / [i915#4213])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-toggle:
    - shard-dg1:          [PASS][272] -> [DMESG-WARN][273] ([i915#4423]) +4 other tests dmesg-warn
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-12/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_cursor_legacy@short-flip-after-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2-9:        NOTRUN -> [SKIP][274] ([i915#9833])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#3555] / [i915#3804])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#3804])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#13749])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#13749])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#13749])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#13749])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#13749])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#13707])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#13707])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#8812])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#3555] / [i915#3840]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_dsc@dsc-basic.html
    - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#3555] / [i915#3840])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#3840] / [i915#9688])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#3555] / [i915#3840])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#3469])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-9:        NOTRUN -> [SKIP][290] ([i915#3469])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#4854])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-9:        NOTRUN -> [SKIP][292] ([i915#1839])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#658])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_feature_discovery@psr2.html

  * igt@kms_fence_pin_leak:
    - shard-dg2-9:        NOTRUN -> [SKIP][294] ([i915#4881])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] ([i915#3637] / [i915#9934]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2-9:        NOTRUN -> [SKIP][296] ([i915#9934]) +4 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-glk:          [PASS][297] -> [SKIP][298] +2 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-glk9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][299] -> [TIMEOUT][300] ([i915#14033]) +1 other test timeout
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#14544] / [i915#9934]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][302] ([i915#9934]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-14/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][303] ([i915#3637] / [i915#9934]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#9934]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#3637] / [i915#9934]) +4 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-10/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#9934]) +5 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#2575]) +16 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2-9:        NOTRUN -> [SKIP][308] ([i915#8381])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-panning:
    - shard-rkl:          [PASS][309] -> [SKIP][310] ([i915#14544] / [i915#3637]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_flip@flip-vs-panning.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][311] ([i915#12745])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#14544] / [i915#3637]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#2672] / [i915#3555]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#2672] / [i915#3555])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][315] ([i915#2672] / [i915#3555]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#2672] / [i915#3555]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#2672] / [i915#3555] / [i915#8813])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][318] ([i915#2672] / [i915#8813])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#2587] / [i915#2672]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#2587] / [i915#2672]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][321] ([i915#2587] / [i915#2672] / [i915#3555])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#2672]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#2672]) +8 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#2587] / [i915#2672]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-9:        NOTRUN -> [SKIP][325] ([i915#2672] / [i915#3555] / [i915#5190])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-9:        NOTRUN -> [SKIP][326] ([i915#2672])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#2672] / [i915#3555]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-rkl:          [PASS][329] -> [SKIP][330] ([i915#14544] / [i915#3555]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-4/igt@kms_flip_tiling@flip-change-tiling.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg1:          [PASS][331] -> [ABORT][332] ([i915#4423])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-12/igt@kms_force_connector_basic@force-connector-state.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-rkl:          [PASS][333] -> [SKIP][334] ([i915#14544] / [i915#1849] / [i915#5354]) +13 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglu:         [PASS][335] -> [ABORT][336] ([i915#14850])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#5439])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#5354]) +27 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2-9:        NOTRUN -> [SKIP][339] ([i915#5354]) +15 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][340] ([i915#8708]) +13 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#1825]) +24 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#14544] / [i915#1849] / [i915#5354]) +9 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#3458]) +17 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#3023]) +14 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-dg2-9:        NOTRUN -> [SKIP][345] ([i915#3458]) +5 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][346] ([i915#9766])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#10433] / [i915#3458])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#3458]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#8708]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#1825]) +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#8708]) +15 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][352] ([i915#8708]) +3 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglu-1:       NOTRUN -> [SKIP][353] ([i915#3555] / [i915#8228])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#3555] / [i915#8228])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [PASS][355] -> [SKIP][356] ([i915#3555] / [i915#8228]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-glk10:        NOTRUN -> [SKIP][357] +262 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk10/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#12388])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#12388])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][360] ([i915#13688])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#12339] / [i915#14544])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#10656])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#12339])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lease-invalid-plane:
    - shard-rkl:          [PASS][364] -> [SKIP][365] ([i915#14544]) +29 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_lease@lease-invalid-plane.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_lease@lease-invalid-plane.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-9:        NOTRUN -> [SKIP][366] ([i915#6301])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu-1:       NOTRUN -> [SKIP][367] +55 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-glk:          NOTRUN -> [INCOMPLETE][368] ([i915#12756] / [i915#13409] / [i915#13476])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][369] ([i915#13409] / [i915#13476])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#14544] / [i915#8825])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane@plane-position-hole:
    - shard-rkl:          [PASS][371] -> [SKIP][372] ([i915#14544] / [i915#8825])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_plane@plane-position-hole.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][373] ([i915#10647] / [i915#12169])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][374] ([i915#10647]) +3 other tests fail
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][375] ([i915#10647] / [i915#12177])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#14544] / [i915#7294])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-tglu-1:       NOTRUN -> [SKIP][377] ([i915#13958]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-9:        NOTRUN -> [SKIP][378] ([i915#13958])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#13958]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][380] ([i915#13958])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#14259])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#12247]) +4 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-rkl:          [PASS][383] -> [SKIP][384] ([i915#14544] / [i915#8152])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-rkl:          [PASS][385] -> [SKIP][386] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-rkl:          [PASS][387] -> [SKIP][388] ([i915#12247] / [i915#14544]) +3 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#2575] / [i915#9423])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
    - shard-rkl:          NOTRUN -> [SKIP][390] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
    - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#12247] / [i915#3555] / [i915#6953])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2:          [PASS][392] -> [SKIP][393] ([i915#2575] / [i915#9423])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][394] ([i915#12247]) +7 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#12247] / [i915#14544])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#12247] / [i915#14544] / [i915#8152])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#6953])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-rkl:          [PASS][398] -> [SKIP][399] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
    - shard-rkl:          [PASS][400] -> [SKIP][401] ([i915#12247] / [i915#14544] / [i915#8152]) +4 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][402] ([i915#12343])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][403] ([i915#9812])
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][404] ([i915#5354])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-9:        NOTRUN -> [SKIP][405] ([i915#9685]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-tglu-1:       NOTRUN -> [SKIP][406] ([i915#3828])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-dg2-9:        NOTRUN -> [SKIP][407] ([i915#3828])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#9685]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][409] ([i915#9685])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu-1:       NOTRUN -> [SKIP][410] ([i915#8430])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-rkl:          [PASS][411] -> [SKIP][412] ([i915#14544] / [i915#1849])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-4/igt@kms_pm_rpm@cursor-dpms.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-9:        NOTRUN -> [SKIP][413] ([i915#9519])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][414] ([i915#9519])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
    - shard-rkl:          [PASS][415] -> [SKIP][416] ([i915#9519])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][417] -> [SKIP][418] ([i915#9519])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglu:         NOTRUN -> [SKIP][419] ([i915#9519])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-rkl:          [PASS][420] -> [DMESG-WARN][421] ([i915#12964]) +38 other tests dmesg-warn
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_pm_rpm@pm-caching.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][422] ([i915#6524])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2-9:        NOTRUN -> [SKIP][423] ([i915#6524] / [i915#6805])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][424] ([i915#6524] / [i915#6805])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][425] ([i915#11520] / [i915#14544]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][426] ([i915#11520]) +13 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk3/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#11520]) +3 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][428] ([i915#11520]) +3 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
    - shard-tglu-1:       NOTRUN -> [SKIP][429] ([i915#11520]) +5 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][430] ([i915#9808])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][431] ([i915#12316]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][432] ([i915#11520]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][433] ([i915#11520]) +4 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][434] ([i915#11520]) +5 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-9:        NOTRUN -> [SKIP][435] ([i915#11520]) +3 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][436] ([i915#11520])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][437] ([i915#9683])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][438] ([i915#9688])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-pr-primary-mmap-gtt:
    - shard-dg2-9:        NOTRUN -> [SKIP][439] ([i915#1072] / [i915#9732]) +13 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_psr@fbc-pr-primary-mmap-gtt.html

  * igt@kms_psr@psr-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][440] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html
    - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#1072] / [i915#9732]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-14/igt@kms_psr@psr-cursor-mmap-cpu.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][442] ([i915#9732]) +15 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][443] ([i915#1072] / [i915#9732]) +11 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-tglu:         NOTRUN -> [SKIP][444] ([i915#9732]) +7 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-5/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][445] ([i915#1072] / [i915#9732]) +20 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][446] ([i915#9685])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][447] ([i915#12755]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglu:         NOTRUN -> [SKIP][448] ([i915#5289]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-dg2-9:        NOTRUN -> [SKIP][449] ([i915#3555]) +3 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-glk:          NOTRUN -> [ABORT][450] ([i915#13179]) +1 other test abort
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][451] ([i915#10959])
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][452] -> [INCOMPLETE][453] ([i915#12276])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][454] ([i915#12276])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][455] ([i915#9906])
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][456] ([i915#9906]) +1 other test skip
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][457] ([i915#9906])
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_vrr@flip-basic-fastset.html
    - shard-mtlp:         NOTRUN -> [SKIP][458] ([i915#8808] / [i915#9906])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][459] ([i915#11920])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg2-9:        NOTRUN -> [SKIP][460] ([i915#9906]) +1 other test skip
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu-1:       NOTRUN -> [SKIP][461] ([i915#9906])
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu:         NOTRUN -> [SKIP][462] ([i915#9906]) +2 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][463] ([i915#2437] / [i915#9412])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][464] ([i915#2437]) +3 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-9:        NOTRUN -> [SKIP][465] ([i915#2437] / [i915#9412])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu-1:       NOTRUN -> [SKIP][466] ([i915#2437] / [i915#9412]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][467] ([i915#2437] / [i915#9412])
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config:
    - shard-dg2-9:        NOTRUN -> [SKIP][468] ([i915#7387])
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@perf@global-sseu-config.html

  * igt@perf_pmu@busy-double-start:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][469] ([i915#12964]) +3 other tests dmesg-warn
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@perf_pmu@busy-double-start.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2-9:        NOTRUN -> [FAIL][470] ([i915#4349]) +4 other tests fail
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2-9:        NOTRUN -> [FAIL][471] ([i915#12549] / [i915#6806]) +1 other test fail
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          NOTRUN -> [FAIL][472] ([i915#14433])
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@perf_pmu@module-unload.html
    - shard-rkl:          NOTRUN -> [FAIL][473] ([i915#14433])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][474] ([i915#8516])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-rkl:          [PASS][475] -> [SKIP][476] ([i915#14544] / [i915#3708])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@prime_vgem@basic-fence-flip.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2-9:        NOTRUN -> [SKIP][477] ([i915#3291] / [i915#3708])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@prime_vgem@basic-fence-read.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-9:        NOTRUN -> [SKIP][478] ([i915#9917])
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:
    - shard-tglu-1:       NOTRUN -> [FAIL][479] ([i915#12910]) +9 other tests fail
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][480] ([i915#9917])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@syncobj_timeline@etime-single-wait-for-submit-submitted:
    - shard-dg2:          [PASS][481] -> [SKIP][482] ([i915#2575]) +37 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@syncobj_timeline@etime-single-wait-for-submit-submitted.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@syncobj_timeline@etime-single-wait-for-submit-submitted.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-rkl:          [SKIP][483] ([i915#14544] / [i915#2582]) -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@fbdev@eof.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@fbdev@eof.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [INCOMPLETE][485] ([i915#13356]) -> [PASS][486]
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][487] ([i915#5784]) -> [PASS][488]
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@gem_eio@kms.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][489] ([i915#5784]) -> [PASS][490] +1 other test pass
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-13/igt@gem_eio@unwedge-stress.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-glk:          [INCOMPLETE][491] ([i915#13196] / [i915#13356]) -> [PASS][492] +1 other test pass
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-glk1/igt@gem_exec_suspend@basic-s3.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk9/igt@gem_exec_suspend@basic-s3.html
    - shard-rkl:          [INCOMPLETE][493] ([i915#13356]) -> [PASS][494] +1 other test pass
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          [TIMEOUT][495] ([i915#12917] / [i915#12964]) -> [PASS][496] +1 other test pass
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@gem_pxp@display-protected-crc.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          [TIMEOUT][497] ([i915#12964]) -> [PASS][498]
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@gem_pxp@fail-invalid-protected-context.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [DMESG-WARN][499] ([i915#14545]) -> [PASS][500]
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-snb4/igt@i915_module_load@reload-no-display.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb1/igt@i915_module_load@reload-no-display.html

  * igt@i915_suspend@forcewake:
    - shard-tglu:         [ABORT][501] -> [PASS][502]
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-tglu-3/igt@i915_suspend@forcewake.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@i915_suspend@forcewake.html

  * igt@kms_color@degamma:
    - shard-rkl:          [SKIP][503] ([i915#12655] / [i915#14544]) -> [PASS][504] +2 other tests pass
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_color@degamma.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_color@degamma.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][505] ([i915#13566]) -> [PASS][506] +3 other tests pass
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][507] ([i915#13566]) -> [PASS][508] +1 other test pass
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][509] ([i915#11190] / [i915#14544]) -> [PASS][510]
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-glk:          [SKIP][511] -> [PASS][512] +2 other tests pass
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [ABORT][513] -> [PASS][514] +3 other tests pass
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-snb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-1x:
    - shard-rkl:          [SKIP][515] ([i915#14544] / [i915#9738]) -> [PASS][516]
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_feature_discovery@display-1x.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][517] ([i915#14033] / [i915#14350]) -> [PASS][518]
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-snb6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][519] ([i915#14033]) -> [PASS][520]
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-snb6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-rkl:          [SKIP][521] ([i915#14544] / [i915#3637]) -> [PASS][522] +7 other tests pass
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#14553]) -> [PASS][524]
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          [FAIL][525] ([i915#13027]) -> [PASS][526] +1 other test pass
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-dg1:          [DMESG-WARN][527] ([i915#4423]) -> [PASS][528]
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-17/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-14/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-snb:          [INCOMPLETE][529] ([i915#12314] / [i915#12745]) -> [PASS][530]
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          [FAIL][531] -> [PASS][532] +1 other test pass
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][533] ([i915#14544] / [i915#3555]) -> [PASS][534] +3 other tests pass
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-rkl:          [SKIP][535] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][536] +13 other tests pass
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][537] ([i915#3555] / [i915#8228]) -> [PASS][538]
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@kms_hdr@static-toggle.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-rkl:          [SKIP][539] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][540] +2 other tests pass
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-rkl:          [INCOMPLETE][541] ([i915#13476]) -> [PASS][542]
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-rkl:          [SKIP][543] ([i915#14544] / [i915#7294]) -> [PASS][544] +2 other tests pass
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-rkl:          [SKIP][545] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) -> [PASS][546]
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@invalid-num-scalers.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#8152]) -> [PASS][548] +2 other tests pass
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:
    - shard-rkl:          [SKIP][549] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][550] +6 other tests pass
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-rkl:          [SKIP][551] ([i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][552] +1 other test pass
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-rkl:          [SKIP][553] ([i915#12247] / [i915#14544]) -> [PASS][554] +5 other tests pass
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][555] ([i915#9519]) -> [PASS][556] +2 other tests pass
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#9519]) -> [PASS][558]
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          [SKIP][559] ([i915#11521] / [i915#14544]) -> [PASS][560] +2 other tests pass
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [SKIP][561] ([i915#14544]) -> [PASS][562] +48 other tests pass
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][563] ([i915#5465]) -> [PASS][564] +2 other tests pass
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-tglu-10/igt@kms_setmode@basic.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-2:
    - shard-rkl:          [FAIL][565] -> [PASS][566]
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_setmode@basic@pipe-a-hdmi-a-2.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-2.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][567] ([i915#5465]) -> [PASS][568] +2 other tests pass
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-2:
    - shard-rkl:          [FAIL][569] ([i915#5465]) -> [PASS][570] +1 other test pass
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-dg2:          [FAIL][571] ([i915#5465]) -> [PASS][572] +2 other tests pass
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [FAIL][573] ([i915#10393]) -> [PASS][574] +1 other test pass
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-4/igt@kms_vrr@negative-basic.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_vrr@negative-basic.html

  * igt@perf@gen12-group-concurrent-oa-buffer-read:
    - shard-rkl:          [DMESG-WARN][575] ([i915#12964]) -> [PASS][576] +41 other tests pass
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@perf@gen12-group-concurrent-oa-buffer-read.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@perf@gen12-group-concurrent-oa-buffer-read.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][577] ([i915#4349]) -> [PASS][578] +3 other tests pass
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-14/igt@perf_pmu@busy-double-start@vcs1.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-15/igt@perf_pmu@busy-double-start@vcs1.html
    - shard-mtlp:         [FAIL][579] ([i915#4349]) -> [PASS][580] +2 other tests pass
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-6/igt@perf_pmu@busy-double-start@vcs1.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [INCOMPLETE][581] ([i915#13520]) -> [PASS][582]
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-3/igt@perf_pmu@rc6-suspend.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-rkl:          [SKIP][583] ([i915#8411]) -> [SKIP][584] ([i915#14544] / [i915#8411])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][585] ([i915#11078] / [i915#14544]) -> [SKIP][586] ([i915#11078])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][587] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][588] ([i915#3555] / [i915#9323])
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          [SKIP][589] ([i915#14544] / [i915#280]) -> [SKIP][590] ([i915#280])
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_ctx_sseu@engines.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          [SKIP][591] ([i915#280]) -> [SKIP][592] ([i915#2575])
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@gem_ctx_sseu@invalid-args.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          [SKIP][593] ([i915#280]) -> [SKIP][594] ([i915#14544] / [i915#280])
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][595] ([i915#14544] / [i915#4525]) -> [SKIP][596] ([i915#4525]) +2 other tests skip
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-rkl:          [SKIP][597] ([i915#4525]) -> [SKIP][598] ([i915#14544] / [i915#4525]) +1 other test skip
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_capture@capture:
    - shard-dg2:          [FAIL][599] ([i915#11965]) -> [SKIP][600] ([i915#2575])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@gem_exec_capture@capture.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          [SKIP][601] ([i915#14544] / [i915#6344]) -> [SKIP][602] ([i915#6344])
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_reloc@basic-gtt:
    - shard-dg2:          [SKIP][603] ([i915#3281]) -> [SKIP][604] ([i915#2575])
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-6/igt@gem_exec_reloc@basic-gtt.html
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_exec_reloc@basic-gtt.html
    - shard-rkl:          [SKIP][605] ([i915#3281]) -> [SKIP][606] ([i915#14544] / [i915#3281]) +2 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@gem_exec_reloc@basic-gtt.html
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_exec_reloc@basic-gtt.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][607] ([i915#14544] / [i915#3281]) -> [SKIP][608] ([i915#3281]) +12 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          [SKIP][609] ([i915#14544] / [i915#2190]) -> [SKIP][610] ([i915#2190])
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][611] ([i915#14544] / [i915#4613]) -> [SKIP][612] ([i915#4613]) +3 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          [SKIP][613] ([i915#4613]) -> [SKIP][614] ([i915#14544] / [i915#4613]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_media_vme:
    - shard-rkl:          [SKIP][615] ([i915#14544] / [i915#284]) -> [SKIP][616] ([i915#284])
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_media_vme.html
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          [SKIP][617] ([i915#4077]) -> [SKIP][618] ([i915#2575]) +2 other tests skip
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_wc@read:
    - shard-dg2:          [SKIP][619] ([i915#4083]) -> [SKIP][620] ([i915#2575])
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@gem_mmap_wc@read.html
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          [SKIP][621] ([i915#14544] / [i915#3282]) -> [SKIP][622] ([i915#3282]) +5 other tests skip
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@display:
    - shard-rkl:          [SKIP][623] ([i915#3282]) -> [SKIP][624] ([i915#14544] / [i915#3282]) +1 other test skip
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@gem_pread@display.html
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_pread@display.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          [SKIP][625] ([i915#14544] / [i915#4270]) -> [TIMEOUT][626] ([i915#12964])
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [SKIP][627] ([i915#13717]) -> [TIMEOUT][628] ([i915#12917] / [i915#12964])
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-dg2:          [SKIP][629] ([i915#4270]) -> [SKIP][630] ([i915#2575])
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_readwrite@read-bad-handle:
    - shard-dg2:          [SKIP][631] ([i915#3282]) -> [SKIP][632] ([i915#2575])
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@gem_readwrite@read-bad-handle.html
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_readwrite@read-bad-handle.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-dg2:          [SKIP][633] ([i915#5190] / [i915#8428]) -> [SKIP][634] ([i915#2575] / [i915#5190])
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          [SKIP][635] ([i915#14544] / [i915#8411]) -> [SKIP][636] ([i915#8411])
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          [SKIP][637] ([i915#3297] / [i915#4880]) -> [SKIP][638] ([i915#2575])
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-rkl:          [SKIP][639] ([i915#14544] / [i915#3297]) -> [SKIP][640] ([i915#3297])
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-rkl:          [SKIP][641] ([i915#14544] / [i915#2527]) -> [SKIP][642] ([i915#2527]) +2 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-dg2:          [SKIP][643] ([i915#2856]) -> [SKIP][644] ([i915#2575])
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@gen9_exec_parse@cmd-crossing-page.html
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-rkl:          [SKIP][645] ([i915#2527]) -> [SKIP][646] ([i915#14544] / [i915#2527]) +2 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-rkl:          [SKIP][647] ([i915#14544] / [i915#8399]) -> [SKIP][648] ([i915#8399])
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][649] ([i915#14544] / [i915#7984]) -> [SKIP][650] ([i915#7984])
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@i915_power@sanity.html
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@i915_power@sanity.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-dg1:          [SKIP][651] ([i915#4212]) -> [SKIP][652] ([i915#4212] / [i915#4423])
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_atomic@plane-primary-legacy:
    - shard-rkl:          [SKIP][653] ([i915#14544]) -> [DMESG-WARN][654] ([i915#12964])
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_atomic@plane-primary-legacy.html
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_atomic@plane-primary-legacy.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][655] ([i915#14544]) -> [SKIP][656] ([i915#9531])
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          [SKIP][657] ([i915#14544]) -> [SKIP][658] ([i915#1769] / [i915#3555]) +1 other test skip
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][659] ([i915#5286]) -> [SKIP][660] ([i915#14544]) +2 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-rkl:          [SKIP][661] ([i915#14544]) -> [SKIP][662] ([i915#5286]) +2 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          [SKIP][663] ([i915#3638]) -> [SKIP][664] ([i915#14544])
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2:          [SKIP][665] ([i915#4538] / [i915#5190]) -> [SKIP][666] ([i915#5190]) +1 other test skip
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          [SKIP][667] ([i915#3638]) -> [SKIP][668] ([i915#3638] / [i915#4423])
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-15/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][669] ([i915#14544]) -> [SKIP][670] ([i915#3638]) +3 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-rkl:          [SKIP][671] ([i915#14544]) -> [SKIP][672] +19 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][673] -> [SKIP][674] ([i915#14544]) +7 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][675] ([i915#6095]) -> [SKIP][676] ([i915#14098] / [i915#6095]) +3 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][677] ([i915#14544]) -> [SKIP][678] ([i915#12313]) +4 other tests skip
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][679] ([i915#10307] / [i915#6095]) -> [SKIP][680] +1 other test skip
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][681] ([i915#14544]) -> [SKIP][682] ([i915#12805])
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][683] ([i915#12313]) -> [SKIP][684] ([i915#14544])
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-dg1:          [SKIP][685] ([i915#6095]) -> [SKIP][686] ([i915#4423] / [i915#6095])
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][687] ([i915#14098] / [i915#6095]) -> [SKIP][688] ([i915#14544]) +10 other tests skip
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-rkl:          [SKIP][689] ([i915#14544]) -> [SKIP][690] ([i915#14098] / [i915#6095]) +10 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][691] ([i915#14098] / [i915#6095]) -> [SKIP][692] ([i915#6095]) +1 other test skip
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][693] ([i915#14544] / [i915#3742]) -> [SKIP][694] ([i915#3742]) +1 other test skip
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-dg2:          [SKIP][695] ([i915#11151] / [i915#7828]) -> [SKIP][696] ([i915#2575]) +1 other test skip
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@kms_chamelium_edid@dp-mode-timings.html
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][697] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][698] ([i915#11151] / [i915#7828]) +8 other tests skip
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-rkl:          [SKIP][699] ([i915#11151] / [i915#7828]) -> [SKIP][700] ([i915#11151] / [i915#14544] / [i915#7828]) +6 other tests skip
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2:          [FAIL][701] ([i915#7173]) -> [SKIP][702] ([i915#7118] / [i915#9424])
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          [SKIP][703] ([i915#7118] / [i915#9424]) -> [SKIP][704] ([i915#2575])
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-1/igt@kms_content_protection@legacy.html
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_content_protection@legacy.html
    - shard-rkl:          [SKIP][705] ([i915#7118] / [i915#9424]) -> [SKIP][706] ([i915#14544])
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_content_protection@legacy.html
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          [SKIP][707] ([i915#14544]) -> [SKIP][708] ([i915#7118] / [i915#9424])
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_content_protection@uevent.html
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          [SKIP][709] ([i915#14544]) -> [SKIP][710] ([i915#13049]) +1 other test skip
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][711] ([i915#13049]) -> [SKIP][712] ([i915#14544])
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][713] ([i915#14544]) -> [SKIP][714] ([i915#3555]) +5 other tests skip
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          [SKIP][715] ([i915#14544]) -> [SKIP][716] ([i915#4103]) +1 other test skip
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          [SKIP][717] ([i915#14544]) -> [SKIP][718] ([i915#13691])
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2:          [SKIP][719] ([i915#13749]) -> [SKIP][720]
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-rkl:          [SKIP][721] ([i915#13749]) -> [SKIP][722] ([i915#14544])
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst.html
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          [SKIP][723] ([i915#13707]) -> [SKIP][724] ([i915#14544])
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][725] ([i915#14544]) -> [SKIP][726] ([i915#13707])
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          [SKIP][727] ([i915#14544]) -> [SKIP][728] ([i915#3555] / [i915#3840])
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-rkl:          [SKIP][729] ([i915#3840] / [i915#9053]) -> [SKIP][730] ([i915#14544])
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@psr2:
    - shard-rkl:          [SKIP][731] ([i915#14544] / [i915#658]) -> [SKIP][732] ([i915#658])
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_feature_discovery@psr2.html
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          [SKIP][733] ([i915#9934]) -> [SKIP][734] ([i915#2575]) +2 other tests skip
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-rkl:          [SKIP][735] ([i915#14544] / [i915#9934]) -> [SKIP][736] ([i915#9934]) +3 other tests skip
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-rkl:          [SKIP][737] ([i915#9934]) -> [SKIP][738] ([i915#14544] / [i915#9934]) +7 other tests skip
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_flip@2x-plain-flip-ts-check.html
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [DMESG-WARN][739] ([i915#12964]) -> [SKIP][740] ([i915#14544] / [i915#3637])
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_flip@flip-vs-panning-interruptible.html
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [INCOMPLETE][741] ([i915#6113]) -> [SKIP][742] ([i915#14544] / [i915#3637])
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][743] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][744] ([i915#12745] / [i915#4839])
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][745] ([i915#14544] / [i915#3555]) -> [SKIP][746] ([i915#2672] / [i915#3555]) +5 other tests skip
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][747] ([i915#2672] / [i915#3555]) -> [SKIP][748] ([i915#14544] / [i915#3555]) +3 other tests skip
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          [SKIP][749] -> [SKIP][750] ([i915#4423]) +1 other test skip
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][751] ([i915#1825]) -> [SKIP][752] ([i915#14544] / [i915#1849] / [i915#5354]) +21 other tests skip
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][753] ([i915#8708]) -> [SKIP][754] ([i915#4423] / [i915#8708])
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-dg2:          [SKIP][755] ([i915#8708]) -> [SKIP][756] +3 other tests skip
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg1:          [SKIP][757] ([i915#3458]) -> [SKIP][758] ([i915#3458] / [i915#4423])
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][759] ([i915#10433] / [i915#3458]) -> [SKIP][760] ([i915#3458]) +1 other test skip
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][761] ([i915#3458]) -> [SKIP][762] ([i915#10433] / [i915#3458])
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][763] ([i915#5354]) -> [SKIP][764] +4 other tests skip
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-rkl:          [SKIP][765] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][766] ([i915#1825]) +38 other tests skip
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          [SKIP][767] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][768] ([i915#5439])
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          [SKIP][769] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][770] ([i915#3023]) +19 other tests skip
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          [SKIP][771] ([i915#3458]) -> [SKIP][772] +5 other tests skip
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-rkl:          [SKIP][773] ([i915#3023]) -> [SKIP][774] ([i915#14544] / [i915#1849] / [i915#5354]) +14 other tests skip
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [774]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][775] ([i915#1187] / [i915#12713]) -> [SKIP][776] ([i915#12713])
   [775]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [776]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          [SKIP][777] ([i915#3555] / [i915#8228]) -> [SKIP][778] ([i915#14544]) +1 other test skip
   [777]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html
   [778]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          [SKIP][779] ([i915#10656] / [i915#14544]) -> [SKIP][780] ([i915#10656]) +1 other test skip
   [779]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html
   [780]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][781] ([i915#13688] / [i915#14544]) -> [SKIP][782] ([i915#13688])
   [781]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html
   [782]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          [SKIP][783] ([i915#12339]) -> [SKIP][784]
   [783]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@kms_joiner@basic-ultra-joiner.html
   [784]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          [SKIP][785] ([i915#13522] / [i915#14544]) -> [SKIP][786] ([i915#13522])
   [785]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [786]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][787] ([i915#14544] / [i915#4070] / [i915#4816]) -> [SKIP][788] ([i915#4816])
   [787]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [788]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          [SKIP][789] ([i915#14544]) -> [SKIP][790] ([i915#6301])
   [789]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_panel_fitting@legacy.html
   [790]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][791] ([i915#14544]) -> [SKIP][792] ([i915#13958]) +1 other test skip
   [791]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [792]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-dg2:          [SKIP][793] ([i915#13046] / [i915#5354] / [i915#9423]) -> [SKIP][794] ([i915#2575] / [i915#9423])
   [793]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [794]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-rkl:          [SKIP][795] ([i915#12247]) -> [SKIP][796] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
   [795]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [796]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][797] ([i915#12247]) -> [SKIP][798] ([i915#12247] / [i915#14544])
   [797]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html
   [798]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][799] ([i915#14544] / [i915#5354]) -> [SKIP][800] ([i915#5354])
   [799]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html
   [800]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][801] ([i915#14544] / [i915#9685]) -> [SKIP][802] ([i915#9685])
   [801]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html
   [802]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [SKIP][803] ([i915#3361]) -> [FAIL][804] ([i915#9295])
   [803]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html
   [804]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          [SKIP][805] ([i915#4281]) -> [SKIP][806] ([i915#3361])
   [805]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html
   [806]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-rkl:          [SKIP][807] ([i915#9519]) -> [SKIP][808] ([i915#14544] / [i915#9519]) +1 other test skip
   [807]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html
   [808]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][809] ([i915#14544] / [i915#9519]) -> [SKIP][810] ([i915#9519])
   [809]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [810]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][811] ([i915#14544] / [i915#6524]) -> [SKIP][812] ([i915#6524])
   [811]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
   [812]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][813] ([i915#11520]) -> [SKIP][814] ([i915#11520] / [i915#14544]) +3 other tests skip
   [813]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [814]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
    - shard-dg2:          [SKIP][815] ([i915#11520]) -> [SKIP][816]
   [815]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
   [816]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][817] ([i915#11520] / [i915#14544]) -> [SKIP][818] ([i915#11520]) +7 other tests skip
   [817]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [818]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          [SKIP][819] ([i915#9683]) -> [SKIP][820] ([i915#14544] / [i915#9683])
   [819]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html
   [820]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
    - shard-dg2:          [SKIP][821] ([i915#1072] / [i915#9732]) -> [SKIP][822] +4 other tests skip
   [821]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html
   [822]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html
    - shard-dg1:          [SKIP][823] ([i915#1072] / [i915#9732]) -> [SKIP][824] ([i915#1072] / [i915#4423] / [i915#9732]) +1 other test skip
   [823]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg1-13/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html
   [824]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html

  * igt@kms_psr@pr-cursor-mmap-cpu:
    - shard-rkl:          [SKIP][825] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][826] ([i915#1072] / [i915#9732]) +19 other tests skip
   [825]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html
   [826]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_psr@pr-cursor-mmap-cpu.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-rkl:          [SKIP][827] ([i915#1072] / [i915#9732]) -> [SKIP][828] ([i915#1072] / [i915#14544] / [i915#9732]) +12 other tests skip
   [827]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-5/igt@kms_psr@pr-cursor-plane-onoff.html
   [828]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2:          [SKIP][829] ([i915#9685]) -> [SKIP][830]
   [829]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [830]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2:          [SKIP][831] ([i915#12755] / [i915#5190]) -> [SKIP][832] ([i915#2575] / [i915#5190])
   [831]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [832]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          [SKIP][833] ([i915#5289]) -> [SKIP][834] ([i915#14544]) +2 other tests skip
   [833]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [834]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-rkl:          [SKIP][835] ([i915#14544] / [i915#3555]) -> [SKIP][836] ([i915#3555]) +1 other test skip
   [835]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html
   [836]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@flip-dpms:
    - shard-rkl:          [SKIP][837] ([i915#3555]) -> [SKIP][838] ([i915#14544]) +2 other tests skip
   [837]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-4/igt@kms_vrr@flip-dpms.html
   [838]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_vrr@flip-dpms.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][839] ([i915#14544] / [i915#2436]) -> [SKIP][840] ([i915#2436])
   [839]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [840]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][841] ([i915#14544] / [i915#2433]) -> [SKIP][842] ([i915#2433])
   [841]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html
   [842]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][843] ([i915#14544] / [i915#8516]) -> [SKIP][844] ([i915#8516])
   [843]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [844]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-dg2:          [SKIP][845] ([i915#3708] / [i915#4077]) -> [SKIP][846] ([i915#2575])
   [845]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@prime_vgem@basic-fence-mmap.html
   [846]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][847] ([i915#14544] / [i915#3708]) -> [SKIP][848] ([i915#3708])
   [847]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [848]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          [SKIP][849] ([i915#14544] / [i915#9917]) -> [SKIP][850] ([i915#9917])
   [849]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [850]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
  [i915#10393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
  [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
  [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
  [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14553
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14756
  [i915#14850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14850
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8521 -> IGTPW_13683
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_17124: 2b95afd5f659a01a6fc8195358e62077846b97e7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13683: 7810a440dcf37f7ffa255652505defe3db80ce58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8521: 8521
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index.html

--===============0766845495033335827==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/intel/kms_frontbuffer_tracking: Remove=
 FBC modulo 4 restriction for ADL-P+</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153924/">https://patchwork.freedesktop.org/series/153924/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13683/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_17124_full -&gt; IGTPW_13683_full<=
/h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_13683_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_13683_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/index=
.html</p>
<h2>Participating hosts (10 -&gt; 11)</h2>
<p>Additional (1): shard-tglu-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1368=
3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@gem_ctx_persistence@smoketest.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard=
-rkl-8/igt@gem_ctx_persistence@smoketest.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_17124/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/sh=
ard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-6/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_17124/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_17124/shard-dg2-11/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/sha=
rd-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_17124/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-1/igt@i915_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_17124/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg=
2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-7/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
7124/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-4/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/CI_DRM_17124/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-8/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/CI_DRM_17124/shard-dg2-5/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/=
shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17124/shard-dg2-3/igt@i915_module_loa=
d@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13683/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/s=
hard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13683/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13683/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5=
/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13683/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@i915_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1368=
3/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i9=
15_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@i915_module_load@load.html">PASS</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@objects:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-11/igt@i915_selftest@live@objects.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-d=
g2-8/igt@i915_selftest@live@objects.html">FAIL</a> +38 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledpri=
mary.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledpr=
imary.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-no-semaphores:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-6/igt@perf_pmu@busy-idle-no-semaphores.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/sh=
ard-dg2-8/igt@perf_pmu@busy-idle-no-semaphores.html">SKIP</a> +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@faulting-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@perf_pmu@faulting-read.html">SKIP=
</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14118">i915#14118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13683/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-hang-all.ht=
ml">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-evict-pwrite:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-3/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i9=
15#4077</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13683/shard-dg2-8/igt@i915_pm_rpm@gem-evict-pwrite.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12061">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13683/shard-dg2-8/igt@i915_selftest@live@workarounds.html">FAI=
L</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_17124_full and IGTPW_13683=
_full:</p>
<h3>New IGT tests (49)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-c-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-d-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-b-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-c-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-4-size-64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.59] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13683_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@api_intel_bb@blit-reloc-keep-cach=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@api_intel_bb@object-reloc-keep-ca=
che.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@fbdev=
@nullptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2582">i915#2582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile64-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@gem_ccs@suspend-resume@tile64-com=
pressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#133=
56</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_create@create-ext-cpu-access-=
big.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13427">i915#13427</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@gem_ctx_param@set-priority-not-s=
upported.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-snb5/igt@gem_ctx_persistence@engines-persis=
tence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1099">i915#1099</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hos=
tile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_ctx_sseu@invalid-sseu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_exec_balancer@bonded-false-h=
ang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4812">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@gem_exec_balancer@bonded-sync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8555">i915#8555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_exec_balancer@parallel-contex=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-tglu-10/igt@gem_exec_big@single.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-5/=
igt@gem_exec_big@single.html">ABORT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11713">i915#11713</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14756">i915#14756</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6334">i915#6334</a>) +2 other tests skip</li>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk10/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_fence@submit3.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_flush@basic-wb-set-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_exec_reloc@basic-cpu-read-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gem_exec_reloc@basic-softpin.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3281">i915#3281</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@gem_exec_reloc@basic-softpin.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@gem_exec_reloc@basic-softpin.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@gem_exec_reloc@basic-wc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gem_exec_schedule@reorder-wide.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4537">i915#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gem_fence_thrash@bo-copy.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4860">i915#4860</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@gem_fence_thrash@bo-copy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4860">i915#4860</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@gem_fence_thrash@bo-copy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4860">i915#4860</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-f=
ences-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-r=
andom.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_lmem_swapping@random-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/s=
hard-dg1-17/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i915#5493=
</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4613">i915#4613</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@gem_mmap@basic-small-bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo-tiledy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_mmap_gtt@basic-small-bo-tiled=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@gem_mmap_gtt@cpuset-medium-copy-=
xy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-medium-copy-=
xy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@gem_mmap_gtt@medium-copy-xy.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4077">i915#4077</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_mmap_wc@write-read-distinct.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@gem_partial_pwrite_pread@reads-un=
cached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@gem_partial_pwrite_pread@write-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@gem_partial_pwrite_pread@write-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@gem_pwrite@basic-self.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@gem_pxp@create-regular-context-1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/sh=
ard-rkl-2/igt@gem_pxp@create-regular-context-1.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">i915#129=
17</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_pxp@create-valid-protected-co=
ntext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4270">i915#4270</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@gem_pxp@reject-modify-context-pr=
otection-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@gem_pxp@verify-pxp-key-change-aft=
er-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4270">i915#4270</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-opto=
ut-execution.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_readwrite@read-bad-handle.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_render_copy@mixed-tiled-to-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</l=
i>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-3/igt@gem_render_copy@mixed-tiled-to-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@gem_render_copy@mixed-tiled-to-yf=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk6/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> +394 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_set_tiling_vs_gtt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/407=
9">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gem_userptr_blits@invalid-mmap-o=
ffset-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@gem_userptr_blits@map-fixed-inva=
lidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-inva=
lidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gem_userptr_blits@map-fixed-inval=
idate-overlap-busy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4880">i915#4880</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@gem_workarounds@suspend-resume-fd.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/s=
hard-rkl-3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a>)</li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/sh=
ard-glk3/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13=
356</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14586">i915#14586</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@gen9_exec_parse@allowed-single.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@gen9_exec_parse@bb-start-param.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@gen9_exec_parse@bb-start-param.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2856">i915#2856</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gen9_exec_parse@cmd-crossing-page=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_drm_fdinfo@all-busy-idle-che=
ck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@i915_drm_fdinfo@busy@rcs0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@i915_drm_fdinfo@busy@rcs0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@busy@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@i915_drm_fdinfo@busy@vecs1.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14073">i915#14073</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@isolation@vcs0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@i915_drm_fdinfo@isolation@vcs0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14073">i915#14073</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@i915_drm_fdinfo@virtual-busy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14118">i915#14118</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-idl=
e-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-idle=
-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-4/igt@i915_module_load@reload-no-display.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-dg2-5/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i91=
5#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14545">i915#14545</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-15/igt@i915_module_load@reload-no-display.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683=
/shard-dg1-19/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i=
915#13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14545">i915#14545</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.=
html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13790">i915#13790</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2681">i915#2681</a>) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/s=
hard-glk8/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#=
13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6621">i915#6621</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@i915_pm_rps@waitboost.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/83=
46">i915#8346</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-6/igt@i915_power@sanity.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt=
@i915_power@sanity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@i915_query@hwconfig_table.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-3/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@i915_suspend@fence-restore-untiled.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-rkl-4/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915=
#4817</a>)</li>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-snb4/igt@i915_suspend@fence-restore-untiled.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/s=
hard-snb6/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4=
817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk9/igt@i915_suspend@sysfs-reader.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@intel_hwmon@hwmon-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atom=
ic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-glk6/igt@kms_async_flips@alternate-sync-async-flip-atomi=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_async_flips@alternate-sync-asy=
nc-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-7/igt@kms_async_flips@test-cursor-atom=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10333">i915#10333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-=
mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-5/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-fencing-internal-panels.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-mtlp-7/igt@kms_atomic_transi=
tion@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i91=
5#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_big_fb@4-tiled-16bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-2=
70.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13683/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@kms_big_fb@linear-16bpp-rotate-2=
70.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_big_fb@x-tiled-16bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683=
/shard-dg2-8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-18/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-dg1-12/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391">i915=
#4391</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_big_fb@y-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_big_fb@yf-tiled-64bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/5190">i915#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> +15 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +135 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_ccs@bad-pixel-format-4-tiled-=
mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +133 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-l=
nl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +48 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-yf-tile=
d-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_ccs@crc-primary-basic-y-tiled=
-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +13 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-10/igt@kms_ccs@crc-primary-suspend-y-t=
iled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +59 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-y-til=
ed-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_cdclk@mode-transition@pipe-d-=
hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-c-d=
p-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13783">i915#13783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_chamelium_color@degamma.html"=
>SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-16/igt@kms_chamelium_edid@dp-edid-read.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-6/igt@kms_chamelium_frames@dp-crc-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_chamelium_frames@dp-frame-dum=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_chamelium_frames@hdmi-frame-d=
ump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7828">i915#7828</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_chamelium_hpd@vga-hpd.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7828">i915#7828</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-with-en=
abled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_color@ctm-red-to-blue.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl=
-6/igt@kms_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/12655">i915#12655</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_content_protection@atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/7173">i915#7173</a>) +1 other test fail</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_content_protection@atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_content_protection@atomic-dpm=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3299">i915#3299</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3299">i915#3299</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_content_protection@lic-type-0=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-5=
12x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
683/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i=
915#13566</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13049">i915#13049</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-ma=
x-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_cursor_crc@cursor-random-256x85.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683=
/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13=
566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x=
85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_cursor_crc@cursor-random-32x1=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-15/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-snb5/igt@kms_cursor_crc@cursor-rapid-moveme=
nt-512x512.html">SKIP</a> +158 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-12=
8x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk8/igt@kms_cursor_crc@cursor-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14152">i915#14152</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7882">i915#7882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk8/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14152">i915#14152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_cursor_legacy@2x-long-flip-v=
s-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_cursor_legacy@basic-flip-after-cursor-ato=
mic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13683/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-ato=
mic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk10/igt@kms_cursor_legacy@basic-flip-afte=
r-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11190">i915#11190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flip=
b-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>=
)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">=
i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-toggle:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-12/igt@kms_cursor_legacy@short-flip-after-cursor-to=
ggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-dg1-12/igt@kms_cursor_legacy@short-flip-after-cursor-t=
oggle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4423">i915#4423</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13749">i915#13749</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13749">i915#13749</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_dp_link_training@non-uhbr-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_dp_linktrain_fallback@dsc-fal=
lback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3840">i915#3840</a>) +1 other test skip</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_dsc@dsc-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3469">i915#3469</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_feature_discovery@chamelium.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-11/igt@kms_feature_discovery@psr2.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_fence_pin_leak.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881">=
i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip@2x-blocking-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-m=
odeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-glk9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-glk8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13683/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14033">i915#14033</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@2x-modeset-vs-vblank-rac=
e-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test =
skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-14/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-1/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_flip@2x-plain-flip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/99=
34">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-10/igt@kms_flip@2x-plain-flip-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_flip@2x-wf_vblank-ts-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_flip@dpms-off-confusion-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip@flip-vs-fences.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_flip@flip-vs-panning.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-=
6/igt@kms_flip@flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk5/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check-inter=
ruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3637">i915#3637</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
2 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)<=
/li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813=
">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2=
672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8813">i915#8813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#258=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2672">i915#2672</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#258=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>) +8 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915=
#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i9=
15#5190</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#355=
5</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-4/igt@kms_flip_tiling@flip-change-tiling.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-rkl-6/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-12/igt@kms_force_connector_basic@force-connector-st=
ate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13683/shard-dg1-12/igt@kms_force_connector_basic@force-connector-st=
ate.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5=
354">i915#5354</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-suspend.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
683/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-suspend.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14850">i=
915#14850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +27 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +24 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-f=
arfromfence-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3458">i915#3458</a>) +17 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3023">i915#3023</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb565-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3458">i915#3458</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb1=
01010-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb=
101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_hdr@bpc-switch.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_hdr@static-toggle.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shar=
d-dg2-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#=
8228</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk10/igt@kms_invalid_mode@zero-hdisplay.ht=
ml">SKIP</a> +262 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-8/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12388">i915#12388</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12339">i915#12339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@kms_joiner@invalid-modeset-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-plane:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_lease@lease-invalid-plane.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard=
-rkl-6/igt@kms_lease@lease-invalid-plane.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +29=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pipe_b_c_ivb@enable-pipe-c-w=
hile-b-has-3-lanes.html">SKIP</a> +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-cr=
c.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12756">i915#12756</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-cr=
c@pipe-b-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13409">i915#13409</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476">i915#13476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane@plane-panning-bottom-ri=
ght.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_plane@plane-position-hole.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard=
-rkl-6/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque=
-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_plane_alpha_blend@alpha-opaque=
-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk3/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_alpha_blend@coverage-7e=
fc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7294">i915#7294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_plane_multiple@2x-tiling-x.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-4/igt@kms_plane_multiple@2x-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-mo=
difiers.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-wit=
h-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor=
-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i=
915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8152">i915#8152</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-7=
5-upscale-20x20.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_plane_scaling@planes-downsca=
le-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +7 other tests skip</l=
i>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-downscal=
e-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#815=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25@=
pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-=
25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_backlight@fade.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/98=
12">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_pm_backlight@fade-with-suspen=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_dc@dc5-retention-flops.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3828">i915#3828</a>)</li>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">=
i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-4/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/=
igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9519">i915#9519</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shar=
d-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-dg2-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-10/igt@kms_pm_rpm@modeset-non-lpsp-str=
ess-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_pm_rpm@pm-caching.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/i=
gt@kms_pm_rpm@pm-caching.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +38 other tes=
ts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_prime@basic-crc-vgem.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6524">i915#6524</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6805">i915#6805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk3/igt@kms_psr2_sf@fbc-pr-plane-move-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/11520">i915#11520</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-primary-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</=
li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-snb1/igt@kms_psr2_sf@psr2-overlay-plane-upd=
ate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk10/igt@kms_psr2_sf@psr2-plane-move-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_psr2_sf@psr2-primary-plane-up=
date-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-3/igt@kms_psr2_su@frontbuffer-xrgb8888.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-8/igt@kms_psr@fbc-pr-cursor-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9688">i915#9688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_psr@fbc-pr-primary-mmap-gtt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr@psr-cursor-mmap-cpu.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</=
li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-14/igt@kms_psr@psr-cursor-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_psr@psr-sprite-plane-onoff.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-5/igt@kms_psr@psr2-cursor-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_psr@psr2-primary-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-6/igt@kms_rotation_crc@bad-tiling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12755">i915#12755</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_scaling_modes@scaling-mode-no=
ne.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk9/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3683/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_vblank@ts-continuation-dpms-s=
uspend@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_vrr@flip-basic-fastset.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906">i915#9906</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg1-18/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-mtlp-2/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8808">i915#8808</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_vrr@max-min.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i91=
5#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-9/igt@kms_vrr@seamless-rr-switch-vrr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9906">i915#9906</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_writeback@writeback-check-out=
put-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-glk6/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2437">i915#2437</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@kms_writeback@writeback-fb-id-xrg=
b2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9412">i915#9412</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_writeback@writeback-pixel-for=
mats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@perf@global-sseu-config.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
387">i915#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@perf_pmu@busy-double-start.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12964">i915#12964</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@perf_pmu@busy-double-start@vecs1.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@perf_pmu@frequency@gt0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
549">i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6806">i915#6806</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@perf_pmu@module-unload.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
433">i915#14433</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@perf_pmu@module-unload.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@prime_vgem@basic-fence-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-r=
kl-6/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#370=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@prime_vgem@basic-fence-read.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3291">i915#3291</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-9:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-9/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-random:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-tglu-1/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-dg2-1/igt@sriov_basic@enable-vfs-autoprobe-=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-single-wait-for-submit-submitted:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-3/igt@syncobj_timeline@etime-single-wait-for-submit=
-submitted.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13683/shard-dg2-8/igt@syncobj_timeline@etime-single-wait-for=
-submit-submitted.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2575">i915#2575</a>) +37 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@fbdev@eof.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582">i915#=
2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3683/shard-rkl-3/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-4/igt@gem_ccs@suspend-resume@linear-compressed-comp=
fmt0-smem-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-5/igt@gem_ccs@sus=
pend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#5784</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2=
-4/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-13/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784">i915#57=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_136=
83/shard-dg1-17/igt@gem_eio@unwedge-stress.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-glk1/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196"=
>i915#13196</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13683/shard-glk9/igt@gem_exec_suspend@basic-s3.html">=
PASS</a> +1 other test pass</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356=
">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@gem_pxp@display-protected-crc.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1291=
7">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_pxp@display-protected-crc=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@gem_pxp@fail-invalid-protected-context.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_pxp@fail-invalid-protected-conte=
xt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-snb4/igt@i915_module_load@reload-no-display.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14545">i915#14545</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13683/shard-snb1/igt@i915_module_load@reload-no-display.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-tglu-3/igt@i915_suspend@forcewake.html">ABORT</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-tglu=
-7/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_color@degamma.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-rkl-5/igt@kms_color@degamma.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-tglu-7/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13683/shard-tglu-2/igt@kms_cursor_crc@cursor-ra=
ndom-128x42@pipe-a-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13683/shard-rkl-8/igt@kms_cursor_crc@cursor-random-64x21.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-va=
rying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_cu=
rsor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html=
">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13683/shard-glk1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-snb5/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb=
6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_feature_discovery@display-1x.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9738">i915#9738</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_feature_discovery@display-1=
x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-snb6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html=
">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14033">i915#14033</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14350">i915#14350</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb1/igt@kms_flip@2x-flip-vs=
-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-snb6/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-v=
ga1-hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb1/igt@kms_flip@2x-flip-vs=
-suspend-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3637">i915#3637</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_flip@flip-=
vs-absolute-wf_vblank-interruptible.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14553">i915#14553</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/13027">i915#13027</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_flip@flip-vs-expired-vblank-=
interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-17/igt@kms_flip@flip-vs-rmfb-interruptible.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13683/shard-dg1-14/igt@kms_flip@flip-vs-rmfb-interruptible.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-=
a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12745">i915#12745</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-snb5/igt@kms_flip@=
flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bp=
p-xtile-downscaling@pipe-a-valid-mode.html">FAIL</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-17/igt@kms_flip_s=
caled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@=
kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS<=
/a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@k=
ms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> +13 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-dg2-11/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_invalid_mode@ba=
d-hsync-end.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_pipe_crc_basic@suspend-read-crc.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/13476">i915#13476</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/7294">i915#7294</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_plane_alpha_blend@c=
onstant-alpha-max.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@invalid-num-scalers.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/ig=
t@kms_plane_scaling@invalid-num-scalers.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_p=
lane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> +2 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#815=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1368=
3/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifier=
s@pipe-b.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_plane_s=
caling@planes-upscale-20x20.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_plane_scalin=
g@planes-upscale-20x20@pipe-a.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-3/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9519=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683=
/shard-rkl-4/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +2 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9519">i915#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-n=
on-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11521">i915#11521</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_properties@plane-pr=
operties-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_rotation_crc@primary-rotation-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13683/shard-rkl-2/igt@kms_rotation_crc@primary-rotation-90.html=
">PASS</a> +48 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-tglu-10/igt@kms_setmode@basic.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465">i915#5465=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683=
/shard-tglu-4/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_setmode@basic@pipe-a-hdmi-a-2.html">FAIL<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/s=
hard-rkl-8/igt@kms_setmode@basic@pipe-a-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465"=
>i915#5465</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13683/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/546=
5">i915#5465</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-rkl-8/igt@kms_setmode@basic@pipe-b-hdmi-a-2.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/546=
5">i915#5465</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-dg2-6/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-4/igt@kms_vrr@negative-basic.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393">i915#1=
0393</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
3683/shard-mtlp-8/igt@kms_vrr@negative-basic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@perf@gen12-group-concurrent-oa-buffer-read.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@perf@gen12-group-concurrent-o=
a-buffer-read.html">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-14/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13683/shard-dg1-15/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a>=
 +3 other tests pass</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-6/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349=
">i915#4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13683/shard-mtlp-6/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-3/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520">i91=
5#13520</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_13683/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@api_intel_bb@blit-reloc-purge-cache.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/11078">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@device_reset@unbind-cold=
-reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/280">i915#280</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-rkl-2/igt@gem_ctx_sseu@engines.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-4/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#2=
80</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_136=
83/shard-dg2-8/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#2=
80</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_136=
83/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i=
915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@gem_exec_balancer@parallel-b=
alancer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4525">i915#4525</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_13683/shard-rkl-6/igt@gem_exec_balancer@parallel-out-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@gem_exec_capture@capture.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965">i915#=
11965</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13683/shard-dg2-8/igt@gem_exec_capture@capture.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6344">i915#6344</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_exec_capture@capture-re=
coverable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6344">i915#6344</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-6/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
683/shard-dg2-8/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
683/shard-rkl-6/igt@gem_exec_reloc@basic-gtt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">=
i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2190">i915#2190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13683/shard-rkl-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2=
190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_lmem_swapping@paral=
lel-random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13683/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i9=
15#284</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_13683/shard-rkl-2/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077=
">i915#4077</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13683/shard-dg2-8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-4/igt@gem_mmap_wc@read.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shar=
d-dg2-8/igt@gem_mmap_wc@read.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_partial_pwrite_pread=
@reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/3282">i915#3282</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@display:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@gem_pread@display.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/sha=
rd-rkl-6/igt@gem_pread@display.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4270">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_pxp@create-protected-buffer.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">=
i915#13717</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13683/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">=
i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-3/igt@gem_pxp@protected-encrypted-src-copy-not-read=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4270">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_pxp@protected-encrypted-sr=
c-copy-not-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-bad-handle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-7/igt@gem_readwrite@read-bad-handle.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i=
915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_13683/shard-dg2-8/igt@gem_readwrite@read-bad-handle.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-5/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8428">i915#8428</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_render_copy@yf-tiled-=
ccs-to-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2575">i915#2575</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@gem_set_tiling_vs_blt@unt=
iled-to-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overla=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4880">i915#4880</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@gem_userptr_blits@m=
ap-fixed-invalidate-overlap.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@gem_userptr_blits@reado=
nly-pwrite-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13683/shard-rkl-3/igt@gen9_exec_parse@bb-start-far.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-7/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/285=
6">i915#2856</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-dg2-8/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@gen9_exec_parse@secure-batches.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">=
i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13683/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@i915_pm_freq_api@freq-basic-api.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/798=
4">i915#7984</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-t=
iling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4212">i915#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_addfb_basic@addfb25-fram=
ebuffer-vs-set-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4212">i915#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_atomic@plane-primary-legacy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-rkl-2/igt@kms_atomic@plane-primary-legacy.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-trans=
ition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@km=
s_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1769">i915#1769</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-=
stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate=
-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_big_fb@4-tiled-=
max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_13683/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/453=
8">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5190">i915#5190</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-15/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
638">i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3638">i915#3638</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13683/shard-rkl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html=
">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/=
shard-rkl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-c=
c@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_ccs@bad-pixel=
-format-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095"=
>i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12313">i915#12313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-=
cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10307">i915#10307</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_ccs@crc-prim=
ary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_ccs@crc-primary-suspend-4-tile=
d-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-c=
cs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basi=
c-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-=
mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_ccs@cr=
c-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) =
+10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_ccs@missing-ccs-buffer-4-til=
ed-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +10 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pi=
pe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#60=
95</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_cdclk@mode-transition.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742=
">i915#3742</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-5/igt@kms_chamelium_edid@dp-mode-timings.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_chamelium_edid@dp-mode-ti=
mings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-8/igt@km=
s_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i9=
15#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151"=
>i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
173">i915#7173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-dg2-6/igt@kms_content_protection@atomic-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-1/igt@kms_content_protection@legacy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i=
915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_content_protection@legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_content_protection@legacy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i=
915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_content_protection@legacy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_content_protection@uevent.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13683/shard-rkl-8/igt@kms_content_protection@uevent.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915=
#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x51=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
13049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_13683/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13683/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-curs=
or-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_cursor_legacy=
@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13683/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-4/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
49">i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-dg2-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP=
</a></li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/137=
49">i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_13683/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/13707">i915#13707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_13683/shard-rkl-6/igt@kms_dp_linktrain_fallback@dp-fallback.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13683/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3=
555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9053">i915#9053</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_dsc@dsc-with-output-f=
ormats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_feature_discovery@psr2.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658"=
>i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-5/igt@kms_flip@2x-flip-vs-expired-vblank-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_flip@2x-flip-vs-expired-vbl=
ank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_flip@2x-flip-vs-panning.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934"=
>i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_13683/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_flip@flip-vs-panning-interruptible.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_flip@flip-vs-panning-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">=
i915#6113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_13683/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12314">i915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-glk5/igt@kms=
_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i91=
5#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rk=
l-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downsca=
ling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp=
-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/=
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri=
-indfb-draw-render.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer=
_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5354">i915#5354</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-19/igt@kms_frontbuffe=
r_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-farfromfence-mma=
p-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-=
farfromfence-mmap-gtt.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-=
cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg1-13/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423"=
>i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-11=
/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-s=
pr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-4/igt@kms_frontbuffer_t=
racking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458"=
>i915#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-p=
ri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_frontbuf=
fer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-s=
pr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-=
rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1825">i915#1825</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_front=
buffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rk=
l-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
023">i915#3023</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_frontbuffer_t=
racking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-=
rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354=
</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i9=
15#1187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13683/shard-mtlp-5/igt@kms_hdr@brightness-with-hdr.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656">i9=
15#10656</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/10656">i915#10656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688=
">i915#13688</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_joiner@basic-max-non-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-11/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339"=
>i915#12339</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13683/shard-dg2-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13522">i915#13522</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@kms_joiner@s=
witch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@km=
s_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13683/shard-rkl-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_13683/shard-rkl-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i=
915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5354">i915#5354</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9423">i915#9423</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_plane_s=
caling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_scaling@pl=
ane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8152">i915#8152</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-w=
ith-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_plane_sca=
ling@plane-upscale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/5354">i915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_13683/shard-rkl-4/igt@kms_pm_backlight@basic-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/968=
5">i915#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_13683/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/sh=
ard-rkl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281">i915#4281</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/sh=
ard-rkl-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/3361">i915#3361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">i915#9=
519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13=
683/shard-rkl-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519">=
i915#9519</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9519">i915#9519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_13683/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9519">i915#9519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6524">i915#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overl=
ay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
) +3 other tests skip</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_psr2_sf@fbc-pr-overl=
ay-primary-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-contin=
uous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@km=
s_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i9=
15#11520</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915=
#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
13683/shard-rkl-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/96=
83">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-3/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">=
i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html=
">SKIP</a> +4 other tests skip</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg1-13/igt@kms_psr@fbc-pr-cursor-mmap-gtt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072"=
>i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_13683/shard-dg1-12/igt@kms_psr@fbc-pr-cursor-mmap-gtt.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@kms_psr@pr-cursor-mmap-=
cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-5/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i=
915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_psr@pr-cursor-plane-onoff.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-8/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9685">i915#9685</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-11/igt@kms_rotation_crc@primary-y-tiled-reflect-x-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12755">i915#12755</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5190">i915#5190</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-dg2-8/igt@kms_rotation_crc@=
primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_13683/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-3/igt@kms_setmode@invalid-clone-=
single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-4/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13683/sha=
rd-rkl-6/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2436">i915#2436</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-5/igt@perf@gen8-unprivilege=
d-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/2436">i915#2436</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2433">i915#2433</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@perf@unprivileged-single-c=
tx-counters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8516">i915#8516</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_13683/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#85=
16</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-dg2-3/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i91=
5#3708</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4077">i915#4077</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_13683/shard-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
75">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_13683/shard-rkl-5/igt@prime_vgem@fence-flip-hang.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/37=
08">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_17124/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9917">i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_13683/shard-rkl-2/igt@sriov_basic@enable-vfs-autop=
robe-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8521 -&gt; IGTPW_13683</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17124: 2b95afd5f659a01a6fc8195358e62077846b97e7 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_13683: 7810a440dcf37f7ffa255652505defe3db80ce58 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8521: 8521<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0766845495033335827==--
