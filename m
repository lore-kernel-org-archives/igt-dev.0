Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 26 Mar 2020 16:20:18 -0000
Message-ID: <158523961887.23004.3547205310314135039@emeril.freedesktop.org>
References: <20200324130630.9388-1-anshuman.gupta@intel.com>
In-Reply-To: <20200324130630.9388-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbHBzcCBw?=
 =?utf-8?q?latform_agnostic_support_=28rev5=29?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lpsp platform agnostic support (rev5)
URL   : https://patchwork.freedesktop.org/series/74647/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8193 -> IGTPW_4358
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4358 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4358, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4358:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-hsw-4770r:       [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-hsw-4770r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-hsw-4770r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-glk-dsi:         [PASS][3] -> [FAIL][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-glk-dsi/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-hsw-peppy:       [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-hsw-peppy/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-u2:          [PASS][7] -> [FAIL][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-u2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-r:           [PASS][9] -> [FAIL][10] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-kbl-r/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-byt-n2820:       [PASS][11] -> [FAIL][12] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-byt-n2820/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-icl-guc:         [PASS][13] -> [FAIL][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-bdw-5557u/igt@i915_pm_rpm@basic-pci-d3-state.html
    - fi-kbl-soraka:      [PASS][16] -> [FAIL][17] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-kbl-soraka/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-7500u:       [PASS][18] -> [FAIL][19] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-kbl-7500u/igt@i915_pm_rpm@basic-rte.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][20] +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-skl-lmem/igt@i915_pm_rpm@basic-rte.html
    - fi-cml-u2:          [PASS][21] -> [FAIL][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-cml-u2/igt@i915_pm_rpm@basic-rte.html
    - fi-bxt-dsi:         [PASS][23] -> [FAIL][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-bxt-dsi/igt@i915_pm_rpm@basic-rte.html
    - fi-byt-j1900:       [PASS][25] -> [FAIL][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-byt-j1900/igt@i915_pm_rpm@basic-rte.html
    - fi-apl-guc:         [PASS][27] -> [FAIL][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-apl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-skl-6600u:       NOTRUN -> [FAIL][29] +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-skl-6600u/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][30] +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-x1275:       [PASS][31] -> [FAIL][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
    - fi-icl-dsi:         [PASS][33] -> [FAIL][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-dsi/igt@i915_pm_rpm@module-reload.html
    - fi-skl-guc:         [PASS][35] -> [FAIL][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-skl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][37] -> [FAIL][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - fi-skl-6700k2:      [PASS][39] -> [FAIL][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-skl-6700k2/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][41] -> [FAIL][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - fi-icl-y:           [PASS][43] -> [FAIL][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-y/igt@i915_pm_rpm@module-reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-y/igt@i915_pm_rpm@module-reload.html
    - fi-cml-s:           [PASS][45] -> [FAIL][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-cml-s/igt@i915_pm_rpm@module-reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-cml-s/igt@i915_pm_rpm@module-reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-snb-2600:        [SKIP][47] ([fdo#109271]) -> [FAIL][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-snb-2600/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - fi-ilk-650:         [SKIP][49] ([fdo#109271]) -> [FAIL][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-ilk-650/igt@i915_pm_rpm@module-reload.html
    - fi-elk-e7500:       [SKIP][51] ([fdo#109271]) -> [FAIL][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-elk-e7500/igt@i915_pm_rpm@module-reload.html
    - fi-icl-u2:          [DMESG-WARN][53] ([i915#289]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-u2/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@basic-rte:
    - {fi-ehl-1}:         [PASS][55] -> [FAIL][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-ehl-1/igt@i915_pm_rpm@basic-rte.html
    - {fi-tgl-u}:         [PASS][57] -> [FAIL][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-tgl-u/igt@i915_pm_rpm@basic-rte.html

  
Known issues
------------

  Here are the changes found in IGTPW_4358 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-8809g:       [PASS][59] -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-kbl-8809g/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [PASS][61] -> [INCOMPLETE][62] ([fdo#103927] / [i915#656])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-guc:         [PASS][63] -> [INCOMPLETE][64] ([fdo#108569])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-guc/igt@i915_selftest@live@hangcheck.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-guc/igt@i915_selftest@live@hangcheck.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-dsi:         [DMESG-FAIL][65] ([fdo#108569]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-dsi/igt@i915_selftest@live@execlists.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-dsi/igt@i915_selftest@live@execlists.html
    - fi-icl-y:           [DMESG-FAIL][67] ([fdo#108569]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-icl-y/igt@i915_selftest@live@execlists.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [FAIL][69] ([i915#262]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8193/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (43 -> 42)
------------------------------

  Additional (4): fi-bsw-kefka fi-skl-lmem fi-bdw-5557u fi-skl-6600u 
  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5539 -> IGTPW_4358

  CI-20190529: 20190529
  CI_DRM_8193: 8020e57cff9f8cd8741db8de4707d257f63f17bc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4358: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/index.html
  IGT_5539: e7aae12e37771a8b7796ba252574eb832a5839c3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4358/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
