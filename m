Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4E1C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 17:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A0910E8F1;
	Thu,  1 Aug 2024 17:28:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38A510E0A7;
 Thu,  1 Aug 2024 17:28:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1986712090155404752=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fsysfs=5Fpreem?=
 =?utf-8?q?pt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 01 Aug 2024 17:28:42 -0000
Message-ID: <172253332272.488729.363684874818487749@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240801150737.3700254-1-nakshtra.goyal@intel.com>
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

--===============1986712090155404752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev5)
URL   : https://patchwork.freedesktop.org/series/136449/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7951_BAT -> XEIGTPW_11518_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (6 -> 6)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_7951_BAT and XEIGTPW_11518_BAT:

### New IGT tests (6) ###

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - Statuses : 3 pass(s)
    - Exec time: [10.56, 14.79] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:
    - Statuses : 3 pass(s)
    - Exec time: [2.68, 3.22] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@ccs:
    - Statuses : 2 pass(s)
    - Exec time: [3.23] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:
    - Statuses : 3 pass(s)
    - Exec time: [1.99, 3.22] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vcs:
    - Statuses : 3 pass(s)
    - Exec time: [2.04, 2.63] s

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:
    - Statuses : 3 pass(s)
    - Exec time: [2.04, 2.68] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7951 -> IGTPW_11518

  IGTPW_11518: 11518
  IGT_7951: 7951
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/index.html

--===============1986712090155404752==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136449/">https://patchwork.freedesktop.org/series/136449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11518/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7951_BAT -&gt; XEIGTPW_11518_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (6 -&gt; 6)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_7951_BAT and XEIGTPW_11518_BAT:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [10.56, 14.79] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@bcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.68, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@rcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.99, 3.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.04, 2.63] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout@vecs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.04, 2.68] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7951 -&gt; IGTPW_11518</li>
</ul>
<p>IGTPW_11518: 11518<br />
  IGT_7951: 7951<br />
  xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a</p>

</body>
</html>

--===============1986712090155404752==--
