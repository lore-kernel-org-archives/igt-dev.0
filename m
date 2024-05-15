Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8020C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 14:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D33B10E04B;
	Wed, 15 May 2024 14:58:04 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3032310E04B;
 Wed, 15 May 2024 14:58:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4366133204272494433=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_Add_render-copy_compression_on?=
 =?utf-8?q?_Xe+_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 May 2024 14:58:03 -0000
Message-ID: <171578508319.2118792.14782647426222220332@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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

--===============4366133204272494433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add render-copy compression on Xe+ (rev6)
URL   : https://patchwork.freedesktop.org/series/132902/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7855_BAT -> XEIGTPW_11146_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_7855_BAT and XEIGTPW_11146_BAT:

### New IGT tests (10) ###

  * igt@xe_intel_bb@render@render-linear-1024:
    - Statuses : 4 pass(s)
    - Exec time: [0.04, 0.11] s

  * igt@xe_intel_bb@render@render-linear-512:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_intel_bb@render@render-tile4-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.04, 0.10] s

  * igt@xe_intel_bb@render@render-tile4-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_intel_bb@render@render-tile64-1024:
    - Statuses : 3 pass(s)
    - Exec time: [0.04, 0.10] s

  * igt@xe_intel_bb@render@render-tile64-512:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_intel_bb@render@render-xmajor-1024:
    - Statuses : 4 pass(s)
    - Exec time: [0.04, 0.10] s

  * igt@xe_intel_bb@render@render-xmajor-512:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_intel_bb@render@render-ymajor-1024:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@xe_intel_bb@render@render-ymajor-512:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7855 -> IGTPW_11146

  IGTPW_11146: 11146
  IGT_7855: 7855
  xe-1292-d98c9eae84056cb2d86293c145234017681f09f4: d98c9eae84056cb2d86293c145234017681f09f4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11146/index.html

--===============4366133204272494433==
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
<tr><td><b>Series:</b></td><td>Add render-copy compression on Xe+ (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132902/">https://patchwork.freedesktop.org/series/132902/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11146/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11146/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7855_BAT -&gt; XEIGTPW_11146_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7855_BAT and XEIGTPW_11146_BAT:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@xe_intel_bb@render@render-linear-1024:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.04, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-linear-512:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
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
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.04, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-tile64-512:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-xmajor-1024:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.04, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-xmajor-512:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-ymajor-1024:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-ymajor-512:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7855 -&gt; IGTPW_11146</li>
</ul>
<p>IGTPW_11146: 11146<br />
  IGT_7855: 7855<br />
  xe-1292-d98c9eae84056cb2d86293c145234017681f09f4: d98c9eae84056cb2d86293c145234017681f09f4</p>

</body>
</html>

--===============4366133204272494433==--
