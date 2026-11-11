Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B30D606A321
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 15:58:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353DE10EA9A;
	Wed, 11 Nov 2026 15:58:13 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637F610F881;
 Wed, 11 Nov 2026 15:57:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4732681042815006615=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bi-g?=
 =?utf-8?q?-t=2Cv3=2C1/3=5D_tests/intel/xe=5Ffault=5Finjection=3A_Reload_aud?=
 =?utf-8?q?io_driver_on_exit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 11 Nov 2026 15:57:19 -0000
Message-ID: <179441263939.10309.13098327848045594918@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
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

--===============4732681042815006615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/3] tests/intel/xe_fault_injection: Reload audio driver on exit
URL   : https://patchwork.freedesktop.org/series/178313/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9186_BAT -> XEIGTPW_16135_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9186 -> IGTPW_16135
  * Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -> xe-6113-1434742f20cf3d14b493e40c453536b5414b9762

  IGTPW_16135: 16135
  IGT_9186: 9186
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232
  xe-6113-1434742f20cf3d14b493e40c453536b5414b9762: 1434742f20cf3d14b493e40c453536b5414b9762

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16135/index.html

--===============4732681042815006615==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/3] tests/intel/xe_fault_injection: Reload audio driver on exit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178313/">https://patchwork.freedesktop.org/series/178313/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16135/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16135/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9186_BAT -&gt; XEIGTPW_16135_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9186 -&gt; IGTPW_16135</li>
<li>Linux: xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232 -&gt; xe-6113-1434742f20cf3d14b493e40c453536b5414b9762</li>
</ul>
<p>IGTPW_16135: 16135<br />
  IGT_9186: 9186<br />
  xe-6104-c8d0fb6110b86aa64eb59502df08b529e221f232: c8d0fb6110b86aa64eb59502df08b529e221f232<br />
  xe-6113-1434742f20cf3d14b493e40c453536b5414b9762: 1434742f20cf3d14b493e40c453536b5414b9762</p>

</body>
</html>

--===============4732681042815006615==--
