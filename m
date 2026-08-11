Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9660C5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 20:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E5A10E385;
	Tue, 11 Aug 2026 20:32:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8E710E385;
 Tue, 11 Aug 2026 20:31:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4075738328756203383=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_tests/kms=5Fplane=3A_Remo?=
 =?utf-8?q?ve_redundant_CRC_frame_sequence_check?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 11 Aug 2026 20:31:25 -0000
Message-ID: <178648028505.41349.16330022347220264146@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260811161417.716771-1-jason-jh.lin@mediatek.com>
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

--===============4075738328756203383==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Remove redundant CRC frame sequence check
URL   : https://patchwork.freedesktop.org/series/172015/
State : success

== Summary ==

CI Bug Log - changes from IGT_9052 -> IGTPW_15659
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15659/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-dg2-13 fi-snb-2520m 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9052 -> IGTPW_15659

  CI-20190529: 20190529
  CI_DRM_18980: aabf41c0ea0ad661a2e384e51955b24343f6ca25 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15659: 8ae4ee54c55da4726d69fa81f836d76e3b599579 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9052: 9052

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15659/index.html

--===============4075738328756203383==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Remove redundant CRC frame sequence check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172015/">https://patchwork.freedesktop.org/series/172015/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15659/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15659/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9052 -&gt; IGTPW_15659</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15659/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-dg2-13 fi-snb-2520m </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9052 -&gt; IGTPW_15659</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18980: aabf41c0ea0ad661a2e384e51955b24343f6ca25 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15659: 8ae4ee54c55da4726d69fa81f836d76e3b599579 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9052: 9052</p>

</body>
</html>

--===============4075738328756203383==--
