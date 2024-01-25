Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCC4C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 05:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E676710EE82;
	Thu, 25 Jan 2024 05:55:44 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B5F10E1BC;
 Thu, 25 Jan 2024 05:55:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5553121732965050401=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_series_starting_with_=5B1/3=5D?=
 =?utf-8?q?_lib/amdgpu=3A_add_support_for_gang_cs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: vitaly.prosyak@amd.com
Date: Thu, 25 Jan 2024 05:55:43 -0000
Message-ID: <170616214313.709515.13480237695014375689@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
In-Reply-To: <20240125034413.232349-1-vitaly.prosyak@amd.com>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============5553121732965050401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] lib/amdgpu: add support for gang cs
URL   : https://patchwork.freedesktop.org/series/129148/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7691_BAT -> XEIGTPW_10586_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_10586_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_10586_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_10586_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7691/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_10586_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#1033])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7691/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033


Build changes
-------------

  * IGT: IGT_7691 -> IGTPW_10586
  * Linux: xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb -> xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413

  IGTPW_10586: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/index.html
  IGT_7691: 7691
  xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb: 0496fe20d8ed5e73ed186d293ef67e7bae4658eb
  xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413: e7da820591c355e591fe880ff1e02b85a3f1a413

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/index.html

--===============5553121732965050401==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] lib/amdgpu: add support for gang cs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129148/">https://patchwork.freedesktop.org/series/129148/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7691_BAT -&gt; XEIGTPW_10586_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_10586_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_10586_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_10586_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7691/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_10586_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7691/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10586/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7691 -&gt; IGTPW_10586</li>
<li>Linux: xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb -&gt; xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413</li>
</ul>
<p>IGTPW_10586: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10586/index.html<br />
  IGT_7691: 7691<br />
  xe-674-0496fe20d8ed5e73ed186d293ef67e7bae4658eb: 0496fe20d8ed5e73ed186d293ef67e7bae4658eb<br />
  xe-679-e7da820591c355e591fe880ff1e02b85a3f1a413: e7da820591c355e591fe880ff1e02b85a3f1a413</p>

</body>
</html>

--===============5553121732965050401==--
