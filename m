Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 01 Sep 2020 06:13:19 -0000
Message-ID: <159894079972.31089.5046214597595738691@emeril.freedesktop.org>
References: <20200901025200.18406-1-ashutosh.dixit@intel.com>
In-Reply-To: <20200901025200.18406-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lv?=
 =?utf-8?q?ctl=5Fwrappers=3A_Handle_PREAD/PWRITE_ioctls_not_supported_in_g?=
 =?utf-8?q?em=5Fread/write_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0012878909=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0012878909==
Content-Type: multipart/alternative;
 boundary="===============8389043329979914958=="

--===============8389043329979914958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev7)
URL   : https://patchwork.freedesktop.org/series/81152/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8948 -> IGTPW_4934
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4934 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4934, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4934:

### IGT changes ###

#### Possible regressions ####

  * igt@prime_vgem@basic-fence-read:
    - fi-bsw-kefka:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html
    - fi-cml-s:           [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-fence-read.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-s/igt@prime_vgem@basic-fence-read.html
    - fi-ilk-650:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@prime_vgem@basic-fence-read.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ilk-650/igt@prime_vgem@basic-fence-read.html
    - fi-ivb-3770:        [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html
    - fi-skl-6700k2:      [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html
    - fi-skl-lmem:        [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html
    - fi-cml-u2:          [PASS][13] -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-fence-read.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-u2/igt@prime_vgem@basic-fence-read.html
    - fi-snb-2520m:       [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html
    - fi-cfl-8700k:       [PASS][17] -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html
    - fi-byt-j1900:       [PASS][19] -> [INCOMPLETE][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html
    - fi-hsw-4770:        [PASS][21] -> [INCOMPLETE][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html
    - fi-icl-u2:          [PASS][23] -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-fence-read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@prime_vgem@basic-fence-read.html
    - fi-skl-6600u:       [PASS][25] -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-guc:         [PASS][27] -> [INCOMPLETE][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-skl-guc:         [PASS][29] -> [INCOMPLETE][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-bwr-2160:        [PASS][31] -> [INCOMPLETE][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html
    - fi-kbl-r:           [PASS][33] -> [INCOMPLETE][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-fence-read.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-r/igt@prime_vgem@basic-fence-read.html
    - fi-blb-e6850:       [PASS][35] -> [INCOMPLETE][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html
    - fi-cfl-8109u:       [PASS][37] -> [INCOMPLETE][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html
    - fi-bsw-nick:        [PASS][39] -> [INCOMPLETE][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html
    - fi-icl-y:           [PASS][41] -> [INCOMPLETE][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-fence-read.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-y/igt@prime_vgem@basic-fence-read.html
    - fi-tgl-u2:          [PASS][43] -> [INCOMPLETE][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html
    - fi-bsw-n3050:       [PASS][45] -> [INCOMPLETE][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - fi-kbl-guc:         [PASS][47] -> [FAIL][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-read.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-guc/igt@prime_vgem@basic-read.html
    - fi-bwr-2160:        [PASS][49] -> [FAIL][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-read.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bwr-2160/igt@prime_vgem@basic-read.html
    - fi-kbl-r:           [PASS][51] -> [FAIL][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-read.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-r/igt@prime_vgem@basic-read.html
    - fi-bsw-nick:        [PASS][53] -> [FAIL][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-read.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-nick/igt@prime_vgem@basic-read.html
    - fi-cfl-8109u:       [PASS][55] -> [FAIL][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-read.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8109u/igt@prime_vgem@basic-read.html
    - fi-snb-2520m:       [PASS][57] -> [FAIL][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-read.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2520m/igt@prime_vgem@basic-read.html
    - fi-cfl-8700k:       [PASS][59] -> [FAIL][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-read.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8700k/igt@prime_vgem@basic-read.html
    - fi-icl-u2:          [PASS][61] -> [FAIL][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-read.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@prime_vgem@basic-read.html
    - fi-bsw-kefka:       [PASS][63] -> [FAIL][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@prime_vgem@basic-read.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-kefka/igt@prime_vgem@basic-read.html
    - fi-skl-guc:         [PASS][65] -> [FAIL][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-read.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-guc/igt@prime_vgem@basic-read.html
    - fi-skl-6700k2:      [PASS][67] -> [FAIL][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-read.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6700k2/igt@prime_vgem@basic-read.html
    - fi-elk-e7500:       [PASS][69] -> [FAIL][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@prime_vgem@basic-read.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-elk-e7500/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - fi-tgl-u2:          [PASS][71] -> [FAIL][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-write.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-tgl-u2/igt@prime_vgem@basic-write.html
    - fi-ivb-3770:        [PASS][73] -> [FAIL][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-write.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ivb-3770/igt@prime_vgem@basic-write.html
    - fi-skl-lmem:        [PASS][75] -> [FAIL][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-write.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-lmem/igt@prime_vgem@basic-write.html
    - fi-bsw-n3050:       [PASS][77] -> [FAIL][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-write.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-n3050/igt@prime_vgem@basic-write.html
    - fi-ilk-650:         [PASS][79] -> [FAIL][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@prime_vgem@basic-write.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ilk-650/igt@prime_vgem@basic-write.html
    - fi-cml-s:           [PASS][81] -> [FAIL][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-write.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-s/igt@prime_vgem@basic-write.html
    - fi-pnv-d510:        [PASS][83] -> [FAIL][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@prime_vgem@basic-write.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-pnv-d510/igt@prime_vgem@basic-write.html
    - fi-skl-6600u:       [PASS][85] -> [FAIL][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-write.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6600u/igt@prime_vgem@basic-write.html
    - fi-hsw-4770:        [PASS][87] -> [FAIL][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-write.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-hsw-4770/igt@prime_vgem@basic-write.html
    - fi-cml-u2:          [PASS][89] -> [FAIL][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-write.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-u2/igt@prime_vgem@basic-write.html
    - fi-byt-j1900:       [PASS][91] -> [FAIL][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@prime_vgem@basic-write.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-byt-j1900/igt@prime_vgem@basic-write.html
    - fi-blb-e6850:       [PASS][93] -> [FAIL][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@prime_vgem@basic-write.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-blb-e6850/igt@prime_vgem@basic-write.html
    - fi-icl-y:           [PASS][95] -> [FAIL][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-write.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-y/igt@prime_vgem@basic-write.html
    - fi-snb-2600:        [PASS][97] -> [FAIL][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-write.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2600/igt@prime_vgem@basic-write.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@prime_vgem@basic-fence-read:
    - {fi-kbl-7560u}:     [PASS][99] -> [INCOMPLETE][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html
    - {fi-ehl-1}:         [PASS][101] -> [INCOMPLETE][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-fence-read.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ehl-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - {fi-ehl-1}:         [PASS][103] -> [FAIL][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-write.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ehl-1/igt@prime_vgem@basic-write.html
    - {fi-kbl-7560u}:     [PASS][105] -> [FAIL][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-write.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@prime_vgem@basic-write.html

  
Known issues
------------

  Here are the changes found in IGTPW_4934 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-icl-u2:          [PASS][107] -> [DMESG-WARN][108] ([i915#289])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@debugfs_test@read_all_entries.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_parallel@engines@fds:
    - fi-bxt-dsi:         [PASS][109] -> [INCOMPLETE][110] ([i915#1635] / [i915#2398])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@gem_exec_parallel@engines@fds.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bxt-dsi/igt@gem_exec_parallel@engines@fds.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-icl-u2:          [PASS][111] -> [DMESG-WARN][112] ([i915#1982])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - fi-bsw-kefka:       [PASS][113] -> [DMESG-WARN][114] ([i915#1982])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@prime_vgem@basic-fence-read:
    - fi-elk-e7500:       [PASS][115] -> [INCOMPLETE][116] ([i915#66])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html
    - fi-bxt-dsi:         [PASS][117] -> [INCOMPLETE][118] ([i915#1635])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html
    - fi-apl-guc:         [PASS][119] -> [INCOMPLETE][120] ([i915#1635])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-fence-read.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-apl-guc/igt@prime_vgem@basic-fence-read.html
    - fi-pnv-d510:        [PASS][121] -> [INCOMPLETE][122] ([i915#299])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html
    - fi-snb-2600:        [PASS][123] -> [INCOMPLETE][124] ([i915#82])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-fence-read.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2600/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-read:
    - fi-apl-guc:         [PASS][125] -> [FAIL][126] ([i915#1635]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-read.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-apl-guc/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-write:
    - fi-bxt-dsi:         [PASS][127] -> [FAIL][128] ([i915#1635]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@prime_vgem@basic-write.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bxt-dsi/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@gem_exec_store@basic:
    - fi-apl-guc:         [TIMEOUT][129] ([i915#1635]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@gem_exec_store@basic.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-apl-guc/igt@gem_exec_store@basic.html

  * igt@i915_pm_rpm@module-reload:
    - {fi-kbl-7560u}:     [WARN][131] ([i915#2249]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-byt-j1900:       [DMESG-WARN][133] ([i915#1982]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - {fi-kbl-7560u}:     [DMESG-WARN][135] ([i915#1982]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2249]: https://gitlab.freedesktop.org/drm/intel/issues/2249
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#289]: https://gitlab.freedesktop.org/drm/intel/issues/289
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299
  [i915#66]: https://gitlab.freedesktop.org/drm/intel/issues/66
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (38 -> 33)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4934

  CI-20190529: 20190529
  CI_DRM_8948: 4a551ee5aa0f402a647f797437b69af12ce78642 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4934: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/index.html

--===============8389043329979914958==
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
<tr><td><b>Series:</b></td><td>lib/ioctl_wrappers: Handle PREAD/PWRITE ioctls not supported in gem_read/write (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81152/">https://patchwork.freedesktop.org/series/81152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8948 -&gt; IGTPW_4934</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4934 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4934, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4934:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-kefka/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-s/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ilk-650/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ivb-3770/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6700k2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-lmem/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2520m/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8700k/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-byt-j1900/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-hsw-4770/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6600u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bwr-2160/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-r/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-blb-e6850/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8109u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-nick/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-y/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-tgl-u2/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-n3050/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-guc/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bwr-2160/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bwr-2160/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-r/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-r/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-nick/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-nick/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8109u/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8109u/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2520m/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2520m/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cfl-8700k/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cfl-8700k/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-kefka/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-guc/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6700k2/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6700k2/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-elk-e7500/igt@prime_vgem@basic-read.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-tgl-u2/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-tgl-u2/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ivb-3770/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ivb-3770/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-lmem/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-lmem/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-n3050/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-n3050/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ilk-650/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ilk-650/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-s/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-s/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-pnv-d510/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-skl-6600u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-skl-6600u/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-hsw-4770/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-hsw-4770/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-cml-u2/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-cml-u2/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-byt-j1900/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-blb-e6850/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-blb-e6850/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-y/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-y/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2600/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
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
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ehl-1/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-ehl-1/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-ehl-1/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@prime_vgem@basic-write.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4934 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@debugfs_test@read_all_entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/289">i915#289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bxt-dsi/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-elk-e7500/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/66">i915#66</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bxt-dsi/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-apl-guc/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-pnv-d510/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-snb-2600/igt@prime_vgem@basic-fence-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-snb-2600/igt@prime_vgem@basic-fence-read.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-apl-guc/igt@prime_vgem@basic-read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-bxt-dsi/igt@prime_vgem@basic-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-bxt-dsi/igt@prime_vgem@basic-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_store@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-apl-guc/igt@gem_exec_store@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-apl-guc/igt@gem_exec_store@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2249">i915#2249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-byt-j1900/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></p>
</li>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8948/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/fi-kbl-7560u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></p>
</li>
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
<li>IGT: IGT_5774 -&gt; IGTPW_4934</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8948: 4a551ee5aa0f402a647f797437b69af12ce78642 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4934: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4934/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8389043329979914958==--

--===============0012878909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0012878909==--
