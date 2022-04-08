Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3042668630263556235=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 08 Apr 2022 08:04:04 -0000
Message-ID: <164940504421.22678.9941248512439202739@emeril.freedesktop.org>
References: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_for_connector_=26_crtc_debugfs?=
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

--===============3042668630263556235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for connector & crtc debugfs
URL   : https://patchwork.freedesktop.org/series/102387/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11474_full -> IGTPW_6902_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6902_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6902_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html

Participating hosts (10 -> 6)
------------------------------

  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6902_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@core_setmaster@master-drop-set-shared-fd.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb2/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@pan:
    - shard-apl:          NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl7/igt@fbdev@pan.html
    - shard-glk:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk7/igt@fbdev@pan.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-iclb:         NOTRUN -> [FAIL][5] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb3/igt@gem_lmem_swapping@smem-oom.html

  * igt@i915_module_load@reload-no-display:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@i915_module_load@reload-no-display.html

  * igt@i915_selftest@live:
    - shard-tglb:         NOTRUN -> [FAIL][7] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb1/igt@i915_selftest@live.html
    - shard-kbl:          NOTRUN -> [FAIL][8] +7 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7/igt@i915_selftest@live.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@basic:
    - shard-apl:          [SKIP][9] ([fdo#109271]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-apl4/igt@gem_lmem_swapping@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-kbl:          [FAIL][11] ([i915#5602]) -> [FAIL][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl4/igt@gem_lmem_swapping@heavy-multi.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          [FAIL][13] ([i915#5602]) -> [FAIL][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk3/igt@gem_lmem_swapping@parallel-multi.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         [FAIL][15] ([i915#5602]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-iclb8/igt@gem_lmem_swapping@random-engines.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb4/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-glk:          [SKIP][17] ([fdo#109271]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk2/igt@gem_lmem_swapping@verify-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/igt@gem_lmem_swapping@verify-random.html
    - shard-kbl:          [SKIP][19] ([fdo#109271]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@gem_lmem_swapping@verify-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][21] -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-glk:          [DMESG-FAIL][23] ([i915#5602]) -> [DMESG-FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk3/igt@i915_selftest@perf@engine_cs.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk1/igt@i915_selftest@perf@engine_cs.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][25], [FAIL][26], [FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42]) ([i915#1814] / [i915#4312] / [i915#5257] / [i915#92]) -> ([FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51], [FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63]) ([i915#4312] / [i915#5257] / [i915#92])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl6/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl7/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl4/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl4/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl7/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl7/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl4/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl6/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl7/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl3/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl3/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl3/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl4/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl6/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl6/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl6/igt@runner@aborted.html
    - shard-glk:          ([FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77]) ([i915#4312] / [i915#5257]) -> ([FAIL][78], [FAIL][79], [FAIL][80], [FAIL][81], [FAIL][82], [FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86], [FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90], [FAIL][91]) ([i915#4312])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk9/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk8/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk6/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk5/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk5/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk5/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk4/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk4/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk3/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk3/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk2/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk1/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk1/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk3/igt@runner@aborted.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk3/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk7/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk1/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk2/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk7/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk5/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk5/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk6/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk8/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk9/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_suspend@system-suspend-without-i915}:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][92]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb3/igt@i915_suspend@system-suspend-without-i915.html

  
Known issues
------------

  Here are the changes found in IGTPW_6902_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109315] / [i915#2575]) +336 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@gem_create@create-clear.html

  * igt@gem_exec_fence@basic-await:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109315]) +552 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@gem_exec_fence@basic-await.html

  * igt@gem_exec_params@invalid-bsd1-flag-on-blt:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109276] / [fdo#109315]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb5/igt@gem_exec_params@invalid-bsd1-flag-on-blt.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109283] / [fdo#109315] / [i915#2575])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109283] / [fdo#109315]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb5/igt@gem_exec_params@no-blt.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-glk:          NOTRUN -> [FAIL][98] ([i915#5602]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk7/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-apl:          NOTRUN -> [FAIL][99] ([i915#5602])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109315] / [i915#2613])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb5/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#109315] / [i915#2575] / [i915#2613])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb1/igt@gem_tiled_swapping@non-threaded.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][102] ([i915#5602])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271]) +718 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk8/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109315] / [fdo#111719] / [i915#2575])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#5174]) +11 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb4/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#5174]) +7 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_addfb_basic@master-rmfb:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#2575]) +366 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb7/igt@kms_addfb_basic@master-rmfb.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109315] / [fdo#111615] / [i915#2575]) +14 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109278] / [fdo#109315]) +14 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#1149] / [i915#2575]) +14 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb5/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-ctm-negative:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#1149] / [i915#2575]) +8 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@kms_color@pipe-b-ctm-negative.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([fdo#109278] / [i915#1149] / [i915#2575]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109278] / [i915#2575]) +49 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2575]) +266 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271]) +731 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271]) +695 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#5341])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#111615] / [i915#2575]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@perf@non-sampling-read-error:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#5608]) +15 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@perf@non-sampling-read-error.html

  * igt@perf_pmu@rc6-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([i915#5608]) +27 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb4/igt@perf_pmu@rc6-suspend.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109291]) +7 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_test@nv_write_i915_cpu_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109291]) +6 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@prime_nv_test@nv_write_i915_cpu_mmap_read.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109307] / [fdo#109315] / [i915#2575])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@tools_test@sysfs_l3_parity.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@basic:
    - shard-glk:          [FAIL][124] ([i915#5602]) -> [SKIP][125] ([fdo#109271])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk5/igt@gem_lmem_swapping@basic.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk2/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          [SKIP][126] ([fdo#109271]) -> [FAIL][127] ([i915#5602])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl8/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-apl:          [SKIP][128] ([fdo#109271] / [i915#5602]) -> [FAIL][129] ([i915#5602])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-apl2/igt@gem_lmem_swapping@heavy-verify-random.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl7/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@random:
    - shard-apl:          [FAIL][130] -> [FAIL][131] ([i915#5602]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-apl1/igt@gem_lmem_swapping@random.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl7/igt@gem_lmem_swapping@random.html
    - shard-glk:          [FAIL][132] -> [SKIP][133] ([fdo#109271]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk5/igt@gem_lmem_swapping@random.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          [FAIL][134] ([i915#5602]) -> [SKIP][135] ([fdo#109271] / [i915#5602])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk4/igt@gem_lmem_swapping@random-engines.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk7/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          [SKIP][136] ([fdo#109271] / [i915#5602]) -> [SKIP][137] ([fdo#109271])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-apl2/igt@gem_lmem_swapping@verify-random.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl4/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_module_load@reload-no-display:
    - shard-glk:          [INCOMPLETE][138] -> [INCOMPLETE][139] ([i915#5602])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk2/igt@i915_module_load@reload-no-display.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk8/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-apl:          [INCOMPLETE][140] ([i915#1373]) -> [DMESG-WARN][141] ([i915#5602])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-apl3/igt@i915_module_load@reload-with-fault-injection.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl6/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [INCOMPLETE][142] -> [DMESG-WARN][143] ([i915#5602])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk9/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@sanitycheck:
    - shard-glk:          [DMESG-FAIL][144] -> [DMESG-FAIL][145] ([i915#5602])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk9/igt@i915_selftest@live@sanitycheck.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/igt@i915_selftest@live@sanitycheck.html
    - shard-apl:          [DMESG-FAIL][146] -> [DMESG-FAIL][147] ([i915#5602])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-apl6/igt@i915_selftest@live@sanitycheck.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl6/igt@i915_selftest@live@sanitycheck.html

  * igt@runner@aborted:
    - shard-tglb:         ([FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161], [FAIL][162], [FAIL][163], [FAIL][164], [FAIL][165], [FAIL][166], [FAIL][167]) ([i915#1759] / [i915#3690] / [i915#4312] / [i915#5257]) -> ([FAIL][168], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL][174], [FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179], [FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187]) ([i915#3690] / [i915#4312] / [i915#5257])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb1/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb8/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb1/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb5/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb1/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb6/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb6/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb3/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb8/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb2/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb6/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb7/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb8/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb5/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb3/igt@runner@aborted.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb5/igt@runner@aborted.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb7/igt@runner@aborted.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb8/igt@runner@aborted.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb3/igt@runner@aborted.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@runner@aborted.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@runner@aborted.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@runner@aborted.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@runner@aborted.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@runner@aborted.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb3/igt@runner@aborted.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb1/igt@runner@aborted.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb1/igt@runner@aborted.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@runner@aborted.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@runner@aborted.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb1/igt@runner@aborted.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@runner@aborted.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb3/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html

--===============3042668630263556235==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Add support for connector &amp; crtc debugfs=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102387/">https://patchwork.freedesktop.org/series/102387/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6902/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11474_full -&gt; IGTPW_6902_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6902_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6902_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.=
html</p>
<h2>Participating hosts (10 -&gt; 6)</h2>
<p>Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6902=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-tglb7/igt@core_setmaster@master-drop-set-shar=
ed-fd.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-iclb2/igt@core_setmaster@master-drop-set-shar=
ed-fd.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-apl7/igt@fbdev@pan.html">FAIL</a> +2 similar =
issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-glk7/igt@fbdev@pan.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb3/igt@gem_lmem_swapping@smem-oom.html">F=
AIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@i915_module_load@reload-no-display.=
html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-tglb1/igt@i915_selftest@live.html">FAIL</a> +=
5 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-kbl7/igt@i915_selftest@live.html">FAIL</a> +7=
 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-apl4/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard=
-apl1/igt@gem_lmem_swapping@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-kbl4/igt@gem_lmem_swapping@heavy-multi.html">FAIL</a> (=
[i915#5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6902/shard-kbl1/igt@gem_lmem_swapping@heavy-multi.html">FAIL</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-glk3/igt@gem_lmem_swapping@parallel-multi.html">FAIL</a=
> ([i915#5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6902/shard-glk6/igt@gem_lmem_swapping@parallel-multi.html">FAIL</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-iclb8/igt@gem_lmem_swapping@random-engines.html">FAIL</=
a> ([i915#5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6902/shard-iclb4/igt@gem_lmem_swapping@random-engines.html">FAIL</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-glk2/igt@gem_lmem_swapping@verify-random.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_690=
2/shard-glk4/igt@gem_lmem_swapping@verify-random.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-kbl1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_690=
2/shard-kbl7/igt@gem_lmem_swapping@verify-random.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-kbl6/igt@i915_module_load@reload-with-fault-injection.h=
tml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6902/shard-kbl1/igt@i915_module_load@reload-with-fault-injection.h=
tml">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-glk3/igt@i915_selftest@perf@engine_cs.html">DMESG-FAIL<=
/a> ([i915#5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6902/shard-glk1/igt@i915_selftest@perf@engine_cs.html">DMESG-FAIL</a=
></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11474/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11474/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl7/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1474/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl6/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1147=
4/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/s=
hard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shar=
d-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11474/shard-kbl1/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-k=
bl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_11474/shard-kbl3/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-kbl3=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_11474/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i=
915#1814] / [i915#4312] / [i915#5257] / [i915#92]) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6902/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/sh=
ard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl=
3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6902/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl3/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6902/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
902/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/sha=
rd-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6902/shard-kbl6/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl7=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl6/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6902/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-kbl6/igt@runner@ab=
orted.html">FAIL</a>) ([i915#4312] / [i915#5257] / [i915#92])</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11474/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11474/shard-glk5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk5/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1474/shard-glk5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk4/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1147=
4/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-glk3/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/s=
hard-glk3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11474/shard-glk2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shar=
d-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11474/shard-glk1/igt@runner@aborted.html">FAIL</a=
>) ([i915#4312] / [i915#5257]) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6902/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6902/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6902/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6902/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk2/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/sh=
ard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6902/shard-glk5/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk=
5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk8/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6902/shard-glk9/igt@runner@aborted.html">FAIL</a>) ([i915#4312=
])</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@i915_suspend@system-suspend-without-i915}:<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb3/igt@i915_suspend@system-suspend-withou=
t-i915.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6902_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@gem_create@create-clear.html">SKIP=
</a> ([fdo#109315] / [i915#2575]) +336 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@gem_exec_fence@basic-await.html">S=
KIP</a> ([fdo#109315]) +552 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@invalid-bsd1-flag-on-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb5/igt@gem_exec_params@invalid-bsd1-flag-=
on-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109276">fdo#109276</a> / [fdo#109315]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-tglb8/igt@gem_exec_params@no-blt.html">SKIP</=
a> ([fdo#109283] / [fdo#109315] / [i915#2575])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-iclb5/igt@gem_exec_params@no-blt.html">SKIP</=
a> ([fdo#109283] / [fdo#109315]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-glk7/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">FAIL</a> ([i915#5602]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-apl8/igt@gem_lmem_swapping@smem-oom.html">FA=
IL</a> ([i915#5602])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-iclb5/igt@gem_tiled_swapping@non-threaded.htm=
l">SKIP</a> ([fdo#109315] / [i915#2613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6902/shard-tglb1/igt@gem_tiled_swapping@non-threaded.htm=
l">SKIP</a> ([fdo#109315] / [i915#2575] / [i915#2613])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@i915_module_load@reload-with-fault=
-injection.html">DMESG-WARN</a> ([i915#5602])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-glk8/igt@i915_pm_backlight@bad-brightness.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +718 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-ac=
curacy.html">SKIP</a> ([fdo#109315] / [fdo#111719] / [i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb4/igt@i915_pm_rpm@debugfs-forcewake-user=
.html">SKIP</a> ([i915#5174]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress.htm=
l">SKIP</a> ([i915#5174]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@master-rmfb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb7/igt@kms_addfb_basic@master-rmfb.html">=
SKIP</a> ([i915#2575]) +366 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@kms_big_fb@yf-tiled-16bpp-rotate-9=
0.html">SKIP</a> ([fdo#109315] / [fdo#111615] / [i915#2575]) +14 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@kms_ccs@pipe-d-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_">fdo#109278</a> / [fdo#109315]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb5/igt@kms_color@pipe-b-ctm-0-25.html">SK=
IP</a> ([i915#1149] / [i915#2575]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-negative:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@kms_color@pipe-b-ctm-negative.html=
">SKIP</a> ([i915#1149] / [i915#2575]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_">fdo#109278</a=
> / [i915#1149] / [i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x10=
-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_">f=
do#109278</a> / [i915#2575]) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-right-edge:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@kms_cursor_edge_walk@pipe-a-256x25=
6-right-edge.html">SKIP</a> ([i915#2575]) +266 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-t=
op-edge.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a>) +731 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +695 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb1/igt@kms_pipe_crc_basic@compare-crc-san=
itycheck-pipe-c.html">SKIP</a> ([i915#5341])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-t=
iling-yf.html">SKIP</a> ([fdo#111615] / [i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@non-sampling-read-error:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@perf@non-sampling-read-error.html"=
>SKIP</a> ([i915#5608]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb4/igt@perf_pmu@rc6-suspend.html">SKIP</a=
> ([i915#5608]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html">SKIP</a> ([fdo#109291]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_cpu_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb2/igt@prime_nv_test@nv_write_i915_cpu_mm=
ap_read.html">SKIP</a> ([fdo#109291]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@tools_test@sysfs_l3_parity.html">S=
KIP</a> ([fdo#109307] / [fdo#109315] / [i915#2575])</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-glk5/igt@gem_lmem_swapping@basic.html">FAIL</a> ([i915#=
5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902=
/shard-glk2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902=
/shard-apl8/igt@gem_lmem_swapping@heavy-multi.html">FAIL</a> ([i915#5602])<=
/li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-apl2/igt@gem_lmem_swapping@heavy-verify-random.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / [i915#5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6902/shard-apl7/igt@gem_lmem_swapping@heavy-verify-random=
.html">FAIL</a> ([i915#5602])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-apl1/igt@gem_lmem_swapping@random.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-apl7/ig=
t@gem_lmem_swapping@random.html">FAIL</a> ([i915#5602]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-glk5/igt@gem_lmem_swapping@random.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-glk4/ig=
t@gem_lmem_swapping@random.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-glk4/igt@gem_lmem_swapping@random-engines.html">FAIL</a=
> ([i915#5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6902/shard-glk7/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a> / [i915#5602])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-apl2/igt@gem_lmem_swapping@verify-random.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#5602]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6902/shard-apl4/igt@gem_lmem_swapping@verify-random.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-glk2/igt@i915_module_load@reload-no-display.html">INCOM=
PLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
902/shard-glk8/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> =
([i915#5602])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-apl3/igt@i915_module_load@reload-with-fault-injection.ht=
ml">INCOMPLETE</a> ([i915#1373]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6902/shard-apl6/igt@i915_module_load@reload-with-faul=
t-injection.html">DMESG-WARN</a> ([i915#5602])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-glk8/igt@i915_module_load@reload-with-fault-injection.ht=
ml">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6902/shard-glk9/igt@i915_module_load@reload-with-fault-injection.ht=
ml">DMESG-WARN</a> ([i915#5602])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-glk9/igt@i915_selftest@live@sanitycheck.html">DMESG-FAIL=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/s=
hard-glk4/igt@i915_selftest@live@sanitycheck.html">DMESG-FAIL</a> ([i915#56=
02])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-apl6/igt@i915_selftest@live@sanitycheck.html">DMESG-FAIL=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/s=
hard-apl6/igt@i915_selftest@live@sanitycheck.html">DMESG-FAIL</a> ([i915#56=
02])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11474/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb2/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11474/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb8/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11474/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb5/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11474/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11474/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb3/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_11474/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11474/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11474/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb5/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_11474/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb5/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11474/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/shard-tglb8/igt@runner@aborted.h=
tml">FAIL</a>) ([i915#1759] / [i915#3690] / [i915#4312] / [i915#5257]) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tgl=
b3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb6/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6902/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb8/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6902/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb3/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6902/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6902/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902=
/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb7/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shar=
d-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tgl=
b5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb3/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6902/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/shard-tglb5/igt@run=
ner@aborted.html">FAIL</a>) ([i915#3690] / [i915#4312] / [i915#5257])</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3042668630263556235==--
