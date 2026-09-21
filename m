Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F1BC982DE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 06:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526A610E225;
	Mon, 21 Sep 2026 06:50:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52CF10E225;
 Mon, 21 Sep 2026 06:49:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0480881292405840938=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/kms=5Fcolor=3A_Add_su?=
 =?utf-8?q?pport_for_background_color_testing=2E_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 06:49:54 -0000
Message-ID: <178997339465.185577.7007374482886922656@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917191835.977425-1-swati2.sharma@intel.com>
In-Reply-To: <20260917191835.977425-1-swati2.sharma@intel.com>
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

--===============0480881292405840938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color: Add support for background color testing. (rev6)
URL   : https://patchwork.freedesktop.org/series/167119/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9103_BAT -> XEIGTPW_15868_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15868_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15868_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15868_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@madvise-atomic-inc:
    - bat-bmg-vm:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html

  * igt@xe_exec_system_allocator@twice-free:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@fault:
    - bat-bmg-1:          [DMESG-WARN][5] ([Intel XE#9331]) -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_system_allocator@fault.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_system_allocator@fault.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-2:          [DMESG-WARN][7] ([Intel XE#9331]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-2/igt@xe_exec_system_allocator@many-execqueues-free.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-2/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-vm:         [DMESG-WARN][9] ([Intel XE#9331]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-vm/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-vm/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15868_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-bmg-1:          [PASS][11] -> [DMESG-WARN][12] ([Intel XE#9331])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [PASS][13] -> [TIMEOUT][14] ([Intel XE#9152])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-ptl-2/igt@xe_waitfence@abstime.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-ptl-2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [DMESG-WARN][15] ([Intel XE#9331]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][17] ([Intel XE#9331]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  
  [Intel XE#9152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * IGT: IGT_9103 -> IGTPW_15868
  * Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -> xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf

  IGTPW_15868: 9f7ec1b16076bea142f4b3bba6e5ba8222769023 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/index.html

--===============0480881292405840938==
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
<tr><td><b>Series:</b></td><td>tests/kms_color: Add support for background color testing. (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167119/">https://patchwork.freedesktop.org/series/167119/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9103_BAT -&gt; XEIGTPW_15868_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15868_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15868_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15868_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@madvise-atomic-inc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-2/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-2/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-vm/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-vm/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15868_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9152">Intel XE#9152</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9103/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15868/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9103 -&gt; IGTPW_15868</li>
<li>Linux: xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c -&gt; xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf</li>
</ul>
<p>IGTPW_15868: 9f7ec1b16076bea142f4b3bba6e5ba8222769023 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c<br />
  xe-5791-7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf: 7b7c73e7898b9ae6d5d2d849fe66c44db9b74caf</p>

</body>
</html>

--===============0480881292405840938==--
