Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327AAC79F9D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 14:34:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D242B10E3FE;
	Mon,  5 Jan 2026 14:34:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AD410E3FE;
 Mon,  5 Jan 2026 14:34:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7524461980018952261=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_intel-ci=3A_Update_LNL/PTL_?=
 =?utf-8?q?display_blocklist?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Jan 2026 14:34:19 -0000
Message-ID: <176762365975.126411.7769991403777419588@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260105084103.27898-1-jeevan.b@intel.com>
In-Reply-To: <20260105084103.27898-1-jeevan.b@intel.com>
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

--===============7524461980018952261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Update LNL/PTL display blocklist
URL   : https://patchwork.freedesktop.org/series/159632/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8683_BAT -> XEIGTPW_14284_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14284_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-ptl-1:          [SKIP][1] -> [PASS][2] +3 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8683/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14284/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8683/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14284/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8683 -> IGTPW_14284

  IGTPW_14284: 14284
  IGT_8683: 8683
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a1160e5f00973c38007e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14284/index.html

--===============7524461980018952261==
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
<tr><td><b>Series:</b></td><td>intel-ci: Update LNL/PTL display blocklist</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159632/">https://patchwork.freedesktop.org/series/159632/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14284/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14284/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8683_BAT -&gt; XEIGTPW_14284_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14284_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8683/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14284/bat-ptl-1/igt@kms_force_connector_basic@force-edid.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8683/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14284/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8683 -&gt; IGTPW_14284</li>
</ul>
<p>IGTPW_14284: 14284<br />
  IGT_8683: 8683<br />
  xe-4329-f5136cded03e959ebb00a1160e5f00973c38007e: f5136cded03e959ebb00a1160e5f00973c38007e</p>

</body>
</html>

--===============7524461980018952261==--
