Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11021CD4F3D
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 17:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A555610E03D;
	Wed, 20 May 2026 17:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8pg4eR0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B45E210E03D
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 17:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779299589; x=1810835589;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=ojQxouypuwKKNwAu69ee5E+sfwD1GATebmpKveFCE4I=;
 b=i8pg4eR0KuN61uzwwqPktHUeJAxIW/lIlxQ+pIpd0cV/ZhAkjqTBwvk3
 BuVPc1omuPbYVAEaKH7cX808gOVb/CqArzuNsdlbDoQS2wd3YKJmGCgUf
 cxUSlaxUYTwS4utC5yUqQKQ57JfHxE9t9yk6UMNyGYJ0bBNTrAaAFJXi9
 8cz7i4hfror5uhKf3uLmstnART1rf42zRUbuZO/jrnEOu3mXARBLlefb9
 0Cia3NIFwqMcYnZyvTmJ1o579PnwhhDD3qGyCkQQiMGJVmBODajEmnUqi
 aHyGAB9XsM8Xtrjo1NdniTY5mWeUY5kjKc6uIbe8/wtGLi++nAAydFwJ9 A==;
X-CSE-ConnectionGUID: vUsfIfIOReWwwTRAxfPP3g==
X-CSE-MsgGUID: 9+QhEDmjQoW5GLRvxPcdPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84065977"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="84065977"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:53:09 -0700
X-CSE-ConnectionGUID: 5BHDcRp6Rc+W4dmH1i32WA==
X-CSE-MsgGUID: dKmdgXuuTY2/4nkfma6hKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="240504080"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:53:07 -0700
Date: Wed, 20 May 2026 19:53:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/2] lib/intel_compute: Improve executing
 large-buffer compute on pre-Xe
Message-ID: <hiuvvaclp3u623nt57lkf5zqmzrnliluydk7klgzotwoz3waaj@fyyctu47hejp>
References: <20260520090034.463367-4-zbigniew.kempczynski@intel.com>
 <20260520090034.463367-6-zbigniew.kempczynski@intel.com>
 <ag3aeztTvOOxk-MF@fdugast-desk>
 <20260520165338.zthrkfylqjw33alk@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260520165338.zthrkfylqjw33alk@kamilkon-DESK.igk.intel.com>
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

On Wed, May 20, 2026 at 06:53:38PM +0200, Kamil Konieczny wrote:
> Hi Francois,
> On 2026-05-20 at 17:59:55 +0200, Francois Dugast wrote:
> > On Wed, May 20, 2026 at 11:00:37AM +0200, Zbigniew Kempczyński wrote:
> > > Missing STATE_COMPUTE_MODE instruction in the pipeline causes undefined
> > > behavior which can be observed when input/output buffers size exceeds 2M.
> > 
> > Great finding, thanks for looking into this!
> > 
> > I confirm it does fix compute-square-userenv-large-buffer on ADLP.
> > 
> 
> Could you add Closes: tag?

Sure, I'll check the corresponding gitlab issue and add the tag.

--
Zbigniew

> 
> Regards,
> Kamil
> 
> > > 
> > > Update pipeline, shader and data to reflect changes in arguments passing
> > > due to use latest version of ocloc compiler.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > ---
> > >  lib/intel_compute.c            | 74 +++++++++++++++++++++-------------
> > >  lib/intel_compute_krn_square.h | 36 ++++++-----------
> > >  2 files changed, 60 insertions(+), 50 deletions(-)
> > > 
> > > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > > index 680675982a..40e57e68b8 100644
> > > --- a/lib/intel_compute.c
> > > +++ b/lib/intel_compute.c
> > > @@ -61,6 +61,7 @@
> > >  #define THREADS_PER_GROUP		32
> > >  #define THREAD_GROUP_Y			1
> > >  #define THREAD_GROUP_Z			1
> > > +#define PREXE_ENQUEUED_LOCAL_SIZE_X	512
> > >  #define ENQUEUED_LOCAL_SIZE_X		1024
> > >  #define ENQUEUED_LOCAL_SIZE_Y		1
> > >  #define ENQUEUED_LOCAL_SIZE_Z		1
> > > @@ -513,6 +514,13 @@ static uint32_t size_thread_group_x(uint32_t work_size)
> > >  				   ENQUEUED_LOCAL_SIZE_Z));
> > >  }
> > >  
> > > +static uint32_t prexe_size_thread_group_x(uint32_t work_size)
> > > +{
> > > +	return MAX(1, work_size / (PREXE_ENQUEUED_LOCAL_SIZE_X *
> > > +				   ENQUEUED_LOCAL_SIZE_Y *
> > > +				   ENQUEUED_LOCAL_SIZE_Z));
> > > +}
> > > +
> [cut]
