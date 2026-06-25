Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3306ECDB466
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 09:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1AF10F1E2;
	Thu, 25 Jun 2026 09:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brgbDL6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0410F1D4
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782379949; x=1813915949;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NyJXdTGCAqmrWj52lf0+OwQ1ecVOJ41k58Aot+dNTYA=;
 b=brgbDL6Z2mKJolLjjZbtU1V2JQJnc09EPE+tzd0Kp0LyyKNwBRUx/2+4
 glwzeialJdd1P3IZsMWdxCXpznDcPywWUlQRMFmyArGWDGX23ERpOvnCr
 ogKZDjL29cTD/2KMNP6BqwEUHJ53n0foVsUD0ESm+EdmRFV5BOET7Ln/1
 RCkFidpUfTq6SHDNcPpj4zimmMjuv30chqPo5BlTnm9/qcHeqEbmhD6tR
 vuXa/I9diyoKpB8Vll+s9sMU+pHcm+dGsSe9H64LW9AJ8+dnDS7ALNIdg
 xhTRAXw2R4bZVO8Dew2caKsxIv8PPziWxggynTnwU/Qnvx3BfsCuik/0r Q==;
X-CSE-ConnectionGUID: c+Fn+DLuSgOwDZCjWpUE5Q==
X-CSE-MsgGUID: ao/uNWO5T+q96JS12Qf9RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82137433"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="82137433"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:32:29 -0700
X-CSE-ConnectionGUID: mZF80B+wQ1OimfdguAVh3Q==
X-CSE-MsgGUID: t8lnsybSS5CijZ2c22icZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="249095143"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.94])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:32:28 -0700
Date: Thu, 25 Jun 2026 11:32:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] tests/intel/xe_pat: Fix semaphore_wait instruction
Message-ID: <kmhtc4swueyldbrvq2l6hpn4ptf6pvbold67fiudvj67ce6zsm@b4lgp2cduztp>
References: <20260624064751.2271122-2-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260624064751.2271122-2-balasubramani.vivekanandan@intel.com>
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

On Wed, Jun 24, 2026 at 12:17:52PM +0530, Balasubramani Vivekanandan wrote:
> Length of the instruction was set incorrectly and one of the operands
> was not updated. Fixed it.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  tests/intel/xe_pat.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index dc682b1acb..38341ec28d 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1698,10 +1698,11 @@ static void __false_sharing(int fd, const struct fs_pat_entry *fs_entry)
>  
>  	/* Unblock after cpu started to spin */
>  	batch[i++] = MI_SEMAPHORE_WAIT_CMD | MI_SEMAPHORE_POLL |
> -		     MI_SEMAPHORE_SAD_NEQ_SDD | (4 - 2);
> +		     MI_SEMAPHORE_SAD_NEQ_SDD | 3;

Good catch, thanks for fixing this.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	batch[i++] = 0;
>  	batch[i++] = addr + CPUDW_INC;
>  	batch[i++] = addr >> 32;
> +	batch[i++] = 0;
>  
>  	loop_addr = i;
>  	batch[i++] = MI_STORE_DWORD_IMM_GEN4;
> -- 
> 2.43.0
> 
