Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D31C36005
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 00:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5E710E627;
	Wed, 26 Mar 2025 00:25:46 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51C810E627;
 Wed, 26 Mar 2025 00:25:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2384934904630425158=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Support_for_IN=5FFORMATS=5F?=
 =?utf-8?q?ASYNC_plane_property?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Mar 2025 00:25:44 -0000
Message-ID: <174294874480.3302.18352786720906155086@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
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

--===============2384934904630425158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Support for IN_FORMATS_ASYNC plane property
URL   : https://patchwork.freedesktop.org/series/146728/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8284_BAT -> XEIGTPW_12828_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12828_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12828/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8284 -> IGTPW_12828

  IGTPW_12828: 12828
  IGT_8284: 8284
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12828/index.html

--===============2384934904630425158==
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
<tr><td><b>Series:</b></td><td>Support for IN_FORMATS_ASYNC plane property</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146728/">https://patchwork.freedesktop.org/series/146728/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12828/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12828/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8284_BAT -&gt; XEIGTPW_12828_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12828_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-y:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8284/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12828/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-y.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8284 -&gt; IGTPW_12828</li>
</ul>
<p>IGTPW_12828: 12828<br />
  IGT_8284: 8284<br />
  xe-2853-afc2e1fea0a406eedbaf632e96cdb6832a45ebb7: afc2e1fea0a406eedbaf632e96cdb6832a45ebb7</p>

</body>
</html>

--===============2384934904630425158==--
