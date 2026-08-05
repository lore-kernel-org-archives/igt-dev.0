Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F098EC55838
	for <igt-dev@archiver.kernel.org>; Wed,  5 Aug 2026 01:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE5510E19B;
	Wed,  5 Aug 2026 01:27:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7749410E19B;
 Wed,  5 Aug 2026 01:26:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8870861730336825814=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_xe=5Fexec=5Fsystem=5Falloc?=
 =?utf-8?q?ator=3A_fix_MADVISE=5FMULTI=5FVMA_and_PREFETCH=5FSAME=5FATTR_bo?=
 =?utf-8?q?=5Fsize_for_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 05 Aug 2026 01:26:52 -0000
Message-ID: <178589321248.19127.3300076380794887470@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260803212549.108737-1-jia.yao@intel.com>
In-Reply-To: <20260803212549.108737-1-jia.yao@intel.com>
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

--===============8870861730336825814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_system_allocator: fix MADVISE_MULTI_VMA and PREFETCH_SAME_ATTR bo_size for PVC
URL   : https://patchwork.freedesktop.org/series/171532/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9036_FULL -> XEIGTPW_15625_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15625_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15625_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_15625_FULL prevented too many machines from booting.

  Missing    (2): shard-bmg shard-lnl 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9036 -> IGTPW_15625
  * Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -> xe-5523-9a93ab75c5956f84bedf22b5bb3385ab9add0d12

  IGTPW_15625: f5175bc162e983bd1f4a956b209266296ba4a9fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9036: 9036
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a
  xe-5523-9a93ab75c5956f84bedf22b5bb3385ab9add0d12: 9a93ab75c5956f84bedf22b5bb3385ab9add0d12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/index.html

--===============8870861730336825814==
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
<tr><td><b>Series:</b></td><td>xe_exec_system_allocator: fix MADVISE_MULTI_VMA and PREFETCH_SAME_ATTR bo_size for PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171532/">https://patchwork.freedesktop.org/series/171532/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15625/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9036_FULL -&gt; XEIGTPW_15625_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15625_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15625_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_15625_FULL prevented too many machines from booting.</p>
<p>Missing    (2): shard-bmg shard-lnl </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9036 -&gt; IGTPW_15625</li>
<li>Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -&gt; xe-5523-9a93ab75c5956f84bedf22b5bb3385ab9add0d12</li>
</ul>
<p>IGTPW_15625: f5175bc162e983bd1f4a956b209266296ba4a9fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9036: 9036<br />
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a<br />
  xe-5523-9a93ab75c5956f84bedf22b5bb3385ab9add0d12: 9a93ab75c5956f84bedf22b5bb3385ab9add0d12</p>

</body>
</html>

--===============8870861730336825814==--
