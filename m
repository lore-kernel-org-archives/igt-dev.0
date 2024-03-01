Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B81C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 21:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B1010ECF1;
	Fri,  1 Mar 2024 21:43:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8425D10ECF1;
 Fri,  1 Mar 2024 21:43:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0920587549935890272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_tests_for_solid_fill_plane?=
 =?utf-8?q?s_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jessica Zhang" <quic_jesszhan@quicinc.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 01 Mar 2024 21:43:13 -0000
Message-ID: <170932939354.453379.10744936911242337508@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
In-Reply-To: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============0920587549935890272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add tests for solid fill planes (rev3)
URL   : https://patchwork.freedesktop.org/series/127900/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7742_BAT -> XEIGTPW_10765_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10765_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10765_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10765_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@too-wide:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +26 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] +29 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#623]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#455]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][9] ([Intel XE#455]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#616]) -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#929]) -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10765_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][15] ([i915#6077]) +30 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][16] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][17] ([Intel XE#1024] / [Intel XE#784])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         NOTRUN -> [SKIP][18] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         NOTRUN -> [SKIP][19] ([Intel XE#540]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#1024] / [Intel XE#783])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         NOTRUN -> [SKIP][21] ([i915#1836]) +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][22] ([Intel XE#780])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         NOTRUN -> [SKIP][23] ([Intel XE#1024]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - bat-atsm-2:         NOTRUN -> [SKIP][24] ([Intel XE#288]) +22 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][25] ([Intel XE#255])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][26] ([Intel XE#977])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-atsm-2:         NOTRUN -> [SKIP][27] ([Intel XE#979]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7742 -> IGTPW_10765
  * Linux: xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5 -> xe-888-5f60548dd58e2ad93005c933fd2633d98db60de4

  IGTPW_10765: 10765
  IGT_7742: 7742
  xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5: 320f2374b2d52629a6a52c6c3059f02efd73c0a5
  xe-888-5f60548dd58e2ad93005c933fd2633d98db60de4: 5f60548dd58e2ad93005c933fd2633d98db60de4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/index.html

--===============0920587549935890272==
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
<tr><td><b>Series:</b></td><td>Add tests for solid fill planes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127900/">https://patchwork.freedesktop.org/series/127900/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7742_BAT -&gt; XEIGTPW_10765_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10765_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10765_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10765_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7742/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10765_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10765/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7742 -&gt; IGTPW_10765</li>
<li>Linux: xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5 -&gt; xe-888-5f60548dd58e2ad93005c933fd2633d98db60de4</li>
</ul>
<p>IGTPW_10765: 10765<br />
  IGT_7742: 7742<br />
  xe-886-320f2374b2d52629a6a52c6c3059f02efd73c0a5: 320f2374b2d52629a6a52c6c3059f02efd73c0a5<br />
  xe-888-5f60548dd58e2ad93005c933fd2633d98db60de4: 5f60548dd58e2ad93005c933fd2633d98db60de4</p>

</body>
</html>

--===============0920587549935890272==--
