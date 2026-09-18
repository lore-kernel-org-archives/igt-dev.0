Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FCCC982D7
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 19:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB0010E98E;
	Fri, 18 Sep 2026 19:06:24 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9623810E98E;
 Fri, 18 Sep 2026 19:05:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2345804049485762735=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Improve_LOBF_reliability_wi?=
 =?utf-8?q?th_low_RR_retry_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 18 Sep 2026 19:05:38 -0000
Message-ID: <178975833860.181279.17087004797891040123@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918142022.4096908-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20260918142022.4096908-1-ramanaidu.naladala@intel.com>
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

--===============2345804049485762735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve LOBF reliability with low RR retry (rev2)
URL   : https://patchwork.freedesktop.org/series/173534/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_9102_BAT -> XEIGTPW_15866_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15866_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15866_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15866_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vrr@lobf-dc3co:
    - bat-wcl-2:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-wcl-2/igt@kms_vrr@lobf-dc3co.html
    - bat-wcl-1:          NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-wcl-1/igt@kms_vrr@lobf-dc3co.html
    - bat-adlp-7:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-adlp-7/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@twice-free:
    - bat-bmg-1:          [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15866_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#8762] / [Intel XE#9069])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_vrr@lobf:
    - bat-bmg-2:          NOTRUN -> [SKIP][10] ([Intel XE#3419]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-2/igt@kms_vrr@lobf.html
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#2168])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-adlp-7/igt@kms_vrr@lobf.html
    - bat-bmg-1:          NOTRUN -> [SKIP][12] ([Intel XE#2168] / [Intel XE#7444])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@kms_vrr@lobf.html
    - bat-lnl-2:          NOTRUN -> [SKIP][13] ([Intel XE#2235]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-2/igt@kms_vrr@lobf.html
    - bat-ptl-2:          NOTRUN -> [SKIP][14] ([Intel XE#5950] / [Intel XE#9277])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@kms_vrr@lobf.html
    - bat-lnl-1:          NOTRUN -> [SKIP][15] ([Intel XE#1499] / [Intel XE#9271])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-1/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf-dc3co:
    - bat-atsm-2:         NOTRUN -> [SKIP][16] ([Intel XE#1024] / [Intel XE#947]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-atsm-2/igt@kms_vrr@lobf-dc3co.html
    - bat-bmg-1:          NOTRUN -> [SKIP][17] ([Intel XE#8397])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@kms_vrr@lobf-dc3co.html
    - bat-nvls-1:         NOTRUN -> [SKIP][18] ([Intel XE#8935] / [Intel XE#9076]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-nvls-1/igt@kms_vrr@lobf-dc3co.html
    - bat-nvls-2:         NOTRUN -> [SKIP][19] ([Intel XE#8755]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-nvls-2/igt@kms_vrr@lobf-dc3co.html
    - bat-ptl-2:          NOTRUN -> [SKIP][20] ([Intel XE#8397])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@kms_vrr@lobf-dc3co.html
    - bat-ptl-1:          NOTRUN -> [SKIP][21] ([Intel XE#5766]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-1/igt@kms_vrr@lobf-dc3co.html
    - bat-lnl-1:          NOTRUN -> [SKIP][22] ([Intel XE#8397])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-1/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - bat-ptl-2:          NOTRUN -> [SKIP][23] ([Intel XE#7638] / [Intel XE#9277])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@kms_vrr@lobf@pipe-a-edp-1.html
    - bat-lnl-1:          NOTRUN -> [SKIP][24] ([Intel XE#7638] / [Intel XE#9271])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@xe_waitfence@engine:
    - bat-ptl-2:          [PASS][25] -> [FAIL][26] ([Intel XE#9109])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-ptl-2/igt@xe_waitfence@engine.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [DMESG-WARN][27] -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][29] -> [PASS][30] +2 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  * igt@xe_waitfence@engine:
    - bat-wcl-2:          [FAIL][31] ([Intel XE#9103]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-wcl-2/igt@xe_waitfence@engine.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-wcl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5950
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8755]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#8935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8935
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9076
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103
  [Intel XE#9109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947


Build changes
-------------

  * IGT: IGT_9102 -> IGTPW_15866
  * Linux: xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392 -> xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c

  IGTPW_15866: b5680df75e7c22fab16cd43b71e48fef6daebfcf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9102: d7e81cbe807db27613dd3bc96f4e46262e75569d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392: 6ef00cbe08bb0ce4a59e9ace88b107d424431392
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/index.html

--===============2345804049485762735==
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
<tr><td><b>Series:</b></td><td>Improve LOBF reliability with low RR retry (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173534/">https://patchwork.freedesktop.org/series/173534/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9102_BAT -&gt; XEIGTPW_15866_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15866_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15866_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15866_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-wcl-2/igt@kms_vrr@lobf-dc3co.html">SKIP</a> +1 other test skip</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-wcl-1/igt@kms_vrr@lobf-dc3co.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-adlp-7/igt@kms_vrr@lobf-dc3co.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15866_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +1 other test skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-adlp-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +1 other test skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5950">Intel XE#5950</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-atsm-2/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-nvls-1/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8935">Intel XE#8935</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9076">Intel XE#9076</a>) +1 other test skip</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-nvls-2/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755">Intel XE#8755</a>) +1 other test skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-1/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-1/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@kms_vrr@lobf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638">Intel XE#7638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-lnl-1/igt@kms_vrr@lobf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638">Intel XE#7638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-ptl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-ptl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9109">Intel XE#9109</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9102/bat-wcl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15866/bat-wcl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9102 -&gt; IGTPW_15866</li>
<li>Linux: xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392 -&gt; xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c</li>
</ul>
<p>IGTPW_15866: b5680df75e7c22fab16cd43b71e48fef6daebfcf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9102: d7e81cbe807db27613dd3bc96f4e46262e75569d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5780-6ef00cbe08bb0ce4a59e9ace88b107d424431392: 6ef00cbe08bb0ce4a59e9ace88b107d424431392<br />
  xe-5781-2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c: 2c43c8e6bbbe54f755b8e5c86d582f78159e7a2c</p>

</body>
</html>

--===============2345804049485762735==--
