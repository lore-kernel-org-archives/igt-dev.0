Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66751C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 21:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DEF10E7DC;
	Wed, 12 Mar 2025 21:41:06 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB52610E7D5;
 Wed, 12 Mar 2025 21:41:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8942566127226764047=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_tests/kms=5Fplane=5Fmult?=
 =?utf-8?q?iple=3A_Add_dual_display_subtest_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik B S" <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Mar 2025 21:41:04 -0000
Message-ID: <174181566469.26864.13282710248327515340@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312070821.610143-1-karthik.b.s@intel.com>
In-Reply-To: <20250312070821.610143-1-karthik.b.s@intel.com>
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

--===============8942566127226764047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_multiple: Add dual display subtest (rev4)
URL   : https://patchwork.freedesktop.org/series/115855/
State : success

== Summary ==

CI Bug Log - changes from IGT_8272_full -> IGTPW_12755_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12755/index.html

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between IGT_8272_full and IGTPW_12755_full:

### New IGT tests (5) ###

  * igt@kms_plane_multiple@2x-tiling-4:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_multiple@2x-tiling-none:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_multiple@2x-tiling-x:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_multiple@2x-tiling-y:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_plane_multiple@2x-tiling-yf:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8272 -> IGTPW_12755

  CI_DRM_16274: e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12755: bbfe3987af0b4e238983b25c56d459cde9243c78 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8272: 53d92c76fc719a27fedf0a407ca5a185094e702f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12755/index.html

--===============8942566127226764047==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_multiple: Add dual display subtest (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115855/">https://patchwork.freedesktop.org/series/115855/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12755/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12755/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8272_full -&gt; IGTPW_12755_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12755/index.html</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8272_full and IGTPW_12755_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
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
<li>IGT: IGT_8272 -&gt; IGTPW_12755</li>
</ul>
<p>CI_DRM_16274: e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12755: bbfe3987af0b4e238983b25c56d459cde9243c78 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8272: 53d92c76fc719a27fedf0a407ca5a185094e702f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8942566127226764047==--
