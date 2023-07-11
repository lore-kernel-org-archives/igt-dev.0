Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8749706302686311886=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Date: Tue, 11 Jul 2023 18:30:56 -0000
Message-ID: <168910025667.18667.12408336500142070601@emeril.freedesktop.org>
References: <20230711174319.24569-1-lukasz.laguna@intel.com>
In-Reply-To: <20230711174319.24569-1-lukasz.laguna@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fsysfs=3A_add_asserting_helpers_for_read/write_operations_?=
 =?utf-8?b?KHJldjcp?=
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

--===============8749706302686311886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_sysfs: add asserting helpers for read/write operations (rev7)
URL   : https://patchwork.freedesktop.org/series/119507/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13372 -> IGTPW_9388
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9388 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9388, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/index.html

Participating hosts (41 -> 40)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (2): bat-atsm-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9388:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-skl-6600u:       [PASS][1] -> [FAIL][2] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-glk-j4005:       [PASS][3] -> [FAIL][4] +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-glk-j4005/igt@gem_exec_suspend@basic-s3@smem.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-glk-j4005/igt@gem_exec_suspend@basic-s3@smem.html
    - bat-jsl-1:          [PASS][5] -> [FAIL][6] +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-jsl-1/igt@gem_exec_suspend@basic-s3@smem.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-jsl-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-tgl-1115g4:      [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-bsw-nick:        [PASS][9] -> [FAIL][10] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-adlm-1:         [PASS][11] -> [FAIL][12] +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-rpls-1:         NOTRUN -> [FAIL][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-pnv-d510:        [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][16] -> [FAIL][17] +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - bat-jsl-3:          [PASS][18] -> [FAIL][19] +6 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-jsl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-jsl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - fi-ilk-650:         [PASS][20] -> [FAIL][21] +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-ilk-650/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-ilk-650/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:
    - fi-skl-guc:         [PASS][22] -> [FAIL][23] +6 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-skl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-skl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - fi-blb-e6850:       [PASS][24] -> [FAIL][25] +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-blb-e6850/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-blb-e6850/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][26] +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
    - fi-bsw-n3050:       [PASS][27] -> [FAIL][28] +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [FAIL][29] +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][30] +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-hsw-4770:        [DMESG-WARN][31] ([i915#8841]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-hsw-4770/igt@i915_suspend@basic-s2idle-without-i915.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-pnv-d510:        [ABORT][33] ([i915#8844]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html
    - fi-tgl-1115g4:      [INCOMPLETE][35] ([i915#7443] / [i915#8102]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html
    - fi-hsw-4770:        [ABORT][37] ([i915#8844]) -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-ivb-3770:        [DMESG-WARN][39] ([i915#8841]) -> [FAIL][40] +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_9388 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-11:         [PASS][41] -> [FAIL][42] ([i915#6121] / [i915#8011]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html
    - bat-dg2-8:          [PASS][43] -> [FAIL][44] ([i915#6121] / [i915#8011]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-rkl-11600:       [PASS][45] -> [FAIL][46] ([i915#8011])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-adls-5:         [PASS][47] -> [FAIL][48] ([i915#6121]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adls-5/igt@gem_exec_suspend@basic-s0@smem.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adls-5/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-dg1-5:          [PASS][49] -> [FAIL][50] ([i915#6121] / [i915#8011]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-5/igt@gem_exec_suspend@basic-s0@smem.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-5/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-dg1-7:          [PASS][51] -> [FAIL][52] ([i915#6121] / [i915#8011]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-7/igt@gem_exec_suspend@basic-s0@smem.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-7/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-dg2-9:          [PASS][53] -> [FAIL][54] ([i915#6121] / [i915#8011]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
    - fi-kbl-x1275:       [PASS][55] -> [FAIL][56] ([i915#6121]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0@smem.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0@smem.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][57] ([i915#8011])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0@smem.html
    - fi-kbl-guc:         [PASS][58] -> [FAIL][59] ([i915#6121]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-guc/igt@gem_exec_suspend@basic-s0@smem.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-guc/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-rpls-1:         NOTRUN -> [FAIL][60] ([i915#8011])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@gem_exec_suspend@basic-s0@smem.html
    - bat-adlp-9:         [PASS][61] -> [FAIL][62] ([i915#6121] / [i915#8011])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-9/igt@gem_exec_suspend@basic-s0@smem.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - bat-dg2-9:          [PASS][63] -> [FAIL][64] ([i915#6121]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-mtlp-8:         [PASS][65] -> [FAIL][66] ([i915#6121]) +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html
    - bat-adlp-9:         [PASS][67] -> [FAIL][68] ([i915#6121]) +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-9/igt@gem_exec_suspend@basic-s3@smem.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-9/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#2190])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#4613]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-8109u:       [PASS][71] -> [FAIL][72] ([i915#7940])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][73] ([i915#1886] / [i915#7913])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [PASS][74] -> [ABORT][75] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-rpls-2/igt@i915_selftest@live@reset.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][76] ([i915#6367])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [PASS][77] -> [FAIL][78] ([i915#6121]) +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-7567u:       [PASS][79] -> [FAIL][80] ([i915#6121]) +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-kbl-8809g:       [PASS][81] -> [FAIL][82] ([i915#6121]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-8809g/igt@i915_suspend@basic-s2idle-without-i915.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-8809g/igt@i915_suspend@basic-s2idle-without-i915.html
    - bat-mtlp-6:         [PASS][83] -> [FAIL][84] ([i915#6121]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html
    - fi-apl-guc:         [PASS][85] -> [FAIL][86] ([i915#6121]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-adls-5:         [PASS][87] -> [FAIL][88] ([i915#6121] / [i915#8210])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html
    - bat-dg1-5:          [PASS][89] -> [FAIL][90] ([i915#6121]) +7 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html
    - bat-dg1-7:          [PASS][91] -> [FAIL][92] ([i915#6121]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html
    - bat-adlp-9:         [PASS][93] -> [FAIL][94] ([i915#6121] / [i915#8210])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][95] ([i915#7828])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][96] ([fdo#109271])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - bat-rpls-1:         NOTRUN -> [SKIP][97] ([i915#7828])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][98] ([fdo#109271])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][99] ([fdo#109271]) +15 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][100] ([i915#1845] / [i915#5354]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-1:         NOTRUN -> [SKIP][101] ([i915#1845])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - fi-cfl-8700k:       [PASS][102] -> [FAIL][103] ([i915#6121]) +6 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-8700k/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-8700k/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
    - fi-elk-e7500:       [PASS][104] -> [FAIL][105] ([i915#6121]) +5 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - bat-dg2-8:          [PASS][106] -> [FAIL][107] ([i915#6121]) +6 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - fi-cfl-guc:         [PASS][108] -> [FAIL][109] ([i915#6121]) +6 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
    - bat-dg2-11:         [PASS][110] -> [FAIL][111] ([i915#6121]) +7 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:
    - fi-apl-guc:         NOTRUN -> [FAIL][112] ([i915#6121]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-apl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html

  * igt@kms_psr@primary_page_flip:
    - bat-rplp-1:         NOTRUN -> [SKIP][113] ([i915#1072]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rplp-1/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         NOTRUN -> [ABORT][114] ([i915#8442] / [i915#8712])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-tgl-1115g4:      [FAIL][115] ([i915#7940]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-rkl-11600:       [FAIL][117] ([i915#7940]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][119] ([i915#4983] / [i915#7461] / [i915#7981] / [i915#8347] / [i915#8384]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-rpls-1/igt@i915_selftest@live@reset.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][121] ([i915#6367]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-6/igt@i915_selftest@live@slpc.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][123] ([i915#8442] / [i915#8668]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [DMESG-WARN][125] ([i915#4423]) -> [ABORT][126] ([i915#4423])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-11/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-11/igt@i915_module_load@load.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-cfl-guc:         [FAIL][127] ([i915#7940]) -> [FAIL][128] ([i915#7691])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-6:         [SKIP][129] ([i915#6645]) -> [FAIL][130] ([i915#6121])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html
    - fi-kbl-x1275:       [SKIP][131] ([fdo#109271]) -> [FAIL][132] ([i915#6121])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html
    - bat-mtlp-8:         [SKIP][133] ([i915#6645]) -> [FAIL][134] ([i915#6121])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html
    - bat-dg2-8:          [SKIP][135] ([i915#6645]) -> [FAIL][136] ([i915#6121])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8102]: https://gitlab.freedesktop.org/drm/intel/issues/8102
  [i915#8210]: https://gitlab.freedesktop.org/drm/intel/issues/8210
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8844]: https://gitlab.freedesktop.org/drm/intel/issues/8844


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7380 -> IGTPW_9388

  CI-20190529: 20190529
  CI_DRM_13372: 01c4678ab6c623c621a1dea438133e39711291d4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9388: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/index.html
  IGT_7380: 8e65f12de2fd52c05dc48fdbcb8cfe86f6de1a75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@i915_pm_rps@thresholds
-igt@i915_pm_rps@thresholds-idle
-igt@i915_pm_rps@thresholds-idle-park
-igt@i915_pm_rps@thresholds-park

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/index.html

--===============8749706302686311886==
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
<tr><td><b>Series:</b></td><td>lib/igt_sysfs: add asserting helpers for read/write operations (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119507/">https://patchwork.freedesktop.org/series/119507/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13372 -&gt; IGTPW_9388</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9388 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9388, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/index.html</p>
<h2>Participating hosts (41 -&gt; 40)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (2): bat-atsm-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9388:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-skl-6600u/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-glk-j4005/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-glk-j4005/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-jsl-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-jsl-1/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-bsw-nick/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-adlm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlm-1/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-jsl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-jsl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-ilk-650/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-ilk-650/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-skl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-skl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-2.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-blb-e6850/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-blb-e6850/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-bsw-n3050/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-hsw-4770/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8844">i915#8844</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8102">i915#8102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8844">i915#8844</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9388 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>
<p>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-11/igt@gem_exec_suspend@basic-s0@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) +1 similar issue</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-rkl-11600/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</p>
</li>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adls-5/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adls-5/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-5/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-5/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) +1 similar issue</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-7/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-7/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) +1 similar issue</p>
</li>
<li>
<p>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) +1 similar issue</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-x1275/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +2 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-guc/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-guc/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +3 similar issues</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-9/igt@gem_exec_suspend@basic-s0@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-9/igt@gem_exec_suspend@basic-s3@lmem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-8/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +6 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-9/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-9/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-7567u/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +7 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-8809g/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-8809g/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +3 similar issues</p>
</li>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-6/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +2 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-apl-guc/igt@i915_suspend@basic-s2idle-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-adls-5:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adls-5/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8210">i915#8210</a>)</p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-5/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +7 similar issues</p>
</li>
<li>
<p>bat-dg1-7:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg1-7/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +3 similar issues</p>
</li>
<li>
<p>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-9/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8210">i915#8210</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-hsw-4770/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-pnv-d510/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-8700k/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-8700k/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +6 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-elk-e7500/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1:</p>
<ul>
<li>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-apl-guc/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rplp-1/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8712">i915#8712</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-tgl-1115g4/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-cfl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-cfl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7691">i915#7691</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/fi-kbl-x1275/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</p>
</li>
<li>
<p>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13372/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7380 -&gt; IGTPW_9388</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13372: 01c4678ab6c623c621a1dea438133e39711291d4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9388: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9388/index.html<br />
  IGT_7380: 8e65f12de2fd52c05dc48fdbcb8cfe86f6de1a75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@i915_pm_rps@thresholds<br />
-igt@i915_pm_rps@thresholds-idle<br />
-igt@i915_pm_rps@thresholds-idle-park<br />
-igt@i915_pm_rps@thresholds-park</p>

</body>
</html>

--===============8749706302686311886==--
