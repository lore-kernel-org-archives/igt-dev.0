Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E64DC982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 20:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A418710EAB0;
	Mon, 21 Sep 2026 20:15:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919FF10EAB0;
 Mon, 21 Sep 2026 20:14:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1936094634399170204=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_tests/intel/xe=5Fwaitfence?=
 =?utf-8?q?=3A_Set_ABSTIME_flag_for_abstime_subtest?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 21 Sep 2026 20:14:50 -0000
Message-ID: <179002169058.188434.12978881964451078134@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921131933.3321706-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260921131933.3321706-1-naresh.kumar.g@intel.com>
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

--===============1936094634399170204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_waitfence: Set ABSTIME flag for abstime subtest
URL   : https://patchwork.freedesktop.org/series/174634/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9104_BAT -> XEIGTPW_15873_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15873_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15873_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15873_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - bat-bmg-3:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15873_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][7] ([Intel XE#8007]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [DMESG-WARN][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][11] -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - bat-bmg-3:          [DMESG-WARN][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * IGT: IGT_9104 -> IGTPW_15873
  * Linux: xe-5796-211407639045faaf2eeb884e801d1762b43c837c -> xe-5799-42735b6937d60963dd302128231fb74a18164a60

  IGTPW_15873: 07f64075e36cb8e24e243215bd8f31e747b295c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5796-211407639045faaf2eeb884e801d1762b43c837c: 211407639045faaf2eeb884e801d1762b43c837c
  xe-5799-42735b6937d60963dd302128231fb74a18164a60: 42735b6937d60963dd302128231fb74a18164a60

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/index.html

--===============1936094634399170204==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_waitfence: Set ABSTIME flag for abstime subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174634/">https://patchwork.freedesktop.org/series/174634/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9104_BAT -&gt; XEIGTPW_15873_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15873_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15873_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15873_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-1/igt@xe_exec_fault_mode@twice-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15873_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9104/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15873/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9104 -&gt; IGTPW_15873</li>
<li>Linux: xe-5796-211407639045faaf2eeb884e801d1762b43c837c -&gt; xe-5799-42735b6937d60963dd302128231fb74a18164a60</li>
</ul>
<p>IGTPW_15873: 07f64075e36cb8e24e243215bd8f31e747b295c5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5796-211407639045faaf2eeb884e801d1762b43c837c: 211407639045faaf2eeb884e801d1762b43c837c<br />
  xe-5799-42735b6937d60963dd302128231fb74a18164a60: 42735b6937d60963dd302128231fb74a18164a60</p>

</body>
</html>

--===============1936094634399170204==--
