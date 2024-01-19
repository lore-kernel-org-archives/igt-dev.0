Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D39C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 12:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD2710EA10;
	Fri, 19 Jan 2024 12:51:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659AC10EA10
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 12:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705668674; x=1737204674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ewJm9zRgVt4CPn7rGUhH1ggb12lAV9EIp1DQ2ACjRTY=;
 b=LBgw3LkaY7ZAm2nEk/jcw91YwMpXsWPfHfMxGdlYJJ17nyDbc24inv7N
 B2qMfg4bvhiA4sGX5uRbYLlxJKdMrxQ/kZGzyXv0lZA1/ET/O+u/Vvf+C
 GKTPt4W9zCqRJOoyce/+MOfu7YddwAzXnGLgJQ/44mjGaxzhyXm03Xr13
 1j5zq88t2xUeARU/eOMwbpwy+9Q5+QHUpQpMGGmnCPIkhC6siCFL3PgK3
 Ura1lQZv9tKV+YEOX8F2wQKH4hURSciIU6b3How82zvtkH67crbUmRHyy
 OzhhIqRl1jEe6Rm7DZJ9+ASlSfl5D7IcDpckt+7mm9tzKgeWEwfa/HpW4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14259115"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14259115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 04:51:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="26761713"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 04:51:13 -0800
Date: Fri, 19 Jan 2024 13:50:49 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_atomic: Skip early on
 unsupported platform
Message-ID: <20240119125049.vcnvgmswrntutzqc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 janga.rahul.kumar@intel.com, aditya.chauhan@intel.com
References: <20240119101844.15898-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240119101844.15898-1-nirmoy.das@intel.com>
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Nirmoy,
On 2024-01-19 at 11:18:44 +0100, Nirmoy Das wrote:
> Skip early if the test is not supported without
> creating a dynamic subtest.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_atomic.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> index a21def999..209df8419 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -137,14 +137,14 @@ igt_main
>  
>  			xe_for_each_mem_region(fd, memreg, region) {
>  
> +					igt_skip_on(!has_atomics(fd, region));
> +

Fix indentation.

>  				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>  					      xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance,
> -					      hwe->gt_id, xe_region_name(region)) {
> +					      hwe->gt_id, xe_region_name(region))
>  
> -					igt_skip_on(!has_atomics(fd, region));
>  					basic_inst(fd, MI_ATOMIC_DEC, hwe, region);
> -				}
>  			}
>  		}
>  	}
> @@ -155,14 +155,14 @@ igt_main
>  
>  			xe_for_each_mem_region(fd, memreg, region) {
>  
> +					igt_skip_on(!has_atomics(fd, region));
> +

Fix indentation.

With that fixed:
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>  					      xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance,
> -					      hwe->gt_id, xe_region_name(region)) {
> +					      hwe->gt_id, xe_region_name(region))
>  
> -					igt_skip_on(!has_atomics(fd, region));
>  					basic_inst(fd, MI_ATOMIC_INC, hwe, region);
> -				}
>  			}
>  		}
>  	}
> -- 
> 2.42.0
> 
