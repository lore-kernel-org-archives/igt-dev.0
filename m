Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E3C43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 23:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3449010E0A4;
	Thu,  9 Jul 2026 23:38:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978110E0A4;
 Thu,  9 Jul 2026 23:37:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4818811844320029868=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fexec=5Fmul?=
 =?utf-8?q?ti=5Fqueue=3A_Check_PXP_is_rejected_on_multi-queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 09 Jul 2026 23:37:36 -0000
Message-ID: <178364025616.172904.8766704673581358123@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <4f88d137e4d769797789dae939455b918302793c.1783626314.git.jagmeet.randhawa@intel.com>
In-Reply-To: <4f88d137e4d769797789dae939455b918302793c.1783626314.git.jagmeet.randhawa@intel.com>
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

--===============4818811844320029868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue
URL   : https://patchwork.freedesktop.org/series/170148/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8997_BAT -> XEIGTPW_15504_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15504_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15504_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15504_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8997/bat-atsm-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15504/bat-atsm-2/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * IGT: IGT_8997 -> IGTPW_15504
  * Linux: xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa -> xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc

  IGTPW_15504: 535da2d9ed8be27b85bf18463e6cb8f4482c953b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8997: 8997
  xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa: e5af800f48075d6b249b979cc8bf210c051d86aa
  xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc: e6db87755f42426899dd6ca45f97eb1b98e2f9fc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15504/index.html

--===============4818811844320029868==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_exec_multi_queue: Check PXP is rejected on multi-queue</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170148/">https://patchwork.freedesktop.org/series/170148/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15504/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15504/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8997_BAT -&gt; XEIGTPW_15504_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15504_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15504_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15504_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8997/bat-atsm-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15504/bat-atsm-2/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8997 -&gt; IGTPW_15504</li>
<li>Linux: xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa -&gt; xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc</li>
</ul>
<p>IGTPW_15504: 535da2d9ed8be27b85bf18463e6cb8f4482c953b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8997: 8997<br />
  xe-5378-e5af800f48075d6b249b979cc8bf210c051d86aa: e5af800f48075d6b249b979cc8bf210c051d86aa<br />
  xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc: e6db87755f42426899dd6ca45f97eb1b98e2f9fc</p>

</body>
</html>

--===============4818811844320029868==--
