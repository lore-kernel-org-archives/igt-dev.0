Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9E2C3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 15:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A24810E64D;
	Wed, 31 Jul 2024 15:05:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F1810E64D;
 Wed, 31 Jul 2024 15:05:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0981561171516662238=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fsysfs=5Fpreem?=
 =?utf-8?q?pt=5Ftimeout=3A_Porting_sysfs_preempt_test_in_xe_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: nakshtra.goyal@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 31 Jul 2024 15:05:34 -0000
Message-ID: <172243833406.468327.13882163739866842935@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240731143029.3661149-1-nakshtra.goyal@intel.com>
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

--===============0981561171516662238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev4)
URL   : https://patchwork.freedesktop.org/series/136449/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7946_BAT -> XEIGTPW_11507_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11507_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#2262])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7946/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11507/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html

  
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262


Build changes
-------------

  * IGT: IGT_7946 -> IGTPW_11507

  IGTPW_11507: 11507
  IGT_7946: 7946
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11507/index.html

--===============0981561171516662238==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_sysfs_preempt_timeout: Porting sysfs preempt test in xe (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136449/">https://patchwork.freedesktop.org/series/136449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11507/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11507/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7946_BAT -&gt; XEIGTPW_11507_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11507_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_gt_freq@freq_fixed_idle:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7946/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11507/bat-adlp-7/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7946 -&gt; IGTPW_11507</li>
</ul>
<p>IGTPW_11507: 11507<br />
  IGT_7946: 7946<br />
  xe-1696-2a74e6714291a2c9cf26c08f729d5feb203e8338: 2a74e6714291a2c9cf26c08f729d5feb203e8338</p>

</body>
</html>

--===============0981561171516662238==--
