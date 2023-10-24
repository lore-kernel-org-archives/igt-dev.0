Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2664850618871444295=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Petri Latvala" <adrinael@adrinael.net>
Date: Tue, 24 Oct 2023 01:56:40 -0000
Message-ID: <169811260000.18360.602186125073884712@emeril.freedesktop.org>
References: <20231020133041.58257-1-adrinael@adrinael.net>
In-Reply-To: <20231020133041.58257-1-adrinael@adrinael.net>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_s?=
 =?utf-8?q?tarting_with_=5B1/3=5D_runner=3A_Normalize_testlist_entries_tha?=
 =?utf-8?q?t_don=27t_list_subtests?=
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

--===============2664850618871444295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] runner: Normalize testlist entries that don't list subtests
URL   : https://patchwork.freedesktop.org/series/125401/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7551_BAT -> XEIGTPW_10041_BAT
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

  Here are the changes found in XEIGTPW_10041_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#480]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-pvc-2:          [INCOMPLETE][5] ([Intel XE#613] / [Intel XE#814]) -> [INCOMPLETE][6] ([Intel XE#613])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/613
  [Intel XE#814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/814


Build changes
-------------

  * IGT: IGT_7551 -> IGTPW_10041

  IGTPW_10041: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10041/index.html
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-442-a0a80950176b39dbc76f8faa92fddf6caaa06191: a0a80950176b39dbc76f8faa92fddf6caaa06191

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/index.html

--===============2664850618871444295==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] runner: Normalize testlist entries that don&#39;t list subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125401/">https://patchwork.freedesktop.org/series/125401/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7551_BAT -&gt; XEIGTPW_10041_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10041_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-invalid-fault:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7551/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/613">Intel XE#613</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/814">Intel XE#814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10041/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/613">Intel XE#613</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7551 -&gt; IGTPW_10041</li>
</ul>
<p>IGTPW_10041: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10041/index.html<br />
  IGT_7551: 15e7d92ca5f98d10feffa27a76724c33cbd68da5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-442-a0a80950176b39dbc76f8faa92fddf6caaa06191: a0a80950176b39dbc76f8faa92fddf6caaa06191</p>

</body>
</html>

--===============2664850618871444295==--
