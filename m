Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8881988891873612724=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_build=3A_Build_xe_tests_by_default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 11 Jan 2024 23:30:09 -0000
Message-ID: <170501580994.331655.691051573369857495@5338d5abeb45>
References: <20240111213358.1656641-1-lucas.demarchi@intel.com>
In-Reply-To: <20240111213358.1656641-1-lucas.demarchi@intel.com>
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

--===============8881988891873612724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] build: Build xe tests by default
URL   : https://patchwork.freedesktop.org/series/128693/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7670_BAT -> XEIGTPW_10516_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10516_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10516_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10516_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10516/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10516_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - bat-pvc-2:          [INCOMPLETE][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10516/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  


Build changes
-------------

  * IGT: IGT_7670 -> IGTPW_10516
  * Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -> xe-620-39d854dbde14bef5cabe3cf3a49de8894cd99ba7

  IGTPW_10516: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/index.html
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad
  xe-620-39d854dbde14bef5cabe3cf3a49de8894cd99ba7: 39d854dbde14bef5cabe3cf3a49de8894cd99ba7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10516/index.html

--===============8881988891873612724==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] build: Build xe tests by default</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128693/">https://patchwork.freedesktop.org/series/128693/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10516/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10516/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7670_BAT -&gt; XEIGTPW_10516_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10516_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10516_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10516_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10516/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10516_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7670/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10516/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7670 -&gt; IGTPW_10516</li>
<li>Linux: xe-618-79184e72263e91528195db01783148435c7e4fad -&gt; xe-620-39d854dbde14bef5cabe3cf3a49de8894cd99ba7</li>
</ul>
<p>IGTPW_10516: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10516/index.html<br />
  IGT_7670: 1b32bcdb2d9965090234739aba891a90743e01c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-618-79184e72263e91528195db01783148435c7e4fad: 79184e72263e91528195db01783148435c7e4fad<br />
  xe-620-39d854dbde14bef5cabe3cf3a49de8894cd99ba7: 39d854dbde14bef5cabe3cf3a49de8894cd99ba7</p>

</body>
</html>

--===============8881988891873612724==--
