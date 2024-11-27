Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73131D6D239
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 20:33:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4A910E1A1;
	Wed, 27 Nov 2024 20:33:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09C110E084;
 Wed, 27 Nov 2024 20:33:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6782747300036571100=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Subject=3A_=5BPATCH_i-g-t_0?=
 =?utf-8?q?/4=5D_lib/xe=3A_Add_SR-IOV_debugfs_and_provisioning_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 27 Nov 2024 20:33:40 -0000
Message-ID: <173273962071.3856982.10322226595995187140@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
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

--===============6782747300036571100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Subject: [PATCH i-g-t 0/4] lib/xe: Add SR-IOV debugfs and provisioning helpers
URL   : https://patchwork.freedesktop.org/series/141852/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8127_BAT -> XEIGTPW_12210_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8127 -> IGTPW_12210
  * Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -> xe-2286-24e36a5200d65a337d37827d4abcae11c9693f6f

  IGTPW_12210: 12210
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198
  xe-2286-24e36a5200d65a337d37827d4abcae11c9693f6f: 24e36a5200d65a337d37827d4abcae11c9693f6f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12210/index.html

--===============6782747300036571100==
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
<tr><td><b>Series:</b></td><td>Subject: [PATCH i-g-t 0/4] lib/xe: Add SR-IOV debugfs and provisioning helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141852/">https://patchwork.freedesktop.org/series/141852/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12210/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12210/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8127_BAT -&gt; XEIGTPW_12210_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8127 -&gt; IGTPW_12210</li>
<li>Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -&gt; xe-2286-24e36a5200d65a337d37827d4abcae11c9693f6f</li>
</ul>
<p>IGTPW_12210: 12210<br />
  IGT_8127: 433ecaf95ccaed2b5adcb40d27fa5b7a08a2e03d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198<br />
  xe-2286-24e36a5200d65a337d37827d4abcae11c9693f6f: 24e36a5200d65a337d37827d4abcae11c9693f6f</p>

</body>
</html>

--===============6782747300036571100==--
