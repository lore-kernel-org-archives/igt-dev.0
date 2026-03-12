Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A48103E2F0
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 00:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790D410E92C;
	Thu, 12 Mar 2026 00:38:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37010E92C;
 Thu, 12 Mar 2026 00:38:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0778547950099181904=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_intel-ci=3A_Blocklist_BMG_s?=
 =?utf-8?q?pecific_modifiers_on_NVL/PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Mar 2026 00:38:19 -0000
Message-ID: <177327589902.347694.3263254536054773644@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311120300.577179-1-swati2.sharma@intel.com>
In-Reply-To: <20260311120300.577179-1-swati2.sharma@intel.com>
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

--===============0778547950099181904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Blocklist BMG specific modifiers on NVL/PTL
URL   : https://patchwork.freedesktop.org/series/163029/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8795_BAT -> XEIGTPW_14733_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14733_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14733/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14733/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8795 -> IGTPW_14733
  * Linux: xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7 -> xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6

  IGTPW_14733: a597892db293f92e6f4a906e8f4a5714f07201a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8795: 8795
  xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7: f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7
  xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14733/index.html

--===============0778547950099181904==
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
<tr><td><b>Series:</b></td><td>intel-ci: Blocklist BMG specific modifiers on NVL/PTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163029/">https://patchwork.freedesktop.org/series/163029/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14733/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14733/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8795_BAT -&gt; XEIGTPW_14733_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14733_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14733/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14733/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8795 -&gt; IGTPW_14733</li>
<li>Linux: xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7 -&gt; xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6</li>
</ul>
<p>IGTPW_14733: a597892db293f92e6f4a906e8f4a5714f07201a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8795: 8795<br />
  xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7: f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7<br />
  xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6</p>

</body>
</html>

--===============0778547950099181904==--
