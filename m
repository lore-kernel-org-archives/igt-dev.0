Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6178595332418477252=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Date: Tue, 07 Nov 2023 22:18:08 -0000
Message-ID: <169939548876.21168.14058775867281669858@emeril.freedesktop.org>
References: <20231107205932.701351-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20231107205932.701351-1-jagmeet.randhawa@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_lib/gpgp?=
 =?utf-8?q?u=5Ffill=3A_Add_support_for_Xe2_platforms?=
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

--===============6178595332418477252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gpgpu_fill: Add support for Xe2 platforms
URL   : https://patchwork.freedesktop.org/series/126096/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7575_BAT -> XEIGTPW_10132_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10132_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10132_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10132_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +14 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          NOTRUN -> [FAIL][3] +164 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_live_ktest@bo:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_live_ktest@bo.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][5] ([Intel XE#389]) -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][7] ([Intel XE#482]) -> [FAIL][8] +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - bat-pvc-2:          [INCOMPLETE][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [FAIL][11] ([Intel XE#862]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-ccs-overcommit-simple}:
    - bat-pvc-2:          [PASS][13] -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          NOTRUN -> [FAIL][15] +12 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10132_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][16] -> [INCOMPLETE][17] ([Intel XE#597] / [Intel XE#714])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-dg2-oem2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][18] -> [INCOMPLETE][19] ([Intel XE#714])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-atsm-2/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-atsm-2/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][20] -> [INCOMPLETE][21] ([Intel XE#597])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-adlp-7/igt@xe_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714
  [Intel XE#862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/862


Build changes
-------------

  * IGT: IGT_7575 -> IGTPW_10132
  * Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -> xe-477-ca9ad81ba3f8a973358c7c4175f552b11e14ef62

  IGTPW_10132: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10132/index.html
  IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b
  xe-477-ca9ad81ba3f8a973358c7c4175f552b11e14ef62: ca9ad81ba3f8a973358c7c4175f552b11e14ef62

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/index.html

--===============6178595332418477252==
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
<tr><td><b>Series:</b></td><td>lib/gpgpu_fill: Add support for Xe2 platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126096/">https://patchwork.freedesktop.org/series/126096/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7575_BAT -&gt; XEIGTPW_10132_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10132_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10132_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10132_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +164 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_live_ktest@bo.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/862">Intel XE#862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-simple}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10132_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-dg2-oem2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-atsm-2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7575/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10132/bat-adlp-7/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7575 -&gt; IGTPW_10132</li>
<li>Linux: xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b -&gt; xe-477-ca9ad81ba3f8a973358c7c4175f552b11e14ef62</li>
</ul>
<p>IGTPW_10132: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10132/index.html<br />
  IGT_7575: 6edf8b6808de2bde968415926d2b55817f7ea1de @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-472-5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b: 5a3a6fdda31fc8fa60db6d2fa30bd4db2509eb8b<br />
  xe-477-ca9ad81ba3f8a973358c7c4175f552b11e14ef62: ca9ad81ba3f8a973358c7c4175f552b11e14ef62</p>

</body>
</html>

--===============6178595332418477252==--
