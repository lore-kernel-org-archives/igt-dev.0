Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61991C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 21:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE171136EE;
	Tue, 23 Apr 2024 21:21:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6861136EE;
 Tue, 23 Apr 2024 21:21:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2217993734869754891=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/intel/xe=5Fvm=2Ec=3A_Enf?=
 =?utf-8?q?orce_explicit_WB_caching_in_bind-flag-invalid?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 23 Apr 2024 21:21:05 -0000
Message-ID: <171390726590.1610190.5709138471000522523@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <bf76c34f97ed5e2ff935d4e8ff31c68dd13eb2d8.1713902821.git.jagmeet.randhawa@intel.com>
In-Reply-To: <bf76c34f97ed5e2ff935d4e8ff31c68dd13eb2d8.1713902821.git.jagmeet.randhawa@intel.com>
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

--===============2217993734869754891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_vm.c: Enforce explicit WB caching in bind-flag-invalid
URL   : https://patchwork.freedesktop.org/series/132794/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7819_BAT -> XEIGTPW_11059_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11059_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-basic:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#1256]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7819/bat-lnl-1/igt@xe_exec_threads@threads-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11059/bat-lnl-1/igt@xe_exec_threads@threads-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256


Build changes
-------------

  * IGT: IGT_7819 -> IGTPW_11059

  IGTPW_11059: c36e92eddaf485146c6825ba7a6412d1e42e2b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11059/index.html

--===============2217993734869754891==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_vm.c: Enforce explicit WB caching in bind-flag-invalid</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132794/">https://patchwork.freedesktop.org/series/132794/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11059/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11059/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7819_BAT -&gt; XEIGTPW_11059_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11059_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-basic:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7819/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11059/bat-lnl-1/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7819 -&gt; IGTPW_11059</li>
</ul>
<p>IGTPW_11059: c36e92eddaf485146c6825ba7a6412d1e42e2b93 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf</p>

</body>
</html>

--===============2217993734869754891==--
