Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2332498192678423513=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 27 Nov 2023 13:58:30 -0000
Message-ID: <170109351085.3005.13796080645741501260@emeril.freedesktop.org>
References: <20231127130526.30012-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231127130526.30012-1-thomas.hellstrom@linux.intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/in?=
 =?utf-8?q?tel/xe=3A_Adjust_to_KMD_uAPI_changes_for_long-running_VMs?=
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

--===============2332498192678423513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe: Adjust to KMD uAPI changes for long-running VMs
URL   : https://patchwork.freedesktop.org/series/126916/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7604_BAT -> XEIGTPW_10273_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10273_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10273_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10273_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +17 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7604/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] +14 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7604/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10273_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#480]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7604/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7604 -> IGTPW_10273
  * Linux: xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992 -> xe-519-742c5e2bbe41df0e79309e7d601e3a52ef0a4e59

  IGTPW_10273: 10273
  IGT_7604: d2af13d9f5be5ce23d996e4afd3e45990f5ab977 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992
  xe-519-742c5e2bbe41df0e79309e7d601e3a52ef0a4e59: 742c5e2bbe41df0e79309e7d601e3a52ef0a4e59

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/index.html

--===============2332498192678423513==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe: Adjust to KMD uAPI changes for long-running VMs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126916/">https://patchwork.freedesktop.org/series/126916/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7604_BAT -&gt; XEIGTPW_10273_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10273_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10273_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10273_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7604/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7604/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10273_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7604/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10273/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7604 -&gt; IGTPW_10273</li>
<li>Linux: xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992 -&gt; xe-519-742c5e2bbe41df0e79309e7d601e3a52ef0a4e59</li>
</ul>
<p>IGTPW_10273: 10273<br />
  IGT_7604: d2af13d9f5be5ce23d996e4afd3e45990f5ab977 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992<br />
  xe-519-742c5e2bbe41df0e79309e7d601e3a52ef0a4e59: 742c5e2bbe41df0e79309e7d601e3a52ef0a4e59</p>

</body>
</html>

--===============2332498192678423513==--
