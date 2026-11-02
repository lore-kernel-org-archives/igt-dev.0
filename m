Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3E606A32E
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 19:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726FF10E0CB;
	Mon,  2 Nov 2026 19:46:51 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA2C10E0CB;
 Mon,  2 Nov 2026 19:45:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9038647294792589443=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Fpm=3A_Vali?=
 =?utf-8?q?date_root-port_D3cold_entry_on_system_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Nov 2026 19:45:52 -0000
Message-ID: <179364875277.106472.13450498113884392355@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102095802.3419285-1-karthik.poosa@intel.com>
In-Reply-To: <20261102095802.3419285-1-karthik.poosa@intel.com>
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

--===============9038647294792589443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_pm: Validate root-port D3cold entry on system suspend
URL   : https://patchwork.freedesktop.org/series/177433/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9175_BAT -> XEIGTPW_16084_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9175 -> IGTPW_16084
  * Linux: xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d -> xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2

  IGTPW_16084: 087594154a27752788c40e9497ffcd68752aee2d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9175: 9175
  xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16084/index.html

--===============9038647294792589443==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_pm: Validate root-port D3cold entry on system suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177433/">https://patchwork.freedesktop.org/series/177433/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16084/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16084/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9175_BAT -&gt; XEIGTPW_16084_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9175 -&gt; IGTPW_16084</li>
<li>Linux: xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d -&gt; xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2</li>
</ul>
<p>IGTPW_16084: 087594154a27752788c40e9497ffcd68752aee2d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9175: 9175<br />
  xe-6046-79cefeb775e63da397152ab01c2f1d4fa1b9b46d: 79cefeb775e63da397152ab01c2f1d4fa1b9b46d<br />
  xe-6047-2cd78713d917a02987f21b437561a5e1e13ddda2: 2cd78713d917a02987f21b437561a5e1e13ddda2</p>

</body>
</html>

--===============9038647294792589443==--
