Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C1EEB597E
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 08:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CB310E06C;
	Wed, 11 Feb 2026 08:41:09 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0006D10E06C;
 Wed, 11 Feb 2026 08:41:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8014978698629885651=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Enable_Vebox_engine_copy_on?=
 =?utf-8?q?_Intel_Xe_driver_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Feb 2026 08:41:07 -0000
Message-ID: <177079926797.244838.5635400232525421414@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
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

--===============8014978698629885651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable Vebox engine copy on Intel Xe driver (rev3)
URL   : https://patchwork.freedesktop.org/series/161376/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8748_BAT -> XEIGTPW_14536_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14536_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14536_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14536_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +14 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  * igt@xe_intel_bb@simple-bb-ctx:
    - bat-adlp-vm:        [PASS][3] -> [FAIL][4] +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html
    - bat-ptl-1:          [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-ptl-1/igt@xe_intel_bb@simple-bb-ctx.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-ptl-1/igt@xe_intel_bb@simple-bb-ctx.html
    - bat-ptl-vm:         [PASS][7] -> [FAIL][8] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-ptl-vm/igt@xe_intel_bb@simple-bb-ctx.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-ptl-vm/igt@xe_intel_bb@simple-bb-ctx.html
    - bat-lnl-1:          [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html

  * igt@xe_pat@pat-index-xe2@dw:
    - bat-bmg-2:          [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html
    - bat-bmg-1:          [PASS][13] -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html
    - bat-lnl-2:          [PASS][15] -> [FAIL][16] +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html
    - bat-ptl-2:          [PASS][17] -> [FAIL][18] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-ptl-2/igt@xe_pat@pat-index-xe2@dw.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-ptl-2/igt@xe_pat@pat-index-xe2@dw.html

  * igt@xe_pat@pat-index-xelp:
    - bat-dg2-oem2:       [PASS][19] -> [FAIL][20] +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html
    - bat-atsm-2:         [PASS][21] -> [FAIL][22] +2 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-atsm-2/igt@xe_pat@pat-index-xelp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-atsm-2/igt@xe_pat@pat-index-xelp.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14536_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][23] -> [FAIL][24] ([Intel XE#3149]) +7 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][25] -> [TIMEOUT][26] ([Intel XE#6506])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8748 -> IGTPW_14536

  IGTPW_14536: 14536
  IGT_8748: 8748
  xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0: 8ef710cfb81579fbf4107d77134e6e8d2c864ef0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/index.html

--===============8014978698629885651==
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
<tr><td><b>Series:</b></td><td>Enable Vebox engine copy on Intel Xe driver (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161376/">https://patchwork.freedesktop.org/series/161376/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8748_BAT -&gt; XEIGTPW_14536_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14536_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14536_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14536_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb-ctx:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-adlp-vm/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a> +2 other tests fail</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-ptl-1/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-ptl-1/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a> +2 other tests fail</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-ptl-vm/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-ptl-vm/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a> +2 other tests fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-lnl-1/igt@xe_intel_bb@simple-bb-ctx.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@dw:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-bmg-2/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +2 other tests fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-bmg-1/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +2 other tests fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-lnl-2/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +2 other tests fail</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-ptl-2/igt@xe_pat@pat-index-xe2@dw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-ptl-2/igt@xe_pat@pat-index-xe2@dw.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html">FAIL</a> +2 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14536_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8748/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14536/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8748 -&gt; IGTPW_14536</li>
</ul>
<p>IGTPW_14536: 14536<br />
  IGT_8748: 8748<br />
  xe-4541-8ef710cfb81579fbf4107d77134e6e8d2c864ef0: 8ef710cfb81579fbf4107d77134e6e8d2c864ef0</p>

</body>
</html>

--===============8014978698629885651==--
