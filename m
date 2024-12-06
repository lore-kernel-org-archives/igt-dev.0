Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35A9E7716E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 01:05:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C6D10E0E0;
	Fri,  6 Dec 2024 01:05:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7987B10E0E0;
 Fri,  6 Dec 2024 01:05:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1527034678447828936=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/gem=5Fexec=5Fba?=
 =?utf-8?q?lancer=3A_Decrease_expected_load_value_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Brzezinka" <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Dec 2024 01:05:13 -0000
Message-ID: <173344711349.3134186.12728116186257686828@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <3w2z25pzkowhe7phqdyjdmtjxvl6osxrwal7klnsqk2b2fvhlm@ouaenirljtfi>
In-Reply-To: <3w2z25pzkowhe7phqdyjdmtjxvl6osxrwal7klnsqk2b2fvhlm@ouaenirljtfi>
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

--===============1527034678447828936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/gem_exec_balancer: Decrease expected load value (rev2)
URL   : https://patchwork.freedesktop.org/series/142150/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8139_BAT -> XEIGTPW_12255_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12255_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12255_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12255_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12255/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  


Build changes
-------------

  * IGT: IGT_8139 -> IGTPW_12255
  * Linux: xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7 -> xe-2329-777ecc16b887cadb4012cc323be01c46a23fea9f

  IGTPW_12255: 12255
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7: 1b7746f770882ce40dacae683e8e65657c40c2b7
  xe-2329-777ecc16b887cadb4012cc323be01c46a23fea9f: 777ecc16b887cadb4012cc323be01c46a23fea9f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12255/index.html

--===============1527034678447828936==
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
<tr><td><b>Series:</b></td><td>tests/intel/gem_exec_balancer: Decrease expected load value (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142150/">https://patchwork.freedesktop.org/series/142150/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12255/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12255/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8139_BAT -&gt; XEIGTPW_12255_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12255_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12255_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12255_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8139/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12255/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8139 -&gt; IGTPW_12255</li>
<li>Linux: xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7 -&gt; xe-2329-777ecc16b887cadb4012cc323be01c46a23fea9f</li>
</ul>
<p>IGTPW_12255: 12255<br />
  IGT_8139: b0c59bb94e6c990589eb6825c1436ce412804dae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2328-1b7746f770882ce40dacae683e8e65657c40c2b7: 1b7746f770882ce40dacae683e8e65657c40c2b7<br />
  xe-2329-777ecc16b887cadb4012cc323be01c46a23fea9f: 777ecc16b887cadb4012cc323be01c46a23fea9f</p>

</body>
</html>

--===============1527034678447828936==--
