Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8565960146434061104=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fexec=5Fcomput?=
 =?utf-8?q?e=5Fmode=3A_Add_non-blocking_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Fri, 05 Jan 2024 23:26:35 -0000
Message-ID: <170449719594.40937.7714166248398216156@5338d5abeb45>
References: <20240105204206.25865-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240105204206.25865-1-sai.gowtham.ch@intel.com>
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

--===============8565960146434061104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_compute_mode: Add non-blocking subtest
URL   : https://patchwork.freedesktop.org/series/128282/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7659_BAT -> XEIGTPW_10481_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 4)
------------------------------

  Additional (2): bat-dg2-oem2 bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_10481_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#623])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#455])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-basic@pipe-a-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][3] ([Intel XE#1066]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@kms_dsc@dsc-basic@pipe-a-edp-1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         NOTRUN -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([i915#5274])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][6] ([Intel XE#608])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][7] ([Intel XE#1033])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][8] ([Intel XE#400] / [Intel XE#616]) +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] ([Intel XE#1099])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7659/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         NOTRUN -> [SKIP][12] ([Intel XE#688]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][13] ([Intel XE#288]) +32 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         NOTRUN -> [SKIP][14] ([Intel XE#288]) +32 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] ([Intel XE#255])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         NOTRUN -> [SKIP][16] ([Intel XE#1008])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         NOTRUN -> [SKIP][17] ([Intel XE#977])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][18] ([Intel XE#977])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][19] ([Intel XE#979]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][20] ([Intel XE#979]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1066]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1066
  [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7659 -> IGTPW_10481
  * Linux: xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513 -> xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523

  IGTPW_10481: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10481/index.html
  IGT_7659: dcc68cc6c562866584feac3ffadab65dfa9a402b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513: 2f34bf674c7dad8d0cb6ae92d4e56805d63d0513
  xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523: cca0607b6f6a21bee68c092ed7ad9f3322e54523

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/index.html

--===============8565960146434061104==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_compute_mode: Add non-blocking subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128282/">https://patchwork.freedesktop.org/series/128282/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7659_BAT -&gt; XEIGTPW_10481_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 4)</h2>
<p>Additional (2): bat-dg2-oem2 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10481_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@kms_dsc@dsc-basic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1066">Intel XE#1066</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-leak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7659/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099">Intel XE#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10481/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7659 -&gt; IGTPW_10481</li>
<li>Linux: xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513 -&gt; xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523</li>
</ul>
<p>IGTPW_10481: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10481/index.html<br />
  IGT_7659: dcc68cc6c562866584feac3ffadab65dfa9a402b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-602-2f34bf674c7dad8d0cb6ae92d4e56805d63d0513: 2f34bf674c7dad8d0cb6ae92d4e56805d63d0513<br />
  xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523: cca0607b6f6a21bee68c092ed7ad9f3322e54523</p>

</body>
</html>

--===============8565960146434061104==--
