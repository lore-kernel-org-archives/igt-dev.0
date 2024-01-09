Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5183097013095309512=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5B1/2=5D?=
 =?utf-8?q?_tests/kms=5Fbw=3A_Use_reduced_blanking_mode_1920x1080p_timings_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Tue, 09 Jan 2024 00:25:12 -0000
Message-ID: <170475991239.197000.9781164327599479408@5338d5abeb45>
References: <20240105213603.109149-1-robdclark@gmail.com>
In-Reply-To: <20240105213603.109149-1-robdclark@gmail.com>
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

--===============5183097013095309512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/kms_bw: Use reduced blanking mode 1920x1080p timings (rev2)
URL   : https://patchwork.freedesktop.org/series/128283/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7663_BAT -> XEIGTPW_10486_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10486_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10486_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10486_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10486_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][9] ([Intel XE#400] / [Intel XE#616]) -> [PASS][10] +2 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-pvc-2:          [FAIL][11] ([Intel XE#999]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7663 -> IGTPW_10486
  * Linux: xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914 -> xe-607-eacbcdb537a2774959d012206aba22848fdade26

  IGTPW_10486: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10486/index.html
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914: a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/index.html

--===============5183097013095309512==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/kms_bw: Use reduced blanking mode 1920x1080p timings (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128283/">https://patchwork.freedesktop.org/series/128283/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7663_BAT -&gt; XEIGTPW_10486_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10486_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10486_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10486_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-userptr-invalidate:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-atsm-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10486_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10486/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7663 -&gt; IGTPW_10486</li>
<li>Linux: xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914 -&gt; xe-607-eacbcdb537a2774959d012206aba22848fdade26</li>
</ul>
<p>IGTPW_10486: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10486/index.html<br />
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914: a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914<br />
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26</p>

</body>
</html>

--===============5183097013095309512==--
