Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360F1E77198
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 22:56:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E986210EB60;
	Tue,  7 Jan 2025 22:56:43 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8035710EB60;
 Tue,  7 Jan 2025 22:56:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0858840576074528620=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_dsc+bigjoiner_subtest_?=
 =?utf-8?q?=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 07 Jan 2025 22:56:42 -0000
Message-ID: <173629060252.1001743.15541564029108518095@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250107185709.116756-1-swati2.sharma@intel.com>
In-Reply-To: <20250107185709.116756-1-swati2.sharma@intel.com>
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

--===============0858840576074528620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add dsc+bigjoiner subtest (rev4)
URL   : https://patchwork.freedesktop.org/series/128266/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8179_BAT -> XEIGTPW_12396_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_12396_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_12396_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_12396_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_12396_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3958])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#3868])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@render@render-ymajor-256:
    - bat-adlp-vf:        [DMESG-WARN][7] ([Intel XE#3958]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html

  
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958


Build changes
-------------

  * IGT: IGT_8179 -> IGTPW_12396
  * Linux: xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571 -> xe-2451-dbd476153d41352ad6022088be16301051b9bce7

  IGTPW_12396: 6f3ec890d8aa7505c2a20cfd76b6ecea3ae25590 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571: 89042e0bb417f4d67280e1d7fa9bbcca51734571
  xe-2451-dbd476153d41352ad6022088be16301051b9bce7: dbd476153d41352ad6022088be16301051b9bce7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/index.html

--===============0858840576074528620==
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
<tr><td><b>Series:</b></td><td>Add dsc+bigjoiner subtest (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128266/">https://patchwork.freedesktop.org/series/128266/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8179_BAT -&gt; XEIGTPW_12396_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_12396_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_12396_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_12396_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12396_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@render@render-ymajor-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8179/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12396/bat-adlp-vf/igt@xe_intel_bb@render@render-ymajor-256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8179 -&gt; IGTPW_12396</li>
<li>Linux: xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571 -&gt; xe-2451-dbd476153d41352ad6022088be16301051b9bce7</li>
</ul>
<p>IGTPW_12396: 6f3ec890d8aa7505c2a20cfd76b6ecea3ae25590 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8179: 183b33f81365dd4a57fe3100a13d3fb13788d158 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2447-89042e0bb417f4d67280e1d7fa9bbcca51734571: 89042e0bb417f4d67280e1d7fa9bbcca51734571<br />
  xe-2451-dbd476153d41352ad6022088be16301051b9bce7: dbd476153d41352ad6022088be16301051b9bce7</p>

</body>
</html>

--===============0858840576074528620==--
