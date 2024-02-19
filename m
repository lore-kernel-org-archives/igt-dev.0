Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2657C48BC3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 17:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9208E10E43E;
	Mon, 19 Feb 2024 17:57:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A7810E450;
 Mon, 19 Feb 2024 17:57:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4912483588650400779=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_extend_psr2=5Fsf_test_for_pr?=
 =?utf-8?q?=5Fsf_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 19 Feb 2024 17:57:00 -0000
Message-ID: <170836542087.89494.14350385807891062869@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240219163333.2339647-1-kunal1.joshi@intel.com>
In-Reply-To: <20240219163333.2339647-1-kunal1.joshi@intel.com>
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

--===============4912483588650400779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend psr2_sf test for pr_sf (rev6)
URL   : https://patchwork.freedesktop.org/series/129004/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7717_BAT -> XEIGTPW_10696_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10696_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10696_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10696_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7717/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10696/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10696_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [DMESG-WARN][3] ([Intel XE#1238]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7717/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10696/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * IGT: IGT_7717 -> IGTPW_10696

  IGTPW_10696: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/index.html
  IGT_7717: 7717
  xe-803-f12bce6493b6443870b55f36b1462d65e450d29d: f12bce6493b6443870b55f36b1462d65e450d29d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10696/index.html

--===============4912483588650400779==
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
<tr><td><b>Series:</b></td><td>extend psr2_sf test for pr_sf (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129004/">https://patchwork.freedesktop.org/series/129004/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10696/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10696/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7717_BAT -&gt; XEIGTPW_10696_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10696_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10696_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10696_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7717/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10696/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10696_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7717/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10696/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7717 -&gt; IGTPW_10696</li>
</ul>
<p>IGTPW_10696: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10696/index.html<br />
  IGT_7717: 7717<br />
  xe-803-f12bce6493b6443870b55f36b1462d65e450d29d: f12bce6493b6443870b55f36b1462d65e450d29d</p>

</body>
</html>

--===============4912483588650400779==--
