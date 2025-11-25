Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D05D0EE0B
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 22:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880D510E4A5;
	Tue, 25 Nov 2025 22:41:04 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0831110E095;
 Tue, 25 Nov 2025 22:41:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2877534898033500132=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Redesign_of_the_xe=5Fdebugf?=
 =?utf-8?q?s_test_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 25 Nov 2025 22:41:04 -0000
Message-ID: <176411046402.27455.3132820916044791994@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251125165028.36533-1-piotr.piorkowski@intel.com>
In-Reply-To: <20251125165028.36533-1-piotr.piorkowski@intel.com>
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

--===============2877534898033500132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Redesign of the xe_debugfs test (rev2)
URL   : https://patchwork.freedesktop.org/series/157493/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8638_BAT -> XEIGTPW_14113_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14113_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14113_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14113_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_debugfs@xe-base:
    - bat-lnl-2:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-lnl-2/igt@xe_debugfs@xe-base.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-lnl-2/igt@xe_debugfs@xe-base.html

  * igt@xe_debugfs@xe-forcewake:
    - bat-bmg-2:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html
    - bat-bmg-1:          [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html
    - bat-ptl-2:          [PASS][9] -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html
    - bat-atsm-2:         [PASS][13] -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html
    - bat-adlp-vm:        [PASS][15] -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html
    - bat-ptl-1:          [PASS][17] -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html
    - bat-ptl-vm:         [PASS][19] -> [SKIP][20] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html
    - bat-lnl-1:          [PASS][21] -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14113_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][23] -> [FAIL][24] ([Intel XE#6520])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8638 -> IGTPW_14113
  * Linux: xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362 -> xe-4145-05b9cbe1e0c8295a61a82416e915f33075c84bc3

  IGTPW_14113: 77615a78edff1e7afd83a96c0c074364d6b52b67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
  xe-4145-05b9cbe1e0c8295a61a82416e915f33075c84bc3: 05b9cbe1e0c8295a61a82416e915f33075c84bc3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/index.html

--===============2877534898033500132==
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
<tr><td><b>Series:</b></td><td>Redesign of the xe_debugfs test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157493/">https://patchwork.freedesktop.org/series/157493/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8638_BAT -&gt; XEIGTPW_14113_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14113_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14113_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14113_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_debugfs@xe-base:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-lnl-2/igt@xe_debugfs@xe-base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-lnl-2/igt@xe_debugfs@xe-base.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@xe-forcewake:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-bmg-2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-bmg-1/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-adlp-7/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-ptl-2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-dg2-oem2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-atsm-2/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-adlp-vm/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-ptl-1/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-ptl-vm/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-lnl-1/igt@xe_debugfs@xe-forcewake.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14113_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8638/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14113/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8638 -&gt; IGTPW_14113</li>
<li>Linux: xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362 -&gt; xe-4145-05b9cbe1e0c8295a61a82416e915f33075c84bc3</li>
</ul>
<p>IGTPW_14113: 77615a78edff1e7afd83a96c0c074364d6b52b67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4144-0a21e96e0b6840d2a4e0b45a957679eeddeb4362: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362<br />
  xe-4145-05b9cbe1e0c8295a61a82416e915f33075c84bc3: 05b9cbe1e0c8295a61a82416e915f33075c84bc3</p>

</body>
</html>

--===============2877534898033500132==--
