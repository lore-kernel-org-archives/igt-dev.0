Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6174700065556764120=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 22 Nov 2023 20:12:09 -0000
Message-ID: <170068392958.4727.10372695490643456828@emeril.freedesktop.org>
References: <20231122133612.973677-1-jouni.hogander@intel.com>
In-Reply-To: <20231122133612.973677-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIENJLnhlQkFUOiBzdWNjZXNzIGZvciBrbXNfYWRk?=
 =?utf-8?q?fb=5Fbasic=3A_Skip_not_relevant_test_for_Xe?=
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

--===============6174700065556764120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_addfb_basic: Skip not relevant test for Xe
URL   : https://patchwork.freedesktop.org/series/126763/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7597_BAT -> XEIGTPW_10244_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 2)
------------------------------

  Missing    (2): bat-pvc-2 bat-atsm-2 

Known issues
------------

  Here are the changes found in XEIGTPW_10244_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([i915#2346])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#624]) -> [SKIP][4] ([Intel XE#388])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][5] ([Intel XE#609]) -> [SKIP][6] ([Intel XE#388]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#609]) -> [SKIP][8] ([Intel XE#388]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][9] ([Intel XE#282] / [i915#2017]) -> [FAIL][10] ([Intel XE#616] / [Intel XE#750])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/388
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7597 -> IGTPW_10244

  IGTPW_10244: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10244/index.html
  IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/index.html

--===============6174700065556764120==
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
<tr><td><b>Series:</b></td><td>kms_addfb_basic: Skip not relevant test for Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126763/">https://patchwork.freedesktop.org/series/126763/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7597_BAT -&gt; XEIGTPW_10244_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 2)</h2>
<p>Missing    (2): bat-pvc-2 bat-atsm-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10244_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7597/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10244/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7597 -&gt; IGTPW_10244</li>
</ul>
<p>IGTPW_10244: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10244/index.html<br />
  IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc</p>

</body>
</html>

--===============6174700065556764120==--
