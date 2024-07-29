Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8105AC3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 19:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E4610E471;
	Mon, 29 Jul 2024 19:40:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B4C10E471;
 Mon, 29 Jul 2024 19:40:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7760968728943594454=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_benchmarks/gem=5Fwsim=3A_Exten?=
 =?utf-8?q?d_engine_selection_syntax_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 29 Jul 2024 19:40:37 -0000
Message-ID: <172228203762.425932.8809308438082742086@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
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

--===============7760968728943594454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: benchmarks/gem_wsim: Extend engine selection syntax (rev3)
URL   : https://patchwork.freedesktop.org/series/128780/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7942_BAT -> XEIGTPW_11487_BAT
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

  Here are the changes found in XEIGTPW_11487_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_intel_bb@blit-simple:
    - {bat-lnl-2}:        [DMESG-WARN][1] ([Intel XE#1705]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/bat-lnl-2/igt@xe_intel_bb@blit-simple.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705


Build changes
-------------

  * IGT: IGT_7942 -> IGTPW_11487
  * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1685-e64cee35967e4b08dd7f3b3ad6f110927c4699a9

  IGTPW_11487: 11487
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
  xe-1685-e64cee35967e4b08dd7f3b3ad6f110927c4699a9: e64cee35967e4b08dd7f3b3ad6f110927c4699a9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/index.html

--===============7760968728943594454==
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
<tr><td><b>Series:</b></td><td>benchmarks/gem_wsim: Extend engine selection syntax (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128780/">https://patchwork.freedesktop.org/series/128780/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7942_BAT -&gt; XEIGTPW_11487_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11487_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@blit-simple:<ul>
<li>{bat-lnl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11487/bat-lnl-2/igt@xe_intel_bb@blit-simple.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7942 -&gt; IGTPW_11487</li>
<li>Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -&gt; xe-1685-e64cee35967e4b08dd7f3b3ad6f110927c4699a9</li>
</ul>
<p>IGTPW_11487: 11487<br />
  IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d<br />
  xe-1685-e64cee35967e4b08dd7f3b3ad6f110927c4699a9: e64cee35967e4b08dd7f3b3ad6f110927c4699a9</p>

</body>
</html>

--===============7760968728943594454==--
