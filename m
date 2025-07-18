Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E699AC83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 06:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8637410E8D9;
	Fri, 18 Jul 2025 06:46:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2854110E09F;
 Fri, 18 Jul 2025 06:46:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1657665718441376806=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Multi-Tile_Handling_in_IGT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nishit.sharma@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Jul 2025 06:46:56 -0000
Message-ID: <175282121615.171567.9540601134148323873@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250718054908.1502234-1-nishit.sharma@intel.com>
In-Reply-To: <20250718054908.1502234-1-nishit.sharma@intel.com>
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

--===============1657665718441376806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Multi-Tile Handling in IGT
URL   : https://patchwork.freedesktop.org/series/151788/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8466_BAT -> XEIGTPW_13494_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_13494_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8466/bat-adlp-7/igt@kms_flip@basic-plain-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13494/bat-adlp-7/igt@kms_flip@basic-plain-flip.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8466 -> IGTPW_13494
  * Linux: xe-3433-9154c77d94b3d6738d6db7299ed0aafc36ea75f3 -> xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e

  IGTPW_13494: 80de85ebc069c7cdd8d83e6d4775c098d82bb439 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3433-9154c77d94b3d6738d6db7299ed0aafc36ea75f3: 9154c77d94b3d6738d6db7299ed0aafc36ea75f3
  xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e: f680f6d0a532122a3b57909c69613bce1c2f1b2e

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13494/index.html

--===============1657665718441376806==
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
<tr><td><b>Series:</b></td><td>Multi-Tile Handling in IGT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151788/">https://patchwork.freedesktop.org/series/151788/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13494/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13494/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8466_BAT -&gt; XEIGTPW_13494_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13494_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8466/bat-adlp-7/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13494/bat-adlp-7/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8466 -&gt; IGTPW_13494</li>
<li>Linux: xe-3433-9154c77d94b3d6738d6db7299ed0aafc36ea75f3 -&gt; xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e</li>
</ul>
<p>IGTPW_13494: 80de85ebc069c7cdd8d83e6d4775c098d82bb439 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8466: 8d119c2b43d4d3660bef3bd68864be94a60bc0c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3433-9154c77d94b3d6738d6db7299ed0aafc36ea75f3: 9154c77d94b3d6738d6db7299ed0aafc36ea75f3<br />
  xe-3436-f680f6d0a532122a3b57909c69613bce1c2f1b2e: f680f6d0a532122a3b57909c69613bce1c2f1b2e</p>

</body>
</html>

--===============1657665718441376806==--
