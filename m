Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AE5C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jul 2024 08:01:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219E110E0C4;
	Fri, 12 Jul 2024 08:01:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241EC10E0C4;
 Fri, 12 Jul 2024 08:01:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0793551735250995197=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fplane=5Fscaling=3A?=
 =?utf-8?q?_Improvise_the_scaling_BW_issues=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Jul 2024 08:01:21 -0000
Message-ID: <172077128113.166388.744332826173200026@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240712065003.530021-1-ramanaidu.naladala@intel.com>
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

--===============0793551735250995197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Improvise the scaling BW issues. (rev3)
URL   : https://patchwork.freedesktop.org/series/135806/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7925_BAT -> XEIGTPW_11403_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11403_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11403_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (6 -> 7)
------------------------------

  Additional (1): bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11403_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] +38 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1:
    - bat-lnl-1:          NOTRUN -> [SKIP][2] +93 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] +59 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - {bat-lnl-2}:        NOTRUN -> [SKIP][4] +48 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - {bat-bmg-1}:        NOTRUN -> [SKIP][5] +50 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-3:
    - {bat-bmg-1}:        NOTRUN -> [DMESG-WARN][6] +85 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - {bat-bmg-1}:        NOTRUN -> [INCOMPLETE][7] +8 other tests incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11403_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#309])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-lnl-1:          NOTRUN -> [SKIP][9] ([Intel XE#309])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#309])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-adlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - bat-lnl-1:          NOTRUN -> [SKIP][11] ([Intel XE#599])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][12] ([Intel XE#361]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - bat-pvc-2:          NOTRUN -> [SKIP][13] ([Intel XE#1024]) +48 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-pvc-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1:
    - bat-adlp-7:         NOTRUN -> [SKIP][14] ([Intel XE#455]) +39 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - bat-atsm-2:         NOTRUN -> [SKIP][15] ([Intel XE#1024]) +48 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][16] ([Intel XE#455]) +25 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599


Build changes
-------------

  * IGT: IGT_7925 -> IGTPW_11403
  * Linux: xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65 -> xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e

  IGTPW_11403: 11403
  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65: 3bcdb3f9a5370e29bc971883307487527c3e6a65
  xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e: 0b9174f237436b60b1c6fd9d5fbacbfcde660e3e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/index.html

--===============0793551735250995197==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Improvise the scaling BW issues. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135806/">https://patchwork.freedesktop.org/series/135806/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7925_BAT -&gt; XEIGTPW_11403_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11403_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11403_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (6 -&gt; 7)</h2>
<p>Additional (1): bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11403_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-dp-3.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-b-edp-1.html">SKIP</a> +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-adlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b-edp-1.html">SKIP</a> +59 other tests skip</li>
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
<li>{bat-lnl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-3:</p>
<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d-hdmi-a-3.html">DMESG-WARN</a> +85 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>{bat-bmg-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">INCOMPLETE</a> +8 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11403_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-adlp-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-lnl-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-pvc-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-adlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11403/bat-dg2-oem2/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-dp-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7925 -&gt; IGTPW_11403</li>
<li>Linux: xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65 -&gt; xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e</li>
</ul>
<p>IGTPW_11403: 11403<br />
  IGT_7925: def41c762723c9ba046a3ffe722d046cd12e993d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1597-3bcdb3f9a5370e29bc971883307487527c3e6a65: 3bcdb3f9a5370e29bc971883307487527c3e6a65<br />
  xe-1601-0b9174f237436b60b1c6fd9d5fbacbfcde660e3e: 0b9174f237436b60b1c6fd9d5fbacbfcde660e3e</p>

</body>
</html>

--===============0793551735250995197==--
