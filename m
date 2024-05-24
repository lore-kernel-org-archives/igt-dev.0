Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9E0C25B74
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 04:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF8E10E03E;
	Fri, 24 May 2024 04:22:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2C710E03E;
 Fri, 24 May 2024 04:22:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4989573606699726382=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=3A_Conver?=
 =?utf-8?q?t_to_dynamic_subtests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 24 May 2024 04:22:47 -0000
Message-ID: <171652456783.2170280.9994357807459158053@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240524031018.470573-1-pranay.samala@intel.com>
In-Reply-To: <20240524031018.470573-1-pranay.samala@intel.com>
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

--===============4989573606699726382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Convert to dynamic subtests
URL   : https://patchwork.freedesktop.org/series/133997/
State : success

== Summary ==

CI Bug Log - changes from IGT_7871 -> IGTPW_11185
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/index.html

Participating hosts (42 -> 39)
------------------------------

  Additional (3): bat-dg2-11 bat-jsl-1 fi-kbl-8809g 
  Missing    (6): bat-kbl-2 fi-snb-2520m fi-cfl-8109u fi-elk-e7500 bat-arls-1 bat-mtlp-6 

New tests
---------

  New tests have been introduced between IGT_7871 and IGTPW_11185:

### New IGT tests (64) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.72, 1.15] s

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.64, 2.87] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.64, 0.90] s

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.73, 1.10] s

  * igt@kms_flip@basic-flip-vs-dpms@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.89, 1.55] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.04] s

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.30, 2.43] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.61, 0.88] s

  * igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.69, 0.83] s

  * igt@kms_flip@basic-flip-vs-dpms@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.84, 1.31] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.24] s

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.29, 2.43] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.60, 0.86] s

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.67, 2.81] s

  * igt@kms_flip@basic-flip-vs-dpms@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [2.31, 2.37] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.71, 1.13] s

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.66, 2.84] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.64, 0.95] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.72, 1.10] s

  * igt@kms_flip@basic-flip-vs-modeset@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.91, 1.50] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.64, 1.26] s

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.30, 2.41] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.58, 0.86] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.66, 0.83] s

  * igt@kms_flip@basic-flip-vs-modeset@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.85, 1.24] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.65, 1.27] s

  * igt@kms_flip@basic-flip-vs-modeset@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [2.29, 2.53] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.58, 0.86] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.66, 2.79] s

  * igt@kms_flip@basic-flip-vs-modeset@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_flip@basic-flip-vs-modeset@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [2.29, 2.37] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [1.00, 1.41] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.98, 2.30] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.79, 1.18] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [1.01, 1.67] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [1.14, 1.77] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.99, 1.32] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.98, 2.24] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.75, 1.14] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.98, 1.59] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [1.11, 1.56] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.99, 1.45] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.97, 2.26] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.76, 1.16] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.96, 2.90] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [1.11] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [1.98, 2.07] s

  * igt@kms_flip@basic-plain-flip@a-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.72, 1.12] s

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.74, 2.02] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.64, 0.90] s

  * igt@kms_flip@basic-plain-flip@a-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.74, 1.06] s

  * igt@kms_flip@basic-plain-flip@a-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.84, 1.46] s

  * igt@kms_flip@basic-plain-flip@b-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.70, 1.05] s

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.71, 1.96] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.66, 0.85] s

  * igt@kms_flip@basic-plain-flip@b-hdmi-a2:
    - Statuses : 5 pass(s)
    - Exec time: [0.69, 0.99] s

  * igt@kms_flip@basic-plain-flip@b-vga1:
    - Statuses : 4 pass(s)
    - Exec time: [0.83, 1.27] s

  * igt@kms_flip@basic-plain-flip@c-dp1:
    - Statuses : 4 pass(s)
    - Exec time: [0.71, 1.08] s

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - Statuses : 8 pass(s)
    - Exec time: [1.71, 1.98] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a1:
    - Statuses : 5 pass(s)
    - Exec time: [0.64, 0.86] s

  * igt@kms_flip@basic-plain-flip@c-hdmi-a2:
    - Statuses : 7 pass(s)
    - Exec time: [0.68, 2.49] s

  * igt@kms_flip@basic-plain-flip@c-vga1:
    - Statuses : 1 pass(s)
    - Exec time: [0.83] s

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - Statuses : 4 pass(s)
    - Exec time: [1.72, 1.79] s

  

Known issues
------------

  Here are the changes found in IGTPW_11185 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-jsl-1:          NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][2] ([i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html
    - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][4] ([i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][6] ([i915#4083])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@gem_mmap@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][7] ([i915#4077]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][8] ([i915#4079]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#6621])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][10] ([i915#4212]) +7 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][11] ([i915#5190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-11:         NOTRUN -> [SKIP][12] ([i915#4215] / [i915#5190])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#4103] / [i915#4213]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-jsl-1:          NOTRUN -> [SKIP][14] ([i915#4103]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-11:         NOTRUN -> [SKIP][15] ([i915#3555] / [i915#3840])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_dsc@dsc-basic.html
    - bat-jsl-1:          NOTRUN -> [SKIP][16] ([i915#3555] / [i915#9886])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-8809g:       NOTRUN -> [SKIP][17] +30 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-11:         NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-11:         NOTRUN -> [SKIP][20] ([i915#5274])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_pm_backlight@basic-brightness:
    - bat-dg2-11:         NOTRUN -> [SKIP][21] ([i915#5354])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-dg2-11:         NOTRUN -> [SKIP][22] ([i915#1072] / [i915#9732]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-11:         NOTRUN -> [SKIP][23] ([i915#3555])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-jsl-1:          NOTRUN -> [SKIP][24] ([i915#3555])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#3708])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-11:         NOTRUN -> [SKIP][26] ([i915#3708] / [i915#4077]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-read:
    - bat-dg2-11:         NOTRUN -> [SKIP][27] ([i915#3291] / [i915#3708]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gtt:
    - bat-arls-2:         [DMESG-WARN][28] ([i915#10341]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@gtt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-arls-2/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@ring_submission:
    - bat-arls-2:         [DMESG-FAIL][30] ([i915#10262]) -> [PASS][31] +16 other tests pass
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@ring_submission.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-arls-2/igt@i915_selftest@live@ring_submission.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp7:
    - {bat-mtlp-9}:       [FAIL][32] ([i915#6121]) -> [PASS][33] +10 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html

  * igt@kms_flip@basic-plain-flip@c-dp6:
    - {bat-mtlp-9}:       [DMESG-WARN][34] ([i915#11009]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6:
    - {bat-mtlp-9}:       [DMESG-FAIL][36] ([i915#11009]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6:
    - {bat-mtlp-9}:       [FAIL][38] ([i915#10979]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10262]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262
  [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979
  [i915#11009]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009
  [i915#11170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11170
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#6121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7871 -> IGTPW_11185

  CI-20190529: 20190529
  CI_DRM_14813: 1385623a20ad940dab90bfaa4bc01fe599506e09 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11185: 11185
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/index.html

--===============4989573606699726382==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Convert to dynamic subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133997/">https://patchwork.freedesktop.org/series/133997/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7871 -&gt; IGTPW_11185</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/index.html</p>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Additional (3): bat-dg2-11 bat-jsl-1 fi-kbl-8809g <br />
  Missing    (6): bat-kbl-2 fi-snb-2520m fi-cfl-8109u fi-elk-e7500 bat-arls-1 bat-mtlp-6 </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7871 and IGTPW_11185:</p>
<h3>New IGT tests (64)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.72, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.64, 2.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.64, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.73, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.89, 1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.30, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.61, 0.88] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.69, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.84, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.29, 2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.60, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.67, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.31, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.71, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.66, 2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.64, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.72, 1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.91, 1.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.64, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.30, 2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.58, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.66, 0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.85, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.65, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [2.29, 2.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.58, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.66, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.29, 2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.00, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.98, 2.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.79, 1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [1.01, 1.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.14, 1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.99, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.98, 2.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.75, 1.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.98, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.11, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.99, 1.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.97, 2.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.76, 1.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.96, 2.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.98, 2.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.72, 1.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.74, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.64, 0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.74, 1.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.84, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.70, 1.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.71, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.66, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a2:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.69, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-vga1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.83, 1.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.71, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.71, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a1:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.64, 0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-hdmi-a2:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.68, 2.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-vga1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-edp1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.72, 1.79] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11185 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/fi-kbl-8809g/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/fi-kbl-8809g/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i915#9886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/fi-kbl-8809g/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> +30 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-dg2-11/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341">i915#10341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-arls-2/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@ring_submission:</p>
<ul>
<li>bat-arls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-arls-2/igt@i915_selftest@live@ring_submission.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10262">i915#10262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-arls-2/igt@i915_selftest@live@ring_submission.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp7:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_flip@basic-flip-vs-dpms@b-dp7.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_flip@basic-plain-flip@c-dp6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11009">i915#11009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6:</p>
<ul>
<li>{bat-mtlp-9}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7871/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10979">i915#10979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11185/bat-mtlp-9/igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-dp-6.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7871 -&gt; IGTPW_11185</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14813: 1385623a20ad940dab90bfaa4bc01fe599506e09 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11185: 11185<br />
  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4989573606699726382==--
