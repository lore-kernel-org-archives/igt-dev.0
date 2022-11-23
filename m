Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2131623002679026901=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Wed, 23 Nov 2022 20:17:56 -0000
Message-ID: <166923467666.15572.6992661942004820872@emeril.freedesktop.org>
References: <20221121191747.2817707-1-markyacoub@chromium.org>
In-Reply-To: <20221121191747.2817707-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Simplify_the_chamelium_test_files=2E_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2131623002679026901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Chamelium: Simplify the chamelium test files. (rev2)
URL   : https://patchwork.freedesktop.org/series/111163/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12424 -> IGTPW_8147
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8147 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8147, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/index.html

Participating hosts (37 -> 37)
------------------------------

  Additional (3): fi-icl-u2 bat-atsm-1 bat-dg1-6 
  Missing    (3): fi-ctg-p8600 fi-hsw-4770 fi-ilk-m540 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8147:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - bat-dg1-5:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-5/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - bat-dg1-6:          NOTRUN -> [SKIP][2] +8 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Warnings ####

  * igt@kms_chamelium@dp-crc-fast:
    - bat-adlp-4:         [SKIP][4] ([fdo#111827]) -> [SKIP][5] +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-rkl-guc:         [SKIP][6] ([fdo#111827]) -> [SKIP][7] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-rkl-11600:       [SKIP][8] ([fdo#111827]) -> [SKIP][9] +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html
    - bat-dg1-5:          [SKIP][10] ([fdo#111827]) -> [SKIP][11] +7 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_chamelium@common-hpd-after-suspend:
    - {bat-rpls-1}:       NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-1/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - {bat-jsl-3}:        [SKIP][13] ([fdo#111827]) -> [SKIP][14] +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html
    - {bat-dg2-9}:        [SKIP][15] ([fdo#111827]) -> [SKIP][16] +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - {fi-ehl-2}:         [SKIP][17] ([fdo#111827]) -> [SKIP][18] +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - {bat-rpls-1}:       [SKIP][19] ([fdo#111827]) -> [SKIP][20] +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-1/igt@kms_chamelium@hdmi-crc-fast.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-1/igt@kms_chamelium@hdmi-crc-fast.html
    - {bat-dg1-7}:        [SKIP][21] ([fdo#111827]) -> [SKIP][22] +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - {bat-dg2-8}:        [SKIP][23] ([fdo#111827]) -> [SKIP][24] +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html
    - {bat-adlm-1}:       [SKIP][25] ([fdo#111827]) -> [SKIP][26] +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html
    - {bat-jsl-1}:        [SKIP][27] ([fdo#111827]) -> [SKIP][28] +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - {bat-adlp-6}:       [SKIP][29] ([fdo#111827]) -> [SKIP][30] +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html
    - {bat-rplp-1}:       [SKIP][31] ([fdo#111827]) -> [SKIP][32] +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html
    - {bat-dg2-11}:       [SKIP][33] ([fdo#111827]) -> [SKIP][34] +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg2-11/igt@kms_chamelium@hdmi-hpd-fast.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg2-11/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - {bat-adln-1}:       [SKIP][35] ([fdo#111827]) -> [SKIP][36] +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adln-1/igt@kms_chamelium@vga-edid-read.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adln-1/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-fast:
    - {bat-rpls-2}:       [SKIP][37] ([fdo#111827]) -> [SKIP][38] +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-2/igt@kms_chamelium@vga-hpd-fast.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-2/igt@kms_chamelium@vga-hpd-fast.html

  
Known issues
------------

  Here are the changes found in IGTPW_8147 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - fi-icl-u2:          NOTRUN -> [SKIP][39] ([i915#7456])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@debugfs_test@basic-hwmon.html

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][40] ([i915#2190])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][41] ([i915#4613]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][42] ([i915#4083])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@gem_mmap@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][43] ([i915#4079]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - bat-dg1-6:          NOTRUN -> [SKIP][44] ([i915#4077]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - bat-dg1-6:          NOTRUN -> [SKIP][45] ([i915#7561])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-6:          NOTRUN -> [SKIP][46] ([i915#6621])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][47] ([i915#146])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][48] -> [INCOMPLETE][49] ([i915#4817])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-6:          NOTRUN -> [SKIP][50] ([i915#4215])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg1-6:          NOTRUN -> [SKIP][51] ([i915#4212]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-skl-6700k2:      [PASS][52] -> [SKIP][53] ([fdo#109271]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-icl-u2:          NOTRUN -> [SKIP][54] ([i915#4103])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - bat-dg1-6:          NOTRUN -> [SKIP][55] ([i915#4103] / [i915#4213])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - fi-bsw-kefka:       [PASS][56] -> [FAIL][57] ([i915#6298])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@basic-plain-flip:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][58] ([fdo#109271]) +39 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bdw-gvtdvm/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][59] ([fdo#109285])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg1-6:          NOTRUN -> [SKIP][60] ([fdo#109285])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg1-6:          NOTRUN -> [SKIP][61] ([i915#1072] / [i915#4078]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg1-6:          NOTRUN -> [SKIP][62] ([i915#3555])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-icl-u2:          NOTRUN -> [SKIP][63] ([i915#3555])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg1-6:          NOTRUN -> [SKIP][64] ([i915#3708] / [i915#4077]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - bat-dg1-6:          NOTRUN -> [SKIP][65] ([i915#3708]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][66] ([fdo#109295] / [i915#3301])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@prime_vgem@basic-userptr.html
    - bat-dg1-6:          NOTRUN -> [SKIP][67] ([i915#3708] / [i915#4873])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@contexts:
    - fi-bdw-gvtdvm:      [INCOMPLETE][68] ([i915#7506]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][70] ([i915#2867]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       [DMESG-WARN][72] ([i915#6434]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-2/igt@i915_module_load@reload.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][74] ([i915#5334]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-dg1-5:          [INCOMPLETE][76] -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg1-5/igt@i915_selftest@live@gt_lrc.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-5/igt@i915_selftest@live@gt_lrc.html
    - {bat-rpls-1}:       [INCOMPLETE][78] ([i915#4983]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@slpc:
    - {bat-adln-1}:       [DMESG-FAIL][80] ([i915#6997]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adln-1/igt@i915_selftest@live@slpc.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adln-1/igt@i915_selftest@live@slpc.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-kefka:       [FAIL][82] ([i915#6298]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        [SKIP][84] ([fdo#109271] / [fdo#111827]) -> [SKIP][85] ([fdo#109271]) +8 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-x1275:       [SKIP][86] ([fdo#109271] / [fdo#111827]) -> [SKIP][87] ([fdo#109271]) +8 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-kbl-x1275/igt@kms_chamelium@dp-crc-fast.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-kbl-x1275/igt@kms_chamelium@dp-crc-fast.html
    - fi-cfl-8109u:       [SKIP][88] ([fdo#109271] / [fdo#111827]) -> [SKIP][89] ([fdo#109271]) +8 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-bsw-kefka:       [SKIP][90] ([fdo#109271] / [fdo#111827]) -> [SKIP][91] ([fdo#109271]) +8 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-kbl-7567u:       [SKIP][92] ([fdo#109271] / [fdo#111827]) -> [SKIP][93] ([fdo#109271]) +8 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html
    - fi-cfl-8700k:       [SKIP][94] ([fdo#109271] / [fdo#111827]) -> [SKIP][95] ([fdo#109271]) +8 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-apl-guc:         [SKIP][96] ([fdo#109271] / [fdo#111827]) -> [SKIP][97] ([fdo#109271]) +8 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-snb-2520m:       [SKIP][98] ([fdo#109271] / [fdo#111827]) -> [SKIP][99] ([fdo#109271]) +8 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-glk-j4005:       [SKIP][100] ([fdo#109271] / [fdo#111827]) -> [SKIP][101] ([fdo#109271]) +8 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-skl-guc:         [SKIP][102] ([fdo#109271] / [fdo#111827]) -> [SKIP][103] ([fdo#109271]) +8 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-elk-e7500:       [SKIP][104] ([fdo#109271] / [fdo#111827]) -> [SKIP][105] ([fdo#109271]) +8 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-kbl-8809g:       [SKIP][106] ([fdo#109271] / [fdo#111827]) -> [SKIP][107] ([fdo#109271]) +7 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7506]: https://gitlab.freedesktop.org/drm/intel/issues/7506
  [i915#7535]: https://gitlab.freedesktop.org/drm/intel/issues/7535
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7072 -> IGTPW_8147

  CI-20190529: 20190529
  CI_DRM_12424: c8b2ce6e20662ef30130e65f473b1ff5362765e3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8147: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/index.html
  IGT_7072: 69ba7163475925cdc69aebbdfa0e87453ae165c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_chamelium_color@ctm-0-25
+igt@kms_chamelium_color@ctm-0-50
+igt@kms_chamelium_color@ctm-0-75
+igt@kms_chamelium_color@ctm-blue-to-red
+igt@kms_chamelium_color@ctm-green-to-red
+igt@kms_chamelium_color@ctm-limited-range
+igt@kms_chamelium_color@ctm-max
+igt@kms_chamelium_color@ctm-negative
+igt@kms_chamelium_color@ctm-red-to-blue
+igt@kms_chamelium_color@degamma
+igt@kms_chamelium_color@gamma
+igt@kms_chamelium_hpd@common-hpd-after-hibernate
+igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd
+igt@kms_chamelium_hpd@dp-hpd-after-hibernate
+igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@dp-hpd-fast
+igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
+igt@kms_chamelium_hpd@dp-hpd-storm
+igt@kms_chamelium_hpd@dp-hpd-storm-disable
+igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
+igt@kms_chamelium_hpd@hdmi-hpd
+igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@hdmi-hpd-fast
+igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
+igt@kms_chamelium_hpd@hdmi-hpd-storm
+igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
+igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium_hpd@vga-hpd
+igt@kms_chamelium_hpd@vga-hpd-after-hibernate
+igt@kms_chamelium_hpd@vga-hpd-after-suspend
+igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@vga-hpd-fast
+igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
+igt@kms_chamelium_hpd@vga-hpd-without-ddc
+igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
-igt@gem_ppgtt@shrink-vs-evict-any
-igt@gem_ppgtt@shrink-vs-evict-pinned
-igt@kms_chamelium@common-hpd-after-hibernate
-igt@kms_chamelium@common-hpd-after-suspend
-igt@kms_chamelium@dp-hpd
-igt@kms_chamelium@dp-hpd-after-hibernate
-igt@kms_chamelium@dp-hpd-after-suspend
-igt@kms_chamelium@dp-hpd-enable-disable-mode
-igt@kms_chamelium@dp-hpd-fast
-igt@kms_chamelium@dp-hpd-for-each-pipe
-igt@kms_chamelium@dp-hpd-storm
-igt@kms_chamelium@dp-hpd-storm-disable
-igt@kms_chamelium@dp-hpd-with-enabled-mode
-igt@kms_chamelium@hdmi-hpd
-igt@kms_chamelium@hdmi-hpd-after-hibernate
-igt@kms_chamelium@hdmi-hpd-after-suspend
-igt@kms_chamelium@hdmi-hpd-enable-disable-mode
-igt@kms_chamelium@hdmi-hpd-fast
-igt@kms_chamelium@hdmi-hpd-for-each-pipe
-igt@kms_chamelium@hdmi-hpd-storm
-igt@kms_chamelium@hdmi-hpd-storm-disable
-igt@kms_chamelium@hdmi-hpd-with-enabled-mode
-igt@kms_chamelium@vga-hpd
-igt@kms_chamelium@vga-hpd-after-hibernate
-igt@kms_chamelium@vga-hpd-after-suspend
-igt@kms_chamelium@vga-hpd-enable-disable-mode
-igt@kms_chamelium@vga-hpd-fast
-igt@kms_chamelium@vga-hpd-for-each-pipe
-igt@kms_chamelium@vga-hpd-without-ddc
-igt@kms_chamelium@vga-hpd-with-enabled-mode
-igt@kms_color_chamelium@ctm-0-25
-igt@kms_color_chamelium@ctm-0-50
-igt@kms_color_chamelium@ctm-0-75
-igt@kms_color_chamelium@ctm-blue-to-red
-igt@kms_color_chamelium@ctm-green-to-red
-igt@kms_color_chamelium@ctm-limited-range
-igt@kms_color_chamelium@ctm-max
-igt@kms_color_chamelium@ctm-negative
-igt@kms_color_chamelium@ctm-red-to-blue
-igt@kms_color_chamelium@degamma
-igt@kms_color_chamelium@gamma

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/index.html

--===============2131623002679026901==
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
<tr><td><b>Series:</b></td><td>Chamelium: Simplify the chamelium test files. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111163/">https://patchwork.freedesktop.org/series/111163/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12424 -&gt; IGTPW_8147</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8147 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8147, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/index.html</p>
<h2>Participating hosts (37 -&gt; 37)</h2>
<p>Additional (3): fi-icl-u2 bat-atsm-1 bat-dg1-6 <br />
  Missing    (3): fi-ctg-p8600 fi-hsw-4770 fi-ilk-m540 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8147:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-5/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +7 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-1/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>{bat-jsl-3}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-1/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-1/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg2-11/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg2-11/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adln-1/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adln-1/igt@kms_chamelium@vga-edid-read.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-2/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-2/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8147 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@gem_tiled_fence_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bdw-gvtdvm/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-6/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7506">i915#7506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6434">i915#6434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-dg1-5/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-dg1-5/igt@i915_selftest@live@gt_lrc.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-rpls-1/igt@i915_selftest@live@gt_lrc.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/bat-adln-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6997">i915#6997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/bat-adln-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-kbl-x1275/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-kbl-x1275/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12424/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7072 -&gt; IGTPW_8147</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12424: c8b2ce6e20662ef30130e65f473b1ff5362765e3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8147: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8147/index.html<br />
  IGT_7072: 69ba7163475925cdc69aebbdfa0e87453ae165c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_chamelium_color@ctm-0-25<br />
+igt@kms_chamelium_color@ctm-0-50<br />
+igt@kms_chamelium_color@ctm-0-75<br />
+igt@kms_chamelium_color@ctm-blue-to-red<br />
+igt@kms_chamelium_color@ctm-green-to-red<br />
+igt@kms_chamelium_color@ctm-limited-range<br />
+igt@kms_chamelium_color@ctm-max<br />
+igt@kms_chamelium_color@ctm-negative<br />
+igt@kms_chamelium_color@ctm-red-to-blue<br />
+igt@kms_chamelium_color@degamma<br />
+igt@kms_chamelium_color@gamma<br />
+igt@kms_chamelium_hpd@common-hpd-after-hibernate<br />
+igt@kms_chamelium_hpd@common-hpd-after-suspend<br />
+igt@kms_chamelium_hpd@dp-hpd<br />
+igt@kms_chamelium_hpd@dp-hpd-after-hibernate<br />
+igt@kms_chamelium_hpd@dp-hpd-after-suspend<br />
+igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode<br />
+igt@kms_chamelium_hpd@dp-hpd-fast<br />
+igt@kms_chamelium_hpd@dp-hpd-for-each-pipe<br />
+igt@kms_chamelium_hpd@dp-hpd-storm<br />
+igt@kms_chamelium_hpd@dp-hpd-storm-disable<br />
+igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode<br />
+igt@kms_chamelium_hpd@hdmi-hpd<br />
+igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate<br />
+igt@kms_chamelium_hpd@hdmi-hpd-after-suspend<br />
+igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode<br />
+igt@kms_chamelium_hpd@hdmi-hpd-fast<br />
+igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe<br />
+igt@kms_chamelium_hpd@hdmi-hpd-storm<br />
+igt@kms_chamelium_hpd@hdmi-hpd-storm-disable<br />
+igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode<br />
+igt@kms_chamelium_hpd@vga-hpd<br />
+igt@kms_chamelium_hpd@vga-hpd-after-hibernate<br />
+igt@kms_chamelium_hpd@vga-hpd-after-suspend<br />
+igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode<br />
+igt@kms_chamelium_hpd@vga-hpd-fast<br />
+igt@kms_chamelium_hpd@vga-hpd-for-each-pipe<br />
+igt@kms_chamelium_hpd@vga-hpd-without-ddc<br />
+igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode<br />
-igt@gem_ppgtt@shrink-vs-evict-any<br />
-igt@gem_ppgtt@shrink-vs-evict-pinned<br />
-igt@kms_chamelium@common-hpd-after-hibernate<br />
-igt@kms_chamelium@common-hpd-after-suspend<br />
-igt@kms_chamelium@dp-hpd<br />
-igt@kms_chamelium@dp-hpd-after-hibernate<br />
-igt@kms_chamelium@dp-hpd-after-suspend<br />
-igt@kms_chamelium@dp-hpd-enable-disable-mode<br />
-igt@kms_chamelium@dp-hpd-fast<br />
-igt@kms_chamelium@dp-hpd-for-each-pipe<br />
-igt@kms_chamelium@dp-hpd-storm<br />
-igt@kms_chamelium@dp-hpd-storm-disable<br />
-igt@kms_chamelium@dp-hpd-with-enabled-mode<br />
-igt@kms_chamelium@hdmi-hpd<br />
-igt@kms_chamelium@hdmi-hpd-after-hibernate<br />
-igt@kms_chamelium@hdmi-hpd-after-suspend<br />
-igt@kms_chamelium@hdmi-hpd-enable-disable-mode<br />
-igt@kms_chamelium@hdmi-hpd-fast<br />
-igt@kms_chamelium@hdmi-hpd-for-each-pipe<br />
-igt@kms_chamelium@hdmi-hpd-storm<br />
-igt@kms_chamelium@hdmi-hpd-storm-disable<br />
-igt@kms_chamelium@hdmi-hpd-with-enabled-mode<br />
-igt@kms_chamelium@vga-hpd<br />
-igt@kms_chamelium@vga-hpd-after-hibernate<br />
-igt@kms_chamelium@vga-hpd-after-suspend<br />
-igt@kms_chamelium@vga-hpd-enable-disable-mode<br />
-igt@kms_chamelium@vga-hpd-fast<br />
-igt@kms_chamelium@vga-hpd-for-each-pipe<br />
-igt@kms_chamelium@vga-hpd-without-ddc<br />
-igt@kms_chamelium@vga-hpd-with-enabled-mode<br />
-igt@kms_color_chamelium@ctm-0-25<br />
-igt@kms_color_chamelium@ctm-0-50<br />
-igt@kms_color_chamelium@ctm-0-75<br />
-igt@kms_color_chamelium@ctm-blue-to-red<br />
-igt@kms_color_chamelium@ctm-green-to-red<br />
-igt@kms_color_chamelium@ctm-limited-range<br />
-igt@kms_color_chamelium@ctm-max<br />
-igt@kms_color_chamelium@ctm-negative<br />
-igt@kms_color_chamelium@ctm-red-to-blue<br />
-igt@kms_color_chamelium@degamma<br />
-igt@kms_color_chamelium@gamma</p>

</body>
</html>

--===============2131623002679026901==--
