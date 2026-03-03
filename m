Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CB5EDA694
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 16:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957A10E853;
	Tue,  3 Mar 2026 16:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNS6F7g3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B101210E853
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 16:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772555492; x=1804091492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3HiN/kWr3EDQkT5vNzuzUelQFaZJ2FDP5Gh7CKQelUQ=;
 b=aNS6F7g339yZyeiwl1zjfiMsRrWeiC0dcd4eZcCds/X9W3VJwyYmO3G7
 j2vy0MyRJrrJxuHXIqck2kQl6jxqrxb2jaTQnJ/JP3B3Y4OAFRk/yqTu8
 ui/4Hig87nf1Bf28tpDWYU8+08xKGLScel15XZnMQvTMtqsfHbFit9etz
 GOMF2RjnAuassKMsjT1DRTR6tg4nGBnWPFd5iZKCXdueLoL+RHXroT04V
 lULrqhd88ZgIdXbROSNtQRKRk+3ovDRyv2jYUZ1jEijDdig4uk1rq9KI0
 yZToxg9rrkjcuT4HFr43vutICxjGiBvksPb195VaIcBteSqcM0qxsdVn8 A==;
X-CSE-ConnectionGUID: fKPUmohhS++ZJxDgnKAk2Q==
X-CSE-MsgGUID: MIGDDPv4QO+GGFD8xYkG6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76200372"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="76200372"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 08:31:31 -0800
X-CSE-ConnectionGUID: zeYU9lZcRbitw3FZjnxcnA==
X-CSE-MsgGUID: g8Oald+VTaeU7GEHcQMsLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="223051302"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 08:31:29 -0800
Date: Tue, 3 Mar 2026 17:31:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nishit Sharma <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and
 loop size if provided
Message-ID: <20260303163111.in3fabz2gg2hxjeu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Nishit Sharma <nishit.sharma@intel.com>
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
 <20260303134706.41948-10-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303134706.41948-10-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-03-03 at 14:47:10 +0100, Zbigniew Kempczyński wrote:
> If user passes its own input/output or number of iterations start
> to use it instead of hardcoded ones. This pattern was already used
> in other pipelines and only Xe3p missed this.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/intel_compute.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 1165bdafd9..bfe0a75a7c 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>  	struct inline_data idata = {};
>  	struct bo_execenv execenv;
>  	float *input_data, *output_data;
> +	uint64_t bind_input_addr = (user && user->input_addr) ? user->input_addr : ADDR_INPUT;
> +	uint64_t bind_output_addr = (user && user->output_addr) ? user->output_addr : ADDR_OUTPUT;
>  	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
>  	int entries = ARRAY_SIZE(bo_dict);
>  	int64_t timeout_one_ns = 1;
> @@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>  	memcpy(bo_dict[0].data, kernel, size);
>  	memset(bo_dict[1].data, 0, 4096);
>  
> -	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> +	xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_output_addr,
>  				  execenv.loop_count);
>  	idata.xe3p.indirect_addr_lo = indirect_addr;
>  	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> @@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const unsigned char *kernel,
>  	}
>  
>  	if (!user || (user && !user->skip_results_check))
> -		bo_check_square(input_data, output_data, execenv.array_size);
> +		bo_check_square(input_data, output_data, execenv.loop_count);

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  
>  	bo_execenv_unbind(&execenv, bo_dict, entries);
>  	bo_execenv_destroy(&execenv);
> -- 
> 2.43.0
> 
