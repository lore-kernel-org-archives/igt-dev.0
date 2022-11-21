Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6063320077905694859=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Mon, 21 Nov 2022 20:20:06 -0000
Message-ID: <166906200659.22097.906916548778393564@emeril.freedesktop.org>
References: <20221121191747.2817707-1-markyacoub@chromium.org>
In-Reply-To: <20221121191747.2817707-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium=3A_Simplify_the_chamelium_test_files=2E?=
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

--===============6063320077905694859==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Chamelium: Simplify the chamelium test files.
URL   : https://patchwork.freedesktop.org/series/111163/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12409 -> IGTPW_8140
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_8140 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8140, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html

Participating hosts (35 -> 35)
------------------------------

  Additional (2): bat-rpls-2 bat-dg2-11 
  Missing    (2): fi-ilk-m540 bat-dg1-6 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8140:

### IGT changes ###

#### Warnings ####

  * igt@kms_chamelium@dp-crc-fast:
    - bat-adlp-4:         [SKIP][1] ([fdo#111827]) -> [SKIP][2] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-rkl-guc:         [SKIP][3] ([fdo#111827]) -> [SKIP][4] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-rkl-11600:       [SKIP][5] ([fdo#111827]) -> [SKIP][6] +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html
    - fi-icl-u2:          [SKIP][7] ([fdo#111827]) -> [SKIP][8] +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
    - bat-dg1-5:          [SKIP][9] ([fdo#111827]) -> [SKIP][10] +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_chamelium@common-hpd-after-suspend:
    - {bat-dg2-9}:        NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-9/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - {bat-jsl-3}:        [SKIP][12] ([fdo#111827]) -> [SKIP][13] +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html
    - {bat-dg2-9}:        [SKIP][14] ([fdo#111827]) -> [SKIP][15] +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - {fi-ehl-2}:         [SKIP][16] ([fdo#111827]) -> [SKIP][17] +7 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - {bat-dg1-7}:        [SKIP][18] ([fdo#111827]) -> [SKIP][19] +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - {bat-dg2-8}:        [SKIP][20] ([fdo#111827]) -> [SKIP][21] +8 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html
    - {bat-adlm-1}:       [SKIP][22] ([fdo#111827]) -> [SKIP][23] +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html
    - {bat-jsl-1}:        [SKIP][24] ([fdo#111827]) -> [SKIP][25] +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - {bat-adlp-6}:       [SKIP][26] ([fdo#111827]) -> [SKIP][27] +7 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html
    - {bat-rplp-1}:       [SKIP][28] ([fdo#111827]) -> [SKIP][29] +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][30] +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-11/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - {bat-adln-1}:       [SKIP][31] ([fdo#111827]) -> [SKIP][32] +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adln-1/igt@kms_chamelium@vga-edid-read.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adln-1/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-fast:
    - {bat-rpls-2}:       NOTRUN -> [SKIP][33] +7 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-rpls-2/igt@kms_chamelium@vga-hpd-fast.html

  
Known issues
------------

  Here are the changes found in IGTPW_8140 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][34] -> [INCOMPLETE][35] ([i915#4785])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@mman:
    - fi-rkl-guc:         [PASS][36] -> [TIMEOUT][37] ([i915#6794])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-rkl-guc/igt@i915_selftest@live@mman.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-rkl-guc/igt@i915_selftest@live@mman.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-skl-6700k2:      [PASS][38] -> [SKIP][39] ([fdo#109271]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][40] ([fdo#109271] / [i915#4312] / [i915#5594])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-hsw-4770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][41] ([i915#2867]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-dg2-9}:        [INCOMPLETE][43] ([i915#7349]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg2-9/igt@i915_selftest@live@hangcheck.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-9/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        [SKIP][45] ([fdo#109271] / [fdo#111827]) -> [SKIP][46] ([fdo#109271]) +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-hsw-4770:        [SKIP][47] ([fdo#109271] / [fdo#111827]) -> [SKIP][48] ([fdo#109271]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html
    - fi-cfl-8109u:       [SKIP][49] ([fdo#109271] / [fdo#111827]) -> [SKIP][50] ([fdo#109271]) +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-bsw-kefka:       [SKIP][51] ([fdo#109271] / [fdo#111827]) -> [SKIP][52] ([fdo#109271]) +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-kbl-7567u:       [SKIP][53] ([fdo#109271] / [fdo#111827]) -> [SKIP][54] ([fdo#109271]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html
    - fi-cfl-8700k:       [SKIP][55] ([fdo#109271] / [fdo#111827]) -> [SKIP][56] ([fdo#109271]) +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-apl-guc:         [SKIP][57] ([fdo#109271] / [fdo#111827]) -> [SKIP][58] ([fdo#109271]) +8 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-snb-2520m:       [SKIP][59] ([fdo#109271] / [fdo#111827]) -> [SKIP][60] ([fdo#109271]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-glk-j4005:       [SKIP][61] ([fdo#109271] / [fdo#111827]) -> [SKIP][62] ([fdo#109271]) +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-skl-guc:         [SKIP][63] ([fdo#109271] / [fdo#111827]) -> [SKIP][64] ([fdo#109271]) +8 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-elk-e7500:       [SKIP][65] ([fdo#109271] / [fdo#111827]) -> [SKIP][66] ([fdo#109271]) +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-bsw-nick:        [SKIP][67] ([fdo#109271] / [fdo#111827]) -> [SKIP][68] ([fdo#109271]) +8 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-bsw-nick/igt@kms_chamelium@hdmi-hpd-fast.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-bsw-nick/igt@kms_chamelium@hdmi-hpd-fast.html
    - fi-bdw-gvtdvm:      [SKIP][69] ([fdo#109271] / [fdo#111827]) -> [SKIP][70] ([fdo#109271]) +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-bdw-gvtdvm/igt@kms_chamelium@hdmi-hpd-fast.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-bdw-gvtdvm/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-kbl-8809g:       [SKIP][71] ([fdo#109271] / [fdo#111827]) -> [SKIP][72] ([fdo#109271]) +7 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7349]: https://gitlab.freedesktop.org/drm/intel/issues/7349
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7069 -> IGTPW_8140

  CI-20190529: 20190529
  CI_DRM_12409: ab70218208c05b2a68a1143438a56c3d494eb529 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html
  IGT_7069: 40a2de5cc6a6b43af7da7905bfe1ede9d9a3200c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@chamelium_color@ctm-0-25
+igt@chamelium_color@ctm-0-50
+igt@chamelium_color@ctm-0-75
+igt@chamelium_color@ctm-blue-to-red
+igt@chamelium_color@ctm-green-to-red
+igt@chamelium_color@ctm-limited-range
+igt@chamelium_color@ctm-max
+igt@chamelium_color@ctm-negative
+igt@chamelium_color@ctm-red-to-blue
+igt@chamelium_color@degamma
+igt@chamelium_color@gamma
+igt@chamelium_hpd@common-hpd-after-hibernate
+igt@chamelium_hpd@common-hpd-after-suspend
+igt@chamelium_hpd@dp-hpd
+igt@chamelium_hpd@dp-hpd-after-hibernate
+igt@chamelium_hpd@dp-hpd-after-suspend
+igt@chamelium_hpd@dp-hpd-enable-disable-mode
+igt@chamelium_hpd@dp-hpd-fast
+igt@chamelium_hpd@dp-hpd-for-each-pipe
+igt@chamelium_hpd@dp-hpd-storm
+igt@chamelium_hpd@dp-hpd-storm-disable
+igt@chamelium_hpd@dp-hpd-with-enabled-mode
+igt@chamelium_hpd@hdmi-hpd
+igt@chamelium_hpd@hdmi-hpd-after-hibernate
+igt@chamelium_hpd@hdmi-hpd-after-suspend
+igt@chamelium_hpd@hdmi-hpd-enable-disable-mode
+igt@chamelium_hpd@hdmi-hpd-fast
+igt@chamelium_hpd@hdmi-hpd-for-each-pipe
+igt@chamelium_hpd@hdmi-hpd-storm
+igt@chamelium_hpd@hdmi-hpd-storm-disable
+igt@chamelium_hpd@hdmi-hpd-with-enabled-mode
+igt@chamelium_hpd@vga-hpd
+igt@chamelium_hpd@vga-hpd-after-hibernate
+igt@chamelium_hpd@vga-hpd-after-suspend
+igt@chamelium_hpd@vga-hpd-enable-disable-mode
+igt@chamelium_hpd@vga-hpd-fast
+igt@chamelium_hpd@vga-hpd-for-each-pipe
+igt@chamelium_hpd@vga-hpd-without-ddc
+igt@chamelium_hpd@vga-hpd-with-enabled-mode
-igt@gem_lmem_evict@dontneed-evict-race
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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html

--===============6063320077905694859==
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
<tr><td><b>Series:</b></td><td>Chamelium: Simplify the chamelium test files.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111163/">https://patchwork.freedesktop.org/series/111163/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12409 -&gt; IGTPW_8140</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_8140 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8140, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html</p>
<h2>Participating hosts (35 -&gt; 35)</h2>
<p>Additional (2): bat-rpls-2 bat-dg2-11 <br />
  Missing    (2): fi-ilk-m540 bat-dg1-6 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8140:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-rkl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-rkl-11600/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg1-5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</p>
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
<li>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-9/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>{bat-jsl-3}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-jsl-3/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> +4 similar issues</p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-9/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-ehl-2/igt@kms_chamelium@dp-edid-read.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg1-7/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-8/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adlm-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-jsl-1/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adlp-6/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +7 similar issues</p>
</li>
<li>
<p>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-rplp-1/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-11/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-adln-1/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-adln-1/igt@kms_chamelium@vga-edid-read.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-rpls-2/igt@kms_chamelium@vga-hpd-fast.html">SKIP</a> +7 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8140 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-rkl-guc/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-rkl-guc/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-skl-6700k2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/bat-dg2-9/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7349">i915#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/bat-dg2-9/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-cfl-8109u/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-bsw-kefka/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-kbl-7567u/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-cfl-8700k/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-apl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-snb-2520m/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-glk-j4005/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-skl-guc/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-elk-e7500/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-bsw-nick/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-bsw-nick/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-bdw-gvtdvm/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-bdw-gvtdvm/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12409/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/fi-kbl-8809g/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +7 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7069 -&gt; IGTPW_8140</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12409: ab70218208c05b2a68a1143438a56c3d494eb529 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8140: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8140/index.html<br />
  IGT_7069: 40a2de5cc6a6b43af7da7905bfe1ede9d9a3200c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@chamelium_color@ctm-0-25<br />
+igt@chamelium_color@ctm-0-50<br />
+igt@chamelium_color@ctm-0-75<br />
+igt@chamelium_color@ctm-blue-to-red<br />
+igt@chamelium_color@ctm-green-to-red<br />
+igt@chamelium_color@ctm-limited-range<br />
+igt@chamelium_color@ctm-max<br />
+igt@chamelium_color@ctm-negative<br />
+igt@chamelium_color@ctm-red-to-blue<br />
+igt@chamelium_color@degamma<br />
+igt@chamelium_color@gamma<br />
+igt@chamelium_hpd@common-hpd-after-hibernate<br />
+igt@chamelium_hpd@common-hpd-after-suspend<br />
+igt@chamelium_hpd@dp-hpd<br />
+igt@chamelium_hpd@dp-hpd-after-hibernate<br />
+igt@chamelium_hpd@dp-hpd-after-suspend<br />
+igt@chamelium_hpd@dp-hpd-enable-disable-mode<br />
+igt@chamelium_hpd@dp-hpd-fast<br />
+igt@chamelium_hpd@dp-hpd-for-each-pipe<br />
+igt@chamelium_hpd@dp-hpd-storm<br />
+igt@chamelium_hpd@dp-hpd-storm-disable<br />
+igt@chamelium_hpd@dp-hpd-with-enabled-mode<br />
+igt@chamelium_hpd@hdmi-hpd<br />
+igt@chamelium_hpd@hdmi-hpd-after-hibernate<br />
+igt@chamelium_hpd@hdmi-hpd-after-suspend<br />
+igt@chamelium_hpd@hdmi-hpd-enable-disable-mode<br />
+igt@chamelium_hpd@hdmi-hpd-fast<br />
+igt@chamelium_hpd@hdmi-hpd-for-each-pipe<br />
+igt@chamelium_hpd@hdmi-hpd-storm<br />
+igt@chamelium_hpd@hdmi-hpd-storm-disable<br />
+igt@chamelium_hpd@hdmi-hpd-with-enabled-mode<br />
+igt@chamelium_hpd@vga-hpd<br />
+igt@chamelium_hpd@vga-hpd-after-hibernate<br />
+igt@chamelium_hpd@vga-hpd-after-suspend<br />
+igt@chamelium_hpd@vga-hpd-enable-disable-mode<br />
+igt@chamelium_hpd@vga-hpd-fast<br />
+igt@chamelium_hpd@vga-hpd-for-each-pipe<br />
+igt@chamelium_hpd@vga-hpd-without-ddc<br />
+igt@chamelium_hpd@vga-hpd-with-enabled-mode<br />
-igt@gem_lmem_evict@dontneed-evict-race<br />
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

--===============6063320077905694859==--
