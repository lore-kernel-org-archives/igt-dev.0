Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999F0C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 11:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A9E10F739;
	Wed, 20 Mar 2024 11:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNwRaRQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A7310F739
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 11:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710934503; x=1742470503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WLAafFySWdKMsS0kPbJ4tiAcgjX4y/pmT7Mj/tX8kzU=;
 b=QNwRaRQqiI34Wge9+hY4qI6K+lYmiY4C1mRmYgoQcEnMrXt9MWt95utA
 mQQN8VVfUDlmApn3RyO+EO4jh3MCXGhyr2ljoB/QjJvQwuKRRp7eEtZmh
 npbKdRVb/3n5XwN6qxxvzBsxUEdhVQrm3bqpihV5m5ULSsUzu3XbxGEbD
 l9lhoFhStXRpB3sNvqnhI+e90rjGd1f1QiHiceXzF+hVRP8kmA0qWSmPY
 rjXFFCxrHTTfr2Nca3LZ+exwC2wHCFylafyStPqqm55Yr5SzKjdD4egG0
 oUDt7U2khvVQYT5rCQWbuwxlKPSqFnopoNypm6QZ+hBf+i1oKKKyCFAbX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5790751"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5790751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14528367"
Received: from unknown (HELO localhost) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 04:35:01 -0700
Date: Wed, 20 Mar 2024 12:34:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: add access to control surface
 on xe2
Message-ID: <20240320113457.7zc3jngv2x3faejx@zkempczy-mobl2>
References: <20240318114758.108006-1-juhapekka.heikkila@gmail.com>
 <20240320084652.gyd4w5sc6fufqf2u@zkempczy-mobl2>
 <3bda2e06-b7b9-4e8a-a959-2cf8ed5d0d05@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bda2e06-b7b9-4e8a-a959-2cf8ed5d0d05@gmail.com>
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

On Wed, Mar 20, 2024 at 12:07:39PM +0200, Juha-Pekka Heikkila wrote:

<cut>

> > > +	bb_size = xe_bb_size(fb->fd, SZ_4K);
> > > +	bb1 = xe_bo_create(fb->fd, 0, bb_size, sysmem, 0);
> > > +	blt_set_batch(&surf.bb, bb1, bb_size, sysmem);
> > > +	blt_ctrl_surf_copy(fb->fd, surf_ctx, NULL, surf_ahnd, &surf);
> > > +	intel_ctx_xe_sync(surf_ctx, true);
> > > +
> > > +	ccsmap = xe_bo_map(fb->fd, ccs, surf.dst.size);
> > > +
> > > +	if (verify_compression) {
> > > +		for (int i = 0; i < surf.dst.size / sizeof(uint32_t); i++) {
> > > +			if (ccsmap[i] != 0)
> > > +				goto ccs_vefiried;

Problem I see for noise data in fb ccsmap[] will contain only zeros
so we catch assert below.

> > 
> > That's minor nit, s/vefiried/verified/g.
> > 
> > Second doesn't reside in this code, it is in the test itself:
> > 
> > static void fill_fb_random(int drm_fd, igt_fb_t *fb)
> > {
> > ...
> > 	for (i = 0; i < fb->size; i++)
> > 		p[i] = rand();
> > ...
> > 
> > Randomized data might lead your surface won't be surprised at all (data
> > are noise). I experimented with this some time ago when I played with
> > ctrl-surf-copy. Noise wasn't compressible so I think you should less
> > random data in case you want to check the ccs data.
> 
> Idea of this test is exatcly as you described above. Throw completely random
> data at control surface (same way as is done in aux ccs version of this
> test) and see nothing breaks, ie. no hw hangs, no unexpected display
> behaviors etc. Plan with this test is not to behave correctly towards hw but
> just see hw survived unexpected situation.
> 
> /Juha-Pekka
> 
> > > +		}
> > > +		igt_assert_f(false, "framebuffer was not compressed!\n");

I mean this one. So if I'm not wrong on some noise you may be catched
on assertion when fb won't be compressed due to data are not
compressible. Really assertion is your intention?

--
Zbigniew
