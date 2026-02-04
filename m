Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF9AE9D3E8
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0810B10E256;
	Wed,  4 Feb 2026 14:45:28 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EA410E256;
 Wed,  4 Feb 2026 14:45:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5248864734979680536=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Faux=3A_Protect_ex?=
 =?utf-8?q?pressions_from_premature_casting_in_aux_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 04 Feb 2026 14:45:26 -0000
Message-ID: <177021632620.223259.11915437109669076369@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
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

--===============5248864734979680536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_aux: Protect expressions from premature casting in aux macros
URL   : https://patchwork.freedesktop.org/series/161144/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8735_BAT -> XEIGTPW_14489_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in XEIGTPW_14489_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8735/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14489/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8735 -> IGTPW_14489
  * Linux: xe-4495-241994730989320c926da9f2d0a5ec80b48f993d -> xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a

  IGTPW_14489: 14489
  IGT_8735: 8735
  xe-4495-241994730989320c926da9f2d0a5ec80b48f993d: 241994730989320c926da9f2d0a5ec80b48f993d
  xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a: ff449f153b0966cfd7a7291670c927f6b6971d2a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14489/index.html

--===============5248864734979680536==
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
<tr><td><b>Series:</b></td><td>lib/igt_aux: Protect expressions from premature casting in aux macros</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161144/">https://patchwork.freedesktop.org/series/161144/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14489/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14489/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8735_BAT -&gt; XEIGTPW_14489_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14489_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8735/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14489/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8735 -&gt; IGTPW_14489</li>
<li>Linux: xe-4495-241994730989320c926da9f2d0a5ec80b48f993d -&gt; xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a</li>
</ul>
<p>IGTPW_14489: 14489<br />
  IGT_8735: 8735<br />
  xe-4495-241994730989320c926da9f2d0a5ec80b48f993d: 241994730989320c926da9f2d0a5ec80b48f993d<br />
  xe-4496-ff449f153b0966cfd7a7291670c927f6b6971d2a: ff449f153b0966cfd7a7291670c927f6b6971d2a</p>

</body>
</html>

--===============5248864734979680536==--
