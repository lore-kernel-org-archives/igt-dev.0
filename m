Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6754042058997639120=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 09 Nov 2023 16:03:05 -0000
Message-ID: <169954578500.26589.93368762262493234@emeril.freedesktop.org>
References: <20231109133833.503891-1-matthew.auld@intel.com>
In-Reply-To: <20231109133833.503891-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_PAT_and_?=
 =?utf-8?q?cache_coherency_support_=28rev9=29?=
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

--===============6754042058997639120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev9)
URL   : https://patchwork.freedesktop.org/series/124667/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7580_BAT -> XEIGTPW_10150_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10150_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10150_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 4)
------------------------------

  Additional (2): bat-dg2-oem2 bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10150_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +10 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         NOTRUN -> [FAIL][3] +9 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          NOTRUN -> [FAIL][4] +63 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * {igt@xe_mmap@cpu-caching} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][5] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_mmap@cpu-caching.html

  * {igt@xe_pat@prime-external-import-coh} (NEW):
    - bat-atsm-2:         NOTRUN -> [ABORT][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
    - bat-pvc-2:          NOTRUN -> [ABORT][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][8] -> [FAIL][9] +86 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][10] ([Intel XE#389]) -> [FAIL][11] +3 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][12] ([Intel XE#482]) -> [FAIL][13] +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][14] ([Intel XE#854]) -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-ccs-overcommit-simple}:
    - bat-pvc-2:          [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-pvc-2:          NOTRUN -> [FAIL][18] +5 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_basic@twice-bindexecqueue}:
    - bat-adlp-7:         NOTRUN -> [FAIL][19] +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][20] -> [FAIL][21] +7 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  
New tests
---------

  New tests have been introduced between XEIGT_7580_BAT and XEIGTPW_10150_BAT:

### New IGT tests (9) ###

  * igt@xe_mmap@cpu-caching:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-all:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_pat@pat-index-xe2:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_pat@pat-index-xehpc:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_pat@pat-index-xelp:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_pat@pat-index-xelpg:
    - Statuses :
    - Exec time: [None] s

  * igt@xe_pat@prime-external-import-coh:
    - Statuses : 2 abort(s)
    - Exec time: [0.0] s

  * igt@xe_pat@prime-self-import-coh:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@userptr-coh-none:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_10150_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         NOTRUN -> [SKIP][22] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_compute_mode@twice-userptr:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][23] ([Intel XE#429])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][24] ([Intel XE#533]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][25] ([Intel XE#255])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][26] ([Intel XE#532])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][27] ([Intel XE#597] / [Intel XE#714])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][28] ([Intel XE#531])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/429
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854


Build changes
-------------

  * IGT: IGT_7580 -> IGTPW_10150

  IGTPW_10150: 10150
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-481-7a0da606f1fcf4b59d7164419f1ccd1c48d366af: 7a0da606f1fcf4b59d7164419f1ccd1c48d366af

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/index.html

--===============6754042058997639120==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124667/">https://patchwork.freedesktop.org/series/124667/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7580_BAT -&gt; XEIGTPW_10150_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10150_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10150_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 4)</h2>
<p>Additional (2): bat-dg2-oem2 bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10150_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +63 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_mmap@cpu-caching} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_mmap@cpu-caching.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@prime-external-import-coh} (NEW):</p>
<ul>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">ABORT</a></p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +86 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
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
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/854">Intel XE#854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-simple}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@twice-bindexecqueue}:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7580/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7580_BAT and XEIGTPW_10150_BAT:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-external-import-coh:</p>
<ul>
<li>Statuses : 2 abort(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10150_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/429">Intel XE#429</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/533">Intel XE#533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-dg2-oem2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10150/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7580 -&gt; IGTPW_10150</li>
</ul>
<p>IGTPW_10150: 10150<br />
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-481-7a0da606f1fcf4b59d7164419f1ccd1c48d366af: 7a0da606f1fcf4b59d7164419f1ccd1c48d366af</p>

</body>
</html>

--===============6754042058997639120==--
