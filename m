Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 12:15:11 -0000
Message-ID: <158047291190.13124.14273566883601534412@emeril.freedesktop.org>
References: <20200131110201.2533544-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200131110201.2533544-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBG?=
 =?utf-8?q?ind_the_associated_runtime-pm_sysfs_for_the_device?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: Find the associated runtime-pm sysfs for the device
URL   : https://patchwork.freedesktop.org/series/72814/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5408 -> IGTPW_4057
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4057 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4057, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4057:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-apl-guc:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-apl-guc/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-apl-guc/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-icl-u2:          [PASS][3] -> [SKIP][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-guc:         [PASS][5] -> [SKIP][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-u3:          [PASS][7] -> [SKIP][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-u3/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-u3/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-cml-u2:          [PASS][9] -> [SKIP][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-dsi:         [PASS][11] -> [SKIP][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-icl-y:           [PASS][13] -> [SKIP][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-y/igt@i915_pm_rpm@module-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-y/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live_workarounds:
    - fi-apl-guc:         NOTRUN -> [DMESG-FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-apl-guc/igt@i915_selftest@live_workarounds.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-icl-u2:          [DMESG-WARN][16] ([i915#289]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-ehl-1}:         [PASS][18] -> [SKIP][19] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-u}:         [PASS][20] -> [SKIP][21] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_4057 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][22] -> [TIMEOUT][23] ([fdo#112271] / [i915#816])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - fi-tgl-y:           [PASS][24] -> [FAIL][25] ([CI#94])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-tgl-y/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-hsw-4770r:       [PASS][26] -> [SKIP][27] ([fdo#109271]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-hsw-4770r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-hsw-4770r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-glk-dsi:         [PASS][28] -> [SKIP][29] ([fdo#109271]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-r:           [PASS][30] -> [SKIP][31] ([fdo#109271]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bdw-5557u:       [PASS][32] -> [SKIP][33] ([fdo#109271]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-whl-u:           [PASS][34] -> [SKIP][35] ([fdo#109271]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-whl-u/igt@i915_pm_rpm@basic-pci-d3-state.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-whl-u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-skl-6770hq:      [PASS][36] -> [SKIP][37] ([fdo#109271]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-skl-6770hq/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-7500u:       [PASS][38] -> [SKIP][39] ([fdo#109271]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
    - fi-skl-lmem:        [PASS][40] -> [SKIP][41] ([fdo#109271]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
    - fi-bxt-dsi:         [PASS][42] -> [SKIP][43] ([fdo#109271]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
    - fi-hsw-4770:        [PASS][44] -> [SKIP][45] ([fdo#109271]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-hsw-4770/igt@i915_pm_rpm@basic-rte.html
    - fi-apl-guc:         [PASS][46] -> [SKIP][47] ([fdo#109271]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][48] -> [SKIP][49] ([fdo#109271]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6600u:       [PASS][50] -> [SKIP][51] ([fdo#109271]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-y:           [PASS][52] -> [SKIP][53] ([CI#94]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-tgl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8700k:       [PASS][54] -> [SKIP][55] ([fdo#109271]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-x1275:       [PASS][56] -> [SKIP][57] ([fdo#109271]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
    - fi-skl-guc:         [PASS][58] -> [SKIP][59] ([fdo#109271]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [PASS][60] -> [SKIP][61] ([fdo#109271]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][62] -> [SKIP][63] ([fdo#109271]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-guc:         [PASS][64] -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - fi-tgl-y:           [PASS][66] -> [DMESG-WARN][67] ([CI#94] / [i915#402]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-y/igt@kms_addfb_basic@invalid-set-prop.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-tgl-y/igt@kms_addfb_basic@invalid-set-prop.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic-all:
    - fi-apl-guc:         [TIMEOUT][68] ([fdo#112271]) -> [PASS][69] +8 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-apl-guc/igt@gem_exec_store@basic-all.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-apl-guc/igt@gem_exec_store@basic-all.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-apl-guc:         [SKIP][70] ([fdo#109271]) -> [PASS][71] +47 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-apl-guc/igt@gem_tiled_fence_blits@basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-apl-guc/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][72] ([i915#553] / [i915#725]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-hsw-4770r/igt@i915_selftest@live_blt.html
    - fi-ivb-3770:        [DMESG-FAIL][74] ([i915#563]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-ivb-3770/igt@i915_selftest@live_blt.html

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - fi-tgl-y:           [DMESG-WARN][76] ([CI#94] / [i915#402]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-tgl-y/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cml-u2:          [FAIL][78] ([i915#976]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-cml-u2/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [FAIL][80] ([fdo#109635] / [i915#217]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][82] ([i915#553] / [i915#725]) -> [DMESG-FAIL][83] ([i915#725])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [FAIL][84] ([fdo#103375]) -> [FAIL][85] ([i915#217])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5408/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#976]: https://gitlab.freedesktop.org/drm/intel/issues/976


Participating hosts (47 -> 47)
------------------------------

  Additional (5): fi-kbl-soraka fi-bsw-n3050 fi-hsw-peppy fi-elk-e7500 fi-bsw-kefka 
  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5408 -> IGTPW_4057

  CI-20190529: 20190529
  CI_DRM_7850: ae66f2257648ce52c51298506977baa32873c9d5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4057: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/index.html
  IGT_5408: 8980bcd421744fb63d38270e1fcc9c7432d70d00 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4057/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
