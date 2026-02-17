Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3EFE9A03E
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 20:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E1C10E517;
	Tue, 17 Feb 2026 20:13:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FFB10E4E6;
 Tue, 17 Feb 2026 20:13:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4905261028728606202=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fexplict=5Ffence?=
 =?utf-8?q?=3A_Add_Test_for_Explicit_Fencing_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Feb 2026 20:13:01 -0000
Message-ID: <177135918105.260816.13154339849649097555@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217075953.3220732-1-s.sebinraj@intel.com>
In-Reply-To: <20260217075953.3220732-1-s.sebinraj@intel.com>
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

--===============4905261028728606202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_explict_fence: Add Test for Explicit Fencing (rev4)
URL   : https://patchwork.freedesktop.org/series/160078/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8757_BAT -> XEIGTPW_14563_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8757 -> IGTPW_14563

  IGTPW_14563: 286b4d6978950320ba9842032be5bb8133911064 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8757: 8757
  xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab: e66c64e4f12e55cad35c680f1e328a7c7ee92cab

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14563/index.html

--===============4905261028728606202==
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
<tr><td><b>Series:</b></td><td>tests/kms_explict_fence: Add Test for Explicit Fencing (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160078/">https://patchwork.freedesktop.org/series/160078/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14563/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14563/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8757_BAT -&gt; XEIGTPW_14563_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8757 -&gt; IGTPW_14563</li>
</ul>
<p>IGTPW_14563: 286b4d6978950320ba9842032be5bb8133911064 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8757: 8757<br />
  xe-4569-e66c64e4f12e55cad35c680f1e328a7c7ee92cab: e66c64e4f12e55cad35c680f1e328a7c7ee92cab</p>

</body>
</html>

--===============4905261028728606202==--
