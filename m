Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6459997936960595667=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Mon, 03 Oct 2022 06:51:51 -0000
Message-ID: <166477991103.6047.3063618239822057465@emeril.freedesktop.org>
References: <20221003061320.12782-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221003061320.12782-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igdm1fYmlu?=
 =?utf-8?q?d=3A_Add_VM=5FBIND_validation_support_=28rev6=29?=
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

--===============6459997936960595667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vm_bind: Add VM_BIND validation support (rev6)
URL   : https://patchwork.freedesktop.org/series/105881/
State : success

== Summary ==

CI Bug Log - changes from IGT_6671 -> IGTPW_7903
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/index.html

Participating hosts (49 -> 43)
------------------------------

  Additional (1): fi-icl-u2 
  Missing    (7): fi-tgl-dsi fi-tgl-u2 fi-hsw-4200u fi-glk-dsi fi-ctg-p8600 fi-bsw-nick fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7903:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_vm_bind_basic@basic} (NEW):
    - {bat-jsl-3}:        NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-jsl-3/igt@i915_vm_bind_basic@basic.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-11/igt@i915_vm_bind_basic@basic.html
    - bat-adlp-4:         NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adlp-4/igt@i915_vm_bind_basic@basic.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-8/igt@i915_vm_bind_basic@basic.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adlm-1/igt@i915_vm_bind_basic@basic.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-jsl-1/igt@i915_vm_bind_basic@basic.html
    - {fi-jsl-1}:         NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-jsl-1/igt@i915_vm_bind_basic@basic.html

  * {igt@i915_vm_bind_sanity@basic-lmem} (NEW):
    - {bat-rplp-1}:       NOTRUN -> [SKIP][8] +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rplp-1/igt@i915_vm_bind_sanity@basic-lmem.html
    - bat-dg1-5:          NOTRUN -> [SKIP][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg1-5/igt@i915_vm_bind_sanity@basic-lmem.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][10] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-9/igt@i915_vm_bind_sanity@basic-lmem.html
    - {bat-adln-1}:       NOTRUN -> [SKIP][11] +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adln-1/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][12] +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-adl-ddr5/igt@i915_vm_bind_sanity@basic-lmem.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][13] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-ehl-2/igt@i915_vm_bind_sanity@basic-lmem.html
    - {bat-rpls-2}:       NOTRUN -> [SKIP][14] +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-2/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][15] +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-rkl-guc/igt@i915_vm_bind_sanity@basic-lmem.html
    - {bat-adlp-6}:       NOTRUN -> [SKIP][16] +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adlp-6/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-icl-u2:          NOTRUN -> [SKIP][17] +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@i915_vm_bind_sanity@basic-lmem.html

  * {igt@i915_vm_bind_sanity@basic-smem} (NEW):
    - {bat-rpls-1}:       NOTRUN -> [SKIP][18] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-1/igt@i915_vm_bind_sanity@basic-smem.html

  
New tests
---------

  New tests have been introduced between IGT_6671 and IGTPW_7903:

### New IGT tests (4) ###

  * igt@i915_vm_bind_basic@basic:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_sanity:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_vm_bind_sanity@basic-lmem:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  * igt@i915_vm_bind_sanity@basic-smem:
    - Statuses : 37 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7903 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][19] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][20] ([i915#4613]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][21] -> [DMESG-FAIL][22] ([i915#62])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live:
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][23] ([i915#6114])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bxt-dsi:         [PASS][24] -> [DMESG-FAIL][25] ([i915#5334])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-bdw-gvtdvm:      NOTRUN -> [INCOMPLETE][26] ([i915#4817])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html

  * {igt@i915_vm_bind_basic@basic} (NEW):
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][27] ([fdo#109271]) +22 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@i915_vm_bind_basic@basic.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][28] ([fdo#109271]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bsw-kefka/igt@i915_vm_bind_basic@basic.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][29] ([fdo#109271]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-snb-2520m/igt@i915_vm_bind_basic@basic.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][30] ([fdo#109271]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-hsw-4770/igt@i915_vm_bind_basic@basic.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][31] ([fdo#109271]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-ivb-3770/igt@i915_vm_bind_basic@basic.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][32] ([fdo#109271]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-elk-e7500/igt@i915_vm_bind_basic@basic.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][33] ([fdo#109271]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-hsw-g3258/igt@i915_vm_bind_basic@basic.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][34] ([fdo#109271]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bxt-dsi/igt@i915_vm_bind_basic@basic.html

  * {igt@i915_vm_bind_sanity@basic-lmem} (NEW):
    - fi-glk-j4005:       NOTRUN -> [SKIP][35] ([fdo#109271]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-glk-j4005/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-snb-2600:        NOTRUN -> [SKIP][36] ([fdo#109271]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-snb-2600/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][37] ([fdo#109271]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-skl-6700k2/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][38] ([fdo#109271]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][39] ([fdo#109271]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-kbl-7567u/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-ilk-650:         NOTRUN -> [SKIP][40] ([fdo#109271]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-ilk-650/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][41] ([fdo#109271]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-guc/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][42] ([fdo#109271]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-skl-6600u/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][43] ([fdo#109271]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-5557u/igt@i915_vm_bind_sanity@basic-lmem.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][44] ([fdo#109271]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-blb-e6850/igt@i915_vm_bind_sanity@basic-lmem.html

  * {igt@i915_vm_bind_sanity@basic-smem} (NEW):
    - fi-pnv-d510:        NOTRUN -> [SKIP][45] ([fdo#109271]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-pnv-d510/igt@i915_vm_bind_sanity@basic-smem.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][46] ([fdo#111827]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-icl-u2:          NOTRUN -> [SKIP][47] ([i915#4103])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-icl-u2:          NOTRUN -> [WARN][48] ([i915#6008])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-icl-u2:          NOTRUN -> [SKIP][49] ([fdo#109285])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [PASS][50] -> [DMESG-WARN][51] ([i915#62]) +12 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-icl-u2:          NOTRUN -> [SKIP][52] ([i915#3555])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][53] ([fdo#109295] / [i915#3301])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][54] ([i915#4312])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - {bat-rpls-2}:       [SKIP][55] ([i915#2582]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-rpls-2/igt@fbdev@read.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-2/igt@fbdev@read.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - {bat-rplp-1}:       [DMESG-WARN][57] ([i915#2867]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - {bat-dg2-11}:       [DMESG-WARN][59] ([i915#6816]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@i915_module_load@load:
    - fi-bdw-gvtdvm:      [DMESG-WARN][61] ([i915#6540]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-bdw-gvtdvm/igt@i915_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_pm:
    - {bat-rpls-2}:       [DMESG-FAIL][63] ([i915#4258]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-rpls-2/igt@i915_selftest@live@gt_pm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-2/igt@i915_selftest@live@gt_pm.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-bdw-gvtdvm:      [DMESG-WARN][65] ([i915#5922]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:
    - {bat-dg2-11}:       [FAIL][67] ([i915#6818]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5922]: https://gitlab.freedesktop.org/drm/intel/issues/5922
  [i915#6008]: https://gitlab.freedesktop.org/drm/intel/issues/6008
  [i915#6114]: https://gitlab.freedesktop.org/drm/intel/issues/6114
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6540]: https://gitlab.freedesktop.org/drm/intel/issues/6540
  [i915#6816]: https://gitlab.freedesktop.org/drm/intel/issues/6816
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6671 -> IGTPW_7903

  CI-20190529: 20190529
  CI_DRM_12204: fd2f9b9a4178e667adad268a662eb8a9c0ddc8f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7903: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/index.html
  IGT_6671: e9244bfd0111902aee2d9c09cddf7c38a6f6d0ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_vm_bind_basic@2m
+igt@i915_vm_bind_basic@64k
+igt@i915_vm_bind_basic@basic
+igt@i915_vm_bind_basic@multi_cmds
+igt@i915_vm_bind_basic@multi_ctxts
+igt@i915_vm_bind_basic@share_vm
+igt@i915_vm_bind_basic@skip_copy
+igt@i915_vm_bind_basic@skip_unbind
+igt@i915_vm_bind_basic@smem
+igt@i915_vm_bind_basic@smem_multi_cmds
+igt@i915_vm_bind_basic@userptr
+igt@i915_vm_bind_sanity@basic-lmem
+igt@i915_vm_bind_sanity@basic-smem

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/index.html

--===============6459997936960595667==
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
<tr><td><b>Series:</b></td><td>vm_bind: Add VM_BIND validation support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105881/">https://patchwork.freedesktop.org/series/105881/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6671 -&gt; IGTPW_7903</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/index.html</p>
<h2>Participating hosts (49 -&gt; 43)</h2>
<p>Additional (1): fi-icl-u2 <br />
  Missing    (7): fi-tgl-dsi fi-tgl-u2 fi-hsw-4200u fi-glk-dsi fi-ctg-p8600 fi-bsw-nick fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7903:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_vm_bind_basic@basic} (NEW):</p>
<ul>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-jsl-3/igt@i915_vm_bind_basic@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-11/igt@i915_vm_bind_basic@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adlp-4/igt@i915_vm_bind_basic@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-8/igt@i915_vm_bind_basic@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adlm-1/igt@i915_vm_bind_basic@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-jsl-1/igt@i915_vm_bind_basic@basic.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-jsl-1/igt@i915_vm_bind_basic@basic.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic-lmem} (NEW):</p>
<ul>
<li>
<p>{bat-rplp-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rplp-1/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg1-5/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-9/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adln-1/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-adl-ddr5/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-ehl-2/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-rpls-2}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-2/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-rkl-guc/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-adlp-6/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic-smem} (NEW):</p>
<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-1/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6671 and IGTPW_7903:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@i915_vm_bind_basic@basic:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_sanity:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_sanity@basic-lmem:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_vm_bind_sanity@basic-smem:</p>
<ul>
<li>Statuses : 37 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7903 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6114">i915#6114</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_basic@basic} (NEW):</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bsw-kefka/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-snb-2520m/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-hsw-4770/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-ivb-3770/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-elk-e7500/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-hsw-g3258/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bxt-dsi/igt@i915_vm_bind_basic@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic-lmem} (NEW):</p>
<ul>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-glk-j4005/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-snb-2600/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-skl-6700k2/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-kbl-7567u/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-ilk-650/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-guc/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-skl-6600u/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-5557u/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-blb-e6850/igt@i915_vm_bind_sanity@basic-lmem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_vm_bind_sanity@basic-smem} (NEW):</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-pnv-d510/igt@i915_vm_bind_sanity@basic-smem.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6008">i915#6008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-rpls-2/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-2/igt@fbdev@read.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6816">i915#6816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-bdw-gvtdvm/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6540">i915#6540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-rpls-2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5922">i915#5922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/fi-bdw-gvtdvm/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6671/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6818">i915#6818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6671 -&gt; IGTPW_7903</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12204: fd2f9b9a4178e667adad268a662eb8a9c0ddc8f8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7903: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7903/index.html<br />
  IGT_6671: e9244bfd0111902aee2d9c09cddf7c38a6f6d0ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_vm_bind_basic@2m<br />
+igt@i915_vm_bind_basic@64k<br />
+igt@i915_vm_bind_basic@basic<br />
+igt@i915_vm_bind_basic@multi_cmds<br />
+igt@i915_vm_bind_basic@multi_ctxts<br />
+igt@i915_vm_bind_basic@share_vm<br />
+igt@i915_vm_bind_basic@skip_copy<br />
+igt@i915_vm_bind_basic@skip_unbind<br />
+igt@i915_vm_bind_basic@smem<br />
+igt@i915_vm_bind_basic@smem_multi_cmds<br />
+igt@i915_vm_bind_basic@userptr<br />
+igt@i915_vm_bind_sanity@basic-lmem<br />
+igt@i915_vm_bind_sanity@basic-smem</p>

</body>
</html>

--===============6459997936960595667==--
