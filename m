Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912B7C982F0
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 20:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B54010E777;
	Mon, 21 Sep 2026 20:33:42 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAB510E777;
 Mon, 21 Sep 2026 20:32:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9027892941243062796=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_lib/igt=5Fcore=3A_Make_buil?=
 =?utf-8?q?d_reproducible_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 20:32:56 -0000
Message-ID: <179002277618.188435.1511491457380163586@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
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

--===============9027892941243062796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_core: Make build reproducible (rev5)
URL   : https://patchwork.freedesktop.org/series/173723/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9104_BAT -> XEIGTPW_15874_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15874_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15874_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15874_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_system_allocator@madvise-atomic-inc:
    - bat-bmg-vm:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - bat-bmg-3:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15874_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-wcl-2:          [PASS][7] -> [FAIL][8] ([Intel XE#9103])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-wcl-2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-wcl-2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-wcl-1:          [PASS][9] -> [FAIL][10] ([Intel XE#9115])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-wcl-1/igt@xe_waitfence@reltime.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-wcl-1/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][11] ([Intel XE#8007]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - bat-bmg-1:          [DMESG-WARN][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [DMESG-WARN][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - bat-bmg-3:          [DMESG-WARN][17] -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * IGT: IGT_9104 -> IGTPW_15874
  * Linux: xe-5796-211407639045faaf2eeb884e801d1762b43c837c -> xe-5799-42735b6937d60963dd302128231fb74a18164a60

  IGTPW_15874: 6652228e6112eff7ccbb18f5985b9a1413dd29e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5796-211407639045faaf2eeb884e801d1762b43c837c: 211407639045faaf2eeb884e801d1762b43c837c
  xe-5799-42735b6937d60963dd302128231fb74a18164a60: 42735b6937d60963dd302128231fb74a18164a60

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/index.html

--===============9027892941243062796==
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
<tr><td><b>Series:</b></td><td>lib/igt_core: Make build reproducible (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173723/">https://patchwork.freedesktop.org/series/173723/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9104_BAT -&gt; XEIGTPW_15874_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15874_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15874_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15874_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-atomic-inc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-vm/igt@xe_exec_system_allocator@madvise-atomic-inc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15874_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-wcl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-wcl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-wcl-1/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-wcl-1/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15874/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9104 -&gt; IGTPW_15874</li>
<li>Linux: xe-5796-211407639045faaf2eeb884e801d1762b43c837c -&gt; xe-5799-42735b6937d60963dd302128231fb74a18164a60</li>
</ul>
<p>IGTPW_15874: 6652228e6112eff7ccbb18f5985b9a1413dd29e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5796-211407639045faaf2eeb884e801d1762b43c837c: 211407639045faaf2eeb884e801d1762b43c837c<br />
  xe-5799-42735b6937d60963dd302128231fb74a18164a60: 42735b6937d60963dd302128231fb74a18164a60</p>

</body>
</html>

--===============9027892941243062796==--
