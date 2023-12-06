Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2250164472801322971=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 06 Dec 2023 09:44:38 -0000
Message-ID: <170185587807.26426.8547952353243907718@emeril.freedesktop.org>
References: <20231206083136.16099-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231206083136.16099-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/in?=
 =?utf-8?q?tel/kms=5Ffrontbuffer=5Ftracking=3A_Cleanup_pipe_crc?=
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

--===============2250164472801322971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_frontbuffer_tracking: Cleanup pipe crc
URL   : https://patchwork.freedesktop.org/series/127412/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7622_BAT -> XEIGTPW_10349_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10349_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10349_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10349_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10349_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] ([Intel XE#524])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#480]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#524]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-pvc-2:          [FAIL][9] -> [FAIL][10] ([Intel XE#999])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-pvc-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-pvc-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7622 -> IGTPW_10349
  * Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -> xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a

  IGTPW_10349: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10349/index.html
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/index.html

--===============2250164472801322971==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_frontbuffer_tracking: Cleanup pipe crc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127412/">https://patchwork.freedesktop.org/series/127412/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7622_BAT -&gt; XEIGTPW_10349_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10349_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10349_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10349_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_fd_dup:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10349_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-leak:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_fd_dup:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7622/bat-pvc-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10349/bat-pvc-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7622 -&gt; IGTPW_10349</li>
<li>Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -&gt; xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a</li>
</ul>
<p>IGTPW_10349: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10349/index.html<br />
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b<br />
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a</p>

</body>
</html>

--===============2250164472801322971==--
