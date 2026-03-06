Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35672F01812
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 08:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C038E10ECB4;
	Fri,  6 Mar 2026 08:55:33 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596E910ECB2;
 Fri,  6 Mar 2026 08:55:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3066112443023328044=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Extend_compute_userenv_to_s?=
 =?utf-8?q?upport_user_passed_buffers_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Mar 2026 08:55:33 -0000
Message-ID: <177278733325.324953.3438634763583593344@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260306075759.1153032-8-zbigniew.kempczynski@intel.com>
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

--===============3066112443023328044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend compute userenv to support user passed buffers (rev6)
URL   : https://patchwork.freedesktop.org/series/162170/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8782_BAT -> XEIGTPW_14686_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14686_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14686_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 13)
------------------------------

  Additional (1): bat-pvc-2 
  Missing    (2): bat-atsm-2 bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14686_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14686/bat-pvc-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_8782 -> IGTPW_14686
  * Linux: xe-4665-d927c128e21f0543a0998af896d9fe22629b3532 -> xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9

  IGTPW_14686: 3d619a95f0b62a71ad44d313490331387df8a115 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4665-d927c128e21f0543a0998af896d9fe22629b3532: d927c128e21f0543a0998af896d9fe22629b3532
  xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9: 79792a2fc5d37b5446e543f1de05158ab0f551c9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14686/index.html

--===============3066112443023328044==
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
<tr><td><b>Series:</b></td><td>Extend compute userenv to support user passed buffers (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162170/">https://patchwork.freedesktop.org/series/162170/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14686/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14686/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8782_BAT -&gt; XEIGTPW_14686_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14686_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14686_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Additional (1): bat-pvc-2 <br />
  Missing    (2): bat-atsm-2 bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14686_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14686/bat-pvc-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8782 -&gt; IGTPW_14686</li>
<li>Linux: xe-4665-d927c128e21f0543a0998af896d9fe22629b3532 -&gt; xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9</li>
</ul>
<p>IGTPW_14686: 3d619a95f0b62a71ad44d313490331387df8a115 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4665-d927c128e21f0543a0998af896d9fe22629b3532: d927c128e21f0543a0998af896d9fe22629b3532<br />
  xe-4673-79792a2fc5d37b5446e543f1de05158ab0f551c9: 79792a2fc5d37b5446e543f1de05158ab0f551c9</p>

</body>
</html>

--===============3066112443023328044==--
