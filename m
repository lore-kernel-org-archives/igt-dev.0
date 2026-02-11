Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88034ECD6C7
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD8B10E631;
	Wed, 11 Feb 2026 16:56:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7127010E0B9;
 Wed, 11 Feb 2026 16:56:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1514467055275407318=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/xe=5Feudebug=5Fonline?=
 =?utf-8?q?=3A_Skip_canary_check_in_set-breakpoint-sigint-debugger?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Feb 2026 16:56:46 -0000
Message-ID: <177082900643.246446.17051734458924912515@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211135549.14135-1-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20260211135549.14135-1-dominik.karol.piatkowski@intel.com>
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

--===============1514467055275407318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_eudebug_online: Skip canary check in set-breakpoint-sigint-debugger
URL   : https://patchwork.freedesktop.org/series/161502/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8751_BAT -> XEIGTPW_14541_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14541_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#2229])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14541/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][2] -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14541/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229


Build changes
-------------

  * IGT: IGT_8751 -> IGTPW_14541

  IGTPW_14541: 14541
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 2938ce73d01357a5816ed7dbd041154b58635a37

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14541/index.html

--===============1514467055275407318==
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
<tr><td><b>Series:</b></td><td>tests/xe_eudebug_online: Skip canary check in set-breakpoint-sigint-debugger</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161502/">https://patchwork.freedesktop.org/series/161502/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14541/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14541/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8751_BAT -&gt; XEIGTPW_14541_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14541_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14541/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8751/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14541/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8751 -&gt; IGTPW_14541</li>
</ul>
<p>IGTPW_14541: 14541<br />
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 2938ce73d01357a5816ed7dbd041154b58635a37</p>

</body>
</html>

--===============1514467055275407318==--
