Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F6CCD8C85
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 05:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FF210E080;
	Tue,  9 Jun 2026 05:12:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D9410E080;
 Tue,  9 Jun 2026 05:11:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0204257133001419556=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/xe=5Fexec=5Freset=3A_?=
 =?utf-8?q?Replace_fixed_usleep_with_dynamic_GT_idle_wait?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 09 Jun 2026 05:11:42 -0000
Message-ID: <178098190267.57588.16231373648105516149@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608222252.2060110-1-x.wang@intel.com>
In-Reply-To: <20260608222252.2060110-1-x.wang@intel.com>
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

--===============0204257133001419556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_exec_reset: Replace fixed usleep with dynamic GT idle wait
URL   : https://patchwork.freedesktop.org/series/168132/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8954_BAT -> XEIGTPW_15328_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15328_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15328_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15328_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-ptl-vm:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8954/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15328/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - bat-bmg-vm:         [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8954/bat-bmg-vm/igt@xe_exec_reset@virtual-close-fd-no-exec.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15328/bat-bmg-vm/igt@xe_exec_reset@virtual-close-fd-no-exec.html

  


Build changes
-------------

  * IGT: IGT_8954 -> IGTPW_15328

  IGTPW_15328: 15328
  IGT_8954: 8954
  xe-5222-cc6ecad1583df42f635269218c08a63e79218177: cc6ecad1583df42f635269218c08a63e79218177

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15328/index.html

--===============0204257133001419556==
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
<tr><td><b>Series:</b></td><td>tests/xe_exec_reset: Replace fixed usleep with dynamic GT idle wait</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168132/">https://patchwork.freedesktop.org/series/168132/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15328/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15328/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8954_BAT -&gt; XEIGTPW_15328_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15328_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15328_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15328_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8954/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15328/bat-ptl-vm/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8954/bat-bmg-vm/igt@xe_exec_reset@virtual-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15328/bat-bmg-vm/igt@xe_exec_reset@virtual-close-fd-no-exec.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8954 -&gt; IGTPW_15328</li>
</ul>
<p>IGTPW_15328: 15328<br />
  IGT_8954: 8954<br />
  xe-5222-cc6ecad1583df42f635269218c08a63e79218177: cc6ecad1583df42f635269218c08a63e79218177</p>

</body>
</html>

--===============0204257133001419556==--
