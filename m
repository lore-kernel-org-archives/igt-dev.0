Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B14C47DAF
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 19:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CA910E8A6;
	Thu, 18 Jan 2024 19:20:32 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F7510E8A6;
 Thu, 18 Jan 2024 19:20:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3546775086933226847=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_a_new_test_to_validate_the?=
 =?utf-8?q?_deep_sleep_state_during_extended_vblank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Thu, 18 Jan 2024 19:20:31 -0000
Message-ID: <170560563154.558566.18238559894912994305@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240118162100.797712-1-jeevan.b@intel.com>
In-Reply-To: <20240118162100.797712-1-jeevan.b@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============3546775086933226847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add a new test to validate the deep sleep state during extended vblank
URL   : https://patchwork.freedesktop.org/series/128949/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7683_BAT -> XEIGTPW_10558_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7683 -> IGTPW_10558
  * Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -> xe-645-e731a55be5d68e51e2cf0c5e243f6e870c69fa92

  IGTPW_10558: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10558/index.html
  IGT_7683: 7683
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad
  xe-645-e731a55be5d68e51e2cf0c5e243f6e870c69fa92: e731a55be5d68e51e2cf0c5e243f6e870c69fa92

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10558/index.html

--===============3546775086933226847==
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
<tr><td><b>Series:</b></td><td>Add a new test to validate the deep sleep state during extended vblank</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128949/">https://patchwork.freedesktop.org/series/128949/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10558/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10558/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7683_BAT -&gt; XEIGTPW_10558_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7683 -&gt; IGTPW_10558</li>
<li>Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -&gt; xe-645-e731a55be5d68e51e2cf0c5e243f6e870c69fa92</li>
</ul>
<p>IGTPW_10558: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10558/index.html<br />
  IGT_7683: 7683<br />
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad<br />
  xe-645-e731a55be5d68e51e2cf0c5e243f6e870c69fa92: e731a55be5d68e51e2cf0c5e243f6e870c69fa92</p>

</body>
</html>

--===============3546775086933226847==--
