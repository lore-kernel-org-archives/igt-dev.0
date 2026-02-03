Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB8FE8784E
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 17:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AC610E71C;
	Tue,  3 Feb 2026 17:16:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F08E10E12A;
 Tue,  3 Feb 2026 17:16:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6467465587376294724=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_PCI_driver_helpers_and_xe-v?=
 =?utf-8?q?fio-pci_FLR_improvement_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Marcin Bernatowicz" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 03 Feb 2026 17:16:52 -0000
Message-ID: <177013901209.221747.14988384432074263630@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260203153349.128551-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260203153349.128551-1-marcin.bernatowicz@linux.intel.com>
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

--===============6467465587376294724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PCI driver helpers and xe-vfio-pci FLR improvement (rev2)
URL   : https://patchwork.freedesktop.org/series/160140/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8730_BAT -> XEIGTPW_14483_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14483_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14483_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14483_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-7:         [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8730/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14483/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html

  


Build changes
-------------

  * IGT: IGT_8730 -> IGTPW_14483
  * Linux: xe-4489-1c038794140250955ba149f8175f6564e573d5c7 -> xe-4490-9f5242e63f0bab74d47ae6792e0c25a324184a6b

  IGTPW_14483: 14483
  IGT_8730: 8730
  xe-4489-1c038794140250955ba149f8175f6564e573d5c7: 1c038794140250955ba149f8175f6564e573d5c7
  xe-4490-9f5242e63f0bab74d47ae6792e0c25a324184a6b: 9f5242e63f0bab74d47ae6792e0c25a324184a6b

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14483/index.html

--===============6467465587376294724==
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
<tr><td><b>Series:</b></td><td>PCI driver helpers and xe-vfio-pci FLR improvement (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160140/">https://patchwork.freedesktop.org/series/160140/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14483/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14483/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8730_BAT -&gt; XEIGTPW_14483_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14483_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14483_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14483_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_flr@flr-vf1-clear:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8730/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14483/bat-adlp-7/igt@xe_sriov_flr@flr-vf1-clear.html">WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8730 -&gt; IGTPW_14483</li>
<li>Linux: xe-4489-1c038794140250955ba149f8175f6564e573d5c7 -&gt; xe-4490-9f5242e63f0bab74d47ae6792e0c25a324184a6b</li>
</ul>
<p>IGTPW_14483: 14483<br />
  IGT_8730: 8730<br />
  xe-4489-1c038794140250955ba149f8175f6564e573d5c7: 1c038794140250955ba149f8175f6564e573d5c7<br />
  xe-4490-9f5242e63f0bab74d47ae6792e0c25a324184a6b: 9f5242e63f0bab74d47ae6792e0c25a324184a6b</p>

</body>
</html>

--===============6467465587376294724==--
