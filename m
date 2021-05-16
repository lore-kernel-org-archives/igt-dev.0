Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 16 May 2021 00:07:22 -0000
Message-ID: <162112364221.6783.2273613492988196157@emeril.freedesktop.org>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_PXP_Test_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0013380424=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0013380424==
Content-Type: multipart/alternative;
 boundary="===============8788623250562929461=="

--===============8788623250562929461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce PXP Test (rev4)
URL   : https://patchwork.freedesktop.org/series/87570/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10087 -> IGTPW_5814
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5814:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {fi-tgl-1115g4}:    NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-tgl-1115g4/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_5814 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@fork-compute0:
    - fi-ivb-3770:        NOTRUN -> [SKIP][2] ([fdo#109271]) +31 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-ivb-3770/igt@amdgpu/amd_cs_nop@fork-compute0.html

  * igt@amdgpu/amd_prime@i915-to-amd:
    - fi-snb-2520m:       NOTRUN -> [SKIP][3] ([fdo#109271]) +37 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-snb-2520m/igt@amdgpu/amd_prime@i915-to-amd.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-r:           NOTRUN -> [SKIP][4] ([fdo#109271]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@gem_exec_fence@basic-busy@bcs0.html
    - fi-cml-u2:          NOTRUN -> [SKIP][5] ([i915#1208]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_exec_fence@nb-await@vecs0:
    - fi-bsw-nick:        [PASS][6] -> [FAIL][7] ([i915#3457]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@gem_exec_fence@nb-await@vecs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@gem_exec_fence@nb-await@vecs0.html
    - fi-bsw-n3050:       [PASS][8] -> [FAIL][9] ([i915#3457]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html

  * igt@gem_exec_gttfill@basic:
    - fi-apl-guc:         [PASS][10] -> [FAIL][11] ([i915#3457])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-apl-guc/igt@gem_exec_gttfill@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-apl-guc/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cml-u2:          NOTRUN -> [SKIP][12] ([i915#2190])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@gem_huc_copy@huc-copy.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#2190])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html
    - fi-kbl-r:           NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#2190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@gem_huc_copy@huc-copy.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html

  * igt@gem_wait@wait@all:
    - fi-bwr-2160:        [PASS][16] -> [FAIL][17] ([i915#3457])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bwr-2160/igt@gem_wait@wait@all.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bwr-2160/igt@gem_wait@wait@all.html

  * igt@i915_module_load@reload:
    - fi-cml-u2:          NOTRUN -> [DMESG-WARN][18] ([i915#3457]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@i915_module_load@reload.html
    - fi-cfl-8700k:       NOTRUN -> [DMESG-WARN][19] ([i915#3457]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@i915_module_load@reload.html
    - fi-snb-2520m:       NOTRUN -> [DMESG-WARN][20] ([i915#3457]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-snb-2520m/igt@i915_module_load@reload.html
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][21] ([i915#3457]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-ivb-3770/igt@i915_module_load@reload.html
    - fi-skl-6700k2:      NOTRUN -> [DMESG-WARN][22] ([i915#3457]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-r:           NOTRUN -> [DMESG-FAIL][23] ([i915#3462])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@i915_selftest@live@execlists.html
    - fi-cfl-8700k:       NOTRUN -> [DMESG-FAIL][24] ([i915#3462])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@i915_selftest@live@execlists.html
    - fi-skl-6700k2:      NOTRUN -> [DMESG-FAIL][25] ([i915#3462])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@i915_selftest@live@execlists.html
    - fi-cml-u2:          NOTRUN -> [DMESG-FAIL][26] ([i915#3462])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@mman:
    - fi-kbl-r:           NOTRUN -> [DMESG-WARN][27] ([i915#3457]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@i915_selftest@live@mman.html

  * igt@kms_chamelium@dp-hpd-fast:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][28] ([fdo#109271]) +13 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@kms_chamelium@dp-hpd-fast.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][29] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-ivb-3770/igt@kms_chamelium@dp-hpd-fast.html
    - fi-cml-u2:          NOTRUN -> [SKIP][30] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-r:           NOTRUN -> [SKIP][31] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-snb-2520m:       NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-snb-2520m/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_chamelium@vga-edid-read:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][33] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-cml-u2:          NOTRUN -> [SKIP][34] ([fdo#109285])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cml-u2:          NOTRUN -> [SKIP][35] ([fdo#109278] / [i915#533])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#533])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#533])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-kbl-r:           NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#533])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-pnv-d510:        [PASS][39] -> [FAIL][40] ([i915#53])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-elk-e7500:       [PASS][41] -> [FAIL][42] ([i915#53]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@prime_vgem@basic-userptr:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][43] ([fdo#109271]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@prime_vgem@basic-userptr.html
    - fi-cml-u2:          NOTRUN -> [SKIP][44] ([i915#3301])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][45] ([i915#3363])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@runner@aborted.html
    - fi-kbl-r:           NOTRUN -> [FAIL][46] ([i915#1436] / [i915#3363])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@runner@aborted.html
    - fi-cml-u2:          NOTRUN -> [FAIL][47] ([i915#3363])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@runner@aborted.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][48] ([i915#1436] / [i915#2426] / [i915#3363])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@bcs0:
    - fi-bsw-n3050:       [FAIL][49] ([i915#3457]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html

  * igt@gem_wait@busy@all:
    - fi-bsw-nick:        [FAIL][51] ([i915#3177] / [i915#3457]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@gem_wait@busy@all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@gem_wait@busy@all.html
    - fi-apl-guc:         [FAIL][53] ([i915#3457]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-apl-guc/igt@gem_wait@busy@all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-apl-guc/igt@gem_wait@busy@all.html

  * igt@gem_wait@wait@all:
    - fi-bsw-nick:        [FAIL][55] ([i915#3457]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@gem_wait@wait@all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@gem_wait@wait@all.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:
    - fi-pnv-d510:        [FAIL][57] ([i915#53]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - fi-elk-e7500:       [FAIL][59] ([i915#53]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-elk-e7500:       [DMESG-FAIL][61] ([i915#3457]) -> [DMESG-WARN][62] ([i915#3457])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-elk-e7500/igt@i915_module_load@reload.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-elk-e7500/igt@i915_module_load@reload.html
    - fi-bsw-nick:        [DMESG-WARN][63] ([i915#3457]) -> [DMESG-FAIL][64] ([i915#3457])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@i915_module_load@reload.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@i915_module_load@reload.html

  * igt@runner@aborted:
    - fi-kbl-x1275:       [FAIL][65] ([i915#1436] / [i915#3363]) -> [FAIL][66] ([i915#1436] / [i915#2426] / [i915#3363])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-kbl-x1275/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-x1275/igt@runner@aborted.html
    - fi-kbl-guc:         [FAIL][67] ([i915#1436] / [i915#3363]) -> [FAIL][68] ([i915#1436] / [i915#2426] / [i915#3363])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-kbl-guc/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1208]: https://gitlab.freedesktop.org/drm/intel/issues/1208
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3177]: https://gitlab.freedesktop.org/drm/intel/issues/3177
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3457]: https://gitlab.freedesktop.org/drm/intel/issues/3457
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (25 -> 24)
------------------------------

  Additional (7): fi-cml-u2 fi-tgl-1115g4 fi-cfl-8700k fi-snb-2520m fi-ivb-3770 fi-skl-6700k2 fi-kbl-r 
  Missing    (8): fi-ehl-1 fi-bdw-5557u fi-icl-u2 fi-bsw-cyan fi-ilk-650 fi-dg1-1 fi-bsw-kefka fi-snb-2600 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6084 -> IGTPW_5814

  CI-20190529: 20190529
  CI_DRM_10087: 5702f656a0e387dc1da0ac7f4a34927133c63cf4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5814: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html
  IGT_6084: 5c5734d8ee1afac871b69c4554ff14e9b56100e4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_pxp@create-protected-buffer
+igt@gem_pxp@create-regular-buffer
+igt@gem_pxp@create-regular-context-1
+igt@gem_pxp@create-regular-context-2
+igt@gem_pxp@create-valid-protected-context
+igt@gem_pxp@display-protected-crc-without-hdcp
+igt@gem_pxp@display-protected-crc-with-hdcp
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted
+igt@gem_pxp@fail-invalid-protected-context
+igt@gem_pxp@hw-rejects-pxp-buffer
+igt@gem_pxp@hw-rejects-pxp-context
+igt@gem_pxp@protected-encrypted-src-copy-not-readible
+igt@gem_pxp@protected-raw-src-copy-not-readible
+igt@gem_pxp@regular-baseline-src-copy-readible
+igt@gem_pxp@reject-modify-context-protection-off-1
+igt@gem_pxp@reject-modify-context-protection-off-2
+igt@gem_pxp@reject-modify-context-protection-off-3
+igt@gem_pxp@reject-modify-context-protection-on
+igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html

--===============8788623250562929461==
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
<tr><td><b>Series:</b></td><td>Introduce PXP Test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/87570/">https://patchwork.freedesktop.org/series/87570/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10087 -&gt; IGTPW_5814</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5814:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{fi-tgl-1115g4}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-tgl-1115g4/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5814 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@fork-compute0:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-ivb-3770/igt@amdgpu/amd_cs_nop@fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_prime@i915-to-amd:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-snb-2520m/igt@amdgpu/amd_prime@i915-to-amd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1208">i915#1208</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@nb-await@vecs0:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-n3050/igt@gem_exec_fence@nb-await@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-apl-guc/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-apl-guc/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bwr-2160/igt@gem_wait@wait@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bwr-2160/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-snb-2520m/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-ivb-3770/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@i915_selftest@live@mman.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-ivb-3770/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-snb-2520m/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@kms_chamelium@vga-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-pnv-d510/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-elk-e7500/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-skl-6700k2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@bcs0:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-n3050/igt@gem_exec_fence@basic-await@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_wait@busy@all:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3177">i915#3177</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-apl-guc/igt@gem_wait@busy@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-apl-guc/igt@gem_wait@busy@all.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_wait@wait@all:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@gem_wait@wait@all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@gem_wait@wait@all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-pnv-d510/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/53">i915#53</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-elk-e7500/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-elk-e7500/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-elk-e7500/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-bsw-nick/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-bsw-nick/igt@i915_module_load@reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3457">i915#3457</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10087/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (25 -&gt; 24)</h2>
<p>Additional (7): fi-cml-u2 fi-tgl-1115g4 fi-cfl-8700k fi-snb-2520m fi-ivb-3770 fi-skl-6700k2 fi-kbl-r <br />
  Missing    (8): fi-ehl-1 fi-bdw-5557u fi-icl-u2 fi-bsw-cyan fi-ilk-650 fi-dg1-1 fi-bsw-kefka fi-snb-2600 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6084 -&gt; IGTPW_5814</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10087: 5702f656a0e387dc1da0ac7f4a34927133c63cf4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5814: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5814/index.html<br />
  IGT_6084: 5c5734d8ee1afac871b69c4554ff14e9b56100e4 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_pxp@create-protected-buffer<br />
+igt@gem_pxp@create-regular-buffer<br />
+igt@gem_pxp@create-regular-context-1<br />
+igt@gem_pxp@create-regular-context-2<br />
+igt@gem_pxp@create-valid-protected-context<br />
+igt@gem_pxp@display-protected-crc-without-hdcp<br />
+igt@gem_pxp@display-protected-crc-with-hdcp<br />
+igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted<br />
+igt@gem_pxp@fail-invalid-protected-context<br />
+igt@gem_pxp@hw-rejects-pxp-buffer<br />
+igt@gem_pxp@hw-rejects-pxp-context<br />
+igt@gem_pxp@protected-encrypted-src-copy-not-readible<br />
+igt@gem_pxp@protected-raw-src-copy-not-readible<br />
+igt@gem_pxp@regular-baseline-src-copy-readible<br />
+igt@gem_pxp@reject-modify-context-protection-off-1<br />
+igt@gem_pxp@reject-modify-context-protection-off-2<br />
+igt@gem_pxp@reject-modify-context-protection-off-3<br />
+igt@gem_pxp@reject-modify-context-protection-on<br />
+igt@gem_pxp@verify-pxp-execution-behavior-after-suspend-resume<br />
+igt@gem_pxp@verify-pxp-key-change-after-suspend-resume</p>

</body>
</html>

--===============8788623250562929461==--

--===============0013380424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0013380424==--
