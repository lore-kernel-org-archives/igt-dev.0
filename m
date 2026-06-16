Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B275CD98D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 05:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1266110E836;
	Tue, 16 Jun 2026 05:57:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0655710E837;
 Tue, 16 Jun 2026 05:57:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6181723274121014935=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_intel-ci=3A_Add_SVM=2C_mult?=
 =?utf-8?q?i=5Fqueue_tests_to_Xe_fastfeedback?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 16 Jun 2026 05:57:09 -0000
Message-ID: <178158942901.82426.6793084201575396290@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260616045925.2714-1-venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20260616045925.2714-1-venkateswara.rao.muppidi@intel.com>
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

--===============6181723274121014935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: intel-ci: Add SVM, multi_queue tests to Xe fastfeedback
URL   : https://patchwork.freedesktop.org/series/168562/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8965_BAT -> XEIGTPW_15373_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_15373_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_15373_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_15373_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - bat-atsm-2:         NOTRUN -> [SKIP][2] +30 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_15373_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_ccs@block-copy-compressed:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_compute_preempt@compute-preempt:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#6360]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#288] / [Intel XE#5561])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_multi_queue@exec-sanity:
    - bat-bmg-1:          NOTRUN -> [SKIP][6] ([Intel XE#6874]) +13 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html

  * igt@xe_exec_multi_queue@few-execs-dyn-priority:
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#6874]) +13 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-bmg-2/igt@xe_exec_multi_queue@few-execs-dyn-priority.html
    - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#6874]) +13 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_multi_queue@few-execs-dyn-priority.html

  * igt@xe_exec_multi_queue@many-queues-basic:
    - bat-ptl-1:          NOTRUN -> [SKIP][9] ([Intel XE#6874]) +13 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - bat-lnl-2:          NOTRUN -> [SKIP][10] ([Intel XE#6874]) +13 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:
    - bat-ptl-vm:         NOTRUN -> [SKIP][11] ([Intel XE#6874]) +13 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html
    - bat-lnl-1:          NOTRUN -> [SKIP][12] ([Intel XE#6874]) +13 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@many-queues-priority:
    - bat-ptl-2:          NOTRUN -> [SKIP][13] ([Intel XE#6874]) +13 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html
    - bat-wcl-1:          NOTRUN -> [SKIP][14] ([Intel XE#7257]) +13 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-wcl-2:          NOTRUN -> [SKIP][15] ([Intel XE#7257]) +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
    - bat-bmg-vm:         NOTRUN -> [SKIP][16] ([Intel XE#6874]) +13 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck:
    - bat-adlp-7:         NOTRUN -> [SKIP][17] ([Intel XE#4915]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck.html

  
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7257


Build changes
-------------

  * IGT: IGT_8965 -> IGTPW_15373

  IGTPW_15373: 15373
  IGT_8965: 8965
  xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7: c585a0a7e48a48aca80f7c0acb7294c7bf301bb7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/index.html

--===============6181723274121014935==
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
<tr><td><b>Series:</b></td><td>intel-ci: Add SVM, multi_queue tests to Xe fastfeedback</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168562/">https://patchwork.freedesktop.org/series/168562/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8965_BAT -&gt; XEIGTPW_15373_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_15373_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_15373_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_15373_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15373_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360">Intel XE#6360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@exec-sanity:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-dyn-priority:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-bmg-2/igt@xe_exec_multi_queue@few-execs-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_multi_queue@few-execs-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-ptl-vm/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-lnl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-priority:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7257">Intel XE#7257</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7257">Intel XE#7257</a>) +13 other tests skip</li>
<li>bat-bmg-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-bmg-vm/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15373/bat-adlp-7/igt@xe_exec_system_allocator@twice-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8965 -&gt; IGTPW_15373</li>
</ul>
<p>IGTPW_15373: 15373<br />
  IGT_8965: 8965<br />
  xe-5261-c585a0a7e48a48aca80f7c0acb7294c7bf301bb7: c585a0a7e48a48aca80f7c0acb7294c7bf301bb7</p>

</body>
</html>

--===============6181723274121014935==--
