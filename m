Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F03C28B2F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 03:22:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4745C10E7EA;
	Thu, 13 Mar 2025 03:22:31 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130C810E7E9;
 Thu, 13 Mar 2025 03:22:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2263649606372996627=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fsync=5Ffil?=
 =?utf-8?q?e=3A_Exercise_sync_file_access_post_queue_destruction_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 13 Mar 2025 03:22:30 -0000
Message-ID: <174183615005.27441.4813286432357181452@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312124245.83254-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250312124245.83254-1-tvrtko.ursulin@igalia.com>
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

--===============2263649606372996627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sync_file: Exercise sync file access post queue destruction (rev2)
URL   : https://patchwork.freedesktop.org/series/146211/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8273_BAT -> XEIGTPW_12760_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12760_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8273/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12760/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8273 -> IGTPW_12760
  * Linux: xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e -> xe-2807-1476c293076865d6630fe197cb211ea76b40ceb2

  IGTPW_12760: 12760
  IGT_8273: 5d806121f1cfb38fe7cc4d528d81feb1c11274b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e: e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e
  xe-2807-1476c293076865d6630fe197cb211ea76b40ceb2: 1476c293076865d6630fe197cb211ea76b40ceb2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12760/index.html

--===============2263649606372996627==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sync_file: Exercise sync file access post queue destruction (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146211/">https://patchwork.freedesktop.org/series/146211/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12760/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12760/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8273_BAT -&gt; XEIGTPW_12760_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12760_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8273/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12760/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8273 -&gt; IGTPW_12760</li>
<li>Linux: xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e -&gt; xe-2807-1476c293076865d6630fe197cb211ea76b40ceb2</li>
</ul>
<p>IGTPW_12760: 12760<br />
  IGT_8273: 5d806121f1cfb38fe7cc4d528d81feb1c11274b1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e: e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e<br />
  xe-2807-1476c293076865d6630fe197cb211ea76b40ceb2: 1476c293076865d6630fe197cb211ea76b40ceb2</p>

</body>
</html>

--===============2263649606372996627==--
