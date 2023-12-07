Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3379156826564436030=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Welty" <brian.welty@intel.com>
Date: Thu, 07 Dec 2023 03:26:56 -0000
Message-ID: <170191961641.28722.3152673015485184472@emeril.freedesktop.org>
References: <20231207012623.15901-1-brian.welty@intel.com>
In-Reply-To: <20231207012623.15901-1-brian.welty@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciBsaWIveGVf?=
 =?utf-8?q?query=3A_Fix_xe=5Fsupports=5Ffaults=28=29?=
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

--===============3379156826564436030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/xe_query: Fix xe_supports_faults()
URL   : https://patchwork.freedesktop.org/series/127467/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7626_BAT -> XEIGTPW_10361_BAT
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

  Here are the changes found in XEIGTPW_10361_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#524]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-pvc-2:          [SKIP][3] ([Intel XE#997]) -> [PASS][4] +32 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#999]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#997]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/997
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7626 -> IGTPW_10361
  * Linux: xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921 -> xe-557-668d13abebbbc3812de86be1f8477475e1d90728

  IGTPW_10361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921: d33ebd7511c2b53c5dc006e2daa25214fc8a5921
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/index.html

--===============3379156826564436030==
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
<tr><td><b>Series:</b></td><td>lib/xe_query: Fix xe_supports_faults()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127467/">https://patchwork.freedesktop.org/series/127467/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7626_BAT -&gt; XEIGTPW_10361_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10361_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/997">Intel XE#997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7626/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10361/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7626 -&gt; IGTPW_10361</li>
<li>Linux: xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921 -&gt; xe-557-668d13abebbbc3812de86be1f8477475e1d90728</li>
</ul>
<p>IGTPW_10361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10361/index.html<br />
  IGT_7626: 154b7288552cd7ed3033f8ef396e88d0bd1b7646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-556-d33ebd7511c2b53c5dc006e2daa25214fc8a5921: d33ebd7511c2b53c5dc006e2daa25214fc8a5921<br />
  xe-557-668d13abebbbc3812de86be1f8477475e1d90728: 668d13abebbbc3812de86be1f8477475e1d90728</p>

</body>
</html>

--===============3379156826564436030==--
