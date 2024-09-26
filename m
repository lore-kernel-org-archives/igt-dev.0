Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D235ECCFA15
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 05:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FA410E881;
	Thu, 26 Sep 2024 05:11:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3648952F;
 Thu, 26 Sep 2024 05:09:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9177998663467134172=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/kms=5Fplane=5Fscaling=3A?=
 =?utf-8?q?_Cdclk_exceeds_max_Cdclk_issue_fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 05:09:55 -0000
Message-ID: <172732739510.1104305.3342277201646625288@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925103313.2126359-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240925103313.2126359-1-ramanaidu.naladala@intel.com>
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

--===============9177998663467134172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Cdclk exceeds max Cdclk issue fix (rev2)
URL   : https://patchwork.freedesktop.org/series/139049/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8032_BAT -> XEIGTPW_11798_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11798_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11798_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11798_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:
    - bat-bmg-1:          NOTRUN -> [SKIP][1] +39 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - bat-lnl-2:          NOTRUN -> [SKIP][2] +131 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-lnl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:
    - bat-lnl-1:          NOTRUN -> [SKIP][3] +45 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4] +17 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-dg2-oem2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - {bat-bmg-2}:        NOTRUN -> [SKIP][5] +164 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11798_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - bat-pvc-2:          NOTRUN -> [SKIP][6] ([Intel XE#1024]) +32 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-pvc-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#2463]) +32 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-adlp-vf/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#1024]) +32 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#455]) +11 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-dg2-oem2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8032 -> IGTPW_11798
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b

  IGTPW_11798: 947f9436f5b1edd6dce97a34c0d3257312737294 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/index.html

--===============9177998663467134172==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Cdclk exceeds max Cdclk issue fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139049/">https://patchwork.freedesktop.org/series/139049/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8032_BAT -&gt; XEIGTPW_11798_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11798_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11798_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11798_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-a.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-lnl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> +131 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> +45 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-dg2-oem2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-a.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:<ul>
<li>{bat-bmg-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> +164 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11798_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-pvc-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-adlp-vf/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11798/bat-dg2-oem2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGTPW_11798</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b</li>
</ul>
<p>IGTPW_11798: 947f9436f5b1edd6dce97a34c0d3257312737294 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b</p>

</body>
</html>

--===============9177998663467134172==--
