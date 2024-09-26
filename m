Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED31CCFA13
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 07:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1327B10EAE4;
	Thu, 26 Sep 2024 07:49:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DF610EAE4;
 Thu, 26 Sep 2024 07:49:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6532510165314019917=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EIGT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv3=2C1/2=5D_tests/kms=5Fasync=5Fflips=3A_subtests_to_validat?=
 =?utf-8?q?e_async_flips_on_atomic_path_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Santhosh Reddy Guddati" <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 07:49:29 -0000
Message-ID: <172733696973.1104749.6044979416653480926@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
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

--===============6532510165314019917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/2] tests/kms_async_flips: subtests to validate async flips on atomic path (rev3)
URL   : https://patchwork.freedesktop.org/series/137825/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15443_full -> IGTPW_11782_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11782/index.html

Participating hosts (9 -> 7)
------------------------------

  Additional (1): shard-snb-0 
  Missing    (3): shard-snb shard-dg2 shard-glk 

New tests
---------

  New tests have been introduced between CI_DRM_15443_full and IGTPW_11782_full:

### New IGT tests (6) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_async_flips@crc-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_async_flips@test-cursor-atomic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_async_flips@test-time-stamp-atomic:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8031 -> IGTPW_11782
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15443: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11782: fe414fe2777ee782742be45e1f1cf818e8778ee2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11782/index.html

--===============6532510165314019917==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/2] tests/kms_async_flips: subtests to validate async flips on atomic path (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137825/">https://patchwork.freedesktop.org/series/137825/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11782/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11782/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15443_full -&gt; IGTPW_11782_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11782/index.html</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Additional (1): shard-snb-0 <br />
  Missing    (3): shard-snb shard-dg2 shard-glk </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15443_full and IGTPW_11782_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8031 -&gt; IGTPW_11782</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15443: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11782: fe414fe2777ee782742be45e1f1cf818e8778ee2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6532510165314019917==--
