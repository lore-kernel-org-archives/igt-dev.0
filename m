Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8594781505199127397=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/amdgpu/amd=5Flink=5Fsett?=
 =?utf-8?q?ings=3A_Fix_run_eDP_link_training_with_unsupported_link_rate_=28r?=
 =?utf-8?q?ev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Wed, 03 Jan 2024 15:45:23 -0000
Message-ID: <170429672373.151.3400252811217780751@5338d5abeb45>
References: <20240103144624.59716-1-hersenxs.wu@amd.com>
In-Reply-To: <20240103144624.59716-1-hersenxs.wu@amd.com>
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

--===============8594781505199127397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_link_settings: Fix run eDP link training with unsupported link rate (rev3)
URL   : https://patchwork.freedesktop.org/series/127915/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7655_BAT -> XEIGTPW_10470_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_10470_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-pvc-2:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#1100])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#906]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3:
    - bat-dg2-oem2:       [FAIL][9] ([Intel XE#400] / [Intel XE#616]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][11] ([Intel XE#999]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  [Intel XE#1100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1100
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7655 -> IGTPW_10470

  IGTPW_10470: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10470/index.html
  IGT_7655: ddf7cf40a00caa7d02f3729e1e50f78f102463d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/index.html

--===============8594781505199127397==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_link_settings: Fix run eDP link training with unsupported link rate (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127915/">https://patchwork.freedesktop.org/series/127915/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7655_BAT -&gt; XEIGTPW_10470_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10470_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1100">Intel XE#1100</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-dp-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7655/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10470/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7655 -&gt; IGTPW_10470</li>
</ul>
<p>IGTPW_10470: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10470/index.html<br />
  IGT_7655: ddf7cf40a00caa7d02f3729e1e50f78f102463d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-598-7b3b98d034784b125bad7aca46f9e7a3cfcde45a: 7b3b98d034784b125bad7aca46f9e7a3cfcde45a</p>

</body>
</html>

--===============8594781505199127397==--
