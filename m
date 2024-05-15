Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4E9C25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 11:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CF710E3DF;
	Wed, 15 May 2024 11:08:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E7D10E3DF;
 Wed, 15 May 2024 11:08:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3003844802841800686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_lib/gpgpu=3A_add_shader_suppor?=
 =?utf-8?q?t_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 15 May 2024 11:08:20 -0000
Message-ID: <171577130062.2118034.2611819541457384669@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
In-Reply-To: <20240515-iga64_inline_ups-v2-0-693743cb0985@intel.com>
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

--===============3003844802841800686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gpgpu: add shader support (rev2)
URL   : https://patchwork.freedesktop.org/series/133020/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_7854_BAT -> XEIGTPW_11145_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_11145_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][1] ([Intel XE#616]) -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#1856]) -> [SKIP][4] ([Intel XE#288]) +32 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][5] ([Intel XE#1856]) -> [SKIP][6] ([Intel XE#288]) +32 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][7] ([Intel XE#1856]) -> [SKIP][8] ([Intel XE#288]) +32 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
  [Intel XE#1856]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1856
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * IGT: IGT_7854 -> IGTPW_11145
  * Linux: xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123 -> xe-1290-081474425a80ae4c77e1bd839f69d349624acfcb

  IGTPW_11145: 11145
  IGT_7854: 8abb25ffe588020cf0b797d60ad1f3f9e7c0764a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123: a0c161037de0a89c0a9ea744f60099a4f94cc123
  xe-1290-081474425a80ae4c77e1bd839f69d349624acfcb: 081474425a80ae4c77e1bd839f69d349624acfcb

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/index.html

--===============3003844802841800686==
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
<tr><td><b>Series:</b></td><td>lib/gpgpu: add shader support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133020/">https://patchwork.freedesktop.org/series/133020/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7854_BAT -&gt; XEIGTPW_11145_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11145_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1856">Intel XE#1856</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1856">Intel XE#1856</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7854/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1856">Intel XE#1856</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11145/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7854 -&gt; IGTPW_11145</li>
<li>Linux: xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123 -&gt; xe-1290-081474425a80ae4c77e1bd839f69d349624acfcb</li>
</ul>
<p>IGTPW_11145: 11145<br />
  IGT_7854: 8abb25ffe588020cf0b797d60ad1f3f9e7c0764a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123: a0c161037de0a89c0a9ea744f60099a4f94cc123<br />
  xe-1290-081474425a80ae4c77e1bd839f69d349624acfcb: 081474425a80ae4c77e1bd839f69d349624acfcb</p>

</body>
</html>

--===============3003844802841800686==--
