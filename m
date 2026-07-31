Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE468C54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 05:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 346CC10F148;
	Fri, 31 Jul 2026 05:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+6CkWkA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B8210E1DA
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 05:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785475023; x=1817011023;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4/kNy88oyF3MvaSDjU4A6vodag3a5b30uc9XB3I/rBE=;
 b=Z+6CkWkAnoEp3cA4I5bTbbpfZvgtlx5gxRYDOwugVQ/JqiiuUAop+5vd
 eNX1L3iiBczbhAKGNdcyvG1fu/2Mzw7HM8Wunqq1TNu5sozsxfIW6o9Sm
 LHmRJe/Gpm/pUzWLbOTEpBrzwHVpEUNhMYznKl8cs5pfxq+pbd4lrDRfz
 /9rbW3nyoWY7Cv6Pe4d1G1hTUx/KXIQ6IS+vWV1+VBfCXzGh8OhP5IcP5
 6+UAoUFwGT7yz8n1yBTvXrj0MuT3KEg8H/4/x3vixpaHPXv3gh5pCmscP
 RjISNXpYa7cYjKRj9RsYa5Kw1/VOiUpJ0YMdnXI7E7sMe3t+NAe30U5gv w==;
X-CSE-ConnectionGUID: G2qs6uOPSP+AboFOEFIsSg==
X-CSE-MsgGUID: 6ObRG7sYQfqT+kzE6lMCTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="73634760"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="73634760"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 22:17:03 -0700
X-CSE-ConnectionGUID: /sNck3OcSna8s4suLmiuQg==
X-CSE-MsgGUID: EZFmWw64TLif1iWHhwnAFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="261094892"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.8])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 22:17:01 -0700
Date: Fri, 31 Jul 2026 07:16:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, adam.miszczak@linux.intel.com, 
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com
Subject: Re: [PATCH i-g-t 1/2] lib/xe/xe_spin: initialize ticks_delta to ~0u
Message-ID: <6jnwgnmcua4feocaej36rs7umd4whp457onxpy3axtpneha4ic@ebguddcckru3>
References: <20260728102659.316861-1-marcin.bernatowicz@linux.intel.com>
 <20260728102659.316861-2-marcin.bernatowicz@linux.intel.com>
 <p5dtghxjmq72gubqeydls5spgmtlonwlb5rdhs2iaapsubxqfr@ucwnjmu3diio>
 <a3771498-6f76-4355-98af-d4c1f623d13e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3771498-6f76-4355-98af-d4c1f623d13e@linux.intel.com>
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

On Thu, Jul 30, 2026 at 12:05:10PM +0200, Bernatowicz, Marcin wrote:
> 
> On 7/29/2026 11:42 AM, Zbigniew Kempczyński wrote:
> > On Tue, Jul 28, 2026 at 12:26:58PM +0200, Marcin Bernatowicz wrote:
> > > Initialize ticks_delta to ~0u instead of 0. This value does not satisfy
> > > the COND_BBE exit condition and prevents false batch termination.
> > May you elaborate? Does it mean STORE-DWORD (loop) is not visible in the memory
> > before COND_BBE is executed? IIUC with ~0 we could also drop this loop.

> The issue is not about the STORE-DWORDs (loop) visibility within a single
> batch; that's what the pad is for and that path works fine.

I see two scenarios here:

- loop causes delay to allow write to land in memory, where COND_BBE can
  read it. If there's stale read that means loop is too short.

- we got two competing writes to same memory - one from cpu side
  (spin->ticks_delta = 0) and one from gpu - SRM. If this is possible
  COND_BBE could read cpu write (0 in this case, we don't know which
  will be visible at comparison time) so this causes premature spinner termination.

> The problem is a cross-iteration potential stale cache read: when the same
> BO is re-submitted, COND_BBE can read the ticks_delta value leftover
> from the previous batch execution - which is <= ctx_ticks (since that's the
> exit condition) - and immediately exit before the new SRM write propagates.
> 
> With ticks_delta = 0 (or any value <= ctx_ticks at prev-iteration exit), a
> stale read satisfies COND_BBE.
> With ~0u, even a stale read of the sentinel gives 0xFFFFFFFF <= ctx_ticks ->
> false -> batch continues safely.

I did some experiments, MI_MATH_STOREINV() stores negative value to
memory, so I assumed we're comparing signed values (and then 0 is fine
as it larger than negative opts->ctx_ticks). But this comparison is done
on unsigned values and 0 in ticks_delta is smaller than opts->ctx_ticks
casted to unsigned and spinner is terminating.

I think for sake of clearity instead of initializing ticks_delta to ~0u
I would change MI_MATH_STOREINV() to MI_MATH_STORE(), replace ~opts->ctx_ticks
to opts->ctx_ticks and add MAD_LT_IDD in COND_BBE.

--
Zbigniew

> 
> To reproduce: each gem_wsim invocation does 4000 submit/wait cycles on the
> same BO (5 engines × 5ms each).
> The failure appears only after many outer iterations under sustained load:
> 
> i=1; while true; do
>     echo "Iteration: $i"
>     gem_wsim -w
> "1.RCS.5000.0.0,1.BCS.5000.0.0,1.CCS.5000.0.1,1.VCS.5000.0.0,1.VECS.5000.0.0"
> -VV -r 4000 || break
>     ((i++))
> done
> 
> Typical failure after ~60 outer iterations:
> 
> CRITICAL: Failed assertion: w->duration.requested_ticks <=
> ~w->xe.data->spin.ticks_delta
> CRITICAL: error: 96000 > 2 (sometimes 0, 1)
> 
> With the sentinel reset before each submission, ran two days without
> failure.
> 
> --
> 
> Marcin
> 
> > 
> > --
> > Zbigniew
> > 
> > > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > > Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > > ---
> > >   lib/xe/xe_spin.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> > > index 874310789..331bed1d2 100644
> > > --- a/lib/xe/xe_spin.c
> > > +++ b/lib/xe/xe_spin.c
> > > @@ -60,7 +60,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
> > >   	spin->start = 0;
> > >   	spin->end = 0xffffffff;
> > >   	spin->wait_cond = 0;
> > > -	spin->ticks_delta = 0;
> > > +	spin->ticks_delta = ~0u;
> > >   	if (opts->ctx_ticks) {
> > >   		/* store start timestamp */
> > > -- 
> > > 2.43.0
> > > 
