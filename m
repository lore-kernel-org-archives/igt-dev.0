Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 03 Feb 2020 13:41:01 -0000
Message-ID: <158073726189.3014.15096437289556928249@emeril.freedesktop.org>
References: <20200203123103.12397-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200203123103.12397-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffence=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fe?=
 =?utf-8?q?ngine_to_utilize_all_available_engines=2E?=
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
To: saigowth <sai.gowtham.ch@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_fence:Added __for_each_physical_engine to utilize all available engines.
URL   : https://patchwork.freedesktop.org/series/72916/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7859 -> IGTPW_4078
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4078 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4078, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4078:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_fence@basic-busy-default:
    - fi-icl-y:           [PASS][1] -> [SKIP][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-icl-y/igt@gem_exec_fence@basic-busy-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-icl-y/igt@gem_exec_fence@basic-busy-default.html
    - fi-icl-guc:         [PASS][3] -> [SKIP][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-icl-guc/igt@gem_exec_fence@basic-busy-default.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-icl-guc/igt@gem_exec_fence@basic-busy-default.html

  * igt@gem_exec_fence@basic-wait-default:
    - fi-icl-dsi:         [PASS][5] -> [SKIP][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-icl-dsi/igt@gem_exec_fence@basic-wait-default.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-icl-dsi/igt@gem_exec_fence@basic-wait-default.html

  * igt@gem_exec_fence@nb-await-default:
    - fi-cml-s:           [PASS][7] -> [SKIP][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-cml-s/igt@gem_exec_fence@nb-await-default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-cml-s/igt@gem_exec_fence@nb-await-default.html
    - fi-icl-u3:          [PASS][9] -> [SKIP][10] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-icl-u3/igt@gem_exec_fence@nb-await-default.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-icl-u3/igt@gem_exec_fence@nb-await-default.html
    - fi-cml-u2:          [PASS][11] -> [SKIP][12] +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-cml-u2/igt@gem_exec_fence@nb-await-default.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-cml-u2/igt@gem_exec_fence@nb-await-default.html
    - fi-icl-u2:          [PASS][13] -> [SKIP][14] +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-icl-u2/igt@gem_exec_fence@nb-await-default.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-icl-u2/igt@gem_exec_fence@nb-await-default.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_fence@basic-wait-default:
    - {fi-tgl-u}:         [PASS][15] -> [SKIP][16] +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-tgl-u/igt@gem_exec_fence@basic-wait-default.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-tgl-u/igt@gem_exec_fence@basic-wait-default.html
    - {fi-ehl-1}:         [PASS][17] -> [SKIP][18] +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-ehl-1/igt@gem_exec_fence@basic-wait-default.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-ehl-1/igt@gem_exec_fence@basic-wait-default.html

  
Known issues
------------

  Here are the changes found in IGTPW_4078 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@basic-await-default:
    - fi-skl-6700k2:      [PASS][19] -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-skl-6700k2/igt@gem_exec_fence@basic-await-default.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-skl-6700k2/igt@gem_exec_fence@basic-await-default.html
    - fi-hsw-4770r:       [PASS][21] -> [SKIP][22] ([fdo#109271]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-hsw-4770r/igt@gem_exec_fence@basic-await-default.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-hsw-4770r/igt@gem_exec_fence@basic-await-default.html
    - fi-byt-n2820:       [PASS][23] -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-byt-n2820/igt@gem_exec_fence@basic-await-default.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-byt-n2820/igt@gem_exec_fence@basic-await-default.html
    - fi-skl-lmem:        [PASS][25] -> [SKIP][26] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-skl-lmem/igt@gem_exec_fence@basic-await-default.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-skl-lmem/igt@gem_exec_fence@basic-await-default.html
    - fi-ivb-3770:        [PASS][27] -> [SKIP][28] ([fdo#109271]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-ivb-3770/igt@gem_exec_fence@basic-await-default.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-ivb-3770/igt@gem_exec_fence@basic-await-default.html
    - fi-bsw-n3050:       [PASS][29] -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-bsw-n3050/igt@gem_exec_fence@basic-await-default.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-bsw-n3050/igt@gem_exec_fence@basic-await-default.html
    - fi-hsw-4770:        [PASS][31] -> [SKIP][32] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-hsw-4770/igt@gem_exec_fence@basic-await-default.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-hsw-4770/igt@gem_exec_fence@basic-await-default.html
    - fi-bxt-dsi:         [PASS][33] -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-bxt-dsi/igt@gem_exec_fence@basic-await-default.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-bxt-dsi/igt@gem_exec_fence@basic-await-default.html
    - fi-kbl-guc:         [PASS][35] -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-kbl-guc/igt@gem_exec_fence@basic-await-default.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-kbl-guc/igt@gem_exec_fence@basic-await-default.html

  * igt@gem_exec_fence@basic-busy-default:
    - fi-blb-e6850:       [PASS][37] -> [SKIP][38] ([fdo#109271]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-blb-e6850/igt@gem_exec_fence@basic-busy-default.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-blb-e6850/igt@gem_exec_fence@basic-busy-default.html
    - fi-cfl-guc:         [PASS][39] -> [SKIP][40] ([fdo#109271]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-cfl-guc/igt@gem_exec_fence@basic-busy-default.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-cfl-guc/igt@gem_exec_fence@basic-busy-default.html
    - fi-skl-guc:         [PASS][41] -> [SKIP][42] ([fdo#109271]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-skl-guc/igt@gem_exec_fence@basic-busy-default.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-skl-guc/igt@gem_exec_fence@basic-busy-default.html
    - fi-apl-guc:         [PASS][43] -> [SKIP][44] ([fdo#109271]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-apl-guc/igt@gem_exec_fence@basic-busy-default.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-apl-guc/igt@gem_exec_fence@basic-busy-default.html
    - fi-glk-dsi:         [PASS][45] -> [SKIP][46] ([fdo#109271]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-glk-dsi/igt@gem_exec_fence@basic-busy-default.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-glk-dsi/igt@gem_exec_fence@basic-busy-default.html
    - fi-hsw-peppy:       [PASS][47] -> [SKIP][48] ([fdo#109271]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-hsw-peppy/igt@gem_exec_fence@basic-busy-default.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-hsw-peppy/igt@gem_exec_fence@basic-busy-default.html
    - fi-kbl-x1275:       [PASS][49] -> [SKIP][50] ([fdo#109271]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-kbl-x1275/igt@gem_exec_fence@basic-busy-default.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-kbl-x1275/igt@gem_exec_fence@basic-busy-default.html
    - fi-cfl-8700k:       [PASS][51] -> [SKIP][52] ([fdo#109271]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-cfl-8700k/igt@gem_exec_fence@basic-busy-default.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-cfl-8700k/igt@gem_exec_fence@basic-busy-default.html
    - fi-tgl-y:           [PASS][53] -> [SKIP][54] ([CI#94]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-tgl-y/igt@gem_exec_fence@basic-busy-default.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-tgl-y/igt@gem_exec_fence@basic-busy-default.html
    - fi-bdw-5557u:       [PASS][55] -> [SKIP][56] ([fdo#109271]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-bdw-5557u/igt@gem_exec_fence@basic-busy-default.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-bdw-5557u/igt@gem_exec_fence@basic-busy-default.html
    - fi-kbl-7500u:       [PASS][57] -> [SKIP][58] ([fdo#109271]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-kbl-7500u/igt@gem_exec_fence@basic-busy-default.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-kbl-7500u/igt@gem_exec_fence@basic-busy-default.html
    - fi-kbl-8809g:       [PASS][59] -> [SKIP][60] ([fdo#109271]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-kbl-8809g/igt@gem_exec_fence@basic-busy-default.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-kbl-8809g/igt@gem_exec_fence@basic-busy-default.html
    - fi-cfl-8109u:       [PASS][61] -> [SKIP][62] ([fdo#109271]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-cfl-8109u/igt@gem_exec_fence@basic-busy-default.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-cfl-8109u/igt@gem_exec_fence@basic-busy-default.html

  * igt@gem_exec_fence@basic-wait-default:
    - fi-skl-6770hq:      [PASS][63] -> [SKIP][64] ([fdo#109271]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-skl-6770hq/igt@gem_exec_fence@basic-wait-default.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-skl-6770hq/igt@gem_exec_fence@basic-wait-default.html
    - fi-skl-6600u:       [PASS][65] -> [SKIP][66] ([fdo#109271]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-skl-6600u/igt@gem_exec_fence@basic-wait-default.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-skl-6600u/igt@gem_exec_fence@basic-wait-default.html
    - fi-pnv-d510:        [PASS][67] -> [SKIP][68] ([fdo#109271]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-pnv-d510/igt@gem_exec_fence@basic-wait-default.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-pnv-d510/igt@gem_exec_fence@basic-wait-default.html
    - fi-whl-u:           [PASS][69] -> [SKIP][70] ([fdo#109271]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-whl-u/igt@gem_exec_fence@basic-wait-default.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-whl-u/igt@gem_exec_fence@basic-wait-default.html
    - fi-kbl-soraka:      [PASS][71] -> [SKIP][72] ([fdo#109271]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-kbl-soraka/igt@gem_exec_fence@basic-wait-default.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-kbl-soraka/igt@gem_exec_fence@basic-wait-default.html
    - fi-elk-e7500:       [PASS][73] -> [SKIP][74] ([fdo#109271]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-elk-e7500/igt@gem_exec_fence@basic-wait-default.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-elk-e7500/igt@gem_exec_fence@basic-wait-default.html
    - fi-bsw-nick:        [PASS][75] -> [SKIP][76] ([fdo#109271]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-bsw-nick/igt@gem_exec_fence@basic-wait-default.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-bsw-nick/igt@gem_exec_fence@basic-wait-default.html
    - fi-kbl-r:           [PASS][77] -> [SKIP][78] ([fdo#109271]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-kbl-r/igt@gem_exec_fence@basic-wait-default.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-kbl-r/igt@gem_exec_fence@basic-wait-default.html

  * igt@gem_exec_fence@nb-await-default:
    - fi-bsw-kefka:       [PASS][79] -> [SKIP][80] ([fdo#109271]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-bsw-kefka/igt@gem_exec_fence@nb-await-default.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-bsw-kefka/igt@gem_exec_fence@nb-await-default.html
    - fi-snb-2600:        [PASS][81] -> [SKIP][82] ([fdo#109271]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-snb-2600/igt@gem_exec_fence@nb-await-default.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-snb-2600/igt@gem_exec_fence@nb-await-default.html
    - fi-ilk-650:         [PASS][83] -> [SKIP][84] ([fdo#109271]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-ilk-650/igt@gem_exec_fence@nb-await-default.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-ilk-650/igt@gem_exec_fence@nb-await-default.html
    - fi-snb-2520m:       [PASS][85] -> [SKIP][86] ([fdo#109271]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-snb-2520m/igt@gem_exec_fence@nb-await-default.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-snb-2520m/igt@gem_exec_fence@nb-await-default.html

  * igt@gem_exec_parallel@fds:
    - fi-hsw-peppy:       [PASS][87] -> [INCOMPLETE][88] ([i915#694])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-hsw-peppy/igt@gem_exec_parallel@fds.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-hsw-peppy/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_active:
    - fi-skl-lmem:        [PASS][89] -> [DMESG-FAIL][90] ([i915#666])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-skl-lmem/igt@i915_selftest@live_active.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-skl-lmem/igt@i915_selftest@live_active.html

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [PASS][91] -> [TIMEOUT][92] ([fdo#111732] / [fdo#112271])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@prime_vgem@basic-gtt:
    - fi-tgl-y:           [PASS][93] -> [DMESG-WARN][94] ([CI#94] / [i915#402])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-tgl-y/igt@prime_vgem@basic-gtt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-tgl-y/igt@prime_vgem@basic-gtt.html

  
#### Possible fixes ####

  * igt@gem_mmap@basic:
    - fi-tgl-y:           [DMESG-WARN][95] ([CI#94] / [i915#402]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-tgl-y/igt@gem_mmap@basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-tgl-y/igt@gem_mmap@basic.html

  * igt@i915_module_load@reload-no-display:
    - fi-icl-u2:          [INCOMPLETE][97] -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-icl-u2/igt@i915_module_load@reload-no-display.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-icl-u2/igt@i915_module_load@reload-no-display.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-byt-n2820:       [DMESG-FAIL][99] ([i915#1052]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-byt-n2820/igt@i915_selftest@live_gem_contexts.html
    - fi-cfl-guc:         [DMESG-FAIL][101] ([i915#623]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-cfl-guc/igt@i915_selftest@live_gem_contexts.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-icl-u2:          [FAIL][103] ([i915#217]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-icl-u2/igt@kms_chamelium@hdmi-edid-read.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-icl-u2/igt@kms_chamelium@hdmi-edid-read.html

  
#### Warnings ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [TIMEOUT][105] ([fdo#112271] / [i915#1084] / [i915#816]) -> [INCOMPLETE][106] ([i915#45])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_parallel@fds:
    - fi-byt-n2820:       [TIMEOUT][107] ([fdo#112271] / [i915#1084]) -> [FAIL][108] ([i915#694])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-byt-n2820/igt@gem_exec_parallel@fds.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-byt-n2820/igt@gem_exec_parallel@fds.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770:        [DMESG-FAIL][109] ([i915#563]) -> [DMESG-FAIL][110] ([i915#770])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-hsw-4770/igt@i915_selftest@live_blt.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-hsw-4770/igt@i915_selftest@live_blt.html

  * igt@runner@aborted:
    - fi-byt-j1900:       [FAIL][111] ([i915#999]) -> [FAIL][112] ([i915#816])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7859/fi-byt-j1900/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/fi-byt-j1900/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#94]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/94
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1052]: https://gitlab.freedesktop.org/drm/intel/issues/1052
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#217]: https://gitlab.freedesktop.org/drm/intel/issues/217
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#623]: https://gitlab.freedesktop.org/drm/intel/issues/623
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
  [i915#999]: https://gitlab.freedesktop.org/drm/intel/issues/999


Participating hosts (54 -> 47)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5413 -> IGTPW_4078

  CI-20190529: 20190529
  CI_DRM_7859: b7b84e9f2d009d833774aa851d2dd3f78ba6a8c5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4078: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/index.html
  IGT_5413: 84d12b77184a143f501c2f347df8ba3210c4cf3c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_fence@await-hang
+igt@gem_exec_fence@basic-await
+igt@gem_exec_fence@basic-busy
+igt@gem_exec_fence@basic-wait
+igt@gem_exec_fence@busy-hang
+igt@gem_exec_fence@keep-in-fence
+igt@gem_exec_fence@nb-await
+igt@gem_exec_fence@nb-await-hang
+igt@gem_exec_fence@parallel
+igt@gem_exec_fence@wait-hang
-igt@gem_exec_fence@await-blt
-igt@gem_exec_fence@await-bsd
-igt@gem_exec_fence@await-bsd1
-igt@gem_exec_fence@await-bsd2
-igt@gem_exec_fence@await-hang-blt
-igt@gem_exec_fence@await-hang-bsd
-igt@gem_exec_fence@await-hang-bsd1
-igt@gem_exec_fence@await-hang-bsd2
-igt@gem_exec_fence@await-hang-default
-igt@gem_exec_fence@await-hang-render
-igt@gem_exec_fence@await-hang-vebox
-igt@gem_exec_fence@await-render
-igt@gem_exec_fence@await-vebox
-igt@gem_exec_fence@basic-await-default
-igt@gem_exec_fence@basic-busy-default
-igt@gem_exec_fence@basic-wait-default
-igt@gem_exec_fence@busy-blt
-igt@gem_exec_fence@busy-bsd
-igt@gem_exec_fence@busy-bsd1
-igt@gem_exec_fence@busy-bsd2
-igt@gem_exec_fence@busy-hang-blt
-igt@gem_exec_fence@busy-hang-bsd
-igt@gem_exec_fence@busy-hang-bsd1
-igt@gem_exec_fence@busy-hang-bsd2
-igt@gem_exec_fence@busy-hang-default
-igt@gem_exec_fence@busy-hang-render
-igt@gem_exec_fence@busy-hang-vebox
-igt@gem_exec_fence@busy-render
-igt@gem_exec_fence@busy-vebox
-igt@gem_exec_fence@keep-in-fence-blt
-igt@gem_exec_fence@keep-in-fence-bsd
-igt@gem_exec_fence@keep-in-fence-bsd1
-igt@gem_exec_fence@keep-in-fence-bsd2
-igt@gem_exec_fence@keep-in-fence-default
-igt@gem_exec_fence@keep-in-fence-render
-igt@gem_exec_fence@keep-in-fence-vebox
-igt@gem_exec_fence@nb-await-blt
-igt@gem_exec_fence@nb-await-bsd
-igt@gem_exec_fence@nb-await-bsd1
-igt@gem_exec_fence@nb-await-bsd2
-igt@gem_exec_fence@nb-await-default
-igt@gem_exec_fence@nb-await-hang-blt
-igt@gem_exec_fence@nb-await-hang-bsd
-igt@gem_exec_fence@nb-await-hang-bsd1
-igt@gem_exec_fence@nb-await-hang-bsd2
-igt@gem_exec_fence@nb-await-hang-default
-igt@gem_exec_fence@nb-await-hang-render
-igt@gem_exec_fence@nb-await-hang-vebox
-igt@gem_exec_fence@nb-await-render
-igt@gem_exec_fence@nb-await-vebox
-igt@gem_exec_fence@parallel-blt
-igt@gem_exec_fence@parallel-bsd1
-igt@gem_exec_fence@parallel-bsd2
-igt@gem_exec_fence@parallel-render
-igt@gem_exec_fence@parallel-vebox
-igt@gem_exec_fence@wait-blt
-igt@gem_exec_fence@wait-bsd
-igt@gem_exec_fence@wait-bsd1
-igt@gem_exec_fence@wait-bsd2
-igt@gem_exec_fence@wait-hang-blt
-igt@gem_exec_fence@wait-hang-bsd
-igt@gem_exec_fence@wait-hang-bsd1
-igt@gem_exec_fence@wait-hang-bsd2
-igt@gem_exec_fence@wait-hang-default
-igt@gem_exec_fence@wait-hang-render
-igt@gem_exec_fence@wait-hang-vebox
-igt@gem_exec_fence@wait-render
-igt@gem_exec_fence@wait-vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4078/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
