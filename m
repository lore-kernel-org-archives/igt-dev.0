Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7079249537116585203=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fthread?=
 =?utf-8?q?=3A_Increase_ufence_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pallavi Mishra" <pallavi.mishra@intel.com>
Date: Fri, 12 Jan 2024 01:34:32 -0000
Message-ID: <170502327261.290000.12676336552010824161@5338d5abeb45>
References: <20240112003450.1691892-1-pallavi.mishra@intel.com>
In-Reply-To: <20240112003450.1691892-1-pallavi.mishra@intel.com>
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

--===============7079249537116585203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_thread: Increase ufence timeout
URL   : https://patchwork.freedesktop.org/series/128697/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7670_BAT -> XEIGTPW_10518_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10518_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10518_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10518_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10518/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10518_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - bat-pvc-2:          [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10518/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  


Build changes
-------------

  * IGT: IGT_7670 -> IGTPW_10518
  * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052

  IGTPW_10518: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10518/index.html
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
  xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10518/index.html

--===============7079249537116585203==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_thread: Increase ufence timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128697/">https://patchwork.freedesktop.org/series/128697/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10518/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10518/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7670_BAT -&gt; XEIGTPW_10518_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10518_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10518_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10518_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10518/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10518_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10518/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7670 -&gt; IGTPW_10518</li>
<li>Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -&gt; xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052</li>
</ul>
<p>IGTPW_10518: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10518/index.html<br />
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad<br />
  xe-621-3095fbb4deb0722d417b6a4ad4213e2ed9ecd052: 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052</p>

</body>
</html>

--===============7079249537116585203==--
