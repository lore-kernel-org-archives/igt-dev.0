Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D66EEFD20D
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 08:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FB810E70E;
	Wed, 25 Feb 2026 08:53:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775E710E70E;
 Wed, 25 Feb 2026 08:53:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4120488612540506035=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_xe=5Fexec=5Fbalancer=3A_Re?=
 =?utf-8?q?port_skip_when_test_is_unable_to_run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Feb 2026 08:53:20 -0000
Message-ID: <177200960046.284987.3809795614817598530@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260224211612.2944788-2-matthew.d.roper@intel.com>
In-Reply-To: <20260224211612.2944788-2-matthew.d.roper@intel.com>
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

--===============4120488612540506035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_exec_balancer: Report skip when test is unable to run
URL   : https://patchwork.freedesktop.org/series/162088/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8769_FULL -> XEIGTPW_14611_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14611_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14611_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14611_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@once-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@xe_exec_balancer@once-parallel-basic.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap:
    - shard-lnl:          NOTRUN -> [ABORT][2] +23 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap:
    - shard-bmg:          NOTRUN -> [ABORT][3] +23 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14611_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2887])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#6974])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6974])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#4141])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#656]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2313]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1469])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2352])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#6010] / [Intel XE#7317])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-7/igt@xe_configfs@survivability-mode.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#6665])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-1/igt@xe_eudebug_online@pagefault-read-stress.html
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6665] / [Intel XE#6681])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#6540] / [Intel XE#688])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-8/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1392]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2322]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-imm:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7136]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue-imm.html
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7136]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6874]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6874]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html

  
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7317


Build changes
-------------

  * IGT: IGT_8769 -> IGTPW_14611
  * Linux: xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b -> xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe

  IGTPW_14611: 14611
  IGT_8769: 8769
  xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b: 189174b3312588d97dc467dca7cfb9dce42ab81b
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/index.html

--===============4120488612540506035==
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
<tr><td><b>Series:</b></td><td>xe_exec_balancer: Report skip when test is unable to run</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162088/">https://patchwork.freedesktop.org/series/162088/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8769_FULL -&gt; XEIGTPW_14611_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14611_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14611_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14611_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@once-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@xe_exec_balancer@once-parallel-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap.html">ABORT</a> +23 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_exec_system_allocator@twice-mmap-remap-ro-dontunmap.html">ABORT</a> +23 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14611_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-7/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010">Intel XE#6010</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7317">Intel XE#7317</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-1/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-8/igt@xe_evict@evict-beng-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-7/igt@xe_exec_fault_mode@once-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-bmg-1/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14611/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8769 -&gt; IGTPW_14611</li>
<li>Linux: xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b -&gt; xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe</li>
</ul>
<p>IGTPW_14611: 14611<br />
  IGT_8769: 8769<br />
  xe-4607-189174b3312588d97dc467dca7cfb9dce42ab81b: 189174b3312588d97dc467dca7cfb9dce42ab81b<br />
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe</p>

</body>
</html>

--===============4120488612540506035==--
