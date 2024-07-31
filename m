Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C78C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A779510E646;
	Wed, 31 Jul 2024 14:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAd8HCyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB0C10E646
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437794; x=1753973794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ycZ2/p73qJ3/KAvsFHnoRwFn7mvLweNgZVVq7uEI01Q=;
 b=IAd8HCyyrEMkkwm/Xv3EeirY+w0X3dbMqAcPvbgPTXk30kDSBzFoH0Nu
 VYIYY80HOyG91ZiXrHctAqZa6kxoMNTyE06iK1lVzNq+MnsKkQQ5yyjzo
 5A4OebG40Kas+6qeYI8ov5yafKiFVWW+YiFQQz5J3eTlpWMe3svwgRHVl
 ns11nPUMKe2jrLN68OJbikjFGDNOkWYXc4XrvmtzEPAXYOrS3ApazCLF1
 lqsaWSLB00Tf35nAvgHGaGTF2MbY+RHcaNtd/tR8qZv4vDkSP4c6xcLQU
 jhbDCfTzRZgW5FjXhl9LMfPQW6DNObJuM4nx0OMGwuQzePAiWV5oBAeqd Q==;
X-CSE-ConnectionGUID: RgTK2AhNTmyBO9IB162X/g==
X-CSE-MsgGUID: feDSQ596SF6I1DZtbi/M/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37839337"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37839337"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:56:32 -0700
X-CSE-ConnectionGUID: YooZ2jnPQQCLzA0KreoWxQ==
X-CSE-MsgGUID: H7iLxgNqQcm8u2i/U17Tfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="58846600"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 07:56:30 -0700
Date: Wed, 31 Jul 2024 16:56:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
Subject: Re: [PATCH v3 i-g-t 2/6] benchmarks/gem_wsim: Unify bond handling
Message-ID: <20240731145627.g6ej4i4vnzqp5fdc@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 tursulin@igalia.com, lukasz.laguna@intel.com
References: <20240729175219.1636694-1-marcin.bernatowicz@linux.intel.com>
 <20240729175219.1636694-3-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240729175219.1636694-3-marcin.bernatowicz@linux.intel.com>
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

Hi Marcin,
On 2024-07-29 at 19:52:15 +0200, Marcin Bernatowicz wrote:
> This change brings the handling of bonding information in line with
> other parts of the code that use structured approaches for similar data,
> enhancing overall consistency. Prepares code to use struct intel_engines as
> bond.mask.
> 
> v2: Correct indentation.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  benchmarks/gem_wsim.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index 0cf93228a..0445e9942 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -172,10 +172,7 @@ struct w_step {
>  		int priority;
>  		struct intel_engines engine_map;
>  		bool load_balance;
> -		struct {
> -			uint64_t bond_mask;
> -			enum intel_engine_id bond_master;
> -		};
> +		struct bond bond;
>  		int sseu;
>  		struct working_set working_set;
>  	};
> @@ -1146,10 +1143,10 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>  							  "Invalid context at step %u!\n",
>  							  nr_steps);
>  					} else if (nr == 1) {
> -						step.bond_mask = engine_list_mask(field);
> -						check_arg(step.bond_mask == 0,
> -							"Invalid siblings list at step %u!\n",
> -							nr_steps);
> +						step.bond.mask = engine_list_mask(field);
> +						check_arg(step.bond.mask == 0,
> +							  "Invalid siblings list at step %u!\n",
> +							  nr_steps);
>  					} else if (nr == 2) {
>  						tmp = str_to_engine(field);
>  						check_arg(tmp <= 0 ||
> @@ -1157,7 +1154,7 @@ parse_workload(struct w_arg *arg, unsigned int flags, double scale_dur,
>  							  tmp == DEFAULT,
>  							  "Invalid master engine at step %u!\n",
>  							  nr_steps);
> -						step.bond_master = tmp;
> +						step.bond.master = tmp;
>  					}
>  
>  					nr++;
> @@ -2170,10 +2167,7 @@ static int prepare_contexts(unsigned int id, struct workload *wrk)
>  						     ctx->bond_count *
>  						     sizeof(struct bond));
>  				igt_assert(ctx->bonds);
> -				ctx->bonds[ctx->bond_count - 1].mask =
> -					w->bond_mask;
> -				ctx->bonds[ctx->bond_count - 1].master =
> -					w->bond_master;
> +				ctx->bonds[ctx->bond_count - 1] = w->bond;
>  			}
>  		}
>  	}
> -- 
> 2.31.1
> 
