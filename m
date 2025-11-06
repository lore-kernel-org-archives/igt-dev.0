Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F23CCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 19:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E62E10E9C2;
	Thu,  6 Nov 2025 19:29:53 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C459C10E9C4;
 Thu,  6 Nov 2025 19:29:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2254335065327346523=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Limit_debug_logging_in_CI_f?=
 =?utf-8?q?or_scaling_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 06 Nov 2025 19:29:52 -0000
Message-ID: <176245739279.25862.4498990074888070301@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20251106092204.1505129-1-ramanaidu.naladala@intel.com>
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

--===============2254335065327346523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit debug logging in CI for scaling tests
URL   : https://patchwork.freedesktop.org/series/157133/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8613_BAT -> XEIGTPW_14011_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14011_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14011_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14011_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@invalid-parameters:
    - bat-lnl-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-2/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:
    - bat-ptl-1:          NOTRUN -> [SKIP][2] +104 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - bat-ptl-2:          NOTRUN -> [SKIP][3] +29 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14011_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - bat-ptl-2:          NOTRUN -> [SKIP][4] ([Intel XE#5879])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#309])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-dg2-oem2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-ptl-1:          NOTRUN -> [SKIP][6] ([Intel XE#4887] / [Intel XE#5879])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-lnl-1:          NOTRUN -> [SKIP][7] ([Intel XE#309])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-bmg-2:          NOTRUN -> [SKIP][8] ([Intel XE#2571])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-bmg-1:          NOTRUN -> [SKIP][9] ([Intel XE#2571])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#309])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-adlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - bat-ptl-1:          NOTRUN -> [SKIP][11] ([Intel XE#4887] / [Intel XE#5959])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@intel-max-src-size.html
    - bat-lnl-1:          NOTRUN -> [SKIP][12] ([Intel XE#3307])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html
    - bat-bmg-2:          NOTRUN -> [SKIP][13] ([Intel XE#2685] / [Intel XE#3307])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html
    - bat-lnl-2:          NOTRUN -> [SKIP][14] ([Intel XE#3307]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html
    - bat-ptl-2:          NOTRUN -> [SKIP][15] ([Intel XE#5959])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - bat-bmg-2:          NOTRUN -> [SKIP][16] ([Intel XE#3307])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@invalid-parameters:
    - bat-bmg-2:          NOTRUN -> [SKIP][17] ([Intel XE#4887])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - bat-adlp-7:         NOTRUN -> [SKIP][18] ([Intel XE#2763]) +29 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
    - bat-lnl-2:          NOTRUN -> [SKIP][19] ([Intel XE#2763]) +139 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#1024]) +38 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:
    - bat-adlp-7:         NOTRUN -> [SKIP][21] ([Intel XE#2763] / [Intel XE#455]) +19 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:
    - bat-bmg-1:          NOTRUN -> [SKIP][22] ([Intel XE#2763]) +29 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - bat-pvc-2:          NOTRUN -> [SKIP][23] ([Intel XE#1024]) +38 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-pvc-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - bat-bmg-2:          NOTRUN -> [SKIP][24] ([Intel XE#2763]) +174 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - bat-lnl-1:          NOTRUN -> [SKIP][25] ([Intel XE#2763]) +53 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:
    - bat-ptl-1:          NOTRUN -> [SKIP][26] ([Intel XE#4887]) +71 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4887
  [Intel XE#5879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879
  [Intel XE#5959]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959


Build changes
-------------

  * IGT: IGT_8613 -> IGTPW_14011
  * Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -> xe-4059-6c75cb975886e76f3a87367959a748dcc29bd9a3

  IGTPW_14011: 14011
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad
  xe-4059-6c75cb975886e76f3a87367959a748dcc29bd9a3: 6c75cb975886e76f3a87367959a748dcc29bd9a3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/index.html

--===============2254335065327346523==
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
<tr><td><b>Series:</b></td><td>Limit debug logging in CI for scaling tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157133/">https://patchwork.freedesktop.org/series/157133/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8613_BAT -&gt; XEIGTPW_14011_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14011_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14011_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14011_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-2/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html">SKIP</a> +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14011_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879">Intel XE#5879</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-dg2-oem2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4887">Intel XE#4887</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5879">Intel XE#5879</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-adlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4887">Intel XE#4887</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959">Intel XE#5959</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) +1 other test skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-2/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959">Intel XE#5959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4887">Intel XE#4887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-pvc-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +174 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14011/bat-ptl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4887">Intel XE#4887</a>) +71 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8613 -&gt; IGTPW_14011</li>
<li>Linux: xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad -&gt; xe-4059-6c75cb975886e76f3a87367959a748dcc29bd9a3</li>
</ul>
<p>IGTPW_14011: 14011<br />
  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4058-6aa8d62a50c33f091548cc961a713223d488d6ad: 6aa8d62a50c33f091548cc961a713223d488d6ad<br />
  xe-4059-6c75cb975886e76f3a87367959a748dcc29bd9a3: 6c75cb975886e76f3a87367959a748dcc29bd9a3</p>

</body>
</html>

--===============2254335065327346523==--
