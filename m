Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 18 May 2020 21:34:31 -0000
Message-ID: <158983767167.31686.16718952182288031320@emeril.freedesktop.org>
References: <20200518205010.1539621-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200518205010.1539621-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliOiBD?=
 =?utf-8?b?bGVhbnVwIF9faWd0X3BhcmFtc19vcGVuKCk=?=
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

Series: lib: Cleanup __igt_params_open()
URL   : https://patchwork.freedesktop.org/series/77374/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8498 -> IGTPW_4576
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4576 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4576, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4576:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_close_race@basic-process:
    - fi-ivb-3770:        [PASS][1] -> [FAIL][2] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-ivb-3770/igt@gem_close_race@basic-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-ivb-3770/igt@gem_close_race@basic-process.html
    - fi-ilk-650:         [PASS][3] -> [FAIL][4] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-ilk-650/igt@gem_close_race@basic-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-ilk-650/igt@gem_close_race@basic-process.html
    - fi-elk-e7500:       [PASS][5] -> [FAIL][6] +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-elk-e7500/igt@gem_close_race@basic-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-elk-e7500/igt@gem_close_race@basic-process.html
    - fi-skl-6700k2:      [PASS][7] -> [FAIL][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-skl-6700k2/igt@gem_close_race@basic-process.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-skl-6700k2/igt@gem_close_race@basic-process.html

  * igt@gem_close_race@basic-threads:
    - fi-skl-6600u:       [PASS][9] -> [FAIL][10] +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-skl-6600u/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-skl-6600u/igt@gem_close_race@basic-threads.html
    - fi-whl-u:           [PASS][11] -> [FAIL][12] +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-whl-u/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-whl-u/igt@gem_close_race@basic-threads.html
    - fi-skl-guc:         [PASS][13] -> [FAIL][14] +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-skl-guc/igt@gem_close_race@basic-threads.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-skl-guc/igt@gem_close_race@basic-threads.html
    - fi-bwr-2160:        [PASS][15] -> [FAIL][16] +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-bwr-2160/igt@gem_close_race@basic-threads.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bwr-2160/igt@gem_close_race@basic-threads.html
    - fi-icl-y:           [PASS][17] -> [FAIL][18] +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-icl-y/igt@gem_close_race@basic-threads.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-icl-y/igt@gem_close_race@basic-threads.html
    - fi-pnv-d510:        [PASS][19] -> [FAIL][20] +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-pnv-d510/igt@gem_close_race@basic-threads.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-pnv-d510/igt@gem_close_race@basic-threads.html
    - fi-kbl-7500u:       [PASS][21] -> [FAIL][22] +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-7500u/igt@gem_close_race@basic-threads.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-7500u/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_create@basic:
    - fi-bsw-kefka:       [PASS][23] -> [FAIL][24] +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-bsw-kefka/igt@gem_exec_create@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bsw-kefka/igt@gem_exec_create@basic.html
    - fi-kbl-x1275:       [PASS][25] -> [FAIL][26] +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-x1275/igt@gem_exec_create@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-x1275/igt@gem_exec_create@basic.html
    - fi-snb-2600:        [PASS][27] -> [FAIL][28] +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-snb-2600/igt@gem_exec_create@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-snb-2600/igt@gem_exec_create@basic.html
    - fi-gdg-551:         [PASS][29] -> [FAIL][30] +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-gdg-551/igt@gem_exec_create@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-gdg-551/igt@gem_exec_create@basic.html
    - fi-tgl-y:           [PASS][31] -> [FAIL][32] +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-tgl-y/igt@gem_exec_create@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-y/igt@gem_exec_create@basic.html
    - fi-glk-dsi:         [PASS][33] -> [FAIL][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-glk-dsi/igt@gem_exec_create@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-glk-dsi/igt@gem_exec_create@basic.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-r:           [PASS][35] -> [FAIL][36] +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-r/igt@gem_exec_suspend@basic-s0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-r/igt@gem_exec_suspend@basic-s0.html
    - fi-skl-lmem:        [PASS][37] -> [FAIL][38] +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-skl-lmem/igt@gem_exec_suspend@basic-s0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-skl-lmem/igt@gem_exec_suspend@basic-s0.html
    - fi-bsw-nick:        [PASS][39] -> [FAIL][40] +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-kbl-guc:         [PASS][41] -> [FAIL][42] +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html
    - fi-kbl-8809g:       [PASS][43] -> [FAIL][44] +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-8809g/igt@gem_exec_suspend@basic-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-8809g/igt@gem_exec_suspend@basic-s3.html
    - fi-bdw-5557u:       [PASS][45] -> [FAIL][46] +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bdw-5557u/igt@gem_exec_suspend@basic-s3.html
    - fi-kbl-soraka:      [PASS][47] -> [FAIL][48] +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-soraka/igt@gem_exec_suspend@basic-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-soraka/igt@gem_exec_suspend@basic-s3.html
    - fi-icl-guc:         [PASS][49] -> [FAIL][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-icl-guc/igt@gem_exec_suspend@basic-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-icl-guc/igt@gem_exec_suspend@basic-s3.html
    - fi-byt-n2820:       [PASS][51] -> [FAIL][52] +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-byt-n2820/igt@gem_exec_suspend@basic-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-byt-n2820/igt@gem_exec_suspend@basic-s3.html
    - fi-cfl-8109u:       [PASS][53] -> [FAIL][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-cfl-8109u/igt@gem_exec_suspend@basic-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cfl-8109u/igt@gem_exec_suspend@basic-s3.html
    - fi-bxt-dsi:         [PASS][55] -> [FAIL][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html
    - fi-bsw-n3050:       [PASS][57] -> [FAIL][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [PASS][59] -> [FAIL][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-icl-u2/igt@i915_module_load@reload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-icl-u2/igt@i915_module_load@reload.html
    - fi-cml-u2:          [PASS][61] -> [FAIL][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-cml-u2/igt@i915_module_load@reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cml-u2/igt@i915_module_load@reload.html
    - fi-blb-e6850:       [PASS][63] -> [FAIL][64] +6 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-blb-e6850/igt@i915_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-blb-e6850/igt@i915_module_load@reload.html
    - fi-byt-j1900:       [PASS][65] -> [FAIL][66] +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-byt-j1900/igt@i915_module_load@reload.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-byt-j1900/igt@i915_module_load@reload.html
    - fi-cfl-8700k:       [PASS][67] -> [FAIL][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-cfl-8700k/igt@i915_module_load@reload.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cfl-8700k/igt@i915_module_load@reload.html
    - fi-apl-guc:         [PASS][69] -> [FAIL][70] +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-apl-guc/igt@i915_module_load@reload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-apl-guc/igt@i915_module_load@reload.html
    - fi-snb-2520m:       [PASS][71] -> [FAIL][72] +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-snb-2520m/igt@i915_module_load@reload.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-snb-2520m/igt@i915_module_load@reload.html
    - fi-cml-s:           [PASS][73] -> [FAIL][74] +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-cml-s/igt@i915_module_load@reload.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cml-s/igt@i915_module_load@reload.html
    - fi-cfl-guc:         [PASS][75] -> [FAIL][76] +5 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-cfl-guc/igt@i915_module_load@reload.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cfl-guc/igt@i915_module_load@reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_create@basic:
    - {fi-ehl-1}:         [PASS][77] -> [FAIL][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-ehl-1/igt@gem_exec_create@basic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-ehl-1/igt@gem_exec_create@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - {fi-tgl-u}:         [PASS][79] -> [FAIL][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-tgl-u/igt@gem_exec_suspend@basic-s3.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-u/igt@gem_exec_suspend@basic-s3.html

  * {igt@gem_wait@busy}:
    - fi-cfl-guc:         NOTRUN -> [FAIL][81]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cfl-guc/igt@gem_wait@busy.html
    - fi-tgl-y:           NOTRUN -> [FAIL][82] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-y/igt@gem_wait@busy.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][83] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-glk-dsi/igt@gem_wait@busy.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][84] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bsw-kefka/igt@gem_wait@busy.html
    - fi-icl-guc:         NOTRUN -> [FAIL][85] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-icl-guc/igt@gem_wait@busy.html
    - fi-byt-n2820:       NOTRUN -> [FAIL][86] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-byt-n2820/igt@gem_wait@busy.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][87] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-ehl-1/igt@gem_wait@busy.html
    - fi-gdg-551:         NOTRUN -> [FAIL][88]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-gdg-551/igt@gem_wait@busy.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][89] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-skl-lmem/igt@gem_wait@busy.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][90]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-soraka/igt@gem_wait@busy.html
    - fi-whl-u:           NOTRUN -> [FAIL][91]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-whl-u/igt@gem_wait@busy.html
    - {fi-tgl-u}:         NOTRUN -> [FAIL][92] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-u/igt@gem_wait@busy.html
    - fi-bxt-dsi:         NOTRUN -> [FAIL][93] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bxt-dsi/igt@gem_wait@busy.html
    - fi-byt-j1900:       NOTRUN -> [FAIL][94] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-byt-j1900/igt@gem_wait@busy.html
    - fi-cml-s:           NOTRUN -> [FAIL][95]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cml-s/igt@gem_wait@busy.html

  * {igt@gem_wait@wait}:
    - fi-skl-6600u:       NOTRUN -> [FAIL][96]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-skl-6600u/igt@gem_wait@wait.html
    - fi-icl-u2:          NOTRUN -> [FAIL][97] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-icl-u2/igt@gem_wait@wait.html
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][98] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-dsi/igt@gem_wait@wait.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][99] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bsw-nick/igt@gem_wait@wait.html
    - fi-icl-y:           NOTRUN -> [FAIL][100] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-icl-y/igt@gem_wait@wait.html
    - fi-apl-guc:         NOTRUN -> [FAIL][101] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-apl-guc/igt@gem_wait@wait.html
    - fi-kbl-r:           NOTRUN -> [FAIL][102]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-r/igt@gem_wait@wait.html
    - fi-bwr-2160:        NOTRUN -> [FAIL][103] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bwr-2160/igt@gem_wait@wait.html
    - fi-blb-e6850:       NOTRUN -> [FAIL][104] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-blb-e6850/igt@gem_wait@wait.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][105]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-guc/igt@gem_wait@wait.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][106]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-elk-e7500/igt@gem_wait@wait.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][107] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-bsw-n3050/igt@gem_wait@wait.html
    - fi-ilk-650:         NOTRUN -> [FAIL][108] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-ilk-650/igt@gem_wait@wait.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][109] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-pnv-d510/igt@gem_wait@wait.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][110]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cfl-8700k/igt@gem_wait@wait.html

  * igt@i915_module_load@reload:
    - {fi-tgl-dsi}:       [PASS][111] -> [FAIL][112] +5 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-tgl-dsi/igt@i915_module_load@reload.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-dsi/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_4576 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-kbl-x1275:       [PASS][113] -> [FAIL][114] ([i915#62] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-x1275/igt@i915_module_load@reload.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-x1275/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-tgl-y:           [PASS][115] -> [INCOMPLETE][116] ([i915#1803])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-tgl-y/igt@i915_selftest@live@execlists.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-y/igt@i915_selftest@live@execlists.html
    - fi-cfl-8700k:       [PASS][117] -> [INCOMPLETE][118] ([i915#656])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-cfl-8700k/igt@i915_selftest@live@execlists.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cfl-8700k/igt@i915_selftest@live@execlists.html
    - fi-cfl-guc:         [PASS][119] -> [INCOMPLETE][120] ([i915#656])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-cfl-guc/igt@i915_selftest@live@execlists.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-cfl-guc/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-y:           [FAIL][121] ([fdo#103375] / [i915#1592]) -> [FAIL][122] ([i915#402])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-tgl-y/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [SKIP][123] ([fdo#109271]) -> [FAIL][124] ([i915#62])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8498/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1592]: https://gitlab.freedesktop.org/drm/intel/issues/1592
  [i915#1803]: https://gitlab.freedesktop.org/drm/intel/issues/1803
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (52 -> 43)
------------------------------

  Missing    (9): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-hsw-4770 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5659 -> IGTPW_4576

  CI-20190529: 20190529
  CI_DRM_8498: 1493c649ae92207a758afa50a639275bd6c80e2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4576: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/index.html
  IGT_5659: 66ab5e42811fee3dea8c21ab29e70e323a0650de @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4576/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
