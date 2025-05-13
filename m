Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055B9C3ABCB
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 01:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2789810E4BF;
	Tue, 13 May 2025 01:01:50 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418F910E4BF;
 Tue, 13 May 2025 01:01:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3306686401396861846=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fdsc=3A_St?=
 =?utf-8?q?ore_valid_DSC_outputs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 13 May 2025 01:01:49 -0000
Message-ID: <174709810925.71961.11044324748514259173@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512090942.1340266-1-swati2.sharma@intel.com>
In-Reply-To: <20250512090942.1340266-1-swati2.sharma@intel.com>
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

--===============3306686401396861846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_dsc: Store valid DSC outputs (rev4)
URL   : https://patchwork.freedesktop.org/series/145015/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8362_BAT -> XEIGTPW_13112_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with XEIGTPW_13112_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_13112_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_13112_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          [SKIP][1] ([Intel XE#2244]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][3] ([Intel XE#455]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-bmg-1:          [SKIP][5] ([Intel XE#2244]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-bmg-1/igt@kms_dsc@dsc-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#455]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_13112_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-adlp-vf:        [PASS][9] -> [ABORT][10] ([Intel XE#3970])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html

  
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8362 -> IGTPW_13112

  IGTPW_13112: 13112
  IGT_8362: 8362
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/index.html

--===============3306686401396861846==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_dsc: Store valid DSC outputs (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145015/">https://patchwork.freedesktop.org/series/145015/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8362_BAT -&gt; XEIGTPW_13112_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with XEIGTPW_13112_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_13112_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_13112_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_13112_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8362/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13112/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8362 -&gt; IGTPW_13112</li>
</ul>
<p>IGTPW_13112: 13112<br />
  IGT_8362: 8362<br />
  xe-3069-3db1bb52113808f8bc72a7049e2d36e76acc882c: 3db1bb52113808f8bc72a7049e2d36e76acc882c</p>

</body>
</html>

--===============3306686401396861846==--
