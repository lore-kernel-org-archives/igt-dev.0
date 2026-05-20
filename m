Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE5CD5BA4
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 16:54:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5398210E190;
	Wed, 20 May 2026 16:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhScG0sE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59F10E190
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 16:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779296038; x=1810832038;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=q/SiLx0pkvtzoEYJ41WV2/JAMDu9yJI+rraOOfvqBuw=;
 b=mhScG0sEKT+H/LXmpjJMKqbCK4Ne9rCaOmjOqrcFYMbQmmK2hPh6qNxo
 G0BWKXlH5Bvv5sVWtpZdf6yGDm8O8AwqO/FRvCUXpXJXe3d9HV8Zk0VOA
 8fInZ2SL6klYJ5BZDgnhNoHT6Q5M/quUgXDvmGz4C+Bdl+6tJT12p1/cz
 TYM/RAk3nQENyNllA6UvXXHSYqlUVcpyaKuCKWy8z083EaDqo2+8fmNBJ
 /byyNfesTbyQX0E961TrBYvLRQWpnR6BM7U19n+ivVvHer9GxOcs4wKoL
 SPYdZfA4/+Yjzn+nW2ghMr/pb4j9xgumvjXflnlySlv0GBNBP6vEdnMLH g==;
X-CSE-ConnectionGUID: Nf5LHebjTq6kMV6pVjjSGQ==
X-CSE-MsgGUID: WO8ch+hBRPOiOC5q9slt+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80168622"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80168622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 09:53:57 -0700
X-CSE-ConnectionGUID: VQkdm5OCQZGjt7fH/INaGA==
X-CSE-MsgGUID: XTl8u9YOT7q1lmsb4ZauaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="235822552"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 09:53:55 -0700
Date: Wed, 20 May 2026 18:53:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/intel_compute: Improve executing
 large-buffer compute on pre-Xe
Message-ID: <20260520165338.zthrkfylqjw33alk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
 <20260520090034.463367-6-zbigniew.kempczynski@intel.com>
 <ag3aeztTvOOxk-MF@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ag3aeztTvOOxk-MF@fdugast-desk>
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

Hi Francois,
On 2026-05-20 at 17:59:55 +0200, Francois Dugast wrote:
> On Wed, May 20, 2026 at 11:00:37AM +0200, Zbigniew Kempczyński wrote:
> > Missing STATE_COMPUTE_MODE instruction in the pipeline causes undefined
> > behavior which can be observed when input/output buffers size exceeds 2M.
> 
> Great finding, thanks for looking into this!
> 
> I confirm it does fix compute-square-userenv-large-buffer on ADLP.
> 

Could you add Closes: tag?

Regards,
Kamil

> > 
> > Update pipeline, shader and data to reflect changes in arguments passing
> > due to use latest version of ocloc compiler.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  lib/intel_compute.c            | 74 +++++++++++++++++++++-------------
> >  lib/intel_compute_krn_square.h | 36 ++++++-----------
> >  2 files changed, 60 insertions(+), 50 deletions(-)
> > 
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 680675982a..40e57e68b8 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -61,6 +61,7 @@
> >  #define THREADS_PER_GROUP		32
> >  #define THREAD_GROUP_Y			1
> >  #define THREAD_GROUP_Z			1
> > +#define PREXE_ENQUEUED_LOCAL_SIZE_X	512
> >  #define ENQUEUED_LOCAL_SIZE_X		1024
> >  #define ENQUEUED_LOCAL_SIZE_Y		1
> >  #define ENQUEUED_LOCAL_SIZE_Z		1
> > @@ -513,6 +514,13 @@ static uint32_t size_thread_group_x(uint32_t work_size)
> >  				   ENQUEUED_LOCAL_SIZE_Z));
> >  }
> >  
> > +static uint32_t prexe_size_thread_group_x(uint32_t work_size)
> > +{
> > +	return MAX(1, work_size / (PREXE_ENQUEUED_LOCAL_SIZE_X *
> > +				   ENQUEUED_LOCAL_SIZE_Y *
> > +				   ENQUEUED_LOCAL_SIZE_Z));
> > +}
> > +
[cut]
