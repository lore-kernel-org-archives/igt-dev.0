Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 01 Sep 2020 00:23:50 -0000
Message-ID: <159891983068.31087.14352959114393634288@emeril.freedesktop.org>
References: <20200831202459.1943-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200831202459.1943-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0070663665=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0070663665==
Content-Type: multipart/alternative;
 boundary="===============3102205466115377230=="

--===============3102205466115377230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev4)
URL   : https://patchwork.freedesktop.org/series/81152/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8948 -> IGTPW_4930
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4930 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4930, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4930:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_create@basic:
    - fi-bsw-kefka:       [PASS][1] -> [FAIL][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@gem_exec_create@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@gem_exec_create@basic.html

  * igt@gem_exec_fence@basic-await@bcs0:
    - fi-byt-j1900:       [PASS][3] -> [FAIL][4] +16 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@gem_exec_fence@basic-await@bcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-byt-j1900/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@gem_exec_fence@basic-await@vcs0:
    - fi-elk-e7500:       [PASS][5] -> [FAIL][6] +14 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@gem_exec_fence@basic-await@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-elk-e7500/igt@gem_exec_fence@basic-await@vcs0.html
    - fi-ilk-650:         [PASS][7] -> [FAIL][8] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@gem_exec_fence@basic-await@vcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ilk-650/igt@gem_exec_fence@basic-await@vcs0.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-ilk-650:         [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@gem_exec_parallel@engines@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ilk-650/igt@gem_exec_parallel@engines@basic.html
    - fi-blb-e6850:       [PASS][11] -> [INCOMPLETE][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@gem_exec_parallel@engines@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-blb-e6850/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bsw-kefka:       [PASS][13] -> [TIMEOUT][14] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html
    - fi-bsw-n3050:       [PASS][15] -> [TIMEOUT][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_sync@basic-each:
    - fi-pnv-d510:        [PASS][17] -> [FAIL][18] +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@gem_sync@basic-each.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-pnv-d510/igt@gem_sync@basic-each.html

  * igt@i915_module_load@reload:
    - fi-blb-e6850:       [PASS][19] -> [FAIL][20] +10 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@i915_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-blb-e6850/igt@i915_module_load@reload.html

  * igt@prime_vgem@basic-fence-read:
    - fi-bsw-kefka:       [PASS][21] -> [INCOMPLETE][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
    - fi-cml-s:           [PASS][23] -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-fence-read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-s/igt@prime_vgem@basic-fence-read.html
    - fi-ivb-3770:        [PASS][25] -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html
    - fi-skl-6700k2:      [PASS][27] -> [INCOMPLETE][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html
    - fi-skl-lmem:        [PASS][29] -> [INCOMPLETE][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html
    - fi-cml-u2:          [PASS][31] -> [INCOMPLETE][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-fence-read.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-u2/igt@prime_vgem@basic-fence-read.html
    - fi-snb-2520m:       [PASS][33] -> [INCOMPLETE][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html
    - fi-cfl-8700k:       [PASS][35] -> [INCOMPLETE][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html
    - fi-byt-j1900:       [PASS][37] -> [INCOMPLETE][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html
    - fi-hsw-4770:        [PASS][39] -> [INCOMPLETE][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html
    - fi-icl-u2:          [PASS][41] -> [INCOMPLETE][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-fence-read.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-u2/igt@prime_vgem@basic-fence-read.html
    - fi-skl-6600u:       [PASS][43] -> [INCOMPLETE][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-guc:         [PASS][45] -> [INCOMPLETE][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-skl-guc:         [PASS][47] -> [INCOMPLETE][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-bwr-2160:        [PASS][49] -> [INCOMPLETE][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-r:           [PASS][51] -> [INCOMPLETE][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-fence-read.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-r/igt@prime_vgem@basic-fence-read.html
    - fi-cfl-8109u:       [PASS][53] -> [INCOMPLETE][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html
    - fi-bsw-nick:        [PASS][55] -> [INCOMPLETE][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html
    - fi-icl-y:           [PASS][57] -> [INCOMPLETE][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-fence-read.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-y/igt@prime_vgem@basic-fence-read.html
    - fi-tgl-u2:          [PASS][59] -> [INCOMPLETE][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html
    - fi-bsw-n3050:       [PASS][61] -> [INCOMPLETE][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - fi-kbl-guc:         [PASS][63] -> [FAIL][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-read.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-guc/igt@prime_vgem@basic-read.html
    - fi-bwr-2160:        [PASS][65] -> [FAIL][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-read.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bwr-2160/igt@prime_vgem@basic-read.html
    - fi-kbl-r:           [PASS][67] -> [FAIL][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-read.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-r/igt@prime_vgem@basic-read.html
    - fi-bsw-nick:        [PASS][69] -> [FAIL][70] +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-read.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-nick/igt@prime_vgem@basic-read.html
    - fi-cfl-8109u:       [PASS][71] -> [FAIL][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-read.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8109u/igt@prime_vgem@basic-read.html
    - fi-snb-2520m:       [PASS][73] -> [FAIL][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-read.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2520m/igt@prime_vgem@basic-read.html
    - fi-cfl-8700k:       [PASS][75] -> [FAIL][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-read.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8700k/igt@prime_vgem@basic-read.html
    - fi-icl-u2:          [PASS][77] -> [FAIL][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-read.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-u2/igt@prime_vgem@basic-read.html
    - fi-skl-guc:         [PASS][79] -> [FAIL][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-read.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-guc/igt@prime_vgem@basic-read.html
    - fi-skl-6700k2:      [PASS][81] -> [FAIL][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-read.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6700k2/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-u2:          [PASS][83] -> [FAIL][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-write.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-tgl-u2/igt@prime_vgem@basic-write.html
    - fi-ivb-3770:        [PASS][85] -> [FAIL][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-write.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ivb-3770/igt@prime_vgem@basic-write.html
    - fi-skl-lmem:        [PASS][87] -> [FAIL][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-write.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-lmem/igt@prime_vgem@basic-write.html
    - fi-bsw-n3050:       [PASS][89] -> [FAIL][90] +8 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-write.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@prime_vgem@basic-write.html
    - fi-cml-s:           [PASS][91] -> [FAIL][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-write.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-s/igt@prime_vgem@basic-write.html
    - fi-skl-6600u:       [PASS][93] -> [FAIL][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-write.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6600u/igt@prime_vgem@basic-write.html
    - fi-hsw-4770:        [PASS][95] -> [FAIL][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-write.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-hsw-4770/igt@prime_vgem@basic-write.html
    - fi-cml-u2:          [PASS][97] -> [FAIL][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-write.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-u2/igt@prime_vgem@basic-write.html
    - fi-icl-y:           [PASS][99] -> [FAIL][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-write.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-y/igt@prime_vgem@basic-write.html
    - fi-snb-2600:        [PASS][101] -> [FAIL][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-write.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2600/igt@prime_vgem@basic-write.html

  * igt@runner@aborted:
    - fi-ilk-650:         NOTRUN -> [FAIL][103]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ilk-650/igt@runner@aborted.html

  
#### Warnings ####

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       [SKIP][104] ([fdo#109271]) -> [FAIL][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@prime_vgem@basic-fence-read:
    - {fi-kbl-7560u}:     [PASS][106] -> [INCOMPLETE][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html
    - {fi-ehl-1}:         [PASS][108] -> [INCOMPLETE][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-fence-read.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ehl-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - {fi-ehl-1}:         [PASS][110] -> [FAIL][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-write.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ehl-1/igt@prime_vgem@basic-write.html
    - {fi-kbl-7560u}:     [PASS][112] -> [FAIL][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-write.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-7560u/igt@prime_vgem@basic-write.html

  
Known issues
------------

  Here are the changes found in IGTPW_4930 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@contexts:
    - fi-cfl-8700k:       [PASS][114] -> [INCOMPLETE][115] ([i915#2398])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@gem_exec_parallel@engines@contexts.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8700k/igt@gem_exec_parallel@engines@contexts.html
    - fi-skl-lmem:        [PASS][116] -> [INCOMPLETE][117] ([i915#2398])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@gem_exec_parallel@engines@contexts.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-lmem/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-bsw-nick:        [PASS][118] -> [TIMEOUT][119] ([i915#1958]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-bxt-dsi:         [PASS][120] -> [FAIL][121] ([i915#1635]) +5 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_sync@basic-each:
    - fi-bsw-n3050:       [PASS][122] -> [FAIL][123] ([i915#2356])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@gem_sync@basic-each.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@gem_sync@basic-each.html

  * igt@i915_selftest@live@execlists:
    - fi-icl-y:           [PASS][124] -> [INCOMPLETE][125] ([i915#2276])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@i915_selftest@live@execlists.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-y/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [PASS][126] -> [DMESG-WARN][127] ([i915#1982])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-icl-u2:          [PASS][128] -> [DMESG-WARN][129] ([i915#1982])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-skl-guc:         [PASS][130] -> [DMESG-WARN][131] ([i915#2203])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  * igt@prime_vgem@basic-fence-read:
    - fi-elk-e7500:       [PASS][132] -> [INCOMPLETE][133] ([i915#66]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
    - fi-bxt-dsi:         [PASS][134] -> [INCOMPLETE][135] ([i915#1635])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html
    - fi-apl-guc:         [PASS][136] -> [INCOMPLETE][137] ([i915#1635])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-fence-read.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-apl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-pnv-d510:        [PASS][138] -> [INCOMPLETE][139] ([i915#299])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html
    - fi-snb-2600:        [PASS][140] -> [INCOMPLETE][141] ([i915#82])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-fence-read.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2600/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - fi-apl-guc:         [PASS][142] -> [FAIL][143] ([i915#1635]) +4 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-read.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-apl-guc/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic:
    - fi-apl-guc:         [TIMEOUT][144] ([i915#1635]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@gem_exec_store@basic.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-apl-guc/igt@gem_exec_store@basic.html

  * igt@i915_pm_rpm@module-reload:
    - {fi-kbl-7560u}:     [WARN][146] ([i915#2249]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2249]: https://gitlab.freedesktop.org/drm/intel/issues/2249
  [i915#2276]: https://gitlab.freedesktop.org/drm/intel/issues/2276
  [i915#2356]: https://gitlab.freedesktop.org/drm/intel/issues/2356
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#66]: https://gitlab.freedesktop.org/drm/intel/issues/66
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (38 -> 33)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4930

  CI-20190529: 20190529
  CI_DRM_8948: 4a551ee5aa0f402a647f797437b69af12ce78642 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/index.html

--===============3102205466115377230==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8948 -&gt; IGTPW_4930</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4930 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4930, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4930:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_create@basic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@gem_exec_create@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@gem_exec_create@basic.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-byt-j1900/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-elk-e7500/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> +14 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@gem_exec_fence@basic-await@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ilk-650/igt@gem_exec_fence@basic-await@vcs0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ilk-650/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-blb-e6850/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@gem_exec_suspend@basic-s3.html">TIMEOUT</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@gem_exec_suspend@basic-s3.html">TIMEOUT</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@gem_sync@basic-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-pnv-d510/igt@gem_sync@basic-each.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-blb-e6850/igt@i915_module_load@reload.html">FAIL</a> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-s/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-r/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-y/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-guc/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bwr-2160/igt@prime_vgem@basic-read.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-r/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-nick/igt@prime_vgem@basic-read.html">FAIL</a> +4 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8109u/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2520m/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8700k/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-u2/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-guc/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6700k2/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-tgl-u2/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ivb-3770/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-lmem/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@prime_vgem@basic-write.html">FAIL</a> +8 similar issues</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-s/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-6600u/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-hsw-4770/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cml-u2/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-y/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2600/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ilk-650/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">FAIL</a></li>
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
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ehl-1/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-ehl-1/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-7560u/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4930 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-cfl-8700k/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>)</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-lmem/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-nick/igt@gem_exec_suspend@basic-s0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bxt-dsi/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-each:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@gem_sync@basic-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-n3050/igt@gem_sync@basic-each.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2356">i915#2356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-y/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2276">i915#2276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/66">i915#66</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-apl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-snb-2600/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-apl-guc/igt@prime_vgem@basic-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@gem_exec_store@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-apl-guc/igt@gem_exec_store@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2249">i915#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (38 -&gt; 33)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5774 -&gt; IGTPW_4930</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8948: 4a551ee5aa0f402a647f797437b69af12ce78642 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4930/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3102205466115377230==--

--===============0070663665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0070663665==--
