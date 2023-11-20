Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3690108304852324134=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 20 Nov 2023 23:14:13 -0000
Message-ID: <170052205313.29474.14263611870370542742@emeril.freedesktop.org>
References: <20231120182430.88753-1-matthew.auld@intel.com>
In-Reply-To: <20231120182430.88753-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_PAT_and_?=
 =?utf-8?q?cache_coherency_support_=28rev10=29?=
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

--===============3690108304852324134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev10)
URL   : https://patchwork.freedesktop.org/series/124667/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7595_BAT -> XEIGTPW_10221_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10221_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10221_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10221_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +61 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] +72 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * {igt@xe_mmap@cpu-caching} (NEW):
    - bat-pvc-2:          NOTRUN -> [FAIL][5] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_mmap@cpu-caching.html
    - bat-adlp-7:         NOTRUN -> [FAIL][6] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_mmap@cpu-caching.html
    - bat-atsm-2:         NOTRUN -> [FAIL][7] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_mmap@cpu-caching.html

  * {igt@xe_pat@prime-external-import-coh} (NEW):
    - bat-atsm-2:         NOTRUN -> [ABORT][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
    - bat-pvc-2:          NOTRUN -> [ABORT][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html
    - bat-adlp-7:         NOTRUN -> [ABORT][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12] +89 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][13] ([Intel XE#482]) -> [FAIL][14] +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][15] ([Intel XE#392]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-pvc-2:          [PASS][17] -> [FAIL][18] +6 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][19] -> [FAIL][20] +7 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][21] -> [FAIL][22] +5 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
New tests
---------

  New tests have been introduced between XEIGT_7595_BAT and XEIGTPW_10221_BAT:

### New IGT tests (9) ###

  * igt@xe_mmap@cpu-caching:
    - Statuses : 3 fail(s)
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
    - Statuses : 3 abort(s)
    - Exec time: [0.0] s

  * igt@xe_pat@prime-self-import-coh:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@userptr-coh-none:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482


Build changes
-------------

  * IGT: IGT_7595 -> IGTPW_10221
  * Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -> xe-509-e580c76ab4e23dfd26e0199c8054e951f8f7d05f

  IGTPW_10221: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10221/index.html
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23
  xe-509-e580c76ab4e23dfd26e0199c8054e951f8f7d05f: e580c76ab4e23dfd26e0199c8054e951f8f7d05f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/index.html

--===============3690108304852324134==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124667/">https://patchwork.freedesktop.org/series/124667/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7595_BAT -&gt; XEIGTPW_10221_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10221_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10221_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10221_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +61 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +72 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_mmap@cpu-caching} (NEW):</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_mmap@cpu-caching.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_mmap@cpu-caching.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_mmap@cpu-caching.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@prime-external-import-coh} (NEW):</p>
<ul>
<li>
<p>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">ABORT</a></p>
</li>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">ABORT</a></p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +89 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-small-cm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-pvc-2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7595/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10221/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7595_BAT and XEIGTPW_10221_BAT:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
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
<li>Statuses : 3 abort(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@prime-self-import-coh:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7595 -&gt; IGTPW_10221</li>
<li>Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -&gt; xe-509-e580c76ab4e23dfd26e0199c8054e951f8f7d05f</li>
</ul>
<p>IGTPW_10221: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10221/index.html<br />
  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23<br />
  xe-509-e580c76ab4e23dfd26e0199c8054e951f8f7d05f: e580c76ab4e23dfd26e0199c8054e951f8f7d05f</p>

</body>
</html>

--===============3690108304852324134==--
