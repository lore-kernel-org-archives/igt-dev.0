Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C5DC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 09:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF54810E0BB;
	Wed, 14 Aug 2024 09:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JVuGCMuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3118310E0BB
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 09:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723628056; x=1755164056;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=y2dKMpK0Stazq5NbCDxn9wOirDdvHvlqhaL0Q4EYn/o=;
 b=JVuGCMuXPa+iu7l3KFbZilGQIHKRjtSh6fT5eMLxPYcgTmBDGjsmJ1aG
 gG55y54Oio8iJfvuJsZeyhlemyrvxPSltTiTl/RIzENmwZ0T62EJ7GUsq
 OUhEqh/IJoOIqULNpvhbgk1s2BvlNU7mV/U3ankiMc2VaH8bfRX50nhmj
 k1bBqQzEMqvdJ13WeJtHc8l0zHW+0Oty9w+8I+bOdAKoOs/valUGOHxGg
 DFTQ2HqlpwBsPplTO1++4bR9UCm0jp7EwWjoLbrJ1Euwhf0L5rL+jATJn
 DyjPDFvGGduFVFrX9V1SK/7hLErXpqUWstA4vTh6AhCMWiG2WLngoweWg g==;
X-CSE-ConnectionGUID: Ta0S9nTsQaC/xeVcNWGJjw==
X-CSE-MsgGUID: DNFzNnDhRdeizf/KqqnT7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21973346"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="21973346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:34:16 -0700
X-CSE-ConnectionGUID: coZxTjrPRNa7y9Tm3xedKw==
X-CSE-MsgGUID: YhQovk2jS4Sr8HWNmd2XSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58946542"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 02:34:13 -0700
Date: Wed, 14 Aug 2024 11:34:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib|tests: Don't dereference engine outside
 for_each_ctx_engine macro
Message-ID: <Zrx6Ed0gjy2AU6Nf@ashyti-mobl2.lan>
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
 <e4d675ba-944b-4aa2-9803-edadb2b2f403@linux.intel.com>
 <20240813135652.2jhw2edamqjpvk3d@zkempczy-mobl2>
 <e53f5016-c1ea-4401-91e2-efd025bde585@linux.intel.com>
 <Zru5TDSV47bEHjmo@ashyti-mobl2.lan>
 <b2fba84c-281e-4d0c-ae4f-0e5542a0de19@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2fba84c-281e-4d0c-ae4f-0e5542a0de19@linux.intel.com>
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

Hi Peter,

On Wed, Aug 14, 2024 at 09:11:22AM +0200, Peter Senna Tschudin wrote:
> On 13.08.2024 21:51, Andi Shyti wrote:
> > On Tue, Aug 13, 2024 at 04:12:30PM +0200, Peter Senna Tschudin wrote:
> >> On 13.08.2024 15:56, Zbigniew Kempczyński wrote:
> >>> On Tue, Aug 13, 2024 at 03:36:50PM +0200, Peter Senna Tschudin wrote:
> >>>> Please do not apply this patch. I am working on a proper fix.
> >>>
> >>> Applying fix stops you from working on a your fix?
> >>
> >> Please do not fix a pothole just before I replace the road.
> > 
> > The patch is correct and Zbigniew's fix looks straight forward.
> > 
> > What is your fix aiming at? Can it go on top of this one?
> 
> Please ignore this. I have reviewed and compile tested the patch. Sorry for the noise.

if you have more fixes, please send them.

I was the originator of the for_each_ctx_engine() and I knew that
it was a big monster that needed some cleanups.

Thanks,
Andi
