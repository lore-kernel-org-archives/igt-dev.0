Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8D4C55822
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 19:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4C610EB88;
	Tue,  4 Aug 2026 19:12:53 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E50D10EB8F;
 Tue,  4 Aug 2026 19:12:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2059113669092815409=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel/kms=5Fdp=5Flin?=
 =?utf-8?q?ktrain=5Ffallback=3A_Add_UHBR-to-HBR_fallback_subtest_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S, Sowmiya" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 04 Aug 2026 19:12:18 -0000
Message-ID: <178587073837.19128.16843489425343084673@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803080514.687715-1-sowmiya.s@intel.com>
In-Reply-To: <20260803080514.687715-1-sowmiya.s@intel.com>
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

--===============2059113669092815409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/170685/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9036_FULL -> XEIGTPW_15622_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15622_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15622_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_15622_FULL prevented too many machines from booting.

  Missing    (2): shard-bmg shard-lnl 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9036 -> IGTPW_15622
  * Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -> xe-5521-f8d080b47819f01011c1b9c3c875badbb67ec955

  IGTPW_15622: bf17f26a80603db6df60e5976ae280a99c2134f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9036: 9036
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a
  xe-5521-f8d080b47819f01011c1b9c3c875badbb67ec955: f8d080b47819f01011c1b9c3c875badbb67ec955

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15622/index.html

--===============2059113669092815409==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dp_linktrain_fallback: Add UHBR-to-HBR fallback subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170685/">https://patchwork.freedesktop.org/series/170685/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15622/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15622/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9036_FULL -&gt; XEIGTPW_15622_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15622_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15622_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_15622_FULL prevented too many machines from booting.</p>
<p>Missing    (2): shard-bmg shard-lnl </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9036 -&gt; IGTPW_15622</li>
<li>Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -&gt; xe-5521-f8d080b47819f01011c1b9c3c875badbb67ec955</li>
</ul>
<p>IGTPW_15622: bf17f26a80603db6df60e5976ae280a99c2134f8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9036: 9036<br />
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a<br />
  xe-5521-f8d080b47819f01011c1b9c3c875badbb67ec955: f8d080b47819f01011c1b9c3c875badbb67ec955</p>

</body>
</html>

--===============2059113669092815409==--
