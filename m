Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0355431877330540174=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 22 Jun 2023 08:02:51 -0000
Message-ID: <168742097165.4872.18213441373469145201@emeril.freedesktop.org>
References: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230622065422.2235134-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgWEUgdGVz?=
 =?utf-8?q?t_cleanup_to_handle_xe=5Fdevice_=28rev6=29?=
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

--===============0355431877330540174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: XE test cleanup to handle xe_device (rev6)
URL   : https://patchwork.freedesktop.org/series/117263/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7345 -> IGTPW_9238
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9238 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9238, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9238:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_close_race@basic-threads:
    - bat-atsm-1:         [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-atsm-1/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@gem_close_race@basic-threads.html
    - bat-jsl-3:          [PASS][3] -> [WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-jsl-3/igt@gem_close_race@basic-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-jsl-3/igt@gem_close_race@basic-threads.html
    - fi-hsw-4770:        [PASS][5] -> [WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-hsw-4770/igt@gem_close_race@basic-threads.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-hsw-4770/igt@gem_close_race@basic-threads.html
    - fi-ivb-3770:        [PASS][7] -> [WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-ivb-3770/igt@gem_close_race@basic-threads.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-ivb-3770/igt@gem_close_race@basic-threads.html
    - bat-mtlp-8:         [PASS][9] -> [WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-8/igt@gem_close_race@basic-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-8/igt@gem_close_race@basic-threads.html
    - fi-elk-e7500:       [PASS][11] -> [WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-elk-e7500/igt@gem_close_race@basic-threads.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-elk-e7500/igt@gem_close_race@basic-threads.html
    - bat-dg2-8:          [PASS][13] -> [WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-8/igt@gem_close_race@basic-threads.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-8/igt@gem_close_race@basic-threads.html
    - fi-kbl-guc:         [PASS][15] -> [WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-guc/igt@gem_close_race@basic-threads.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-guc/igt@gem_close_race@basic-threads.html
    - bat-adlm-1:         [PASS][17] -> [WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlm-1/igt@gem_close_race@basic-threads.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlm-1/igt@gem_close_race@basic-threads.html
    - bat-jsl-1:          [PASS][19] -> [WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-jsl-1/igt@gem_close_race@basic-threads.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-jsl-1/igt@gem_close_race@basic-threads.html
    - fi-bsw-n3050:       [PASS][21] -> [WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-bsw-n3050/igt@gem_close_race@basic-threads.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-n3050/igt@gem_close_race@basic-threads.html
    - bat-rpls-1:         [PASS][23] -> [WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-1/igt@gem_close_race@basic-threads.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-1/igt@gem_close_race@basic-threads.html
    - bat-dg1-5:          [PASS][25] -> [WARN][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg1-5/igt@gem_close_race@basic-threads.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg1-5/igt@gem_close_race@basic-threads.html
    - bat-dg1-7:          [PASS][27] -> [WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg1-7/igt@gem_close_race@basic-threads.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg1-7/igt@gem_close_race@basic-threads.html
    - fi-glk-j4005:       [PASS][29] -> [WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-glk-j4005/igt@gem_close_race@basic-threads.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-glk-j4005/igt@gem_close_race@basic-threads.html
    - bat-adlp-9:         [PASS][31] -> [WARN][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlp-9/igt@gem_close_race@basic-threads.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlp-9/igt@gem_close_race@basic-threads.html
    - fi-kbl-7567u:       [PASS][33] -> [WARN][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-7567u/igt@gem_close_race@basic-threads.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-7567u/igt@gem_close_race@basic-threads.html
    - bat-rplp-1:         [PASS][35] -> [WARN][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rplp-1/igt@gem_close_race@basic-threads.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rplp-1/igt@gem_close_race@basic-threads.html
    - fi-rkl-11600:       [PASS][37] -> [WARN][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-rkl-11600/igt@gem_close_race@basic-threads.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-rkl-11600/igt@gem_close_race@basic-threads.html
    - bat-adls-5:         [PASS][39] -> [WARN][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adls-5/igt@gem_close_race@basic-threads.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adls-5/igt@gem_close_race@basic-threads.html
    - fi-cfl-guc:         [PASS][41] -> [WARN][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-cfl-guc/igt@gem_close_race@basic-threads.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-cfl-guc/igt@gem_close_race@basic-threads.html
    - bat-dg2-9:          [PASS][43] -> [WARN][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-9/igt@gem_close_race@basic-threads.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-9/igt@gem_close_race@basic-threads.html
    - fi-kbl-x1275:       [PASS][45] -> [WARN][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-x1275/igt@gem_close_race@basic-threads.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-x1275/igt@gem_close_race@basic-threads.html
    - fi-cfl-8109u:       [PASS][47] -> [WARN][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-cfl-8109u/igt@gem_close_race@basic-threads.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-cfl-8109u/igt@gem_close_race@basic-threads.html
    - bat-adln-1:         [PASS][49] -> [WARN][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adln-1/igt@gem_close_race@basic-threads.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adln-1/igt@gem_close_race@basic-threads.html
    - fi-kbl-8809g:       [PASS][51] -> [WARN][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-8809g/igt@gem_close_race@basic-threads.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-8809g/igt@gem_close_race@basic-threads.html
    - fi-ilk-650:         [PASS][53] -> [WARN][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-ilk-650/igt@gem_close_race@basic-threads.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-ilk-650/igt@gem_close_race@basic-threads.html
    - fi-tgl-1115g4:      [PASS][55] -> [WARN][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-tgl-1115g4/igt@gem_close_race@basic-threads.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-tgl-1115g4/igt@gem_close_race@basic-threads.html
    - fi-blb-e6850:       [PASS][57] -> [WARN][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-blb-e6850/igt@gem_close_race@basic-threads.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-blb-e6850/igt@gem_close_race@basic-threads.html
    - bat-adlp-6:         [PASS][59] -> [WARN][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlp-6/igt@gem_close_race@basic-threads.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlp-6/igt@gem_close_race@basic-threads.html
    - bat-mtlp-6:         [PASS][61] -> [WARN][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-6/igt@gem_close_race@basic-threads.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-6/igt@gem_close_race@basic-threads.html
    - fi-skl-6600u:       [PASS][63] -> [WARN][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-skl-6600u/igt@gem_close_race@basic-threads.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-skl-6600u/igt@gem_close_race@basic-threads.html
    - fi-apl-guc:         [PASS][65] -> [WARN][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-apl-guc/igt@gem_close_race@basic-threads.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-apl-guc/igt@gem_close_race@basic-threads.html
    - bat-rpls-2:         [PASS][67] -> [WARN][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-2/igt@gem_close_race@basic-threads.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-2/igt@gem_close_race@basic-threads.html
    - fi-skl-guc:         [PASS][69] -> [WARN][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-skl-guc/igt@gem_close_race@basic-threads.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-skl-guc/igt@gem_close_race@basic-threads.html
    - bat-dg2-11:         [PASS][71] -> [WARN][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-11/igt@gem_close_race@basic-threads.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-11/igt@gem_close_race@basic-threads.html
    - fi-cfl-8700k:       [PASS][73] -> [WARN][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-cfl-8700k/igt@gem_close_race@basic-threads.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-cfl-8700k/igt@gem_close_race@basic-threads.html
    - fi-bsw-nick:        [PASS][75] -> [WARN][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-bsw-nick/igt@gem_close_race@basic-threads.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-nick/igt@gem_close_race@basic-threads.html
    - bat-kbl-2:          [PASS][77] -> [WARN][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-kbl-2/igt@gem_close_race@basic-threads.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-kbl-2/igt@gem_close_race@basic-threads.html

  
Known issues
------------

  Here are the changes found in IGTPW_9238 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - bat-dg2-9:          [PASS][79] -> [FAIL][80] ([fdo#103375]) +4 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@i915_module_load@load:
    - bat-adlp-11:        [PASS][81] -> [ABORT][82] ([i915#4423])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlp-11/igt@i915_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_engines:
    - bat-atsm-1:         NOTRUN -> [FAIL][83] ([i915#6268])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [PASS][84] -> [DMESG-FAIL][85] ([i915#7059])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-2:         NOTRUN -> [DMESG-WARN][86] ([i915#6367])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-2/igt@i915_selftest@live@slpc.html
    - bat-rpls-1:         [PASS][87] -> [DMESG-WARN][88] ([i915#6367])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-atsm-1:         NOTRUN -> [SKIP][89] ([i915#6645])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-atsm-1:         NOTRUN -> [SKIP][90] ([i915#6078])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - fi-bsw-nick:        NOTRUN -> [SKIP][91] ([fdo#109271]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-nick/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - bat-atsm-1:         NOTRUN -> [SKIP][92] ([i915#1836])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         NOTRUN -> [ABORT][93] ([i915#8442])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [ABORT][94] ([i915#7911] / [i915#7913]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [DMESG-FAIL][96] ([i915#7059]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [TIMEOUT][98] ([i915#6794] / [i915#7392]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-2/igt@i915_selftest@live@mman.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-2/igt@i915_selftest@live@mman.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         [ABORT][100] -> [SKIP][101] ([i915#1072])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7345 -> IGTPW_9238

  CI-20190529: 20190529
  CI_DRM_13302: 839a0f1c0fba27caa09cb8c3c07ba21ba7428bb6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9238: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/index.html
  IGT_7345: bedba6f82d70f8eb49c53cb2c45ee60a1eec04d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/index.html

--===============0355431877330540174==
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
<tr><td><b>Series:</b></td><td>XE test cleanup to handle xe_device (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117263/">https://patchwork.freedesktop.org/series/117263/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7345 -&gt; IGTPW_9238</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9238 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9238, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9238:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_close_race@basic-threads:</p>
<ul>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-atsm-1/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-jsl-3/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-jsl-3/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-hsw-4770/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-hsw-4770/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-ivb-3770/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-ivb-3770/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-8/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-8/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-elk-e7500/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-elk-e7500/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-8/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-8/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-guc/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-guc/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlm-1/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlm-1/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-jsl-1/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-jsl-1/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-bsw-n3050/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-n3050/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-1/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-1/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg1-5/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg1-5/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg1-7/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg1-7/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-glk-j4005/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-glk-j4005/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlp-9/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlp-9/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-7567u/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-7567u/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rplp-1/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rplp-1/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-rkl-11600/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-rkl-11600/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adls-5/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adls-5/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-cfl-guc/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-cfl-guc/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-9/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-9/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-x1275/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-x1275/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-cfl-8109u/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-cfl-8109u/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adln-1/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adln-1/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-kbl-8809g/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-kbl-8809g/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-ilk-650/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-ilk-650/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-tgl-1115g4/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-tgl-1115g4/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-blb-e6850/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-blb-e6850/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlp-6/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlp-6/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-6/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-6/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-skl-6600u/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-skl-6600u/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-apl-guc/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-apl-guc/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-2/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-2/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-skl-guc/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-skl-guc/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-11/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-11/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-cfl-8700k/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-cfl-8700k/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-bsw-nick/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-nick/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
<li>
<p>bat-kbl-2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-kbl-2/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-kbl-2/igt@gem_close_race@basic-threads.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9238 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-adlp-11/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@i915_selftest@live@gt_engines.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-nick/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@sprite_plane_onoff:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7345/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7345 -&gt; IGTPW_9238</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13302: 839a0f1c0fba27caa09cb8c3c07ba21ba7428bb6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9238: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9238/index.html<br />
  IGT_7345: bedba6f82d70f8eb49c53cb2c45ee60a1eec04d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0355431877330540174==--
