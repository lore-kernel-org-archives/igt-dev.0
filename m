Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D98D66B85
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4AD10E249;
	Wed, 17 Dec 2025 19:20:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E0410E249;
 Wed, 17 Dec 2025 19:20:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1625549393854263734=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Discard_wait=5Ffor=5Flmem?=
 =?utf-8?q?=5Fready_from_fault_injection_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 17 Dec 2025 19:20:55 -0000
Message-ID: <176599925515.98733.150370471633818359@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
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

--===============1625549393854263734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Discard wait_for_lmem_ready from fault injection test
URL   : https://patchwork.freedesktop.org/series/159151/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8670_BAT -> XEIGTPW_14227_BAT
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

  Here are the changes found in XEIGTPW_14227_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8670 -> IGTPW_14227

  IGTPW_14227: 13b6d583b5c4295ae214e9134601e8205292c134 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8670: 8670
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/index.html

--===============1625549393854263734==
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
<tr><td><b>Series:</b></td><td>Discard wait_for_lmem_ready from fault injection test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159151/">https://patchwork.freedesktop.org/series/159151/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8670_BAT -&gt; XEIGTPW_14227_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14227_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8670/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14227/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8670 -&gt; IGTPW_14227</li>
</ul>
<p>IGTPW_14227: 13b6d583b5c4295ae214e9134601e8205292c134 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8670: 8670<br />
  xe-4259-605176fe40c828b491a1532367df157529895b87: 605176fe40c828b491a1532367df157529895b87</p>

</body>
</html>

--===============1625549393854263734==--
