Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D0BC36010
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 03:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3002E10E6AD;
	Wed,  2 Apr 2025 03:23:44 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235AF10E1C3;
 Wed,  2 Apr 2025 03:23:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9167412364172814701=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/kms=5Fasync=5Fflips?=
 =?utf-8?q?=3A_Create_subtest_for_overlay_planes_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Apr 2025 03:23:43 -0000
Message-ID: <174356422313.25662.10406019708706424513@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402022922.210495-1-andrealmeid@igalia.com>
In-Reply-To: <20250402022922.210495-1-andrealmeid@igalia.com>
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

--===============9167412364172814701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Create subtest for overlay planes (rev6)
URL   : https://patchwork.freedesktop.org/series/142386/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8297_BAT -> XEIGTPW_12903_BAT
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

  Here are the changes found in XEIGTPW_12903_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4508]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12903/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#4508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4508


Build changes
-------------

  * IGT: IGT_8297 -> IGTPW_12903
  * Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -> xe-2895-0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526

  IGTPW_12903: 04fc41c70388d9b94abe85adeb3b80b8117b9fd4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201
  xe-2895-0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526: 0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12903/index.html

--===============9167412364172814701==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Create subtest for overlay planes (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142386/">https://patchwork.freedesktop.org/series/142386/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12903/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12903/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8297_BAT -&gt; XEIGTPW_12903_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12903_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8297/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12903/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4508">Intel XE#4508</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGTPW_12903</li>
<li>Linux: xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201 -&gt; xe-2895-0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526</li>
</ul>
<p>IGTPW_12903: 04fc41c70388d9b94abe85adeb3b80b8117b9fd4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2888-204a9be8ec9dd0940fbdaf9180336b156148e201: 204a9be8ec9dd0940fbdaf9180336b156148e201<br />
  xe-2895-0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526: 0d2ff6d7ad3b6bf64c5c0e9a921fcfa925029526</p>

</body>
</html>

--===============9167412364172814701==--
