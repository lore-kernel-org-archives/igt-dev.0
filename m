Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648FCC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 17:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90FA10EDCD;
	Wed,  8 May 2024 17:41:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EF910EC46;
 Wed,  8 May 2024 17:41:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3244218300770368738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_render-copy_compression_on?=
 =?utf-8?q?_Xe+_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 08 May 2024 17:41:29 -0000
Message-ID: <171519008940.2019525.7748128867420175109@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
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

--===============3244218300770368738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add render-copy compression on Xe+ (rev4)
URL   : https://patchwork.freedesktop.org/series/132902/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7843_BAT -> XEIGTPW_11113_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_7843_BAT and XEIGTPW_11113_BAT:

### New IGT tests (8) ###

  * igt@xe_intel_bb@render@render-linear-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.04, 0.08] s

  * igt@xe_intel_bb@render@render-linear-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_intel_bb@render@render-tile4-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.04, 0.10] s

  * igt@xe_intel_bb@render@render-tile4-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_intel_bb@render@render-tile64-1024:
    - Statuses : 2 pass(s)
    - Exec time: [0.06, 0.10] s

  * igt@xe_intel_bb@render@render-tile64-512:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_intel_bb@render@render-xmajor-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.05, 0.10] s

  * igt@xe_intel_bb@render@render-xmajor-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7843 -> IGTPW_11113

  IGTPW_11113: 11113
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11113/index.html

--===============3244218300770368738==
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
<tr><td><b>Series:</b></td><td>Add render-copy compression on Xe+ (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132902/">https://patchwork.freedesktop.org/series/132902/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11113/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11113/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7843_BAT -&gt; XEIGTPW_11113_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7843_BAT and XEIGTPW_11113_BAT:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-linear-1024:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.04, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-linear-512:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-tile4-1024:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.04, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-tile4-512:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-tile64-1024:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.06, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-tile64-512:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-xmajor-1024:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-xmajor-512:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7843 -&gt; IGTPW_11113</li>
</ul>
<p>IGTPW_11113: 11113<br />
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84</p>

</body>
</html>

--===============3244218300770368738==--
