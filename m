Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABB6C88E50
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 11:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7F410F582;
	Fri, 11 Sep 2026 11:48:50 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011E110F568;
 Fri, 11 Sep 2026 11:48:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2403687183278596272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/igt=5Feld=3A_Fix_88=2E2?=
 =?utf-8?q?kHz/176=2E4kHz_sample_rate_parsing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 11 Sep 2026 11:48:06 -0000
Message-ID: <178912728699.151079.6545246974106592289@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
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

--===============2403687183278596272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing (rev2)
URL   : https://patchwork.freedesktop.org/series/173146/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9092_BAT -> XEIGTPW_15832_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15832_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15832_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15832_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9092/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15832_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9115])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9092/bat-ptl-2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * IGT: IGT_9092 -> IGTPW_15832
  * Linux: xe-5727-b6d5d3322d5aafa2fdfae5731c06336976099913 -> xe-5728-774012d1006e6642542095389ca1a0cabd21ac40

  IGTPW_15832: 15832
  IGT_9092: 9092
  xe-5727-b6d5d3322d5aafa2fdfae5731c06336976099913: b6d5d3322d5aafa2fdfae5731c06336976099913
  xe-5728-774012d1006e6642542095389ca1a0cabd21ac40: 774012d1006e6642542095389ca1a0cabd21ac40

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/index.html

--===============2403687183278596272==
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
<tr><td><b>Series:</b></td><td>lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173146/">https://patchwork.freedesktop.org/series/173146/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9092_BAT -&gt; XEIGTPW_15832_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15832_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15832_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15832_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9092/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15832_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9092/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15832/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9092 -&gt; IGTPW_15832</li>
<li>Linux: xe-5727-b6d5d3322d5aafa2fdfae5731c06336976099913 -&gt; xe-5728-774012d1006e6642542095389ca1a0cabd21ac40</li>
</ul>
<p>IGTPW_15832: 15832<br />
  IGT_9092: 9092<br />
  xe-5727-b6d5d3322d5aafa2fdfae5731c06336976099913: b6d5d3322d5aafa2fdfae5731c06336976099913<br />
  xe-5728-774012d1006e6642542095389ca1a0cabd21ac40: 774012d1006e6642542095389ca1a0cabd21ac40</p>

</body>
</html>

--===============2403687183278596272==--
