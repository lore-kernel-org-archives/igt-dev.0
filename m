Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 14:36:17 -0000
Message-ID: <158592457710.13349.15463122052019274066@emeril.freedesktop.org>
References: <20200402122943.6583-1-imre.deak@intel.com>
In-Reply-To: <20200402122943.6583-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=3A_Skip_detiler_fences_subtest_on_platforms_w/o_aper?=
 =?utf-8?q?ture_=28rev2=29?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_flip: Skip detiler fences subtest on platforms w/o aperture (rev2)
URL   : https://patchwork.freedesktop.org/series/75416/
State : success

== Summary ==

CI Bug Log - changes from IGT_5562 -> IGTPW_4402
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4402:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_wait@busy@all}:
    - fi-hsw-peppy:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-hsw-peppy/igt@gem_wait@busy@all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-hsw-peppy/igt@gem_wait@busy@all.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - {fi-tgl-u}:         [PASS][3] -> [SKIP][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-tgl-u/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-tgl-u/igt@kms_flip@basic-flip-vs-dpms.html
    - {fi-tgl-dsi}:       [PASS][5] -> [SKIP][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-tgl-dsi/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-plain-flip:
    - {fi-ehl-1}:         [PASS][7] -> [SKIP][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-ehl-1/igt@kms_flip@basic-plain-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-ehl-1/igt@kms_flip@basic-plain-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_4402 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-glk-dsi:         [PASS][9] -> [INCOMPLETE][10] ([i915#58] / [i915#656] / [k.org#198133])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-glk-dsi/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-glk-dsi/igt@i915_selftest@live@execlists.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-kbl-soraka:      [PASS][11] -> [SKIP][12] ([fdo#109271]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-ilk-650:         [PASS][13] -> [SKIP][14] ([fdo#109271]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-pnv-d510:        [PASS][15] -> [SKIP][16] ([fdo#109271]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-skl-6770hq:      [PASS][17] -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-cfl-guc:         [PASS][19] -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-hsw-4770:        [PASS][21] -> [SKIP][22] ([fdo#109271]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-hsw-4770/igt@kms_flip@basic-flip-vs-dpms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-hsw-4770/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-bxt-dsi:         [PASS][23] -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-skl-6600u:       [PASS][25] -> [SKIP][26] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-6600u/igt@kms_flip@basic-flip-vs-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-skl-6600u/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-cml-u2:          [PASS][27] -> [SKIP][28] ([i915#1615]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-cml-u2/igt@kms_flip@basic-flip-vs-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-cml-u2/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-icl-dsi:         [PASS][29] -> [SKIP][30] ([i915#1615]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-icl-dsi/igt@kms_flip@basic-flip-vs-dpms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-icl-dsi/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-cfl-8700k:       [PASS][31] -> [SKIP][32] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-dpms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-bsw-kefka:       [PASS][33] -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-x1275:       [PASS][35] -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-icl-y:           [PASS][37] -> [SKIP][38] ([i915#1615]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-icl-y/igt@kms_flip@basic-flip-vs-modeset.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-icl-y/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-cml-s:           [PASS][39] -> [SKIP][40] ([i915#1615]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-cml-s/igt@kms_flip@basic-flip-vs-modeset.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-cml-s/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-byt-j1900:       [PASS][41] -> [SKIP][42] ([fdo#109271]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-byt-j1900/igt@kms_flip@basic-flip-vs-modeset.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-byt-j1900/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-ivb-3770:        [PASS][43] -> [SKIP][44] ([fdo#109271]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-ivb-3770/igt@kms_flip@basic-flip-vs-modeset.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-ivb-3770/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-hsw-peppy:       [PASS][45] -> [SKIP][46] ([fdo#109271]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-hsw-peppy/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-hsw-peppy/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-snb-2600:        [PASS][47] -> [SKIP][48] ([fdo#109271]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-snb-2600/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-snb-2600/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-gdg-551:         [PASS][49] -> [SKIP][50] ([fdo#109271]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-gdg-551/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-gdg-551/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-glk-dsi:         [PASS][51] -> [SKIP][52] ([fdo#109271]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-glk-dsi/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-glk-dsi/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-cfl-8109u:       [PASS][53] -> [SKIP][54] ([fdo#109271]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-kbl-r:           [PASS][55] -> [SKIP][56] ([fdo#109271]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-kbl-r/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-kbl-r/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-bwr-2160:        [PASS][57] -> [SKIP][58] ([fdo#109271]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-bdw-5557u:       [PASS][59] -> [SKIP][60] ([fdo#109271]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-skl-guc:         [PASS][61] -> [SKIP][62] ([fdo#109271]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-kbl-7500u:       [PASS][63] -> [SKIP][64] ([fdo#109271]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-kbl-7500u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-kbl-7500u/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - fi-skl-6700k2:      [PASS][65] -> [SKIP][66] ([fdo#109271]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-6700k2/igt@kms_flip@basic-plain-flip.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-skl-6700k2/igt@kms_flip@basic-plain-flip.html
    - fi-byt-n2820:       [PASS][67] -> [SKIP][68] ([fdo#109271]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-byt-n2820/igt@kms_flip@basic-plain-flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-byt-n2820/igt@kms_flip@basic-plain-flip.html
    - fi-icl-guc:         [PASS][69] -> [SKIP][70] ([i915#1615]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-icl-guc/igt@kms_flip@basic-plain-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-icl-guc/igt@kms_flip@basic-plain-flip.html
    - fi-elk-e7500:       [PASS][71] -> [SKIP][72] ([fdo#109271]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-elk-e7500/igt@kms_flip@basic-plain-flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-elk-e7500/igt@kms_flip@basic-plain-flip.html
    - fi-snb-2520m:       [PASS][73] -> [SKIP][74] ([fdo#109271]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-snb-2520m/igt@kms_flip@basic-plain-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-snb-2520m/igt@kms_flip@basic-plain-flip.html
    - fi-apl-guc:         [PASS][75] -> [SKIP][76] ([fdo#109271]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-apl-guc/igt@kms_flip@basic-plain-flip.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-apl-guc/igt@kms_flip@basic-plain-flip.html
    - fi-skl-lmem:        [PASS][77] -> [SKIP][78] ([fdo#109271]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-skl-lmem/igt@kms_flip@basic-plain-flip.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-skl-lmem/igt@kms_flip@basic-plain-flip.html
    - fi-icl-u2:          [PASS][79] -> [SKIP][80] ([i915#1615]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-icl-u2/igt@kms_flip@basic-plain-flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-icl-u2/igt@kms_flip@basic-plain-flip.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2520m:       [INCOMPLETE][81] -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5562/fi-snb-2520m/igt@i915_selftest@live@hangcheck.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/fi-snb-2520m/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1615]: https://gitlab.freedesktop.org/drm/intel/issues/1615
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-n3050 fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5562 -> IGTPW_4402

  CI-20190529: 20190529
  CI_DRM_8244: 55348aac86bd6f0c4ce4d3d8a0e227f6a20a72f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4402: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/index.html
  IGT_5562: 4770480c8c1f105ff9225e8eb07b652ca954e06a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4402/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
