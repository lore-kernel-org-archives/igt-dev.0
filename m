Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5831CCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 14:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D44310E0D7;
	Mon, 13 Oct 2025 14:27:34 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3996A10E0D7;
 Mon, 13 Oct 2025 14:27:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1997587804094080522=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsriov=5Fvr?=
 =?utf-8?q?am=3A_Skip_the_test_on_devices_without_VRAM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 13 Oct 2025 14:27:33 -0000
Message-ID: <176036565322.6232.16725558795443600196@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251013132708.20990-1-lukasz.laguna@intel.com>
In-Reply-To: <20251013132708.20990-1-lukasz.laguna@intel.com>
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

--===============1997587804094080522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sriov_vram: Skip the test on devices without VRAM
URL   : https://patchwork.freedesktop.org/series/155831/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8582_BAT -> XEIGTPW_13890_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8582 -> IGTPW_13890
  * Linux: xe-3900-06342be0412e879eaede7e6932e651f8cb630203 -> xe-3906-9440a5fa093bfa622a010df17c5a178c1a0dac23

  IGTPW_13890: 13890
  IGT_8582: 8582
  xe-3900-06342be0412e879eaede7e6932e651f8cb630203: 06342be0412e879eaede7e6932e651f8cb630203
  xe-3906-9440a5fa093bfa622a010df17c5a178c1a0dac23: 9440a5fa093bfa622a010df17c5a178c1a0dac23

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13890/index.html

--===============1997587804094080522==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sriov_vram: Skip the test on devices without VRAM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155831/">https://patchwork.freedesktop.org/series/155831/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13890/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13890/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8582_BAT -&gt; XEIGTPW_13890_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8582 -&gt; IGTPW_13890</li>
<li>Linux: xe-3900-06342be0412e879eaede7e6932e651f8cb630203 -&gt; xe-3906-9440a5fa093bfa622a010df17c5a178c1a0dac23</li>
</ul>
<p>IGTPW_13890: 13890<br />
  IGT_8582: 8582<br />
  xe-3900-06342be0412e879eaede7e6932e651f8cb630203: 06342be0412e879eaede7e6932e651f8cb630203<br />
  xe-3906-9440a5fa093bfa622a010df17c5a178c1a0dac23: 9440a5fa093bfa622a010df17c5a178c1a0dac23</p>

</body>
</html>

--===============1997587804094080522==--
