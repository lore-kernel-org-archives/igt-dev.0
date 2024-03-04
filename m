Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1939AC5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A0110E213;
	Mon,  4 Mar 2024 15:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYUM0smd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA1F10E213
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709564681; x=1741100681;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yjZwBAlWzXPSyWWK1PtQZXUYnVqNEuV+IAE+Mpu1Bk4=;
 b=KYUM0smdyKMEO6lQ67Cgt4o2MPIcQxEz8df30pHhfnzsKz5XmfAOM7Tf
 XWbFR/ab6IKtJmb3hHQlw1EpeSkhzbjgpP3+tz3anYsWhi987e0xDItHH
 X0RrZZBUmmj5nT01Q6HD1pLXmuQNNL3gW2A3dPoXEpQeIYQPtM/QdiK0/
 TfUbPbBxu8r56BF0mlfxCyNhnwnQZW+IKTu2fEuIKNN8z2PCqaqWRJA9W
 APnakZp1FwelbzptnJDQAsW5T8mBV1qVm7/VOB0dRCy7wSVd/L78cLAWF
 EwG/MJDASVEjdj522opG4ll/sshQYPngrflHSprZ0Cm1bLWyjqXQbwdzD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="3921392"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="3921392"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13709147"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:04:39 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DC77D5807E7;
 Mon,  4 Mar 2024 07:04:36 -0800 (PST)
Date: Mon, 4 Mar 2024 16:04:33 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 04/24] tests/intel: Introduce CMD submission
 subcategory
Message-ID: <20240304160433.31ef0520@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-5-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-5-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon,  4 Mar 2024 11:15:57 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's have 'CMD submission' subcategory to explicitly show where we are
> testing cmd submission.
> In some cases change subcategory i915 to CMD submission.

LGTM.
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/gem_bad_reloc.c               | 14 ++++++++------
>  tests/intel/gem_barrier_race.c            |  3 +++
>  tests/intel/gem_cs_tlb.c                  |  4 ++--
>  tests/intel/gem_ctx_switch.c              |  3 +++
>  tests/intel/gem_evict_alignment.c         |  3 +++
>  tests/intel/gem_evict_everything.c        |  3 +++
>  tests/intel/gem_exec_alignment.c          |  4 ++--
>  tests/intel/gem_exec_async.c              |  4 ++--
>  tests/intel/gem_exec_await.c              |  4 ++--
>  tests/intel/gem_exec_endless.c            |  6 +++---
>  tests/intel/gem_exec_fair.c               |  3 +++
>  tests/intel/gem_exec_flush.c              |  3 +++
>  tests/intel/gem_exec_latency.c            |  3 +++
>  tests/intel/gem_exec_lut_handle.c         |  3 +++
>  tests/intel/gem_exec_nop.c                |  4 ++--
>  tests/intel/gem_exec_reloc.c              |  3 +++
>  tests/intel/gem_exec_store.c              | 18 ++++++++++--------
>  tests/intel/gem_exec_suspend.c            |  3 +++
>  tests/intel/gem_exec_whisper.c            |  4 ++--
>  tests/intel/gem_fd_exhaustion.c           |  3 +++
>  tests/intel/gem_lut_handle.c              |  3 +++
>  tests/intel/gem_partial_pwrite_pread.c    |  3 +++
>  tests/intel/gem_pipe_control_store_loop.c |  4 ++--
>  tests/intel/gem_pread.c                   |  3 +++
>  tests/intel/gem_pread_after_blit.c        |  3 +++
>  tests/intel/gem_pwrite.c                  |  3 +++
>  tests/intel/gem_pwrite_snooped.c          |  3 +++
>  tests/intel/gem_render_linear_blits.c     |  3 +++
>  tests/intel/gem_render_tiled_blits.c      |  3 +++
>  tests/intel/gem_request_retire.c          |  6 +++---
>  tests/intel/gem_ringfill.c                |  4 ++--
>  tests/intel/gem_stress.c                  |  3 +++
>  tests/intel/gem_unref_active_buffers.c    |  2 +-
>  tests/intel/gem_watchdog.c                |  3 +++
>  tests/intel/gen7_exec_parse.c             |  3 +++
>  35 files changed, 107 insertions(+), 37 deletions(-)
>=20
> diff --git a/tests/intel/gem_bad_reloc.c b/tests/intel/gem_bad_reloc.c
> index b058639ea..8e17d6630 100644
> --- a/tests/intel/gem_bad_reloc.c
> +++ b/tests/intel/gem_bad_reloc.c
> @@ -43,16 +43,18 @@
>  #include "igt.h"
>  /**
>   * TEST: gem bad reloc
> - * Description:
> - *   Simulates SNA behaviour using negative self-relocations for STATE_B=
ASE_ADDRESS command
> - *   packets.
> + * Description: Simulates SNA behaviour using negative self-relocations =
for
> + *		STATE_BASE_ADDRESS command packets.
>   * Feature: cmd_submission
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: relocations
>   * Run type: FULL
>   *
>   * SUBTEST: negative-reloc
> - * Description:
> - *   SNA behaviour is compressing batch buffer which leads to negative r=
elocation deltas.
> - *   Negative self-relocation happening with real offset 0.
> + * Description: SNA behaviour is compressing batch buffer which leads to
> + *		negative relocation deltas. Negative self-relocation happening
> + *		with real offset 0.
>   *
>   * SUBTEST: negative-reloc-bltcopy
>   * Description: Exercising blitter operation with negative reloc.
> diff --git a/tests/intel/gem_barrier_race.c b/tests/intel/gem_barrier_rac=
e.c
> index 591ddc222..7f434a68c 100644
> --- a/tests/intel/gem_barrier_race.c
> +++ b/tests/intel/gem_barrier_race.c
> @@ -21,6 +21,9 @@
>   * TEST: gem barrier race
>   * Description: Exercise engine barriers and their interaction with othe=
r subsystems
>   * Feature: core
> + * Category: Desktop client
> + * Sub-category: CMD submission
> + * Functionality: barrier
>   * Run type: FULL
>   * Test category: GEM_Legacy
>   *
> diff --git a/tests/intel/gem_cs_tlb.c b/tests/intel/gem_cs_tlb.c
> index 2c7781d06..2379eef0e 100644
> --- a/tests/intel/gem_cs_tlb.c
> +++ b/tests/intel/gem_cs_tlb.c
> @@ -57,9 +57,9 @@
>   * Category: Infrastructure
>   * Description: Check whether we correctly invalidate the cs tlb.
>   * Feature: mapping
> - * Functionality: command submission
> + * Functionality: TLB invalidate
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: engines
> diff --git a/tests/intel/gem_ctx_switch.c b/tests/intel/gem_ctx_switch.c
> index f94a41bec..483aede20 100644
> --- a/tests/intel/gem_ctx_switch.c
> +++ b/tests/intel/gem_ctx_switch.c
> @@ -48,6 +48,9 @@
>  /**
>   * TEST: gem ctx switch
>   * Feature: context
> + * Category: Desktop client
> + * Sub-category: CMD Submission
> + * Functionality: context switching
>   * Run type: FULL
>   *
>   * SUBTEST: all-heavy
> diff --git a/tests/intel/gem_evict_alignment.c b/tests/intel/gem_evict_al=
ignment.c
> index 4a9507a06..7cd11d169 100644
> --- a/tests/intel/gem_evict_alignment.c
> +++ b/tests/intel/gem_evict_alignment.c
> @@ -50,6 +50,9 @@
>  /**
>   * TEST: gem evict alignment
>   * Description: Run a couple of big batches to force the unbind on misal=
ignment code.
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: misalignment
>   * Run type: FULL
>   *
>   * SUBTEST: major-hang
> diff --git a/tests/intel/gem_evict_everything.c b/tests/intel/gem_evict_e=
verything.c
> index f0f356cc3..578018e4d 100644
> --- a/tests/intel/gem_evict_everything.c
> +++ b/tests/intel/gem_evict_everything.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gem evict everything
>   * Description: Run a couple of big batches to force the eviction code.
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: eviction
>   * Run type: FULL
>   *
>   * SUBTEST: forked-interruptible
> diff --git a/tests/intel/gem_exec_alignment.c b/tests/intel/gem_exec_alig=
nment.c
> index 10732fec5..40ff15030 100644
> --- a/tests/intel/gem_exec_alignment.c
> +++ b/tests/intel/gem_exec_alignment.c
> @@ -50,9 +50,9 @@
>   * Category: Desktop client
>   * Description: Exercises the basic execbuffer using object alignments
>   * Feature: cmd_submission
> - * Functionality: command submission
> + * Functionality: execbuf
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: forked
> diff --git a/tests/intel/gem_exec_async.c b/tests/intel/gem_exec_async.c
> index 1497c5c6c..8db8fbf3c 100644
> --- a/tests/intel/gem_exec_async.c
> +++ b/tests/intel/gem_exec_async.c
> @@ -29,9 +29,9 @@
>   * Category: Infrastructure
>   * Description: Check that we can issue concurrent writes across the eng=
ines.
>   * Feature: cmd_submission
> - * Functionality: command submission
> + * Functionality: concurent writes
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: concurrent-writes
> diff --git a/tests/intel/gem_exec_await.c b/tests/intel/gem_exec_await.c
> index 0652b649b..b2b8218bf 100644
> --- a/tests/intel/gem_exec_await.c
> +++ b/tests/intel/gem_exec_await.c
> @@ -47,9 +47,9 @@
>   * TEST: gem exec await
>   * Category: Infrastructure
>   * Feature: cmd_submission
> - * Functionality: command submission
> + * Functionality: requests
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: wide-all
> diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endles=
s.c
> index 42991c018..b7e2bb429 100644
> --- a/tests/intel/gem_exec_endless.c
> +++ b/tests/intel/gem_exec_endless.c
> @@ -34,10 +34,10 @@
>   * TEST: gem exec endless
>   * Category: Server
>   * Feature: cmd_submission
> - * Functionality: command submission
> + * Functionality: compute
>   * Run type: FULL
> - * Sub-category: Compute
> - * Test category: GEM_Legacy
> + * Sub-category: CMD submission
> + * Test category: Compute
>   *
>   * SUBTEST: dispatch
>   */
> diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
> index 5ad13f97a..2c33c0187 100644
> --- a/tests/intel/gem_exec_fair.c
> +++ b/tests/intel/gem_exec_fair.c
> @@ -30,6 +30,9 @@
>   * TEST: gem exec fair
>   * Description: Check that GPU time and execution order is fairly distri=
buted across clients
>   * Feature: cmd_submission
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: multi-client systems
>   * Run type: FULL
>   *
>   * SUBTEST: basic-deadline
> diff --git a/tests/intel/gem_exec_flush.c b/tests/intel/gem_exec_flush.c
> index 3902ee957..a540d1f30 100644
> --- a/tests/intel/gem_exec_flush.c
> +++ b/tests/intel/gem_exec_flush.c
> @@ -31,6 +31,9 @@
>  /**
>   * TEST: gem exec flush
>   * Description: Basic check of flushing after batches
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: execbuf
>   * Run type: FULL
>   *
>   * SUBTEST: basic-batch-kernel-default-cmd
> diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latenc=
y.c
> index c0e607f97..42955e97a 100644
> --- a/tests/intel/gem_exec_latency.c
> +++ b/tests/intel/gem_exec_latency.c
> @@ -50,6 +50,9 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem exec latency
> + * Sub-category: CMD submission
> + * Functionality: execbuf
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: context-preempt
> diff --git a/tests/intel/gem_exec_lut_handle.c b/tests/intel/gem_exec_lut=
_handle.c
> index c5e8f1d72..a03a716e5 100644
> --- a/tests/intel/gem_exec_lut_handle.c
> +++ b/tests/intel/gem_exec_lut_handle.c
> @@ -43,6 +43,9 @@
>  /**
>   * TEST: gem exec lut handle
>   * Description: Exercises the basic execbuffer using the handle LUT inte=
rface.
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: execbuf
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
> index 88a6ba224..48308312e 100644
> --- a/tests/intel/gem_exec_nop.c
> +++ b/tests/intel/gem_exec_nop.c
> @@ -52,8 +52,8 @@
>   * TEST: gem exec nop
>   * Category: Infrastructure
>   * Feature: cmd_submission
> - * Functionality: command submission
> - * Sub-category: i915
> + * Functionality: execbuf
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
> index 8259ff1d9..f3a8a45c0 100644
> --- a/tests/intel/gem_exec_reloc.c
> +++ b/tests/intel/gem_exec_reloc.c
> @@ -34,6 +34,9 @@
>  /**
>   * TEST: gem exec reloc
>   * Description: Basic sanity check of execbuf-ioctl relocations.
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: relocations
>   * Run type: FULL
>   *
>   * SUBTEST: basic-active
> diff --git a/tests/intel/gem_exec_store.c b/tests/intel/gem_exec_store.c
> index 0ab931062..a5a6538cb 100644
> --- a/tests/intel/gem_exec_store.c
> +++ b/tests/intel/gem_exec_store.c
> @@ -40,24 +40,26 @@
>   * Description: Exercise store dword functionality using execbuf-ioctl
>   * Feature: cmd_submission
>   * Functionality: coherency
> - * Sub-category: HW
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: basic
> - * Description: Verify that all capable engines can store dwords to a co=
mmon buffer object
> + * Description: Verify that all capable engines can store dwords to a co=
mmon
> + *		buffer object
>   * Run type: BAT
>   *
>   * SUBTEST: cachelines
> - * Description: Verify that each capable engine can store a dword to dif=
ferent cachelines of a buffer object
> - * Run type: FULL
> + * Description: Verify that each capable engine can store a dword to dif=
ferent
> + *		cachelines of a buffer object
>   *
>   * SUBTEST: dword
> - * Description: Verify that each capable engine can store a dword to a b=
uffer object
> - * Run type: FULL
> + * Description: Verify that each capable engine can store a dword to a b=
uffer
> + *		object
>   *
>   * SUBTEST: pages
> - * Description: Verify that each capable engine can store a dword to var=
ious page-sized buffer objects
> - * Run type: FULL
> + * Description: Verify that each capable engine can store a dword to var=
ious
> + *		page-sized buffer objects
>   */
> =20
>  IGT_TEST_DESCRIPTION("Exercise store dword functionality using execbuf-i=
octl");
> diff --git a/tests/intel/gem_exec_suspend.c b/tests/intel/gem_exec_suspen=
d.c
> index faf2e10f5..1d185c56b 100644
> --- a/tests/intel/gem_exec_suspend.c
> +++ b/tests/intel/gem_exec_suspend.c
> @@ -40,6 +40,9 @@
>   * TEST: gem exec suspend
>   * Description: Exercise simple execbufs runs across various suspend/res=
ume cycles.
>   * Feature: cmd_submission, suspend
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: suspend
>   * Run type: FULL
>   *
>   * SUBTEST: basic
> diff --git a/tests/intel/gem_exec_whisper.c b/tests/intel/gem_exec_whispe=
r.c
> index effb47335..29ed163cc 100644
> --- a/tests/intel/gem_exec_whisper.c
> +++ b/tests/intel/gem_exec_whisper.c
> @@ -41,8 +41,8 @@
>   * TEST: gem exec whisper
>   * Feature: cmd_submission
>   * Category: Infrastructure
> - * Functionality: command submission
> - * Sub-category: i915
> + * Functionality: execbuf
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/intel/gem_fd_exhaustion.c b/tests/intel/gem_fd_exhaust=
ion.c
> index e79d03478..0bf7b309a 100644
> --- a/tests/intel/gem_fd_exhaustion.c
> +++ b/tests/intel/gem_fd_exhaustion.c
> @@ -36,6 +36,9 @@
>  #include "i915/gem_create.h"
>  /**
>   * TEST: gem fd exhaustion
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: fd exhaustion
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_lut_handle.c b/tests/intel/gem_lut_handle.c
> index cdd56a5d8..359e1a921 100644
> --- a/tests/intel/gem_lut_handle.c
> +++ b/tests/intel/gem_lut_handle.c
> @@ -42,6 +42,9 @@
>  /**
>   * TEST: gem lut handle
>   * Description: Exercises the basic execbuffer using the handle LUT inte=
rface.
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: execbuf
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_partial_pwrite_pread.c b/tests/intel/gem_par=
tial_pwrite_pread.c
> index 9a5855752..782a4f3b8 100644
> --- a/tests/intel/gem_partial_pwrite_pread.c
> +++ b/tests/intel/gem_partial_pwrite_pread.c
> @@ -42,6 +42,9 @@
>   * TEST: gem partial pwrite pread
>   * Description: Test pwrite/pread consistency when touching partial cach=
elines.
>   * Feature: caching, mapping
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: pread/pwrite
>   * Run type: FULL
>   *
>   * SUBTEST: reads
> diff --git a/tests/intel/gem_pipe_control_store_loop.c b/tests/intel/gem_=
pipe_control_store_loop.c
> index 1913b874a..3cfef84e7 100644
> --- a/tests/intel/gem_pipe_control_store_loop.c
> +++ b/tests/intel/gem_pipe_control_store_loop.c
> @@ -48,9 +48,9 @@
>   * Category: Desktop client
>   * Description: Test (TLB-)Coherency of pipe_control QW writes.
>   * Feature: cmd_submission
> - * Functionality: command submission
> + * Functionality: coherency
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST: fresh-buffer
> diff --git a/tests/intel/gem_pread.c b/tests/intel/gem_pread.c
> index 6f50785da..bfd20b8f8 100644
> --- a/tests/intel/gem_pread.c
> +++ b/tests/intel/gem_pread.c
> @@ -48,6 +48,9 @@
>  /**
>   * TEST: gem pread
>   * Feature: mapping
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: pread
>   * Run type: FULL
>   *
>   * SUBTEST: bench
> diff --git a/tests/intel/gem_pread_after_blit.c b/tests/intel/gem_pread_a=
fter_blit.c
> index b3e20697d..64453ad3d 100644
> --- a/tests/intel/gem_pread_after_blit.c
> +++ b/tests/intel/gem_pread_after_blit.c
> @@ -50,6 +50,9 @@
>  /**
>   * TEST: gem pread after blit
>   * Description: Test pread behavior when getting values out of just-draw=
n-to buffers.
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: pread
>   * Run type: FULL
>   *
>   * SUBTEST: default-hang
> diff --git a/tests/intel/gem_pwrite.c b/tests/intel/gem_pwrite.c
> index e2b48b843..f265eb68c 100644
> --- a/tests/intel/gem_pwrite.c
> +++ b/tests/intel/gem_pwrite.c
> @@ -49,6 +49,9 @@
>  /**
>   * TEST: gem pwrite
>   * Feature: mapping
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: pwrite
>   * Run type: FULL
>   *
>   * SUBTEST: basic-exhaustion
> diff --git a/tests/intel/gem_pwrite_snooped.c b/tests/intel/gem_pwrite_sn=
ooped.c
> index 5d9e8da20..fede6e1c8 100644
> --- a/tests/intel/gem_pwrite_snooped.c
> +++ b/tests/intel/gem_pwrite_snooped.c
> @@ -41,6 +41,9 @@
>   * TEST: gem pwrite snooped
>   * Description: pwrite to a snooped bo then make it uncached and check t=
hat the GPU sees the data.
>   * Feature: gtt, mapping
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: pwrite
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_render_linear_blits.c b/tests/intel/gem_rend=
er_linear_blits.c
> index 61ec1593f..095d0acb2 100644
> --- a/tests/intel/gem_render_linear_blits.c
> +++ b/tests/intel/gem_render_linear_blits.c
> @@ -52,6 +52,9 @@
>  /**
>   * TEST: gem render linear blits
>   * Feature: mapping
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: render blits
>   * Run type: FULL
>   *
>   * SUBTEST: aperture-shrink
> diff --git a/tests/intel/gem_render_tiled_blits.c b/tests/intel/gem_rende=
r_tiled_blits.c
> index a25ea0812..dda6faf42 100644
> --- a/tests/intel/gem_render_tiled_blits.c
> +++ b/tests/intel/gem_render_tiled_blits.c
> @@ -55,6 +55,9 @@
>   *   objects using render engine with various working set sizes and comp=
ares
>   *   outputs with expected ones.
>   * Feature: mapping
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: render blits
>   * Run type: FULL
>   *
>   * SUBTEST: aperture-shrink
> diff --git a/tests/intel/gem_request_retire.c b/tests/intel/gem_request_r=
etire.c
> index 9814b435d..8db5780c5 100644
> --- a/tests/intel/gem_request_retire.c
> +++ b/tests/intel/gem_request_retire.c
> @@ -54,10 +54,10 @@
>   * Category: Infrastructure
>   * Description: Collection of tests targeting request retirement code pa=
ths.
>   * Feature: cmd_submission
> - * Functionality: command submission
> - * Run type: FULL
> - * Sub-category: i915
> + * Functionality: requests
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: retire-vma-not-inactive
>   */
> diff --git a/tests/intel/gem_ringfill.c b/tests/intel/gem_ringfill.c
> index 0704ac1be..e9f0c7d97 100644
> --- a/tests/intel/gem_ringfill.c
> +++ b/tests/intel/gem_ringfill.c
> @@ -48,8 +48,8 @@
>   *   Exercise many tiny batchbuffer operations, in the hope of catching =
failure to manage the ring
>   *   properly near full.
>   * Feature: cmd_submission
> - * Functionality: command submission
> - * Sub-category: i915
> + * Functionality: execbuf
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/intel/gem_stress.c b/tests/intel/gem_stress.c
> index bf2e06d71..c3ee00012 100644
> --- a/tests/intel/gem_stress.c
> +++ b/tests/intel/gem_stress.c
> @@ -64,6 +64,9 @@
>  /**
>   * TEST: gem stress
>   * Description: General gem coherency test.
> + * Category: Desktop client
> + * Sub-category: CMD submission
> + * Functionality: coherency
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_unref_active_buffers.c b/tests/intel/gem_unr=
ef_active_buffers.c
> index 47023a3a0..e30214bc7 100644
> --- a/tests/intel/gem_unref_active_buffers.c
> +++ b/tests/intel/gem_unref_active_buffers.c
> @@ -48,7 +48,7 @@
>   * Feature: cmd_submission
>   * Functionality: buffer management
>   * Run type: FULL
> - * Sub-category: i915
> + * Sub-category: CMD submission
>   * Test category: GEM_Legacy
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
> index c9dd0deb5..a844cdfe0 100644
> --- a/tests/intel/gem_watchdog.c
> +++ b/tests/intel/gem_watchdog.c
> @@ -38,6 +38,9 @@
>  /**
>   * TEST: gem watchdog
>   * Feature: gem_core
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: fences
>   * Run type: FULL
>   *
>   * SUBTEST: default-physical
> diff --git a/tests/intel/gen7_exec_parse.c b/tests/intel/gen7_exec_parse.c
> index 807cb1e9d..f9033a5d8 100644
> --- a/tests/intel/gen7_exec_parse.c
> +++ b/tests/intel/gen7_exec_parse.c
> @@ -37,6 +37,9 @@
>  /**
>   * TEST: gen7 exec parse
>   * Feature: cmd_submission, command_parser
> + * Sub-category: CMD submission
> + * Category: Desktop client
> + * Functionality: command_parser
>   * Run type: FULL
>   *
>   * SUBTEST: basic-allocation
