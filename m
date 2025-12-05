Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D7BD3748A
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 20:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C72310E283;
	Fri,  5 Dec 2025 20:04:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D0F10E283;
 Fri,  5 Dec 2025 20:04:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1436833687741962186=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_intel-ci=3A_unify_Xe_and_i9?=
 =?utf-8?q?15_block/test/lists_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 05 Dec 2025 20:04:15 -0000
Message-ID: <176496505509.62145.14120184096171244891@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251204213632.155894-1-kamil.konieczny@linux.intel.com>
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

--===============1436833687741962186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: unify Xe and i915 block/test/lists (rev2)
URL   : https://patchwork.freedesktop.org/series/158391/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8657_BAT -> XEIGTPW_14161_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in XEIGTPW_14161_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8657/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14161/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8657 -> IGTPW_14161

  IGTPW_14161: 8e3bdfe5e4ec0b4cd426c96d703edccfbaa7ccac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8657: 71c70567a9a965cb2942f01832e0b23aca4672f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead: abc20a831a03dc608256340159c23e01ee6b6ead

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14161/index.html

--===============1436833687741962186==
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
<tr><td><b>Series:</b></td><td>intel-ci: unify Xe and i915 block/test/lists (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158391/">https://patchwork.freedesktop.org/series/158391/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14161/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14161/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8657_BAT -&gt; XEIGTPW_14161_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14161_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8657/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14161/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8657 -&gt; IGTPW_14161</li>
</ul>
<p>IGTPW_14161: 8e3bdfe5e4ec0b4cd426c96d703edccfbaa7ccac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8657: 71c70567a9a965cb2942f01832e0b23aca4672f0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4202-abc20a831a03dc608256340159c23e01ee6b6ead: abc20a831a03dc608256340159c23e01ee6b6ead</p>

</body>
</html>

--===============1436833687741962186==--
