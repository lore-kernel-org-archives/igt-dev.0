Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A64C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 21:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C47710E042;
	Thu, 29 Feb 2024 21:53:38 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCF710E642;
 Thu, 29 Feb 2024 21:53:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5295431066318659565=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/intel/gem=5Fexec=5Fcaptu?=
 =?utf-8?q?re=3A_Check_for_partial_register_captures_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 29 Feb 2024 21:53:37 -0000
Message-ID: <170924361758.414572.16355183173930959942@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240229195522.2942946-1-John.C.Harrison@Intel.com>
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

--===============5295431066318659565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_capture: Check for partial register captures (rev2)
URL   : https://patchwork.freedesktop.org/series/130332/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7738_BAT -> XEIGTPW_10760_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10760_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10760_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10760_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7738/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10760/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html

  


Build changes
-------------

  * IGT: IGT_7738 -> IGTPW_10760
  * Linux: xe-876-12db124b8cef9c32b7bc69a5abbaff016965cf99 -> xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774

  IGTPW_10760: 10760
  IGT_7738: 7738
  xe-876-12db124b8cef9c32b7bc69a5abbaff016965cf99: 12db124b8cef9c32b7bc69a5abbaff016965cf99
  xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774: c1a0f6caf0ffa81e77e74e04d937605a2e293774

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10760/index.html

--===============5295431066318659565==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_capture: Check for partial register captures (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130332/">https://patchwork.freedesktop.org/series/130332/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10760/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10760/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7738_BAT -&gt; XEIGTPW_10760_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10760_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10760_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10760_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_balancer@twice-cm-virtual-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7738/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10760/bat-dg2-oem2/igt@xe_exec_balancer@twice-cm-virtual-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7738 -&gt; IGTPW_10760</li>
<li>Linux: xe-876-12db124b8cef9c32b7bc69a5abbaff016965cf99 -&gt; xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774</li>
</ul>
<p>IGTPW_10760: 10760<br />
  IGT_7738: 7738<br />
  xe-876-12db124b8cef9c32b7bc69a5abbaff016965cf99: 12db124b8cef9c32b7bc69a5abbaff016965cf99<br />
  xe-880-c1a0f6caf0ffa81e77e74e04d937605a2e293774: c1a0f6caf0ffa81e77e74e04d937605a2e293774</p>

</body>
</html>

--===============5295431066318659565==--
