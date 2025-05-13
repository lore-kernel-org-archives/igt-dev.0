Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1144C3ABD8
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 17:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5195E10E274;
	Tue, 13 May 2025 17:21:13 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4415D10E26C;
 Tue, 13 May 2025 17:21:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1411857255330387400=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_starting_with_=5Bi-?=
 =?utf-8?q?g-t=2Cv1=2C1/1=5D_tests/intel/xe=5Frender=5Fcopy=3A_Skip_tests_on?=
 =?utf-8?q?_PVC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Sokolowski" <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 May 2025 17:21:12 -0000
Message-ID: <174715687226.76187.5746902750012650001@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513115252.9095-1-jan.sokolowski@intel.com>
In-Reply-To: <20250513115252.9095-1-jan.sokolowski@intel.com>
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

--===============1411857255330387400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v1,1/1] tests/intel/xe_render_copy: Skip tests on PVC
URL   : https://patchwork.freedesktop.org/series/148959/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8362_FULL -> XEIGTPW_13115_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_13115_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13115_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_13115_FULL prevented too many machines from booting.

  Missing    (4): shard-bmg shard-dg2-set2 shard-adlp shard-lnl 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8362 -> IGTPW_13115
  * Linux: xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c -> xe-3081-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d

  IGTPW_13115: 13115
  IGT_8362: 8362
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c
  xe-3081-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d: d0d3c136f60cbee6ede33f207b4e6d6b2f04779d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13115/index.html

--===============1411857255330387400==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v1,1/1] tests/intel/xe_render_copy: Skip tests on PVC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148959/">https://patchwork.freedesktop.org/series/148959/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13115/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13115/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8362_FULL -&gt; XEIGTPW_13115_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_13115_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13115_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_13115_FULL prevented too many machines from booting.</p>
<p>Missing    (4): shard-bmg shard-dg2-set2 shard-adlp shard-lnl </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8362 -&gt; IGTPW_13115</li>
<li>Linux: xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c -&gt; xe-3081-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d</li>
</ul>
<p>IGTPW_13115: 13115<br />
  IGT_8362: 8362<br />
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c<br />
  xe-3081-d0d3c136f60cbee6ede33f207b4e6d6b2f04779d: d0d3c136f60cbee6ede33f207b4e6d6b2f04779d</p>

</body>
</html>

--===============1411857255330387400==--
