Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6161FC4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 16:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD0210E9D6;
	Thu, 15 Feb 2024 16:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7Jbbe3m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4ED10E9D5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708015278; x=1739551278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EOCxhRjGejasA/7QrnKLCHOnhoh3NJJ/YT+UAz/MSD8=;
 b=m7Jbbe3mePutrvocF7lHBc7oID2p6FflYksvm+Ai1pm1YcochSAAgMPg
 e7borLxF+a6sOaYADdfcG15tqK9WRRzQKkusl77PI/2Xb2YmOrqDrcCxu
 frcu+AefVCT6NcZ2Nw7EdHCgrhYMp1hceFTJSg53PbDjPtsTEdnBHVl1I
 TJLztcuxTL1sQx+tJsts70L5vSn3n9CH6uEttwp5yb5pI13jG0gUOywSd
 briopmbGt72F3OXuKM/STJg/2+7cTy9vl06wLe9vT/BS5NrzXcqGwHbvD
 4Ww3ymhw2vbjBrVTTlly0dq7aXSenjY+jvXczYLy7/WcCRRbsEmu9dzh+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13511514"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13511514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 08:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="3968380"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 08:41:17 -0800
Date: Thu, 15 Feb 2024 17:41:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 06/17] scripts/code_cov_parse_info: prepare $all_branch
 to get function data
Message-ID: <20240215164113.txdt7bpvazbnfcl5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <f36c320f1be10d56a076464ed68fd4172c9e13aa.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f36c320f1be10d56a076464ed68fd4172c9e13aa.1707992666.git.mchehab@kernel.org>
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

Hi Mauro,
On 2024-02-15 at 11:27:15 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Right now, we store only the branch counts. We also need to store
> the functions that each branch belongs. So, add a new hash in
> order to allow adding function data later on.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 1be7fddf3f3e..d28217cc196d 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -233,7 +233,7 @@ sub parse_info_data($)
>  			$was_used = 1 if ($taken > 0);
>  
>  			$record{$source}{$func}{brda}{$where} += $taken;
> -			$all_branch{$source}{"$where"} += $taken;
> +			$all_branch{$source}{"$where"}{count} += $taken;
>  			next;
>  		}
>  
> @@ -448,7 +448,7 @@ sub gen_stats()
>  
>  		foreach my $where (keys(%{$all_branch{$source}})) {
>  			$stats{"branch_count"}++;
> -			$stats{"branch_reached"}++ if ($all_branch{$source}{$where} != 0);
> +			$stats{"branch_reached"}++ if ($all_branch{$source}{$where}{count} != 0);
>  		}
>  	}
>  
> @@ -607,7 +607,7 @@ sub generate_report($)
>  		}
>  		foreach my $source (keys(%{$report{$f}{"all_branch"}})) {
>  			foreach my $where (keys(%{$report{$f}{"all_branch"}{$source}})) {
> -				$all_branch{$source}{"$where"} += $report{$f}{"all_branch"}{$source}{$where};
> +				$all_branch{$source}{"$where"}{count} += $report{$f}{"all_branch"}{$source}{$where}{count};
>  			}
>  		}
>  		for my $source(keys(%{$report{$f}{"files"}})) {
> @@ -887,7 +887,7 @@ sub check_source_branches()
>  
>  		my @lines;
>  		foreach my $where (sort keys %{$all_branch{$source}}) {
> -			my $taken = $all_branch{$source}{$where};
> +			my $taken = $all_branch{$source}{$where}{count};
>  			next if ($taken > 0);
>  
>  			next if !($where =~ m/^(-?\d+),(-?\d+),(-?\d+)/);
> -- 
> 2.43.0
> 
