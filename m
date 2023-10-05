Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1714183504867676499=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Thu, 05 Oct 2023 21:29:30 -0000
Message-ID: <169654137077.7513.5329436913278145232@emeril.freedesktop.org>
References: <20231005153116.452319-1-matthew.auld@intel.com>
In-Reply-To: <20231005153116.452319-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_PAT_and_?=
 =?utf-8?q?cache_coherency_support?=
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

--===============1714183504867676499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support
URL   : https://patchwork.freedesktop.org/series/124667/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7517_BAT -> XEIGTPW_9930_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9930_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9930_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9930_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-adlp-7:         [PASS][1] -> [WARN][2] +8 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][3] +60 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [PASS][4] -> [FAIL][5] +86 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][6] ([Intel XE#609]) -> [FAIL][7] +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][8] ([Intel XE#632]) -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_store@basic-store:
    - bat-adlp-7:         [FAIL][10] ([Intel XE#761]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_exec_store@basic-store.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_exec_store@basic-store.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][12] -> [FAIL][13] +5 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
New tests
---------

  New tests have been introduced between XEIGT_7517_BAT and XEIGTPW_9930_BAT:

### New IGT tests (23) ###

  * igt@xe_mmap@cpu-caching-coh:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-all:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-blt@system-system-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-uc-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wb-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-uc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wb:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@pat-index-common-render@system-system-wt-wt:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_pat@userptr-coh-none:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_9930_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][14] ([Intel XE#753])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753
  [Intel XE#761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/761


Build changes
-------------

  * IGT: IGT_7517 -> IGTPW_9930
  * Linux: xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875 -> xe-416-be79dc2504eef9a437df54ca9aac316755e475cf

  IGTPW_9930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9930/index.html
  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875: 3d2b298aaf52e74d4e90470cd65de047362e4875
  xe-416-be79dc2504eef9a437df54ca9aac316755e475cf: be79dc2504eef9a437df54ca9aac316755e475cf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/index.html

--===============1714183504867676499==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124667/">https://patchwork.freedesktop.org/series/124667/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7517_BAT -&gt; XEIGTPW_9930_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9930_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9930_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9930_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">FAIL</a> +60 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +86 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-store:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_exec_store@basic-store.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/761">Intel XE#761</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_exec_store@basic-store.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_vm@bind-execqueues-independent}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7517/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7517_BAT and XEIGTPW_9930_BAT:</p>
<h3>New IGT tests (23)</h3>
<ul>
<li>
<p>igt@xe_mmap@cpu-caching-coh:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-blt@system-system-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-uc-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wb-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-uc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wb:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-common-render@system-system-wt-wt:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@userptr-coh-none:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9930_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@migrate:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9930/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7517 -&gt; IGTPW_9930</li>
<li>Linux: xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875 -&gt; xe-416-be79dc2504eef9a437df54ca9aac316755e475cf</li>
</ul>
<p>IGTPW_9930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9930/index.html<br />
  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-415-3d2b298aaf52e74d4e90470cd65de047362e4875: 3d2b298aaf52e74d4e90470cd65de047362e4875<br />
  xe-416-be79dc2504eef9a437df54ca9aac316755e475cf: be79dc2504eef9a437df54ca9aac316755e475cf</p>

</body>
</html>

--===============1714183504867676499==--
