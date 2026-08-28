Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7EEC61DB9
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 21:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2718410E062;
	Fri, 28 Aug 2026 21:56:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9783E10E062;
 Fri, 28 Aug 2026 21:55:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0931351039726854523=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_=22lib/igt=5Fkms=3A_?=
 =?utf-8?q?Do_not_treat_writeback_and_virtual_connectors_as_connected=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thadeu Lima de Souza Cascardo" <cascardo@igalia.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 28 Aug 2026 21:55:28 -0000
Message-ID: <178795412861.97824.673498687358984772@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260828-vkms_virtual_output_fix-v1-1-789718f4cb00@igalia.com>
In-Reply-To: <20260828-vkms_virtual_output_fix-v1-1-789718f4cb00@igalia.com>
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

--===============0931351039726854523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "lib/igt_kms: Do not treat writeback and virtual connectors as connected"
URL   : https://patchwork.freedesktop.org/series/172993/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9078_BAT -> XEIGTPW_15752_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9078 -> IGTPW_15752
  * Linux: xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e -> xe-5660-046bcac5ed22b09812cec3b0aef678195f1eae71

  IGTPW_15752: 15752
  IGT_9078: 9078
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e
  xe-5660-046bcac5ed22b09812cec3b0aef678195f1eae71: 046bcac5ed22b09812cec3b0aef678195f1eae71

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15752/index.html

--===============0931351039726854523==
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
<tr><td><b>Series:</b></td><td>Revert &quot;lib/igt_kms: Do not treat writeback and virtual connectors as connected&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172993/">https://patchwork.freedesktop.org/series/172993/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15752/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15752/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9078_BAT -&gt; XEIGTPW_15752_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9078 -&gt; IGTPW_15752</li>
<li>Linux: xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e -&gt; xe-5660-046bcac5ed22b09812cec3b0aef678195f1eae71</li>
</ul>
<p>IGTPW_15752: 15752<br />
  IGT_9078: 9078<br />
  xe-5656-108b145a702212f7cb6d40611f46c7ee7959d39e: 108b145a702212f7cb6d40611f46c7ee7959d39e<br />
  xe-5660-046bcac5ed22b09812cec3b0aef678195f1eae71: 046bcac5ed22b09812cec3b0aef678195f1eae71</p>

</body>
</html>

--===============0931351039726854523==--
