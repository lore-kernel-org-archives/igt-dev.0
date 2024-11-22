Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381FEE65D29
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED01610E082;
	Fri, 22 Nov 2024 07:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpRGZxYB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF99310E082
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732259557; x=1763795557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZV/a6EtUdTxR07YZpxhPooXVLAFiyKAgdtH9Ww5n0dA=;
 b=bpRGZxYBnShtKrshKcDo2RQs4/AasHsBLqdFQRel4Nd4zVfBdst0S17o
 +PC7D22D9KnXr0aNoQi7XJxEiR2k6R0BTdGex8Cd5a5K3kmXg6nlH0aYJ
 3Xp61ycFZYS0+jC1N1MxRyNECHe2mGqmFW5bmJkz+fSEP/tvKHji2Osv4
 HAyu4fxZP/G41cvxii3PX6FA1NJk+kTkaR+kNxSgfwC5BUq3QDF0vunPH
 rkHtlp3mvU3ivMZKLXUSmJUIQTH8CRBnKA4O7vnmnxsZJcUCjAhaQTuV/
 7llhnXz/xMMv5cDeQLXf3wpgFF4y4dcEePZIzuDGdZ5eXKVS7RwHM5WVx w==;
X-CSE-ConnectionGUID: 3W1E6hvdQ9Snmo5KpCJceg==
X-CSE-MsgGUID: MMQpVXU7R+W2NiPRwZJyIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32558787"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32558787"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:12:34 -0800
X-CSE-ConnectionGUID: nEX1Na9TTW648a3/+1tl6A==
X-CSE-MsgGUID: NM7/+FUZQ/aLZx9+KH2Jug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="95290373"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:12:31 -0800
Date: Fri, 22 Nov 2024 08:12:28 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 6/6] tests/gem_gpgpu_fill: Add offset-16x16
 subtest
Message-ID: <20241122071228.vgyz7tef7myy56tc@zkempczy-mobl2>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
 <20241121123308.98158-7-zbigniew.kempczynski@intel.com>
 <01a244b6dbb9f0f5a82be32a21083e4b33b93e16.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01a244b6dbb9f0f5a82be32a21083e4b33b93e16.camel@intel.com>
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

On Thu, Nov 21, 2024 at 04:28:53PM +0100, Grzegorzek, Dominik wrote:
> On Thu, 2024-11-21 at 13:33 +0100, Zbigniew Kempczyński wrote:
> > Add subtest which verifies rectangle filled by pattern starts at
> > offset <x,y> == <16,16>.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > ---
> >  tests/intel/gem_gpgpu_fill.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
> > index ec34e95844..cfebc8f665 100644
> > --- a/tests/intel/gem_gpgpu_fill.c
> > +++ b/tests/intel/gem_gpgpu_fill.c
> > @@ -58,6 +58,10 @@
> >   * Feature: compute
> >   *
> >   * SUBTEST: basic
> > + * Description: run gpgpu fill
> > + *
> > + * SUBTEST: offset-16x16
> > + * Description: run gpgpu fill with <x,y> start position == <16,16>
> >   */
> >  
> >  #define WIDTH 64
> > @@ -239,9 +243,16 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
> >  		}
> >  	}
> >  
> > +	igt_subtest("offset-16x16") {
> > +		gpgpu_fill(&data, fill_fn, 0,
> > +			   surfwidth, surfheight,
> > +			   16, 16,
> > +			   surfwidth / 2,
> > +			   surfheight / 2);
> > +	}
> > +
> >  	igt_fixture {
> > -		igt_collection_destroy(region_set);
> > -		free(region_info);
> Why removing this? 

This is a mistake, I've applied xe version here (I just changed a patch
and applied here so incidentally I missed that). Thanks for spotting
this. I'm going to send v6 with this fixed.

--
Zbigniew

> 
> Regards, 
> Dominik
> >  		buf_ops_destroy(data.bops);
> > +		drm_close_driver(data.drm_fd);
> >  	}
> >  }
> 
