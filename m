Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0947D103E2FC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 01:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3CE10E337;
	Thu, 12 Mar 2026 01:39:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD84F10E337;
 Thu, 12 Mar 2026 01:39:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1569551005391243140=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Unify_Batch_Buffer_Alignmen?=
 =?utf-8?q?t_and_Introduce_Aligned_Buffer_Mapping?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Mar 2026 01:39:46 -0000
Message-ID: <177327958668.347694.1151982687794323209@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311170354.475828-1-nishit.sharma@intel.com>
In-Reply-To: <20260311170354.475828-1-nishit.sharma@intel.com>
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

--===============1569551005391243140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Unify Batch Buffer Alignment and Introduce Aligned Buffer Mapping
URL   : https://patchwork.freedesktop.org/series/163049/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8795_BAT -> XEIGTPW_14735_BAT
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

  Here are the changes found in XEIGTPW_14735_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#6519]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14735/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14735/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8795 -> IGTPW_14735
  * Linux: xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7 -> xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6

  IGTPW_14735: b346a2d51e4796d9c39bacb0aada173e229dfc12 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8795: 8795
  xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7: f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7
  xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14735/index.html

--===============1569551005391243140==
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
<tr><td><b>Series:</b></td><td>Unify Batch Buffer Alignment and Introduce Aligned Buffer Mapping</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163049/">https://patchwork.freedesktop.org/series/163049/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14735/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14735/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8795_BAT -&gt; XEIGTPW_14735_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14735_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14735/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8795/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14735/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8795 -&gt; IGTPW_14735</li>
<li>Linux: xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7 -&gt; xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6</li>
</ul>
<p>IGTPW_14735: b346a2d51e4796d9c39bacb0aada173e229dfc12 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8795: 8795<br />
  xe-4701-f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7: f8d4fc8745a5d5c57dd1e020fdb5c68f91fe33a7<br />
  xe-4702-4f823cb4f9faf6611f35c6a8a71ab696e3a734d6: 4f823cb4f9faf6611f35c6a8a71ab696e3a734d6</p>

</body>
</html>

--===============1569551005391243140==--
