Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8556C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 16:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5810E0BE;
	Tue, 21 Jan 2025 16:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F86/WWy1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2273610E0BE
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737476275; x=1769012275;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QFJv0dQG3RjOpuZmqPF7uBQIWINAoSb+w3flKgC9EdI=;
 b=F86/WWy15Sjy8uQjEDrDvg+5HUmi5G7bVz8gdLEVP2aG0T4CdXSqTROE
 A7tffQ69nbfPFnVa19B7UygtS9Wxgopmfbzs+fB0bV4Ae0G5zULAD6hdL
 YWykE5nlyYstCH00KM1bYS7UILmGyaOZ+vyC9ujPgIQLZF0he3bF2roji
 e+WA4nWazO4zx/iJxOpPE3CzwqhrQoM1sLOmxey9RzbRWKmsPFJ8phu6E
 8s1n77vw/KOz3o97gtUeuY7QkMa9EcbQg/8NtbzT7RrpX5ikL84Z1XzzD
 7OICDVvelPp1fY/4y+a99aT5Fv6aqDXxEGlQJrzhflzz3H++n3r9khBxZ A==;
X-CSE-ConnectionGUID: JXabwXDvSJuxqVbbH2Bu9g==
X-CSE-MsgGUID: yjdD3i7YSQOQqhutgJ3PBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37167283"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37167283"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 08:17:55 -0800
X-CSE-ConnectionGUID: 4eUrTcp5SE+TLFVYHeHEKQ==
X-CSE-MsgGUID: LvKX3/6+Qnu/m+JZiJAuZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106860622"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 08:17:54 -0800
Date: Tue, 21 Jan 2025 17:17:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 jordan.l.justen@intel.com, christoph.manszewski@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_eudebug_online: Fix 32b
 compilation warnings/errors
Message-ID: <20250121161751.aqotrwo6pzgyzl73@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 jordan.l.justen@intel.com, christoph.manszewski@intel.com
References: <20250120131338.131713-1-dominik.grzegorzek@intel.com>
 <20250120131338.131713-2-dominik.grzegorzek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120131338.131713-2-dominik.grzegorzek@intel.com>
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

Hi Dominik,
On 2025-01-20 at 14:13:38 +0100, Dominik Grzegorzek wrote:
> Fix metadata allocation so it is properly sized on 32b and
> correct all debug prints which were causing compilation warnings.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index f532387af..41a01c02f 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -569,7 +569,7 @@ static void get_aips_offset_table(struct online_debug_data *data, int threads)
>  
>  	igt_debug("AIPs offset table:\n");
>  	for (int i = 0; i < threads; i++)
> -		igt_debug("%lx\n", data->aips_offset_table[i]);
> +		igt_debug("%" PRIx64 "\n", data->aips_offset_table[i]);
>  }
>  
>  static int get_stepped_threads_count(struct online_debug_data *data, int threads)
> @@ -1063,8 +1063,8 @@ static void run_online_client(struct xe_eudebug_client *c)
>  	uint32_t *ptr;
>  	int fd, vm_flags;
>  
> -	metadata[0] = calloc(2, sizeof(*metadata));
> -	metadata[1] = calloc(2, sizeof(*metadata));
> +	metadata[0] = calloc(2, sizeof(**metadata));
> +	metadata[1] = calloc(2, sizeof(**metadata));

There are other places with similar pattern 'sizeof(*metadata)'
If they are also bugs, imho this patch should be splitted into
PRIu64/other prints and other one for fixing those sizeof.

Regards,
Kamil

>  	igt_assert(metadata[0]);
>  	igt_assert(metadata[1]);
>  
> @@ -2328,11 +2328,11 @@ static void test_many_sessions_on_tiles(int fd, bool multi_tile)
>  
>  		if (multi_tile)
>  			igt_assert_f(diff < WORKLOAD_DELAY_US,
> -				     "Expected to execute workloads concurrently. Actual delay: %lu ms\n",
> +				     "Expected to execute workloads concurrently. Actual delay: %" PRIu64 " ms\n",
>  				     diff);
>  		else
>  			igt_assert_f(diff >= WORKLOAD_DELAY_US,
> -				     "Expected a serialization of workloads. Actual delay: %lu ms\n",
> +				     "Expected a serialization of workloads. Actual delay: %" PRIu64 " ms\n",
>  				     diff);
>  	}
>  
> -- 
> 2.34.1
> 
