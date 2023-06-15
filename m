Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8003846595669008091=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 15 Jun 2023 07:53:41 -0000
Message-ID: <168681562152.10726.12567441876972287280@emeril.freedesktop.org>
References: <20230615021224.130803-1-vitaly.prosyak@amd.com>
In-Reply-To: <20230615021224.130803-1-vitaly.prosyak@amd.com>
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

--===============8003846595669008091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/amdgpu: add bo tests
URL   : https://patchwork.freedesktop.org/series/119357/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7330 -> IGTPW_9173
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9173 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9173, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/index.html

Participating hosts (43 -> 42)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9173:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-cfl-guc:         [PASS][1] -> [WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
    - bat-mtlp-6:         [PASS][3] -> [WARN][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-x1275:       [PASS][5] -> [WARN][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
    - fi-skl-guc:         [PASS][7] -> [WARN][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-guc:         [PASS][9] -> [WARN][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html
    - bat-adlm-1:         [PASS][11] -> [WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html
    - bat-mtlp-8:         [PASS][13] -> [WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html
    - bat-rpls-1:         [PASS][15] -> [WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@core_hotunplug@unbind-rebind.html
    - fi-rkl-11600:       [PASS][17] -> [WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
    - bat-dg1-5:          [PASS][19] -> [WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@core_hotunplug@unbind-rebind.html
    - bat-dg1-7:          [PASS][21] -> [WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_lmem_swapping@basic:
    - bat-atsm-1:         NOTRUN -> [FAIL][23] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@gem_lmem_swapping@basic.html
    - bat-dg2-11:         NOTRUN -> [FAIL][24] +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@gem_lmem_swapping@basic.html
    - bat-dg2-8:          NOTRUN -> [FAIL][25] +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@gem_lmem_swapping@basic.html
    - bat-dg1-7:          NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random-engines:
    - bat-dg1-5:          NOTRUN -> [FAIL][27] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_module_load@reload:
    - bat-adlp-9:         [PASS][28] -> [WARN][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_module_load@reload.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-9/igt@i915_module_load@reload.html
    - fi-kbl-7567u:       [PASS][30] -> [WARN][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_module_load@reload.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-7567u/igt@i915_module_load@reload.html
    - bat-adls-5:         [PASS][32] -> [WARN][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_module_load@reload.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adls-5/igt@i915_module_load@reload.html
    - fi-cfl-8109u:       [PASS][34] -> [WARN][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_module_load@reload.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8109u/igt@i915_module_load@reload.html
    - fi-tgl-1115g4:      [PASS][36] -> [WARN][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_module_load@reload.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-tgl-1115g4/igt@i915_module_load@reload.html
    - bat-kbl-2:          [PASS][38] -> [WARN][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_module_load@reload.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-kbl-2/igt@i915_module_load@reload.html
    - bat-atsm-1:         [PASS][40] -> [WARN][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@i915_module_load@reload.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@i915_module_load@reload.html
    - fi-hsw-4770:        [PASS][42] -> [WARN][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-hsw-4770/igt@i915_module_load@reload.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-hsw-4770/igt@i915_module_load@reload.html
    - fi-ivb-3770:        [PASS][44] -> [WARN][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@i915_module_load@reload.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ivb-3770/igt@i915_module_load@reload.html
    - bat-dg2-8:          [PASS][46] -> [WARN][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_module_load@reload.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-nick:        [PASS][48] -> [FAIL][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
    - fi-apl-guc:         [PASS][50] -> [FAIL][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
    - bat-jsl-3:          [PASS][52] -> [FAIL][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-3/igt@i915_pm_rpm@module-reload.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-jsl-3/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-soraka:      [PASS][54] -> [FAIL][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html
    - bat-mtlp-8:         [PASS][56] -> [FAIL][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html
    - bat-dg2-8:          [PASS][58] -> [FAIL][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_pm_rpm@module-reload.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@i915_pm_rpm@module-reload.html
    - bat-adlm-1:         [PASS][60] -> [FAIL][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@i915_pm_rpm@module-reload.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlm-1/igt@i915_pm_rpm@module-reload.html
    - bat-jsl-1:          [PASS][62] -> [FAIL][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-1/igt@i915_pm_rpm@module-reload.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-jsl-1/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][64] -> [WARN][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - bat-dg2-9:          [PASS][66] -> [FAIL][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@i915_pm_rpm@module-reload.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-x1275:       [PASS][68] -> [FAIL][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8109u:       [PASS][70] -> [FAIL][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-7567u:       [PASS][72] -> [FAIL][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
    - bat-mtlp-6:         [PASS][74] -> [FAIL][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_pm_rpm@module-reload.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-8700k:       [PASS][76] -> [FAIL][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - bat-dg2-9:          NOTRUN -> [SKIP][78]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem_contexts:
    - bat-mtlp-8:         [PASS][79] -> [INCOMPLETE][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@sanitycheck:
    - fi-ilk-650:         [PASS][81] -> [WARN][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html
    - fi-blb-e6850:       [PASS][83] -> [WARN][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-blb-e6850/igt@i915_selftest@live@sanitycheck.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-blb-e6850/igt@i915_selftest@live@sanitycheck.html
    - fi-cfl-8700k:       [PASS][85] -> [WARN][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@i915_selftest@live@sanitycheck.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8700k/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-rkl-11600:       [PASS][87] -> [FAIL][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@i915_suspend@basic-s2idle-without-i915.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-rkl-11600/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-adls-5:         [PASS][89] -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_suspend@basic-s2idle-without-i915.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adls-5/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-dg1-5:          [PASS][91] -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-pnv-d510:        [PASS][93] -> [FAIL][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-adlp-9:         [PASS][95] -> [FAIL][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-blb-e6850:       [PASS][97] -> [FAIL][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-blb-e6850/igt@i915_suspend@basic-s3-without-i915.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-blb-e6850/igt@i915_suspend@basic-s3-without-i915.html

  * igt@vgem_basic@unload:
    - bat-mtlp-6:         [PASS][99] -> [SKIP][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@vgem_basic@unload.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@vgem_basic@unload.html
    - bat-atsm-1:         [PASS][101] -> [SKIP][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@vgem_basic@unload.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@vgem_basic@unload.html
    - fi-hsw-4770:        [PASS][103] -> [FAIL][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-hsw-4770/igt@vgem_basic@unload.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-hsw-4770/igt@vgem_basic@unload.html
    - fi-ivb-3770:        [PASS][105] -> [FAIL][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@vgem_basic@unload.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ivb-3770/igt@vgem_basic@unload.html
    - bat-dg2-8:          [PASS][107] -> [SKIP][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@vgem_basic@unload.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@vgem_basic@unload.html
    - bat-rpls-1:         [PASS][109] -> [SKIP][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@vgem_basic@unload.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@vgem_basic@unload.html
    - bat-dg1-7:          [PASS][111] -> [SKIP][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@vgem_basic@unload.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@vgem_basic@unload.html
    - fi-glk-j4005:       [PASS][113] -> [FAIL][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-glk-j4005/igt@vgem_basic@unload.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-glk-j4005/igt@vgem_basic@unload.html
    - bat-dg1-5:          [PASS][115] -> [SKIP][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@vgem_basic@unload.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@vgem_basic@unload.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-atsm-1:         [SKIP][117] ([i915#6645]) -> [FAIL][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html

  
Known issues
------------

  Here are the changes found in IGTPW_9173 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-11:        [PASS][119] -> [ABORT][120] ([i915#8011])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@core_auth@basic-auth.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-11/igt@core_auth@basic-auth.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-rpls-2:         NOTRUN -> [ABORT][121] ([i915#6687] / [i915#7964])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         NOTRUN -> [ABORT][122] ([i915#6687] / [i915#7978])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_module_load@load:
    - bat-adlp-11:        [PASS][123] -> [DMESG-WARN][124] ([i915#4423])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - fi-kbl-x1275:       [PASS][125] -> [WARN][126] ([i915#6596])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_module_load@reload.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@i915_module_load@reload.html
    - fi-bsw-n3050:       [PASS][127] -> [WARN][128] ([i915#6596])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_module_load@reload.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-7:          [PASS][129] -> [ABORT][130] ([i915#4983])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@i915_selftest@live@hangcheck.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-WARN][131] ([i915#6367])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@i915_selftest@live@slpc.html
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][132] ([i915#6367])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - bat-mtlp-8:         [PASS][133] -> [DMESG-FAIL][134] ([i915#6763])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [PASS][135] -> [FAIL][136] ([i915#6559]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-mtlp-6:         [PASS][137] -> [FAIL][138] ([i915#6559])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-rpls-2:         NOTRUN -> [FAIL][139] ([i915#6559]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-skl-guc:         [PASS][140] -> [FAIL][141] ([i915#6559]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-skl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-cfl-8700k:       [PASS][142] -> [FAIL][143] ([i915#6559])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-ivb-3770:        [PASS][144] -> [FAIL][145] ([i915#6559])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-bsw-n3050:       [PASS][146] -> [FAIL][147] ([i915#6559])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-adls-5:         [PASS][148] -> [FAIL][149] ([i915#8210])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
    - fi-cfl-guc:         [PASS][150] -> [FAIL][151] ([i915#6559])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@i915_suspend@basic-s3-without-i915.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-guc/igt@i915_suspend@basic-s3-without-i915.html
    - fi-skl-6600u:       [PASS][152] -> [FAIL][153] ([i915#6559])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html
    - bat-dg2-11:         [PASS][154] -> [FAIL][155] ([i915#6559])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
    - bat-kbl-2:          [PASS][156] -> [FAIL][157] ([i915#6559])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html
    - fi-kbl-guc:         [PASS][158] -> [FAIL][159] ([i915#6559])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@i915_suspend@basic-s3-without-i915.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-guc/igt@i915_suspend@basic-s3-without-i915.html
    - bat-rpls-1:         NOTRUN -> [FAIL][160] ([i915#6559])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][161] ([i915#7828])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-tgl-1115g4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:
    - bat-dg2-8:          [PASS][162] -> [FAIL][163] ([i915#7932]) +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3:
    - bat-dg2-9:          [PASS][164] -> [FAIL][165] ([fdo#103375] / [i915#7932])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3:
    - bat-dg2-9:          [PASS][166] -> [FAIL][167] ([fdo#103375]) +1 similar issue
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html

  * igt@vgem_basic@unload:
    - fi-bsw-n3050:       [PASS][168] -> [SKIP][169] ([fdo#109271])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@vgem_basic@unload.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][170] ([i915#5334]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
    - fi-kbl-soraka:      [DMESG-FAIL][172] ([i915#5334] / [i915#7872]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-dg2-11:         [DMESG-WARN][174] ([i915#7699]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][176] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@reset.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@i915_selftest@live@reset.html
    - bat-rpls-2:         [ABORT][178] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@reset.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][180] ([i915#6367]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:
    - bat-dg2-11:         [INCOMPLETE][182] ([i915#7908]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-tgl-1115g4:      [INCOMPLETE][184] ([i915#7443] / [i915#8102]) -> [FAIL][185] ([i915#6559])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
    - bat-mtlp-6:         [SKIP][186] ([i915#6645]) -> [FAIL][187] ([i915#6121] / [i915#6559])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
    - fi-kbl-x1275:       [SKIP][188] ([fdo#109271]) -> [FAIL][189] ([i915#6559])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6596]: https://gitlab.freedesktop.org/drm/intel/issues/6596
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6763]: https://gitlab.freedesktop.org/drm/intel/issues/6763
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7908]: https://gitlab.freedesktop.org/drm/intel/issues/7908
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7964]: https://gitlab.freedesktop.org/drm/intel/issues/7964
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8102]: https://gitlab.freedesktop.org/drm/intel/issues/8102
  [i915#8210]: https://gitlab.freedesktop.org/drm/intel/issues/8210
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7330 -> IGTPW_9173

  CI-20190529: 20190529
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9173: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/index.html
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/index.html

--===============8003846595669008091==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119357/">https://patchwork.freedesktop.org/series/119357/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7330 -&gt; IGTPW_9173</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9173 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9173, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/index.html</p>
<h2>Participating hosts (43 -&gt; 42)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9173:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-guc/igt@core_hotunplug@unbind-rebind.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlm-1/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@gem_lmem_swapping@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@gem_lmem_swapping@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@gem_lmem_swapping@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@gem_lmem_swapping@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@gem_lmem_swapping@random-engines.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-9/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-7567u/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adls-5/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8109u/igt@i915_module_load@reload.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-tgl-1115g4/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-kbl-2/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-hsw-4770/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-hsw-4770/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ivb-3770/igt@i915_module_load@reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@i915_module_load@reload.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-3/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-jsl-3/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-soraka/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlm-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlm-1/igt@i915_pm_rpm@module-reload.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-jsl-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-jsl-1/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8700k/igt@i915_pm_rpm@module-reload.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@i915_selftest@live.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ilk-650/igt@i915_selftest@live@sanitycheck.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-blb-e6850/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-blb-e6850/igt@i915_selftest@live@sanitycheck.html">WARN</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@i915_selftest@live@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8700k/igt@i915_selftest@live@sanitycheck.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-rkl-11600/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-rkl-11600/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adls-5/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-9/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-blb-e6850/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-blb-e6850/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-hsw-4770/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-hsw-4770/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ivb-3770/igt@vgem_basic@unload.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-glk-j4005/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-glk-j4005/igt@vgem_basic@unload.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-5/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-5/igt@vgem_basic@unload.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9173 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-11/igt@core_auth@basic-auth.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7964">i915#7964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@i915_module_load@reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6596">i915#6596</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@i915_module_load@reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6596">i915#6596</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg1-7/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg1-7/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6763">i915#6763</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>) +1 similar issue</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-skl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-8700k/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8210">i915#8210</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-cfl-guc/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-cfl-guc/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-skl-6600u/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-kbl-2/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-guc/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-guc/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-tgl-1115g4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-bsw-n3050/igt@vgem_basic@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-bsw-n3050/igt@vgem_basic@unload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7908">i915#7908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8102">i915#8102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7330/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6559">i915#6559</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7330 -&gt; IGTPW_9173</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13270: a8b181a60198ccf04a1ad1c34f46be4c2a5e64b7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9173: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9173/index.html<br />
  IGT_7330: 592a0e56412b3323fb103ce3cc9977035c29f402 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8003846595669008091==--
