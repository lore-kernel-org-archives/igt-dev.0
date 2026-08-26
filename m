Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5389AC61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 08:20:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C610E26F;
	Wed, 26 Aug 2026 08:20:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F229810E26F;
 Wed, 26 Aug 2026 08:20:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5186012260764683912=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_xe=5Fdevice=5Fsysfs_coverag?=
 =?utf-8?q?e_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 26 Aug 2026 08:20:08 -0000
Message-ID: <178773240898.85202.8020966429522918075@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260826073710.37283-1-shivtej.eknath.patil@intel.com>
In-Reply-To: <20260826073710.37283-1-shivtej.eknath.patil@intel.com>
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

--===============5186012260764683912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe_device_sysfs coverage updates
URL   : https://patchwork.freedesktop.org/series/172769/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_9075_BAT -> XEIGTPW_15736_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 9)
------------------------------

  Additional (7): bat-bmg-1 bat-lnl-1 bat-ptl-2 bat-atsm-2 bat-wcl-1 bat-nvls-2 bat-adlp-7 

Known issues
------------

  Here are the changes found in XEIGTPW_15736_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#2134]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@fbdev@info.html

  * igt@fbdev@write:
    - bat-nvls-2:         NOTRUN -> [SKIP][2] ([Intel XE#8742]) +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-1:          NOTRUN -> [SKIP][3] ([Intel XE#1466])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-1:          NOTRUN -> [SKIP][4] ([Intel XE#2233])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-nvls-2:         NOTRUN -> [SKIP][5] ([Intel XE#8757])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-ptl-2:          NOTRUN -> [SKIP][6] ([Intel XE#5765])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-wcl-1:          NOTRUN -> [SKIP][7] ([Intel XE#7245])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([i915#6077]) +30 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#1024] / [Intel XE#782] / [Intel XE#947]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          NOTRUN -> [SKIP][10] ([Intel XE#8265])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         NOTRUN -> [SKIP][11] ([Intel XE#8265])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-bmg-1:          NOTRUN -> [SKIP][12] ([Intel XE#8265])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-ptl-2:          NOTRUN -> [SKIP][13] ([Intel XE#5907])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][14] ([Intel XE#1024] / [Intel XE#784] / [Intel XE#947])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-wcl-1:          NOTRUN -> [SKIP][15] ([Intel XE#8265])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-nvls-2:         NOTRUN -> [SKIP][16] ([Intel XE#8756] / [Intel XE#8783]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          NOTRUN -> [SKIP][17] ([Intel XE#352]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-nvls-2:         NOTRUN -> [SKIP][18] ([Intel XE#8761] / [Intel XE#8773])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][19] ([Intel XE#1024] / [Intel XE#783] / [Intel XE#947])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#540]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
    - bat-lnl-1:          NOTRUN -> [SKIP][21] ([Intel XE#1470] / [Intel XE#2853])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         NOTRUN -> [SKIP][22] ([Intel XE#8755]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][23] ([Intel XE#829] / [i915#1836]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][24] ([Intel XE#780])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-nvls-2:         NOTRUN -> [SKIP][25] ([Intel XE#8758] / [Intel XE#8784]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         NOTRUN -> [SKIP][26] ([Intel XE#1024] / [Intel XE#947]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          NOTRUN -> [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          NOTRUN -> [SKIP][28] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@block-copy-compressed:
    - bat-adlp-7:         NOTRUN -> [SKIP][29] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_compute_preempt@compute-preempt:
    - bat-adlp-7:         NOTRUN -> [SKIP][30] ([Intel XE#6360]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html
    - bat-atsm-2:         NOTRUN -> [SKIP][31] ([Intel XE#8380]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][32] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_evict@evict-beng-small.html
    - bat-nvls-2:         NOTRUN -> [SKIP][33] ([Intel XE#8777]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_evict@evict-beng-small.html
    - bat-ptl-2:          NOTRUN -> [SKIP][34] ([Intel XE#5764]) +11 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-lnl-1:          NOTRUN -> [SKIP][35] ([Intel XE#6540] / [Intel XE#688]) +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-wcl-1:          NOTRUN -> [SKIP][36] ([Intel XE#7238]) +11 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         NOTRUN -> [SKIP][37] ([Intel XE#5563] / [Intel XE#688]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-nvls-2:         NOTRUN -> [SKIP][38] ([Intel XE#8744]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - bat-lnl-1:          NOTRUN -> [SKIP][39] ([Intel XE#7482]) +17 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-nvls-2:         NOTRUN -> [SKIP][40] ([Intel XE#8741]) +17 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - bat-ptl-2:          NOTRUN -> [SKIP][41] ([Intel XE#7482]) +17 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-wcl-1:          NOTRUN -> [SKIP][42] ([Intel XE#7482]) +17 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-adlp-7:         NOTRUN -> [SKIP][43] ([Intel XE#7482]) +17 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-atsm-2:         NOTRUN -> [SKIP][44] ([Intel XE#8381])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][45] ([Intel XE#288]) +32 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][46] ([Intel XE#288] / [Intel XE#5561]) +33 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - bat-adlp-7:         NOTRUN -> [SKIP][47] ([Intel XE#8376]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - bat-atsm-2:         NOTRUN -> [SKIP][48] ([Intel XE#8376]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_multi_queue@exec-sanity:
    - bat-bmg-1:          NOTRUN -> [SKIP][49] ([Intel XE#8364]) +13 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - bat-nvls-2:         NOTRUN -> [SKIP][50] ([Intel XE#8377]) +13 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - bat-atsm-2:         NOTRUN -> [SKIP][51] ([Intel XE#8364]) +13 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@many-queues-priority:
    - bat-ptl-2:          NOTRUN -> [SKIP][52] ([Intel XE#8364]) +13 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html
    - bat-wcl-1:          NOTRUN -> [SKIP][53] ([Intel XE#8364]) +13 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html

  * igt@xe_exec_multi_queue@priority:
    - bat-lnl-1:          NOTRUN -> [SKIP][54] ([Intel XE#8364]) +13 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_exec_multi_queue@priority.html
    - bat-adlp-7:         NOTRUN -> [SKIP][55] ([Intel XE#8364] / [Intel XE#8377]) +13 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_multi_queue@priority.html

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-adlp-7:         NOTRUN -> [SKIP][56] ([Intel XE#4915]) +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_exec_system_allocator@partial-munmap-cpu-fault:
    - bat-atsm-2:         NOTRUN -> [SKIP][57] ([Intel XE#8379]) +11 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_system_allocator@partial-munmap-cpu-fault.html

  * igt@xe_huc_copy@huc_copy:
    - bat-nvls-2:         NOTRUN -> [SKIP][58] ([Intel XE#8746])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         NOTRUN -> [SKIP][59] ([Intel XE#255])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          NOTRUN -> [SKIP][60] ([Intel XE#2229]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-nvls-2:         NOTRUN -> [SKIP][61] ([Intel XE#8792])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][62] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-nvls-2:         NOTRUN -> [SKIP][63] ([Intel XE#8791] / [Intel XE#8792])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-ptl-2:          NOTRUN -> [SKIP][64] ([Intel XE#5775]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-1:          NOTRUN -> [SKIP][65] ([Intel XE#2229])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         NOTRUN -> [SKIP][66] ([Intel XE#2229])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-wcl-1:          NOTRUN -> [SKIP][67] ([Intel XE#7239]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-7:         NOTRUN -> [SKIP][68] ([Intel XE#2229] / [Intel XE#5488])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-nvls-2:         NOTRUN -> [SKIP][69] ([Intel XE#8791])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          NOTRUN -> [SKIP][70] ([Intel XE#1416])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_mmap@vram.html
    - bat-adlp-7:         NOTRUN -> [SKIP][71] ([Intel XE#1008] / [Intel XE#5591])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_mmap@vram.html
    - bat-nvls-2:         NOTRUN -> [SKIP][72] ([Intel XE#8747])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_mmap@vram.html
    - bat-ptl-2:          NOTRUN -> [SKIP][73] ([Intel XE#5776])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_mmap@vram.html
    - bat-wcl-1:          NOTRUN -> [SKIP][74] ([Intel XE#7243])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-auto:
    - bat-adlp-7:         NOTRUN -> [SKIP][75] ([Intel XE#8434])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-auto.html
    - bat-atsm-2:         NOTRUN -> [SKIP][76] ([Intel XE#8434])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-auto.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][77] ([Intel XE#977])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         NOTRUN -> [SKIP][78] ([Intel XE#977])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          NOTRUN -> [SKIP][79] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          NOTRUN -> [SKIP][80] ([Intel XE#1420] / [Intel XE#7590])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][81] ([Intel XE#2838] / [Intel XE#979])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-nvls-2:         NOTRUN -> [SKIP][82] ([Intel XE#8748])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          NOTRUN -> [SKIP][83] ([Intel XE#5777] / [Intel XE#7590])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-1:          NOTRUN -> [SKIP][84] ([Intel XE#7247] / [Intel XE#7590])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][85] ([Intel XE#2838] / [Intel XE#979])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-1:          NOTRUN -> [SKIP][86] ([Intel XE#2245] / [Intel XE#7590])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-nvls-2:         NOTRUN -> [SKIP][87] ([Intel XE#8743])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          NOTRUN -> [SKIP][88] ([Intel XE#5771] / [Intel XE#7590])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-1:          NOTRUN -> [SKIP][89] ([Intel XE#7242] / [Intel XE#7590])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          NOTRUN -> [SKIP][90] ([Intel XE#7590] / [Intel XE#977])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          NOTRUN -> [SKIP][91] ([Intel XE#7590] / [Intel XE#979])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          NOTRUN -> [SKIP][92] ([Intel XE#2236] / [Intel XE#7590])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         NOTRUN -> [SKIP][93] ([Intel XE#979])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-nvls-2:         NOTRUN -> [SKIP][94] ([Intel XE#8745])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          NOTRUN -> [SKIP][95] ([Intel XE#5780] / [Intel XE#7590])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-1:          NOTRUN -> [SKIP][96] ([Intel XE#7248] / [Intel XE#7590])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         NOTRUN -> [SKIP][97] ([Intel XE#979])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-1:          NOTRUN -> [SKIP][98] ([Intel XE#3342])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238
  [Intel XE#7239]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243
  [Intel XE#7245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8379
  [Intel XE#8380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8380
  [Intel XE#8381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8381
  [Intel XE#8434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8742
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8755]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755
  [Intel XE#8756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8758]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758
  [Intel XE#8761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761
  [Intel XE#8773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773
  [Intel XE#8777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777
  [Intel XE#8783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783
  [Intel XE#8784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784
  [Intel XE#8791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791
  [Intel XE#8792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_9075 -> IGTPW_15736

  IGTPW_15736: 15736
  IGT_9075: 9075
  xe-5644-ecdf3c21a6c60cd2393b9494b0b7e0e0c8e69764: ecdf3c21a6c60cd2393b9494b0b7e0e0c8e69764

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/index.html

--===============5186012260764683912==
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
<tr><td><b>Series:</b></td><td>xe_device_sysfs coverage updates</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172769/">https://patchwork.freedesktop.org/series/172769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_9075_BAT -&gt; XEIGTPW_15736_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 9)</h2>
<p>Additional (7): bat-bmg-1 bat-lnl-1 bat-ptl-2 bat-atsm-2 bat-wcl-1 bat-nvls-2 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_15736_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8742">Intel XE#8742</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756">Intel XE#8756</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783">Intel XE#8783</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761">Intel XE#8761</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773">Intel XE#8773</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755">Intel XE#8755</a>) +13 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758">Intel XE#8758</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784">Intel XE#8784</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360">Intel XE#6360</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8380">Intel XE#8380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) +9 other tests skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8381">Intel XE#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) +3 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@exec-sanity:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-priority:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-cpu-fault:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_exec_system_allocator@partial-munmap-cpu-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8379">Intel XE#8379</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) +2 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15736/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9075 -&gt; IGTPW_15736</li>
</ul>
<p>IGTPW_15736: 15736<br />
  IGT_9075: 9075<br />
  xe-5644-ecdf3c21a6c60cd2393b9494b0b7e0e0c8e69764: ecdf3c21a6c60cd2393b9494b0b7e0e0c8e69764</p>

</body>
</html>

--===============5186012260764683912==--
