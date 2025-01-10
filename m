Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05D9E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 20:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B6E10F194;
	Fri, 10 Jan 2025 20:54:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFC710E535;
 Fri, 10 Jan 2025 20:54:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2134231395063531241=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/vmwgfx=3A_Check_for_3?=
 =?utf-8?q?d_support_on_context_and_surface_creation=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maaz Mombasawala" <maaz.mombasawala@broadcom.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jan 2025 20:54:38 -0000
Message-ID: <173654247894.2058254.1895685670372278543@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250110201116.1485633-1-maaz.mombasawala@broadcom.com>
In-Reply-To: <20250110201116.1485633-1-maaz.mombasawala@broadcom.com>
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

--===============2134231395063531241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/vmwgfx: Check for 3d support on context and surface creation.
URL   : https://patchwork.freedesktop.org/series/143414/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8188_BAT -> XEIGTPW_12431_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12431_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_balancer@twice-parallel-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3958])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-rebind.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][3] -> [SKIP][4] ([Intel XE#1192]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][6] ([Intel XE#1192])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8188 -> IGTPW_12431

  IGTPW_12431: e3cb9ddf7c8635a14cb569a9a7a4c93bdf1c9e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde: 00f4619246294b1de4bac42742cfef95c1f37fde

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/index.html

--===============2134231395063531241==
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
<tr><td><b>Series:</b></td><td>tests/vmwgfx: Check for 3d support on context and surface creation.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143414/">https://patchwork.freedesktop.org/series/143414/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8188_BAT -&gt; XEIGTPW_12431_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12431_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@twice-parallel-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8188/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12431/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8188 -&gt; IGTPW_12431</li>
</ul>
<p>IGTPW_12431: e3cb9ddf7c8635a14cb569a9a7a4c93bdf1c9e8a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2474-00f4619246294b1de4bac42742cfef95c1f37fde: 00f4619246294b1de4bac42742cfef95c1f37fde</p>

</body>
</html>

--===============2134231395063531241==--
