Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0530606A335
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 18:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605CC10E29C;
	Wed, 11 Nov 2026 18:41:40 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F6A10E20C;
 Wed, 11 Nov 2026 18:40:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7248543499469136686=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Xe3P_GPU_Error_Injection_Te?=
 =?utf-8?q?st_Suite_with_DRM_RAS_Netlink_Support_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ravi Kishore Koppuravuri" <ravi.kishore.koppuravuri@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Nov 2026 18:40:42 -0000
Message-ID: <179442244275.11716.14022965761214655570@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <20261111130624.1446908-1-ravi.kishore.koppuravuri@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7248543499469136686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev11)
URL   : https://patchwork.freedesktop.org/series/171275/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9186_BAT -> XEIGTPW_16137_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9186 -> IGTPW_16137
  * Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -> xe-6114-770e275be380537f8de7e463faaeac0b0495d1bc

  IGTPW_16137: 16137
  IGT_9186: 9186
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232
  xe-6114-770e275be380537f8de7e463faaeac0b0495d1bc: 770e275be380537f8de7e463faaeac0b0495d1bc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16137/index.html

--===============7248543499469136686==
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
<tr><td><b>Series:</b></td><td>Xe3P GPU Error Injection Test Suite with DRM RAS Netlink Support (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171275/">https://patchwork.freedesktop.org/series/171275/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16137/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16137/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9186_BAT -&gt; XEIGTPW_16137_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9186 -&gt; IGTPW_16137</li>
<li>Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -&gt; xe-6114-770e275be380537f8de7e463faaeac0b0495d1bc</li>
</ul>
<p>IGTPW_16137: 16137<br />
  IGT_9186: 9186<br />
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232<br />
  xe-6114-770e275be380537f8de7e463faaeac0b0495d1bc: 770e275be380537f8de7e463faaeac0b0495d1bc</p>

</body>
</html>

--===============7248543499469136686==--
