Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3783180117490838226=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 01 Mar 2022 17:36:56 -0000
Message-ID: <164615621631.8602.6755194369912969503@emeril.freedesktop.org>
References: <20220301164330.156289-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220301164330.156289-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fsetmode=3A_Fix_stealing_test?=
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

--===============3783180117490838226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_setmode: Fix stealing test
URL   : https://patchwork.freedesktop.org/series/100893/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11303 -> IGTPW_6725
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6725 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6725, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/index.html

Participating hosts (49 -> 44)
------------------------------

  Additional (3): fi-kbl-soraka fi-tgl-dsi fi-pnv-d510 
  Missing    (8): fi-cml-u2 shard-tglu fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 shard-rkl shard-dg1 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6725:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-guc:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-adlp-4:         [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-6:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-tgl-1115g4:      [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-5:          [PASS][9] -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_setmode@basic-clone-single-crtc:
    - {bat-rpls-2}:       NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-dsi/igt@kms_setmode@basic-clone-single-crtc.html
    - {fi-jsl-1}:         [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - {bat-jsl-1}:        [PASS][15] -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
    - {fi-ehl-2}:         [PASS][17] -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html
    - {bat-adlp-6}:       [PASS][19] -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
    - {bat-jsl-2}:        [PASS][21] -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11303 and IGTPW_6725:

### New IGT tests (53) ###

  * igt@amdgpu/amd_basic@cs-compute:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_basic@cs-gfx:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_basic@cs-multi-fence:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_basic@cs-sdma:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_basic@memory-alloc:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_basic@query-info:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_basic@semaphore:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_basic@userptr:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@fork-gfx0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@nop-compute0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@sync-compute0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@sync-fork-gfx0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_cs_nop@sync-gfx0:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_prime@amd-to-i915:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@amdgpu/amd_prime@i915-to-amd:
    - Statuses : 29 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_basic@basic:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_fence@basic-await:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-await@bcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.06, 0.33] s

  * igt@gem_exec_fence@basic-await@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.06, 0.33] s

  * igt@gem_exec_fence@basic-await@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.06, 0.30] s

  * igt@gem_exec_fence@basic-await@vcs1:
    - Statuses : 11 pass(s)
    - Exec time: [0.07, 0.23] s

  * igt@gem_exec_fence@basic-await@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.07, 0.30] s

  * igt@gem_exec_fence@basic-busy:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-busy@bcs0:
    - Statuses : 21 pass(s) 15 skip(s)
    - Exec time: [0.00, 0.05] s

  * igt@gem_exec_fence@basic-busy@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@gem_exec_fence@basic-busy@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_exec_fence@basic-busy@vcs1:
    - Statuses : 11 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@gem_exec_fence@basic-busy@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@gem_exec_fence@basic-wait:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@basic-wait@bcs0:
    - Statuses : 21 pass(s) 15 skip(s)
    - Exec time: [0.00, 0.04] s

  * igt@gem_exec_fence@basic-wait@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@gem_exec_fence@basic-wait@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_exec_fence@basic-wait@vcs1:
    - Statuses : 11 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_exec_fence@basic-wait@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@gem_exec_fence@nb-await:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@gem_exec_fence@nb-await@bcs0:
    - Statuses : 36 pass(s)
    - Exec time: [0.05, 0.12] s

  * igt@gem_exec_fence@nb-await@rcs0:
    - Statuses : 40 pass(s)
    - Exec time: [0.05, 0.15] s

  * igt@gem_exec_fence@nb-await@vcs0:
    - Statuses : 38 pass(s)
    - Exec time: [0.05, 0.11] s

  * igt@gem_exec_fence@nb-await@vcs1:
    - Statuses : 11 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@gem_exec_fence@nb-await@vecs0:
    - Statuses : 35 pass(s)
    - Exec time: [0.05, 0.13] s

  * igt@i915_pm_backlight@basic-brightness:
    - Statuses : 12 pass(s) 26 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - Statuses : 24 pass(s) 14 skip(s)
    - Exec time: [0.0, 4.98] s

  * igt@i915_pm_rpm@basic-rte:
    - Statuses : 24 pass(s) 14 skip(s)
    - Exec time: [0.85, 31.23] s

  * igt@i915_pm_rpm@module-reload:
    - Statuses : 30 pass(s) 8 skip(s)
    - Exec time: [0.0, 40.08] s

  * igt@i915_pm_rps@basic-api:
    - Statuses : 1 fail(s) 32 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@kms_busy@basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_busy@basic@flip:
    - Statuses : 2 dmesg-warn(s) 1 incomplete(s) 29 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.39] s

  * igt@kms_busy@basic@modeset:
    - Statuses : 1 dmesg-warn(s) 26 pass(s) 5 skip(s)
    - Exec time: [0.0, 5.19] s

  * igt@kms_setmode@basic-clone-single-crtc@pipe-a-vga-1-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  * igt@kms_setmode@basic-clone-single-crtc@pipe-b-vga-1-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.08] s

  

Known issues
------------

  Here are the changes found in IGTPW_6725 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][23] ([fdo#109315])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-dsi/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_basic@semaphore (NEW):
    - fi-hsw-4770:        NOTRUN -> [SKIP][24] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html

  * igt@amdgpu/amd_cs_nop@fork-gfx0 (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][25] ([fdo#109315] / [i915#2575]) +16 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-dsi/igt@amdgpu/amd_cs_nop@fork-gfx0.html

  * igt@gem_exec_fence@basic-busy@bcs0 (NEW):
    - fi-kbl-soraka:      NOTRUN -> [SKIP][26] ([fdo#109271]) +9 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       [PASS][27] -> [INCOMPLETE][28] ([i915#4547])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][29] ([fdo#109271]) +58 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_backlight@basic-brightness (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][32] ([i915#1155])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@basic-pci-d3-state (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][33] ([fdo#109308]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][34] ([i915#1886] / [i915#2291])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_busy@basic (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][35] ([i915#1845])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@kms_busy@basic.html

  * igt@kms_busy@basic@flip (NEW):
    - {bat-adlp-6}:       [PASS][36] -> [DMESG-WARN][37] ([i915#3576])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-6/igt@kms_busy@basic@flip.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-6/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#533])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - bat-adlp-4:         [PASS][40] -> [DMESG-WARN][41] ([i915#3576]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-4/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-4/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-skl-6700k2:      [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-blb-e6850:       [PASS][44] -> [SKIP][45] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-x1275:       [PASS][46] -> [SKIP][47] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bsw-kefka:       [PASS][48] -> [SKIP][49] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bwr-2160:        [PASS][50] -> [SKIP][51] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bsw-nick:        [PASS][52] -> [SKIP][53] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-guc:         [PASS][54] -> [SKIP][55] ([fdo#109271])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-8809g:       [PASS][56] -> [SKIP][57] ([fdo#109271])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-ilk-650:         [PASS][58] -> [SKIP][59] ([fdo#109271])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-elk-e7500:       [PASS][60] -> [SKIP][61] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-glk-dsi:         [PASS][62] -> [SKIP][63] ([fdo#109271])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-glk-dsi/igt@kms_setmode@basic-clone-single-crtc.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-glk-dsi/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-snb-2520m:       [PASS][64] -> [SKIP][65] ([fdo#109271])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-cfl-8109u:       [PASS][66] -> [SKIP][67] ([fdo#109271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-7500u:       [PASS][68] -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bxt-dsi:         [PASS][70] -> [SKIP][71] ([fdo#109271])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-hsw-4770:        [PASS][72] -> [SKIP][73] ([fdo#109271])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-cfl-guc:         [PASS][74] -> [SKIP][75] ([fdo#109271])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-kbl-7567u:       [PASS][76] -> [SKIP][77] ([fdo#109271])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-skl-guc:         [PASS][78] -> [SKIP][79] ([fdo#109271])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-bsw-n3050:       [PASS][80] -> [SKIP][81] ([fdo#109271])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-ivb-3770:        [PASS][82] -> [SKIP][83] ([fdo#109271])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-cfl-8700k:       [PASS][84] -> [SKIP][85] ([fdo#109271])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-glk-j4005:       [PASS][86] -> [SKIP][87] ([fdo#109271])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-2}:       [INCOMPLETE][88] ([i915#4898]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_pm_rpm@module-reload (NEW):
    - fi-kbl-guc:         [INCOMPLETE][90] ([i915#151]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][92] ([i915#3303]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_busy@basic@modeset (NEW):
    - {bat-adlp-6}:       [DMESG-WARN][94] ([i915#3576]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-6/igt@kms_busy@basic@modeset.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-6/igt@kms_busy@basic@modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - bat-adlp-4:         [DMESG-WARN][96] ([i915#3576]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4898]: https://gitlab.freedesktop.org/drm/intel/issues/4898
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6361 -> IGTPW_6725

  CI-20190529: 20190529
  CI_DRM_11303: 329182aa4c789d378e58b87b5f283116d87278a7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6725: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/index.html
  IGT_6361: 2372a4beb6a33c5f0799a4a8ccbb93794f52dbca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/index.html

--===============3783180117490838226==
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
<tr><td><b>Series:</b></td><td>tests/kms_setmode: Fix stealing test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/100893/">https://patchwork.freedesktop.org/series/100893/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11303 -&gt; IGTPW_6725</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6725 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6725, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/index.html</p>
<h2>Participating hosts (49 -&gt; 44)</h2>
<p>Additional (3): fi-kbl-soraka fi-tgl-dsi fi-pnv-d510 <br />
  Missing    (8): fi-cml-u2 shard-tglu fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 shard-rkl shard-dg1 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6725:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-rkl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-dg1-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-1115g4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-dsi/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-ehl-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-jsl-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11303 and IGTPW_6725:</p>
<h3>New IGT tests (53)</h3>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-compute:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@cs-multi-fence:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@cs-sdma:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@memory-alloc:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@userptr:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-compute0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-compute0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-gfx0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-gfx0:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@amd-to-i915:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@i915-to-amd:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_basic@basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.06, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.06, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.06, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vcs1:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.07, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.07, 0.30] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>Statuses : 21 pass(s) 15 skip(s)</li>
<li>Exec time: [0.00, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vcs1:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>Statuses : 21 pass(s) 15 skip(s)</li>
<li>Exec time: [0.00, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vcs1:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@bcs0:</p>
<ul>
<li>Statuses : 36 pass(s)</li>
<li>Exec time: [0.05, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@rcs0:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.05, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs0:</p>
<ul>
<li>Statuses : 38 pass(s)</li>
<li>Exec time: [0.05, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vcs1:</p>
<ul>
<li>Statuses : 11 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>Statuses : 35 pass(s)</li>
<li>Exec time: [0.05, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>Statuses : 12 pass(s) 26 skip(s)</li>
<li>Exec time: [0.0, 0.27] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 24 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 4.98] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 24 pass(s) 14 skip(s)</li>
<li>Exec time: [0.85, 31.23] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 30 pass(s) 8 skip(s)</li>
<li>Exec time: [0.0, 40.08] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>Statuses : 1 fail(s) 32 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>Statuses : 2 dmesg-warn(s) 1 incomplete(s) 29 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 26 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 5.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc@pipe-a-vga-1-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc@pipe-b-vga-1-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6725 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-dsi/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_basic@semaphore (NEW):</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-gfx0 (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-tgl-dsi/igt@amdgpu/amd_cs_nop@fork-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0 (NEW):</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +58 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness (NEW):</p>
<ul>
<li>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state (NEW):</p>
<ul>
<li>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109308">fdo#109308</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic (NEW):</p>
<ul>
<li>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip (NEW):</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-6/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-6/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-soraka/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-c:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-4/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-4/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-skl-6700k2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-blb-e6850/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-x1275/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bsw-kefka/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bwr-2160/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bsw-nick/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-8809g/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-ilk-650/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-elk-e7500/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-glk-dsi/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-glk-dsi/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-snb-2520m/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-cfl-8109u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-7500u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bxt-dsi/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-hsw-4770/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-cfl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-7567u/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-skl-guc/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-bsw-n3050/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-ivb-3770/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-cfl-8700k/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-glk-j4005/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4898">i915#4898</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-rpls-2/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload (NEW):</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/151">i915#151</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-kbl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset (NEW):</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-6/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-6/igt@kms_busy@basic@modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11303/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6361 -&gt; IGTPW_6725</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11303: 329182aa4c789d378e58b87b5f283116d87278a7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6725: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6725/index.html<br />
  IGT_6361: 2372a4beb6a33c5f0799a4a8ccbb93794f52dbca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3783180117490838226==--
