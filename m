Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAB9C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 10:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465BE10E0A3;
	Wed, 12 Mar 2025 10:36:12 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006C710E0A3;
 Wed, 12 Mar 2025 10:36:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5461751497561207437=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fcompute=3A_Alig?=
 =?utf-8?q?n_objects_on_64K_for_xelpg_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 12 Mar 2025 10:36:10 -0000
Message-ID: <174177577099.24497.3227393528439534154@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307103951.16567-1-francois.dugast@intel.com>
In-Reply-To: <20250307103951.16567-1-francois.dugast@intel.com>
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

--===============5461751497561207437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_compute: Align objects on 64K for xelpg (rev4)
URL   : https://patchwork.freedesktop.org/series/145985/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8271_BAT -> XEIGTPW_12754_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8271 -> IGTPW_12754
  * Linux: xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5 -> xe-2799-f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3

  IGTPW_12754: e110a9b4db666003d3d0cc3f9c98aff9418bc9e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8271: 8271
  xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5: eb17816e52395a403aa0b447aa0befa9d2f86dd5
  xe-2799-f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3: f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12754/index.html

--===============5461751497561207437==
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
<tr><td><b>Series:</b></td><td>lib/intel_compute: Align objects on 64K for xelpg (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145985/">https://patchwork.freedesktop.org/series/145985/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12754/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12754/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8271_BAT -&gt; XEIGTPW_12754_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8271 -&gt; IGTPW_12754</li>
<li>Linux: xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5 -&gt; xe-2799-f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3</li>
</ul>
<p>IGTPW_12754: e110a9b4db666003d3d0cc3f9c98aff9418bc9e1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8271: 8271<br />
  xe-2797-eb17816e52395a403aa0b447aa0befa9d2f86dd5: eb17816e52395a403aa0b447aa0befa9d2f86dd5<br />
  xe-2799-f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3: f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3</p>

</body>
</html>

--===============5461751497561207437==--
