Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 16:00:30 -0000
Message-ID: <157962243070.11481.5397069734122788611@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRGlzdGlu?=
 =?utf-8?q?guish_particular_engines_during_calculating_nop_calibration=2E_?=
 =?utf-8?b?KHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anna Karas <anna.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Distinguish particular engines during calculating nop calibration. (rev2)
URL   : https://patchwork.freedesktop.org/series/72113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7783 -> IGTPW_3961
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/index.html

Known issues
------------

  Here are the changes found in IGTPW_3961 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][1] -> [TIMEOUT][2] ([fdo#112271] / [i915#816])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       [PASS][3] -> [DMESG-WARN][4] ([i915#889]) +23 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [PASS][5] -> [DMESG-FAIL][6] ([i915#563])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_lrc:
    - fi-skl-6600u:       [PASS][7] -> [DMESG-FAIL][8] ([i915#889]) +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-skl-6600u/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][9] -> [FAIL][10] ([i915#262])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          [PASS][11] -> [FAIL][12] ([i915#217])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-cfl-8700k:       [DMESG-WARN][13] ([i915#889]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-cfl-8700k/igt@i915_module_load@reload-with-fault-injection.html
    - fi-skl-6700k2:      [INCOMPLETE][15] ([i915#671]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-x1275:       [DMESG-WARN][17] ([i915#889]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-kbl-x1275/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [INCOMPLETE][19] ([i915#151]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       [INCOMPLETE][21] ([i915#45] / [i915#999]) -> [TIMEOUT][22] ([fdo#112271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bxt-dsi:         [SKIP][23] ([fdo#109271]) -> [SKIP][24] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-hsw-4770:        [SKIP][25] ([fdo#109271]) -> [SKIP][26] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-kbl-soraka:      [SKIP][27] ([fdo#109271]) -> [SKIP][28] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-kbl-soraka/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-whl-u:           [SKIP][29] ([fdo#109271]) -> [SKIP][30] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-whl-u/igt@kms_chamelium@common-hpd-after-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-whl-u/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-pnv-d510:        [SKIP][31] ([fdo#109271]) -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-pnv-d510/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-icl-dsi:         [SKIP][33] ([fdo#109284]) -> [SKIP][34] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-icl-dsi/igt@kms_chamelium@dp-crc-fast.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-icl-dsi/igt@kms_chamelium@dp-crc-fast.html
    - fi-skl-guc:         [SKIP][35] ([fdo#109271]) -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-guc/igt@kms_chamelium@dp-crc-fast.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-skl-guc/igt@kms_chamelium@dp-crc-fast.html
    - fi-bwr-2160:        [SKIP][37] ([fdo#109271]) -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-bwr-2160/igt@kms_chamelium@dp-crc-fast.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-bwr-2160/igt@kms_chamelium@dp-crc-fast.html
    - fi-icl-y:           [SKIP][39] ([fdo#109284]) -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-icl-y/igt@kms_chamelium@dp-crc-fast.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-icl-y/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cfl-guc:         [SKIP][41] ([fdo#109271]) -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-cfl-guc/igt@kms_chamelium@dp-edid-read.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-cfl-guc/igt@kms_chamelium@dp-edid-read.html
    - fi-icl-guc:         [SKIP][43] ([fdo#109284]) -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-icl-guc/igt@kms_chamelium@dp-edid-read.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-icl-guc/igt@kms_chamelium@dp-edid-read.html
    - fi-elk-e7500:       [SKIP][45] ([fdo#109271]) -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-elk-e7500/igt@kms_chamelium@dp-edid-read.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-elk-e7500/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-ilk-650:         [SKIP][47] ([fdo#109271]) -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-ilk-650/igt@kms_chamelium@dp-hpd-fast.html
    - fi-ivb-3770:        [SKIP][49] ([fdo#109271]) -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-ivb-3770/igt@kms_chamelium@dp-hpd-fast.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-ivb-3770/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-skl-lmem:        [SKIP][51] ([fdo#109271]) -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-lmem/igt@kms_chamelium@hdmi-crc-fast.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-skl-lmem/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-kbl-x1275:       [SKIP][53] ([fdo#109271]) -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-x1275/igt@kms_chamelium@hdmi-crc-fast.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-kbl-x1275/igt@kms_chamelium@hdmi-crc-fast.html
    - fi-icl-u3:          [SKIP][55] ([fdo#109284]) -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-icl-u3/igt@kms_chamelium@hdmi-crc-fast.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-icl-u3/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-hsw-peppy:       [SKIP][57] ([fdo#109271]) -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-hsw-peppy/igt@kms_chamelium@hdmi-edid-read.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-hsw-peppy/igt@kms_chamelium@hdmi-edid-read.html
    - fi-blb-e6850:       [SKIP][59] ([fdo#109271]) -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-blb-e6850/igt@kms_chamelium@hdmi-edid-read.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-blb-e6850/igt@kms_chamelium@hdmi-edid-read.html
    - fi-kbl-8809g:       [SKIP][61] ([fdo#109271]) -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html
    - fi-kbl-r:           [SKIP][63] ([fdo#109271]) -> [SKIP][64] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-r/igt@kms_chamelium@hdmi-edid-read.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-kbl-r/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-apl-guc:         [SKIP][65] ([fdo#109271]) -> [SKIP][66] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-apl-guc/igt@kms_chamelium@hdmi-hpd-fast.html
    - fi-snb-2520m:       [SKIP][67] ([fdo#109271]) -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-snb-2520m/igt@kms_chamelium@hdmi-hpd-fast.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-snb-2520m/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-cfl-8700k:       [SKIP][69] ([fdo#109271]) -> [SKIP][70] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html
    - fi-hsw-4770r:       [SKIP][71] ([fdo#109271]) -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-hsw-4770r/igt@kms_chamelium@vga-edid-read.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-hsw-4770r/igt@kms_chamelium@vga-edid-read.html
    - fi-icl-u2:          [SKIP][73] ([fdo#109309]) -> [FAIL][74] ([i915#217])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-icl-u2/igt@kms_chamelium@vga-edid-read.html
    - fi-skl-6600u:       [SKIP][75] ([fdo#109271]) -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-skl-6600u/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-fast:
    - fi-kbl-guc:         [SKIP][77] ([fdo#109271]) -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7783/fi-kbl-guc/igt@kms_chamelium@vga-hpd-fast.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/fi-kbl-guc/igt@kms_chamelium@vga-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#647]: https://gitlab.freedesktop.org/drm/intel/issues/647
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889
  [i915#937]: https://gitlab.freedesktop.org/drm/intel/issues/937
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (44 -> 41)
------------------------------

  Additional (4): fi-bsw-kefka fi-kbl-7560u fi-glk-dsi fi-gdg-551 
  Missing    (7): fi-ilk-m540 fi-bdw-5557u fi-byt-squawks fi-bsw-cyan fi-kbl-7500u fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5376 -> IGTPW_3961

  CI-20190529: 20190529
  CI_DRM_7783: 3ee976286895f0bd54388efc16b12f62c624ff19 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3961: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/index.html
  IGT_5376: 5cf58d947a02379d2885d6dd4f8bb487cfc3eed2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3961/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
