Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AA3C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 06:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BD110E2AB;
	Wed, 31 Jul 2024 06:55:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3F710E2AB;
 Wed, 31 Jul 2024 06:55:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8437951372130676400=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel-ci/xe=3A_Block_kms?=
 =?utf-8?q?=5Frmfb=40close-fd_test?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 31 Jul 2024 06:55:15 -0000
Message-ID: <172240891543.466607.4692592597002460066@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731061512.1954095-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240731061512.1954095-1-bhanuprakash.modem@intel.com>
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

--===============8437951372130676400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci/xe: Block kms_rmfb@close-fd test
URL   : https://patchwork.freedesktop.org/series/136715/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7944_BAT -> XEIGTPW_11503_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11503_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11503_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11503_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@shared-pde3-page:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7944/bat-bmg-1/igt@xe_vm@shared-pde3-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11503/bat-bmg-1/igt@xe_vm@shared-pde3-page.html

  


Build changes
-------------

  * IGT: IGT_7944 -> IGTPW_11503

  IGTPW_11503: 11503
  IGT_7944: 7944
  xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90: 4a4602971578bb1ed5b64078f758dff3034b6b90

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11503/index.html

--===============8437951372130676400==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci/xe: Block kms_rmfb@close-fd test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136715/">https://patchwork.freedesktop.org/series/136715/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11503/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11503/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7944_BAT -&gt; XEIGTPW_11503_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11503_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11503_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11503_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@shared-pde3-page:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7944/bat-bmg-1/igt@xe_vm@shared-pde3-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11503/bat-bmg-1/igt@xe_vm@shared-pde3-page.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7944 -&gt; IGTPW_11503</li>
</ul>
<p>IGTPW_11503: 11503<br />
  IGT_7944: 7944<br />
  xe-1694-4a4602971578bb1ed5b64078f758dff3034b6b90: 4a4602971578bb1ed5b64078f758dff3034b6b90</p>

</body>
</html>

--===============8437951372130676400==--
