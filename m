Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4BBC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 06:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112810E755;
	Wed, 23 Jul 2025 06:29:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963A810E76B;
 Wed, 23 Jul 2025 06:29:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4261508943497546403=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv3=2C1/5=5D_tests/kms=5Fasync=5Fflips=3A_Fix_suspend-resume_?=
 =?utf-8?q?subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 23 Jul 2025 06:29:57 -0000
Message-ID: <175325219760.182391.17571073442959574774@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
In-Reply-To: <20250723055353.1137242-1-karthik.b.s@intel.com>
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

--===============4261508943497546403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/5] tests/kms_async_flips: Fix suspend-resume subtest
URL   : https://patchwork.freedesktop.org/series/151976/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8473_BAT -> XEIGTPW_13511_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13511_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8473/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13511/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8473 -> IGTPW_13511
  * Linux: xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3 -> xe-3459-3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a

  IGTPW_13511: 13511
  IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3: 1bb52fd2f94e5c605adf88a086ab0eadcdd708e3
  xe-3459-3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a: 3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13511/index.html

--===============4261508943497546403==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/5] tests/kms_async_flips: Fix suspend-resume subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151976/">https://patchwork.freedesktop.org/series/151976/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13511/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13511/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8473_BAT -&gt; XEIGTPW_13511_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13511_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8473/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13511/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8473 -&gt; IGTPW_13511</li>
<li>Linux: xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3 -&gt; xe-3459-3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a</li>
</ul>
<p>IGTPW_13511: 13511<br />
  IGT_8473: b8b6f7615f840e15377c3b48a9c4178b3a248fb0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3458-1bb52fd2f94e5c605adf88a086ab0eadcdd708e3: 1bb52fd2f94e5c605adf88a086ab0eadcdd708e3<br />
  xe-3459-3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a: 3af657bd50a6cefddf6b0edb2c1d8ce747dfdd8a</p>

</body>
</html>

--===============4261508943497546403==--
