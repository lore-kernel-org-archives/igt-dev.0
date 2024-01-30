Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92833C46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 08:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470C9112E21;
	Tue, 30 Jan 2024 08:58:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67372112E43
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706605078; x=1738141078;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S+Cznye575QlLYJ4p+dWHTR1kCHgFc9nd+eh8b0ZA3s=;
 b=FZLA7bi9QnZDNr0Le9HvFZaTBHUeoxnPE24UoEuKoRkV4L0u0E18Mgmf
 2BgAi7hoanJlaS7M93D9OCq76PDqWRmcg+fP5nhmnP+xKH6JMGvGFytNr
 fYDFkq+mRkZsjVbHFps/uGYteQyLgqCks0R6o3rDHtV/sasjAAP9D9wCG
 7Bzr1mb74ENpQxaA3Y0FhfWiXpOfrAb+8HzSmVy8tIOadde11ivFBNYy4
 HpxCKFKdAIQC3GhunHO0eHQ7K/0OYKjK191/b02cVcV9nkCQ990oPNQG/
 ZdOBuMdCeNBBEa8/2wM53dJWP9u0gkecxdcPlX1eRgFxaBubQ9GQowbKQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="3050329"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3050329"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 00:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="961192418"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="961192418"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 00:57:56 -0800
Date: Tue, 30 Jan 2024 09:57:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_atomic: fix basic-inc-all
Message-ID: <20240130085738.madss3unpksy2oed@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
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

Hi,
On 2024-01-29 at 19:54:12 +0100, Kamil Konieczny wrote:
> Previous test removed skips on unsupported system memory on dGPU
- ^^^^^^^^^^^^^
This should be:

Commit af750f5e7 ("tests/intel/xe_exec_atomic: don't test unsupported config")
removed skip on unsupported system memory on dGPU but did it
only for basic-dec-all. Fix it for second test basic-inc-all.
Also while at this, use drm_open_driver and drm_close_driver
which takes care of xe device get/put.

+cc Mauro
> 
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_exec_atomic.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> index 48c70ec72..d9790da78 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -124,10 +124,8 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	int fd;
>  
> -	igt_fixture {
> +	igt_fixture
>  		fd = drm_open_driver(DRIVER_XE);
> -		xe_device_get(fd);
> -	}
>  
>  	igt_subtest_with_dynamic("basic-dec-all") {
>  		xe_for_each_engine(fd, hwe) {
> @@ -152,8 +150,8 @@ igt_main
>  			uint64_t memreg = all_memory_regions(fd), region;
>  
>  			xe_for_each_mem_region(fd, memreg, region) {
> -
> -				igt_skip_on(!has_atomics(fd, region));
> +				if (!has_atomics(fd, region))
> +					continue;
>  
>  				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
>  					      xe_engine_class_string(hwe->engine_class),
> @@ -165,8 +163,6 @@ igt_main
>  		}
>  	}
>  
> -	igt_fixture {
> -		xe_device_put(fd);
> -		close(fd);
> -	}
> +	igt_fixture
> +		drm_close_driver(fd);
>  }
> -- 
> 2.42.0
> 
