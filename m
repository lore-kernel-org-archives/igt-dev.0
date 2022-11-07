Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1931410792245083423=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 07 Nov 2022 11:18:02 -0000
Message-ID: <166781988266.17756.12945155582768437801@emeril.freedesktop.org>
References: <20221107085256.17293-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221107085256.17293-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igdm1fYmlu?=
 =?utf-8?q?d=3A_Add_VM=5FBIND_validation_support_=28rev10=29?=
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

--===============1931410792245083423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vm_bind: Add VM_BIND validation support (rev10)
URL   : https://patchwork.freedesktop.org/series/105881/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12348 -> IGTPW_8052
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/index.html

Participating hosts (39 -> 38)
------------------------------

  Additional (2): bat-atsm-1 bat-adlp-4 
  Missing    (3): fi-ctg-p8600 fi-hsw-4770 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8052:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec3_basic@basic} (NEW):
    - {bat-dg2-11}:       NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-dg2-11/igt@gem_exec3_basic@basic.html

  * {igt@i915_vm_bind_basic@basic-smem} (NEW):
    - {bat-adln-1}:       NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adln-1/igt@i915_vm_bind_basic@basic-smem.html
    - {fi-tgl-mst}:       NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-tgl-mst/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-rplp-1}:       NOTRUN -> [SKIP][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rplp-1/igt@i915_vm_bind_basic@basic-smem.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-rkl-11600/igt@i915_vm_bind_basic@basic-smem.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-adl-ddr5/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-atsm-1}:       NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-atsm-1/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-dg2-9/igt@i915_vm_bind_basic@basic-smem.html
    - bat-adlp-4:         NOTRUN -> [SKIP][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-dg2-8/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-1/igt@i915_vm_bind_basic@basic-smem.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][12] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-ehl-2/igt@i915_vm_bind_basic@basic-smem.html

  * {igt@i915_vm_bind_sanity@basic} (NEW):
    - {bat-rpls-2}:       NOTRUN -> [SKIP][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-2/igt@i915_vm_bind_sanity@basic.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][14] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-rkl-guc/igt@i915_vm_bind_sanity@basic.html
    - {bat-adlp-6}:       NOTRUN -> [SKIP][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-6/igt@i915_vm_bind_sanity@basic.html
    - fi-icl-u2:          NOTRUN -> [SKIP][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-icl-u2/igt@i915_vm_bind_sanity@basic.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][17] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-jsl-1/igt@i915_vm_bind_sanity@basic.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][18] +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-jsl-1/igt@i915_vm_bind_sanity@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@mman:
    - {bat-atsm-1}:       NOTRUN -> [DMESG-FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-atsm-1/igt@i915_selftest@live@mman.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12348 and IGTPW_8052:

### New IGT tests (3) ###

  * igt@gem_exec3_basic@basic:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_basic@basic-smem:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_sanity@basic:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8052 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_exec3_basic@basic} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][20] ([fdo#109271]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bdw-gvtdvm/igt@gem_exec3_basic@basic.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][21] ([fdo#109271]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-pnv-d510/igt@gem_exec3_basic@basic.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][22] ([fdo#109271]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-skl-6700k2/igt@gem_exec3_basic@basic.html

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][23] -> [FAIL][24] ([i915#7229])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-adlp-4:         NOTRUN -> [SKIP][25] ([i915#4613]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-4:         NOTRUN -> [SKIP][26] ([i915#3282])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-adlp-4:         NOTRUN -> [SKIP][27] ([i915#6621])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][28] -> [DMESG-FAIL][29] ([i915#5334])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         NOTRUN -> [INCOMPLETE][30] ([i915#7308] / [i915#7348])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@i915_selftest@live@migrate.html

  * {igt@i915_vm_bind_basic@basic-smem} (NEW):
    - fi-kbl-7567u:       NOTRUN -> [SKIP][31] ([fdo#109271]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-kbl-7567u/igt@i915_vm_bind_basic@basic-smem.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][32] ([fdo#109271]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-cfl-8700k/igt@i915_vm_bind_basic@basic-smem.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][33] ([fdo#109271]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-kbl-8809g/igt@i915_vm_bind_basic@basic-smem.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][34] ([fdo#109271]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-elk-e7500/igt@i915_vm_bind_basic@basic-smem.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][35] ([fdo#109271]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bsw-nick/igt@i915_vm_bind_basic@basic-smem.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][36] ([fdo#109271]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bsw-kefka/igt@i915_vm_bind_basic@basic-smem.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-cfl-guc/igt@i915_vm_bind_basic@basic-smem.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][38] ([fdo#109271]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-cfl-8109u/igt@i915_vm_bind_basic@basic-smem.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][39] ([fdo#109271]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-ivb-3770/igt@i915_vm_bind_basic@basic-smem.html
    - fi-ilk-650:         NOTRUN -> [SKIP][40] ([fdo#109271]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-ilk-650/igt@i915_vm_bind_basic@basic-smem.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][41] ([fdo#112080])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-jsl-1/igt@i915_vm_bind_basic@basic-smem.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][42] ([fdo#109271]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bxt-dsi/igt@i915_vm_bind_basic@basic-smem.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][43] ([fdo#112080])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-jsl-1/igt@i915_vm_bind_basic@basic-smem.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][44] ([fdo#109271]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-skl-6600u/igt@i915_vm_bind_basic@basic-smem.html

  * {igt@i915_vm_bind_sanity@basic} (NEW):
    - fi-snb-2520m:       NOTRUN -> [SKIP][45] ([fdo#109271]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-snb-2520m/igt@i915_vm_bind_sanity@basic.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][46] ([fdo#109271]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-glk-j4005/igt@i915_vm_bind_sanity@basic.html
    - fi-skl-guc:         NOTRUN -> [SKIP][47] ([fdo#109271]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-skl-guc/igt@i915_vm_bind_sanity@basic.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][48] ([fdo#109271]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-blb-e6850/igt@i915_vm_bind_sanity@basic.html
    - fi-apl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-apl-guc/igt@i915_vm_bind_sanity@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-adlp-4:         NOTRUN -> [SKIP][50] ([fdo#111827]) +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - bat-adlp-4:         NOTRUN -> [SKIP][51] ([i915#4103])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-4:         NOTRUN -> [SKIP][52] ([i915#4093]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-adlp-4:         NOTRUN -> [SKIP][53] ([i915#3555] / [i915#4579])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - bat-adlp-4:         NOTRUN -> [SKIP][54] ([fdo#109295] / [i915#3301] / [i915#3708])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@prime_vgem@basic-userptr.html

  * igt@prime_vgem@basic-write:
    - bat-adlp-4:         NOTRUN -> [SKIP][55] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@prime_vgem@basic-write.html

  * igt@runner@aborted:
    - bat-adlp-4:         NOTRUN -> [FAIL][56] ([i915#4312])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hugepages:
    - {bat-rpls-2}:       [DMESG-WARN][57] ([i915#5278]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/bat-rpls-2/igt@i915_selftest@live@hugepages.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-2/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][59] ([i915#4983]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/bat-rpls-2/igt@i915_selftest@live@reset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][61] ([i915#6367]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7308]: https://gitlab.freedesktop.org/drm/intel/issues/7308
  [i915#7346]: https://gitlab.freedesktop.org/drm/intel/issues/7346
  [i915#7348]: https://gitlab.freedesktop.org/drm/intel/issues/7348
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357
  [i915#7358]: https://gitlab.freedesktop.org/drm/intel/issues/7358
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7044 -> IGTPW_8052

  CI-20190529: 20190529
  CI_DRM_12348: 274249f2d91b2b43ee26d9363b0f7426c6445ba2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8052: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/index.html
  IGT_7044: dbeb6f92720292f8303182a0e649284cea5b11a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_exec3_balancer@parallel-ordering
+igt@gem_exec3_basic@basic
+igt@gem_lmem_swapping@vm_bind
+igt@gem_shrink@vm_bind
+igt@gem_shrink@vm_bind-oom
+igt@gem_shrink@vm_bind-sanitycheck
+igt@gem_shrink@vm_bind-userptr
+igt@gem_shrink@vm_bind-userptr-dirty
+igt@i915_vm_bind_basic@2m
+igt@i915_vm_bind_basic@2m_sync_bind
+igt@i915_vm_bind_basic@64k
+igt@i915_vm_bind_basic@basic
+igt@i915_vm_bind_basic@multi_cmds
+igt@i915_vm_bind_basic@multi_ctxts
+igt@i915_vm_bind_basic@share_vm
+igt@i915_vm_bind_basic@skip_copy
+igt@i915_vm_bind_basic@skip_unbind
+igt@i915_vm_bind_sanity@basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/index.html

--===============1931410792245083423==
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
<tr><td><b>Series:</b></td><td>vm_bind: Add VM_BIND validation support (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105881/">https://patchwork.freedesktop.org/series/105881/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12348 -&gt; IGTPW_8052</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/index.html</p>
<h2>Participating hosts (39 -&gt; 38)</h2>
<p>Additional (2): bat-atsm-1 bat-adlp-4 <br />
  Missing    (3): fi-ctg-p8600 fi-hsw-4770 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8052:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_exec3_basic@basic} (NEW):</p>
<ul>
<li>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-dg2-11/igt@gem_exec3_basic@basic.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_basic@basic-smem} (NEW):</p>
<ul>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adln-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{fi-tgl-mst}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-tgl-mst/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rplp-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-rkl-11600/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-adl-ddr5/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-atsm-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-dg2-9/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-dg2-8/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-ehl-2/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic} (NEW):</p>
<ul>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-2/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-rkl-guc/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-6/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-icl-u2/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-jsl-1/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-jsl-1/igt@i915_vm_bind_sanity@basic.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>{bat-atsm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-atsm-1/igt@i915_selftest@live@mman.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12348 and IGTPW_8052:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@gem_exec3_basic@basic:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_basic@basic-smem:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_sanity@basic:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8052 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_exec3_basic@basic} (NEW):</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bdw-gvtdvm/igt@gem_exec3_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-pnv-d510/igt@gem_exec3_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-skl-6700k2/igt@gem_exec3_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7308">i915#7308</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7348">i915#7348</a>)</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_basic@basic-smem} (NEW):</p>
<ul>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-kbl-7567u/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-cfl-8700k/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-kbl-8809g/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-elk-e7500/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bsw-nick/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bsw-kefka/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-cfl-guc/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-cfl-8109u/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-ivb-3770/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-ilk-650/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-jsl-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-bxt-dsi/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-jsl-1/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-skl-6600u/igt@i915_vm_bind_basic@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic} (NEW):</p>
<ul>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-snb-2520m/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-glk-j4005/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-skl-guc/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-blb-e6850/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/fi-apl-guc/igt@i915_vm_bind_sanity@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4579">i915#4579</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-adlp-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/bat-rpls-2/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5278">i915#5278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-2/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12348/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7044 -&gt; IGTPW_8052</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12348: 274249f2d91b2b43ee26d9363b0f7426c6445ba2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8052: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8052/index.html<br />
  IGT_7044: dbeb6f92720292f8303182a0e649284cea5b11a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_exec3_balancer@parallel-ordering<br />
+igt@gem_exec3_basic@basic<br />
+igt@gem_lmem_swapping@vm_bind<br />
+igt@gem_shrink@vm_bind<br />
+igt@gem_shrink@vm_bind-oom<br />
+igt@gem_shrink@vm_bind-sanitycheck<br />
+igt@gem_shrink@vm_bind-userptr<br />
+igt@gem_shrink@vm_bind-userptr-dirty<br />
+igt@i915_vm_bind_basic@2m<br />
+igt@i915_vm_bind_basic@2m_sync_bind<br />
+igt@i915_vm_bind_basic@64k<br />
+igt@i915_vm_bind_basic@basic<br />
+igt@i915_vm_bind_basic@multi_cmds<br />
+igt@i915_vm_bind_basic@multi_ctxts<br />
+igt@i915_vm_bind_basic@share_vm<br />
+igt@i915_vm_bind_basic@skip_copy<br />
+igt@i915_vm_bind_basic@skip_unbind<br />
+igt@i915_vm_bind_sanity@basic</p>

</body>
</html>

--===============1931410792245083423==--
