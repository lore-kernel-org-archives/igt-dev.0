Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FD7D29C46
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 16:52:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CC010E1F8;
	Mon, 19 Jan 2026 16:52:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A784E10E012;
 Mon, 19 Jan 2026 16:52:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0175689828300670280=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=3A_switch_graphic?=
 =?utf-8?q?s/IP_version_queries_to_fd-based_APIs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wang, X" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jan 2026 16:52:55 -0000
Message-ID: <176884157568.168791.7557874054637076709@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260119073316.1033676-1-x.wang@intel.com>
In-Reply-To: <20260119073316.1033676-1-x.wang@intel.com>
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

--===============0175689828300670280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel: switch graphics/IP version queries to fd-based APIs
URL   : https://patchwork.freedesktop.org/series/160271/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8705_BAT -> XEIGTPW_14367_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_14367_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14367_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14367_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        [SKIP][1] ([Intel XE#977]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
    - bat-atsm-2:         [SKIP][3] ([Intel XE#977]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][5] ([Intel XE#977]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#977]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][9] ([Intel XE#2245]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][11] ([Intel XE#2245]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][13] ([Intel XE#977]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          [SKIP][15] ([Intel XE#5771]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][17] ([Intel XE#5771]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-vm:         [SKIP][19] ([Intel XE#5771]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][21] ([Intel XE#977]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14367_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][23] -> [TIMEOUT][24] ([Intel XE#6506])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8705 -> IGTPW_14367

  IGTPW_14367: 14367
  IGT_8705: 8705
  xe-4408-ce23d0a333e80437caeac552d098b1f241ff2926: ce23d0a333e80437caeac552d098b1f241ff2926

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/index.html

--===============0175689828300670280==
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
<tr><td><b>Series:</b></td><td>lib/intel: switch graphics/IP version queries to fd-based APIs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160271/">https://patchwork.freedesktop.org/series/160271/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8705_BAT -&gt; XEIGTPW_14367_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_14367_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14367_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14367_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14367_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8705/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14367/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8705 -&gt; IGTPW_14367</li>
</ul>
<p>IGTPW_14367: 14367<br />
  IGT_8705: 8705<br />
  xe-4408-ce23d0a333e80437caeac552d098b1f241ff2926: ce23d0a333e80437caeac552d098b1f241ff2926</p>

</body>
</html>

--===============0175689828300670280==--
