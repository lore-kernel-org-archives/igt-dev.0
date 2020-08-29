Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 29 Aug 2020 02:33:19 -0000
Message-ID: <159866839933.31464.16501012320152719496@emeril.freedesktop.org>
References: <20200829015332.18676-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200829015332.18676-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0825660774=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0825660774==
Content-Type: multipart/alternative;
 boundary="===============8662599600734813326=="

--===============8662599600734813326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write
URL   : https://patchwork.freedesktop.org/series/81152/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8939 -> IGTPW_4919
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4919 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4919, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4919:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@engines@basic:
    - fi-kbl-r:           [PASS][1] -> [FAIL][2] +11 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_parallel@engines@contexts:
    - fi-cfl-8109u:       [PASS][3] -> [FAIL][4] +11 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html
    - fi-bdw-gvtdvm:      [PASS][5] -> [FAIL][6] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html
    - fi-icl-y:           [PASS][7] -> [FAIL][8] +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html
    - fi-icl-u2:          [PASS][9] -> [FAIL][10] +10 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_parallel@engines@fds:
    - fi-cml-u2:          [PASS][11] -> [FAIL][12] +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html
    - fi-snb-2600:        [PASS][13] -> [FAIL][14] +11 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html
    - fi-hsw-4770:        [PASS][15] -> [FAIL][16] +10 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_store@basic:
    - fi-kbl-x1275:       [PASS][17] -> [FAIL][18] +7 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_store@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@gem_exec_store@basic.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-bsw-nick:        [PASS][19] -> [FAIL][20] +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bsw-kefka:       [PASS][21] -> [FAIL][22] +9 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_linear_blits@basic:
    - fi-skl-6700k2:      NOTRUN -> [FAIL][23] +8 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6700k2/igt@gem_linear_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - fi-ilk-650:         [PASS][24] -> [FAIL][25] +10 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@gem_tiled_pread_basic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ilk-650/igt@gem_tiled_pread_basic.html
    - fi-elk-e7500:       [PASS][26] -> [FAIL][27] +9 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@gem_tiled_pread_basic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-elk-e7500/igt@gem_tiled_pread_basic.html
    - fi-skl-guc:         [PASS][28] -> [FAIL][29] +8 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_tiled_pread_basic.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@gem_tiled_pread_basic.html

  * igt@i915_module_load@reload:
    - fi-blb-e6850:       [PASS][30] -> [FAIL][31] +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@i915_module_load@reload.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-blb-e6850/igt@i915_module_load@reload.html
    - fi-byt-j1900:       [PASS][32] -> [FAIL][33] +11 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@i915_module_load@reload.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-byt-j1900/igt@i915_module_load@reload.html
    - fi-cfl-8700k:       [PASS][34] -> [FAIL][35] +11 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@i915_module_load@reload.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8700k/igt@i915_module_load@reload.html
    - fi-snb-2520m:       [PASS][36] -> [FAIL][37] +11 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@i915_module_load@reload.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2520m/igt@i915_module_load@reload.html

  * igt@prime_vgem@basic-fence-read:
    - fi-bsw-kefka:       [PASS][38] -> [INCOMPLETE][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
    - fi-cml-s:           [PASS][40] -> [INCOMPLETE][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@prime_vgem@basic-fence-read.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-s/igt@prime_vgem@basic-fence-read.html
    - fi-ilk-650:         [PASS][42] -> [INCOMPLETE][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@prime_vgem@basic-fence-read.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ilk-650/igt@prime_vgem@basic-fence-read.html
    - fi-ivb-3770:        [PASS][44] -> [INCOMPLETE][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html
    - fi-skl-6700k2:      NOTRUN -> [INCOMPLETE][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html
    - fi-skl-lmem:        [PASS][47] -> [INCOMPLETE][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html
    - fi-cml-u2:          [PASS][49] -> [INCOMPLETE][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@prime_vgem@basic-fence-read.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-u2/igt@prime_vgem@basic-fence-read.html
    - fi-snb-2520m:       [PASS][51] -> [INCOMPLETE][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html
    - fi-cfl-8700k:       [PASS][53] -> [INCOMPLETE][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html
    - fi-byt-j1900:       [PASS][55] -> [INCOMPLETE][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html
    - fi-hsw-4770:        [PASS][57] -> [INCOMPLETE][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html
    - fi-icl-u2:          [PASS][59] -> [INCOMPLETE][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@prime_vgem@basic-fence-read.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@prime_vgem@basic-fence-read.html
    - fi-skl-6600u:       [PASS][61] -> [INCOMPLETE][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][63]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-guc:         [PASS][64] -> [INCOMPLETE][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-skl-guc:         [PASS][66] -> [INCOMPLETE][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-bwr-2160:        [PASS][68] -> [INCOMPLETE][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-r:           [PASS][70] -> [INCOMPLETE][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@prime_vgem@basic-fence-read.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-r/igt@prime_vgem@basic-fence-read.html
    - fi-blb-e6850:       [PASS][72] -> [INCOMPLETE][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html
    - fi-cfl-8109u:       [PASS][74] -> [INCOMPLETE][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html
    - fi-bsw-nick:        [PASS][76] -> [INCOMPLETE][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html
    - fi-icl-y:           [PASS][78] -> [INCOMPLETE][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@prime_vgem@basic-fence-read.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-y/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-x1275:       [PASS][80] -> [INCOMPLETE][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@prime_vgem@basic-fence-read.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@prime_vgem@basic-fence-read.html
    - fi-tgl-u2:          [PASS][82] -> [INCOMPLETE][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html
    - fi-bsw-n3050:       [PASS][84] -> [INCOMPLETE][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - fi-kbl-guc:         [PASS][86] -> [FAIL][87] +8 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-read.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@prime_vgem@basic-read.html
    - fi-bwr-2160:        [PASS][88] -> [FAIL][89] +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-read.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bwr-2160/igt@prime_vgem@basic-read.html
    - fi-bdw-gvtdvm:      NOTRUN -> [FAIL][90] +4 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-u2:          [PASS][91] -> [FAIL][92] +11 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@prime_vgem@basic-write.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-tgl-u2/igt@prime_vgem@basic-write.html
    - fi-ivb-3770:        [PASS][93] -> [FAIL][94] +11 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@prime_vgem@basic-write.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ivb-3770/igt@prime_vgem@basic-write.html
    - fi-skl-lmem:        [PASS][95] -> [FAIL][96] +11 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-write.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-lmem/igt@prime_vgem@basic-write.html
    - fi-bsw-n3050:       [PASS][97] -> [FAIL][98] +9 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@prime_vgem@basic-write.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-n3050/igt@prime_vgem@basic-write.html
    - fi-cml-s:           [PASS][99] -> [FAIL][100] +11 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@prime_vgem@basic-write.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-s/igt@prime_vgem@basic-write.html
    - fi-pnv-d510:        [PASS][101] -> [FAIL][102] +7 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@prime_vgem@basic-write.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-pnv-d510/igt@prime_vgem@basic-write.html
    - fi-skl-6600u:       [PASS][103] -> [FAIL][104] +10 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@prime_vgem@basic-write.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6600u/igt@prime_vgem@basic-write.html

  
#### Warnings ####

  * igt@gem_exec_parallel@engines@basic:
    - fi-skl-6700k2:      [INCOMPLETE][105] ([i915#2398]) -> [FAIL][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-kbl-x1275:       [DMESG-WARN][107] ([i915#62] / [i915#92]) -> [FAIL][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html
    - fi-bdw-gvtdvm:      [INCOMPLETE][109] ([i915#146]) -> [FAIL][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-kbl-guc:         [DMESG-WARN][111] ([i915#2203]) -> [FAIL][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html
    - fi-skl-guc:         [DMESG-WARN][113] ([i915#2203]) -> [FAIL][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html
    - fi-kbl-x1275:       [DMESG-WARN][115] ([i915#62] / [i915#92] / [i915#95]) -> [FAIL][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@prime_vgem@basic-fence-read:
    - {fi-kbl-7560u}:     [PASS][117] -> [INCOMPLETE][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html
    - {fi-ehl-1}:         [PASS][119] -> [INCOMPLETE][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@prime_vgem@basic-fence-read.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ehl-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - {fi-ehl-1}:         [PASS][121] -> [FAIL][122] +11 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@prime_vgem@basic-write.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ehl-1/igt@prime_vgem@basic-write.html
    - {fi-kbl-7560u}:     [PASS][123] -> [FAIL][124] +11 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@prime_vgem@basic-write.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-7560u/igt@prime_vgem@basic-write.html

  
Known issues
------------

  Here are the changes found in IGTPW_4919 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3:
    - fi-bxt-dsi:         [PASS][125] -> [FAIL][126] ([i915#1635]) +10 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [PASS][127] -> [FAIL][128] ([i915#1635]) +11 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@i915_module_load@reload.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-byt-j1900:       [PASS][129] -> [DMESG-WARN][130] ([i915#1982])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][131] -> [INCOMPLETE][132] ([i915#2276])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@i915_selftest@live@execlists.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [PASS][133] -> [DMESG-WARN][134] ([i915#1982]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - fi-icl-u2:          [PASS][135] -> [DMESG-WARN][136] ([i915#1982])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@prime_vgem@basic-fence-read:
    - fi-elk-e7500:       [PASS][137] -> [INCOMPLETE][138] ([i915#66])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
    - fi-bxt-dsi:         [PASS][139] -> [INCOMPLETE][140] ([i915#1635])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html
    - fi-apl-guc:         [PASS][141] -> [INCOMPLETE][142] ([i915#1635])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@prime_vgem@basic-fence-read.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-apl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-pnv-d510:        [PASS][143] -> [INCOMPLETE][144] ([i915#299])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html
    - fi-snb-2600:        [PASS][145] -> [INCOMPLETE][146] ([i915#82])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@prime_vgem@basic-fence-read.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2600/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - {fi-kbl-7560u}:     [DMESG-WARN][147] ([i915#1982]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-skl-guc:         [DMESG-WARN][149] ([i915#2203]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-icl-u2:          [DMESG-WARN][151] ([i915#289]) -> [DMESG-FAIL][152] ([i915#289])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@i915_module_load@reload.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@i915_module_load@reload.html
    - fi-kbl-x1275:       [DMESG-WARN][153] ([i915#62] / [i915#92]) -> [DMESG-FAIL][154] ([i915#62]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@i915_module_load@reload.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@i915_module_load@reload.html
    - fi-kbl-guc:         [DMESG-WARN][155] ([i915#2203]) -> [DMESG-FAIL][156] ([i915#2203])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@i915_module_load@reload.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-kbl-x1275:       [DMESG-FAIL][157] ([i915#62]) -> [DMESG-FAIL][158] ([i915#62] / [i915#95])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - fi-kbl-x1275:       [DMESG-WARN][159] ([i915#62] / [i915#92] / [i915#95]) -> [DMESG-WARN][160] ([i915#62] / [i915#92])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  * igt@kms_force_connector_basic@force-edid:
    - fi-kbl-x1275:       [DMESG-WARN][161] ([i915#62] / [i915#92]) -> [DMESG-WARN][162] ([i915#62] / [i915#92] / [i915#95])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-skl-guc:         [DMESG-WARN][163] ([i915#2203]) -> [DMESG-FAIL][164] ([i915#2203]) +1 similar issue
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#146]: https://gitlab.freedesktop.org/drm/intel/issues/146
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2276]: https://gitlab.freedesktop.org/drm/intel/issues/2276
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#66]: https://gitlab.freedesktop.org/drm/intel/issues/66
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (39 -> 34)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4919

  CI-20190529: 20190529
  CI_DRM_8939: bee93e0c4c7026eeef73e7777b100ae5aca6dfa0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4919: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/index.html

--===============8662599600734813326==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8939 -&gt; IGTPW_4919</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4919 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4919, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4919:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-r/igt@gem_exec_parallel@engines@basic.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8109u/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-y/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@gem_exec_parallel@engines@contexts.html">FAIL</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-u2/igt@gem_exec_parallel@engines@fds.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2600/igt@gem_exec_parallel@engines@fds.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-hsw-4770/igt@gem_exec_parallel@engines@fds.html">FAIL</a> +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_store@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@gem_exec_store@basic.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html">FAIL</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@basic:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6700k2/igt@gem_linear_blits@basic.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ilk-650/igt@gem_tiled_pread_basic.html">FAIL</a> +10 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-elk-e7500/igt@gem_tiled_pread_basic.html">FAIL</a> +9 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_tiled_pread_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@gem_tiled_pread_basic.html">FAIL</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-blb-e6850/igt@i915_module_load@reload.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-byt-j1900/igt@i915_module_load@reload.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8700k/igt@i915_module_load@reload.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2520m/igt@i915_module_load@reload.html">FAIL</a> +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-s/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ilk-650/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ilk-650/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-r/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-r/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-y/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@prime_vgem@basic-read.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bwr-2160/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bwr-2160/igt@prime_vgem@basic-read.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@prime_vgem@basic-read.html">FAIL</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-tgl-u2/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-tgl-u2/igt@prime_vgem@basic-write.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ivb-3770/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ivb-3770/igt@prime_vgem@basic-write.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-lmem/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-lmem/igt@prime_vgem@basic-write.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-n3050/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-n3050/igt@prime_vgem@basic-write.html">FAIL</a> +9 similar issues</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-cml-s/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-cml-s/igt@prime_vgem@basic-write.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-pnv-d510/igt@prime_vgem@basic-write.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6600u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6600u/igt@prime_vgem@basic-write.html">FAIL</a> +10 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-6700k2/igt@gem_exec_parallel@engines@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/146">i915#146</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bdw-gvtdvm/igt@gem_exec_suspend@basic-s0.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@gem_exec_suspend@basic-s3.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@gem_exec_suspend@basic-s3.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@gem_exec_suspend@basic-s3.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ehl-1/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-ehl-1/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-ehl-1/igt@prime_vgem@basic-write.html">FAIL</a> +11 similar issues</p>
</li>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-7560u/igt@prime_vgem@basic-write.html">FAIL</a> +11 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4919 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-apl-guc/igt@i915_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-byt-j1900/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-y/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-y/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2276">i915#2276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/66">i915#66</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-apl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-apl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-snb-2600/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-snb-2600/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-icl-u2/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-guc/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp1:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-kbl-x1275/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8939/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/fi-skl-guc/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>) +1 similar issue</li>
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
<li>IGT: IGT_5774 -&gt; IGTPW_4919</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8939: bee93e0c4c7026eeef73e7777b100ae5aca6dfa0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4919: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4919/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8662599600734813326==--

--===============0825660774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0825660774==--
