Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31943F589AD
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 12:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB70110F0E2;
	Thu, 23 Apr 2026 12:18:05 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5B010F0DB;
 Thu, 23 Apr 2026 12:17:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0935777442982617922=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_attachments_support_=28?=
 =?utf-8?q?rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 23 Apr 2026 12:17:52 -0000
Message-ID: <177694667263.2765.4907593851258376659@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260423105514.175870-6-zbigniew.kempczynski@intel.com>
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

--===============0935777442982617922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add attachments support (rev2)
URL   : https://patchwork.freedesktop.org/series/165230/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8870_BAT -> XEIGTPW_15047_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15047_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15047_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15047_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0:
    - bat-lnl-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/bat-lnl-2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/bat-lnl-2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0.html

  


Build changes
-------------

  * IGT: IGT_8870 -> IGTPW_15047
  * Linux: xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd -> xe-4928-95fbbe4877e1543975d0d0f18a7cc0074416be41

  IGTPW_15047: 33cac6725cd1f70c29748a01204892eae24b4e53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8870: 1aba4b364b6dbdf7926cc78501e7281d5176b029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd: 489e26ada57ce96a2ee3e5853cfe74981ef85bbd
  xe-4928-95fbbe4877e1543975d0d0f18a7cc0074416be41: 95fbbe4877e1543975d0d0f18a7cc0074416be41

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/index.html

--===============0935777442982617922==
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
<tr><td><b>Series:</b></td><td>Add attachments support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165230/">https://patchwork.freedesktop.org/series/165230/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8870_BAT -&gt; XEIGTPW_15047_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15047_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15047_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15047_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8870/bat-lnl-2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15047/bat-lnl-2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind@ccs0.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8870 -&gt; IGTPW_15047</li>
<li>Linux: xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd -&gt; xe-4928-95fbbe4877e1543975d0d0f18a7cc0074416be41</li>
</ul>
<p>IGTPW_15047: 33cac6725cd1f70c29748a01204892eae24b4e53 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8870: 1aba4b364b6dbdf7926cc78501e7281d5176b029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4926-489e26ada57ce96a2ee3e5853cfe74981ef85bbd: 489e26ada57ce96a2ee3e5853cfe74981ef85bbd<br />
  xe-4928-95fbbe4877e1543975d0d0f18a7cc0074416be41: 95fbbe4877e1543975d0d0f18a7cc0074416be41</p>

</body>
</html>

--===============0935777442982617922==--
