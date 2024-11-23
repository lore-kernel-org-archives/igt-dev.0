Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C0EE6ADDE
	for <igt-dev@archiver.kernel.org>; Sat, 23 Nov 2024 03:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09C610E08E;
	Sat, 23 Nov 2024 03:36:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E0210E08E;
 Sat, 23 Nov 2024 03:36:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/intel-ci=3A_Block_?=
 =?utf-8?q?all_gem=5Fexec=5Ffair_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Katarzyna Piecielska" <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 23 Nov 2024 03:36:35 -0000
Message-ID: <173233299582.1943207.4633304155466514740@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
In-Reply-To: <20241118111528.4190241-1-katarzyna.piecielska@intel.com>
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

Series: tests/intel-ci: Block all gem_exec_fair tests (rev2)
URL   : https://patchwork.freedesktop.org/series/141391/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15717_full -> IGTPW_12125_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12125_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12125_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/index.html

Participating hosts (10 -> 12)
------------------------------

  Additional (2): shard-snb-0 shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12125_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> ([SKIP][1], [SKIP][2], [SKIP][3])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_ccs@large-ctrl-surf-copy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_ccs@large-ctrl-surf-copy.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_ccs@large-ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> ([SKIP][4], [SKIP][5])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_ccs@large-ctrl-surf-copy.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglu:         [PASS][6] -> ([PASS][7], [ABORT][8], [PASS][9], [PASS][10])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-tglu-9/igt@gem_eio@unwedge-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-8/igt@gem_eio@unwedge-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-6/igt@gem_eio@unwedge-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-9/igt@gem_eio@unwedge-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_whisper@basic-contexts:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][11], [DMESG-WARN][12]) +13 other tests ( 2 dmesg-warn )
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_exec_whisper@basic-contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_exec_whisper@basic-contexts.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][13], [DMESG-WARN][14], [DMESG-WARN][15]) +17 other tests ( 3 dmesg-warn )
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_mmap_gtt@cpuset-big-copy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_mmap_gtt@cpuset-big-copy.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          NOTRUN -> ([PASS][16], [FAIL][17], [PASS][18])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_tiled_swapping@non-threaded.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_tiled_swapping@non-threaded.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [PASS][19] -> ([DMESG-WARN][20], [DMESG-WARN][21], [DMESG-WARN][22])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-tglu-6/igt@i915_module_load@reload-no-display.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@i915_module_load@reload-no-display.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@i915_module_load@reload-no-display.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [PASS][23] -> ([ABORT][24], [PASS][25], [PASS][26])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          NOTRUN -> ([PASS][27], [SKIP][28])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@i915_pm_rpm@sysfs-read.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][29] -> ([PASS][30], [DMESG-FAIL][31], [PASS][32])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-snb4/igt@i915_pm_rps@reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb2/igt@i915_pm_rps@reset.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb6/igt@i915_pm_rps@reset.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb5/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@client:
    - shard-dg2:          [PASS][33] -> [FAIL][34] +14 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-7/igt@i915_selftest@live@client.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@i915_selftest@live@client.html

  * igt@i915_selftest@live@gt_pm:
    - shard-rkl:          [PASS][35] -> ([DMESG-FAIL][36], [DMESG-FAIL][37], [DMESG-FAIL][38])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-4/igt@i915_selftest@live@gt_pm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@i915_selftest@live@gt_pm.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@i915_selftest@live@gt_pm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@objects:
    - shard-dg2:          [PASS][39] -> ([FAIL][40], [PASS][41], [PASS][42], [PASS][43]) +22 other tests ( 1 fail, 3 pass )
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-7/igt@i915_selftest@live@objects.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@i915_selftest@live@objects.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@i915_selftest@live@objects.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@i915_selftest@live@objects.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@i915_selftest@live@objects.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-tglu-1:       NOTRUN -> [ABORT][44] +1 other test abort
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@i915_selftest@live@sanitycheck.html
    - shard-tglu:         [PASS][45] -> ([ABORT][46], [ABORT][47], [ABORT][48]) +1 other test ( 3 abort )
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-tglu-2/igt@i915_selftest@live@sanitycheck.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-9/igt@i915_selftest@live@sanitycheck.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@i915_selftest@live@sanitycheck.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_selftest@perf:
    - shard-tglu:         NOTRUN -> ([ABORT][49], [ABORT][50], [ABORT][51], [ABORT][52]) +1 other test ( 4 abort )
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@i915_selftest@perf.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@i915_selftest@perf.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-6/igt@i915_selftest@perf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@i915_selftest@perf.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          NOTRUN -> ([PASS][53], [WARN][54], [PASS][55])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@i915_suspend@basic-s3-without-i915.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][56] -> ([DMESG-WARN][57], [DMESG-WARN][58]) +8 other tests ( 2 dmesg-warn )
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2:          [PASS][59] -> ([INCOMPLETE][60], [INCOMPLETE][61], [INCOMPLETE][62])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([PASS][63], [INCOMPLETE][64])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-dg2:          [PASS][65] -> [INCOMPLETE][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][67]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-dg1:          [PASS][68] -> [INCOMPLETE][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg1-12/igt@kms_color@ctm-blue-to-red.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> ([PASS][70], [PASS][71], [DMESG-WARN][72]) +1 other test ( 1 dmesg-warn, 2 pass )
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-b-hdmi-a-1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-b-hdmi-a-1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-b-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-rkl:          [PASS][73] -> ([DMESG-WARN][74], [DMESG-WARN][75], [DMESG-WARN][76]) +12 other tests ( 3 dmesg-warn )
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][77], [SKIP][78]) +1 other test ( 2 skip )
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([i915#2575]) +1 other test ( 2 skip )
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@kms_flip@2x-flip-vs-panning.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][81]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][82], [SKIP][83], [SKIP][84], [SKIP][85])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][86], [SKIP][87], [SKIP][88], [SKIP][89]) ([i915#2575])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@kms_flip@2x-plain-flip-interruptible.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@kms_flip@2x-plain-flip-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@kms_flip@2x-plain-flip-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2:          NOTRUN -> ([SKIP][90], [SKIP][91], [SKIP][92])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@kms_flip@2x-wf_vblank-ts-check.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [PASS][93] -> ([DMESG-WARN][94], [DMESG-WARN][95], [DMESG-WARN][96], [DMESG-WARN][97]) +1 other test ( 4 dmesg-warn )
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         NOTRUN -> ([SKIP][98], [SKIP][99], [SKIP][100], [SKIP][101])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-2/igt@kms_hdmi_inject@inject-audio.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@kms_hdmi_inject@inject-audio.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][102] +7 other tests dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-64:
    - shard-rkl:          [PASS][103] -> [DMESG-WARN][104] +1 other test dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-5/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-64.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-2-size-64.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-rkl:          [PASS][105] -> ([PASS][106], [DMESG-WARN][107], [PASS][108]) +3 other tests ( 1 dmesg-warn, 2 pass )
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-1/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][109] -> ([DMESG-WARN][110], [SKIP][111], [SKIP][112]) ([i915#9519])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-rkl:          [PASS][113] -> ([DMESG-WARN][114], [PASS][115], [DMESG-WARN][116]) +2 other tests ( 2 dmesg-warn, 1 pass )
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-6/igt@kms_rotation_crc@sprite-rotation-90.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@kms_rotation_crc@sprite-rotation-90.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          NOTRUN -> ([DMESG-FAIL][117], [INCOMPLETE][118]) +1 other test ( 1 dmesg-fail, 1 incomplete )
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> ([DMESG-WARN][119], [PASS][120], [DMESG-WARN][121]) +1 other test ( 2 dmesg-warn, 1 pass )
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-1.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@kms_vblank@ts-continuation-modeset-hang@pipe-b-hdmi-a-1.html

  * igt@perf_pmu@invalid-open:
    - shard-dg2:          NOTRUN -> ([PASS][122], [SKIP][123], [PASS][124]) +1 other test ( 2 pass, 1 skip )
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@perf_pmu@invalid-open.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@perf_pmu@invalid-open.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@perf_pmu@invalid-open.html

  
#### Warnings ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2:          [FAIL][125] -> ([FAIL][126], [PASS][127], [PASS][128])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@core_setmaster@master-drop-set-user.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@core_setmaster@master-drop-set-user.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-snb:          [FAIL][129] -> ([FAIL][130], [PASS][131], [PASS][132])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-snb2/igt@gem_tiled_swapping@non-threaded.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb4/igt@gem_tiled_swapping@non-threaded.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb7/igt@gem_tiled_swapping@non-threaded.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb1/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         [FAIL][133] -> ([FAIL][134], [PASS][135], [FAIL][136], [PASS][137])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-2/igt@gem_tiled_swapping@non-threaded.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@gem_tiled_swapping@non-threaded.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-10/igt@gem_tiled_swapping@non-threaded.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@gem_tiled_swapping@non-threaded.html
    - shard-glk:          ([FAIL][138], [FAIL][139], [FAIL][140]) -> ([PASS][141], [FAIL][142])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-glk9/igt@gem_tiled_swapping@non-threaded.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-glk3/igt@gem_tiled_swapping@non-threaded.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-glk8/igt@gem_tiled_swapping@non-threaded.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-glk5/igt@gem_tiled_swapping@non-threaded.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-glk3/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-dg2:          [SKIP][143] -> ([PASS][144], [PASS][145], [SKIP][146])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@i915_pm_rpm@reg-read-ioctl.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@i915_pm_rpm@reg-read-ioctl.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          [SKIP][147] -> ([PASS][148], [PASS][149], [PASS][150], [SKIP][151])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@i915_pm_rpm@system-suspend-execbuf.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2:          [SKIP][152] ([i915#2575]) -> ([SKIP][153], [SKIP][154], [SKIP][155], [SKIP][156])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-11/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          [SKIP][157] -> ([SKIP][158], [SKIP][159], [SKIP][160], [SKIP][161]) ([i915#2575]) +4 other tests ( 4 skip )
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          [SKIP][162] -> ([SKIP][163], [SKIP][164], [SKIP][165]) ([i915#2575]) +5 other tests ( 3 skip )
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg2:          [SKIP][166] ([i915#2575]) -> ([SKIP][167], [SKIP][168], [SKIP][169])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-11/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          [FAIL][170] ([i915#9100]) -> [SKIP][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-3/igt@perf@non-zero-reason.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@perf@non-zero-reason.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-busy-flip:
    - {shard-dg2-9}:      NOTRUN -> [SKIP][172] +5 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-9/igt@kms_flip@2x-busy-flip.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15717_full and IGTPW_12125_full:

### New IGT tests (4) ###

  * igt@gem_lmem_evict@dontneed-evict-race:
    - Statuses : 6 pass(s) 11 skip(s)
    - Exec time: [0.0, 2.12] s

  * igt@kms_cursor_crc@cursor-offscreen-64x21@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-dp-4:
    - Statuses : 2 pass(s)
    - Exec time: [2.65, 2.79] s

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-4:
    - Statuses : 2 pass(s)
    - Exec time: [1.44, 1.45] s

  

Known issues
------------

  Here are the changes found in IGTPW_12125_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@gem-pool:
    - shard-dg2:          [PASS][173] -> ([SKIP][174], [PASS][175], [PASS][176]) +14 other tests ( 2 pass, 1 skip )
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-5/igt@api_intel_allocator@gem-pool.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@api_intel_allocator@gem-pool.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@api_intel_allocator@gem-pool.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@api_intel_allocator@gem-pool.html

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#8411])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> ([SKIP][178], [SKIP][179], [SKIP][180]) ([i915#6230])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@api_intel_bb@crc32.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@api_intel_bb@crc32.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> ([SKIP][181], [SKIP][182]) ([i915#6230])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@api_intel_bb@crc32.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> ([SKIP][183], [SKIP][184], [SKIP][185], [SKIP][186]) ([i915#6230])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-6/igt@api_intel_bb@crc32.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@api_intel_bb@crc32.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@api_intel_bb@crc32.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> ([SKIP][187], [SKIP][188], [SKIP][189]) ([i915#8411]) +1 other test ( 3 skip )
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@api_intel_bb@object-reloc-keep-cache.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          [PASS][190] -> ([PASS][191], [PASS][192], [FAIL][193]) ([i915#12909])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-3/igt@core_setmaster@master-drop-set-root.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@core_setmaster@master-drop-set-root.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@core_setmaster@master-drop-set-root.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#11078])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> ([SKIP][195], [SKIP][196]) ([i915#11078])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@device_reset@unbind-cold-reset-rebind.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][197] -> ([PASS][198], [PASS][199], [ABORT][200], [PASS][201]) ([i915#5507])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-8/igt@device_reset@unbind-reset-rebind.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@device_reset@unbind-reset-rebind.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@device_reset@unbind-reset-rebind.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> ([SKIP][202], [SKIP][203], [SKIP][204]) ([i915#8414]) +7 other tests ( 3 skip )
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@drm_fdinfo@busy-idle@bcs0.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@drm_fdinfo@busy-idle@bcs0.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-dg1:          NOTRUN -> ([SKIP][205], [SKIP][206], [SKIP][207]) ([i915#8414]) +5 other tests ( 3 skip )
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@drm_fdinfo@most-busy-check-all.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@drm_fdinfo@most-busy-check-all.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@drm_fdinfo@most-busy-check-all.html

  * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
    - shard-dg1:          NOTRUN -> ([SKIP][208], [SKIP][209]) ([i915#8414]) +12 other tests ( 2 skip )
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([i915#8414]) +1 other test ( 2 skip )
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@drm_fdinfo@virtual-busy.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_fdinfo@virtual-busy-all:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#8414])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@drm_fdinfo@virtual-busy-all.html

  * igt@drm_fdinfo@virtual-busy-hang-all:
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#8414])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-hang-all.html

  * igt@dumb_buffer@create-clear:
    - shard-rkl:          [PASS][214] -> ([DMESG-WARN][215], [DMESG-WARN][216]) ([i915#12964])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-rkl-5/igt@dumb_buffer@create-clear.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@dumb_buffer@create-clear.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@dumb_buffer@create-clear.html

  * igt@fbdev@eof:
    - shard-dg2:          [PASS][217] -> ([PASS][218], [PASS][219], [SKIP][220]) ([i915#2582])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-5/igt@fbdev@eof.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@fbdev@eof.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@fbdev@eof.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@fbdev@eof.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> ([SKIP][221], [SKIP][222]) ([i915#3281]) +6 other tests ( 2 skip )
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_bad_reloc@negative-reloc-lut.html
    - shard-dg2:          NOTRUN -> ([SKIP][223], [SKIP][224], [SKIP][225], [SKIP][226]) ([i915#3281])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_bad_reloc@negative-reloc-lut.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_bad_reloc@negative-reloc-lut.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_bad_reloc@negative-reloc-lut.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#7697])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> ([SKIP][228], [SKIP][229]) ([i915#3936])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_busy@semaphore.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#3555] / [i915#9323])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> ([SKIP][231], [SKIP][232]) ([i915#3555] / [i915#9323])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-1/igt@gem_ccs@block-copy-compressed.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> ([SKIP][233], [SKIP][234], [SKIP][235], [SKIP][236]) ([i915#3555] / [i915#9323])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_ccs@block-multicopy-inplace.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_ccs@block-multicopy-inplace.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_ccs@block-multicopy-inplace.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#3555] / [i915#9323])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> ([SKIP][238], [SKIP][239], [SKIP][240]) ([i915#3555] / [i915#9323])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_ccs@block-multicopy-inplace.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_ccs@block-multicopy-inplace.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> ([SKIP][241], [SKIP][242], [SKIP][243]) ([i915#3555] / [i915#9323])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html
    - shard-dg1:          NOTRUN -> ([SKIP][244], [SKIP][245]) ([i915#3555] / [i915#9323])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_ccs@ctrl-surf-copy.html
    - shard-tglu:         NOTRUN -> ([SKIP][246], [SKIP][247], [SKIP][248], [SKIP][249]) ([i915#3555] / [i915#9323])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-10/igt@gem_ccs@ctrl-surf-copy.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> ([SKIP][250], [SKIP][251]) ([i915#9323])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-1/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-7/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#9323]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> ([PASS][253], [INCOMPLETE][254]) ([i915#12392] / [i915#7297])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-smem-lmem0.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          NOTRUN -> ([PASS][255], [INCOMPLETE][256], [PASS][257]) ([i915#7297])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> ([SKIP][258], [SKIP][259], [SKIP][260], [SKIP][261]) ([i915#7697])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@gem_close_race@multigpu-basic-process.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@gem_close_race@multigpu-basic-process.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-10/igt@gem_close_race@multigpu-basic-process.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-2/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][262] ([i915#6335])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> ([SKIP][263], [SKIP][264]) ([i915#6335])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> ([SKIP][265], [SKIP][266]) ([i915#8562])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_create@create-ext-set-pat.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_create@create-ext-set-pat.html
    - shard-tglu-1:       NOTRUN -> [SKIP][267] ([i915#8562])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-glk:          NOTRUN -> ([FAIL][268], [PASS][269]) ([i915#12031])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-glk8/igt@gem_ctx_engines@invalid-engines.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-glk5/igt@gem_ctx_engines@invalid-engines.html
    - shard-tglu:         [PASS][270] -> ([FAIL][271], [PASS][272], [PASS][273]) ([i915#12031])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-tglu-9/igt@gem_ctx_engines@invalid-engines.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@gem_ctx_engines@invalid-engines.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][274] -> ([FAIL][275], [PASS][276], [PASS][277]) ([i915#9561]) +1 other test ( 1 fail, 2 pass )
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-1/igt@gem_ctx_freq@sysfs@gt0.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_ctx_freq@sysfs@gt0.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-snb:          NOTRUN -> ([SKIP][278], [SKIP][279]) ([i915#1099])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb4/igt@gem_ctx_persistence@engines-hang.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb7/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> ([SKIP][280], [SKIP][281], [SKIP][282]) ([i915#2575] / [i915#8555])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-hang.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_ctx_persistence@heartbeat-hang.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html
    - shard-dg1:          NOTRUN -> ([SKIP][283], [SKIP][284], [SKIP][285]) ([i915#8555])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-hang.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-hang.html
    - shard-mtlp:         NOTRUN -> ([SKIP][286], [SKIP][287]) ([i915#8555])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-hang.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-6/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#8555])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#8555])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-rkl:          NOTRUN -> ([FAIL][290], [FAIL][291]) ([i915#11980] / [i915#12580])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_ctx_persistence@hostile.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> ([FAIL][292], [FAIL][293]) ([i915#11980] / [i915#12580])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_ctx_persistence@hostile.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> ([SKIP][294], [SKIP][295], [SKIP][296]) ([i915#1099])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-snb5/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> ([SKIP][297], [SKIP][298], [SKIP][299]) ([i915#280])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_ctx_sseu@engines.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_ctx_sseu@engines.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> ([SKIP][300], [SKIP][301], [SKIP][302]) ([i915#280])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@gem_ctx_sseu@engines.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-9/igt@gem_ctx_sseu@engines.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> ([SKIP][303], [SKIP][304], [SKIP][305]) ([i915#280])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_ctx_sseu@invalid-args.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_ctx_sseu@invalid-args.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu-1:       NOTRUN -> [SKIP][306] ([i915#280])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-rkl:          NOTRUN -> ([SKIP][307], [SKIP][308]) ([i915#280])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_ctx_sseu@mmap-args.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][309] -> [ABORT][310] ([i915#7975] / [i915#8213])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg1-13/igt@gem_eio@hibernate.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_eio@hibernate.html
    - shard-dg2:          NOTRUN -> ([PASS][311], [SKIP][312], [ABORT][313]) ([i915#10030] / [i915#2575] / [i915#7975] / [i915#8213])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_eio@hibernate.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_eio@hibernate.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][314] -> [FAIL][315] ([i915#12543] / [i915#5784])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg1-14/igt@gem_eio@reset-stress.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg1:          NOTRUN -> ([SKIP][316], [SKIP][317], [SKIP][318]) ([i915#4771])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_balancer@bonded-pair.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_balancer@bonded-pair.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          NOTRUN -> ([SKIP][319], [SKIP][320], [SKIP][321]) ([i915#4812])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_exec_balancer@bonded-semaphore.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_exec_balancer@bonded-semaphore.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][322] ([i915#4771])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> ([SKIP][323], [SKIP][324]) ([i915#4771])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_balancer@bonded-sync.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> ([SKIP][325], [SKIP][326]) ([i915#4771])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-6/igt@gem_exec_balancer@bonded-sync.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> ([SKIP][327], [SKIP][328], [SKIP][329], [SKIP][330]) ([i915#4525]) +1 other test ( 4 skip )
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_exec_balancer@parallel-contexts.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_exec_balancer@parallel-contexts.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> ([SKIP][331], [SKIP][332], [SKIP][333]) ([i915#4525]) +2 other tests ( 3 skip )
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [FAIL][334] ([i915#6117])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> ([SKIP][335], [SKIP][336], [SKIP][337], [SKIP][338]) ([i915#4812])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_exec_balancer@sliced.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_exec_balancer@sliced.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_exec_balancer@sliced.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][339] ([i915#11713])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> ([FAIL][340], [FAIL][341]) ([i915#11965] / [i915#12558]) +1 other test ( 2 fail )
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-7/igt@gem_exec_capture@capture.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-1/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg1:          NOTRUN -> ([SKIP][342], [SKIP][343]) ([i915#6334]) +2 other tests ( 2 skip )
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_exec_capture@capture-invisible@lmem0.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-rkl:          NOTRUN -> ([SKIP][344], [SKIP][345], [SKIP][346]) ([i915#6334]) +1 other test ( 3 skip )
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_exec_capture@capture-invisible@smem0.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_exec_capture@capture-invisible@smem0.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> ([SKIP][347], [SKIP][348], [SKIP][349], [SKIP][350]) ([i915#6344])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_exec_capture@capture-recoverable.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_exec_capture@capture-recoverable.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
    - shard-tglu:         NOTRUN -> ([SKIP][351], [SKIP][352], [SKIP][353]) ([i915#6344])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-8/igt@gem_exec_capture@capture-recoverable.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-10/igt@gem_exec_capture@capture-recoverable.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][354] ([i915#11965] / [i915#12558]) +1 other test fail
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_exec_capture@capture@vecs0-lmem0.html
    - shard-dg1:          NOTRUN -> ([FAIL][355], [FAIL][356], [FAIL][357]) ([i915#11965] / [i915#12558]) +2 other tests ( 3 fail )
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_capture@capture@vecs0-lmem0.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_exec_capture@capture@vecs0-lmem0.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_capture@capture@vecs1-smem:
    - shard-dg2:          NOTRUN -> [FAIL][358] ([i915#11965]) +1 other test fail
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_exec_capture@capture@vecs1-smem.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-dg1:          NOTRUN -> ([SKIP][359], [SKIP][360], [SKIP][361]) ([i915#3539] / [i915#4852]) +2 other tests ( 3 skip )
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-mtlp:         NOTRUN -> ([SKIP][362], [SKIP][363]) ([i915#3711])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-dg2:          NOTRUN -> ([SKIP][364], [SKIP][365], [SKIP][366], [SKIP][367]) ([i915#3539] / [i915#4852])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> ([SKIP][368], [SKIP][369], [SKIP][370]) ([i915#3539])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_exec_flush@basic-uc-set-default.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_exec_flush@basic-uc-set-default.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg1:          NOTRUN -> ([SKIP][371], [SKIP][372]) ([i915#3539] / [i915#4852]) +1 other test ( 2 skip )
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#5107])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> ([SKIP][374], [SKIP][375], [SKIP][376]) ([i915#5107])
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_exec_params@rsvd2-dirt.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_exec_params@rsvd2-dirt.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-active:
    - shard-dg2:          NOTRUN -> ([SKIP][377], [SKIP][378]) ([i915#3281]) +1 other test ( 2 skip )
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-gtt-active.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-gtt-active.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][379] ([i915#3281]) +1 other test skip
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-rkl:          NOTRUN -> ([SKIP][380], [SKIP][381], [SKIP][382], [SKIP][383]) ([i915#3281]) +2 other tests ( 4 skip )
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg1:          NOTRUN -> ([SKIP][384], [SKIP][385]) ([i915#3281]) +2 other tests ( 2 skip )
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_reloc@basic-gtt-read.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][386], [SKIP][387], [SKIP][388]) ([i915#2575] / [i915#3281]) +1 other test ( 3 skip )
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_exec_reloc@basic-gtt-wc.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-wc.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#3281])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_exec_reloc@basic-wc.html
    - shard-dg1:          NOTRUN -> ([SKIP][390], [SKIP][391], [SKIP][392]) ([i915#3281]) +2 other tests ( 3 skip )
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_reloc@basic-wc.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_exec_reloc@basic-wc.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-dg2:          NOTRUN -> ([SKIP][393], [SKIP][394], [SKIP][395], [SKIP][396]) ([i915#2575] / [i915#3281]) +1 other test ( 4 skip )
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_exec_reloc@basic-wc-read.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_exec_reloc@basic-wc-read.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_exec_reloc@basic-wc-read.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_reloc@basic-write-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][397] ([i915#3281])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_exec_reloc@basic-write-cpu.html

  * igt@gem_exec_reloc@basic-write-cpu-active:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#3281]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_exec_reloc@basic-write-cpu-active.html
    - shard-mtlp:         NOTRUN -> ([SKIP][399], [SKIP][400]) ([i915#3281]) +1 other test ( 2 skip )
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-3/igt@gem_exec_reloc@basic-write-cpu-active.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-1/igt@gem_exec_reloc@basic-write-cpu-active.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg2:          NOTRUN -> ([SKIP][401], [SKIP][402], [SKIP][403]) ([i915#3281]) +2 other tests ( 3 skip )
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_exec_reloc@basic-write-gtt-active.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_exec_reloc@basic-write-gtt-active.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-rkl:          NOTRUN -> ([SKIP][404], [SKIP][405], [SKIP][406]) ([i915#3281]) +7 other tests ( 3 skip )
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-dg1:          NOTRUN -> ([SKIP][407], [SKIP][408], [SKIP][409]) ([i915#4812])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_exec_schedule@preempt-queue-contexts.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_exec_schedule@preempt-queue-contexts.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> ([SKIP][410], [SKIP][411], [SKIP][412]) ([i915#4537] / [i915#4812])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@preempt-self:
    - shard-dg2:          [PASS][413] -> ([SKIP][414], [PASS][415]) ([i915#2575]) +32 other tests ( 1 pass, 1 skip )
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-5/igt@gem_exec_schedule@preempt-self.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_exec_schedule@preempt-self.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_exec_schedule@preempt-self.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][416] ([i915#4812])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> ([SKIP][417], [SKIP][418], [SKIP][419]) ([i915#7276])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_exec_schedule@semaphore-power.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> ([SKIP][420], [SKIP][421]) ([i915#4812]) +2 other tests ( 2 skip )
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_exec_schedule@semaphore-power.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-dg2:          NOTRUN -> ([PASS][422], [INCOMPLETE][423], [PASS][424]) ([i915#11441]) +1 other test ( 1 incomplete, 2 pass )
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_exec_suspend@basic-s0.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_exec_suspend@basic-s0.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-rkl:          NOTRUN -> ([ABORT][425], [ABORT][426]) ([i915#7975] / [i915#8213]) +1 other test ( 2 abort )
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_exec_suspend@basic-s4-devices.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg1:          NOTRUN -> [SKIP][427] ([i915#4860])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg1:          NOTRUN -> ([SKIP][428], [SKIP][429]) ([i915#4860]) +1 other test ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> ([SKIP][430], [SKIP][431], [SKIP][432]) ([i915#4860])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][433] ([i915#4860])
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> ([SKIP][434], [SKIP][435], [SKIP][436]) ([i915#4860])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_fenced_exec_thrash@no-spare-fences.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][437], [SKIP][438], [SKIP][439]) ([i915#2575] / [i915#4860])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
    - shard-mtlp:         NOTRUN -> ([SKIP][440], [SKIP][441]) ([i915#4860])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> ([SKIP][442], [SKIP][443], [SKIP][444]) ([i915#2190])
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-10/igt@gem_huc_copy@huc-copy.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-2/igt@gem_huc_copy@huc-copy.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race (NEW):
    - shard-rkl:          NOTRUN -> ([SKIP][445], [SKIP][446], [SKIP][447]) ([i915#4613] / [i915#7582])
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_lmem_evict@dontneed-evict-race.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-glk:          NOTRUN -> ([SKIP][448], [SKIP][449]) ([i915#4613]) +1 other test ( 2 skip )
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-glk5/igt@gem_lmem_swapping@heavy-multi.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-glk8/igt@gem_lmem_swapping@heavy-multi.html
    - shard-mtlp:         NOTRUN -> ([SKIP][450], [SKIP][451]) ([i915#4613])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-6/igt@gem_lmem_swapping@heavy-multi.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-5/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-dg2:          [PASS][452] -> ([SKIP][453], [SKIP][454], [SKIP][455]) ([i915#12936])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-1/igt@gem_lmem_swapping@heavy-verify-multi.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-multi.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-multi.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-dg2:          [PASS][456] -> ([SKIP][457], [PASS][458]) ([i915#12936])
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-10/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-dg1:          NOTRUN -> ([SKIP][459], [SKIP][460], [SKIP][461]) ([i915#12193])
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
    - shard-dg1:          NOTRUN -> ([SKIP][462], [SKIP][463], [SKIP][464]) ([i915#4565])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-dg2:          NOTRUN -> ([SKIP][465], [SKIP][466], [SKIP][467], [SKIP][468]) ([i915#12936])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_lmem_swapping@heavy-verify-random.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_lmem_swapping@heavy-verify-random.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_lmem_swapping@heavy-verify-random.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-rkl:          NOTRUN -> ([SKIP][469], [SKIP][470], [SKIP][471]) ([i915#4613]) +2 other tests ( 3 skip )
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_lmem_swapping@heavy-verify-random.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-tglu:         NOTRUN -> ([SKIP][472], [SKIP][473], [SKIP][474]) ([i915#4613]) +2 other tests ( 3 skip )
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@gem_lmem_swapping@heavy-verify-random.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-random.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-tglu:         NOTRUN -> ([SKIP][475], [SKIP][476], [SKIP][477], [SKIP][478]) ([i915#4613]) +1 other test ( 4 skip )
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-8/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-10/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@massive:
    - shard-mtlp:         NOTRUN -> [SKIP][479] ([i915#4613])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-4/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-dg2:          [PASS][480] -> ([PASS][481], [SKIP][482], [PASS][483]) ([i915#12936]) +1 other test ( 2 pass, 1 skip )
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-2/igt@gem_lmem_swapping@massive-random.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_lmem_swapping@massive-random.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_lmem_swapping@massive-random.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> ([SKIP][484], [SKIP][485]) ([i915#4613]) +1 other test ( 2 skip )
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@random:
    - shard-dg2:          NOTRUN -> [SKIP][486] ([i915#12936]) +2 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][487] -> ([PASS][488], [PASS][489], [TIMEOUT][490]) ([i915#5493]) +1 other test ( 2 pass, 1 timeout )
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15717/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-rkl:          NOTRUN -> ([SKIP][491], [SKIP][492], [SKIP][493], [SKIP][494]) ([i915#4613]) +2 other tests ( 4 skip )
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_lmem_swapping@verify-ccs.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_lmem_swapping@verify-ccs.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_lmem_swapping@verify-ccs.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-glk:          NOTRUN -> [SKIP][495] ([i915#4613])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-glk9/igt@gem_lmem_swapping@verify-random.html
    - shard-dg2:          NOTRUN -> ([SKIP][496], [PASS][497]) ([i915#12936])
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_lmem_swapping@verify-random.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][498] ([i915#4613]) +5 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-tglu:         NOTRUN -> ([SKIP][499], [SKIP][500]) ([i915#4613])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@gem_lmem_swapping@verify-random-ccs.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-9/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_mmap@basic-small-bo:
    - shard-dg1:          NOTRUN -> [SKIP][501] ([i915#4083])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> ([SKIP][502], [SKIP][503], [SKIP][504]) ([i915#2575] / [i915#4083])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_mmap@big-bo.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_mmap@big-bo.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_mmap@big-bo.html
    - shard-mtlp:         NOTRUN -> ([SKIP][505], [SKIP][506]) ([i915#4083]) +1 other test ( 2 skip )
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-2/igt@gem_mmap@big-bo.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-8/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledx:
    - shard-dg2:          NOTRUN -> ([SKIP][507], [SKIP][508], [SKIP][509], [SKIP][510]) ([i915#4077])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_mmap_gtt@basic-small-bo-tiledx.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_mmap_gtt@basic-small-bo-tiledx.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_mmap_gtt@basic-small-bo-tiledx.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_mmap_gtt@basic-small-bo-tiledx.html
    - shard-mtlp:         NOTRUN -> [SKIP][511] ([i915#4077]) +2 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-4/igt@gem_mmap_gtt@basic-small-bo-tiledx.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-dg1:          NOTRUN -> ([SKIP][512], [SKIP][513], [SKIP][514], [SKIP][515]) ([i915#4077])
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg2:          NOTRUN -> ([SKIP][516], [SKIP][517]) ([i915#4077]) +3 other tests ( 2 skip )
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_mmap_gtt@basic-small-copy.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-dg1:          NOTRUN -> ([SKIP][518], [SKIP][519], [SKIP][520]) ([i915#4077]) +4 other tests ( 3 skip )
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> ([SKIP][521], [SKIP][522], [SKIP][523], [SKIP][524]) ([i915#2575] / [i915#4077]) +1 other test ( 4 skip )
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> ([SKIP][525], [SKIP][526], [SKIP][527]) ([i915#4077]) +8 other tests ( 3 skip )
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-mtlp:         NOTRUN -> ([SKIP][528], [SKIP][529]) ([i915#4077]) +7 other tests ( 2 skip )
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-2/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> ([SKIP][530], [SKIP][531]) ([i915#4077]) +10 other tests ( 2 skip )
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_mmap_gtt@fault-concurrent.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg1:          NOTRUN -> ([SKIP][532], [SKIP][533], [SKIP][534]) ([i915#4083])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_mmap_wc@bad-size.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_mmap_wc@bad-size.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@close:
    - shard-dg2:          NOTRUN -> [SKIP][535] ([i915#4083])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-7/igt@gem_mmap_wc@close.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> ([SKIP][536], [SKIP][537]) ([i915#4083]) +5 other tests ( 2 skip )
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-18/igt@gem_mmap_wc@read.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write-gtt-read-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][538], [SKIP][539], [SKIP][540]) ([i915#4083]) +2 other tests ( 3 skip )
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_mmap_wc@write-gtt-read-wc.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_mmap_wc@write-gtt-read-wc.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_mmap_wc@write-gtt-read-wc.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-mtlp:         NOTRUN -> ([SKIP][541], [SKIP][542]) ([i915#3282]) +1 other test ( 2 skip )
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-8/igt@gem_partial_pwrite_pread@reads-snoop.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> ([SKIP][543], [SKIP][544], [SKIP][545]) ([i915#3282]) +4 other tests ( 3 skip )
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pread@snoop:
    - shard-dg1:          NOTRUN -> ([SKIP][546], [SKIP][547]) ([i915#3282]) +8 other tests ( 2 skip )
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_pread@snoop.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_pread@snoop.html

  * igt@gem_pread@uncached:
    - shard-dg2:          NOTRUN -> ([SKIP][548], [SKIP][549], [SKIP][550]) ([i915#2575] / [i915#3282])
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_pread@uncached.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-5/igt@gem_pread@uncached.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_pread@uncached.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> ([SKIP][551], [SKIP][552], [SKIP][553]) ([i915#3282]) +3 other tests ( 3 skip )
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-3/igt@gem_pwrite@basic-random.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-1/igt@gem_pwrite@basic-random.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_pwrite@basic-random.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][554] ([i915#3282]) +2 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_pwrite@basic-self.html

  * igt@gem_pwrite_snooped:
    - shard-mtlp:         NOTRUN -> [SKIP][555] ([i915#3282])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-3/igt@gem_pwrite_snooped.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-dg2:          NOTRUN -> ([SKIP][556], [SKIP][557], [SKIP][558]) ([i915#2575] / [i915#4270])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-6/igt@gem_pxp@create-regular-buffer.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-10/igt@gem_pxp@create-regular-buffer.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_pxp@create-regular-buffer.html
    - shard-rkl:          NOTRUN -> [SKIP][559] ([i915#4270])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-1/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-rkl:          NOTRUN -> ([SKIP][560], [SKIP][561], [SKIP][562]) ([i915#4270])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-3/igt@gem_pxp@create-regular-context-2.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_pxp@create-regular-context-2.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-5/igt@gem_pxp@create-regular-context-2.html
    - shard-dg1:          NOTRUN -> [SKIP][563] ([i915#4270])
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_pxp@create-regular-context-2.html
    - shard-tglu:         NOTRUN -> ([SKIP][564], [SKIP][565], [SKIP][566], [SKIP][567]) ([i915#4270])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@gem_pxp@create-regular-context-2.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-6/igt@gem_pxp@create-regular-context-2.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-9/igt@gem_pxp@create-regular-context-2.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-8/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg1:          NOTRUN -> ([SKIP][568], [SKIP][569], [SKIP][570]) ([i915#4270]) +1 other test ( 3 skip )
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-17/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-13/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-rkl:          NOTRUN -> ([TIMEOUT][571], [TIMEOUT][572], [TIMEOUT][573]) ([i915#12964])
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_pxp@fail-invalid-protected-context.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> ([TIMEOUT][574], [TIMEOUT][575], [TIMEOUT][576]) ([i915#12917]) +4 other tests ( 3 timeout )
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-rkl-4/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-tglu:         NOTRUN -> ([SKIP][577], [SKIP][578], [SKIP][579]) ([i915#12975])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-4/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-dg2:          NOTRUN -> [SKIP][580] ([i915#2575]) +58 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-11/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-mtlp:         NOTRUN -> [SKIP][581] ([i915#12975])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-mtlp-4/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> ([SKIP][582], [SKIP][583]) ([i915#4270])
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg2-8/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> ([SKIP][584], [SKIP][585]) ([i915#4270]) +1 other test ( 2 skip )
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-14/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/shard-dg1-12/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglu:         NOTRUN -> ([SKIP][586], [SKIP][587], [SKIP][

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12125/index.html
