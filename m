Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF07CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 09:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF60110EB23;
	Thu, 26 Sep 2024 09:09:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47C10EB23;
 Thu, 26 Sep 2024 09:09:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6247978075475229880=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EIGT=3A_success_for_add_test_to_validate_fallba?=
 =?utf-8?q?ck_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 09:09:14 -0000
Message-ID: <172734175462.1105509.16292730639399850397@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925182944.1603015-1-kunal1.joshi@intel.com>
In-Reply-To: <20240925182944.1603015-1-kunal1.joshi@intel.com>
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

--===============6247978075475229880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add test to validate fallback (rev7)
URL   : https://patchwork.freedesktop.org/series/134660/
State : success

== Summary ==

CI Bug Log - changes from IGT_8032_full -> IGTPW_11803_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html

Participating hosts (7 -> 7)
------------------------------

  Additional (3): shard-snb-0 shard-dg2-set2 shard-glk-0 
  Missing    (3): shard-snb shard-dg2 shard-glk 

New tests
---------

  New tests have been introduced between IGT_8032_full and IGTPW_11803_full:

### New IGT tests (1) ###

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - Statuses :
    - Exec time: [None] s

  


Changes
-------

  No changes found


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8032 -> IGTPW_11803
  * Linux: CI_DRM_15443 -> CI_DRM_15445

  CI-20190529: 20190529
  CI_DRM_15443: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_15445: 0c981c182e22df4e1a25cd80f756b5824586e51e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11803: 057161721ad58a48403cbf5ea5c9ec5e894aba5f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html

--===============6247978075475229880==
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
<tr><td><b>Series:</b></td><td>add test to validate fallback (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134660/">https://patchwork.freedesktop.org/series/134660/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8032_full -&gt; IGTPW_11803_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11803/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>Additional (3): shard-snb-0 shard-dg2-set2 shard-glk-0 <br />
  Missing    (3): shard-snb shard-dg2 shard-glk </p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8032_full and IGTPW_11803_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dp_linktrain_fallback@dp-fallback:<ul>
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
<li>IGT: IGT_8032 -&gt; IGTPW_11803</li>
<li>Linux: CI_DRM_15443 -&gt; CI_DRM_15445</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_15443: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_15445: 0c981c182e22df4e1a25cd80f756b5824586e51e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11803: 057161721ad58a48403cbf5ea5c9ec5e894aba5f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032</p>

</body>
</html>

--===============6247978075475229880==--
