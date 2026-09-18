Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40495C982D7
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 09:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00E610E3C3;
	Fri, 18 Sep 2026 09:22:46 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E802010E0B5;
 Fri, 18 Sep 2026 09:21:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9158808894872538014=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_FIXED=5FMATRIX_colorop_?=
 =?utf-8?q?tests_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Sep 2026 09:21:59 -0000
Message-ID: <178972331994.181279.17894854459512356242@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918083350.1021184-1-swati2.sharma@intel.com>
In-Reply-To: <20260918083350.1021184-1-swati2.sharma@intel.com>
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

--===============9158808894872538014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add FIXED_MATRIX colorop tests (rev6)
URL   : https://patchwork.freedesktop.org/series/165021/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9100_BAT -> XEIGTPW_15863_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15863_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-wcl-2:          NOTRUN -> [FAIL][1] ([Intel XE#9062])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15863/bat-wcl-2/igt@runner@aborted.html

  
  [Intel XE#9062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9062


Build changes
-------------

  * IGT: IGT_9100 -> IGTPW_15863
  * Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -> xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05

  IGTPW_15863: 15863
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc05a1c11a785e709c05

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15863/index.html

--===============9158808894872538014==
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
<tr><td><b>Series:</b></td><td>Add FIXED_MATRIX colorop tests (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165021/">https://patchwork.freedesktop.org/series/165021/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15863/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15863/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9100_BAT -&gt; XEIGTPW_15863_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15863_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15863/bat-wcl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9062">Intel XE#9062</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9100 -&gt; IGTPW_15863</li>
<li>Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -&gt; xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05</li>
</ul>
<p>IGTPW_15863: 15863<br />
  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb<br />
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc05a1c11a785e709c05</p>

</body>
</html>

--===============9158808894872538014==--
