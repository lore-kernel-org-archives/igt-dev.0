Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E192AFEDA0D
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 19:26:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CDF10E5DE;
	Tue, 17 Mar 2026 19:26:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6C810E5DE;
 Tue, 17 Mar 2026 19:26:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1187774220124520957=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Skip_intel_unsupported_down?=
 =?utf-8?q?scale_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2026 19:26:18 -0000
Message-ID: <177377557821.368406.14098179169781519765@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260311074036.219075-1-ramanaidu.naladala@intel.com>
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

--===============1187774220124520957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip intel unsupported downscale tests (rev2)
URL   : https://patchwork.freedesktop.org/series/163003/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8807_BAT -> XEIGTPW_14789_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14789_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14789_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 11)
------------------------------

  Additional (1): bat-bmg-3 
  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14789_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - bat-wcl-1:          NOTRUN -> [SKIP][1] +73 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-wcl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - bat-ptl-1:          NOTRUN -> [SKIP][2] +5 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
    - bat-lnl-1:          NOTRUN -> [SKIP][3] +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - bat-bmg-1:          NOTRUN -> [SKIP][4] +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - bat-wcl-2:          NOTRUN -> [SKIP][5] +121 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-wcl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - bat-ptl-2:          NOTRUN -> [SKIP][6] +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-ptl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - bat-bmg-2:          NOTRUN -> [SKIP][7] +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
    - bat-lnl-2:          NOTRUN -> [SKIP][8] +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14789_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:
    - bat-lnl-2:          NOTRUN -> [SKIP][9] ([Intel XE#2763] / [Intel XE#6886]) +115 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - bat-atsm-2:         NOTRUN -> [SKIP][10] ([Intel XE#1024] / [Intel XE#947]) +34 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:
    - bat-ptl-1:          NOTRUN -> [SKIP][11] ([Intel XE#6886]) +144 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:
    - bat-lnl-1:          NOTRUN -> [SKIP][12] ([Intel XE#2763] / [Intel XE#6886]) +29 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - bat-bmg-2:          NOTRUN -> [SKIP][13] ([Intel XE#2763] / [Intel XE#6886]) +144 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][14] ([Intel XE#6566]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947


Build changes
-------------

  * IGT: IGT_8807 -> IGTPW_14789
  * Linux: xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6 -> xe-4737-6bb9fd4e927009e819a3d1c01a989545fb6ddbaa

  IGTPW_14789: 14789
  IGT_8807: 7f44d96d705f1583d689f1f8c2275b685b4ca11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6: 113073d07f958385b5b80d29b62e10d2cf0181d6
  xe-4737-6bb9fd4e927009e819a3d1c01a989545fb6ddbaa: 6bb9fd4e927009e819a3d1c01a989545fb6ddbaa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/index.html

--===============1187774220124520957==
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
<tr><td><b>Series:</b></td><td>Skip intel unsupported downscale tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163003/">https://patchwork.freedesktop.org/series/163003/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8807_BAT -&gt; XEIGTPW_14789_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14789_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14789_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Additional (1): bat-bmg-3 <br />
  Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14789_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-wcl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">SKIP</a> +73 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> +5 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-wcl-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> +121 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-ptl-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> +5 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14789_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-atsm-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14789/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8807 -&gt; IGTPW_14789</li>
<li>Linux: xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6 -&gt; xe-4737-6bb9fd4e927009e819a3d1c01a989545fb6ddbaa</li>
</ul>
<p>IGTPW_14789: 14789<br />
  IGT_8807: 7f44d96d705f1583d689f1f8c2275b685b4ca11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4735-113073d07f958385b5b80d29b62e10d2cf0181d6: 113073d07f958385b5b80d29b62e10d2cf0181d6<br />
  xe-4737-6bb9fd4e927009e819a3d1c01a989545fb6ddbaa: 6bb9fd4e927009e819a3d1c01a989545fb6ddbaa</p>

</body>
</html>

--===============1187774220124520957==--
