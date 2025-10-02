Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16589CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 14:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC25810E7E5;
	Thu,  2 Oct 2025 14:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAxe3/LV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7556C10E7E5
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759413878; x=1790949878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ut/c+c5NXbpQsw5sXpRQ3k4vvjFRgwLZk+mMYh8B2Hc=;
 b=IAxe3/LVC7JtPvkKkGL/Sf8c3SIPsEeGJlJXJ2SH1Bc6YW4MlvbKbqA+
 db8ioQD+RyNPUeckX7J5RGSZe/cettZrpqmqbUI3S2wgibWIedBGtIZtC
 FPXzg4gefDFWoCbjE9RRzUkeS9YbIh6t8eVP0qSkd6nUYbIkwQ/okds2F
 5d1dDuIamiNl2wOnRPb4Yu3+cT/9E5thmuzkHoGuc/N22EgOaP2ZEOvQO
 +P1/C12/gLa1LJlL4aXd4ImCGWlAuftfavaNleF+/ztJp3iSD0bgiOAF3
 0gbfMp+lOIrACoC6V+3rnRfypRNGTIsK13D/JODgyejg+aMafymtN1qbt Q==;
X-CSE-ConnectionGUID: wO41/ZmmRPiC5MIqa/PjmA==
X-CSE-MsgGUID: 5oAksG/7SjW1xKG2S57awA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61609758"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61609758"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:04:38 -0700
X-CSE-ConnectionGUID: c91+wmjySMCjZ6WDyer9iw==
X-CSE-MsgGUID: wzt5JdSySauvutgPTiwSag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="183072608"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 07:04:35 -0700
Date: Thu, 2 Oct 2025 16:04:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 leo.liu@amd.com
Subject: Re: [PATCH V10 09/30] tests/kms_colorop: Add kms_colorop tests
Message-ID: <20251002140432.4nwai4hebw3tbl4x@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-10-alex.hung@amd.com>
 <782d02dc-3b1c-48ca-a77c-b7f01801c14b@bootlin.com>
 <d214f49a-98cf-4970-9617-372d7a49f9e5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d214f49a-98cf-4970-9617-372d7a49f9e5@amd.com>
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

Hi Harry,
On 2025-09-30 at 10:01:58 -0400, Harry Wentland wrote:
> > > +static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
> > > +{
> > > +    if (is_vkms_device(in->fd))
> > > +        return igt_cmp_fb_pixels(in, out, 1, 1);
> > 
> > Can you add a comment explaining why vkms is an exception and how the
> > [1,1] bracket was choosen?
> > 
> 
> The idea was that each driver is best served by their own bracket. A later
> patch adds an even worse bracket for amdgpu.
> 
> If I remember right, this bracket was simply chosen experimentally, i.e., by
> trial and error.

This looks like worth to put in a comment.

Regards,
Kamil

> 
> Harry
> 
