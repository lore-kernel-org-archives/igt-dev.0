Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2497566587120588260=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 07 Nov 2023 16:16:33 -0000
Message-ID: <169937379387.21169.2499333622928773996@emeril.freedesktop.org>
References: <20231107144803.165466-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231107144803.165466-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_dg1_?=
 =?utf-8?q?compute_pipeline?=
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

--===============2497566587120588260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add dg1 compute pipeline
URL   : https://patchwork.freedesktop.org/series/126077/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7575_BAT -> XEIGTPW_10130_BAT
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

  Here are the changes found in XEIGTPW_10130_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10130/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#524]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10130/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7575 -> IGTPW_10130
  * Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -> xe-474-17fc56818e8b2dd1311fa2b7716f3675db59bdb7

  IGTPW_10130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10130/index.html
  IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b
  xe-474-17fc56818e8b2dd1311fa2b7716f3675db59bdb7: 17fc56818e8b2dd1311fa2b7716f3675db59bdb7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10130/index.html

--===============2497566587120588260==
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
<tr><td><b>Series:</b></td><td>Add dg1 compute pipeline</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126077/">https://patchwork.freedesktop.org/series/126077/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10130/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10130/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7575_BAT -&gt; XEIGTPW_10130_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10130_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10130/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-noleak}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10130/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7575 -&gt; IGTPW_10130</li>
<li>Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -&gt; xe-474-17fc56818e8b2dd1311fa2b7716f3675db59bdb7</li>
</ul>
<p>IGTPW_10130: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10130/index.html<br />
  IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b<br />
  xe-474-17fc56818e8b2dd1311fa2b7716f3675db59bdb7: 17fc56818e8b2dd1311fa2b7716f3675db59bdb7</p>

</body>
</html>

--===============2497566587120588260==--
