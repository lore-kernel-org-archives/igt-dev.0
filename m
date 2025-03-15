Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204D5C282EC
	for <igt-dev@archiver.kernel.org>; Sat, 15 Mar 2025 02:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA6110E386;
	Sat, 15 Mar 2025 02:23:02 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8844F10E386;
 Sat, 15 Mar 2025 02:23:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5649624209289244104=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_lib/iga64=3A_miscelanious_i?=
 =?utf-8?q?mprovements?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andrzej Hajda" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sat, 15 Mar 2025 02:23:01 -0000
Message-ID: <174200538155.38253.7013097256640152001@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
In-Reply-To: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
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

--===============5649624209289244104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/iga64: miscelanious improvements
URL   : https://patchwork.freedesktop.org/series/146324/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8275_BAT -> XEIGTPW_12782_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8275_BAT and XEIGTPW_12782_BAT:

### New IGT tests (96) ###

  * igt@xe_compute@compute-square:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_debugfs@base:
    - Statuses : 9 pass(s)
    - Exec time: [0.00] s

  * igt@xe_debugfs@forcewake:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_debugfs@gt:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.50] s

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_evict@evict-beng-small:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 7.19] s

  * igt@xe_evict@evict-beng-small-cm:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.37] s

  * igt@xe_evict@evict-beng-small-external:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 7.11] s

  * igt@xe_evict@evict-beng-small-external-cm:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.51] s

  * igt@xe_evict@evict-beng-small-multi-vm:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 13.78] s

  * igt@xe_evict@evict-small:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 7.12] s

  * igt@xe_evict@evict-small-cm:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.55] s

  * igt@xe_evict@evict-small-external:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 5.43] s

  * igt@xe_evict@evict-small-external-cm:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 7.17] s

  * igt@xe_evict@evict-small-multi-vm:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 15.64] s

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-cm-virtual-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.55] s

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-parallel-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-parallel-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-parallel-userptr-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-virtual-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-virtual-userptr:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_exec_basic@no-exec-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_exec_basic@no-exec-userptr-invalidate:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-basic:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-basic-defer-bind:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-basic-defer-mmap:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_exec_basic@twice-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_exec_basic@twice-userptr:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_basic@twice-userptr-invalidate:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.06] s

  * igt@xe_exec_basic@twice-userptr-rebind:
    - Statuses : 9 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_compute_mode@twice-basic:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_compute_mode@twice-rebind:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_exec_compute_mode@twice-userptr:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - Statuses : 8 pass(s)
    - Exec time: [1.08, 1.91] s

  * igt@xe_exec_compute_mode@twice-userptr-rebind:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_exec_fault_mode@many-basic:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@xe_exec_fault_mode@twice-basic:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_fault_mode@twice-rebind:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_fault_mode@twice-userptr:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@xe_exec_reset@close-fd-no-exec:
    - Statuses : 8 pass(s)
    - Exec time: [0.69, 1.37] s

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - Statuses : 8 pass(s)
    - Exec time: [0.68, 1.37] s

  * igt@xe_exec_reset@virtual-close-fd-no-exec:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.43] s

  * igt@xe_exec_threads@threads-basic:
    - Statuses : 8 pass(s)
    - Exec time: [0.14, 0.45] s

  * igt@xe_exec_threads@threads-mixed-basic:
    - Statuses : 8 pass(s)
    - Exec time: [0.12, 0.41] s

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - Statuses : 8 pass(s)
    - Exec time: [0.12, 0.35] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - Statuses : 8 pass(s)
    - Exec time: [0.12, 0.65] s

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - Statuses : 8 pass(s)
    - Exec time: [0.10, 0.68] s

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - Statuses : 8 pass(s)
    - Exec time: [0.61, 1.13] s

  * igt@xe_huc_copy@huc_copy:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@xe_mmap@system:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_mmap@vram:
    - Statuses : 5 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_mmap@vram-system:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 1.42] s

  * igt@xe_prime_self_import@basic-with_one_bo:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 3.86] s

  * igt@xe_query@query-config:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-engines:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-hwconfig:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_query@query-invalid-query:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-invalid-size:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-mem-usage:
    - Statuses : 8 pass(s)
    - Exec time: [0.0] s

  * igt@xe_query@query-topology:
    - Statuses : 8 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_vm@large-split-binds-268435456:
    - Statuses : 8 pass(s)
    - Exec time: [0.01, 0.05] s

  * igt@xe_vm@munmap-style-unbind-end:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@munmap-style-unbind-front:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@munmap-style-unbind-userptr-end:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-end:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@munmap-style-unbind-userptr-one-partial:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_vm@shared-pde-page:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.09] s

  * igt@xe_vm@shared-pde2-page:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.12] s

  * igt@xe_vm@shared-pde3-page:
    - Statuses : 8 pass(s)
    - Exec time: [0.02, 0.10] s

  * igt@xe_vm@shared-pte-page:
    - Statuses : 8 pass(s)
    - Exec time: [0.03, 0.10] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_12782_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8275/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8275 -> IGTPW_12782

  IGTPW_12782: 12782
  IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2824-deccd667e475e826a1cdd91ab9aec4f897bd30c4: deccd667e475e826a1cdd91ab9aec4f897bd30c4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/index.html

--===============5649624209289244104==
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
<tr><td><b>Series:</b></td><td>lib/iga64: miscelanious improvements</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146324/">https://patchwork.freedesktop.org/series/146324/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8275_BAT -&gt; XEIGTPW_12782_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8275_BAT and XEIGTPW_12782_BAT:</p>
<h3>New IGT tests (96)</h3>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@base:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@forcewake:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@gt:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 7.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 7.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 13.78] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 7.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 5.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 7.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 15.64] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-invalidate:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-bind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic-defer-mmap:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-rebind:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [1.08, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd-no-exec:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.69, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.68, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd-no-exec:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.43] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.14, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.12, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.12, 0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.12, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.10, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.61, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>Statuses : 5 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram-system:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 3.86] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-config:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-hwconfig:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-query:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-size:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-mem-usage:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-topology:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.01, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-end:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-end:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-end:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-one-partial:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde-page:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde3-page:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.02, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.03, 0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12782_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8275/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8275 -&gt; IGTPW_12782</li>
</ul>
<p>IGTPW_12782: 12782<br />
  IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2824-deccd667e475e826a1cdd91ab9aec4f897bd30c4: deccd667e475e826a1cdd91ab9aec4f897bd30c4</p>

</body>
</html>

--===============5649624209289244104==--
