Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9F6C48297
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 00:10:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701D7112FA4;
	Wed,  7 Feb 2024 00:10:48 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C08A112FA4;
 Wed,  7 Feb 2024 00:10:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4104149064740090045=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fvm=3A_Add_bin?=
 =?utf-8?q?d_array_conflict_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Feb 2024 00:10:47 -0000
Message-ID: <170726464711.1057473.17535896290093063598@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206232248.3171773-1-matthew.brost@intel.com>
In-Reply-To: <20240206232248.3171773-1-matthew.brost@intel.com>
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

--===============4104149064740090045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm: Add bind array conflict tests
URL   : https://patchwork.freedesktop.org/series/129606/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7704_BAT -> XEIGTPW_10640_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7704 -> IGTPW_10640
  * Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -> xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9

  IGTPW_10640: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10640/index.html
  IGT_7704: 7704
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f
  xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9: 8a42fafc783505db4f1d6a70005a5f103069c9d9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10640/index.html

--===============4104149064740090045==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm: Add bind array conflict tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129606/">https://patchwork.freedesktop.org/series/129606/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10640/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10640/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7704_BAT -&gt; XEIGTPW_10640_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7704 -&gt; IGTPW_10640</li>
<li>Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -&gt; xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9</li>
</ul>
<p>IGTPW_10640: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10640/index.html<br />
  IGT_7704: 7704<br />
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f<br />
  xe-740-8a42fafc783505db4f1d6a70005a5f103069c9d9: 8a42fafc783505db4f1d6a70005a5f103069c9d9</p>

</body>
</html>

--===============4104149064740090045==--
