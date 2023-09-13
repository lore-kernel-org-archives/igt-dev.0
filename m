Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4864126823541978977=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 13 Sep 2023 01:09:43 -0000
Message-ID: <169456738358.31250.8429500174950728622@emeril.freedesktop.org>
References: <20230912234954.2110973-1-matthew.brost@intel.com>
In-Reply-To: <20230912234954.2110973-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Remove_X?=
 =?utf-8?q?E=5FEXEC=5FQUEUE=5FSET=5FPROPERTY=5FCOMPUTE=5FMODE_from_Xe_uAPI?=
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

--===============4864126823541978977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from Xe uAPI
URL   : https://patchwork.freedesktop.org/series/123619/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7482_BAT -> XEIGTPW_9778_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9778_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9778_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9778_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  


Build changes
-------------

  * IGT: IGT_7482 -> IGTPW_9778
  * Linux: xe-368-b2c3b639e43d697c7aabb118f2e27eac926cd771 -> xe-369-da184d0771450c366fa6499d42b49eba733a67f8

  IGTPW_9778: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html
  IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-368-b2c3b639e43d697c7aabb118f2e27eac926cd771: b2c3b639e43d697c7aabb118f2e27eac926cd771
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/index.html

--===============4864126823541978977==
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
<tr><td><b>Series:</b></td><td>Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from Xe uAPI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123619/">https://patchwork.freedesktop.org/series/123619/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7482_BAT -&gt; XEIGTPW_9778_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9778_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9778_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9778_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-atsm-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7482/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9778/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7482 -&gt; IGTPW_9778</li>
<li>Linux: xe-368-b2c3b639e43d697c7aabb118f2e27eac926cd771 -&gt; xe-369-da184d0771450c366fa6499d42b49eba733a67f8</li>
</ul>
<p>IGTPW_9778: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9778/index.html<br />
  IGT_7482: beccb244183d5839c2464b856cd0b541f105e2ad @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-368-b2c3b639e43d697c7aabb118f2e27eac926cd771: b2c3b639e43d697c7aabb118f2e27eac926cd771<br />
  xe-369-da184d0771450c366fa6499d42b49eba733a67f8: da184d0771450c366fa6499d42b49eba733a67f8</p>

</body>
</html>

--===============4864126823541978977==--
