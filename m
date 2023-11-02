Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1931604386848134270=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 02 Nov 2023 01:33:43 -0000
Message-ID: <169888882314.28157.1814975874605989422@emeril.freedesktop.org>
References: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20231101235303.4645-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciB4ZTogVmFs?=
 =?utf-8?q?idate_fixed_CCS_mode_setting?=
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

--===============1931604386848134270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe: Validate fixed CCS mode setting
URL   : https://patchwork.freedesktop.org/series/125873/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7568_BAT -> XEIGTPW_10098_BAT
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

  Here are the changes found in XEIGTPW_10098_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7568/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10098/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/855


Build changes
-------------

  * IGT: IGT_7568 -> IGTPW_10098
  * Linux: xe-459-76bba03c4f90371e7b2da536b966a49c68d589b0 -> xe-464-ff616f1d0e92e64af239b351437421eb78922b8c

  IGTPW_10098: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10098/index.html
  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-459-76bba03c4f90371e7b2da536b966a49c68d589b0: 76bba03c4f90371e7b2da536b966a49c68d589b0
  xe-464-ff616f1d0e92e64af239b351437421eb78922b8c: ff616f1d0e92e64af239b351437421eb78922b8c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10098/index.html

--===============1931604386848134270==
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
<tr><td><b>Series:</b></td><td>xe: Validate fixed CCS mode setting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125873/">https://patchwork.freedesktop.org/series/125873/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10098/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10098/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7568_BAT -&gt; XEIGTPW_10098_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10098_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7568/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10098/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7568 -&gt; IGTPW_10098</li>
<li>Linux: xe-459-76bba03c4f90371e7b2da536b966a49c68d589b0 -&gt; xe-464-ff616f1d0e92e64af239b351437421eb78922b8c</li>
</ul>
<p>IGTPW_10098: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10098/index.html<br />
  IGT_7568: 9e3c3791e7e0297f277211b19a3388a1ee87f3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-459-76bba03c4f90371e7b2da536b966a49c68d589b0: 76bba03c4f90371e7b2da536b966a49c68d589b0<br />
  xe-464-ff616f1d0e92e64af239b351437421eb78922b8c: ff616f1d0e92e64af239b351437421eb78922b8c</p>

</body>
</html>

--===============1931604386848134270==--
