Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4294BC61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 22:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA01A10E183;
	Thu,  3 Sep 2026 22:53:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFA610E183;
 Thu,  3 Sep 2026 22:52:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1876495414261499696=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel-ci=3A_Enable_PX?=
 =?utf-8?q?P_coverage_on_PTL=2C_CRI_and_BAT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 03 Sep 2026 22:52:30 -0000
Message-ID: <178847595083.121110.63721043251932472@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20260903214919.1005742-5-alan.previn.teres.alexis@intel.com>
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

--===============1876495414261499696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Enable PXP coverage on PTL, CRI and BAT
URL   : https://patchwork.freedesktop.org/series/173338/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9084_BAT -> XEIGTPW_15783_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15783_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15783_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15783_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-atsm-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15783_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - bat-bmg-1:          NOTRUN -> [SKIP][2] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - bat-nvls-1:         NOTRUN -> [SKIP][3] ([Intel XE#8816]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-nvls-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][4] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-bmg-vm/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
    - bat-bmg-2:          NOTRUN -> [SKIP][5] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
    - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#4733] / [Intel XE#5594]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-adlp-7/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#8816]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8816


Build changes
-------------

  * IGT: IGT_9084 -> IGTPW_15783
  * Linux: xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab -> xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826

  IGTPW_15783: 50377dcdfb88159f7e1d8c2006d67571f5825239 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9084: 9084
  xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab: 78e2bb86709699d886be71a6f9c9dc41e4bf9aab
  xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826: 96ca9b9870504c4a80addae1da9454c8c704a826

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/index.html

--===============1876495414261499696==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Enable PXP coverage on PTL, CRI and BAT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173338/">https://patchwork.freedesktop.org/series/173338/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9084_BAT -&gt; XEIGTPW_15783_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15783_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15783_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15783_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-atsm-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15783_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-nvls-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8816">Intel XE#8816</a>) +2 other tests skip</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-bmg-vm/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15783/bat-adlp-7/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9084 -&gt; IGTPW_15783</li>
<li>Linux: xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab -&gt; xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826</li>
</ul>
<p>IGTPW_15783: 50377dcdfb88159f7e1d8c2006d67571f5825239 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9084: 9084<br />
  xe-5687-78e2bb86709699d886be71a6f9c9dc41e4bf9aab: 78e2bb86709699d886be71a6f9c9dc41e4bf9aab<br />
  xe-5689-96ca9b9870504c4a80addae1da9454c8c704a826: 96ca9b9870504c4a80addae1da9454c8c704a826</p>

</body>
</html>

--===============1876495414261499696==--
