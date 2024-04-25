Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C7C10F15
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 15:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEE911A593;
	Thu, 25 Apr 2024 15:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbcrGIo5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38F611A593
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714060385; x=1745596385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tinx6M743xWlEg8d06FwxeEo8qjo4pCkOJBNG7LHc6k=;
 b=jbcrGIo58V87WO695RK59JDDKCItXQoerIalIHtcedPVwMmNYtBIehO3
 +O4jxoU9OzBouqM9GYoIO6gArLuTaAGqPUOtfwo4WTXkHnGSZkJ7k6Xwf
 ot4iYws2dzITvDJ9gqn3osSYRqulP1mtSk6oVTI1CGUvP60AvtE5ng7dR
 7Dh6ekaO1/ayRuyFtggC2EYFRrlglcdxutEAZQkxxxxsvAMKiJevVJclT
 4wcF8lfQgrdyxuaa8ifKX6N4mOW768UNS5nQszknTmurrAwMQJl3AdEXt
 jTo+gCpR33hUNxnDvbAi3LTRjoHpdJyD9+iEFliZFlxEtsNmfdAzDmVVw A==;
X-CSE-ConnectionGUID: PBFaVnG3RcCE1FfuwrNOUQ==
X-CSE-MsgGUID: In+pAKWBQTKNYaMIwTH76w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13593460"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="13593460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:53:04 -0700
X-CSE-ConnectionGUID: JhI5gEUsTlaVLmc7jexp+Q==
X-CSE-MsgGUID: b7eCmru5RBSQzmJklm71Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29742153"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:53:02 -0700
Date: Thu, 25 Apr 2024 17:52:59 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/7] lib/intel_bufops: Drop tilings restrictions
Message-ID: <20240425155259.yyuqzhlldbmtj7sx@zkempczy-mobl2>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <20240425104721.52376-5-zbigniew.kempczynski@intel.com>
 <64cd3b16-55b8-42e5-8aa7-f417ecb4d5ec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64cd3b16-55b8-42e5-8aa7-f417ecb4d5ec@gmail.com>
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

On Thu, Apr 25, 2024 at 04:08:23PM +0300, Juha-Pekka Heikkila wrote:
> On 25.4.2024 13.47, Zbigniew Kempczyński wrote:
> > Different platforms supports different tilings so instead of asserting
> > on buffer creation path move responsibility of passing valid data
> > to the test. It can use intel_cmds_info to iterate over supported
> > tilings so this is better extendible and requires fewer changes.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >   lib/intel_bufops.c | 3 ---
> >   1 file changed, 3 deletions(-)
> > 
> > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> > index 007ccdb953..b96275e485 100644
> > --- a/lib/intel_bufops.c
> > +++ b/lib/intel_bufops.c
> > @@ -898,9 +898,6 @@ static void __intel_buf_init(struct buf_ops *bops,
> >   	if (compression) {
> >   		igt_require(bops->intel_gen >= 9);
> > -		igt_assert(req_tiling == I915_TILING_Y ||
> > -			   req_tiling == I915_TILING_Yf ||
> > -			   req_tiling == I915_TILING_4);
> 
> I'm wondering if it would make sense to flip this assert around instead of
> removing it? I mean would check here will not arrive linear and x-tile? I
> didn't check but I assume this compression flag will not be enabled for xe2?

I'm using this path to create compressed on xe2 and render-copy works
fine on linear/x/4/64 there.

--
Zbigniew

> 
> /Juha-Pekka
> 
> >   		/*
> >   		 * On GEN12+ we align the main surface to 4 * 4 main surface
> >   		 * tiles, which is 64kB. These 16 tiles are mapped by 4 AUX
> 
