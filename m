Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6957922277705739942=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Thu, 31 Aug 2023 23:09:33 -0000
Message-ID: <169352337392.12506.7313337062457869712@emeril.freedesktop.org>
References: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_New_dir_?=
 =?utf-8?q?structure_for_intel_specific_tests_=28rev9=29?=
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

--===============6957922277705739942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New dir structure for intel specific tests (rev9)
URL   : https://patchwork.freedesktop.org/series/117227/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7460_BAT -> XEIGTPW_9699_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_9699_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9699_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9699_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][1] ([Intel XE#288]) -> [SKIP][2] +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#288]) -> [SKIP][4] +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][5] ([Intel XE#288]) -> [SKIP][6] +17 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:
    - bat-adlp-7:         [SKIP][7] ([Intel XE#288]) -> [SKIP][8] +14 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#288]) -> [SKIP][10] +14 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [SKIP][11] ([Intel XE#288]) -> [SKIP][12] +14 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9699_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][13] -> [FAIL][14] ([Intel XE#480]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * IGT: IGT_7460 -> IGTPW_9699
  * Linux: xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05 -> xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505

  IGTPW_9699: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html
  IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05: 72da4b45f58f2a95d45743801a10e1f1e1dcce05
  xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505: bca3262d221e1402c03a89bb4ba520d6aa610505

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/index.html

--===============6957922277705739942==
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
<tr><td><b>Series:</b></td><td>New dir structure for intel specific tests (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/117227/">https://patchwork.freedesktop.org/series/117227/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7460_BAT -&gt; XEIGTPW_9699_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_9699_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9699_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9699_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +17 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> +14 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9699_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7460/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9699/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7460 -&gt; IGTPW_9699</li>
<li>Linux: xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05 -&gt; xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505</li>
</ul>
<p>IGTPW_9699: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9699/index.html<br />
  IGT_7460: 30b4034ea562952039ba6af58106791d5c39999e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-348-72da4b45f58f2a95d45743801a10e1f1e1dcce05: 72da4b45f58f2a95d45743801a10e1f1e1dcce05<br />
  xe-351-bca3262d221e1402c03a89bb4ba520d6aa610505: bca3262d221e1402c03a89bb4ba520d6aa610505</p>

</body>
</html>

--===============6957922277705739942==--
