Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3974044208214170508=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 15 Jun 2023 08:00:44 -0000
Message-ID: <168681604488.10727.12059753032913962143@emeril.freedesktop.org>
References: <20230615021406.131572-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230615021406.131572-1-vitaly.prosyak@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_tests/amdgpu=3A_add_bo_tests?=
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

--===============3974044208214170508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/amdgpu: add bo tests
URL   : https://patchwork.freedesktop.org/series/119358/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7330 -> IGTPW_9174
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9174 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9174, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9174:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-cfl-guc:         [PASS][1] -> [WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
    - bat-mtlp-6:         [PASS][3] -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-x1275:       [PASS][5] -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
    - fi-skl-6600u:       [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-11:         [PASS][9] -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-soraka:      [PASS][11] -> [WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-guc:         [PASS][13] -> [WARN][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html
    - bat-adlm-1:         [PASS][15] -> [WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html
    - fi-rkl-11600:       [PASS][17] -> [WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-8109u:       [PASS][19] -> [WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_lmem_swapping@basic:
    - bat-atsm-1:         NOTRUN -> [FAIL][21] +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-atsm-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-dg1-5:          NOTRUN -> [FAIL][22] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-dg2-9:          NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-9/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-dg1-7:          NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-7/igt@gem_lmem_swapping@verify-random.html

  * igt@i915_module_load@reload:
    - bat-dg1-5:          [PASS][25] -> [WARN][26] +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@i915_module_load@reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@i915_module_load@reload.html
    - fi-pnv-d510:        [PASS][27] -> [WARN][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@i915_module_load@reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-pnv-d510/igt@i915_module_load@reload.html
    - bat-dg1-7:          [PASS][29] -> [WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@i915_module_load@reload.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-7/igt@i915_module_load@reload.html
    - bat-adlp-9:         [PASS][31] -> [WARN][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_module_load@reload.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@i915_module_load@reload.html
    - fi-kbl-7567u:       [PASS][33] -> [WARN][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_module_load@reload.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-7567u/igt@i915_module_load@reload.html
    - bat-adls-5:         [PASS][35] -> [WARN][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_module_load@reload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adls-5/igt@i915_module_load@reload.html
    - bat-dg2-9:          [PASS][37] -> [WARN][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@i915_module_load@reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-9/igt@i915_module_load@reload.html
    - fi-tgl-1115g4:      [PASS][39] -> [WARN][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_module_load@reload.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@i915_module_load@reload.html
    - bat-jsl-3:          [PASS][41] -> [WARN][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-3/igt@i915_module_load@reload.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-3/igt@i915_module_load@reload.html
    - bat-mtlp-8:         [PASS][43] -> [WARN][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_module_load@reload.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@i915_module_load@reload.html
    - bat-dg2-8:          [PASS][45] -> [WARN][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_module_load@reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@i915_module_load@reload.html
    - bat-jsl-1:          [PASS][47] -> [WARN][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-1/igt@i915_module_load@reload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-1/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-nick:        [PASS][49] -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
    - bat-kbl-2:          [PASS][51] -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_pm_rpm@module-reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@i915_pm_rpm@module-reload.html
    - bat-dg2-11:         [PASS][53] -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][55] -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-1:         [PASS][57] -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_pm_rpm@module-reload.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_pm_rpm@module-reload.html
    - bat-adlp-9:         [PASS][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
    - fi-rkl-11600:       [PASS][61] -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
    - bat-dg1-7:          [PASS][63] -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
    - bat-dg2-9:          [PASS][65] -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@i915_pm_rpm@module-reload.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-9/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][67] -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
    - bat-rpls-2:         [PASS][69] -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_pm_rpm@module-reload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@sanitycheck:
    - bat-rpls-2:         [PASS][71] -> [WARN][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@sanitycheck.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_selftest@live@sanitycheck.html
    - fi-ilk-650:         [PASS][73] -> [WARN][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html
    - bat-kbl-2:          [PASS][75] -> [WARN][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_selftest@live@sanitycheck.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@i915_selftest@live@sanitycheck.html
    - fi-ivb-3770:        [PASS][77] -> [WARN][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@i915_selftest@live@sanitycheck.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ivb-3770/igt@i915_selftest@live@sanitycheck.html
    - bat-rpls-1:         [PASS][79] -> [WARN][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@sanitycheck.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-adlm-1:         [PASS][81] -> [FAIL][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-pnv-d510:        [PASS][83] -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-dg1-5:          [PASS][85] -> [FAIL][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html
    - bat-jsl-3:          [PASS][87] -> [FAIL][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@vgem_basic@unload:
    - bat-mtlp-6:         [PASS][89] -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@vgem_basic@unload.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@vgem_basic@unload.html
    - fi-apl-guc:         [PASS][91] -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@vgem_basic@unload.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-apl-guc/igt@vgem_basic@unload.html
    - bat-rpls-2:         [PASS][93] -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@vgem_basic@unload.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@vgem_basic@unload.html
    - bat-dg2-11:         [PASS][95] -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@vgem_basic@unload.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@vgem_basic@unload.html
    - bat-atsm-1:         [PASS][97] -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@vgem_basic@unload.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-atsm-1/igt@vgem_basic@unload.html
    - fi-ivb-3770:        [PASS][99] -> [FAIL][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@vgem_basic@unload.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ivb-3770/igt@vgem_basic@unload.html
    - bat-mtlp-8:         [PASS][101] -> [SKIP][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@vgem_basic@unload.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@vgem_basic@unload.html
    - fi-elk-e7500:       [PASS][103] -> [FAIL][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-elk-e7500/igt@vgem_basic@unload.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-elk-e7500/igt@vgem_basic@unload.html
    - bat-dg2-8:          [PASS][105] -> [SKIP][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@vgem_basic@unload.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@vgem_basic@unload.html
    - bat-adlm-1:         [PASS][107] -> [SKIP][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@vgem_basic@unload.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlm-1/igt@vgem_basic@unload.html
    - bat-jsl-1:          [PASS][109] -> [FAIL][110] +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-1/igt@vgem_basic@unload.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-1/igt@vgem_basic@unload.html
    - fi-glk-j4005:       [PASS][111] -> [FAIL][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-glk-j4005/igt@vgem_basic@unload.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-glk-j4005/igt@vgem_basic@unload.html
    - bat-adlp-9:         [PASS][113] -> [SKIP][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@vgem_basic@unload.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@vgem_basic@unload.html
    - fi-rkl-11600:       [PASS][115] -> [SKIP][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@vgem_basic@unload.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-rkl-11600/igt@vgem_basic@unload.html
    - bat-adls-5:         [PASS][117] -> [SKIP][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@vgem_basic@unload.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adls-5/igt@vgem_basic@unload.html
    - bat-dg1-5:          [PASS][119] -> [SKIP][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@vgem_basic@unload.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@vgem_basic@unload.html
    - fi-tgl-1115g4:      [PASS][121] -> [SKIP][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@vgem_basic@unload.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@vgem_basic@unload.html

  
Known issues
------------

  Here are the changes found in IGTPW_9174 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        [PASS][123] -> [ABORT][124] ([i915#8011])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@core_auth@basic-auth.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-11/igt@core_auth@basic-auth.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         NOTRUN -> [ABORT][125] ([i915#6687] / [i915#7978])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_module_load@load:
    - bat-adlp-11:        [PASS][126] -> [DMESG-WARN][127] ([i915#4423])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - fi-bsw-nick:        [PASS][128] -> [WARN][129] ([i915#6596])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@i915_module_load@reload.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-nick/igt@i915_module_load@reload.html
    - fi-bsw-n3050:       [PASS][130] -> [WARN][131] ([i915#6596])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_module_load@reload.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-n3050/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [PASS][132] -> [DMESG-FAIL][133] ([i915#7059])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@gt_pm:
    - bat-rpls-2:         [PASS][134] -> [DMESG-FAIL][135] ([i915#4258] / [i915#7913])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@migrate:
    - bat-atsm-1:         [PASS][136] -> [DMESG-FAIL][137] ([i915#7699] / [i915#7913])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@i915_selftest@live@migrate.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-atsm-1/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [PASS][138] -> [TIMEOUT][139] ([i915#6794] / [i915#7392])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@mman.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [PASS][140] -> [FAIL][141] ([i915#6559])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-7567u:       [PASS][142] -> [FAIL][143] ([i915#6559]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-tgl-1115g4:      [PASS][144] -> [FAIL][145] ([i915#6559])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-cfl-guc:         [PASS][146] -> [FAIL][147] ([i915#6559]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-mtlp-6:         [PASS][148] -> [FAIL][149] ([i915#6559])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-x1275:       [PASS][150] -> [FAIL][151] ([i915#6559])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-rpls-2:         NOTRUN -> [FAIL][152] ([i915#6559]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-skl-6600u:       [PASS][153] -> [FAIL][154] ([i915#6559]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@i915_suspend@basic-s2idle-without-i915.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-6600u/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-dg2-8:          [PASS][155] -> [FAIL][156] ([i915#6559])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_suspend@basic-s2idle-without-i915.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-guc:         [PASS][157] -> [FAIL][158] ([i915#6559])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-adls-5:         [PASS][159] -> [FAIL][160] ([i915#8210])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
    - bat-adlp-9:         [PASS][161] -> [FAIL][162] ([i915#6559] / [i915#8210])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html
    - fi-ilk-650:         [PASS][163] -> [FAIL][164] ([i915#6559])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@i915_suspend@basic-s3-without-i915.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ilk-650/igt@i915_suspend@basic-s3-without-i915.html
    - fi-skl-guc:         [PASS][165] -> [FAIL][166] ([i915#6559])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html
    - bat-kbl-2:          [PASS][167] -> [FAIL][168] ([i915#6559])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
    - fi-hsw-4770:        [PASS][169] -> [FAIL][170] ([i915#6559])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html
    - bat-rpls-1:         NOTRUN -> [FAIL][171] ([i915#6559])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][172] ([i915#7828])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][173] -> [FAIL][174] ([i915#7932])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-2:         NOTRUN -> [SKIP][175] ([i915#2575]) +3 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@vgem_basic@unload:
    - fi-skl-6600u:       [PASS][176] -> [SKIP][177] ([fdo#109271])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@vgem_basic@unload.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-6600u/igt@vgem_basic@unload.html
    - fi-skl-guc:         [PASS][178] -> [SKIP][179] ([fdo#109271])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@vgem_basic@unload.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-guc/igt@vgem_basic@unload.html
    - fi-cfl-8700k:       [PASS][180] -> [SKIP][181] ([fdo#109271])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@vgem_basic@unload.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-8700k/igt@vgem_basic@unload.html
    - fi-bsw-nick:        [PASS][182] -> [SKIP][183] ([fdo#109271])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@vgem_basic@unload.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-nick/igt@vgem_basic@unload.html
    - bat-kbl-2:          [PASS][184] -> [SKIP][185] ([fdo#109271])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@vgem_basic@unload.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@vgem_basic@unload.html
    - fi-kbl-soraka:      [PASS][186] -> [SKIP][187] ([fdo#109271])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@vgem_basic@unload.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-soraka/igt@vgem_basic@unload.html
    - fi-kbl-guc:         [PASS][188] -> [SKIP][189] ([fdo#109271])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@vgem_basic@unload.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-guc/igt@vgem_basic@unload.html
    - fi-pnv-d510:        [PASS][190] -> [SKIP][191] ([fdo#109271])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@vgem_basic@unload.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-pnv-d510/igt@vgem_basic@unload.html
    - fi-kbl-7567u:       [PASS][192] -> [SKIP][193] ([fdo#109271])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@vgem_basic@unload.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-7567u/igt@vgem_basic@unload.html
    - fi-cfl-guc:         [PASS][194] -> [SKIP][195] ([fdo#109271])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@vgem_basic@unload.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@vgem_basic@unload.html
    - fi-kbl-x1275:       [PASS][196] -> [SKIP][197] ([fdo#109271])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@vgem_basic@unload.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@vgem_basic@unload.html
    - fi-ilk-650:         [PASS][198] -> [SKIP][199] ([fdo#109271])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@vgem_basic@unload.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ilk-650/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][200] ([i915#5334]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [DMESG-WARN][202] ([i915#7699]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][204] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@reset.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][206] ([i915#6367]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-6:         [DMESG-FAIL][208] ([i915#6763]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:
    - bat-dg2-11:         [INCOMPLETE][210] ([i915#7908]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-tgl-1115g4:      [INCOMPLETE][212] ([i915#7443] / [i915#8102]) -> [FAIL][213] ([i915#6559])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
    - fi-kbl-x1275:       [SKIP][214] ([fdo#109271]) -> [FAIL][215] ([i915#6559])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html
    - bat-mtlp-8:         [SKIP][216] ([i915#6645]) -> [FAIL][217] ([i915#6559])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6596]: https://gitlab.freedesktop.org/drm/intel/issues/6596
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7908]: https://gitlab.freedesktop.org/drm/intel/issues/7908
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8102]: https://gitlab.freedesktop.org/drm/intel/issues/8102
  [i915#8210]: https://gitlab.freedesktop.org/drm/intel/issues/8210
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7330 -> IGTPW_9174

  CI-20190529: 20190529
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9174: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/index.html
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/index.html

--===============3974044208214170508==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/amdgpu: add bo tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119358/">https://patchwork.freedesktop.org/series/119358/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7330 -&gt; IGTPW_9174</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9174 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9174, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9174:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-6600u/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-soraka/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-atsm-1/igt@gem_lmem_swapping@basic.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@gem_lmem_swapping@parallel-random-engines.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-9/igt@gem_lmem_swapping@random-engines.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-7/igt@gem_lmem_swapping@verify-random.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@i915_module_load@reload.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-pnv-d510/igt@i915_module_load@reload.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-7/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@i915_module_load@reload.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-7567u/igt@i915_module_load@reload.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adls-5/igt@i915_module_load@reload.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-9/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-3/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-3/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-1/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-1/igt@i915_module_load@reload.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-7/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-9/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_selftest@live@sanitycheck.html">WARN</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html">WARN</a></p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@i915_selftest@live@sanitycheck.html">WARN</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ivb-3770/igt@i915_selftest@live@sanitycheck.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_selftest@live@sanitycheck.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-apl-guc/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-atsm-1/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ivb-3770/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-elk-e7500/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-elk-e7500/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlm-1/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-jsl-1/igt@vgem_basic@unload.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-glk-j4005/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-glk-j4005/igt@vgem_basic@unload.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-rkl-11600/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adls-5/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg1-5/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9174 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-nick/igt@i915_module_load@reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6596">i915#6596</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-n3050/igt@i915_module_load@reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6596">i915#6596</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-atsm-1/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>) +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>) +1 similar issue</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-6600u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>) +1 similar issue</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8210">i915#8210</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8210">i915#8210</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ilk-650/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-guc/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-6600u/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-skl-guc/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-8700k/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-bsw-nick/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-kbl-2/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-soraka/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-guc/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-pnv-d510/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-7567u/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-cfl-guc/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-ilk-650/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763">i915#6763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7908">i915#7908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8102">i915#8102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7330 -&gt; IGTPW_9174</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9174: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9174/index.html<br />
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3974044208214170508==--
