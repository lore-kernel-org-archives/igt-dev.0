Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E59C02188
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 00:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098A10E5E5;
	Tue, 28 Jan 2025 00:51:07 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C148C10E26F;
 Tue, 28 Jan 2025 00:51:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6310891990990908378=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fpm=5Frpm?=
 =?utf-8?q?=3A_Restrict_cursor_tests_to_I915_driver?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jan 2025 00:51:06 -0000
Message-ID: <173802546678.1600141.2770268570004952047@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127162736.3451740-1-jeevan.b@intel.com>
In-Reply-To: <20250127162736.3451740-1-jeevan.b@intel.com>
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

--===============6310891990990908378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_rpm: Restrict cursor tests to I915 driver
URL   : https://patchwork.freedesktop.org/series/144000/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8210_BAT -> XEIGTPW_12500_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 5)
------------------------------

  Missing    (2): bat-adlp-vf bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8210 -> IGTPW_12500
  * Linux: xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132 -> xe-2561-3de9463a46e57221df6a0b5f2f5b7f33207d76f7

  IGTPW_12500: 12500
  IGT_8210: 6ccdcffdb1aa67cf90a3f9cae99502ae327de57a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132: 9606e7472e23df21b5a4ad0c4845643eed592132
  xe-2561-3de9463a46e57221df6a0b5f2f5b7f33207d76f7: 3de9463a46e57221df6a0b5f2f5b7f33207d76f7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12500/index.html

--===============6310891990990908378==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_rpm: Restrict cursor tests to I915 driver</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144000/">https://patchwork.freedesktop.org/series/144000/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12500/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12500/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8210_BAT -&gt; XEIGTPW_12500_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 5)</h2>
<p>Missing    (2): bat-adlp-vf bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8210 -&gt; IGTPW_12500</li>
<li>Linux: xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132 -&gt; xe-2561-3de9463a46e57221df6a0b5f2f5b7f33207d76f7</li>
</ul>
<p>IGTPW_12500: 12500<br />
  IGT_8210: 6ccdcffdb1aa67cf90a3f9cae99502ae327de57a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2555-9606e7472e23df21b5a4ad0c4845643eed592132: 9606e7472e23df21b5a4ad0c4845643eed592132<br />
  xe-2561-3de9463a46e57221df6a0b5f2f5b7f33207d76f7: 3de9463a46e57221df6a0b5f2f5b7f33207d76f7</p>

</body>
</html>

--===============6310891990990908378==--
