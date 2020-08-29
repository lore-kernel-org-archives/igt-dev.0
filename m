Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 29 Aug 2020 04:12:29 -0000
Message-ID: <159867434913.31467.13083068670233609377@emeril.freedesktop.org>
References: <20200829033247.21518-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200829033247.21518-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1875243743=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1875243743==
Content-Type: multipart/alternative;
 boundary="===============3145653690996343579=="

--===============3145653690996343579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev2)
URL   : https://patchwork.freedesktop.org/series/81152/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8939 -> IGTPW_4920
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4920 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4920, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4920:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@basic:
    - fi-kbl-r:           [PASS][1] -> [FAIL][2] +8 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_parallel@engines@contexts:
    - fi-cfl-8109u:       [PASS][3] -> [FAIL][4] +9 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html
    - fi-bdw-gvtdvm:      [PASS][5] -> [FAIL][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html
    - fi-icl-y:           [PASS][7] -> [FAIL][8] +9 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html
    - fi-bsw-nick:        [PASS][9] -> [FAIL][10] +7 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@gem_exec_parallel@engines@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-nick/igt@gem_exec_parallel@engines@contexts.html
    - fi-icl-u2:          [PASS][11] -> [FAIL][12] +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_parallel@engines@fds:
    - fi-cml-u2:          [PASS][13] -> [FAIL][14] +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html
    - fi-snb-2600:        [PASS][15] -> [FAIL][16] +9 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html
    - fi-hsw-4770:        [PASS][17] -> [FAIL][18] +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_store@basic:
    - fi-kbl-x1275:       [PASS][19] -> [FAIL][20] +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_store@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@gem_exec_store@basic.html
    - fi-cml-s:           [PASS][21] -> [FAIL][22] +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@gem_exec_store@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-s/igt@gem_exec_store@basic.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-cml-u2:          [PASS][23] -> [CRASH][24] +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@gem_exec_suspend@basic-s0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-u2/igt@gem_exec_suspend@basic-s0.html
    - fi-skl-6600u:       [PASS][25] -> [FAIL][26] +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@gem_exec_suspend@basic-s0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6600u/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bsw-kefka:       [PASS][27] -> [FAIL][28] +7 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html
    - fi-kbl-r:           [PASS][29] -> [CRASH][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@gem_exec_suspend@basic-s3.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-r/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_linear_blits@basic:
    - fi-skl-6700k2:      NOTRUN -> [FAIL][31] +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6700k2/igt@gem_linear_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - fi-ilk-650:         [PASS][32] -> [FAIL][33] +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@gem_tiled_pread_basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ilk-650/igt@gem_tiled_pread_basic.html
    - fi-bsw-n3050:       [PASS][34] -> [FAIL][35] +7 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@gem_tiled_pread_basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-n3050/igt@gem_tiled_pread_basic.html
    - fi-ivb-3770:        [PASS][36] -> [FAIL][37] +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@gem_tiled_pread_basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ivb-3770/igt@gem_tiled_pread_basic.html
    - fi-tgl-u2:          [PASS][38] -> [FAIL][39] +6 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@gem_tiled_pread_basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-tgl-u2/igt@gem_tiled_pread_basic.html
    - fi-elk-e7500:       [PASS][40] -> [FAIL][41] +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@gem_tiled_pread_basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-elk-e7500/igt@gem_tiled_pread_basic.html
    - fi-skl-guc:         [PASS][42] -> [FAIL][43] +6 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_tiled_pread_basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@gem_tiled_pread_basic.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][44] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bdw-gvtdvm/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@reload:
    - fi-blb-e6850:       [PASS][45] -> [FAIL][46] +7 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@i915_module_load@reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-blb-e6850/igt@i915_module_load@reload.html
    - fi-byt-j1900:       [PASS][47] -> [FAIL][48] +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@i915_module_load@reload.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-byt-j1900/igt@i915_module_load@reload.html
    - fi-cfl-8700k:       [PASS][49] -> [FAIL][50] +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@i915_module_load@reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8700k/igt@i915_module_load@reload.html
    - fi-snb-2520m:       [PASS][51] -> [FAIL][52] +9 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@i915_module_load@reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2520m/igt@i915_module_load@reload.html
    - fi-pnv-d510:        [PASS][53] -> [FAIL][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@i915_module_load@reload.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-pnv-d510/igt@i915_module_load@reload.html

  * igt@prime_vgem@basic-fence-read:
    - fi-bsw-kefka:       [PASS][55] -> [CRASH][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
    - fi-cml-s:           [PASS][57] -> [CRASH][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@prime_vgem@basic-fence-read.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-s/igt@prime_vgem@basic-fence-read.html
    - fi-elk-e7500:       [PASS][59] -> [CRASH][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
    - fi-skl-6700k2:      NOTRUN -> [CRASH][61] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-guc:         [PASS][62] -> [CRASH][63] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-skl-guc:         [PASS][64] -> [CRASH][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-bwr-2160:        [PASS][66] -> [CRASH][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - fi-kbl-guc:         [PASS][68] -> [FAIL][69] +7 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-read.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@prime_vgem@basic-read.html
    - fi-bwr-2160:        [PASS][70] -> [FAIL][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-read.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bwr-2160/igt@prime_vgem@basic-read.html
    - fi-skl-lmem:        [PASS][72] -> [FAIL][73] +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-read.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-lmem/igt@prime_vgem@basic-read.html
    - fi-cfl-8700k:       [PASS][74] -> [CRASH][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@prime_vgem@basic-read.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8700k/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-u2:          [PASS][76] -> [CRASH][77] +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@prime_vgem@basic-write.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-tgl-u2/igt@prime_vgem@basic-write.html
    - fi-ivb-3770:        [PASS][78] -> [CRASH][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@prime_vgem@basic-write.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ivb-3770/igt@prime_vgem@basic-write.html
    - fi-skl-lmem:        [PASS][80] -> [CRASH][81] +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-write.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-lmem/igt@prime_vgem@basic-write.html
    - fi-bsw-n3050:       [PASS][82] -> [CRASH][83] +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@prime_vgem@basic-write.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-n3050/igt@prime_vgem@basic-write.html
    - fi-ilk-650:         [PASS][84] -> [CRASH][85] +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@prime_vgem@basic-write.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ilk-650/igt@prime_vgem@basic-write.html
    - fi-pnv-d510:        [PASS][86] -> [CRASH][87] +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@prime_vgem@basic-write.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-pnv-d510/igt@prime_vgem@basic-write.html
    - fi-skl-6600u:       [PASS][88] -> [CRASH][89] +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@prime_vgem@basic-write.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6600u/igt@prime_vgem@basic-write.html
    - fi-hsw-4770:        [PASS][90] -> [CRASH][91] +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@prime_vgem@basic-write.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-hsw-4770/igt@prime_vgem@basic-write.html
    - fi-snb-2520m:       [PASS][92] -> [CRASH][93] +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@prime_vgem@basic-write.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2520m/igt@prime_vgem@basic-write.html
    - fi-byt-j1900:       [PASS][94] -> [CRASH][95] +3 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@prime_vgem@basic-write.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-byt-j1900/igt@prime_vgem@basic-write.html
    - fi-icl-u2:          [PASS][96] -> [CRASH][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@prime_vgem@basic-write.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@prime_vgem@basic-write.html
    - fi-blb-e6850:       [PASS][98] -> [CRASH][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@prime_vgem@basic-write.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-blb-e6850/igt@prime_vgem@basic-write.html
    - fi-icl-y:           [PASS][100] -> [CRASH][101] +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@prime_vgem@basic-write.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-y/igt@prime_vgem@basic-write.html
    - fi-cfl-8109u:       [PASS][102] -> [CRASH][103] +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@prime_vgem@basic-write.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8109u/igt@prime_vgem@basic-write.html
    - fi-bsw-nick:        [PASS][104] -> [CRASH][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@prime_vgem@basic-write.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-nick/igt@prime_vgem@basic-write.html
    - fi-kbl-x1275:       [PASS][106] -> [CRASH][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@prime_vgem@basic-write.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@prime_vgem@basic-write.html
    - fi-snb-2600:        [PASS][108] -> [CRASH][109] +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@prime_vgem@basic-write.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2600/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@gem_exec_parallel@engines@basic:
    - fi-skl-6700k2:      [INCOMPLETE][110] ([i915#2398]) -> [FAIL][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][112] ([i915#62] / [i915#92]) -> [FAIL][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
    - fi-bdw-gvtdvm:      [INCOMPLETE][114] ([i915#146]) -> [FAIL][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-kbl-guc:         [DMESG-WARN][116] ([i915#2203]) -> [FAIL][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html
    - fi-skl-guc:         [DMESG-WARN][118] ([i915#2203]) -> [FAIL][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html
    - fi-kbl-x1275:       [DMESG-WARN][120] ([i915#62] / [i915#92] / [i915#95]) -> [FAIL][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-skl-guc:         [DMESG-WARN][122] ([i915#2203]) -> [CRASH][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html
    - fi-kbl-x1275:       [DMESG-WARN][124] ([i915#62] / [i915#92]) -> [CRASH][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_linear_blits@basic:
    - {fi-kbl-7560u}:     [PASS][126] -> [FAIL][127] +8 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@gem_linear_blits@basic.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-7560u/igt@gem_linear_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - {fi-ehl-1}:         [PASS][128] -> [FAIL][129] +8 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@gem_tiled_pread_basic.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ehl-1/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rpm@module-reload:
    - {fi-ehl-1}:         [PASS][130] -> [SKIP][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@i915_pm_rpm@module-reload.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ehl-1/igt@i915_pm_rpm@module-reload.html

  * igt@prime_vgem@basic-write:
    - {fi-ehl-1}:         [PASS][132] -> [CRASH][133] +3 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@prime_vgem@basic-write.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ehl-1/igt@prime_vgem@basic-write.html
    - {fi-kbl-7560u}:     [PASS][134] -> [CRASH][135] +3 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@prime_vgem@basic-write.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-7560u/igt@prime_vgem@basic-write.html

  
Known issues
------------

  Here are the changes found in IGTPW_4920 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_store@basic:
    - fi-tgl-u2:          [PASS][136] -> [FAIL][137] ([i915#1772]) +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@gem_exec_store@basic.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-tgl-u2/igt@gem_exec_store@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bxt-dsi:         [PASS][138] -> [FAIL][139] ([i915#1635]) +8 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [PASS][140] -> [FAIL][141] ([i915#1635]) +10 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@i915_module_load@reload.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-bsw-kefka:       [PASS][142] -> [SKIP][143] ([fdo#109271])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-n3050:       [PASS][144] -> [SKIP][145] ([fdo#109271])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html
    - fi-bsw-nick:        [PASS][146] -> [SKIP][147] ([fdo#109271])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [PASS][148] -> [DMESG-WARN][149] ([i915#1982]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bsw-kefka:       [PASS][150] -> [DMESG-WARN][151] ([i915#1982])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [PASS][152] -> [DMESG-WARN][153] ([i915#1982]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@prime_vgem@basic-fence-read:
    - fi-bxt-dsi:         [PASS][154] -> [CRASH][155] ([i915#1635]) +2 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - fi-apl-guc:         [PASS][156] -> [CRASH][157] ([i915#1635]) +2 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@prime_vgem@basic-write.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-apl-guc/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {fi-kbl-7560u}:     [DMESG-WARN][158] ([i915#1982]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [DMESG-WARN][160] ([i915#289]) -> [DMESG-FAIL][161] ([i915#289])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@i915_module_load@reload.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@i915_module_load@reload.html
    - fi-kbl-x1275:       [DMESG-WARN][162] ([i915#62] / [i915#92]) -> [DMESG-FAIL][163] ([i915#62])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@i915_module_load@reload.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@i915_module_load@reload.html
    - fi-skl-guc:         [DMESG-WARN][164] ([i915#2203]) -> [DMESG-FAIL][165] ([i915#2203])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@i915_module_load@reload.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@i915_module_load@reload.html
    - fi-kbl-guc:         [DMESG-WARN][166] ([i915#2203]) -> [DMESG-FAIL][167] ([i915#2203])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@i915_module_load@reload.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@i915_module_load@reload.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - fi-kbl-x1275:       [DMESG-WARN][168] ([i915#62] / [i915#92]) -> [DMESG-WARN][169] ([i915#62] / [i915#92] / [i915#95])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - fi-kbl-x1275:       [DMESG-WARN][170] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][171] ([i915#62] / [i915#92]) +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1772]: https://gitlab.freedesktop.org/drm/intel/issues/1772
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (39 -> 34)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4920

  CI-20190529: 20190529
  CI_DRM_8939: bee93e0c4c7026eeef73e7777b100ae5aca6dfa0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4920: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/index.html

--===============3145653690996343579==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8939 -&gt; IGTPW_4920</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4920 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4920, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4920:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +9 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +9 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-nick/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html">FAIL</a> +9 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html">FAIL</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_store@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@gem_exec_store@basic.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@gem_exec_store@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-s/igt@gem_exec_store@basic.html">FAIL</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-u2/igt@gem_exec_suspend@basic-s0.html">CRASH</a> +3 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6600u/igt@gem_exec_suspend@basic-s0.html">FAIL</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-r/igt@gem_exec_suspend@basic-s3.html">CRASH</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6700k2/igt@gem_linear_blits@basic.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ilk-650/igt@gem_tiled_pread_basic.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-n3050/igt@gem_tiled_pread_basic.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ivb-3770/igt@gem_tiled_pread_basic.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-tgl-u2/igt@gem_tiled_pread_basic.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-elk-e7500/igt@gem_tiled_pread_basic.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@gem_tiled_pread_basic.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bdw-gvtdvm/igt@gem_tiled_pread_basic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-blb-e6850/igt@i915_module_load@reload.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-byt-j1900/igt@i915_module_load@reload.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8700k/igt@i915_module_load@reload.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2520m/igt@i915_module_load@reload.html">FAIL</a> +9 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-pnv-d510/igt@i915_module_load@reload.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cml-s/igt@prime_vgem@basic-fence-read.html">CRASH</a> +3 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html">CRASH</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">CRASH</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@prime_vgem@basic-read.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bwr-2160/igt@prime_vgem@basic-read.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-lmem/igt@prime_vgem@basic-read.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8700k/igt@prime_vgem@basic-read.html">CRASH</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-tgl-u2/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ivb-3770/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-lmem/igt@prime_vgem@basic-write.html">CRASH</a> +3 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-n3050/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ilk-650/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-pnv-d510/igt@prime_vgem@basic-write.html">CRASH</a> +3 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6600u/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-hsw-4770/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2520m/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-byt-j1900/igt@prime_vgem@basic-write.html">CRASH</a> +3 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-blb-e6850/igt@prime_vgem@basic-write.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-y/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-cfl-8109u/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-nick/igt@prime_vgem@basic-write.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@prime_vgem@basic-write.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-snb-2600/igt@prime_vgem@basic-write.html">CRASH</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html">CRASH</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">CRASH</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-7560u/igt@gem_linear_blits@basic.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ehl-1/igt@gem_tiled_pread_basic.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ehl-1/igt@i915_pm_rpm@module-reload.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-ehl-1/igt@prime_vgem@basic-write.html">CRASH</a> +3 similar issues</p>
</li>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-7560u/igt@prime_vgem@basic-write.html">CRASH</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4920 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@gem_exec_store@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-tgl-u2/igt@gem_exec_store@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1772">i915#1772</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-apl-guc/igt@i915_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-n3050/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-nick/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-apl-guc/igt@prime_vgem@basic-write.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-skl-guc/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-guc/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5774 -&gt; IGTPW_4920</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8939: bee93e0c4c7026eeef73e7777b100ae5aca6dfa0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4920: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4920/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3145653690996343579==--

--===============1875243743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1875243743==--
