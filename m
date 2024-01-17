Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Content-Type: multipart/alternative;
 boundary="===============3754256291296447482=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv5=2C1/3=5D_tests/intel=3A_Add_xe=5Fexec=5Fatomic_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Jan 2024 20:21:43 -0000
Message-ID: <170552290337.537693.4461153359979971920@5338d5abeb45>
References: <20240117172848.21144-1-nirmoy.das@intel.com>
In-Reply-To: <20240117172848.21144-1-nirmoy.das@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org

--===============3754256291296447482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v5,1/3] tests/intel: Add xe_exec_atomic test
URL   : https://patchwork.freedesktop.org/series/128891/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7678_BAT -> XEIGTPW_10547_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10547_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory} (NEW):
    - bat-pvc-2:          NOTRUN -> [SKIP][1] +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory.html

  
New tests
---------

  New tests have been introduced between XEIGT_7678_BAT and XEIGTPW_10547_BAT:

### New IGT tests (50) ###

  * igt@xe_exec_atomic@basic-dec-all:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.07] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-system-memory:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-vram0-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10547_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#623])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] ([Intel XE#455])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] ([i915#5274])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][5] ([Intel XE#608])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#288]) +32 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#255])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#977])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#979]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - bat-pvc-2:          [INCOMPLETE][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7678/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [INCOMPLETE][12] -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7678/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7678 -> IGTPW_10547
  * Linux: xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d -> xe-640-e492ced01835ac1c2712724ed5728057f267b111

  IGTPW_10547: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/index.html
  IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d: b42f47ca5fff1d04fb8eb02d64520b3f338a495d
  xe-640-e492ced01835ac1c2712724ed5728057f267b111: e492ced01835ac1c2712724ed5728057f267b111

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/index.html

--===============3754256291296447482==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v5,1/3] tests/intel: Add xe_exec_atomic test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128891/">https://patchwork.freedesktop.org/series/128891/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7678_BAT -&gt; XEIGTPW_10547_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10547_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory} (NEW):<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7678_BAT and XEIGTPW_10547_BAT:</p>
<h3>New IGT tests (50)</h3>
<ul>
<li>
<p>igt@xe_exec_atomic@basic-dec-all:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-2-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-3-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-4-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-5-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10547_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7678/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7678/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10547/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7678 -&gt; IGTPW_10547</li>
<li>Linux: xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d -&gt; xe-640-e492ced01835ac1c2712724ed5728057f267b111</li>
</ul>
<p>IGTPW_10547: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10547/index.html<br />
  IGT_7678: 9f0b63bae98fa6164dd2262f8890a964fb1fc23d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-639-b42f47ca5fff1d04fb8eb02d64520b3f338a495d: b42f47ca5fff1d04fb8eb02d64520b3f338a495d<br />
  xe-640-e492ced01835ac1c2712724ed5728057f267b111: e492ced01835ac1c2712724ed5728057f267b111</p>

</body>
</html>

--===============3754256291296447482==--
