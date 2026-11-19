Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B4606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 01:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F4A11210E;
	Thu, 19 Nov 2026 01:41:17 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994A311210E;
 Thu, 19 Nov 2026 01:40:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4836525078257807302=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/i915=5Fhangman?=
 =?utf-8?q?=3A_Add_engine-error-state-skipped-capture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 19 Nov 2026 01:40:17 -0000
Message-ID: <179505241761.47753.8945523062951021913@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
In-Reply-To: <20261118120112.5434-1-sebastian.brzezinka@intel.com>
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

--===============4836525078257807302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/i915_hangman: Add engine-error-state-skipped-capture
URL   : https://patchwork.freedesktop.org/series/178889/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9197_BAT -> XEIGTPW_16171_BAT
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

  * IGT: IGT_9197 -> IGTPW_16171
  * Linux: xe-6174-b40bd4a05b393f4cbb538056dbcb2f254f935bed -> xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef

  IGTPW_16171: 716e4d9c12f72bad9187e4777eb646f4d1b0e68c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9197: 9197
  xe-6174-b40bd4a05b393f4cbb538056dbcb2f254f935bed: b40bd4a05b393f4cbb538056dbcb2f254f935bed
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16171/index.html

--===============4836525078257807302==
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
<tr><td><b>Series:</b></td><td>tests/intel/i915_hangman: Add engine-error-state-skipped-capture</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178889/">https://patchwork.freedesktop.org/series/178889/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16171/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_16171/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9197_BAT -&gt; XEIGTPW_16171_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9197 -&gt; IGTPW_16171</li>
<li>Linux: xe-6174-b40bd4a05b393f4cbb538056dbcb2f254f935bed -&gt; xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef</li>
</ul>
<p>IGTPW_16171: 716e4d9c12f72bad9187e4777eb646f4d1b0e68c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9197: 9197<br />
  xe-6174-b40bd4a05b393f4cbb538056dbcb2f254f935bed: b40bd4a05b393f4cbb538056dbcb2f254f935bed<br />
  xe-6182-48995c76e90141a4e72ceafeb3762d4a3580eeef: 48995c76e90141a4e72ceafeb3762d4a3580eeef</p>

</body>
</html>

--===============4836525078257807302==--
