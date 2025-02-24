Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B426C021A6
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:44:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8402610E50E;
	Mon, 24 Feb 2025 13:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzizDY0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2562E10E07A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 07:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740381484; x=1771917484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sT2H4LfLd+doCB8uNIKpyP09+Nt3UQUPTLHZrbfa4K4=;
 b=FzizDY0cOZ0zUnEFCVqI+nTj8DIGZyI3zBa9H6x75zfuKJbZgtWJ+d1j
 VMa6bf8ptkn+9EVzRDatx4F7TQGqDv7sc41y2XTEOWLk50+plttcVWB2v
 qa9x+w5KiqfgGw+pWHHoqc0dOaGRgBWYPCAEDHhoQRygIF2UomxrsCbWU
 po6efSGQScNxf//eP50S8f6Ldh+hPVwPzxIyjjL7nm8EKXTHK0lI8XBSV
 9WRL/HdnYuD0TOnQU9tgicSl5fnOHTpyZ4rXAGzfA6elFygTMmVWUyuQQ
 MwDTFnAiU+e+ddhVBKVb07jcdL8wAwGgNuYnBIRQrjg6ECPqDK5S1YZFa A==;
X-CSE-ConnectionGUID: zvdmaxSETb6xIJrMRIPVGw==
X-CSE-MsgGUID: O9XbUrQ7TN29v+x+PNwcQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="44776979"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="44776979"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 23:18:04 -0800
X-CSE-ConnectionGUID: z86cp1OOSWCx5Jbg4V8trA==
X-CSE-MsgGUID: +fNAKc+dQg+5wjDp9pF3Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="115708666"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.118])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 23:18:02 -0800
Date: Mon, 24 Feb 2025 08:17:59 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/5] lib/intel_compute: Allow the user to provide a
 custom compute kernel
Message-ID: <20250224071759.c2ug6doncrfth2wd@zkempczy-mobl2>
References: <20250205101748.1117809-1-francois.dugast@intel.com>
 <20250205101748.1117809-4-francois.dugast@intel.com>
 <20250213070006.szwhib7r3bompjfz@zkempczy-mobl2>
 <Z7iBpt1D-bEZUBJN@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7iBpt1D-bEZUBJN@fdugast-desk>
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

On Fri, Feb 21, 2025 at 02:37:42PM +0100, Francois Dugast wrote:
> Hi Zbigniew,
> 
> On Thu, Feb 13, 2025 at 08:00:06AM +0100, Zbigniew Kempczyński wrote:
> > On Wed, Feb 05, 2025 at 11:17:04AM +0100, Francois Dugast wrote:
> > > Allow the user to provide a custom compute kernel which will be used
> > > instead of the default compute square one. This will be helpful to
> > > try out corner cases which require a specific compute kernel.
> > > 
> > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  lib/intel_compute.c | 26 ++++++++++++++++++--------
> > >  lib/intel_compute.h |  2 ++
> > >  2 files changed, 20 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > > index e0776fb6d..a826d58c0 100644
> > > --- a/lib/intel_compute.c
> > > +++ b/lib/intel_compute.c
> > > @@ -1770,6 +1770,8 @@ static bool __run_intel_compute_kernel(int fd,
> > >  	unsigned int batch;
> > >  	const struct intel_compute_kernels *kernels = intel_compute_square_kernels;
> > >  	enum intel_driver driver = get_intel_driver(fd);
> > > +	const unsigned char *kernel;
> > > +	unsigned int kernel_size;
> > >  
> > >  	for (batch = 0; batch < ARRAY_SIZE(intel_compute_batches); batch++) {
> > >  		if (ip_ver == intel_compute_batches[batch].ip_ver)
> > > @@ -1787,16 +1789,24 @@ static bool __run_intel_compute_kernel(int fd,
> > >  		return false;
> > >  	}
> > >  
> > > -	while (kernels->kernel) {
> > > -		if (ip_ver == kernels->ip_ver)
> > > -			break;
> > > -		kernels++;
> > > +	/* If the user provides a kernel, use it */
> > > +	if (user && user->kernel) {
> > > +		kernel = user->kernel;
> > > +		kernel_size = user->kernel_size;
> > > +	} else {
> > > +		while (kernels->kernel) {
> > > +			if (ip_ver == kernels->ip_ver)
> > > +				break;
> > > +			kernels++;
> > > +		}
> > > +		if (!kernels->kernel)
> > > +			return false;
> > > +		kernel = kernels->kernel;
> > > +		kernel_size = kernels->size;
> > 
> > According to how we build pipeline indirect data we're limited to
> > three arguments - *input, *output, count. Allowing the user to provide
> > a custom kernel won't work unless type constraint will be met.
> > I don't like this change, because someone who doesn't know how
> > this work will start providing its own kernels will be surprised
> > it doesn't work.
> 
> The way we statically build the pipeline indirect data is a good
> balance of simplicity and flexibility, as we can test a lot even
> with the constraint *input, *output, count.
> 
> More complex KMD tests will require simple specific kernels which
> still comply with this constraint. For example the one below can
> trigger a page fault at 0x10000 from the compute kernel context
> so that we run other checks in KMD, all from IGT:
> 
>     __kernel void square(__global float* input,
>                          __global float* output,
>                          const unsigned int count) {
>         int i = get_global_id(0);
>         const __global uint* addr = 0x10000;
>         output[i] = *addr;
>     }
> 

> This is the reason for allowing custom compute kernels. This way
> we can leverage the existing lib/intel_compute infrastructure to
> test corner cases. I believe having this possibility is far more
> important than the risk of a user incorrectly expecting IGT to
> provide a full "compute runtime" able to run any kernel.

Ok, above code is a good argument for allowing custom kernels,
especially when you want to trigger pf from EU.

> 
> Would you be fine if the doc of struct user_execenv::kernel would
> make the constraint of *input, *output, count explicit?

Yes, but please alter count in indirect data fill, currently
create_indirect_data() has it hardcoded immediately after
input and output addresses.

> 
> If not, what about replacing "const unsigned char *kernel" with
> an enum which would be used to obtain the right kernel from a
> library of "approved" kernels in intel_compute_kernels.c?

Strict kernel prototype is fine for me.

Thanks for the explanation.

--
Zbigniew

> 
> Francois
> 
> > 
> > --
> > Zbigniew
> > 
> > >  	}
> > > -	if (!kernels->kernel)
> > > -		return false;
> > >  
> > > -	intel_compute_batches[batch].compute_exec(fd, kernels->kernel,
> > > -						  kernels->size, eci, user);
> > > +	intel_compute_batches[batch].compute_exec(fd, kernel,
> > > +						  kernel_size, eci, user);
> > >  
> > >  	return true;
> > >  }
> > > diff --git a/lib/intel_compute.h b/lib/intel_compute.h
> > > index c4b4ee5e1..6096bb83a 100644
> > > --- a/lib/intel_compute.h
> > > +++ b/lib/intel_compute.h
> > > @@ -35,6 +35,8 @@ struct intel_compute_kernels {
> > >  
> > >  struct user_execenv {
> > >  	uint32_t vm;
> > > +	const unsigned char *kernel;
> > > +	unsigned int kernel_size;
> > >  };
> > >  
> > >  extern const struct intel_compute_kernels intel_compute_square_kernels[];
> > > -- 
> > > 2.43.0
> > > 
