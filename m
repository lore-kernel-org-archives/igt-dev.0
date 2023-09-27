Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3169414216928964928=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Wed, 27 Sep 2023 15:38:36 -0000
Message-ID: <169582911672.20756.1499948263606219891@emeril.freedesktop.org>
References: <20230927143444.76363-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230927143444.76363-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJtdGVz?=
 =?utf-8?q?t_changes_for_running_tests_on_multi-gpu_=28rev3=29?=
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

--===============3169414216928964928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drmtest changes for running tests on multi-gpu (rev3)
URL   : https://patchwork.freedesktop.org/series/123991/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13685 -> IGTPW_9888
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9888 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9888, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/index.html

Participating hosts (39 -> 33)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (7): fi-rkl-11600 fi-cfl-guc fi-snb-2520m fi-ivb-3770 fi-pnv-d510 bat-dg2-14 fi-bsw-nick 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9888:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bsw-n3050:       [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-9:          [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-x1275:       [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html
    - bat-mtlp-8:         [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_close_race@basic-process:
    - bat-rplp-1:         [PASS][9] -> [SKIP][10] +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rplp-1/igt@gem_close_race@basic-process.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rplp-1/igt@gem_close_race@basic-process.html

  * igt@gem_exec_gttfill@basic:
    - bat-adln-1:         [PASS][11] -> [SKIP][12] +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adln-1/igt@gem_exec_gttfill@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adln-1/igt@gem_exec_gttfill@basic.html

  * igt@gem_ringfill@basic-all:
    - bat-adls-5:         [PASS][13] -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@gem_ringfill@basic-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@gem_ringfill@basic-all.html
    - bat-dg1-5:          [PASS][15] -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@gem_ringfill@basic-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@gem_ringfill@basic-all.html
    - bat-atsm-1:         [PASS][17] -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-atsm-1/igt@gem_ringfill@basic-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-atsm-1/igt@gem_ringfill@basic-all.html
    - bat-jsl-3:          [PASS][19] -> [SKIP][20] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@gem_ringfill@basic-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@gem_ringfill@basic-all.html
    - bat-adlp-9:         [PASS][21] -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@gem_ringfill@basic-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@gem_ringfill@basic-all.html
    - bat-dg2-11:         [PASS][23] -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@gem_ringfill@basic-all.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@gem_ringfill@basic-all.html
    - bat-adlp-11:        [PASS][25] -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-11/igt@gem_ringfill@basic-all.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-11/igt@gem_ringfill@basic-all.html
    - bat-rpls-1:         [PASS][27] -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@gem_ringfill@basic-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@gem_ringfill@basic-all.html
    - bat-adlp-6:         [PASS][29] -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@gem_ringfill@basic-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@gem_ringfill@basic-all.html

  * igt@i915_module_load@load:
    - fi-ilk-650:         [PASS][31] -> [FAIL][32] +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-ilk-650/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-ilk-650/igt@i915_module_load@load.html
    - bat-jsl-1:          [PASS][33] -> [FAIL][34] +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@i915_module_load@load.html
    - fi-blb-e6850:       [PASS][35] -> [FAIL][36] +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-blb-e6850/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-blb-e6850/igt@i915_module_load@load.html
    - bat-rpls-1:         [PASS][37] -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@i915_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@i915_module_load@load.html
    - bat-adlp-6:         [PASS][39] -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@i915_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@i915_module_load@load.html
    - bat-adls-5:         [PASS][41] -> [FAIL][42] +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@i915_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@i915_module_load@load.html
    - bat-jsl-3:          [PASS][43] -> [FAIL][44] +2 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@i915_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@i915_module_load@load.html
    - fi-kbl-7567u:       [PASS][45] -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-7567u/igt@i915_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-7567u/igt@i915_module_load@load.html
    - bat-adln-1:         [PASS][47] -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adln-1/igt@i915_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adln-1/igt@i915_module_load@load.html
    - fi-elk-e7500:       [PASS][49] -> [FAIL][50] +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-elk-e7500/igt@i915_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-elk-e7500/igt@i915_module_load@load.html
    - bat-adlm-1:         [PASS][51] -> [FAIL][52] +2 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlm-1/igt@i915_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlm-1/igt@i915_module_load@load.html
    - bat-rplp-1:         [PASS][53] -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rplp-1/igt@i915_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rplp-1/igt@i915_module_load@load.html
    - fi-tgl-1115g4:      [PASS][55] -> [FAIL][56] +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-tgl-1115g4/igt@i915_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-tgl-1115g4/igt@i915_module_load@load.html
    - bat-adlp-11:        [PASS][57] -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-11/igt@i915_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_module_load@reload:
    - bat-mtlp-6:         [PASS][59] -> [FAIL][60] +2 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-6/igt@i915_module_load@reload.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-6/igt@i915_module_load@reload.html
    - fi-skl-6600u:       [PASS][61] -> [FAIL][62] +2 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-6600u/igt@i915_module_load@reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-6600u/igt@i915_module_load@reload.html
    - fi-apl-guc:         [PASS][63] -> [FAIL][64] +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-apl-guc/igt@i915_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-apl-guc/igt@i915_module_load@reload.html
    - bat-dg1-5:          [PASS][65] -> [FAIL][66] +2 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@i915_module_load@reload.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@i915_module_load@reload.html
    - fi-glk-j4005:       [PASS][67] -> [FAIL][68] +2 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-glk-j4005/igt@i915_module_load@reload.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-glk-j4005/igt@i915_module_load@reload.html
    - bat-adlp-9:         [PASS][69] -> [FAIL][70] +2 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@i915_module_load@reload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@i915_module_load@reload.html
    - fi-skl-guc:         [PASS][71] -> [FAIL][72] +2 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-guc/igt@i915_module_load@reload.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-guc/igt@i915_module_load@reload.html
    - bat-dg2-11:         [PASS][73] -> [FAIL][74] +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@i915_module_load@reload.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@i915_module_load@reload.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][75] +2 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@i915_module_load@reload.html
    - fi-cfl-8700k:       [PASS][76] -> [FAIL][77] +2 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8700k/igt@i915_module_load@reload.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8700k/igt@i915_module_load@reload.html
    - bat-kbl-2:          [PASS][78] -> [FAIL][79] +2 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-kbl-2/igt@i915_module_load@reload.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-kbl-2/igt@i915_module_load@reload.html
    - bat-atsm-1:         [PASS][80] -> [FAIL][81] +2 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-atsm-1/igt@i915_module_load@reload.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-atsm-1/igt@i915_module_load@reload.html
    - fi-cfl-8109u:       [PASS][82] -> [FAIL][83] +2 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8109u/igt@i915_module_load@reload.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8109u/igt@i915_module_load@reload.html
    - fi-kbl-guc:         [PASS][84] -> [FAIL][85] +2 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-guc/igt@i915_module_load@reload.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-guc/igt@i915_module_load@reload.html

  * igt@prime_self_import@basic-with_fd_dup:
    - bat-mtlp-8:         [PASS][86] -> [SKIP][87] +11 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-8/igt@prime_self_import@basic-with_fd_dup.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-8/igt@prime_self_import@basic-with_fd_dup.html

  * igt@vgem_basic@second-client:
    - bat-adlm-1:         [PASS][88] -> [SKIP][89] +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlm-1/igt@vgem_basic@second-client.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlm-1/igt@vgem_basic@second-client.html
    - bat-mtlp-6:         [PASS][90] -> [SKIP][91] +11 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-6/igt@vgem_basic@second-client.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-6/igt@vgem_basic@second-client.html
    - bat-dg2-9:          [PASS][92] -> [SKIP][93] +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@vgem_basic@second-client.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@vgem_basic@second-client.html
    - bat-jsl-1:          [PASS][94] -> [SKIP][95] +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@vgem_basic@second-client.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@vgem_basic@second-client.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@load:
    - {bat-dg2-13}:       [PASS][96] -> [FAIL][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-13/igt@i915_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-13/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_9888 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@basic-auth:
    - bat-adlp-9:         [PASS][98] -> [SKIP][99] ([i915#2575]) +12 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@core_auth@basic-auth.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@core_auth@basic-auth.html
    - fi-kbl-7567u:       [PASS][100] -> [SKIP][101] ([fdo#109271])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-7567u/igt@core_auth@basic-auth.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-7567u/igt@core_auth@basic-auth.html

  * igt@gem_close_race@basic-process:
    - fi-blb-e6850:       [PASS][102] -> [SKIP][103] ([fdo#109271]) +13 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-blb-e6850/igt@gem_close_race@basic-process.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-blb-e6850/igt@gem_close_race@basic-process.html
    - bat-kbl-2:          [PASS][104] -> [SKIP][105] ([fdo#109271]) +14 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-kbl-2/igt@gem_close_race@basic-process.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-kbl-2/igt@gem_close_race@basic-process.html
    - bat-adlp-6:         [PASS][106] -> [SKIP][107] ([i915#2575]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@gem_close_race@basic-process.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@gem_close_race@basic-process.html

  * igt@gem_close_race@basic-threads:
    - bat-adln-1:         [PASS][108] -> [SKIP][109] ([i915#2575]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adln-1/igt@gem_close_race@basic-threads.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adln-1/igt@gem_close_race@basic-threads.html

  * igt@gem_exec_gttfill@basic:
    - bat-atsm-1:         [PASS][110] -> [SKIP][111] ([i915#2575]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-atsm-1/igt@gem_exec_gttfill@basic.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-atsm-1/igt@gem_exec_gttfill@basic.html
    - bat-jsl-3:          [PASS][112] -> [SKIP][113] ([i915#2575]) +12 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@gem_exec_gttfill@basic.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@gem_exec_gttfill@basic.html
    - bat-dg2-9:          [PASS][114] -> [SKIP][115] ([i915#2575]) +9 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@gem_exec_gttfill@basic.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][116] -> [INCOMPLETE][117] ([i915#9275])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_flink_basic@flink-lifetime:
    - fi-cfl-8700k:       [PASS][118] -> [SKIP][119] ([fdo#109271]) +14 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8700k/igt@gem_flink_basic@flink-lifetime.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8700k/igt@gem_flink_basic@flink-lifetime.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#2190])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_linear_blits@basic:
    - bat-rplp-1:         [PASS][121] -> [SKIP][122] ([i915#2575]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rplp-1/igt@gem_linear_blits@basic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rplp-1/igt@gem_linear_blits@basic.html
    - bat-adls-5:         [PASS][123] -> [SKIP][124] ([i915#2575]) +4 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@gem_linear_blits@basic.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@gem_linear_blits@basic.html
    - fi-apl-guc:         [PASS][125] -> [SKIP][126] ([fdo#109271]) +14 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-apl-guc/igt@gem_linear_blits@basic.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-apl-guc/igt@gem_linear_blits@basic.html
    - bat-dg1-5:          [PASS][127] -> [SKIP][128] ([i915#2575]) +9 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@gem_linear_blits@basic.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@gem_linear_blits@basic.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][129] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap_gtt@basic:
    - fi-kbl-x1275:       [PASS][130] -> [SKIP][131] ([fdo#109271]) +14 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-x1275/igt@gem_mmap_gtt@basic.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-x1275/igt@gem_mmap_gtt@basic.html
    - bat-adlp-11:        [PASS][132] -> [SKIP][133] ([i915#2575]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-11/igt@gem_mmap_gtt@basic.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-11/igt@gem_mmap_gtt@basic.html
    - fi-cfl-8109u:       [PASS][134] -> [SKIP][135] ([fdo#109271]) +14 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8109u/igt@gem_mmap_gtt@basic.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8109u/igt@gem_mmap_gtt@basic.html
    - fi-bsw-n3050:       [PASS][136] -> [SKIP][137] ([fdo#109271]) +11 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-bsw-n3050/igt@gem_mmap_gtt@basic.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-bsw-n3050/igt@gem_mmap_gtt@basic.html

  * igt@gem_ringfill@basic-all:
    - fi-skl-6600u:       [PASS][138] -> [SKIP][139] ([fdo#109271]) +14 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-6600u/igt@gem_ringfill@basic-all.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-6600u/igt@gem_ringfill@basic-all.html

  * igt@gem_tiled_blits@basic:
    - fi-kbl-guc:         [PASS][140] -> [SKIP][141] ([fdo#109271]) +14 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-guc/igt@gem_tiled_blits@basic.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-guc/igt@gem_tiled_blits@basic.html
    - bat-adlm-1:         [PASS][142] -> [SKIP][143] ([i915#2575]) +12 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlm-1/igt@gem_tiled_blits@basic.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlm-1/igt@gem_tiled_blits@basic.html
    - fi-ilk-650:         [PASS][144] -> [SKIP][145] ([fdo#109271]) +14 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-ilk-650/igt@gem_tiled_blits@basic.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-ilk-650/igt@gem_tiled_blits@basic.html
    - bat-jsl-1:          [PASS][146] -> [SKIP][147] ([i915#2575]) +12 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@gem_tiled_blits@basic.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@gem_tiled_blits@basic.html
    - fi-tgl-1115g4:      [PASS][148] -> [SKIP][149] ([i915#2575]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
    - bat-rpls-1:         [PASS][150] -> [SKIP][151] ([i915#2575]) +8 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@gem_tiled_blits@basic.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][152] ([i915#1886] / [i915#7913])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][153] ([fdo#109271]) +21 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-rpls-1:         [PASS][154] -> [ABORT][155] ([i915#9315])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@kms_force_connector_basic@force-connector-state.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@prime_self_import@basic-with_one_bo:
    - fi-skl-guc:         [PASS][156] -> [SKIP][157] ([fdo#109271]) +14 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-guc/igt@prime_self_import@basic-with_one_bo.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-guc/igt@prime_self_import@basic-with_one_bo.html
    - bat-dg2-11:         [PASS][158] -> [SKIP][159] ([i915#2575]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html
    - fi-tgl-1115g4:      [PASS][160] -> [SKIP][161] ([fdo#109315] / [i915#2575]) +7 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-glk-j4005:       [PASS][162] -> [SKIP][163] ([fdo#109271]) +14 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-glk-j4005/igt@prime_self_import@basic-with_one_bo_two_files.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-glk-j4005/igt@prime_self_import@basic-with_one_bo_two_files.html

  * igt@prime_self_import@basic-with_two_bos:
    - bat-adls-5:         [PASS][164] -> [SKIP][165] ([fdo#109315] / [i915#2575]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@prime_self_import@basic-with_two_bos.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@prime_self_import@basic-with_two_bos.html

  * igt@vgem_basic@second-client:
    - fi-elk-e7500:       [PASS][166] -> [SKIP][167] ([fdo#109271]) +14 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-elk-e7500/igt@vgem_basic@second-client.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-elk-e7500/igt@vgem_basic@second-client.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][168] ([i915#5334]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-jsl-3:          [SKIP][170] ([fdo#109285]) -> [SKIP][171] ([fdo#109285] / [i915#2575])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-9:          [SKIP][172] ([fdo#109285]) -> [SKIP][173] ([fdo#109285] / [i915#2575])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-jsl-1:          [SKIP][174] ([fdo#109285]) -> [SKIP][175] ([fdo#109285] / [i915#2575])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-6:         [SKIP][176] ([fdo#109285]) -> [SKIP][177] ([fdo#109285] / [i915#2575])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adls-5:         [SKIP][178] ([fdo#109285]) -> [SKIP][179] ([fdo#109285] / [i915#2575])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@kms_force_connector_basic@force-load-detect.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg1-5:          [SKIP][180] ([fdo#109285]) -> [SKIP][181] ([fdo#109285] / [i915#2575])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html
    - bat-adlp-9:         [SKIP][182] ([fdo#109285]) -> [SKIP][183] ([fdo#109285] / [i915#2575])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-dg2-11:         [SKIP][184] ([fdo#109285]) -> [SKIP][185] ([fdo#109285] / [i915#2575])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-9:          [SKIP][186] ([i915#5274]) -> [SKIP][187] ([i915#2575] / [i915#5274])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-11:         [SKIP][188] ([i915#5274]) -> [SKIP][189] ([i915#2575] / [i915#5274])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9315]: https://gitlab.freedesktop.org/drm/intel/issues/9315


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7506 -> IGTPW_9888

  CI-20190529: 20190529
  CI_DRM_13685: 1907f24fed1f58a8c7210aa4abaee56dd897936b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9888: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/index.html
  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_create@multigpu-create-massive-size
-igt@drm_fdinfo@context-close-stress
-igt@drm_fdinfo@memory-info-active
-igt@drm_fdinfo@memory-info-idle
-igt@drm_fdinfo@memory-info-purgeable
-igt@drm_fdinfo@memory-info-resident
-igt@drm_fdinfo@memory-info-shared

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/index.html

--===============3169414216928964928==
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
<tr><td><b>Series:</b></td><td>drmtest changes for running tests on multi-gpu (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123991/">https://patchwork.freedesktop.org/series/123991/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13685 -&gt; IGTPW_9888</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9888 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9888, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/index.html</p>
<h2>Participating hosts (39 -&gt; 33)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (7): fi-rkl-11600 fi-cfl-guc fi-snb-2520m fi-ivb-3770 fi-pnv-d510 bat-dg2-14 fi-bsw-nick </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9888:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-x1275/igt@core_hotunplug@unbind-rebind.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-8/igt@core_hotunplug@unbind-rebind.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rplp-1/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rplp-1/igt@gem_close_race@basic-process.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adln-1/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adln-1/igt@gem_exec_gttfill@basic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@gem_ringfill@basic-all.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@gem_ringfill@basic-all.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-atsm-1/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-atsm-1/igt@gem_ringfill@basic-all.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@gem_ringfill@basic-all.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@gem_ringfill@basic-all.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@gem_ringfill@basic-all.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-11/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-11/igt@gem_ringfill@basic-all.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@gem_ringfill@basic-all.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@gem_ringfill@basic-all.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-ilk-650/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-ilk-650/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-blb-e6850/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-blb-e6850/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@i915_module_load@load.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@i915_module_load@load.html">FAIL</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-7567u/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-7567u/igt@i915_module_load@load.html">FAIL</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adln-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adln-1/igt@i915_module_load@load.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-elk-e7500/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-elk-e7500/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlm-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlm-1/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rplp-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rplp-1/igt@i915_module_load@load.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-tgl-1115g4/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-tgl-1115g4/igt@i915_module_load@load.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-11/igt@i915_module_load@load.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-6/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-6/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-6600u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-6600u/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-apl-guc/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-glk-j4005/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-glk-j4005/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-guc/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8700k/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8700k/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-kbl-2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-kbl-2/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-atsm-1/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-atsm-1/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8109u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8109u/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-guc/igt@i915_module_load@reload.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-8/igt@prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-8/igt@prime_self_import@basic-with_fd_dup.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@second-client:</p>
<ul>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlm-1/igt@vgem_basic@second-client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlm-1/igt@vgem_basic@second-client.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-mtlp-6/igt@vgem_basic@second-client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-mtlp-6/igt@vgem_basic@second-client.html">SKIP</a> +11 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@vgem_basic@second-client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@vgem_basic@second-client.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@vgem_basic@second-client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@vgem_basic@second-client.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-13/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-13/igt@i915_module_load@load.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9888 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@core_auth@basic-auth.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +12 other tests skip</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-7567u/igt@core_auth@basic-auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-7567u/igt@core_auth@basic-auth.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-blb-e6850/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-blb-e6850/igt@gem_close_race@basic-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-kbl-2/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-kbl-2/igt@gem_close_race@basic-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@gem_close_race@basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +8 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-threads:</p>
<ul>
<li>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adln-1/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adln-1/igt@gem_close_race@basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-atsm-1/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-atsm-1/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +9 other tests skip</p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +12 other tests skip</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +9 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@flink-lifetime:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8700k/igt@gem_flink_basic@flink-lifetime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8700k/igt@gem_flink_basic@flink-lifetime.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rplp-1/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rplp-1/igt@gem_linear_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 other tests skip</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@gem_linear_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +4 other tests skip</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-apl-guc/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-apl-guc/igt@gem_linear_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@gem_linear_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +9 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-x1275/igt@gem_mmap_gtt@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-x1275/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-11/igt@gem_mmap_gtt@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-11/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +8 other tests skip</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-cfl-8109u/igt@gem_mmap_gtt@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-cfl-8109u/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-bsw-n3050/igt@gem_mmap_gtt@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-bsw-n3050/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +11 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-6600u/igt@gem_ringfill@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-6600u/igt@gem_ringfill@basic-all.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-kbl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-guc/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlm-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlm-1/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +12 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-ilk-650/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-ilk-650/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +12 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +8 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-rpls-1/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-rpls-1/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9315">i915#9315</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo:</p>
<ul>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-skl-guc/igt@prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-skl-guc/igt@prime_self_import@basic-with_one_bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@prime_self_import@basic-with_one_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +9 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-tgl-1115g4/igt@prime_self_import@basic-with_one_bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +7 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-glk-j4005/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-glk-j4005/igt@prime_self_import@basic-with_one_bo_two_files.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_two_bos:</p>
<ul>
<li>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@prime_self_import@basic-with_two_bos.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@prime_self_import@basic-with_two_bos.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@second-client:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-elk-e7500/igt@vgem_basic@second-client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-elk-e7500/igt@vgem_basic@second-client.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adls-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adls-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-adlp-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13685/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7506 -&gt; IGTPW_9888</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13685: 1907f24fed1f58a8c7210aa4abaee56dd897936b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9888: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9888/index.html<br />
  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_create@multigpu-create-massive-size<br />
-igt@drm_fdinfo@context-close-stress<br />
-igt@drm_fdinfo@memory-info-active<br />
-igt@drm_fdinfo@memory-info-idle<br />
-igt@drm_fdinfo@memory-info-purgeable<br />
-igt@drm_fdinfo@memory-info-resident<br />
-igt@drm_fdinfo@memory-info-shared</p>

</body>
</html>

--===============3169414216928964928==--
