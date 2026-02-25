Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6F9FD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1649D10E355;
	Wed, 25 Feb 2026 12:49:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E435E10E355;
 Wed, 25 Feb 2026 12:49:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6934557747838904488=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fexplict=5Ffenc?=
 =?utf-8?q?e=3A_Add_Test_for_Explicit_Fencing_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebinraj, S" <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Feb 2026 12:49:11 -0000
Message-ID: <177202375191.284988.7741301265757991612@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217075953.3220732-1-s.sebinraj@intel.com>
In-Reply-To: <20260217075953.3220732-1-s.sebinraj@intel.com>
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

--===============6934557747838904488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_explict_fence: Add Test for Explicit Fencing (rev5)
URL   : https://patchwork.freedesktop.org/series/160078/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8770_FULL -> XEIGTPW_14612_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14612_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14612_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14612_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@many-rebind:
    - shard-lnl:          NOTRUN -> [ABORT][1] +22 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-8/igt@xe_exec_compute_mode@many-rebind.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          NOTRUN -> [ABORT][2] +24 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-1/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  
New tests
---------

  New tests have been introduced between XEIGT_8770_FULL and XEIGTPW_14612_FULL:

### New IGT tests (1) ###

  * igt@kms_explicit_fence@multiplane-atomic-fence-wait:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in XEIGTPW_14612_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2325])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#306])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-0:
    - shard-lnl:          NOTRUN -> [FAIL][11] ([Intel XE#7305]) +9 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-0.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1424])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_cursor_crc@cursor-random-128x42.html
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2320])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#4422])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#4422])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#656]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1469])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2352])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-2/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1406])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_psr@pr-sprite-render.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2413])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7136]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7136]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#6874]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6874]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#5100] / [Intel XE#7322])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_sriov_admin@sched-priority-vf-write-denied:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7174])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@xe_sriov_admin@sched-priority-vf-write-denied.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322


Build changes
-------------

  * IGT: IGT_8770 -> IGTPW_14612
  * Linux: xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe -> xe-4613-5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d

  IGTPW_14612: d8cad73c8884ed4f7a4f9bc43c703a6fd5762c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8770: 8770
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe
  xe-4613-5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d: 5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/index.html

--===============6934557747838904488==
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
<tr><td><b>Series:</b></td><td>tests/kms_explict_fence: Add Test for Explicit Fencing (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160078/">https://patchwork.freedesktop.org/series/160078/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8770_FULL -&gt; XEIGTPW_14612_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14612_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14612_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14612_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@many-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-8/igt@xe_exec_compute_mode@many-rebind.html">ABORT</a> +22 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-1/igt@xe_exec_system_allocator@process-many-new-nomemset.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8770_FULL and XEIGTPW_14612_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_explicit_fence@multiplane-atomic-fence-wait:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14612_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305">Intel XE#7305</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-2/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-3/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@sched-priority-vf-write-denied:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14612/shard-lnl-1/igt@xe_sriov_admin@sched-priority-vf-write-denied.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8770 -&gt; IGTPW_14612</li>
<li>Linux: xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe -&gt; xe-4613-5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d</li>
</ul>
<p>IGTPW_14612: d8cad73c8884ed4f7a4f9bc43c703a6fd5762c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8770: 8770<br />
  xe-4609-4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe: 4caa4c7d4ff7bd4d24bca8e795773e460eb8bbfe<br />
  xe-4613-5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d: 5c29c0e4516d76d8072fe1bc65eea3b5a62d2e5d</p>

</body>
</html>

--===============6934557747838904488==--
