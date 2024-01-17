Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7311725150791420758=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/3=5D_tests/intel=3A_Add_xe=5Fexec=5Fatomic_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 17 Jan 2024 12:38:53 -0000
Message-ID: <170549513368.525621.8183579176740596889@5338d5abeb45>
References: <20240117111234.28312-1-nirmoy.das@intel.com>
In-Reply-To: <20240117111234.28312-1-nirmoy.das@intel.com>
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
To: Nirmoy Das <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7311725150791420758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/3] tests/intel: Add xe_exec_atomic test
URL   : https://patchwork.freedesktop.org/series/128875/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7677_BAT -> XEIGTPW_10542_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_10542_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_exec_atomic@basic-dec-all} (NEW):
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10542/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html

  
New tests
---------

  New tests have been introduced between XEIGT_7677_BAT and XEIGTPW_10542_BAT:

### New IGT tests (30) ###

  * igt@xe_exec_atomic@basic-dec-all:
    - Statuses : 1 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 0.08] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all:
    - Statuses : 1 incomplete(s) 3 pass(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:
    - Statuses : 3 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * IGT: IGT_7677 -> IGTPW_10542

  IGTPW_10542: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10542/index.html
  IGT_7677: 57ed393a5b5d04e985f9950a7f1546fc95f4001e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-638-802f9a6662f7ad62bf92457f62a5d42c7249bb5c: 802f9a6662f7ad62bf92457f62a5d42c7249bb5c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10542/index.html

--===============7311725150791420758==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/3] tests/intel: Add xe_exec_atomic test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128875/">https://patchwork.freedesktop.org/series/128875/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10542/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10542/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7677_BAT -&gt; XEIGTPW_10542_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10542_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_exec_atomic@basic-dec-all} (NEW):<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10542/bat-pvc-2/igt@xe_exec_atomic@basic-dec-all.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7677_BAT and XEIGTPW_10542_BAT:</p>
<h3>New IGT tests (30)</h3>
<ul>
<li>
<p>igt@xe_exec_atomic@basic-dec-all:</p>
<ul>
<li>Statuses : 1 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>Statuses : 1 incomplete(s) 3 pass(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-system-memory:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-vram0-memory:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7677 -&gt; IGTPW_10542</li>
</ul>
<p>IGTPW_10542: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10542/index.html<br />
  IGT_7677: 57ed393a5b5d04e985f9950a7f1546fc95f4001e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-638-802f9a6662f7ad62bf92457f62a5d42c7249bb5c: 802f9a6662f7ad62bf92457f62a5d42c7249bb5c</p>

</body>
</html>

--===============7311725150791420758==--

