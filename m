Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A78C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 14:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6471D10E7B1;
	Wed,  7 Feb 2024 14:03:36 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E46410E7B1;
 Wed,  7 Feb 2024 14:03:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4376465301338290698=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel-ci=3A_Add_xe=5Fvm_?=
 =?utf-8?q?large_subtest_to_BAT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 07 Feb 2024 14:03:35 -0000
Message-ID: <170731461551.1072289.2675186025421629284@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240207104733.16012-1-himanshu.girotra@intel.com>
In-Reply-To: <20240207104733.16012-1-himanshu.girotra@intel.com>
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

--===============4376465301338290698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: Add xe_vm large subtest to BAT
URL   : https://patchwork.freedesktop.org/series/129623/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7704_BAT -> XEIGTPW_10642_BAT
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

  * IGT: IGT_7704 -> IGTPW_10642
  * Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -> xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222

  IGTPW_10642: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10642/index.html
  IGT_7704: 7704
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f
  xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222: e33f766ecfa1aee40eec83b3a146eb84a5e23222

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10642/index.html

--===============4376465301338290698==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: Add xe_vm large subtest to BAT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129623/">https://patchwork.freedesktop.org/series/129623/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10642/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10642/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7704_BAT -&gt; XEIGTPW_10642_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7704 -&gt; IGTPW_10642</li>
<li>Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -&gt; xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222</li>
</ul>
<p>IGTPW_10642: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10642/index.html<br />
  IGT_7704: 7704<br />
  xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f<br />
  xe-744-e33f766ecfa1aee40eec83b3a146eb84a5e23222: e33f766ecfa1aee40eec83b3a146eb84a5e23222</p>

</body>
</html>

--===============4376465301338290698==--
