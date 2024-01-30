Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3ECC46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 09:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8BB112E66;
	Tue, 30 Jan 2024 09:05:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43589112E6B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 09:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706605540; x=1738141540;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XiyHWvgqM3ussQ2cKWFH6ZzYa4zLgG1dTtKIimbIEXg=;
 b=Dqa9G3th04+5qjseRmzB6/vlDoFPb1HEdNL+0TV8iX1Wfic0ENgVohz2
 21/dIU2SxKXegFN8+3RxH6By+2y5itZ4FhMF2STt9wSPmd8acdoHyJYOM
 fDGzUxAx7l8XFOPtIfJ0y7SckBEqoMZUYP+TopoSuyiLagPDLpb4Xg3tX
 lx8w1VEdS7+iK/nogHTQ2ua7vpGLr8SxfS6r/U9gq5KV1SOfyJZTMpqZd
 V2rS75s6ig9wb4AyIbxEuJKZaNFTAXZuT/I3++qGur13Kx8E5WyRU8aqP
 EeunwqO/d0Io0c0G1tzYeUbtUhox96SlTnlSVn00uC8YYjIBsSS8LO6su g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="400354817"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="400354817"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:05:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="858411100"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="858411100"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 01:05:18 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8E9A2580D25;
 Tue, 30 Jan 2024 01:05:16 -0800 (PST)
Date: Tue, 30 Jan 2024 10:05:13 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_atomic: fix basic-inc-all
Message-ID: <20240130100513.2d41e922@maurocar-mobl2>
In-Reply-To: <20240130085738.madss3unpksy2oed@kamilkon-desk.igk.intel.com>
References: <20240129185412.114786-1-kamil.konieczny@linux.intel.com>
 <20240130085738.madss3unpksy2oed@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, 30 Jan 2024 09:57:38 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi,
> On 2024-01-29 at 19:54:12 +0100, Kamil Konieczny wrote:
> > Previous test removed skips on unsupported system memory on dGPU
> - ^^^^^^^^^^^^^
> This should be:
> 
> Commit af750f5e7 ("tests/intel/xe_exec_atomic: don't test unsupported config")
> removed skip on unsupported system memory on dGPU but did it
> only for basic-dec-all. Fix it for second test basic-inc-all.
> Also while at this, use drm_open_driver and drm_close_driver
> which takes care of xe device get/put.
> 
> +cc Mauro

LGTM after change previous test -> commit af750f5e7.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> > 
> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tests/intel/xe_exec_atomic.c | 14 +++++---------
> >  1 file changed, 5 insertions(+), 9 deletions(-)
> > 
> > diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> > index 48c70ec72..d9790da78 100644
> > --- a/tests/intel/xe_exec_atomic.c
> > +++ b/tests/intel/xe_exec_atomic.c
> > @@ -124,10 +124,8 @@ igt_main
> >  	struct drm_xe_engine_class_instance *hwe;
> >  	int fd;
> >  
> > -	igt_fixture {
> > +	igt_fixture
> >  		fd = drm_open_driver(DRIVER_XE);
> > -		xe_device_get(fd);
> > -	}
> >  
> >  	igt_subtest_with_dynamic("basic-dec-all") {
> >  		xe_for_each_engine(fd, hwe) {
> > @@ -152,8 +150,8 @@ igt_main
> >  			uint64_t memreg = all_memory_regions(fd), region;
> >  
> >  			xe_for_each_mem_region(fd, memreg, region) {
> > -
> > -				igt_skip_on(!has_atomics(fd, region));
> > +				if (!has_atomics(fd, region))
> > +					continue;
> >  
> >  				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
> >  					      xe_engine_class_string(hwe->engine_class),
> > @@ -165,8 +163,6 @@ igt_main
> >  		}
> >  	}
> >  
> > -	igt_fixture {
> > -		xe_device_put(fd);
> > -		close(fd);
> > -	}
> > +	igt_fixture
> > +		drm_close_driver(fd);
> >  }
> > -- 
> > 2.42.0
> > 
