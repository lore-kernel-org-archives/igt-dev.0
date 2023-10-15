Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8507686417778463374=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Sun, 15 Oct 2023 06:50:05 -0000
Message-ID: <169735260525.21827.18444638883574016597@emeril.freedesktop.org>
References: <20231015052850.6120-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231015052850.6120-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/xe?=
 =?utf-8?q?=5Fexec=5Fcompute=5Fmode=3A_Validate_fixed_CCS_mode_setting?=
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

--===============8507686417778463374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_compute_mode: Validate fixed CCS mode setting
URL   : https://patchwork.freedesktop.org/series/125147/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7539_BAT -> XEIGTPW_10001_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10001_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10001_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10001_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
    - bat-adlp-7:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
    - bat-atsm-2:         [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-atsm-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-atsm-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_live_ktest@bo:
    - bat-pvc-2:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-pvc-2/igt@xe_live_ktest@bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-pvc-2/igt@xe_live_ktest@bo.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10001_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][11] -> [FAIL][12] ([Intel XE#480]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-pvc-2:          [PASS][13] -> [DMESG-WARN][14] ([Intel XE#696])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#696]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/696


Build changes
-------------

  * IGT: IGT_7539 -> IGTPW_10001
  * Linux: xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338 -> xe-434-7a2215ad9efde6949c4f3e75ca0776e075eabc47

  IGTPW_10001: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10001/index.html
  IGT_7539: 08e87a32fa113a9b6f30cbd9766fec346b53faac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338: 037b6c8b23818fa71223e996c68a4f55f2d91338
  xe-434-7a2215ad9efde6949c4f3e75ca0776e075eabc47: 7a2215ad9efde6949c4f3e75ca0776e075eabc47

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/index.html

--===============8507686417778463374==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_compute_mode: Validate fixed CCS mode setting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125147/">https://patchwork.freedesktop.org/series/125147/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7539_BAT -&gt; XEIGTPW_10001_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10001_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10001_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10001_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-pvc-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">SKIP</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-atsm-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-atsm-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-pvc-2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-pvc-2/igt@xe_live_ktest@bo.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10001_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7539/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10001/bat-pvc-2/igt@xe_exec_reset@virtual-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7539 -&gt; IGTPW_10001</li>
<li>Linux: xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338 -&gt; xe-434-7a2215ad9efde6949c4f3e75ca0776e075eabc47</li>
</ul>
<p>IGTPW_10001: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10001/index.html<br />
  IGT_7539: 08e87a32fa113a9b6f30cbd9766fec346b53faac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338: 037b6c8b23818fa71223e996c68a4f55f2d91338<br />
  xe-434-7a2215ad9efde6949c4f3e75ca0776e075eabc47: 7a2215ad9efde6949c4f3e75ca0776e075eabc47</p>

</body>
</html>

--===============8507686417778463374==--
