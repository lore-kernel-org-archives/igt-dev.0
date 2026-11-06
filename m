Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289AB606A31B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 01:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA9E10E060;
	Fri,  6 Nov 2026 01:22:40 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F67210E060;
 Fri,  6 Nov 2026 01:21:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8699265812249253010=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_drop_xe=5Fwopcm=5Finit_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Nov 2026 01:21:36 -0000
Message-ID: <179392809605.129596.8538399606807852898@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105232545.359318-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261105232545.359318-2-daniele.ceraolospurio@intel.com>
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

--===============8699265812249253010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: drop xe_wopcm_init subtest
URL   : https://patchwork.freedesktop.org/series/177908/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9180_BAT -> XEIGTPW_16113_BAT
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

  * IGT: IGT_9180 -> IGTPW_16113
  * Linux: xe-6073-44f84d69c4528c0d36dbe06ea327f41182dfcc55 -> xe-6075-c699f5bed9689510eaca4ba2f72fc3f803660aaa

  IGTPW_16113: 16113
  IGT_9180: 9180
  xe-6073-44f84d69c4528c0d36dbe06ea327f41182dfcc55: 44f84d69c4528c0d36dbe06ea327f41182dfcc55
  xe-6075-c699f5bed9689510eaca4ba2f72fc3f803660aaa: c699f5bed9689510eaca4ba2f72fc3f803660aaa

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16113/index.html

--===============8699265812249253010==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: drop xe_wopcm_init subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177908/">https://patchwork.freedesktop.org/series/177908/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16113/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16113/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9180_BAT -&gt; XEIGTPW_16113_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9180 -&gt; IGTPW_16113</li>
<li>Linux: xe-6073-44f84d69c4528c0d36dbe06ea327f41182dfcc55 -&gt; xe-6075-c699f5bed9689510eaca4ba2f72fc3f803660aaa</li>
</ul>
<p>IGTPW_16113: 16113<br />
  IGT_9180: 9180<br />
  xe-6073-44f84d69c4528c0d36dbe06ea327f41182dfcc55: 44f84d69c4528c0d36dbe06ea327f41182dfcc55<br />
  xe-6075-c699f5bed9689510eaca4ba2f72fc3f803660aaa: c699f5bed9689510eaca4ba2f72fc3f803660aaa</p>

</body>
</html>

--===============8699265812249253010==--
