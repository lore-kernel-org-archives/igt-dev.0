Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82377C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 13:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C5C10E0EB;
	Wed, 30 Apr 2025 13:22:51 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2F110E74F;
 Wed, 30 Apr 2025 13:22:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7852252600482208434=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Ftiled=5Fdisplay?=
 =?utf-8?q?=3A_Skip_if_connectors_are_not_of_same_type?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 30 Apr 2025 13:22:50 -0000
Message-ID: <174601937011.30416.2537304727605413642@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250430073834.492414-1-pranay.samala@intel.com>
In-Reply-To: <20250430073834.492414-1-pranay.samala@intel.com>
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

--===============7852252600482208434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_tiled_display: Skip if connectors are not of same type
URL   : https://patchwork.freedesktop.org/series/148468/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8345_BAT -> XEIGTPW_13069_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8345 -> IGTPW_13069

  IGTPW_13069: e1bf9cad6c13e799e8902dade9d0bc5b2455defe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8345: b0aa259fb34bc85fd27a2a710a862e6ebea02d30 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3012-fc3ad08303990b2481cc45a6103ed79935dd3797: fc3ad08303990b2481cc45a6103ed79935dd3797

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13069/index.html

--===============7852252600482208434==
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
<tr><td><b>Series:</b></td><td>tests/kms_tiled_display: Skip if connectors are not of same type</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148468/">https://patchwork.freedesktop.org/series/148468/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13069/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13069/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8345_BAT -&gt; XEIGTPW_13069_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8345 -&gt; IGTPW_13069</li>
</ul>
<p>IGTPW_13069: e1bf9cad6c13e799e8902dade9d0bc5b2455defe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8345: b0aa259fb34bc85fd27a2a710a862e6ebea02d30 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3012-fc3ad08303990b2481cc45a6103ed79935dd3797: fc3ad08303990b2481cc45a6103ed79935dd3797</p>

</body>
</html>

--===============7852252600482208434==--
