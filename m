Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FB9C48BC4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 17:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C1410EA0E;
	Thu, 15 Feb 2024 17:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FU4IU4iT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB3110EA0E
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708016991; x=1739552991;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=78z0ScqjVgzJZirz9WTI0Iav6tEXIoWyP0d7UGXQ4G0=;
 b=FU4IU4iTfqCFoUxNURubCY2FeNBQedI9sMJfTMXcAjrNI7oXLwA1Dd7Y
 qoWIcGhJcmp+0pRwvALWdDA7CS5t+bXg/8Lpk78nVvZPvst4FkEgTG0Kz
 ltvdWu4v7DawwxlLQrshFCwFCG14iffQEHzkgOpR75IHVL8bz3HvaSHvC
 QOnivUZ9ET4BywOO7KPkym6qYLWmqmEQFyqCa8cj5Eh/q1ej/IDTIOrau
 RNJXS9S7MFLxk+mSlvU3NTN1Bt5wjNQ5bqVzpAP+VsZ3x6gcxUBJjqbm+
 H48zChkgdwyGCpZ3Cv+kLIFZOHACis3UdJCzY6zRN0X4DckMhIHh1Jkj7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2237293"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="2237293"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 09:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8262823"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 09:09:49 -0800
Date: Thu, 15 Feb 2024 18:09:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 09/17] scripts/code_cov_parse_info: stop
 recording/writing too old fields
Message-ID: <20240215170946.isatjeyc7kuv2iig@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
 <ee96b3366066e1e00ae7b55466f822b3bd98ca13.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee96b3366066e1e00ae7b55466f822b3bd98ca13.1707992666.git.mchehab@kernel.org>
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
On 2024-02-15 at 11:27:18 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> As we'll be using json as basis, drop support for the fields that:
> 
> - aren't used at the reports;
> - aren't even present when lcov parses gcc json format.
> 
> Such fields are only handled on lcov for very old gcc versions.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  scripts/code_cov_parse_info | 33 ---------------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 92091215d224..038440a9c3e3 100644
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -201,15 +201,10 @@ sub parse_info_data($)
>  
>  		# FNF:<number of functions found>
>  		if (m/^FNF:(-?\d+)/) {
> -			$record{$source}{func}{$func}{fnf} = $1;
>  			next;
>  		}
>  		# FNH:<number of function hit>
>  		if (m/^FNH:(-?\d+)/) {
> -			my $hits = $1;
> -			if (!defined($record{$source}{func}{$func}{fnh}) || $record{$source}{func}{$func}{fnh} < $hits) {
> -				$record{$source}{func}{$func}{fnh} = $hits;
> -			}
>  			next;
>  		}
>  
> @@ -240,15 +235,10 @@ sub parse_info_data($)
>  
>  		# BRF:<number of branches found>
>  		if (m/^BRF:(-?\d+)/) {
> -			$record{$source}{func}{$func}{brf} = $1;
>  			next;
>  		}
>  		# BRH:<number of branches hit>
>  		if (m/^BRH:(-?\d+)/) {
> -			my $hits = $1;
> -			if (!defined($record{$source}{func}{$func}{brh}) || $record{$source}{func}{$func}{brh} < $hits) {
> -				$record{$source}{func}{$func}{brh} = $hits;
> -			}

Above is self-explanatory.

>  			next;
>  		}
>  
> @@ -340,34 +330,11 @@ sub write_filtered_file($)
>  				if (defined($record{$source}{func}{$func}{fnda})) {
>  					$filtered .= "FNDA:" . $record{$source}{func}{$func}{fnda} . ",$func\n";
>  				}
> -				if ($record{$source}{fnf}) {
> -					$filtered .= "FNF:". $record{$source}{func}{$func}{fnf} ."\n";
> -				}
> -				if ($record{$source}{fnh}) {
> -					$filtered .= "FNH:". $record{$source}{func}{$func}{fnh} ."\n";
> -				}
> -			}
>  
> -			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{func}{$func}{da} }) {
> -				$filtered .= "DA:$ln," . $record{$source}{func}{$func}{da}{$ln} . "\n";

Why are you removing DA here? It is used elswhere.

>  			}
> -			foreach my $where(sort sort_where keys %{ $record{$source}{func}{$func}{brda} }) {
> -				my $taken = $record{$source}{func}{$func}{brda}{$where};

Same here, BRDA.

>  				$taken = "-" if (!$taken);
>  				$filtered .= "BRDA:$where,$taken\n";
>  			}
> -			if ($record{$source}{func}{$func}{brf}) {
> -				$filtered .= "BRF:". $record{$source}{func}{$func}{brf} ."\n";
> -			}
> -			if ($record{$source}{func}{$func}{brh}) {
> -				$filtered .= "BRH:". $record{$source}{func}{$func}{brh} ."\n";
> -			}
> -			if ($record{$source}{func}{$func}{lf}) {
> -				$filtered .= "LF:". $record{$source}{func}{$func}{lf} ."\n";
> -			}
> -			if ($record{$source}{func}{$func}{lh}) {
> -				$filtered .= "LH:". $record{$source}{func}{$func}{lh} ."\n";

LF and LH?

If above is correct you can add my a-b

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> -			}
>  		}
>  
>  		$filtered .= "end_of_record\n";
> -- 
> 2.43.0
> 
