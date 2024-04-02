Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7983CD1284
	for <igt-dev@archiver.kernel.org>; Tue,  2 Apr 2024 06:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D2C10FA41;
	Tue,  2 Apr 2024 06:10:11 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA72510FA41;
 Tue,  2 Apr 2024 06:10:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2484003948812766768=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/igt=5Fkms=3A_adapt_to_bool?=
 =?utf-8?q?ean_debugfs_for_i915=5Fbigjoiner=5Fforce=5Fenable?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 02 Apr 2024 06:10:10 -0000
Message-ID: <171203821069.1136621.10182769730987420478@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240402054231.1499492-1-kunal1.joshi@intel.com>
In-Reply-To: <20240402054231.1499492-1-kunal1.joshi@intel.com>
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

--===============2484003948812766768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_kms: adapt to boolean debugfs for i915_bigjoiner_force_enable
URL   : https://patchwork.freedesktop.org/series/131911/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7794_BAT -> XEIGTPW_10962_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7794 -> IGTPW_10962

  IGTPW_10962: 10962
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10962/index.html

--===============2484003948812766768==
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
<tr><td><b>Series:</b></td><td>lib/igt_kms: adapt to boolean debugfs for i915_bigjoiner_force_enable</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131911/">https://patchwork.freedesktop.org/series/131911/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10962/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10962/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7794_BAT -&gt; XEIGTPW_10962_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7794 -&gt; IGTPW_10962</li>
</ul>
<p>IGTPW_10962: 10962<br />
  IGT_7794: ea51cff570e13d7ced5409244af61a0690fbc8e2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1022-21a087f3d1d62518feb57cea8caf101cd4a81b5d: 21a087f3d1d62518feb57cea8caf101cd4a81b5d</p>

</body>
</html>

--===============2484003948812766768==--
