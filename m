Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 11 Apr 2020 11:09:24 -0000
Message-ID: <158660336428.322.7792797318365789105@emeril.freedesktop.org>
References: <20200411094443.2694505-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200411094443.2694505-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Iga21zX2Zs?=
 =?utf-8?q?ip=3A_Convert_to_dynamic_CRTC_test_groups_=28rev2=29?=
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

Series: kms_flip: Convert to dynamic CRTC test groups (rev2)
URL   : https://patchwork.freedesktop.org/series/75827/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5588 -> IGTPW_4447
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4447 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4447, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4447:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-ilk-650:         [PASS][1] -> [INCOMPLETE][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-ilk-650/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-whl-u:           [PASS][3] -> [INCOMPLETE][4] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-whl-u/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-whl-u/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-cfl-guc:         [PASS][5] -> [INCOMPLETE][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-cfl-guc/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-hsw-4770:        [PASS][7] -> [INCOMPLETE][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-hsw-4770/igt@kms_flip@basic-flip-vs-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-hsw-4770/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-bxt-dsi:         [PASS][9] -> [INCOMPLETE][10] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-bxt-dsi/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-cml-u2:          [PASS][11] -> [INCOMPLETE][12] +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cml-u2/igt@kms_flip@basic-flip-vs-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-cml-u2/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-snb-2520m:       [PASS][13] -> [INCOMPLETE][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-snb-2520m/igt@kms_flip@basic-flip-vs-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-snb-2520m/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-cfl-8700k:       [PASS][15] -> [INCOMPLETE][16] +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-cfl-8700k/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-bsw-kefka:       [PASS][17] -> [INCOMPLETE][18] +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-kbl-x1275:       [PASS][19] -> [INCOMPLETE][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-icl-y:           [PASS][21] -> [INCOMPLETE][22] +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-y/igt@kms_flip@basic-flip-vs-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-y/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-cml-s:           [PASS][23] -> [INCOMPLETE][24] +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cml-s/igt@kms_flip@basic-flip-vs-modeset.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-cml-s/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-blb-e6850:       [PASS][25] -> [INCOMPLETE][26] +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-blb-e6850/igt@kms_flip@basic-flip-vs-modeset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-blb-e6850/igt@kms_flip@basic-flip-vs-modeset.html
    - fi-ivb-3770:        [PASS][27] -> [INCOMPLETE][28] +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-ivb-3770/igt@kms_flip@basic-flip-vs-modeset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-ivb-3770/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-hsw-peppy:       [PASS][29] -> [INCOMPLETE][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-hsw-peppy/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-hsw-peppy/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-cfl-8109u:       [PASS][31] -> [INCOMPLETE][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-kbl-r:           [PASS][33] -> [INCOMPLETE][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-r/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-r/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-bwr-2160:        [PASS][35] -> [INCOMPLETE][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-bwr-2160/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-bdw-5557u:       [PASS][37] -> [INCOMPLETE][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-bdw-5557u/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-skl-guc:         [PASS][39] -> [INCOMPLETE][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-icl-dsi:         [PASS][41] -> [INCOMPLETE][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-dsi/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-dsi/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-kbl-7500u:       [PASS][43] -> [INCOMPLETE][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-7500u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-7500u/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - fi-bsw-n3050:       [PASS][45] -> [INCOMPLETE][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-bsw-n3050/igt@kms_flip@basic-plain-flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-bsw-n3050/igt@kms_flip@basic-plain-flip.html
    - fi-skl-6700k2:      [PASS][47] -> [INCOMPLETE][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-skl-6700k2/igt@kms_flip@basic-plain-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-skl-6700k2/igt@kms_flip@basic-plain-flip.html
    - fi-kbl-soraka:      [PASS][49] -> [INCOMPLETE][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-soraka/igt@kms_flip@basic-plain-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-soraka/igt@kms_flip@basic-plain-flip.html
    - fi-icl-guc:         [PASS][51] -> [INCOMPLETE][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-guc/igt@kms_flip@basic-plain-flip.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-guc/igt@kms_flip@basic-plain-flip.html
    - fi-apl-guc:         [PASS][53] -> [INCOMPLETE][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-apl-guc/igt@kms_flip@basic-plain-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-apl-guc/igt@kms_flip@basic-plain-flip.html
    - fi-skl-lmem:        NOTRUN -> [INCOMPLETE][55] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-skl-lmem/igt@kms_flip@basic-plain-flip.html
    - fi-skl-6600u:       [PASS][56] -> [INCOMPLETE][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-skl-6600u/igt@kms_flip@basic-plain-flip.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-skl-6600u/igt@kms_flip@basic-plain-flip.html
    - fi-icl-u2:          [PASS][58] -> [INCOMPLETE][59] +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-u2/igt@kms_flip@basic-plain-flip.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-u2/igt@kms_flip@basic-plain-flip.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-plain-flip:
    - {fi-ehl-1}:         [PASS][60] -> [INCOMPLETE][61] +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-ehl-1/igt@kms_flip@basic-plain-flip.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-ehl-1/igt@kms_flip@basic-plain-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_4447 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - fi-kbl-soraka:      [PASS][62] -> [INCOMPLETE][63] ([i915#633])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-dpms.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-soraka/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-pnv-d510:        [PASS][64] -> [INCOMPLETE][65] ([i915#299]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-pnv-d510/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-skl-6600u:       [PASS][66] -> [INCOMPLETE][67] ([CI#80])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-skl-6600u/igt@kms_flip@basic-flip-vs-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-skl-6600u/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-icl-dsi:         [PASS][68] -> [INCOMPLETE][69] ([i915#261])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-dsi/igt@kms_flip@basic-flip-vs-dpms.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-dsi/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-kbl-r:           [PASS][70] -> [INCOMPLETE][71] ([i915#633])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-r/igt@kms_flip@basic-flip-vs-dpms.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-r/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-icl-u2:          [PASS][72] -> [INCOMPLETE][73] ([i915#261])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-u2/igt@kms_flip@basic-flip-vs-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-u2/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-cfl-8109u:       [PASS][74] -> [INCOMPLETE][75] ([fdo#106070])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-icl-y:           [PASS][76] -> [INCOMPLETE][77] ([i915#261])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-y/igt@kms_flip@basic-flip-vs-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-y/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-kbl-7500u:       [PASS][78] -> [INCOMPLETE][79] ([i915#633])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-7500u/igt@kms_flip@basic-flip-vs-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-7500u/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-kbl-x1275:       [PASS][80] -> [INCOMPLETE][81] ([i915#633])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-skl-guc:         [PASS][82] -> [INCOMPLETE][83] ([CI#80])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-skl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-skl-guc/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-icl-guc:         [PASS][84] -> [INCOMPLETE][85] ([i915#261])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-icl-guc/igt@kms_flip@basic-flip-vs-dpms.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-icl-guc/igt@kms_flip@basic-flip-vs-dpms.html
    - fi-skl-6700k2:      [PASS][86] -> [INCOMPLETE][87] ([CI#80])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-skl-6700k2/igt@kms_flip@basic-flip-vs-dpms.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-skl-6700k2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - fi-byt-j1900:       [PASS][88] -> [INCOMPLETE][89] ([i915#45]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-byt-j1900/igt@kms_flip@basic-flip-vs-modeset.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-byt-j1900/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - fi-snb-2600:        [PASS][90] -> [INCOMPLETE][91] ([i915#82]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-snb-2600/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-snb-2600/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-tgl-y:           [PASS][92] -> [INCOMPLETE][93] ([i915#516]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-tgl-y/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-gdg-551:         [PASS][94] -> [INCOMPLETE][95] ([i915#172]) +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-gdg-551/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-gdg-551/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-glk-dsi:         [PASS][96] -> [INCOMPLETE][97] ([i915#58] / [k.org#198133]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-glk-dsi/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-glk-dsi/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-hsw-4770:        [PASS][98] -> [INCOMPLETE][99] ([i915#61])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-hsw-4770/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-hsw-4770/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-whl-u:           [PASS][100] -> [INCOMPLETE][101] ([fdo#106070])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-whl-u/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-whl-u/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - fi-snb-2520m:       [PASS][102] -> [INCOMPLETE][103] ([i915#82])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-snb-2520m/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - fi-byt-n2820:       [PASS][104] -> [INCOMPLETE][105] ([i915#45]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-byt-n2820/igt@kms_flip@basic-plain-flip.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-byt-n2820/igt@kms_flip@basic-plain-flip.html
    - fi-elk-e7500:       [PASS][106] -> [INCOMPLETE][107] ([i915#66]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-elk-e7500/igt@kms_flip@basic-plain-flip.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-elk-e7500/igt@kms_flip@basic-plain-flip.html
    - fi-snb-2520m:       [PASS][108] -> [INCOMPLETE][109] ([CI#80])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-snb-2520m/igt@kms_flip@basic-plain-flip.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-snb-2520m/igt@kms_flip@basic-plain-flip.html
    - fi-ilk-650:         [PASS][110] -> [INCOMPLETE][111] ([i915#90])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-ilk-650/igt@kms_flip@basic-plain-flip.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-ilk-650/igt@kms_flip@basic-plain-flip.html

  
#### Possible fixes ####

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][112] ([IGT#4]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5588/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#106070]: https://bugs.freedesktop.org/show_bug.cgi?id=106070
  [i915#1106]: https://gitlab.freedesktop.org/drm/intel/issues/1106
  [i915#172]: https://gitlab.freedesktop.org/drm/intel/issues/172
  [i915#261]: https://gitlab.freedesktop.org/drm/intel/issues/261
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#633]: https://gitlab.freedesktop.org/drm/intel/issues/633
  [i915#66]: https://gitlab.freedesktop.org/drm/intel/issues/66
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#90]: https://gitlab.freedesktop.org/drm/intel/issues/90
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-skl-lmem 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5588 -> IGTPW_4447

  CI-20190529: 20190529
  CI_DRM_8291: ef6b9e8bc3134d7261f080ceb5158b16447a4793 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4447: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/index.html
  IGT_5588: 83182c9b2dee30f9e49b980606802de2bbf8d218 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4447/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
