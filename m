Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC5010F92E6
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1181010E201;
	Tue, 31 Mar 2026 17:00:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED0710E201;
 Tue, 31 Mar 2026 17:00:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6616257772149382749=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_tests/intel/kms=5Fpm=5Fbac?=
 =?utf-8?q?klight=3A_Setup_output_before_reading_writing_backlight?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 31 Mar 2026 17:00:40 -0000
Message-ID: <177497644063.415443.9781433552612973129@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331073400.1316874-1-suraj.kandpal@intel.com>
In-Reply-To: <20260331073400.1316874-1-suraj.kandpal@intel.com>
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

--===============6616257772149382749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_pm_backlight: Setup output before reading writing backlight
URL   : https://patchwork.freedesktop.org/series/164138/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8839_FULL -> XEIGTPW_14890_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14890_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#2142]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14890/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_multi_queue@many-queues-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#6874])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14890/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-close-fd.html

  
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874


Build changes
-------------

  * IGT: IGT_8839 -> IGTPW_14890

  IGTPW_14890: 14890
  IGT_8839: 8839
  xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d: e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14890/index.html

--===============6616257772149382749==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_pm_backlight: Setup output before reading writing backlight</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164138/">https://patchwork.freedesktop.org/series/164138/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14890/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14890/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8839_FULL -&gt; XEIGTPW_14890_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14890_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8839/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14890/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14890/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8839 -&gt; IGTPW_14890</li>
</ul>
<p>IGTPW_14890: 14890<br />
  IGT_8839: 8839<br />
  xe-4826-e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d: e15bf8dd9e5cd3aa1352b5b9a16eeffd3b1b193d</p>

</body>
</html>

--===============6616257772149382749==--
