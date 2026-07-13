Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90843C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 11:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D2510E905;
	Mon, 13 Jul 2026 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8vOldKn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD32D10E905
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783942069; x=1815478069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=07/4F6UYiH9GqzgA20vjPYG2wl9X2smDGC1KvulG6zs=;
 b=U8vOldKnMu+nA6Atf5h/EJ7n8pyqzNaAOh037d5KeW/8W743kX1OtuW4
 d4bPr8j7/zdnzbXCzjWjLL9K7N92piY20pQZygoviyKyzd9LiSSolizyv
 fZvvEwprCbE1O3PWrxnOAuSkGjQ9CJ/Vs5FWk2kkLhNmoWd3o0mczYYsv
 AJcDVwbBp4slcEmGkW4JdYaA98Rp3JJzH6j0QeVTGGME3ahi4nHrCElAh
 uLapLSPIbZkjOdZBFjNEYpdia6hADjuc0/R+8RKJfYcPHHWHf4mN06iuf
 xsLbc2CfGHKHVp4q4Edj67myDTNFOP3KFCWTn77Tq1QOHioRrltKl8Q8S g==;
X-CSE-ConnectionGUID: v0saW+J9QzytW11k998GcQ==
X-CSE-MsgGUID: D8IC/tvmQ/KUH4JD0o9Y7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="72072311"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="72072311"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:27:48 -0700
X-CSE-ConnectionGUID: wBTMoDSdSSawfA/TjA0woA==
X-CSE-MsgGUID: 7D/l2NgETy23R74Z1lb4RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="293718529"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 04:27:48 -0700
Date: Mon, 13 Jul 2026 13:27:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_madvise: Fix the type for
 sighandler_t
Message-ID: <20260713112745.73anubrsr75atexa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Bernd Kuhls <bernd@kuhls.net>, igt-dev@lists.freedesktop.org
References: <20260710184619.2347456-1-bernd@kuhls.net>
 <20260710184619.2347456-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710184619.2347456-2-bernd@kuhls.net>
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

Hi Bernd,
On 2026-07-10 at 20:46:19 +0200, Bernd Kuhls wrote:
> __sighandler_t is private interface in glibc so its
> better to not use it, as an aside fixes build with musl
> 
> Patch was inspired by
> https://lists.gnu.org/r/bug-time/2025-03/msg00000.html
> 
> Fixes build error seen with musl-based toolchains:
> 
> ../tests/intel/xe_madvise.c: In function ‘test_dontneed_after_mmap’:
> ../tests/intel/xe_madvise.c:400:48: error: ‘__sighandler_t’ undeclared
>  (first use in this function); did you mean ‘sighandler_t’?
>   400 |          old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Good catch! LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw citing man page: "Avoid its use: use sigaction(2) instead.
See Portability below" so maybe it should be moved to sigaction.

Regards,
Kamil

> ---
>  tests/intel/xe_madvise.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 3d36be941..a33a08630 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -397,8 +397,8 @@ static void test_dontneed_after_mmap(int fd)
>  		char *ptr = (char *)map;
>  		int sig;
>  
> -		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
> -		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
> +		old_sigsegv = signal(SIGSEGV, (sighandler_t)sigtrap);
> +		old_sigbus = signal(SIGBUS, (sighandler_t)sigtrap);
>  
>  		sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal mask */
>  		switch (sig) {
> -- 
> 2.47.3
> 
