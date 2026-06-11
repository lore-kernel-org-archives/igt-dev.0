Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D3ACD8C9D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 21:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3D510E0B7;
	Thu, 11 Jun 2026 21:20:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E178110E0B7;
 Thu, 11 Jun 2026 21:19:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6591310559754485883=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/intel=5Fchipset=3A_Exte?=
 =?utf-8?q?nd_intel=5Fget=5Fpci=5Fdevice_to_PCI_accelerator_class?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 11 Jun 2026 21:19:48 -0000
Message-ID: <178121278891.70087.13990843941175978767@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611202801.3945761-1-ashutosh.dixit@intel.com>
In-Reply-To: <20260611202801.3945761-1-ashutosh.dixit@intel.com>
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

--===============6591310559754485883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_chipset: Extend intel_get_pci_device to PCI accelerator class
URL   : https://patchwork.freedesktop.org/series/168385/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8959_BAT -> XEIGTPW_15351_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15351_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [PASS][1] -> [TIMEOUT][2] ([Intel XE#8216])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8959/bat-atsm-2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15351/bat-atsm-2/igt@xe_waitfence@abstime.html

  
  [Intel XE#8216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8216


Build changes
-------------

  * IGT: IGT_8959 -> IGTPW_15351
  * Linux: xe-5241-a472b6217138ef0942355824543a5cce12f43343 -> xe-5244-311cbada9202146752938f54503d33980ee4f3f6

  IGTPW_15351: 15351
  IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5241-a472b6217138ef0942355824543a5cce12f43343: a472b6217138ef0942355824543a5cce12f43343
  xe-5244-311cbada9202146752938f54503d33980ee4f3f6: 311cbada9202146752938f54503d33980ee4f3f6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15351/index.html

--===============6591310559754485883==
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
<tr><td><b>Series:</b></td><td>lib/intel_chipset: Extend intel_get_pci_device to PCI accelerator class</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168385/">https://patchwork.freedesktop.org/series/168385/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15351/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15351/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8959_BAT -&gt; XEIGTPW_15351_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15351_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8959/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15351/bat-atsm-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8216">Intel XE#8216</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8959 -&gt; IGTPW_15351</li>
<li>Linux: xe-5241-a472b6217138ef0942355824543a5cce12f43343 -&gt; xe-5244-311cbada9202146752938f54503d33980ee4f3f6</li>
</ul>
<p>IGTPW_15351: 15351<br />
  IGT_8959: 77337ca2d2dd470f3b32f1cf4760b0e79a52e2b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5241-a472b6217138ef0942355824543a5cce12f43343: a472b6217138ef0942355824543a5cce12f43343<br />
  xe-5244-311cbada9202146752938f54503d33980ee4f3f6: 311cbada9202146752938f54503d33980ee4f3f6</p>

</body>
</html>

--===============6591310559754485883==--
