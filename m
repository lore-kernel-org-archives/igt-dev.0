Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5703FD25B53
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 12:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0801110E6C3;
	Wed, 28 Jan 2026 12:45:54 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0E510E6C3;
 Wed, 28 Jan 2026 12:45:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9017858816083741467=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=5Feudebug=5Fonline=3A_Fi?=
 =?utf-8?q?x_test=5Finterrupt=5Fother_wait_logic_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Piotr Rudnicki" <piotr.rudnicki@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jan 2026 12:45:52 -0000
Message-ID: <176960435283.200099.12699817422644113740@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260128101529.401653-4-piotr.rudnicki@intel.com>
In-Reply-To: <20260128101529.401653-4-piotr.rudnicki@intel.com>
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

--===============9017858816083741467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_eudebug_online: Fix test_interrupt_other wait logic (rev3)
URL   : https://patchwork.freedesktop.org/series/160553/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8721_BAT -> XEIGTPW_14435_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_14435_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14435/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6520]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14435/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8721 -> IGTPW_14435
  * Linux: xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1 -> xe-4464-23ebb43006b887363bd6653fbc4a327fd3072226

  IGTPW_14435: 5e524f9f3332ca28ba5db3be987c40049ecd52c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1: 6d88e21d3ccde3ca984304cde021744d0e326ee1
  xe-4464-23ebb43006b887363bd6653fbc4a327fd3072226: 23ebb43006b887363bd6653fbc4a327fd3072226

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14435/index.html

--===============9017858816083741467==
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
<tr><td><b>Series:</b></td><td>xe_eudebug_online: Fix test_interrupt_other wait logic (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160553/">https://patchwork.freedesktop.org/series/160553/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14435/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14435/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8721_BAT -&gt; XEIGTPW_14435_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14435_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14435/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8721/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14435/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8721 -&gt; IGTPW_14435</li>
<li>Linux: xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1 -&gt; xe-4464-23ebb43006b887363bd6653fbc4a327fd3072226</li>
</ul>
<p>IGTPW_14435: 5e524f9f3332ca28ba5db3be987c40049ecd52c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8721: 3707bb4267de22a18d61b232c4ab5fbaf61db90c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4459-6d88e21d3ccde3ca984304cde021744d0e326ee1: 6d88e21d3ccde3ca984304cde021744d0e326ee1<br />
  xe-4464-23ebb43006b887363bd6653fbc4a327fd3072226: 23ebb43006b887363bd6653fbc4a327fd3072226</p>

</body>
</html>

--===============9017858816083741467==--
