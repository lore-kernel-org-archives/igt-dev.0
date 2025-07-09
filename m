Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A816C83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 16:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC1410E29B;
	Wed,  9 Jul 2025 16:02:13 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FEC10E29B;
 Wed,  9 Jul 2025 16:02:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3226594604482386744=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fcontent=5Fprote?=
 =?utf-8?q?ction=3A_Add_force_HDCP_1=2E4_subtest_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 09 Jul 2025 16:02:11 -0000
Message-ID: <175207693181.148257.7775466816149134491@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250709151930.1034205-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250709151930.1034205-1-santhosh.reddy.guddati@intel.com>
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

--===============3226594604482386744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: Add force HDCP 1.4 subtest (rev4)
URL   : https://patchwork.freedesktop.org/series/148128/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8447_BAT -> XEIGTPW_13440_BAT
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

  Here are the changes found in XEIGTPW_13440_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13440/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8447 -> IGTPW_13440
  * Linux: xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99 -> xe-3383-0cc3f2731cb8e77b27ffb7f361407fd240276ed5

  IGTPW_13440: b3ade10d953bfd9c9bda140ebc2a0a5e9fd100da @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8447: 8447
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abbe423d8c4bcb9d4a99
  xe-3383-0cc3f2731cb8e77b27ffb7f361407fd240276ed5: 0cc3f2731cb8e77b27ffb7f361407fd240276ed5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13440/index.html

--===============3226594604482386744==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: Add force HDCP 1.4 subtest (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148128/">https://patchwork.freedesktop.org/series/148128/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13440/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13440/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8447_BAT -&gt; XEIGTPW_13440_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13440_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8447/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13440/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8447 -&gt; IGTPW_13440</li>
<li>Linux: xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99 -&gt; xe-3383-0cc3f2731cb8e77b27ffb7f361407fd240276ed5</li>
</ul>
<p>IGTPW_13440: b3ade10d953bfd9c9bda140ebc2a0a5e9fd100da @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8447: 8447<br />
  xe-3373-572882b22b077b1ef991abbe423d8c4bcb9d4a99: 572882b22b077b1ef991abbe423d8c4bcb9d4a99<br />
  xe-3383-0cc3f2731cb8e77b27ffb7f361407fd240276ed5: 0cc3f2731cb8e77b27ffb7f361407fd240276ed5</p>

</body>
</html>

--===============3226594604482386744==--
