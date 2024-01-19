Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90738C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 12:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F89010E9F9;
	Fri, 19 Jan 2024 12:46:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32B310E9D6;
 Fri, 19 Jan 2024 12:46:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8910218755802163628=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Add_d3_mmap_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Fri, 19 Jan 2024 12:46:45 -0000
Message-ID: <170566840579.592635.17178018428186277757@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240119115554.1699060-1-anshuman.gupta@intel.com>
In-Reply-To: <20240119115554.1699060-1-anshuman.gupta@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============8910218755802163628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add d3 mmap test (rev3)
URL   : https://patchwork.freedesktop.org/series/124115/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7683_BAT -> XEIGTPW_10562_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10562_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10562_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10562_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@d3-mmap:
    - bat-atsm-2:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-atsm-2/igt@xe_pm@d3-mmap.html
    - bat-adlp-7:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-adlp-7/igt@xe_pm@d3-mmap.html
    - bat-pvc-2:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-pvc-2/igt@xe_pm@d3-mmap.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-dg2-oem2/igt@xe_pm@d3-mmap.html

  


Build changes
-------------

  * IGT: IGT_7683 -> IGTPW_10562
  * Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -> xe-652-ad8fc2d4a396b1123c48340004d8c35dd0320817

  IGTPW_10562: 10562
  IGT_7683: 7683
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad
  xe-652-ad8fc2d4a396b1123c48340004d8c35dd0320817: ad8fc2d4a396b1123c48340004d8c35dd0320817

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/index.html

--===============8910218755802163628==
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
<tr><td><b>Series:</b></td><td>Add d3 mmap test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124115/">https://patchwork.freedesktop.org/series/124115/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7683_BAT -&gt; XEIGTPW_10562_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10562_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10562_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10562_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@d3-mmap:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-atsm-2/igt@xe_pm@d3-mmap.html">SKIP</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-adlp-7/igt@xe_pm@d3-mmap.html">SKIP</a></li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-pvc-2/igt@xe_pm@d3-mmap.html">SKIP</a></li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10562/bat-dg2-oem2/igt@xe_pm@d3-mmap.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7683 -&gt; IGTPW_10562</li>
<li>Linux: xe-644-238e8655c184b7cf16731690b59da560641a07ad -&gt; xe-652-ad8fc2d4a396b1123c48340004d8c35dd0320817</li>
</ul>
<p>IGTPW_10562: 10562<br />
  IGT_7683: 7683<br />
  xe-644-238e8655c184b7cf16731690b59da560641a07ad: 238e8655c184b7cf16731690b59da560641a07ad<br />
  xe-652-ad8fc2d4a396b1123c48340004d8c35dd0320817: ad8fc2d4a396b1123c48340004d8c35dd0320817</p>

</body>
</html>

--===============8910218755802163628==--
