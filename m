Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7DACCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 09:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D70E10EB8A;
	Thu, 26 Sep 2024 09:53:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CE410EB8A;
 Thu, 26 Sep 2024 09:53:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1357481691427745254=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EIGT=3A_success_for_Added_IGT_support_to_valida?=
 =?utf-8?q?te_global_histogram_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 09:53:41 -0000
Message-ID: <172734442107.1106197.18181554726160329459@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240705091333.328322-1-mohammed.thasleem@intel.com>
In-Reply-To: <20240705091333.328322-1-mohammed.thasleem@intel.com>
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

--===============1357481691427745254==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added IGT support to validate global histogram (rev2)
URL   : https://patchwork.freedesktop.org/series/135789/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_15444_full -> IGTPW_11795_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11795/index.html

Participating hosts (8 -> 7)
------------------------------

  Additional (2): shard-snb-0 shard-dg2-set2 
  Missing    (3): shard-snb shard-dg2 shard-glk 

New tests
---------

  New tests have been introduced between CI_DRM_15444_full and IGTPW_11795_full:

### New IGT tests (4) ###

  * igt@kms_histogram@global-histogram-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_histogram@global-histogram-color:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_histogram@histogram-algo-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_histogram@histogram-algo-color:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8032 -> IGTPW_11795
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_15444: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11795: 8bc763646a9e2f426a9a15d4ed0df4df0c1136d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11795/index.html

--===============1357481691427745254==
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
<tr><td><b>Series:</b></td><td>Added IGT support to validate global histogram (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135789/">https://patchwork.freedesktop.org/series/135789/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11795/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11795/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15444_full -&gt; IGTPW_11795_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11795/index.html</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Additional (2): shard-snb-0 shard-dg2-set2 <br />
  Missing    (3): shard-snb shard-dg2 shard-glk </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15444_full and IGTPW_11795_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_histogram@global-histogram-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-histogram-color:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@histogram-algo-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@histogram-algo-color:</p>
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
<li>IGT: IGT_8032 -&gt; IGTPW_11795</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15444: 88d592f72f7bc508d6a027b1f96aa2e53f803e1b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11795: 8bc763646a9e2f426a9a15d4ed0df4df0c1136d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1357481691427745254==--
