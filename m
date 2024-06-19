Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89115C27C79
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 07:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BF010EA73;
	Wed, 19 Jun 2024 07:16:00 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A661810EA73;
 Wed, 19 Jun 2024 07:15:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4329491964378575851=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_series_starting_with_=5Bi-g-t?=
 =?utf-8?q?=2C1/2=5D_tests/kms=5F3d=3A_=221080p-left=2Epng=22=3A_No_such_fil?=
 =?utf-8?q?e_or_directory_fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 19 Jun 2024 07:15:58 -0000
Message-ID: <171878135867.106475.12236855985016531093@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20240618121638.231181-1-ramanaidu.naladala@intel.com>
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

--===============4329491964378575851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_3d: "1080p-left.png": No such file or directory fix (rev2)
URL   : https://patchwork.freedesktop.org/series/135011/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7891_BAT -> XEIGTPW_11279_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11279_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_3d:
    - bat-pvc-2:          NOTRUN -> [SKIP][1] ([Intel XE#540])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11279/bat-pvc-2/igt@kms_3d.html
    - bat-atsm-2:         NOTRUN -> [SKIP][2] ([Intel XE#540])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11279/bat-atsm-2/igt@kms_3d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540


Build changes
-------------

  * IGT: IGT_7891 -> IGTPW_11279
  * Linux: xe-1490-5a093f17293ae50283f19372263a7595ed50bc34 -> xe-1494-fcea62a0d6954dcce241d22785597ba416a18076

  IGTPW_11279: 11279
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34
  xe-1494-fcea62a0d6954dcce241d22785597ba416a18076: fcea62a0d6954dcce241d22785597ba416a18076

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11279/index.html

--===============4329491964378575851==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_3d: &quot;1080p-left.png&quot;: No such file or directory fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135011/">https://patchwork.freedesktop.org/series/135011/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11279/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11279/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7891_BAT -&gt; XEIGTPW_11279_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11279_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_3d:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11279/bat-pvc-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11279/bat-atsm-2/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7891 -&gt; IGTPW_11279</li>
<li>Linux: xe-1490-5a093f17293ae50283f19372263a7595ed50bc34 -&gt; xe-1494-fcea62a0d6954dcce241d22785597ba416a18076</li>
</ul>
<p>IGTPW_11279: 11279<br />
  IGT_7891: 732f3aaf49c9cc62ff3518a56ece1a825c08d22e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1490-5a093f17293ae50283f19372263a7595ed50bc34: 5a093f17293ae50283f19372263a7595ed50bc34<br />
  xe-1494-fcea62a0d6954dcce241d22785597ba416a18076: fcea62a0d6954dcce241d22785597ba416a18076</p>

</body>
</html>

--===============4329491964378575851==--
