Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5325481121815895840=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Tue, 12 Sep 2023 13:22:32 -0000
Message-ID: <169452495224.31796.2957940159353960906@emeril.freedesktop.org>
References: <20230811103217.415744-1-riana.tauro@intel.com>
In-Reply-To: <20230811103217.415744-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Idle_Res?=
 =?utf-8?q?idency_on_Exec_=28rev3=29?=
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

--===============5325481121815895840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Idle Residency on Exec (rev3)
URL   : https://patchwork.freedesktop.org/series/122341/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7480_BAT -> XEIGTPW_9771_BAT
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

  Here are the unknown changes that may have been introduced in XEIGTPW_9771_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pm_residency@idle-residency-on-exec}:
    - bat-pvc-2:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_pm_residency@idle-residency-on-exec.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9771_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][2] ([Intel XE#538]) +33 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][3] ([Intel XE#539]) +6 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          NOTRUN -> [SKIP][4] ([Intel XE#541]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7480/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#540]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          NOTRUN -> [SKIP][8] ([Intel XE#537]) +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][9] ([Intel XE#536])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-pvc-2:          NOTRUN -> [SKIP][10] ([Intel XE#535]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_psr@primary_page_flip.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][11] ([Intel XE#533]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][12] ([Intel XE#255])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#532])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@migrate:
    - bat-pvc-2:          NOTRUN -> [SKIP][14] ([Intel XE#483]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_live_ktest@migrate.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][15] ([Intel XE#531])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][16] ([Intel XE#480]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7480/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [INCOMPLETE][18] ([Intel XE#631]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7480/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/483
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/536
  [Intel XE#537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/537
  [Intel XE#538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/538
  [Intel XE#539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/539
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/631


Build changes
-------------

  * IGT: IGT_7480 -> IGTPW_9771
  * Linux: xe-365-0533b5d42b2f8ec916646c10715ac45215e87689 -> xe-367-b4ddac861881e66a4af06531a7a72345c086bac1

  IGTPW_9771: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9771/index.html
  IGT_7480: a8d38db9ac258d7fd71b2cf7607e259a864f95be @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689
  xe-367-b4ddac861881e66a4af06531a7a72345c086bac1: b4ddac861881e66a4af06531a7a72345c086bac1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/index.html

--===============5325481121815895840==
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
<tr><td><b>Series:</b></td><td>Idle Residency on Exec (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122341/">https://patchwork.freedesktop.org/series/122341/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7480_BAT -&gt; XEIGTPW_9771_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9771_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pm_residency@idle-residency-on-exec}:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_pm_residency@idle-residency-on-exec.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9771_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/538">Intel XE#538</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/539">Intel XE#539</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7480/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/537">Intel XE#537</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/536">Intel XE#536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/533">Intel XE#533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_live_ktest@migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/483">Intel XE#483</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7480/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7480/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/631">Intel XE#631</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9771/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7480 -&gt; IGTPW_9771</li>
<li>Linux: xe-365-0533b5d42b2f8ec916646c10715ac45215e87689 -&gt; xe-367-b4ddac861881e66a4af06531a7a72345c086bac1</li>
</ul>
<p>IGTPW_9771: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9771/index.html<br />
  IGT_7480: a8d38db9ac258d7fd71b2cf7607e259a864f95be @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-365-0533b5d42b2f8ec916646c10715ac45215e87689: 0533b5d42b2f8ec916646c10715ac45215e87689<br />
  xe-367-b4ddac861881e66a4af06531a7a72345c086bac1: b4ddac861881e66a4af06531a7a72345c086bac1</p>

</body>
</html>

--===============5325481121815895840==--
