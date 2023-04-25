Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8877377166469681330=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 25 Apr 2023 10:26:59 -0000
Message-ID: <168241841981.24069.11666716265399612248@emeril.freedesktop.org>
References: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230425064953.2121947-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIElH?=
 =?utf-8?q?T_display_support_for_XE_=28rev4=29?=
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

--===============8877377166469681330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add IGT display support for XE (rev4)
URL   : https://patchwork.freedesktop.org/series/116658/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7269 -> IGTPW_8853
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_8853 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_8853, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/index.html

Participating hosts (38 -> 38)
------------------------------

  Additional (1): bat-mtlp-8 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8853:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_render_linear_blits@basic:
    - fi-rkl-11600:       [PASS][1] -> [FAIL][2] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-rkl-11600/igt@gem_render_linear_blits@basic.html
    - fi-skl-6600u:       [PASS][3] -> [FAIL][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-skl-6600u/igt@gem_render_linear_blits@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-skl-6600u/igt@gem_render_linear_blits@basic.html
    - bat-adls-5:         [PASS][5] -> [FAIL][6] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adls-5/igt@gem_render_linear_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adls-5/igt@gem_render_linear_blits@basic.html
    - fi-apl-guc:         [PASS][7] -> [FAIL][8] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-apl-guc/igt@gem_render_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-apl-guc/igt@gem_render_linear_blits@basic.html
    - bat-dg1-5:          [PASS][9] -> [FAIL][10] +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg1-5/igt@gem_render_linear_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg1-5/igt@gem_render_linear_blits@basic.html
    - bat-atsm-1:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-atsm-1/igt@gem_render_linear_blits@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-atsm-1/igt@gem_render_linear_blits@basic.html
    - bat-dg1-7:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg1-7/igt@gem_render_linear_blits@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg1-7/igt@gem_render_linear_blits@basic.html
    - bat-jsl-3:          [PASS][15] -> [FAIL][16] +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-jsl-3/igt@gem_render_linear_blits@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-jsl-3/igt@gem_render_linear_blits@basic.html
    - fi-skl-guc:         [PASS][17] -> [FAIL][18] +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-skl-guc/igt@gem_render_linear_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-skl-guc/igt@gem_render_linear_blits@basic.html
    - fi-kbl-soraka:      [PASS][19] -> [FAIL][20] +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html
    - fi-kbl-7567u:       [PASS][21] -> [FAIL][22] +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html
    - fi-kbl-8809g:       [PASS][23] -> [FAIL][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html
    - fi-elk-e7500:       [PASS][25] -> [FAIL][26] +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-elk-e7500/igt@gem_render_linear_blits@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-elk-e7500/igt@gem_render_linear_blits@basic.html
    - fi-bsw-nick:        [PASS][27] -> [FAIL][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-bsw-nick/igt@gem_render_linear_blits@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-bsw-nick/igt@gem_render_linear_blits@basic.html
    - bat-dg2-9:          [PASS][29] -> [FAIL][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg2-9/igt@gem_render_linear_blits@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg2-9/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-glk-j4005:       [PASS][31] -> [FAIL][32] +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html
    - bat-adlp-9:         [PASS][33] -> [FAIL][34] +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adlp-9/igt@gem_render_tiled_blits@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlp-9/igt@gem_render_tiled_blits@basic.html
    - fi-cfl-8700k:       [PASS][35] -> [FAIL][36] +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html
    - fi-blb-e6850:       [PASS][37] -> [FAIL][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-blb-e6850/igt@gem_render_tiled_blits@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-blb-e6850/igt@gem_render_tiled_blits@basic.html
    - bat-rplp-1:         [PASS][39] -> [FAIL][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-rplp-1/igt@gem_render_tiled_blits@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rplp-1/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-x1275:       [PASS][41] -> [FAIL][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-kbl-guc:         [PASS][43] -> [FAIL][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-guc/igt@gem_tiled_blits@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-guc/igt@gem_tiled_blits@basic.html
    - bat-adlm-1:         [PASS][45] -> [FAIL][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adlm-1/igt@gem_tiled_blits@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlm-1/igt@gem_tiled_blits@basic.html
    - fi-ilk-650:         [PASS][47] -> [FAIL][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-ilk-650/igt@gem_tiled_blits@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-ilk-650/igt@gem_tiled_blits@basic.html
    - bat-jsl-1:          [PASS][49] -> [FAIL][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-jsl-1/igt@gem_tiled_blits@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-jsl-1/igt@gem_tiled_blits@basic.html
    - fi-tgl-1115g4:      [PASS][51] -> [FAIL][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html
    - bat-rpls-1:         [PASS][53] -> [FAIL][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-rpls-1/igt@gem_tiled_blits@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rpls-1/igt@gem_tiled_blits@basic.html
    - fi-cfl-guc:         [PASS][55] -> [FAIL][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-cfl-guc/igt@gem_tiled_blits@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-cfl-guc/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@perf:
    - bat-jsl-3:          [PASS][57] -> [INCOMPLETE][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-jsl-3/igt@i915_selftest@live@perf.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-jsl-3/igt@i915_selftest@live@perf.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-hsw-4770:        [PASS][59] -> [FAIL][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html
    - fi-cfl-8109u:       [PASS][61] -> [FAIL][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
    - bat-adln-1:         [PASS][63] -> [FAIL][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html
    - fi-ivb-3770:        [PASS][65] -> [FAIL][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-8:          [PASS][67] -> [FAIL][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html
    - fi-bsw-n3050:       [PASS][69] -> [FAIL][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-6:         [PASS][71] -> [FAIL][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_render_linear_blits@basic:
    - {bat-mtlp-8}:       NOTRUN -> [FAIL][73]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-mtlp-8/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - {bat-kbl-2}:        [PASS][74] -> [FAIL][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-kbl-2/igt@gem_render_tiled_blits@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-kbl-2/igt@gem_render_tiled_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_8853 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-rpls-1:         NOTRUN -> [ABORT][76] ([i915#6687] / [i915#7978])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][77] -> [DMESG-FAIL][78] ([i915#5334] / [i915#7872])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-adlp-9:         NOTRUN -> [SKIP][79] ([i915#3546]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [DMESG-FAIL][80] ([i915#5334]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][82] ([i915#4983] / [i915#8384]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-rpls-1/igt@i915_selftest@live@reset.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:
    - bat-dg2-8:          [FAIL][84] ([i915#7932]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7932]: https://gitlab.freedesktop.org/drm/intel/issues/7932
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#7982]: https://gitlab.freedesktop.org/drm/intel/issues/7982
  [i915#8346]: https://gitlab.freedesktop.org/drm/intel/issues/8346
  [i915#8368]: https://gitlab.freedesktop.org/drm/intel/issues/8368
  [i915#8379]: https://gitlab.freedesktop.org/drm/intel/issues/8379
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7269 -> IGTPW_8853

  CI-20190529: 20190529
  CI_DRM_13058: fede13f9f2652d90dc454741c1758f9b83dda701 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8853: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/index.html
  IGT_7269: 066dbb9b87fd2423299532c716b8264721c16f76 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_scaling@intel-max-src-size
+igt@xe_gpgpu_fill@basic
+igt@xe_intel_bb@add-remove-objects
+igt@xe_intel_bb@bb-with-allocator
+igt@xe_intel_bb@blit-reloc
+igt@xe_intel_bb@blit-simple
+igt@xe_intel_bb@create-in-region
+igt@xe_intel_bb@delta-check
+igt@xe_intel_bb@destroy-bb
+igt@xe_intel_bb@full-batch
+igt@xe_intel_bb@intel-bb-blit-none
+igt@xe_intel_bb@intel-bb-blit-x
+igt@xe_intel_bb@intel-bb-blit-y
+igt@xe_intel_bb@lot-of-buffers
+igt@xe_intel_bb@offset-control
+igt@xe_intel_bb@purge-bb
+igt@xe_intel_bb@render
+igt@xe_intel_bb@reset-bb
+igt@xe_intel_bb@simple-bb
+igt@xe_intel_bb@simple-bb-ctx
-igt@kms_plane_scaling@i915-max-src-size

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/index.html

--===============8877377166469681330==
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
<tr><td><b>Series:</b></td><td>Add IGT display support for XE (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116658/">https://patchwork.freedesktop.org/series/116658/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7269 -&gt; IGTPW_8853</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8853 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_8853, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/index.html</p>
<h2>Participating hosts (38 -&gt; 38)</h2>
<p>Additional (1): bat-mtlp-8 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8853:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-rkl-11600/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-skl-6600u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-skl-6600u/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adls-5/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adls-5/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-apl-guc/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-apl-guc/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg1-5/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg1-5/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-atsm-1/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-atsm-1/igt@gem_render_linear_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg1-7/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg1-7/igt@gem_render_linear_blits@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-jsl-3/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-jsl-3/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-skl-guc/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-skl-guc/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-7567u/igt@gem_render_linear_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-8809g/igt@gem_render_linear_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-elk-e7500/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-elk-e7500/igt@gem_render_linear_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-bsw-nick/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-bsw-nick/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg2-9/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg2-9/igt@gem_render_linear_blits@basic.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-glk-j4005/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adlp-9/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlp-9/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-cfl-8700k/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-blb-e6850/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-blb-e6850/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-rplp-1/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rplp-1/igt@gem_render_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-x1275/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adlm-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlm-1/igt@gem_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-ilk-650/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-ilk-650/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-jsl-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-jsl-1/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-tgl-1115g4/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-rpls-1/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rpls-1/igt@gem_tiled_blits@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-cfl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-cfl-guc/igt@gem_tiled_blits@basic.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-jsl-3/igt@i915_selftest@live@perf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-jsl-3/igt@i915_selftest@live@perf.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-hsw-4770/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adln-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-ivb-3770/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg2-8/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-bsw-n3050/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlp-6/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>{bat-mtlp-8}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-mtlp-8/igt@gem_render_linear_blits@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>{bat-kbl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-kbl-2/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-kbl-2/igt@gem_render_tiled_blits@basic.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8853 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-adlp-9/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7269/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7932">i915#7932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/bat-dg2-8/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-d-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7269 -&gt; IGTPW_8853</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13058: fede13f9f2652d90dc454741c1758f9b83dda701 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8853: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8853/index.html<br />
  IGT_7269: 066dbb9b87fd2423299532c716b8264721c16f76 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_scaling@intel-max-src-size<br />
+igt@xe_gpgpu_fill@basic<br />
+igt@xe_intel_bb@add-remove-objects<br />
+igt@xe_intel_bb@bb-with-allocator<br />
+igt@xe_intel_bb@blit-reloc<br />
+igt@xe_intel_bb@blit-simple<br />
+igt@xe_intel_bb@create-in-region<br />
+igt@xe_intel_bb@delta-check<br />
+igt@xe_intel_bb@destroy-bb<br />
+igt@xe_intel_bb@full-batch<br />
+igt@xe_intel_bb@intel-bb-blit-none<br />
+igt@xe_intel_bb@intel-bb-blit-x<br />
+igt@xe_intel_bb@intel-bb-blit-y<br />
+igt@xe_intel_bb@lot-of-buffers<br />
+igt@xe_intel_bb@offset-control<br />
+igt@xe_intel_bb@purge-bb<br />
+igt@xe_intel_bb@render<br />
+igt@xe_intel_bb@reset-bb<br />
+igt@xe_intel_bb@simple-bb<br />
+igt@xe_intel_bb@simple-bb-ctx<br />
-igt@kms_plane_scaling@i915-max-src-size</p>

</body>
</html>

--===============8877377166469681330==--
