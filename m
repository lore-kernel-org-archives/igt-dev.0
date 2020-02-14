Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 Feb 2020 14:58:12 -0000
Message-ID: <158169229282.9929.11087419982446746409@emeril.freedesktop.org>
References: <20200214135658.2711-1-satyavathi.k@intel.com>
In-Reply-To: <20200214135658.2711-1-satyavathi.k@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fringfill=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengin?=
 =?utf-8?q?e_to_utilize_all_available_engines=2E_=28rev2=29?=
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
To: satyavat <satyavathi.k@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ringfill:Added __for_each_physical_engine to utilize all available engines. (rev2)
URL   : https://patchwork.freedesktop.org/series/73463/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5442 -> IGTPW_4154
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4154 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4154, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4154:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ringfill@basic-default-forked:
    - fi-icl-y:           [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-icl-y/igt@gem_ringfill@basic-default-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-icl-y/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-dsi:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-icl-dsi/igt@gem_ringfill@basic-default-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-icl-dsi/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-u3:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-icl-u3/igt@gem_ringfill@basic-default-forked.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-icl-u3/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-u2:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-icl-u2/igt@gem_ringfill@basic-default-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-icl-u2/igt@gem_ringfill@basic-default-forked.html
    - fi-cml-u2:          [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-cml-u2/igt@gem_ringfill@basic-default-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-cml-u2/igt@gem_ringfill@basic-default-forked.html
    - fi-ilk-650:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-ilk-650/igt@gem_ringfill@basic-default-forked.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-ilk-650/igt@gem_ringfill@basic-default-forked.html
    - fi-icl-guc:         [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-icl-guc/igt@gem_ringfill@basic-default-forked.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-icl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-cml-s:           [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-cml-s/igt@gem_ringfill@basic-default-forked.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-cml-s/igt@gem_ringfill@basic-default-forked.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ringfill@basic-default-forked:
    - {fi-tgl-u}:         [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-tgl-u/igt@gem_ringfill@basic-default-forked.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-tgl-u/igt@gem_ringfill@basic-default-forked.html
    - {fi-tgl-dsi}:       [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-tgl-dsi/igt@gem_ringfill@basic-default-forked.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-tgl-dsi/igt@gem_ringfill@basic-default-forked.html

  
Known issues
------------

  Here are the changes found in IGTPW_4154 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ringfill@basic-default-forked:
    - fi-kbl-x1275:       [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-kbl-x1275/igt@gem_ringfill@basic-default-forked.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-kbl-x1275/igt@gem_ringfill@basic-default-forked.html
    - fi-kbl-7500u:       [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-kbl-7500u/igt@gem_ringfill@basic-default-forked.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-kbl-7500u/igt@gem_ringfill@basic-default-forked.html
    - fi-hsw-4770r:       [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-hsw-4770r/igt@gem_ringfill@basic-default-forked.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-hsw-4770r/igt@gem_ringfill@basic-default-forked.html
    - fi-skl-guc:         [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-skl-guc/igt@gem_ringfill@basic-default-forked.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-skl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-kbl-8809g:       [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-kbl-8809g/igt@gem_ringfill@basic-default-forked.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-kbl-8809g/igt@gem_ringfill@basic-default-forked.html
    - fi-blb-e6850:       [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-blb-e6850/igt@gem_ringfill@basic-default-forked.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-blb-e6850/igt@gem_ringfill@basic-default-forked.html
    - fi-bdw-5557u:       [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-bdw-5557u/igt@gem_ringfill@basic-default-forked.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-bdw-5557u/igt@gem_ringfill@basic-default-forked.html
    - fi-apl-guc:         [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-apl-guc/igt@gem_ringfill@basic-default-forked.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-apl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-cfl-8700k:       [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-cfl-8700k/igt@gem_ringfill@basic-default-forked.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-cfl-8700k/igt@gem_ringfill@basic-default-forked.html
    - fi-skl-6600u:       [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-skl-6600u/igt@gem_ringfill@basic-default-forked.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-skl-6600u/igt@gem_ringfill@basic-default-forked.html
    - fi-pnv-d510:        [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-pnv-d510/igt@gem_ringfill@basic-default-forked.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-pnv-d510/igt@gem_ringfill@basic-default-forked.html
    - fi-cfl-guc:         [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-cfl-guc/igt@gem_ringfill@basic-default-forked.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-cfl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-skl-6700k2:      [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-skl-6700k2/igt@gem_ringfill@basic-default-forked.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-skl-6700k2/igt@gem_ringfill@basic-default-forked.html
    - fi-skl-lmem:        [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-skl-lmem/igt@gem_ringfill@basic-default-forked.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-skl-lmem/igt@gem_ringfill@basic-default-forked.html
    - fi-snb-2600:        [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-snb-2600/igt@gem_ringfill@basic-default-forked.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-snb-2600/igt@gem_ringfill@basic-default-forked.html
    - fi-kbl-guc:         [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-kbl-guc/igt@gem_ringfill@basic-default-forked.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-kbl-guc/igt@gem_ringfill@basic-default-forked.html
    - fi-bsw-kefka:       [PASS][53] -> [SKIP][54] ([fdo#109271])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-bsw-kefka/igt@gem_ringfill@basic-default-forked.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-bsw-kefka/igt@gem_ringfill@basic-default-forked.html
    - fi-kbl-r:           [PASS][55] -> [SKIP][56] ([fdo#109271])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-kbl-r/igt@gem_ringfill@basic-default-forked.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-kbl-r/igt@gem_ringfill@basic-default-forked.html
    - fi-bsw-nick:        [PASS][57] -> [SKIP][58] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-bsw-nick/igt@gem_ringfill@basic-default-forked.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-bsw-nick/igt@gem_ringfill@basic-default-forked.html
    - fi-cfl-8109u:       [PASS][59] -> [SKIP][60] ([fdo#109271])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-cfl-8109u/igt@gem_ringfill@basic-default-forked.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-cfl-8109u/igt@gem_ringfill@basic-default-forked.html
    - fi-snb-2520m:       [PASS][61] -> [SKIP][62] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-snb-2520m/igt@gem_ringfill@basic-default-forked.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-snb-2520m/igt@gem_ringfill@basic-default-forked.html
    - fi-bxt-dsi:         [PASS][63] -> [SKIP][64] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-bxt-dsi/igt@gem_ringfill@basic-default-forked.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-bxt-dsi/igt@gem_ringfill@basic-default-forked.html
    - fi-bsw-n3050:       [PASS][65] -> [SKIP][66] ([fdo#109271])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-bsw-n3050/igt@gem_ringfill@basic-default-forked.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-bsw-n3050/igt@gem_ringfill@basic-default-forked.html
    - fi-hsw-4770:        [PASS][67] -> [SKIP][68] ([fdo#109271])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-hsw-4770/igt@gem_ringfill@basic-default-forked.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-hsw-4770/igt@gem_ringfill@basic-default-forked.html
    - fi-glk-dsi:         [PASS][69] -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-glk-dsi/igt@gem_ringfill@basic-default-forked.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-glk-dsi/igt@gem_ringfill@basic-default-forked.html
    - fi-ivb-3770:        [PASS][71] -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-ivb-3770/igt@gem_ringfill@basic-default-forked.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-ivb-3770/igt@gem_ringfill@basic-default-forked.html

  * igt@i915_selftest@live_gtt:
    - fi-cfl-guc:         [PASS][73] -> [TIMEOUT][74] ([fdo#112271])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-cfl-guc/igt@i915_selftest@live_gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-cfl-guc/igt@i915_selftest@live_gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_gtt:
    - fi-skl-6600u:       [TIMEOUT][75] ([fdo#111732] / [fdo#112271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-skl-6600u/igt@i915_selftest@live_gtt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-skl-6600u/igt@i915_selftest@live_gtt.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-bsw-n3050:       [FAIL][77] ([i915#34]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5442/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/fi-bsw-n3050/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34


Participating hosts (52 -> 45)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5442 -> IGTPW_4154

  CI-20190529: 20190529
  CI_DRM_7939: cceb0c30a34af6ca96e35211ecdc5ca198d44e7e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/index.html
  IGT_5442: 3f6080996885b997685f08ecb8b416b2dc485290 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_ringfill@test-basic
+igt@gem_ringfill@test-basic-fd
+igt@gem_ringfill@test-basic-forked
+igt@gem_ringfill@test-basic-hang
+igt@gem_ringfill@test-basic-interruptible
+igt@gem_ringfill@test--bomb
+igt@gem_ringfill@test--child
+igt@gem_ringfill@test--s3
+igt@gem_ringfill@test--s4
-igt@gem_ringfill@basic-default
-igt@gem_ringfill@basic-default-fd
-igt@gem_ringfill@basic-default-forked
-igt@gem_ringfill@basic-default-hang
-igt@gem_ringfill@basic-default-interruptible
-igt@gem_ringfill@blt
-igt@gem_ringfill@blt-bomb
-igt@gem_ringfill@blt-child
-igt@gem_ringfill@blt-fd
-igt@gem_ringfill@blt-forked
-igt@gem_ringfill@blt-hang
-igt@gem_ringfill@blt-interruptible
-igt@gem_ringfill@blt-s3
-igt@gem_ringfill@blt-s4
-igt@gem_ringfill@bsd
-igt@gem_ringfill@bsd1
-igt@gem_ringfill@bsd1-bomb
-igt@gem_ringfill@bsd1-child
-igt@gem_ringfill@bsd1-fd
-igt@gem_ringfill@bsd1-forked
-igt@gem_ringfill@bsd1-hang
-igt@gem_ringfill@bsd1-interruptible
-igt@gem_ringfill@bsd1-s3
-igt@gem_ringfill@bsd1-s4
-igt@gem_ringfill@bsd2
-igt@gem_ringfill@bsd2-bomb
-igt@gem_ringfill@bsd2-child
-igt@gem_ringfill@bsd2-fd
-igt@gem_ringfill@bsd2-forked
-igt@gem_ringfill@bsd2-hang
-igt@gem_ringfill@bsd2-interruptible
-igt@gem_ringfill@bsd2-s3
-igt@gem_ringfill@bsd2-s4
-igt@gem_ringfill@bsd-bomb
-igt@gem_ringfill@bsd-child
-igt@gem_ringfill@bsd-fd
-igt@gem_ringfill@bsd-forked
-igt@gem_ringfill@bsd-hang
-igt@gem_ringfill@bsd-interruptible
-igt@gem_ringfill@bsd-s3
-igt@gem_ringfill@bsd-s4
-igt@gem_ringfill@default-bomb
-igt@gem_ringfill@default-child
-igt@gem_ringfill@default-s3
-igt@gem_ringfill@default-s4
-igt@gem_ringfill@render
-igt@gem_ringfill@render-bomb
-igt@gem_ringfill@render-child
-igt@gem_ringfill@render-fd
-igt@gem_ringfill@render-forked
-igt@gem_ringfill@render-hang
-igt@gem_ringfill@render-interruptible
-igt@gem_ringfill@render-s3
-igt@gem_ringfill@render-s4
-igt@gem_ringfill@vebox
-igt@gem_ringfill@vebox-bomb
-igt@gem_ringfill@vebox-child
-igt@gem_ringfill@vebox-fd
-igt@gem_ringfill@vebox-forked
-igt@gem_ringfill@vebox-hang
-igt@gem_ringfill@vebox-interruptible
-igt@gem_ringfill@vebox-s3
-igt@gem_ringfill@vebox-s4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4154/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
