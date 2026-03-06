Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95BDF0182E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 12:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803C210E1C8;
	Fri,  6 Mar 2026 12:07:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5732B10E1C8;
 Fri,  6 Mar 2026 12:07:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5258463528432352652=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Extend_compute_userenv_to_s?=
 =?utf-8?q?upport_user_passed_buffers_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 06 Mar 2026 12:07:26 -0000
Message-ID: <177279884634.326569.5325774405352024365@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260306091430.1234990-8-zbigniew.kempczynski@intel.com>
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

--===============5258463528432352652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend compute userenv to support user passed buffers (rev7)
URL   : https://patchwork.freedesktop.org/series/162170/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8782_BAT -> XEIGTPW_14688_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14688_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14688_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 13)
------------------------------

  Additional (1): bat-pvc-2 
  Missing    (2): bat-dg2-oem2 bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14688_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-pvc-2:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/bat-pvc-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14688_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][2] -> [DMESG-WARN][3] ([Intel XE#7483])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][4] ([Intel XE#7483]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8782 -> IGTPW_14688
  * Linux: xe-4665-d927c128e21f0543a0998af896d9fe22629b3532 -> xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f

  IGTPW_14688: 267b41eb311ea68833ad747a8481e9d9e5dc5239 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4665-d927c128e21f0543a0998af896d9fe22629b3532: d927c128e21f0543a0998af896d9fe22629b3532
  xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/index.html

--===============5258463528432352652==
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
<tr><td><b>Series:</b></td><td>Extend compute userenv to support user passed buffers (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162170/">https://patchwork.freedesktop.org/series/162170/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8782_BAT -&gt; XEIGTPW_14688_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14688_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14688_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Additional (1): bat-pvc-2 <br />
  Missing    (2): bat-dg2-oem2 bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14688_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/bat-pvc-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14688_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8782/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14688/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8782 -&gt; IGTPW_14688</li>
<li>Linux: xe-4665-d927c128e21f0543a0998af896d9fe22629b3532 -&gt; xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f</li>
</ul>
<p>IGTPW_14688: 267b41eb311ea68833ad747a8481e9d9e5dc5239 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4665-d927c128e21f0543a0998af896d9fe22629b3532: d927c128e21f0543a0998af896d9fe22629b3532<br />
  xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f</p>

</body>
</html>

--===============5258463528432352652==--
