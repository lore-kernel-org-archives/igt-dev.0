Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23DAC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D6410E80B;
	Thu, 18 Jul 2024 12:53:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D82710E80A;
 Thu, 18 Jul 2024 12:53:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1911014520584511188=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fplane=5Fscaling=3A?=
 =?utf-8?q?_Improvise_the?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 18 Jul 2024 12:53:16 -0000
Message-ID: <172130719631.286319.12297542221277660920@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718110851.665102-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240718110851.665102-1-ramanaidu.naladala@intel.com>
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

--===============1911014520584511188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Improvise the
URL   : https://patchwork.freedesktop.org/series/136234/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7930_BAT -> XEIGTPW_11426_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11426_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11426_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11426_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] +41 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b-edp-1:
    - bat-lnl-1:          NOTRUN -> [SKIP][2] +67 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] +20 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - {bat-lnl-2}:        NOTRUN -> [SKIP][4] +48 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - {bat-bmg-1}:        NOTRUN -> [INCOMPLETE][5] +3 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-3:
    - {bat-bmg-1}:        NOTRUN -> [SKIP][6] +65 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11426_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#309])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-lnl-1:          NOTRUN -> [SKIP][8] ([Intel XE#309])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-adlp-7:         NOTRUN -> [SKIP][9] ([Intel XE#309])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - bat-lnl-1:          NOTRUN -> [SKIP][10] ([Intel XE#599])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][11] ([Intel XE#361]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][12] ([Intel XE#498]) +17 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#1024]) +48 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-pvc-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#498]) +11 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] ([Intel XE#498]) +17 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][16] ([Intel XE#455] / [Intel XE#498]) +11 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1:
    - bat-lnl-1:          NOTRUN -> [SKIP][17] ([Intel XE#498]) +25 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - bat-atsm-2:         NOTRUN -> [SKIP][18] ([Intel XE#1024]) +48 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][19] ([Intel XE#455]) +13 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][20] ([Intel XE#455]) +27 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599


Build changes
-------------

  * IGT: IGT_7930 -> IGTPW_11426
  * Linux: xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7 -> xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c

  IGTPW_11426: cb1ea9247c9f1d7bb673d3a09961e813c05b5c11 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7930: 7930
  xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7: 66d3fbb024886f8fbbc15fe79222f046cccd18c7
  xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c: d0e3ac45f03af2770c2027a1e9799617e1186e5c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/index.html

--===============1911014520584511188==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Improvise the</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136234/">https://patchwork.freedesktop.org/series/136234/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7930_BAT -&gt; XEIGTPW_11426_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11426_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11426_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11426_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-dp-3.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>{bat-lnl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-3:</p>
<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-hdmi-a-3.html">SKIP</a> +65 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11426_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-pvc-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +48 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-dg2-oem2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11426/bat-adlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +27 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7930 -&gt; IGTPW_11426</li>
<li>Linux: xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7 -&gt; xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c</li>
</ul>
<p>IGTPW_11426: cb1ea9247c9f1d7bb673d3a09961e813c05b5c11 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7930: 7930<br />
  xe-1623-66d3fbb024886f8fbbc15fe79222f046cccd18c7: 66d3fbb024886f8fbbc15fe79222f046cccd18c7<br />
  xe-1624-d0e3ac45f03af2770c2027a1e9799617e1186e5c: d0e3ac45f03af2770c2027a1e9799617e1186e5c</p>

</body>
</html>

--===============1911014520584511188==--
