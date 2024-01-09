Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6461295805645267314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/intel=5Fcmds=5Finfo=3A_Add?=
 =?utf-8?q?_MEM=5FCOPY/SET_support_for_Lunarlake?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Tue, 09 Jan 2024 12:24:27 -0000
Message-ID: <170480306734.215423.9376401353534208309@5338d5abeb45>
References: <20240109095602.9620-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240109095602.9620-1-sai.gowtham.ch@intel.com>
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

--===============6461295805645267314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_cmds_info: Add MEM_COPY/SET support for Lunarlake
URL   : https://patchwork.freedesktop.org/series/128359/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7663_BAT -> XEIGTPW_10492_BAT
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

  Here are the changes found in XEIGTPW_10492_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#1033])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#400] / [Intel XE#616]) -> [PASS][8] +2 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [FAIL][9] ([Intel XE#999]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-pvc-2:          [FAIL][11] ([Intel XE#999]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7663 -> IGTPW_10492
  * Linux: xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914 -> xe-607-eacbcdb537a2774959d012206aba22848fdade26

  IGTPW_10492: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10492/index.html
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914: a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/index.html

--===============6461295805645267314==
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
<tr><td><b>Series:</b></td><td>lib/intel_cmds_info: Add MEM_COPY/SET support for Lunarlake</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128359/">https://patchwork.freedesktop.org/series/128359/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7663_BAT -&gt; XEIGTPW_10492_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10492_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> +1 other test pass</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7663/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10492/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7663 -&gt; IGTPW_10492</li>
<li>Linux: xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914 -&gt; xe-607-eacbcdb537a2774959d012206aba22848fdade26</li>
</ul>
<p>IGTPW_10492: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10492/index.html<br />
  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-604-a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914: a3e6b7b90ce1ff725d7585cbd2c9279e6e39b914<br />
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26</p>

</body>
</html>

--===============6461295805645267314==--
