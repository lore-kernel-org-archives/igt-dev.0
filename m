Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F421FD8763
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 12:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCB610E1F1;
	Tue, 17 Mar 2026 12:44:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235C510E1F1;
 Tue, 17 Mar 2026 12:44:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4899451619000834611=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_add_intel_related_yuv_restr?=
 =?utf-8?q?ictions_to_kms=5Fchamelium=5Fframes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 17 Mar 2026 12:44:12 -0000
Message-ID: <177375145212.365545.1799989072292270081@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316161101.2808556-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260316161101.2808556-1-juhapekka.heikkila@gmail.com>
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

--===============4899451619000834611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add intel related yuv restrictions to kms_chamelium_frames
URL   : https://patchwork.freedesktop.org/series/163296/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8806_BAT -> XEIGTPW_14782_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14782_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6519])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8806/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14782/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * IGT: IGT_8806 -> IGTPW_14782
  * Linux: xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820 -> xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0

  IGTPW_14782: 317a4f536948e46ff42bfb07646c6e60821f64c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8806: 8806
  xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820: a25d8c583e1e52bde77d371081a7c3fcd0a2e820
  xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0: b65472ae36d2a21ac0a1991618db1e9b09b1dcd0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14782/index.html

--===============4899451619000834611==
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
<tr><td><b>Series:</b></td><td>add intel related yuv restrictions to kms_chamelium_frames</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163296/">https://patchwork.freedesktop.org/series/163296/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14782/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14782/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8806_BAT -&gt; XEIGTPW_14782_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14782_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8806/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14782/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8806 -&gt; IGTPW_14782</li>
<li>Linux: xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820 -&gt; xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0</li>
</ul>
<p>IGTPW_14782: 317a4f536948e46ff42bfb07646c6e60821f64c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8806: 8806<br />
  xe-4731-a25d8c583e1e52bde77d371081a7c3fcd0a2e820: a25d8c583e1e52bde77d371081a7c3fcd0a2e820<br />
  xe-4734-b65472ae36d2a21ac0a1991618db1e9b09b1dcd0: b65472ae36d2a21ac0a1991618db1e9b09b1dcd0</p>

</body>
</html>

--===============4899451619000834611==--
