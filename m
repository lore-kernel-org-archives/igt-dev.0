Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160DFD6552F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 17:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8EF10E961;
	Tue, 26 Nov 2024 17:16:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB4C10E961;
 Tue, 26 Nov 2024 17:16:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7467126736992597256=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel/perf=5Fpmu=3A_?=
 =?utf-8?q?Fix_Test_Assertion_Failure_for_semaphore-busy_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kumar Vodapalli" <ravi.kumar.vodapalli@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 26 Nov 2024 17:16:45 -0000
Message-ID: <173264140553.3430163.3476918801363995749@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126140913.4066558-1-ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20241126140913.4066558-1-ravi.kumar.vodapalli@intel.com>
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

--===============7467126736992597256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/perf_pmu: Fix Test Assertion Failure for semaphore-busy test
URL   : https://patchwork.freedesktop.org/series/141792/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8126_full -> XEIGTPW_12198_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12198_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12198_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12198_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_lowres@tiling-x@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-a-dp-2.html

  * igt@kms_pm_rpm@universal-planes@plane-68:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_pm_rpm@universal-planes@plane-68.html

  * igt@xe_exec_store@page-sized:
    - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-7/igt@xe_exec_store@page-sized.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-8/igt@xe_exec_store@page-sized.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@kms_properties@plane-properties-legacy:
    - shard-bmg:          [SKIP][7] ([Intel XE#2423]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_properties@plane-properties-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_properties@plane-properties-legacy.html

  * igt@xe_vm@bind-array-conflict-error-inject:
    - shard-bmg:          [SKIP][9] ([Intel XE#1130]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_vm@bind-array-conflict-error-inject.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_vm@bind-array-conflict-error-inject.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12198_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][11] -> [FAIL][12] ([Intel XE#3440])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@core_getversion@all-cards.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#1885]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1885]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#3453])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][19] -> [SKIP][20] ([Intel XE#2134]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@fbdev@info.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@fbdev@info.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#827]) +2 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html

  * igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][23] ([Intel XE#3468]) +7 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][24] -> [DMESG-FAIL][25] ([Intel XE#3468]) +11 other tests dmesg-fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2327]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2136]) +23 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2314] / [Intel XE#2894])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#616]) +7 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +69 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2325])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2321])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2423]) +90 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][42] -> [INCOMPLETE][43] ([Intel XE#1727])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2291]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#2423] / [i915#2575]) +92 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#701])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#3486])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#3321] / [Intel XE#3487])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#2882])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2316]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#2882])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#886]) +4 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][59] ([Intel XE#3321] / [Intel XE#3487])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#301]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [PASS][61] -> [DMESG-WARN][62] ([Intel XE#3468]) +60 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#3149] / [Intel XE#886])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][65] -> [DMESG-FAIL][66] ([Intel XE#2705] / [Intel XE#3468])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2293]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [PASS][71] -> [INCOMPLETE][72] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests incomplete
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][73] ([Intel XE#3468]) +1 other test dmesg-fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][74] ([Intel XE#2705]) +1 other test dmesg-fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][75] ([Intel XE#1727] / [Intel XE#3468])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2136]) +21 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#2136]) +26 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [PASS][79] -> [SKIP][80] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#2333]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2311]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#651]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2136]) +11 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2313]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2312]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_getfb@getfb-handle-zero:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2423] / [i915#2575]) +16 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_getfb@getfb-handle-zero.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2423]) +6 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#361])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2763]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#2763] / [Intel XE#455])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2763]) +15 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#718])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#1430])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][98] -> [DMESG-WARN][99] ([Intel XE#3468])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#2446]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#2446]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1489])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1489])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2426])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][108] ([Intel XE#1727])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][109] -> [DMESG-WARN][110] ([Intel XE#1727] / [Intel XE#3468]) +5 other tests dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2423])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@testdisplay.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@testdisplay.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2905])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-bmg:          [PASS][114] -> [FAIL][115] ([Intel XE#3198])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race:
    - shard-bmg:          [PASS][116] -> [DMESG-WARN][117] ([Intel XE#1727]) +2 other tests dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#1130]) +196 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1130]) +20 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2322]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-lnl:          [PASS][122] -> [SKIP][123] ([Intel XE#1192])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#378])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][125] -> [DMESG-WARN][126] ([Intel XE#3467])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_module_load@unload.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_module_load@unload.html

  * igt@xe_pat@prime-self-import-coh:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1130]) +32 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pat@prime-self-import-coh.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][128] ([Intel XE#1173])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [PASS][129] -> [DMESG-WARN][130] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_pm@s3-basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_pm@s3-basic.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#944])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-front:
    - shard-bmg:          [PASS][132] -> [SKIP][133] ([Intel XE#1130]) +224 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-inval-many-front.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-inval-many-front.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][134] ([Intel XE#1885]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#1885]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [SKIP][138] ([Intel XE#3453]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][140] ([Intel XE#3339]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][142] ([Intel XE#2134]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@fbdev@nullptr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@fbdev@nullptr.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#2134]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@fbdev@write.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@fbdev@write.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [SKIP][146] ([Intel XE#2423]) -> [PASS][147] +94 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][148] ([Intel XE#1426]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][150] ([Intel XE#2136]) -> [PASS][151] +18 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][152] ([Intel XE#829]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-WARN][154] ([Intel XE#3468]) -> [PASS][155] +36 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][157] +12 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][158] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][160] -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_color@ctm-0-25:
    - shard-bmg:          [DMESG-WARN][162] ([Intel XE#877]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_color@ctm-0-25.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_color@ctm-0-25.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#2423] / [i915#2575]) -> [PASS][165] +40 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][166] ([Intel XE#2291]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][168] -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][170] ([Intel XE#2958]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [DMESG-WARN][172] -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][174] ([Intel XE#886]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][176] ([Intel XE#2597]) -> [PASS][177] +2 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][178] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][180] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#2136]) -> [PASS][183] +10 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-bmg:          [SKIP][184] ([Intel XE#540]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_force_connector_basic@force-connector-state.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-bmg:          [DMESG-FAIL][186] ([Intel XE#3468]) -> [PASS][187] +6 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-basic.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][188] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-bmg:          [SKIP][190] ([Intel XE#3189]) -> [PASS][191] +6 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#2446]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [DMESG-WARN][194] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_pm_rpm@dpms-non-lpsp.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][196] ([Intel XE#2446]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [DMESG-WARN][198] ([Intel XE#1727]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_sysfs_edid_timing.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][200] ([Intel XE#2159]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-lnl:          [FAIL][202] ([Intel XE#3512]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][204] ([Intel XE#1130]) -> [PASS][205] +228 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][206] ([Intel XE#3467]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1192]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [SKIP][210] ([Intel XE#2229]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pm@s2idle-mocs:
    - shard-bmg:          [DMESG-FAIL][212] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@s2idle-mocs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][214] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][216] ([Intel XE#1616] / [Intel XE#3468]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1130]) -> [PASS][219] +92 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-WARN][220] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_pm@s4-basic.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][222] ([Intel XE#958]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_tlb@basic-tlb:
    - shard-lnl:          [CRASH][224] ([Intel XE#3212]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@xe_tlb@basic-tlb.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-3/igt@xe_tlb@basic-tlb.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1885]) -> [DMESG-WARN][227] ([Intel XE#3467] / [Intel XE#3468])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     [DMESG-WARN][228] ([Intel XE#3468]) -> [SKIP][229] ([Intel XE#1885])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_hotunplug@unplug-rescan.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][230] ([Intel XE#2423]) -> [SKIP][231] ([Intel XE#2233])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#2423] / [i915#2575]) -> [SKIP][233] ([Intel XE#873])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
    - shard-bmg:          [SKIP][234] ([Intel XE#873]) -> [SKIP][235] ([Intel XE#2423])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][236] ([Intel XE#2370]) -> [SKIP][237] ([Intel XE#2423])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][239] ([Intel XE#316])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][240] ([Intel XE#2327]) -> [SKIP][241] ([Intel XE#2136]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#2136]) -> [SKIP][243] ([Intel XE#316])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#316]) -> [SKIP][245] ([Intel XE#2136] / [Intel XE#2351])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-bmg:          [SKIP][246] ([Intel XE#2136]) -> [DMESG-WARN][247] ([Intel XE#3468]) +1 other test dmesg-warn
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][248] ([Intel XE#2136]) -> [SKIP][249] ([Intel XE#2327]) +6 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#316]) -> [SKIP][251] ([Intel XE#2136]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][252] ([Intel XE#3468]) -> [SKIP][253] ([Intel XE#2136]) +2 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][254] ([Intel XE#3468]) -> [DMESG-FAIL][255] ([Intel XE#3468])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [INCOMPLETE][256] ([Intel XE#1727] / [Intel XE#3225] / [Intel XE#402]) -> [SKIP][257] ([Intel XE#2136])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][258] ([Intel XE#829]) -> [SKIP][259] ([Intel XE#2136])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#829]) -> [SKIP][261] ([Intel XE#2136] / [Intel XE#2351])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][262] ([Intel XE#1124]) -> [SKIP][263] ([Intel XE#2136]) +11 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][265] ([Intel XE#1124])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1124]) -> [SKIP][267] ([Intel XE#2136] / [Intel XE#2351])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#619]) -> [SKIP][269] ([Intel XE#2136] / [Intel XE#2351])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][271] ([Intel XE#607])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#610]) -> [SKIP][273] ([Intel XE#2136]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          [SKIP][274] ([Intel XE#2136]) -> [SKIP][275] ([Intel XE#610])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][276] ([Intel XE#829]) -> [SKIP][277] ([Intel XE#1124])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#829]) -> [SKIP][279] ([Intel XE#1124])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][280] ([Intel XE#2136]) -> [SKIP][281] ([Intel XE#1124]) +12 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1124]) -> [SKIP][283] ([Intel XE#2136]) +8 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][285] ([Intel XE#619])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][286] ([Intel XE#607]) -> [SKIP][287] ([Intel XE#2136])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#607]) -> [SKIP][289] ([Intel XE#2136])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][290] ([Intel XE#610]) -> [SKIP][291] ([Intel XE#2136])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2136]) -> [SKIP][293] ([Intel XE#1124]) +4 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][294] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][295] ([Intel XE#2423]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2191]) -> [SKIP][297] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2423] / [i915#2575]) -> [SKIP][299] ([Intel XE#2191])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][300] ([Intel XE#2423]) -> [SKIP][301] ([Intel XE#2314] / [Intel XE#2894])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#367]) -> [SKIP][303] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][304] ([Intel XE#2423]) -> [SKIP][305] ([Intel XE#367]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2423] / [i915#2575]) -> [SKIP][307] ([Intel XE#367]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][308] ([Intel XE#367]) -> [SKIP][309] ([Intel XE#2423]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][310] -> [SKIP][311] ([Intel XE#2136])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][312] ([Intel XE#2887]) -> [SKIP][313] ([Intel XE#2136]) +12 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][314] ([Intel XE#2136]) -> [SKIP][315] ([Intel XE#2887]) +12 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][316] -> [SKIP][317] ([Intel XE#2652] / [Intel XE#787])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][319] ([Intel XE#455] / [Intel XE#787])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#2907]) -> [SKIP][321] ([Intel XE#2136]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#829]) -> [SKIP][323] ([Intel XE#2136]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
    - shard-bmg:          [SKIP][324] ([Intel XE#3282]) -> [SKIP][325] ([Intel XE#2136])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][326] ([Intel XE#2136]) -> [SKIP][327] ([Intel XE#3432]) +3 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][328] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][329] ([Intel XE#2136])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][330] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][331] ([Intel XE#2136])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#3442]) -> [SKIP][333] ([Intel XE#2136])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2136]) -> [FAIL][335] ([Intel XE#616])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2136]) -> [SKIP][337] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][339] ([Intel XE#2136]) +11 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][341] ([Intel XE#2136] / [Intel XE#2351])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [SKIP][342] -> [SKIP][343] ([Intel XE#2136]) +8 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_cdclk@mode-transition.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#314]) -> [SKIP][345] ([Intel XE#2136] / [Intel XE#2351])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#306]) -> [SKIP][347] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][348] ([Intel XE#2423]) -> [SKIP][349] ([Intel XE#2325])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#2423] / [i915#2575]) -> [SKIP][351] ([Intel XE#306])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_chamelium_color@degamma.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_chamelium_color@degamma.html
    - shard-bmg:          [SKIP][352] ([Intel XE#2325]) -> [SKIP][353] ([Intel XE#2423]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_chamelium_color@degamma.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#373]) -> [SKIP][355] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][356] ([Intel XE#2252]) -> [SKIP][357] ([Intel XE#2423]) +9 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][358] ([Intel XE#2423]) -> [SKIP][359] ([Intel XE#2252]) +11 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2423] / [i915#2575]) -> [SKIP][361] ([Intel XE#373]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][362] ([Intel XE#2341]) -> [SKIP][363] ([Intel XE#2423])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_content_protection@content-type-change.html
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2423] / [i915#2575]) -> [SKIP][365] ([Intel XE#455]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_content_protection@content-type-change.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][366] ([Intel XE#2390]) -> [SKIP][367] ([Intel XE#2423]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [INCOMPLETE][368] ([Intel XE#2715] / [Intel XE#3468]) -> [FAIL][369] ([Intel XE#1178]) +1 other test fail
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_content_protection@legacy.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [FAIL][370] ([Intel XE#1178]) -> [SKIP][371] ([Intel XE#2423])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][372] ([Intel XE#2423]) -> [SKIP][373] ([Intel XE#2320]) +6 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][374] ([Intel XE#2320]) -> [SKIP][375] ([Intel XE#2423]) +5 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#308]) -> [SKIP][377] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][378] ([Intel XE#2423]) -> [SKIP][379] ([Intel XE#2321]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][380] ([Intel XE#2321]) -> [SKIP][381] ([Intel XE#2423])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#2423] / [i915#2575]) -> [SKIP][383] ([Intel XE#308]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#323]) -> [SKIP][385] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][386] ([Intel XE#2423]) -> [DMESG-WARN][387] ([Intel XE#3468]) +3 other tests dmesg-warn
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][388] ([Intel XE#2423]) -> [SKIP][389] ([Intel XE#2291])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][390] ([Intel XE#2291]) -> [DMESG-WARN][391] ([Intel XE#877])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][392] ([Intel XE#2291]) -> [SKIP][393] ([Intel XE#2423])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][394] ([Intel XE#2286]) -> [SKIP][395] ([Intel XE#2423])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][396] ([Intel XE#2423]) -> [SKIP][397] ([Intel XE#2286])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [FAIL][398] ([Intel XE#2141]) -> [SKIP][399] ([Intel XE#2136])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][400] ([Intel XE#2136]) -> [SKIP][401] ([Intel XE#1508])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][402] ([Intel XE#2323]) -> [SKIP][403] ([Intel XE#2423])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_display_modes@mst-extended-mode-negative.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][404] ([Intel XE#2244]) -> [SKIP][405] ([Intel XE#2136])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][406] ([Intel XE#2136]) -> [FAIL][407] ([Intel XE#1695])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][408] ([Intel XE#776]) -> [SKIP][409] ([Intel XE#2136])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][411] ([Intel XE#1727])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_feature_discovery@display.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_feature_discovery@display.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][412] ([Intel XE#2423]) -> [SKIP][413] ([Intel XE#2373])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#703]) -> [SKIP][415] ([Intel XE#2423] / [i915#2575])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][416] ([Intel XE#2423]) -> [SKIP][417] ([Intel XE#2375])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#1135]) -> [SKIP][419] ([Intel XE#2423] / [i915#2575])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][420] ([Intel XE#3189]) -> [SKIP][421] ([Intel XE#2423]) +5 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][422] ([Intel XE#3189]) -> [FAIL][423] ([Intel XE#2882])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][424] ([Intel XE#3189]) -> [SKIP][425] ([Intel XE#2316])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][426] ([Intel XE#2423]) -> [SKIP][427] ([Intel XE#2316]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][428] ([Intel XE#2316]) -> [SKIP][429] ([Intel XE#2423]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-FAIL][430] ([Intel XE#3468]) -> [SKIP][431] ([Intel XE#2423]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][432] ([Intel XE#2423]) -> [FAIL][433] ([Intel XE#2882])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [DMESG-WARN][434] -> [SKIP][435] ([Intel XE#2423])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][436] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][437] ([Intel XE#2423] / [i915#2575])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-bmg:          [INCOMPLETE][438] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][439] ([Intel XE#2136])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#455]) -> [SKIP][441] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][442] ([Intel XE#3189]) -> [SKIP][443] ([Intel XE#2293] / [Intel XE#2380])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][444] ([Intel XE#2380]) -> [SKIP][445] ([Intel XE#2136])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-bmg:          [SKIP][446] ([Intel XE#3189]) -> [SKIP][447] ([Intel XE#2136]) +7 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][448] ([Intel XE#2136]) -> [SKIP][449] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#2136]) -> [SKIP][451] ([Intel XE#455]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][452] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][453] ([Intel XE#2136]) +5 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#455]) -> [SKIP][455] ([Intel XE#2136]) +2 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#540]) -> [SKIP][457] ([Intel XE#2423] / [i915#2575])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@force-connector-state.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][458] ([i915#5274]) -> [SKIP][459] ([Intel XE#2423] / [i915#2575])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][460] ([Intel XE#2136]) -> [SKIP][461] ([Intel XE#2311]) +35 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][462] ([Intel XE#2312]) -> [SKIP][463] ([Intel XE#2311]) +4 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][464] ([Intel XE#2136]) -> [SKIP][465] ([Intel XE#2312]) +13 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2136]) -> [SKIP][467] ([Intel XE#651]) +16 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][468] -> [SKIP][469] ([Intel XE#651])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#651]) -> [SKIP][471] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][472] ([Intel XE#2136]) -> [FAIL][473] ([Intel XE#2333]) +11 other tests fail
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][474] ([Intel XE#2333]) -> [SKIP][475] ([Intel XE#2136]) +12 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][476] ([Intel XE#3468]) -> [FAIL][477] ([Intel XE#2333]) +2 other tests fail
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][478] ([Intel XE#2136]) -> [DMESG-FAIL][479] ([Intel XE#3468])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [FAIL][480] ([Intel XE#2333]) -> [SKIP][481] ([Intel XE#2312]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          [FAIL][482] ([Intel XE#2333]) -> [DMESG-FAIL][483] ([Intel XE#3468]) +2 other tests dmesg-fail
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][484] ([Intel XE#2352]) -> [SKIP][485] ([Intel XE#2136]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#651]) -> [SKIP][487] ([Intel XE#2136]) +23 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][489] ([Intel XE#651]) +2 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][490] ([Intel XE#2312]) -> [SKIP][491] ([Intel XE#2136]) +1 other test skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][492] ([Intel XE#2311]) -> [SKIP][493] ([Intel XE#2136]) +33 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][494] ([Intel XE#3189]) -> [SKIP][495] ([Intel XE#2311]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][496] ([Intel XE#2311]) -> [SKIP][497] ([Intel XE#2312]) +6 other tests skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#658]) -> [SKIP][499] ([Intel XE#2136] / [Intel XE#2351])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#653]) -> [SKIP][501] ([Intel XE#2136]) +28 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][502] -> [SKIP][503] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][505] ([Intel XE#653]) +5 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][506] ([Intel XE#2136]) -> [SKIP][507] ([Intel XE#2313]) +32 other tests skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][508] ([Intel XE#3189]) -> [SKIP][509] ([Intel XE#2312])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#653]) -> [SKIP][511] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][512] ([Intel XE#2312]) -> [SKIP][513] ([Intel XE#2313]) +4 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][514] ([Intel XE#2313]) -> [SKIP][515] ([Intel XE#2136]) +35 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][516] ([Intel XE#2313]) -> [SKIP][517] ([Intel XE#2312]) +2 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][518] ([Intel XE#3189]) -> [SKIP][519] ([Intel XE#2313]) +2 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2136]) -> [SKIP][521] ([Intel XE#653]) +17 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-bmg:          [SKIP][522] ([Intel XE#2423]) -> [SKIP][523] ([Intel XE#2502])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#2423] / [i915#2575]) -> [SKIP][525] ([Intel XE#605])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_getfb@getfb-repeated-different-handles:
    - shard-bmg:          [SKIP][526] -> [SKIP][527] ([Intel XE#2423])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_getfb@getfb-repeated-different-handles.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_getfb@getfb-repeated-different-handles.html
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#687]) -> [SKIP][529] ([Intel XE#2423] / [i915#2575])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_getfb@getfb-repeated-different-handles.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_getfb@getfb-repeated-different-handles.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][530] ([Intel XE#2423]) -> [SKIP][531] ([Intel XE#2340])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [FAIL][532] -> [SKIP][533] ([Intel XE#2423] / [i915#2575])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][534] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][535] ([Intel XE#2423])
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#346]) -> [SKIP][537] ([Intel XE#2136]) +1 other test skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#2136]) -> [SKIP][539] ([Intel XE#2925])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][540] ([Intel XE#2423]) -> [SKIP][541] ([Intel XE#2501])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#356]) -> [SKIP][543] ([Intel XE#2423] / [i915#2575])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][544] ([Intel XE#2486]) -> [SKIP][545] ([Intel XE#2423])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][546] ([Intel XE#616]) -> [SKIP][547] ([Intel XE#2423] / [i915#2575])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][548] ([Intel XE#2423]) -> [SKIP][549] ([Intel XE#2393])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][550] ([Intel XE#2393]) -> [SKIP][551] ([Intel XE#2423])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#455]) -> [SKIP][553] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][554] ([Intel XE#2493]) -> [SKIP][555] ([Intel XE#2423])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#2423] / [i915#2575]) -> [FAIL][557] ([Intel XE#361])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-bmg:          [SKIP][558] ([Intel XE#3189]) -> [SKIP][559] ([Intel XE#2763])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [SKIP][560] ([Intel XE#2763]) -> [SKIP][561] ([Intel XE#2423]) +2 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [DMESG-WARN][562] ([Intel XE#1727]) -> [SKIP][563] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][565] ([Intel XE#2423] / [i915#2575])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#2423] / [i915#2575]) -> [SKIP][567] ([Intel XE#2763] / [Intel XE#455])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-bmg:          [SKIP][568] ([Intel XE#2423]) -> [SKIP][569] ([Intel XE#2763]) +2 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#870]) -> [SKIP][571] ([Intel XE#2136]) +2 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][572] ([Intel XE#870]) -> [SKIP][573] ([Intel XE#2136])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#2136]) -> [SKIP][575] ([Intel XE#870])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][577] ([Intel XE#1122])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-bmg:          [SKIP][578] ([Intel XE#2391]) -> [SKIP][579] ([Intel XE#2136])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#1129]) -> [SKIP][581] ([Intel XE#2136])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#2136]) -> [SKIP][583] ([Intel XE#3309])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][585] ([Intel XE#1129])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-bmg:          [DMESG-WARN][586] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][587] ([Intel XE#2136])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_pm_dc@dc9-dpms.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#908]) -> [SKIP][589] ([Intel XE#2136])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][590] ([Intel XE#2136]) -> [SKIP][591] ([Intel XE#2499])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][592] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][593] ([Intel XE#2446])
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][594] -> [SKIP][595] ([Intel XE#2446])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#2446]) -> [DMESG-WARN][597] ([Intel XE#3468])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][598] ([Intel XE#2446]) -> [INCOMPLETE][599] ([Intel XE#2864])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_rpm@universal-planes.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][600] -> [SKIP][601] ([Intel XE#1489])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#2136]) -> [SKIP][603] ([Intel XE#1489]) +2 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][604] ([Intel XE#2136]) -> [SKIP][605] ([Intel XE#1489]) +7 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][606] ([Intel XE#3189]) -> [SKIP][607] ([Intel XE#1489]) +1 other test skip
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#1489]) -> [SKIP][609] ([Intel XE#2136]) +3 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][610] ([Intel XE#1489]) -> [SKIP][611] ([Intel XE#2136]) +6 other tests skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][612] ([Intel XE#1122]) -> [SKIP][613] ([Intel XE#2136])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
    - shard-bmg:          [SKIP][614] ([Intel XE#2387]) -> [SKIP][615] ([Intel XE#2136])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][616] ([Intel XE#2136]) -> [SKIP][617] ([Intel XE#2387]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][618] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][619] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][621] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][623] ([Intel XE#2136]) +11 other tests skip
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][624] ([Intel XE#2136]) -> [SKIP][625] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][626] -> [SKIP][627] ([Intel XE#2850] / [Intel XE#929])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][628] ([Intel XE#2136]) -> [SKIP][629] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][630] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][631] ([Intel XE#2136]) +16 other tests skip
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][633] ([Intel XE#2351])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-bmg:          [SKIP][634] ([Intel XE#3189]) -> [SKIP][635] ([Intel XE#2234] / [Intel XE#2850])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr@psr2-primary-blt.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][636] ([Intel XE#2423] / [i915#2575]) -> [SKIP][637] ([Intel XE#1127])
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][638] ([Intel XE#2330]) -> [SKIP][639] ([Intel XE#2423])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][640] ([Intel XE#2423]) -> [SKIP][641] ([Intel XE#2330])
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#2423] / [i915#2575]) -> [SKIP][643] ([Intel XE#3414])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][644] ([Intel XE#2423]) -> [SKIP][645] ([Intel XE#3414]) +1 other test skip
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#3414]) -> [SKIP][647] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][648] ([Intel XE#3414]) -> [SKIP][649] ([Intel XE#2423]) +1 other test skip
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][650] ([Intel XE#3189]) -> [SKIP][651] ([Intel XE#2413])
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-bmg:          [SKIP][652] ([Intel XE#2423]) -> [SKIP][653] ([Intel XE#2413])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][654] ([Intel XE#2426]) -> [SKIP][655] ([Intel XE#2423])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][656] ([Intel XE#2423]) -> [SKIP][657] ([Intel XE#2450])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][659] ([Intel XE#1034] / [Intel XE#1727])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [INCOMPLETE][660] ([Intel XE#1034]) -> [SKIP][661] ([Intel XE#2423] / [i915#2575])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@wait-forked-busy-hang:
    - shard-bmg:          [SKIP][662] ([Intel XE#2423]) -> [DMESG-FAIL][663] ([Intel XE#3468])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_vblank@wait-forked-busy-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][664] ([Intel XE#2423]) -> [SKIP][665] ([Intel XE#1499]) +1 other test skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][666] -> [SKIP][667] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_vrr@flipline.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_vrr@flipline.html
    - shard-bmg:          [SKIP][668] ([Intel XE#3189]) -> [SKIP][669] ([Intel XE#1499])
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_vrr@flipline.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][670] ([Intel XE#1499]) -> [SKIP][671] ([Intel XE#2423]) +1 other test skip
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          [SKIP][672] ([Intel XE#756]) -> [SKIP][673] ([Intel XE#2423])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_writeback@writeback-check-output.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_writeback@writeback-check-output.html
    - shard-dg2-set2:     [SKIP][674] ([Intel XE#756]) -> [SKIP][675] ([Intel XE#2423] / [i915#2575])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_writeback@writeback-check-output.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][676] ([Intel XE#2423]) -> [SKIP][677] ([Intel XE#756]) +1 other test skip
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][678] ([Intel XE#2423] / [i915#2575]) -> [SKIP][679] ([Intel XE#1091] / [Intel XE#2849])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-bmg:          [SKIP][680] ([Intel XE#2423]) -> [SKIP][681] ([Intel XE#1091] / [Intel XE#2849])
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][682] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][683] ([Intel XE#2423])
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][684] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][685] ([Intel XE#1130])
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][686] ([Intel XE#1126]) -> [SKIP][687] ([Intel XE#1130]) +1 other test skip
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][688] ([Intel XE#1130]) -> [SKIP][689] ([Intel XE#2905]) +9 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-dg2-set2:     [SKIP][690] ([Intel XE#2905]) -> [SKIP][691] ([Intel XE#1130]) +14 other tests skip
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_eudebug@basic-vm-bind.html
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][692] ([Intel XE#1130]) -> [SKIP][693] ([Intel XE#2905]) +14 other tests skip
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][694] ([Intel XE#2905]) -> [SKIP][695] ([Intel XE#1130]) +14 other tests skip
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_eudebug@vm-bind-clear.html
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-bmg:          [DMESG-WARN][696] ([Intel XE#1727]) -> [SKIP][697] ([Intel XE#1130])
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_evict@evict-beng-small-external-cm.html
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [TIMEOUT][698] ([Intel XE#1473]) -> [SKIP][699] ([Intel XE#1130])
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][700] ([Intel XE#1130]) -> [TIMEOUT][701] ([Intel XE#1473] / [Intel XE#2472])
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          [SKIP][702] ([Intel XE#1130]) -> [INCOMPLETE][703] ([Intel XE#1473])
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][704] ([Intel XE#1130]) -> [DMESG-WARN][705] ([Intel XE#1727]) +1 other test dmesg-warn
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@once-cm-virtual-rebind:
    - shard-bmg:          [SKIP][706] ([Intel XE#1130]) -> [DMESG-WARN][707] ([Intel XE#1727] / [Intel XE#3468])
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_balancer@once-cm-virtual-rebind.html
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_exec_balancer@once-cm-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][708] ([Intel XE#1130]) -> [SKIP][709] ([Intel XE#2322]) +9 other tests skip
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][710] ([Intel XE#2322]) -> [SKIP][711] ([Intel XE#1130]) +11 other tests skip
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][712] ([Intel XE#1130]) -> [SKIP][713] ([Intel XE#288]) +16 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][714] ([Intel XE#288]) -> [SKIP][715] ([Intel XE#1130]) +35 other tests skip
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - shard-dg2-set2:     [SKIP][716] ([Intel XE#1130]) -> [DMESG-WARN][717] ([Intel XE#1727]) +8 other tests dmesg-warn
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-bmg:          [SKIP][718] ([Intel XE#1130]) -> [DMESG-WARN][719] ([Intel XE#3468]) +3 other tests dmesg-warn
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          [DMESG-WARN][720] ([Intel XE#3468]) -> [SKIP][721] ([Intel XE#1130]) +2 other tests skip
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [SKIP][722] ([Intel XE#1130]) -> [DMESG-WARN][723] ([Intel XE#3343]) +2 other tests dmesg-warn
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
    - shard-bmg:          [SKIP][724] ([Intel XE#1130]) -> [DMESG-WARN][725] ([Intel XE#3343] / [Intel XE#3468])
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [SKIP][726] ([Intel XE#1130]) -> [DMESG-WARN][727] ([Intel XE#3467] / [Intel XE#3468])
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [FAIL][728] ([Intel XE#3499]) -> [DMESG-FAIL][729] ([Intel XE#3467] / [Intel XE#3468])
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-FAIL][730] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][731] ([Intel XE#1130])
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [SKIP][732] ([Intel XE#1130]) -> [DMESG-FAIL][733] ([Intel XE#3467] / [Intel XE#3468])
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [FAIL][734] ([Intel XE#3499]) -> [SKIP][735] ([Intel XE#1130])
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-dg2-set2:     [DMESG-WARN][736] ([Intel XE#3467]) -> [SKIP][737] ([Intel XE#1130]) +2 other tests skip
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
    - shard-bmg:          [DMESG-WARN][738] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][739] ([Intel XE#3467])
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][740] ([Intel XE#1130]) -> [SKIP][741] ([Intel XE#560])
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_media_fill@media-fill.html
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][742] ([Intel XE#1130]) -> [SKIP][743] ([Intel XE#586])
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_mmap@small-bar.html
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][744] -> [DMESG-WARN][745] ([Intel XE#3468])
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_module_load@reload.html
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-FAIL][746] ([Intel XE#3467]) -> [FAIL][747] ([Intel XE#3546])
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [747]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     [SKIP][748] ([Intel XE#1130]) -> [SKIP][749] ([Intel XE#3573]) +3 other tests skip
   [748]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_oa@map-oa-buffer.html
   [749]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][750] ([Intel XE#2248]) -> [SKIP][751] ([Intel XE#1130])
   [750]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html
   [751]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-dg2-set2:     [SKIP][752] ([Intel XE#3573]) -> [SKIP][753] ([Intel XE#1130]) +10 other tests skip
   [752]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_oa@unprivileged-single-ctx-counters.html
   [753]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_oa@unprivileged-single-ctx-counters.html
    - shard-bmg:          [SKIP][754] ([Intel XE#1130]) -> [SKIP][755] ([Intel XE#2248])
   [754]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [755]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][756] ([Intel XE#1337]) -> [SKIP][757] ([Intel XE#1130])
   [756]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html
   [757]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][758] ([Intel XE#979]) -> [SKIP][759] ([Intel XE#1130])
   [758]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html
   [759]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][760] ([Intel XE#1173]) -> [SKIP][761] ([Intel XE#1061])
   [760]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_peer2peer@read.html
   [761]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][762] ([Intel XE#1061]) -> [FAIL][763] ([Intel XE#1173])
   [762]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_peer2peer@write.html
   [763]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][764] ([Intel XE#2284]) -> [SKIP][765] ([Intel XE#1130]) +1 other test skip
   [764]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_pm@d3cold-basic.html
   [765]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][766] ([Intel XE#2284]) -> [SKIP][767] ([Intel XE#1130])
   [766]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_pm@d3cold-mocs.html
   [767]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mocs:
    - shard-dg2-set2:     [DMESG-WARN][768] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][769] ([Intel XE#1130])
   [768]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pm@d3hot-mocs.html
   [769]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-bmg:          [DMESG-WARN][770] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][771] ([Intel XE#1130])
   [770]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_pm@d3hot-multiple-execs.html
   [771]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][772] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][773] ([Intel XE#1130]) +1 other test skip
   [772]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [773]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [SKIP][774] ([Intel XE#1130]) -> [DMESG-WARN][775] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [774]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
   [775]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [DMESG-WARN][776] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [SKIP][777] ([Intel XE#1130])
   [776]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_pm@s4-mocs.html
   [777]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][778] ([Intel XE#1130]) -> [SKIP][779] ([Intel XE#579])
   [778]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [779]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][780] ([Intel XE#944]) -> [SKIP][781] ([Intel XE#1130]) +2 other tests skip
   [780]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [781]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][782] ([Intel XE#944]) -> [SKIP][783] ([Intel XE#1130]) +3 other tests skip
   [782]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [783]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][784] ([Intel XE#1130]) -> [SKIP][785] ([Intel XE#944]) +1 other test skip
   [784]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [785]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][786] ([Intel XE#1130]) -> [SKIP][787] ([Intel XE#944]) +2 other tests skip
   [786]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html
   [787]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][788] ([Intel XE#3342]) -> [SKIP][789] ([Intel XE#1130])
   [788]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html
   [789]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][790] ([Intel XE#1130]) -> [SKIP][791] ([Intel XE#3342])
   [790]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [791]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_tlb@basic-tlb:
    - shard-bmg:          [CRASH][792] ([Intel XE#3212]) -> [DMESG-WARN][793] ([Intel XE#3468])
   [792]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_tlb@basic-tlb.html
   [793]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@large-binds-4194304:
    - shard-dg2-set2:     [DMESG-WARN][794] ([Intel XE#1727]) -> [SKIP][795] ([Intel XE#1130])
   [794]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_vm@large-binds-4194304.html
   [795]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_vm@large-binds-4194304.html

  * igt@xe_vm@large-userptr-misaligned-binds-33554432:
    - shard-bmg:          [DMESG-WARN][796] -> [SKIP][797] ([Intel XE#1130])
   [796]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-33554432.html
   [797]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_vm@large-userptr-misaligned-binds-33554432.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [ABORT][798] -> [SKIP][799] ([Intel XE#1130])
   [798]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html
   [799]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][800] ([Intel XE#1130]) -> [ABORT][801] ([Intel XE#3075] / [Intel XE#3084])
   [800]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [801]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3189]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189
  [Intel XE#3198]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3198
  [Intel XE#3212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3282
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3512
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8126 -> IGTPW_12198
  * Linux: xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e -> xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198

  IGTPW_12198: 12198
  IGT_8126: 8126
  xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e: 7cd4d1589e461d61330ec272c448bc6d1b9da35e
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/index.html

--===============7467126736992597256==
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
<tr><td><b>Series:</b></td><td>tests/intel/perf_pmu: Fix Test Assertion Failure for semaphore-busy test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141792/">https://patchwork.freedesktop.org/series/141792/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8126_full -&gt; XEIGTPW_12198_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12198_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12198_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12198_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_plane_lowres@tiling-x@pipe-a-dp-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-68:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_pm_rpm@universal-planes@plane-68.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@page-sized:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-7/igt@xe_exec_store@page-sized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-8/igt@xe_exec_store@page-sized.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_properties@plane-properties-legacy.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-conflict-error-inject:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_vm@bind-array-conflict-error-inject.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_vm@bind-array-conflict-error-inject.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12198_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_atomic_interruptible@universal-setplane-cursor@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +92 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +60 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-4-to-linear.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_getfb@getfb-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-mid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3198">Intel XE#3198</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +196 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pat@prime-self-import-coh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-front:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-inval-many-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-inval-many-front.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +224 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@fbdev@nullptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_addfb_basic@unused-handle.html">PASS</a> +94 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_color@ctm-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_color@ctm-0-25.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-64x64.html">PASS</a> +40 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_alpha_blend@alpha-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_pm_rpm@dpms-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_sysfs_edid_timing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3512">Intel XE#3512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-8/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +228 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@s2idle-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_pm@s2idle-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@xe_pm@s3-basic-exec.html">PASS</a> +92 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-lnl-6/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-lnl-3/igt@xe_tlb@basic-tlb.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@core_hotunplug@unplug-rescan.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3282">Intel XE#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_cdclk@mode-transition.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141">Intel XE#2141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_feature_discovery@display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_feature_discovery@display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2502">Intel XE#2502</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-repeated-different-handles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_plane_cursor@viewport.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_pm_dc@dc9-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-rpm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vblank@wait-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@kms_vblank@wait-forked-busy-hang.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189">Intel XE#3189</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_evict@evict-beng-small-external-cm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_evict@evict-beng-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_balancer@once-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_exec_balancer@once-cm-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) +2 other tests dmesg-warn</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-7/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pm@d3hot-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_pm@d3hot-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_pm@s4-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-3/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_tlb@basic-tlb.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3212">Intel XE#3212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-6/igt@xe_tlb@basic-tlb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-4194304:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-463/igt@xe_vm@large-binds-4194304.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-466/igt@xe_vm@large-binds-4194304.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-33554432:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-2/igt@xe_vm@large-userptr-misaligned-binds-33554432.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_vm@large-userptr-misaligned-binds-33554432.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8126/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12198/shard-dg2-435/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8126 -&gt; IGTPW_12198</li>
<li>Linux: xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e -&gt; xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198</li>
</ul>
<p>IGTPW_12198: 12198<br />
  IGT_8126: 8126<br />
  xe-2279-7cd4d1589e461d61330ec272c448bc6d1b9da35e: 7cd4d1589e461d61330ec272c448bc6d1b9da35e<br />
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198</p>

</body>
</html>

--===============7467126736992597256==--
