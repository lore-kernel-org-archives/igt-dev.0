Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877C9C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 11:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392C81122AB;
	Fri, 26 Apr 2024 11:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBtsF1+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78A71122AB
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714130526; x=1745666526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0EjpU83PiEbrA1dZCet7bz/arIXY2iCHfRXF8sv6CnM=;
 b=NBtsF1+BDjU7TM/IkwMoTL/Bs1yBoTD0gA8zpQP1cTHEV7nvVi46F2Jq
 zqlzaikXthswC/cvoP51s2aznC5GgKb7sno2j23QMmk+RMwq62n/v/STQ
 CfoStk8nmFjaBUnG7vzWgFY0Vp6DOAVtkBsJ82TsDa7a/zxdiNkKurg7l
 hd0sxPM46Vdigs1vZgx3y6mrpwukl/TBo0HLFj0cf+1zaHsi96VDmU8ip
 ZKMmd/kmQWPvdRS6iqWVtK7JVIie+Vy6jSEL6l4smdB/NvwUZerd+xhss
 XR/ow2t1v2mjPbDiF84jiCNUry6wGb/yeFpZWBc9acyuQp3u0ysv4Xx++ A==;
X-CSE-ConnectionGUID: ICmM3aVjSgGKnN8SOAgU+g==
X-CSE-MsgGUID: 2Up68J+nT+Oxnb4aXnPWfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9732482"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9732482"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:22:06 -0700
X-CSE-ConnectionGUID: PLBDWGEcRo2VkzCR/lsZgQ==
X-CSE-MsgGUID: Bde5A+9xTMiq/ju+JWCbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="56556806"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 04:22:05 -0700
Date: Fri, 26 Apr 2024 13:22:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/7] lib/intel_bufops: Drop tilings restrictions
Message-ID: <20240426112202.xnjgfeifg5u3h5j5@zkempczy-mobl2>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <20240425104721.52376-5-zbigniew.kempczynski@intel.com>
 <64cd3b16-55b8-42e5-8aa7-f417ecb4d5ec@gmail.com>
 <20240425155259.yyuqzhlldbmtj7sx@zkempczy-mobl2>
 <7503f603-b901-457a-b963-aa00e2933ca5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7503f603-b901-457a-b963-aa00e2933ca5@gmail.com>
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

On Fri, Apr 26, 2024 at 01:14:21PM +0300, Juha-Pekka Heikkila wrote:
> On 25.4.2024 18.52, Zbigniew Kempczyński wrote:
> > On Thu, Apr 25, 2024 at 04:08:23PM +0300, Juha-Pekka Heikkila wrote:
> > > On 25.4.2024 13.47, Zbigniew Kempczyński wrote:
> > > > Different platforms supports different tilings so instead of asserting
> > > > on buffer creation path move responsibility of passing valid data
> > > > to the test. It can use intel_cmds_info to iterate over supported
> > > > tilings so this is better extendible and requires fewer changes.
> > > > 
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > ---
> > > >    lib/intel_bufops.c | 3 ---
> > > >    1 file changed, 3 deletions(-)
> > > > 
> > > > diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> > > > index 007ccdb953..b96275e485 100644
> > > > --- a/lib/intel_bufops.c
> > > > +++ b/lib/intel_bufops.c
> > > > @@ -898,9 +898,6 @@ static void __intel_buf_init(struct buf_ops *bops,
> > > >    	if (compression) {
> > > >    		igt_require(bops->intel_gen >= 9);
> > > > -		igt_assert(req_tiling == I915_TILING_Y ||
> > > > -			   req_tiling == I915_TILING_Yf ||
> > > > -			   req_tiling == I915_TILING_4);
> > > 
> > > I'm wondering if it would make sense to flip this assert around instead of
> > > removing it? I mean would check here will not arrive linear and x-tile? I
> > > didn't check but I assume this compression flag will not be enabled for xe2?
> > 
> > I'm using this path to create compressed on xe2 and render-copy works
> > fine on linear/x/4/64 there.
> 
> But do you hit this assert with xe2? I was thinking you wouldn't hit that
> assert because compression is handled through pat index and from that would
> follow with xe2 you'd never have compression flag set. Then for dg2 you'd
> come here with also with tile64 so you could just check no x-tile and linear
> are coming here.
> 
> Then again, looking at what's inside that if(){..} maybe you could just
> change that "if (compression)" to something like "if
> (!HAS_FLATCCS(intel_get_drm_devid(bops->fd))" and remove the inner if doing
> the same thing?

Agree, it makes sense to join these if's keeping asserts in the code.
I'll send v3 with this change.

--
Zbigniew

> 
> /Juha-Pekka
