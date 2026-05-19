Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8813CD4F54
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 22:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AC810E608;
	Tue, 19 May 2026 22:23:53 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D444910E608;
 Tue, 19 May 2026 22:23:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7536740784897400477=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=2CV5=5D_tests/kms=5Fhdr=3A_Fix_HDR_metadata_probe_in_test=5Fhdr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alex Hung" <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 19 May 2026 22:23:34 -0000
Message-ID: <177922941484.88514.9438170160387885209@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260519150022.3964921-1-alex.hung@amd.com>
In-Reply-To: <20260519150022.3964921-1-alex.hung@amd.com>
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

--===============7536740784897400477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr
URL   : https://patchwork.freedesktop.org/series/166879/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8921_BAT -> XEIGTPW_15208_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15208_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15208_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15208_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/bat-atsm-2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15208/bat-atsm-2/igt@xe_waitfence@abstime.html

  


Build changes
-------------

  * IGT: IGT_8921 -> IGTPW_15208
  * Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -> xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe

  IGTPW_15208: 15208
  IGT_8921: 8921
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15208/index.html

--===============7536740784897400477==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166879/">https://patchwork.freedesktop.org/series/166879/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15208/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15208/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8921_BAT -&gt; XEIGTPW_15208_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15208_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15208_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15208_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8921/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15208/bat-atsm-2/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8921 -&gt; IGTPW_15208</li>
<li>Linux: xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497 -&gt; xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe</li>
</ul>
<p>IGTPW_15208: 15208<br />
  IGT_8921: 8921<br />
  xe-5096-eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497: eb3e9b1d7cc66ea95ab946f8f68d1c5b31096497<br />
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe</p>

</body>
</html>

--===============7536740784897400477==--
