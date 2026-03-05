Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7331F3093A
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 11:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B93A10E0A6;
	Thu,  5 Mar 2026 11:47:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4817410E0A6;
 Thu,  5 Mar 2026 11:47:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4107658535800155122=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fexplict=5Ffence?=
 =?utf-8?q?=3A_Add_Test_for_Explicit_Fencing_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "S Sebinraj" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 05 Mar 2026 11:47:35 -0000
Message-ID: <177271125527.320086.17671039811190072110@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260304114958.959180-1-s.sebinraj@intel.com>
In-Reply-To: <20260304114958.959180-1-s.sebinraj@intel.com>
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

--===============4107658535800155122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_explict_fence: Add Test for Explicit Fencing (rev7)
URL   : https://patchwork.freedesktop.org/series/160078/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8777_BAT -> XEIGTPW_14667_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14667_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14667_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 4)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_14667_BAT prevented too many machines from booting.

  Missing    (9): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-vm bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_14667_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14667/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * IGT: IGT_8777 -> IGTPW_14667
  * Linux: xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c -> xe-4657-de9130630d2dc4c0f650333605a14d475ee788e1

  IGTPW_14667: 1db4df41ade12074cd6089bde31e44257b651ef0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c: 3fe1f7a93adf8e03fb044eb57b63394afe6e139c
  xe-4657-de9130630d2dc4c0f650333605a14d475ee788e1: de9130630d2dc4c0f650333605a14d475ee788e1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14667/index.html

--===============4107658535800155122==
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
<tr><td><b>Series:</b></td><td>tests/kms_explict_fence: Add Test for Explicit Fencing (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160078/">https://patchwork.freedesktop.org/series/160078/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14667/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14667/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8777_BAT -&gt; XEIGTPW_14667_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14667_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14667_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 4)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_14667_BAT prevented too many machines from booting.</p>
<p>Missing    (9): bat-bmg-1 bat-lnl-2 bat-lnl-1 bat-ptl-vm bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14667_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8777/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14667/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8777 -&gt; IGTPW_14667</li>
<li>Linux: xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c -&gt; xe-4657-de9130630d2dc4c0f650333605a14d475ee788e1</li>
</ul>
<p>IGTPW_14667: 1db4df41ade12074cd6089bde31e44257b651ef0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8777: a50285a68dbef0fe11140adef4016a756f57b324 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4645-3fe1f7a93adf8e03fb044eb57b63394afe6e139c: 3fe1f7a93adf8e03fb044eb57b63394afe6e139c<br />
  xe-4657-de9130630d2dc4c0f650333605a14d475ee788e1: de9130630d2dc4c0f650333605a14d475ee788e1</p>

</body>
</html>

--===============4107658535800155122==--
