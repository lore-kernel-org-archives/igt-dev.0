Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3600F55436
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 01:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6300010E64C;
	Wed, 25 Feb 2026 01:00:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B182410E63E;
 Wed, 25 Feb 2026 01:00:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5462622003853067131=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_xe=5Fexec=5Fbalancer=3A_Rep?=
 =?utf-8?q?ort_skip_when_test_is_unable_to_run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Feb 2026 01:00:02 -0000
Message-ID: <177198120270.284008.13356809810795604967@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224211612.2944788-2-matthew.d.roper@intel.com>
In-Reply-To: <20260224211612.2944788-2-matthew.d.roper@intel.com>
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

--===============5462622003853067131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_balancer: Report skip when test is unable to run
URL   : https://patchwork.freedesktop.org/series/162088/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8769_BAT -> XEIGTPW_14611_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14611_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14611_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 14)
------------------------------

  Additional (1): bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14611_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  


Build changes
-------------

  * IGT: IGT_8769 -> IGTPW_14611
  * Linux: xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b -> xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe

  IGTPW_14611: 14611
  IGT_8769: 8769
  xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b: 189174b3312588d97dc467dca7cfb9dce42ab81b
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/index.html

--===============5462622003853067131==
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
<tr><td><b>Series:</b></td><td>xe_exec_balancer: Report skip when test is unable to run</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162088/">https://patchwork.freedesktop.org/series/162088/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8769_BAT -&gt; XEIGTPW_14611_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14611_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14611_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14611_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8769 -&gt; IGTPW_14611</li>
<li>Linux: xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b -&gt; xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe</li>
</ul>
<p>IGTPW_14611: 14611<br />
  IGT_8769: 8769<br />
  xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b: 189174b3312588d97dc467dca7cfb9dce42ab81b<br />
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe</p>

</body>
</html>

--===============5462622003853067131==--
