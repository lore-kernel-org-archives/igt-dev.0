Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E00FCD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 23:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A1D10E3A8;
	Thu, 28 Mar 2024 23:01:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CE210E3A8;
 Thu, 28 Mar 2024 23:01:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3618598568117038323=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_revamp_big_joiner_test_=28rev1?=
 =?utf-8?q?1=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 Mar 2024 23:01:52 -0000
Message-ID: <171166691274.1064396.18358772118159438274@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328144554.1371727-1-kunal1.joshi@intel.com>
In-Reply-To: <20240328144554.1371727-1-kunal1.joshi@intel.com>
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

--===============3618598568117038323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: revamp big joiner test (rev11)
URL   : https://patchwork.freedesktop.org/series/130572/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7790_BAT -> XEIGTPW_10944_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10944_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10944_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 0)
------------------------------

  ERROR: It appears as if the changes made in XEIGTPW_10944_BAT prevented too many machines from booting.

  Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7790 -> IGTPW_10944
  * Linux: xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8 -> xe-1011-c185a0400ae0be7c5565e9eae63d5b81f5c242ff

  IGTPW_10944: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10944/index.html
  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8: 9fa8d9d87035d810ad988bdebdce39fa0255cdb8
  xe-1011-c185a0400ae0be7c5565e9eae63d5b81f5c242ff: c185a0400ae0be7c5565e9eae63d5b81f5c242ff

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10944/index.html

--===============3618598568117038323==
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
<tr><td><b>Series:</b></td><td>revamp big joiner test (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130572/">https://patchwork.freedesktop.org/series/130572/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10944/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10944/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7790_BAT -&gt; XEIGTPW_10944_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10944_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10944_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 0)</h2>
<p>ERROR: It appears as if the changes made in XEIGTPW_10944_BAT prevented too many machines from booting.</p>
<p>Missing    (5): bat-pvc-2 bat-lnl-1 bat-dg2-oem2 bat-adlp-7 bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7790 -&gt; IGTPW_10944</li>
<li>Linux: xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8 -&gt; xe-1011-c185a0400ae0be7c5565e9eae63d5b81f5c242ff</li>
</ul>
<p>IGTPW_10944: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10944/index.html<br />
  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1010-9fa8d9d87035d810ad988bdebdce39fa0255cdb8: 9fa8d9d87035d810ad988bdebdce39fa0255cdb8<br />
  xe-1011-c185a0400ae0be7c5565e9eae63d5b81f5c242ff: c185a0400ae0be7c5565e9eae63d5b81f5c242ff</p>

</body>
</html>

--===============3618598568117038323==--
