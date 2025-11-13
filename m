Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE6CD98E3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 21:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668C810E948;
	Thu, 13 Nov 2025 21:14:03 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F010E948;
 Thu, 13 Nov 2025 21:14:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5257485232584827355=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Redesign_of_the_xe=5Fdebugf?=
 =?utf-8?q?s_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Nov 2025 21:14:01 -0000
Message-ID: <176306844178.52218.5313881487906047398@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
In-Reply-To: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
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

--===============5257485232584827355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Redesign of the xe_debugfs test
URL   : https://patchwork.freedesktop.org/series/157493/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8623_BAT -> XEIGTPW_14051_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14051_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14051_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14051_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@xe-base:
    - bat-lnl-2:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-lnl-2/igt@xe_debugfs@xe-base.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-lnl-2/igt@xe_debugfs@xe-base.html

  * igt@xe_debugfs@xe-forcewake:
    - bat-bmg-2:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html
    - bat-bmg-1:          [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html
    - bat-ptl-2:          [PASS][9] -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html
    - bat-atsm-2:         [PASS][13] -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html
    - bat-adlp-vm:        [PASS][15] -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html
    - bat-ptl-1:          [PASS][17] -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html
    - bat-ptl-vm:         [PASS][19] -> [SKIP][20] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html
    - bat-lnl-1:          [PASS][21] -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html
    - bat-pvc-2:          [PASS][23] -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-pvc-2/igt@xe_debugfs@xe-forcewake.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-pvc-2/igt@xe_debugfs@xe-forcewake.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14051_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#4543]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][27] -> [FAIL][28] ([Intel XE#6519])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [DMESG-WARN][29] ([Intel XE#4543]) -> [PASS][30] +1 other test pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8623 -> IGTPW_14051
  * Linux: xe-4101-efff261d878490433669a252a1f40412e784ef92 -> xe-4102-3ce0a1e8a582ad7bd9923eaafcb8619986d59310

  IGTPW_14051: 14051
  IGT_8623: 8623
  xe-4101-efff261d878490433669a252a1f40412e784ef92: efff261d878490433669a252a1f40412e784ef92
  xe-4102-3ce0a1e8a582ad7bd9923eaafcb8619986d59310: 3ce0a1e8a582ad7bd9923eaafcb8619986d59310

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/index.html

--===============5257485232584827355==
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
<tr><td><b>Series:</b></td><td>Redesign of the xe_debugfs test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157493/">https://patchwork.freedesktop.org/series/157493/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8623_BAT -&gt; XEIGTPW_14051_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14051_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14051_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14051_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_debugfs@xe-base:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-lnl-2/igt@xe_debugfs@xe-base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-lnl-2/igt@xe_debugfs@xe-base.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@xe-forcewake:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-pvc-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-pvc-2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14051_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8623/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14051/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8623 -&gt; IGTPW_14051</li>
<li>Linux: xe-4101-efff261d878490433669a252a1f40412e784ef92 -&gt; xe-4102-3ce0a1e8a582ad7bd9923eaafcb8619986d59310</li>
</ul>
<p>IGTPW_14051: 14051<br />
  IGT_8623: 8623<br />
  xe-4101-efff261d878490433669a252a1f40412e784ef92: efff261d878490433669a252a1f40412e784ef92<br />
  xe-4102-3ce0a1e8a582ad7bd9923eaafcb8619986d59310: 3ce0a1e8a582ad7bd9923eaafcb8619986d59310</p>

</body>
</html>

--===============5257485232584827355==--
