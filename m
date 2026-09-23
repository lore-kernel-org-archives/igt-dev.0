Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35CDC98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 03:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D45810E7BD;
	Wed, 23 Sep 2026 03:07:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA9410E052;
 Wed, 23 Sep 2026 03:06:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2903278498953169829=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_tests/amdgpu/amd=5Fhotplug?=
 =?utf-8?q?=3A_use_SUSPEND=5FSTATE=5FFREEZE_for_basic-suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 23 Sep 2026 03:06:53 -0000
Message-ID: <179013281344.195630.3389860668761658819@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260922144258.1618587-1-aurabindo.pillai@amd.com>
In-Reply-To: <20260922144258.1618587-1-aurabindo.pillai@amd.com>
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

--===============2903278498953169829==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu/amd_hotplug: use SUSPEND_STATE_FREEZE for basic-suspend
URL   : https://patchwork.freedesktop.org/series/174719/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9109_BAT -> XEIGTPW_15886_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_15886_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#9331])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#9331])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@fault:
    - bat-bmg-1:          [DMESG-WARN][5] ([Intel XE#9331]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-1/igt@xe_exec_system_allocator@fault.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-1/igt@xe_exec_system_allocator@fault.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [DMESG-WARN][7] ([Intel XE#9331]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  
  [Intel XE#9331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331


Build changes
-------------

  * IGT: IGT_9109 -> IGTPW_15886
  * Linux: xe-5807-3413ca5893855693d3cc12697713842547261439 -> xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017

  IGTPW_15886: e1d6d93a954ad74e466944f157665c9ace354606 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5807-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439
  xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017: 7cdd31de20cd320f9a1539bb5c3949275326f017

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/index.html

--===============2903278498953169829==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu/amd_hotplug: use SUSPEND_STATE_FREEZE for basic-suspend</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174719/">https://patchwork.freedesktop.org/series/174719/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9109_BAT -&gt; XEIGTPW_15886_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15886_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-1/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@fault:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-1/igt@xe_exec_system_allocator@fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9109/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9331">Intel XE#9331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15886/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9109 -&gt; IGTPW_15886</li>
<li>Linux: xe-5807-3413ca5893855693d3cc12697713842547261439 -&gt; xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017</li>
</ul>
<p>IGTPW_15886: e1d6d93a954ad74e466944f157665c9ace354606 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9109: 65f84b280be2caf8ce376295d97987a808affdee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5807-3413ca5893855693d3cc12697713842547261439: 3413ca5893855693d3cc12697713842547261439<br />
  xe-5810-7cdd31de20cd320f9a1539bb5c3949275326f017: 7cdd31de20cd320f9a1539bb5c3949275326f017</p>

</body>
</html>

--===============2903278498953169829==--
