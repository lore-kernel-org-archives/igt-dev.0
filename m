Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF07C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 11:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B690110E76D;
	Thu, 18 Jan 2024 11:45:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514FC10E76D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705578318; x=1737114318;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nu0q+58Vkj1ou6Mh91VCdzi+jA0T5QKJDWwctjxUk88=;
 b=Gz7pOHUNVx+oSf7FOqTBRSPIzhaz+Qc+Qvz+W3skM/wR3C39aDKO4xxr
 +OnqfZDNIpNVKzhI9E+6IV7P31BErIZPvNSMIgw62HK5wWHWHqlL1A3vY
 xegyPemCFS6eX/i6TqnXlw79OpCCtx9HchyzrukMh795idSEeWotPCmXB
 uR5AOJiYMNMrKZYOE74n5BpyI1yJmX0pky2wz3yCP9KtIsFJlzZd4oErW
 dbgzLq+MWU9ypgBzVZwDVeuae7CGI2HBwLL5UmJu3lNqIsz/CENBdJdgx
 7AtZrwypY5Zzdl4RPYBkRMdJp044dLR6A9sLZXRC9bBFZevGI1QkaGbwK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400093029"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="400093029"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 03:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="854965007"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="854965007"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 03:42:55 -0800
Date: Thu, 18 Jan 2024 12:42:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] gen_opencl_kernel: Fix code generation
Message-ID: <20240118114251.3o3pywjfvqjywrnz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Min Zhou <zhoumin@loongson.cn>,
 mchehab@kernel.org, zbigniew.kempczynski@intel.com
References: <20240117084251.857237-1-zhoumin@loongson.cn>
 <20240117185455.htwbfcrtepex37ic@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117185455.htwbfcrtepex37ic@kamilkon-desk.igk.intel.com>
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
Cc: Min Zhou <zhoumin@loongson.cn>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Min,

On 2024-01-17 at 19:55:14 +0100, Kamil Konieczny wrote:
> Hi Min,
> On 2024-01-17 at 16:42:51 +0800, Min Zhou wrote:
> > Since commit 1e0900fdb939 ("lib/intel_compute: Migrate xe_compute
> > library to intel_compute") had changed the `struct xe_compute_kernels`
> > to `struct intel_compute_kernels`, we should update it in the
> > ./opencl/gen_opencl_kernel script.
> > 
> > Signed-off-by: Min Zhou <zhoumin@loongson.cn>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 

Thank you for a patch, I merged it with added "opencl/" :

[PATCH i-g-t] opencl/gen_opencl_kernel: Fix code generation

Regards,
Kamil

PS. If you consider to contribute more please subscribe to igt-dev
mailing list at
https://lists.freedesktop.org/mailman/listinfo/igt-dev


> > ---
> >  opencl/gen_opencl_kernel | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/opencl/gen_opencl_kernel b/opencl/gen_opencl_kernel
> > index e6f9601e0..15c6313d9 100755
> > --- a/opencl/gen_opencl_kernel
> > +++ b/opencl/gen_opencl_kernel
> > @@ -84,7 +84,7 @@ INCLUDES
> >  
> >  cat $out_files >>$output_fname
> >  
> > -echo "const struct xe_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
> > +echo "const struct intel_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
> >  
> >  for i in "${args[@]}"; do
> >          out="$dest_dir/${i}_${kernel_name}.h"
> > -- 
> > 2.39.3
> > 
