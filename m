Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E80D6AB10
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 21:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23DB10E12D;
	Thu,  2 Apr 2026 21:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FreqJndm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01BA10E080;
 Thu,  2 Apr 2026 21:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775164923; x=1806700923;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=sglPD8Qrs+ap/c+cg3A8JTkhsFCyoklthbLiVXAzAZk=;
 b=FreqJndmYoSt8mLRBy+MAuFrz0TqdR7Pdzob/ryk0uTZvb4nSH9whTnd
 cJ1Z5z3Fc33UOMUVm8vIUIyhBlqqHNd0+NphwTYA3w+PBfS2BLgj4Rm2U
 8tOPJ2kqW89guWtKqu6V5crvGomEl+1jpHOflsl7zPnsqXa7mqSxb6LAn
 PCpGC+OGSNKqqQadnGcIEwPbz5Zyw7Lb+5voQi/Rr8JmGZwXfYn7f9Lku
 wmm08Rg9NSZUzMC4kWl32BBZhn2RJgcAXTcpxrfC83UAPrW8RCv6B4elp
 QL4e5AO/MQ/WcrD8njj9eAm7t8y6/e91wM32OcSf0S3iEaLq84S4vFZLV g==;
X-CSE-ConnectionGUID: GqOLdp3AQfy+tGRDtR2FGQ==
X-CSE-MsgGUID: 1jA2IEscTS+aF5V+hfqFSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86936157"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="86936157"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:22:02 -0700
X-CSE-ConnectionGUID: m4AXdEy4TCiEWGAkU3I9tw==
X-CSE-MsgGUID: 8AVKRnyNQbO8K5xkwSPGzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="265017508"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 14:22:01 -0700
Date: Thu, 2 Apr 2026 23:21:58 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
cc: I915-ci-infra@lists.freedesktop.org, 
 =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_kms?=
 =?UTF-8?Q?=5Fflip=3A_limit_number_of_subtests_run_=28rev12=29?=
In-Reply-To: <177493968053.415443.16672918743653766876@a3b018990fe9>
Message-ID: <0f0829ae-6656-3b8b-a722-507c3e2bd7c3@intel.com>
References: <20260330075508.1003899-1-michal.grzelak@intel.com>
 <177493968053.415443.16672918743653766876@a3b018990fe9>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-294391459-1775164921=:1805036"
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-294391459-1775164921=:1805036
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 31 Mar 2026, Patchwork wrote:
> Patch Details
> Series:
> kms_flip: limit number of subtests run (rev12)
> URL:
> https://patchwork.freedesktop.org/series/161389/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14881/index.html
>                                                             CI Bug Log - changes from CI_DRM_18252_full -> IGTPW_14881_full
> 
> SUMMARY
> 
> FAILURE
> 
> Serious unknown changes coming with IGTPW_14881_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14881_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14881/index.html
> 
> PARTICIPATING HOSTS (10 -> 10)
> 
> No changes in participating hosts
> 
> POSSIBLE NEW ISSUES
> 
> Here are the unknown changes that may have been introduced in IGTPW_14881_full:
>
>   IGT changes
>
>     Possible regressions
>
>  * 
>
>     igt@gem_softpin@noreloc-s3:
>
>      +  shard-snb: PASS -> ABORT
>      +  shard-tglu: PASS -> ABORT
>  * 
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>      +  shard-tglu-1: PASS -> ABORT +1 other test abort
>  *

<0> [355.549759] ---------------------------------
<4> [355.550726] ------------[ cut here ]------------
<2> [355.550731] kernel BUG at ./drivers/gpu/drm/i915/i915_vma.h:388!
<4> [355.550748] Oops: invalid opcode: 0000 [#1] SMP NOPTI
<4> [355.550753] CPU: 4 UID: 0 PID: 130 Comm: kworker/4:1H Tainted: G S   U  W    L      7.0.0-rc6-CI_DRM_18252-g247b271f2f09+ #1 PREEMPT(lazy) 
<4> [355.550760] Tainted: [S]=CPU_OUT_OF_SPEC, [U]=USER, [W]=WARN, [L]=SOFTLOCKUP
<4> [355.550763] Hardware name: Intel(R) Client Systems NUC11TNHi5/NUC11TNBi5, BIOS TNTGL357.0042.2020.1221.1743 12/21/2020
<4> [355.550768] Workqueue: i915_cleanup intel_atomic_cleanup_work [i915]
<4> [355.550959] RIP: 0010:intel_fb_unpin_vma+0x1c2/0x1d0 [i915]
<4> [355.551128] Code: 00 48 c7 c2 00 b8 1d a1 48 8d 3d 00 00 00 00 e8 44 d1 7b e0 bf 01 00 00 00 e8 ca 77 7b e0 31 f6 bf 09 00 00 00 e8 ce 7e 5a e0 <0f> 0b 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90
<4> [355.551135] RSP: 0018:ffffc900014e7d60 EFLAGS: 00010246
<4> [355.551139] RAX: 0000000000000000 RBX: ffff888109771c00 RCX: 0000000000000000
<4> [355.551143] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
<4> [355.551146] RBP: ffffc900014e7d60 R08: 0000000000000000 R09: 0000000000000000
<4> [355.551149] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8881220b5c00
<4> [355.551152] R13: ffff888120add000 R14: ffff8881411aa000 R15: ffff8881039ef9c0
<4> [355.551156] FS:  0000000000000000(0000) GS:ffff88851c097000(0000) knlGS:0000000000000000
<4> [355.551160] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [355.551163] CR2: 00007843d488e6f4 CR3: 000000010c6e5005 CR4: 0000000000f72ef0
<4> [355.551166] PKRU: 55555554
<4> [355.551169] Call Trace:
<4> [355.551171]  <TASK>
<4> [355.551173]  intel_plane_unpin_fb+0x45/0xb0 [i915]
<4> [355.551338]  intel_cleanup_plane_fb+0x51/0x70 [i915]
<4> [355.551500]  drm_atomic_helper_cleanup_planes+0x4c/0x80
<4> [355.551509]  intel_atomic_cleanup_work+0xaf/0x130 [i915]
<4> [355.551684]  process_one_work+0x239/0x760
<4> [355.551691]  worker_thread+0x200/0x3f0
<4> [355.551695]  ? __pfx_worker_thread+0x10/0x10
<4> [355.551699]  kthread+0x10d/0x150
<4> [355.551704]  ? __pfx_kthread+0x10/0x10
<4> [355.551708]  ret_from_fork+0x3d4/0x480
<4> [355.551713]  ? __pfx_kthread+0x10/0x10
<4> [355.551717]  ret_from_fork_asm+0x1a/0x30
<4> [355.551724]  </TASK>
<4> [355.551726] Modules linked in: snd_hda_intel i915 snd_hda_codec_intelhdmi snd_hda_codec_hdmi prime_numbers drm_buddy ttm drm_display_helper cec rc_core i2c_algo_bit kunit tps6598x typec intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common cmdlinepart spi_nor x86_pkg_temp_thermal ee1004 mtd mei_pxp mei_hdcp intel_powerclamp wmi_bmof coretemp kvm_intel kvm snd_intel_dspcfg irqbypass snd_hda_codec ghash_clmulni_intel snd_hda_core aesni_intel snd_hwdep snd_pcm rapl intel_cstate snd_timer spi_intel_pci spi_intel video igc i2c_i801 snd i2c_mux mei_me idma64 soundcore i2c_smbus mei thunderbolt igen6_edac binfmt_misc serial_multi_instantiate intel_pmc_core pmt_telemetry pmt_discovery pmt_class nls_iso8859_1 wmi intel_pmc_ssram_telemetry intel_vsec pinctrl_tigerlake acpi_pad acpi_tad dm_multipath msr nvme_fabrics fuse efi_pstore nfnetlink autofs4 [last unloaded: i915]

This is unrelated to the change done since the test is only changing
suspend tests from kms_flip.

BR,
Michał

>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
>
>      +  shard-tglu-1: PASS -> DMESG-WARN
> 
> NEW TESTS
> 
> New tests have been introduced between CI_DRM_18252_full and IGTPW_14881_full:
>
>   New IGT tests (17)
>
>  * 
>
>     igt@kms_flip@2x-flip-vs-cursor-legacy:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@basic-wc:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@blit-noreloc-keep-cache:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@cursor-onscreen-32x10:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@fbcpsr-shrfb-scaledprimary:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@hang-busy:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@invalid-balancer:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@most-busy-check-all:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@psr-2p-scndscrn-cur-indfb-draw-pwrite:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@random-ccs-data-4-tiled-lnl-ccs:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@read-crc-frame-sequence:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@y-tiled-mc-ccs-to-vebox-y-tiled:
>
>      +  Statuses :
>      +  Exec time: [None] s
>  * 
>
>     igt@kms_flip@yf-tiled-8bpp-rotate-90:
>
>      +  Statuses :
>      +  Exec time: [None] s
> 
> KNOWN ISSUES
> 
> Here are the changes found in IGTPW_14881_full that come from known issues:
>
>   IGT changes
>
>     Issues hit
>
>  * 
>
>     igt@api_intel_bb@blit-reloc-purge-cache:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#8411)
>  * 
>
>     igt@device_reset@cold-reset-bound:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#11078)
>      +  shard-rkl: NOTRUN -> SKIP (i915#11078)
>  * 
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#6335)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#6335)
>      +  shard-rkl: NOTRUN -> SKIP (i915#6335) +1 other test skip
>  * 
>
>     igt@gem_ctx_persistence@heartbeat-hostile:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#8555) +1 other test skip
>  * 
>
>     igt@gem_ctx_persistence@heartbeat-stop:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8555)
>  * 
>
>     igt@gem_ctx_persistence@hostile:
>
>      +  shard-snb: NOTRUN -> SKIP (i915#1099) +1 other test skip
>  * 
>
>     igt@gem_ctx_sseu@engines:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#280)
>  * 
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#280)
>      +  shard-dg1: NOTRUN -> SKIP (i915#280)
>  * 
>
>     igt@gem_exec_balancer@bonded-true-hang:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4812)
>  * 
>
>     igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#4525)
>  * 
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6334) +1 other test skip
>  * 
>
>     igt@gem_exec_flush@basic-uc-pro-default:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>  * 
>
>     igt@gem_exec_flush@basic-wb-rw-default:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +1 other test skip
>  * 
>
>     igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3281) +7 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>  * 
>
>     igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3281) +3 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3281) +2 other tests skip
>  * 
>
>     igt@gem_exec_suspend@basic-s3:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13196 / i915#13356) +1 other test incomplete
>  * 
>
>     igt@gem_exec_suspend@basic-s3-devices:
>
>      +  shard-rkl: PASS -> ABORT (i915#15131)
>  * 
>
>     igt@gem_exec_suspend@basic-s3-devices@smem:
>
>      +  shard-rkl: PASS -> ABORT (i915#15542)
>  * 
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4860)
>  * 
>
>     igt@gem_huc_copy@huc-copy:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#2190)
>      +  shard-tglu: NOTRUN -> SKIP (i915#2190)
>  * 
>
>     igt@gem_lmem_swapping@parallel-multi:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#4613) +4 other tests skip
>  * 
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>  * 
>
>     igt@gem_lmem_swapping@random:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613)
>  * 
>
>     igt@gem_lmem_swapping@smem-oom:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#4613)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4613) +1 other test skip
>  * 
>
>     igt@gem_mmap@bad-object:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>  * 
>
>     igt@gem_mmap_gtt@big-bo-tiledy:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4077) +5 other tests skip
>  * 
>
>     igt@gem_mmap_gtt@cpuset-medium-copy-xy:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>  * 
>
>     igt@gem_mmap_wc@close:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>  * 
>
>     igt@gem_partial_pwrite_pread@write-snoop:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3282)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3282)
>  * 
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3282)
>  * 
>
>     igt@gem_pread@exhaustion:
>
>      +  shard-glk10: NOTRUN -> WARN (i915#2658)
>  * 
>
>     igt@gem_pread@snoop:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3282) +2 other tests skip
>  * 
>
>     igt@gem_pxp@hw-rejects-pxp-buffer:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13717)
>  * 
>
>     igt@gem_pxp@reject-modify-context-protection-off-3:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>  * 
>
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4270) +1 other test skip
>  * 
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8428)
>  * 
>
>     igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428)
>  * 
>
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3297) +1 other test skip
>  * 
>
>     igt@gem_userptr_blits@map-fixed-invalidate-busy:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3297)
>  * 
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3297) +1 other test skip
>  * 
>
>     igt@gem_workarounds@suspend-resume-context:
>
>      +  shard-glk: PASS -> INCOMPLETE (i915#13356)
>  * 
>
>     igt@gem_workarounds@suspend-resume-fd:
>
>      +  shard-glk11: NOTRUN -> INCOMPLETE (i915#13356 / i915#14586)
>  * 
>
>     igt@gen9_exec_parse@bb-chained:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      +  shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#2856) +1 other test skip
>  * 
>
>     igt@gen9_exec_parse@bb-oversize:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#2527) +2 other tests skip
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other test skip
>  * 
>
>     igt@i915_drm_fdinfo@all-busy-idle-check-all:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#14123)
>  * 
>
>     igt@i915_drm_fdinfo@busy-hang@vcs0:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>  * 
>
>     igt@i915_fb_tiling@basic-x-tiling:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13786)
>  * 
>
>     igt@i915_module_load@fault-injection@intel_connector_register:
>
>      +  shard-glk: NOTRUN -> ABORT (i915#15342) +1 other test abort
>  * 
>
>     igt@i915_module_load@reload-no-display:
>
>      +  shard-dg2: PASS -> DMESG-WARN (i915#13029 / i915#14545)
>      +  shard-dg1: PASS -> DMESG-WARN (i915#13029 / i915#14545)
>  * 
>
>     igt@i915_pm_freq_api@freq-suspend:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#8399)
>  * 
>
>     igt@i915_pm_rc6_residency@rc6-accuracy:
>
>      +  shard-dg2: PASS -> FAIL (i915#12964) +1 other test fail
>  * 
>
>     igt@i915_pm_rpm@system-suspend:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13356)
>  * 
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#13356 / i915#15172)
>  * 
>
>     igt@i915_pm_rps@thresholds-park:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11681)
>  * 
>
>     igt@i915_pm_sseu@full-enable:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#4387)
>  * 
>
>     igt@i915_selftest@live:
>
>      +  shard-mtlp: PASS -> DMESG-FAIL (i915#12061 / i915#15560)
>  * 
>
>     igt@i915_selftest@live@workarounds:
>
>      +  shard-mtlp: PASS -> DMESG-FAIL (i915#12061)
>  * 
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>      +  shard-glk11: NOTRUN -> INCOMPLETE (i915#4817)
>  * 
>
>     igt@i915_suspend@debugfs-reader:
>
>      +  shard-rkl: PASS -> INCOMPLETE (i915#4817)
>  * 
>
>     igt@intel_hwmon@hwmon-write:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#7707)
>  * 
>
>     igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4212) +1 other test skip
>  * 
>
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      +  shard-dg1: NOTRUN -> SKIP (i915#4215)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4212)
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition:
>
>      +  shard-dg2: PASS -> FAIL (i915#5956)
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>      +  shard-glk11: NOTRUN -> SKIP (i915#1769)
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
>
>      +  shard-dg2: NOTRUN -> FAIL (i915#5956)
>  * 
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>  * 
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>      +  shard-mtlp: PASS -> FAIL (i915#15733 / i915#5138)
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +3 other tests skip
>  * 
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3828)
>  * 
>
>     igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3828)
>  * 
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>      +  shard-dg2: NOTRUN -> SKIP +7 other tests skip
>  * 
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3638)
>  * 
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3638)
>  * 
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5190)
>  * 
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +6 other tests skip
>      +  shard-rkl: NOTRUN -> SKIP +8 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#4538) +1 other test skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>      +  shard-tglu-1: NOTRUN -> SKIP +36 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>
>      +  shard-mtlp: NOTRUN -> SKIP +8 other tests skip
>  * 
>
>     igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-c-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#6095) +29 other tests skip
>  * 
>
>     igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>  * 
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-3:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#6095) +34 other tests skip
>  * 
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>
>      +  shard-glk: NOTRUN -> SKIP +353 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#12313)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#6095) +34 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095) +3 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#14694)
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#6095) +24 other tests skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +2 other tests skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +60 other tests skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#6095) +169 other tests skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +41 other tests skip
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>  * 
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6095) +72 other tests skip
>  * 
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3742)
>  * 
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13781) +3 other tests skip
>  * 
>
>     igt@kms_chamelium_audio@dp-audio:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests skip
>  * 
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544)
>  * 
>
>     igt@kms_chamelium_frames@dp-crc-single:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests skip
>  * 
>
>     igt@kms_chamelium_frames@hdmi-crc-multiple:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>  * 
>
>     igt@kms_content_protection@content-type-change:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15865) +1 other test skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#15865) +1 other test skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#15865)
>      +  shard-tglu: NOTRUN -> SKIP (i915#15865) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15865)
>  * 
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15330 / i915#3299)
>  * 
>
>     igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15330)
>      +  shard-dg2: NOTRUN -> SKIP (i915#15330)
>      +  shard-rkl: NOTRUN -> SKIP (i915#15330)
>      +  shard-dg1: NOTRUN -> SKIP (i915#15330)
>      +  shard-tglu: NOTRUN -> SKIP (i915#15330)
>  * 
>
>     igt@kms_content_protection@legacy:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15865) +1 other test skip
>  * 
>
>     igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
>
>      +  shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>  * 
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555) +3 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814)
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#13049)
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>      +  shard-rkl: PASS -> FAIL (i915#13566)
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>
>      +  shard-rkl: NOTRUN -> FAIL (i915#13566) +2 other tests fail
>  * 
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#4103 / i915#4213)
>  * 
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +1 other test skip
>  * 
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9809) +4 other tests skip
>  * 
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>      +  shard-glk: NOTRUN -> FAIL (i915#15804) +1 other test fail
>  * 
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9067)
>  * 
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9723)
>  * 
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555 / i915#3804)
>  * 
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3804)
>  * 
>
>     igt@kms_dp_link_training@non-uhbr-mst:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13749)
>  * 
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#13749)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#13749)
>  * 
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>      +  shard-glk11: NOTRUN -> INCOMPLETE (i915#9878)
>  * 
>
>     igt@kms_fbcon_fbt@psr:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3469)
>  * 
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3955)
>  * 
>
>     igt@kms_feature_discovery@display-2x:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1839)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#1839)
>  * 
>
>     igt@kms_feature_discovery@display-4x:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#1839)
>  * 
>
>     igt@kms_feature_discovery@dp-mst:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9337)
>  * 
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934)
>  * 
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9934) +7 other tests skip
>  * 
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9934)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9934)
>  * 
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other tests skip
>  * 
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>  * 
>
>     igt@kms_flip@2x-plain-flip-ts-check:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>  * 
>
>     igt@kms_flip@flip-vs-fences-interruptible:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8381)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15643) +1 other test skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15643 / i915#5190) +3 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15643) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15104) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>      +  shard-dg2: PASS -> FAIL (i915#15389 / i915#6880)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#1825) +15 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#5354) +21 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#8708) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>
>      +  shard-tglu: NOTRUN -> SKIP +32 other tests skip
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#8708) +6 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#10056)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15102) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>      +  shard-snb: NOTRUN -> SKIP +94 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15102 / i915#3458) +9 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>
>      +  shard-glk10: NOTRUN -> SKIP +96 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15102 / i915#3458) +5 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>
>      +  shard-dg1: NOTRUN -> SKIP +18 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1825) +23 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +15 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9766)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9766)
>      +  shard-dg1: NOTRUN -> SKIP (i915#9766)
>      +  shard-dg2: NOTRUN -> SKIP (i915#9766)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15102) +4 other tests skip
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15102) +10 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#15104) +2 other tests skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15104)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15102) +12 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#8708) +4 other tests skip
>  * 
>
>     igt@kms_hdmi_inject@inject-4k:
>
>      +  shard-mtlp: PASS -> SKIP (i915#15725)
>  * 
>
>     igt@kms_hdr@bpc-switch:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      +  shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      +  shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      +  shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228)
>  * 
>
>     igt@kms_hdr@static-toggle:
>
>      +  shard-rkl: PASS -> SKIP (i915#3555 / i915#8228) +1 other test skip
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test skip
>  * 
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#13688)
>  * 
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15460)
>      +  shard-rkl: NOTRUN -> SKIP (i915#15460)
>      +  shard-dg1: NOTRUN -> SKIP (i915#15460)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#15460)
>  * 
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15458)
>  * 
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#12756 / i915#13476)
>  * 
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#12756 / i915#13409 / i915#13476) +1 other test incomplete
>  * 
>
>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#13476)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15709) +1 other test skip
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15709) +1 other test skip
>  * 
>
>     igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>  * 
>
>     igt@kms_plane@pixel-format-y-tiled-modifier@pipe-b-plane-5:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15608) +1 other test skip
>  * 
>
>     igt@kms_plane@pixel-format-yf-tiled-ccs-modifier@pipe-a-plane-4:
>
>      +  shard-glk11: NOTRUN -> SKIP +97 other tests skip
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb:
>
>      +  shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169)
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
>
>      +  shard-glk: NOTRUN -> FAIL (i915#10647) +1 other test fail
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb:
>
>      +  shard-glk10: NOTRUN -> FAIL (i915#10647 / i915#12177)
>  * 
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>
>      +  shard-glk10: NOTRUN -> FAIL (i915#10647) +1 other test fail
>  * 
>
>     igt@kms_plane_lowres@tiling-yf:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>  * 
>
>     igt@kms_plane_multiple@tiling-y:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#14259)
>  * 
>
>     igt@kms_plane_multiple@tiling-yf:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#14259) +1 other test skip
>  * 
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>  * 
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#5354)
>  * 
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9685)
>  * 
>
>     igt@kms_pm_dc@dc5-dpms-negative:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#13441)
>  * 
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#8430)
>  * 
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>      +  shard-rkl: PASS -> SKIP (i915#14544 / i915#15073)
>  * 
>
>     igt@kms_pm_rpm@dpms-non-lpsp:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#15073)
>      +  shard-rkl: PASS -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@fences-dpms:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4077) +8 other tests skip
>  * 
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>      +  shard-dg1: PASS -> SKIP (i915#15073)
>  * 
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>      +  shard-dg2: NOTRUN -> INCOMPLETE (i915#14419)
>  * 
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#6524)
>  * 
>
>     igt@kms_prime@d3hot:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#6524)
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
>
>      +  shard-glk10: NOTRUN -> SKIP (i915#11520) +1 other test skip
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>      +  shard-glk: NOTRUN -> SKIP (i915#11520) +13 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>      +  shard-snb: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      +  shard-dg1: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      +  shard-tglu: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12316) +4 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9808) +1 other test skip
>  * 
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>  * 
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>
>      +  shard-glk11: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>  * 
>
>     igt@kms_psr2_su@page_flip-p010:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9683)
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9683)
>  * 
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9683)
>  * 
>
>     igt@kms_psr@fbc-pr-cursor-blt:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#9732) +13 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr-cursor-blt:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +13 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr-dpms:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +12 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr2-primary-render:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#9688) +11 other tests skip
>  * 
>
>     igt@kms_psr@pr-cursor-plane-onoff:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9732) +9 other tests skip
>  * 
>
>     igt@kms_psr@pr-cursor-render:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +10 other tests skip
>  * 
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9685)
>  * 
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>      +  shard-mtlp: NOTRUN -> SKIP (i915#12755 / i915#15867) +2 other tests skip
>  * 
>
>     igt@kms_rotation_crc@exhaust-fences:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#4235)
>      +  shard-dg1: NOTRUN -> SKIP (i915#4884)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#4235)
>  * 
>
>     igt@kms_rotation_crc@multiplane-rotation:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#15492)
>  * 
>
>     igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>
>      +  shard-glk10: NOTRUN -> INCOMPLETE (i915#15492)
>  * 
>
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#5289)
>  * 
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#15867) +3 other tests skip
>  * 
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#5289)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#5289)
>  * 
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#5289)
>  * 
>
>     igt@kms_selftest@drm_framebuffer:
>
>      +  shard-glk10: NOTRUN -> ABORT (i915#13179) +1 other test abort
>  * 
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>      +  shard-glk10: NOTRUN -> FAIL (i915#10959)
>  * 
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>      +  shard-glk: NOTRUN -> INCOMPLETE (i915#12276) +1 other test incomplete
>  * 
>
>     igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: NOTRUN -> INCOMPLETE (i915#12276) +1 other test incomplete
>  * 
>
>     igt@kms_vrr@flip-basic:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#15243 / i915#3555) +2 other tests skip
>  * 
>
>     igt@kms_vrr@flip-dpms:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#15243 / i915#3555)
>      +  shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8808)
>  * 
>
>     igt@kms_vrr@lobf:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#11920)
>  * 
>
>     igt@kms_vrr@max-min:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#9906)
>  * 
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>      +  shard-tglu-1: NOTRUN -> SKIP (i915#9906)
>  * 
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#9906)
>  * 
>
>     igt@perf@polling@0-rcs0:
>
>      +  shard-rkl: PASS -> FAIL (i915#10538) +1 other test fail
>  * 
>
>     igt@perf_pmu@module-unload:
>
>      +  shard-tglu: NOTRUN -> ABORT (i915#15778)
>      +  shard-glk10: NOTRUN -> ABORT (i915#15778)
>  * 
>
>     igt@perf_pmu@most-busy-check-all@bcs0:
>
>      +  shard-dg2: PASS -> FAIL (i915#15520) +1 other test fail
>  * 
>
>     igt@perf_pmu@most-busy-check-all@vcs0:
>
>      +  shard-mtlp: PASS -> FAIL (i915#15520) +2 other tests fail
>  * 
>
>     igt@perf_pmu@rc6@other-idle-gt0:
>
>      +  shard-tglu: NOTRUN -> SKIP (i915#8516)
>  * 
>
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#14121) +1 other test skip
>      +  shard-mtlp: NOTRUN -> SKIP (i915#14121) +1 other test skip
>  * 
>
>     igt@prime_vgem@basic-fence-flip:
>
>      +  shard-dg1: NOTRUN -> SKIP (i915#3708)
>      +  shard-dg2: NOTRUN -> SKIP (i915#3708)
>  * 
>
>     igt@prime_vgem@basic-read:
>
>      +  shard-dg2: NOTRUN -> SKIP (i915#3291 / i915#3708)
>  * 
>
>     igt@prime_vgem@fence-flip-hang:
>
>      +  shard-rkl: NOTRUN -> SKIP (i915#3708)
>
>     Possible fixes
>
>  * 
>
>     igt@gem_eio@kms:
>
>      +  shard-rkl: DMESG-WARN (i915#13363) -> PASS
>      +  shard-tglu: DMESG-WARN (i915#13363) -> PASS
>  * 
>
>     igt@gem_exec_big@single:
>
>      +  shard-tglu: FAIL (i915#15816) -> PASS
>  * 
>
>     igt@gem_exec_suspend@basic-s0:
>
>      +  shard-dg2: INCOMPLETE (i915#13356) -> PASS +1 other test pass
>  * 
>
>     igt@gem_mmap_offset@clear-via-pagefault:
>
>      +  shard-mtlp: DMESG-WARN (i915#15478) -> PASS +1 other test pass
>  * 
>
>     igt@gem_workarounds@suspend-resume-context:
>
>      +  shard-rkl: INCOMPLETE (i915#13356) -> PASS
>  * 
>
>     igt@i915_module_load@reload-no-display:
>
>      +  shard-tglu: DMESG-WARN (i915#13029 / i915#14545) -> PASS
>  * 
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>      +  shard-mtlp: INCOMPLETE (i915#13356) -> PASS
>  * 
>
>     igt@i915_suspend@basic-s3-without-i915:
>
>      +  shard-dg1: DMESG-WARN (i915#4391 / i915#4423) -> PASS
>  * 
>
>     igt@i915_suspend@fence-restore-tiled2untiled:
>
>      +  shard-glk: INCOMPLETE (i915#4817) -> PASS +1 other test pass
>  * 
>
>     igt@i915_suspend@fence-restore-untiled:
>
>      +  shard-rkl: INCOMPLETE (i915#4817) -> PASS
>  * 
>
>     igt@i915_suspend@forcewake:
>
>      +  shard-rkl: ABORT (i915#15140) -> PASS
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>
>      +  shard-glk: INCOMPLETE (i915#15582) -> PASS
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42:
>
>      +  shard-rkl: FAIL (i915#13566) -> PASS +3 other tests pass
>  * 
>
>     igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
>
>      +  shard-tglu: FAIL (i915#13566) -> PASS +1 other test pass
>  * 
>
>     igt@kms_cursor_edge_walk@128x128-top-edge:
>
>      +  shard-dg1: DMESG-WARN (i915#4423) -> PASS +1 other test pass
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible:
>
>      +  shard-snb: TIMEOUT (i915#14033 / i915#14350) -> PASS
>  * 
>
>     igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
>
>      +  shard-snb: TIMEOUT (i915#14033) -> PASS +2 other tests pass
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
>
>      +  shard-dg2: FAIL (i915#15389 / i915#6880) -> PASS
>  * 
>
>     igt@kms_hdr@static-swap:
>
>      +  shard-rkl: SKIP (i915#3555 / i915#8228) -> PASS +1 other test pass
>  * 
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256:
>
>      +  shard-rkl: FAIL -> PASS +3 other tests pass
>  * 
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>      +  shard-rkl: SKIP (i915#15073) -> PASS
>  * 
>
>     igt@kms_setmode@basic:
>
>      +  shard-dg1: FAIL (i915#15106) -> PASS
>      +  shard-tglu: FAIL (i915#15106) -> PASS +1 other test pass
>  * 
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>      +  shard-mtlp: FAIL (i915#15106) -> PASS +2 other tests pass
>  * 
>
>     igt@perf_pmu@render-node-busy-idle:
>
>      +  shard-mtlp: FAIL (i915#4349) -> PASS +3 other tests pass
>  * 
>
>     igt@perf_pmu@render-node-busy-idle@vcs1:
>
>      +  shard-dg2: FAIL (i915#4349) -> PASS +5 other tests pass
>      +  shard-dg1: FAIL (i915#4349) -> PASS +3 other tests pass
>
>     Warnings
>
>  * 
>
>     igt@gem_bad_reloc@negative-reloc-lut:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +4 other tests skip
>  * 
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#7697) -> SKIP (i915#7697)
>  * 
>
>     igt@gem_ctx_sseu@engines:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#280) -> SKIP (i915#280)
>  * 
>
>     igt@gem_exec_reloc@basic-softpin:
>
>      +  shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281)
>  * 
>
>     igt@gem_lmem_swapping@basic:
>
>      +  shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613)
>  * 
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613)
>  * 
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>
>      +  shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282)
>  * 
>
>     igt@gem_pread@exhaustion:
>
>      +  shard-tglu: WARN (i915#2658) -> ABORT (i915#15647)
>  * 
>
>     igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282)
>  * 
>
>     igt@gem_userptr_blits@dmabuf-unsync:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297) +1 other test skip
>  * 
>
>     igt@gem_userptr_blits@relocations:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3281 / i915#3297) -> SKIP (i915#3281 / i915#3297)
>  * 
>
>     igt@gen9_exec_parse@bb-start-out:
>
>      +  shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527)
>  * 
>
>     igt@i915_pm_rc6_residency@media-rc6-accuracy:
>
>      +  shard-rkl: SKIP -> SKIP (i915#14544) +4 other tests skip
>  * 
>
>     igt@i915_pm_rc6_residency@rc6-idle:
>
>      +  shard-rkl: SKIP (i915#14498 / i915#14544) -> SKIP (i915#14498)
>  * 
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>
>      +  shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +2 other tests skip
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#5286) -> SKIP (i915#5286)
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>
>      +  shard-dg1: SKIP (i915#4538 / i915#5286) -> SKIP (i915#4423 / i915#4538 / i915#5286)
>  * 
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3638) -> SKIP (i915#3638) +1 other test skip
>  * 
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>
>      +  shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544 / i915#3638)
>  * 
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>
>      +  shard-rkl: SKIP (i915#14544) -> SKIP +5 other tests skip
>  * 
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +6 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2:
>
>      +  shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +3 other tests skip
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>
>      +  shard-rkl: SKIP (i915#12313 / i915#14544) -> SKIP (i915#12313)
>  * 
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs:
>
>      +  shard-dg1: SKIP (i915#4423 / i915#6095) -> SKIP (i915#6095)
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>
>      +  shard-glk: INCOMPLETE (i915#15582) -> INCOMPLETE (i915#14694 / i915#15582)
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>
>      +  shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 / i915#14544 / i915#6095) +3 other tests skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>
>      +  shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP (i915#14098 / i915#6095) +9 other tests skip
>  * 
>
>     igt@kms_chamelium_frames@hdmi-frame-dump:
>
>      +  shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 / i915#14544 / i915#7828) +1 other test skip
>  * 
>
>     igt@kms_chamelium_hpd@dp-hpd-fast:
>
>      +  shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP (i915#11151 / i915#7828) +1 other test skip
>  * 
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>      +  shard-rkl: SKIP (i915#15330 / i915#3116) -> SKIP (i915#14544 / i915#15330 / i915#3116)
>  * 
>
>     igt@kms_content_protection@uevent-hdcp14:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15865) -> SKIP (i915#15865)
>  * 
>
>     igt@kms_cursor_crc@cursor-random-max-size:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555) +2 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>      +  shard-dg1: SKIP (i915#3555 / i915#4423) -> SKIP (i915#3555)
>  * 
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>      +  shard-dg1: SKIP (i915#13049) -> SKIP (i915#13049 / i915#4423)
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>      +  shard-rkl: SKIP (i915#13049) -> SKIP (i915#13049 / i915#14544)
>  * 
>
>     igt@kms_fbcon_fbt@psr:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3955) -> SKIP (i915#3955)
>  * 
>
>     igt@kms_flip@2x-absolute-wf_vblank:
>
>      +  shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +1 other test skip
>  * 
>
>     igt@kms_flip@2x-wf_vblank-ts-check:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +4 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15643) -> SKIP (i915#15643) +1 other test skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>
>      +  shard-rkl: SKIP (i915#15643) -> SKIP (i915#14544 / i915#15643)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#1825) -> SKIP (i915#1825) +12 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>      +  shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-blt:
>
>      +  shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-cpu:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
>
>      +  shard-dg2: SKIP (i915#15102 / i915#3458) -> SKIP (i915#10433 / i915#15102 / i915#3458) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
>
>      +  shard-dg2: SKIP (i915#10433 / i915#15102 / i915#3458) -> SKIP (i915#15102 / i915#3458) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>      +  shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 / i915#15102 / i915#3023) +7 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP (i915#15102 / i915#3023) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
>
>      +  shard-dg1: SKIP (i915#15102 / i915#3458 / i915#4423) -> SKIP (i915#15102 / i915#3458)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>      +  shard-dg1: SKIP (i915#4423 / i915#8708) -> SKIP (i915#8708)
>  * 
>
>     igt@kms_hdr@invalid-hdr:
>
>      +  shard-rkl: SKIP (i915#3555 / i915#8228) -> SKIP (i915#14544 / i915#3555 / i915#8228)
>  * 
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>      +  shard-rkl: SKIP (i915#13688 / i915#14544) -> SKIP (i915#13688)
>  * 
>
>     igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>
>      +  shard-rkl: SKIP (i915#14712) -> SKIP (i915#14544 / i915#14712)
>  * 
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>
>      +  shard-rkl: SKIP (i915#15709) -> SKIP (i915#14544 / i915#15709)
>  * 
>
>     igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#15709) -> SKIP (i915#15709)
>  * 
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#9685) -> SKIP (i915#9685)
>  * 
>
>     igt@kms_pm_dc@dc6-dpms:
>
>      +  shard-tglu: FAIL (i915#15752) -> SKIP (i915#15128)
>  * 
>
>     igt@kms_pm_dc@dc9-dpms:
>
>      +  shard-tglu: SKIP (i915#15128) -> SKIP (i915#15739)
>  * 
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>      +  shard-rkl: SKIP (i915#3828) -> SKIP (i915#9340)
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>
>      +  shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520)
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>      +  shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544)
>  * 
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>
>      +  shard-dg1: SKIP (i915#11520 / i915#4423) -> SKIP (i915#11520)
>  * 
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>      +  shard-rkl: SKIP (i915#9683) -> SKIP (i915#14544 / i915#9683)
>  * 
>
>     igt@kms_psr@fbc-psr2-cursor-mmap-cpu:
>
>      +  shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP (i915#1072 / i915#9732) +6 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr2-primary-blt:
>
>      +  shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 / i915#14544 / i915#9732) +4 other tests skip
>  * 
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>      +  shard-rkl: SKIP (i915#5289) -> SKIP (i915#14544 / i915#5289)
>  * 
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#5289) -> SKIP (i915#5289)
>  * 
>
>     igt@kms_scaling_modes@scaling-mode-center:
>
>      +  shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555) +1 other test skip
>  * 
>
>     igt@prime_vgem@basic-read:
>
>      +  shard-rkl: SKIP (i915#14544 / i915#3291 / i915#3708) -> SKIP (i915#3291 / i915#3708)
> 
> BUILD CHANGES
>
>  *  CI: CI-20190529 -> None
>  *  IGT: IGT_8836 -> IGTPW_14881
>  *  Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> CI_DRM_18252: 247b271f2f09fedf9c4cc85fcc338217fc396a9a @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14881: 14881
> IGT_8836: 8836
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> 
>
--8323329-294391459-1775164921=:1805036--
