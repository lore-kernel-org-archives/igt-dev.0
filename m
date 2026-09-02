Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97ADC61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 23:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD0410E073;
	Wed,  2 Sep 2026 23:47:34 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C9310E073;
 Wed,  2 Sep 2026 23:46:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1422220021242306348=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_lib/amdgpu=3A_fix_platfor?=
 =?utf-8?q?m_range_matching_with_chip=5Fexternal=5Frev?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Sep 2026 23:46:50 -0000
Message-ID: <178839281034.115662.1890150392875852365@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <cover.1788377261.git.vitaly.prosyak@amd.com>
In-Reply-To: <cover.1788377261.git.vitaly.prosyak@amd.com>
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

--===============1422220021242306348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/amdgpu: fix platform range matching with chip_external_rev
URL   : https://patchwork.freedesktop.org/series/173231/
State : success

== Summary ==

CI Bug Log - changes from IGT_9081 -> IGTPW_15779
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15779/index.html

Participating hosts (38 -> 37)
------------------------------

  Missing    (1): bat-dg2-13 


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9081 -> IGTPW_15779

  CI-20190529: 20190529
  CI_DRM_19078: bb742c97086d95b2a04b1b8fbc67822b4cf848c3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15779: c4ae1334e44031666564fa28bddc92c06e9541cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9081: 9081

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15779/index.html

--===============1422220021242306348==
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
<tr><td><b>Series:</b></td><td>lib/amdgpu: fix platform range matching with chip_external_rev</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173231/">https://patchwork.freedesktop.org/series/173231/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15779/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15779/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9081 -&gt; IGTPW_15779</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15779/index.html</p>
<h2>Participating hosts (38 -&gt; 37)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9081 -&gt; IGTPW_15779</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19078: bb742c97086d95b2a04b1b8fbc67822b4cf848c3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15779: c4ae1334e44031666564fa28bddc92c06e9541cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9081: 9081</p>

</body>
</html>

--===============1422220021242306348==--
