Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C90A10BA420
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 03:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BB388130;
	Fri, 27 Mar 2026 03:45:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732E10EC6D;
 Fri, 27 Mar 2026 03:45:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7345204181046750477=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_updates_to_fbc_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 27 Mar 2026 03:45:17 -0000
Message-ID: <177458311707.404841.1703867482997033234@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260326072555.160329-1-vinod.govindapillai@intel.com>
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

--===============7345204181046750477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: updates to fbc tests
URL   : https://patchwork.freedesktop.org/series/163896/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8834_FULL -> XEIGTPW_14862_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8834_FULL and XEIGTPW_14862_FULL:

### New IGT tests (3) ###

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14862_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14862/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
#### Possible fixes ####

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [FAIL][3] ([Intel XE#7340] / [Intel XE#7504]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14862/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504


Build changes
-------------

  * IGT: IGT_8834 -> IGTPW_14862

  IGTPW_14862: 14862
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14862/index.html

--===============7345204181046750477==
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
<tr><td><b>Series:</b></td><td>updates to fbc tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163896/">https://patchwork.freedesktop.org/series/163896/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14862/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14862/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8834_FULL -&gt; XEIGTPW_14862_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8834_FULL and XEIGTPW_14862_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14862_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14862/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_dc@dc5-dpms:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8834/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504">Intel XE#7504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14862/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8834 -&gt; IGTPW_14862</li>
</ul>
<p>IGTPW_14862: 14862<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf</p>

</body>
</html>

--===============7345204181046750477==--
