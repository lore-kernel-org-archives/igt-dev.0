Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAA0CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 23:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8512410EAAB;
	Wed, 27 May 2026 23:25:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC3710EAAA;
 Wed, 27 May 2026 23:24:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7283569692495403360=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fcolorop=3A_Asso?=
 =?utf-8?q?rted_fixes_and_support_for_i915/Xe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.harrison@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 May 2026 23:24:42 -0000
Message-ID: <177992428297.18055.7691001171134181932@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527193612.651624-1-John.Harrison@Igalia.com>
In-Reply-To: <20260527193612.651624-1-John.Harrison@Igalia.com>
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

--===============7283569692495403360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_colorop: Assorted fixes and support for i915/Xe (rev2)
URL   : https://patchwork.freedesktop.org/series/167234/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8939_BAT -> XEIGTPW_15264_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15264_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15264_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 2)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_15264_BAT prevented too many machines from booting.

  Missing    (11): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2 bat-ptl-vm bat-ptl-1 bat-bmg-vm bat-bmg-3 bat-wcl-1 bat-bmg-2 bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8939 -> IGTPW_15264
  * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -> xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6

  IGTPW_15264: 15264
  IGT_8939: 8939
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15264/index.html

--===============7283569692495403360==
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
<tr><td><b>Series:</b></td><td>tests/kms_colorop: Assorted fixes and support for i915/Xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167234/">https://patchwork.freedesktop.org/series/167234/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15264/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15264/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8939_BAT -&gt; XEIGTPW_15264_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15264_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15264_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 2)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_15264_BAT prevented too many machines from booting.</p>
<p>Missing    (11): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-2 bat-ptl-vm bat-ptl-1 bat-bmg-vm bat-bmg-3 bat-wcl-1 bat-bmg-2 bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8939 -&gt; IGTPW_15264</li>
<li>Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -&gt; xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6</li>
</ul>
<p>IGTPW_15264: 15264<br />
  IGT_8939: 8939<br />
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb<br />
  xe-5139-7570b524ddecbe5db4af0c493a047e21bab6b3d6: 7570b524ddecbe5db4af0c493a047e21bab6b3d6</p>

</body>
</html>

--===============7283569692495403360==--
