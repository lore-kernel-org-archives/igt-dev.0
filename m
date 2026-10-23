Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A60D606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 15:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108010E670;
	Fri, 23 Oct 2026 15:47:02 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D397D10E6BF;
 Fri, 23 Oct 2026 15:46:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2142392703087831730=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/igt=5Fsysfs=3A_fix_unin?=
 =?utf-8?q?itialized_var_in_vram_d3cold_threshold_helper?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 23 Oct 2026 15:46:12 -0000
Message-ID: <179277037285.62770.4213807096225519636@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261023054845.4907-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20261023054845.4907-1-shivtej.eknath.patil@intel.com>
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

--===============2142392703087831730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_sysfs: fix uninitialized var in vram d3cold threshold helper
URL   : https://patchwork.freedesktop.org/series/176689/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9161_BAT -> XEIGTPW_16038_BAT
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

  * IGT: IGT_9161 -> IGTPW_16038
  * Linux: xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5 -> xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c

  IGTPW_16038: 16038
  IGT_9161: 9161
  xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5: 2b2e3642e6d2095bbaae7b552da1c5ad164047a5
  xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c: a4c732aca52a51c32227b9a9a1364e1e533d275c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16038/index.html

--===============2142392703087831730==
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
<tr><td><b>Series:</b></td><td>lib/igt_sysfs: fix uninitialized var in vram d3cold threshold helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176689/">https://patchwork.freedesktop.org/series/176689/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16038/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16038/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9161_BAT -&gt; XEIGTPW_16038_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9161 -&gt; IGTPW_16038</li>
<li>Linux: xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5 -&gt; xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c</li>
</ul>
<p>IGTPW_16038: 16038<br />
  IGT_9161: 9161<br />
  xe-6002-2b2e3642e6d2095bbaae7b552da1c5ad164047a5: 2b2e3642e6d2095bbaae7b552da1c5ad164047a5<br />
  xe-6005-a4c732aca52a51c32227b9a9a1364e1e533d275c: a4c732aca52a51c32227b9a9a1364e1e533d275c</p>

</body>
</html>

--===============2142392703087831730==--
