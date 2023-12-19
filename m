Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5337529188471893284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2Cv2=2C1/2=5D_tests/kms=5Fasync=5Fflip=3A_Speed_up_the_CRC_test_?=
 =?utf-8?q?on_Intel_hw_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Tue, 19 Dec 2023 04:56:17 -0000
Message-ID: <170296177706.17580.17404068240765841542@emeril.freedesktop.org>
References: <20231207171136.30669-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20231207171136.30669-1-ville.syrjala@linux.intel.com>
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

--===============5337529188471893284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] tests/kms_async_flip: Speed up the CRC test on Intel hw (rev2)
URL   : https://patchwork.freedesktop.org/series/127516/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7647_BAT -> XEIGTPW_10441_BAT
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

  Here are the changes found in XEIGTPW_10441_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#1033])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] ([Intel XE#999])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [FAIL][9] ([Intel XE#906]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][11] ([Intel XE#906]) -> [FAIL][12] ([Intel XE#480])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7647 -> IGTPW_10441
  * Linux: xe-585-3b0bde77a8c4304c0fe3b6a4f8661dc34b82f920 -> xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c

  IGTPW_10441: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10441/index.html
  IGT_7647: c5db51a88823962e79d41cff10fe1bdd8ea92d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-585-3b0bde77a8c4304c0fe3b6a4f8661dc34b82f920: 3b0bde77a8c4304c0fe3b6a4f8661dc34b82f920
  xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c: 84e5d706cb0c11f2948a9f16d9e31ad5256b641c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/index.html

--===============5337529188471893284==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] tests/kms_async_flip: Speed up the CRC test on Intel hw (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127516/">https://patchwork.freedesktop.org/series/127516/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7647_BAT -&gt; XEIGTPW_10441_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10441_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7647/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10441/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7647 -&gt; IGTPW_10441</li>
<li>Linux: xe-585-3b0bde77a8c4304c0fe3b6a4f8661dc34b82f920 -&gt; xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c</li>
</ul>
<p>IGTPW_10441: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10441/index.html<br />
  IGT_7647: c5db51a88823962e79d41cff10fe1bdd8ea92d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-585-3b0bde77a8c4304c0fe3b6a4f8661dc34b82f920: 3b0bde77a8c4304c0fe3b6a4f8661dc34b82f920<br />
  xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c: 84e5d706cb0c11f2948a9f16d9e31ad5256b641c</p>

</body>
</html>

--===============5337529188471893284==--
