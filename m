Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CD9D609D2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 17:29:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDC410E137;
	Tue, 16 Dec 2025 17:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUYwQTcc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A43B10E137
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 17:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765906193; x=1797442193;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=patzb3ZxhzV1F9H9o9qqywXmW72RAZDx6ivJZ980ADM=;
 b=LUYwQTccCPlgGZ3bvJJsnErwZ6J3b61zDUSh4GY8eEXS25Qhqg9mvWRj
 TLthayHlWr1zSgd504mYrPgaccz1grGVRlQfVlmf+t2glPxPTdlVibdgr
 RvA9Od17E4EFYczTYZHBVk5h/Nxu1+NnPWR61lOCkqX0C4v6vO+/vbBmE
 hswBMosb0mt+Hp8kVXHqrVYIHMW8wD1JYATpeX2TPOSu2lYSQPSNmGYT9
 906ayJENHpD0xP77Tgb0oOh48CnvX0vpdK+rcr+9g0A/6YTJm5AU+hNor
 feCCyNEvWgA2DtEbpcyZmrA57fCJvQyp0JK5hN7l30UsG1GMzs23mvp8R A==;
X-CSE-ConnectionGUID: gwpWqyqiSb6spXE1z5oiIg==
X-CSE-MsgGUID: sg3rqd2jQUSe0xyrBMbbUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67870321"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="67870321"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 09:29:52 -0800
X-CSE-ConnectionGUID: hg1D9WigRgC6Ngwfu3FqMA==
X-CSE-MsgGUID: KmmD9/lPREW4Yl0oWH2PcA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 09:29:52 -0800
Date: Tue, 16 Dec 2025 18:29:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: prevent losing original
 pointer on realloc failure
Message-ID: <20251216172937.sa2cwvs6u6edovjq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
References: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
 <6b6nme2rzjkprk2sdnqfxtlatr3eefnwqrmj7xcutuhax5irkq@tys5xjkii4m5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b6nme2rzjkprk2sdnqfxtlatr3eefnwqrmj7xcutuhax5irkq@tys5xjkii4m5>
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

Hi Krzysztof,
On 2025-12-16 at 07:18:16 +0000, Krzysztof Karas wrote:
> Hi Sebastian,
> 
> > Previously, realloc was called directly on engines after incrementing
> > num_engines. If realloc failed, it would return NULL and overwrite the
> > original pointer, causing a memory leak and leaving engines inaccessible.
> > This patch uses a temporary pointer for realloc and only updates engines
> > after a successful allocation, ensuring the original pointer is preserved
> > on failure and preventing data loss.
> > 
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > ---
> >  tools/intel_gpu_top.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> > index 1bd88ba7c..1d0d11585 100644
> > --- a/tools/intel_gpu_top.c
> > +++ b/tools/intel_gpu_top.c
> > @@ -378,6 +378,7 @@ static struct engines *discover_engines(char *device)
> >  	while ((dent = readdir(d)) != NULL) {
> >  		const char *endswith = "-busy";
> >  		const unsigned int endlen = strlen(endswith);
> > +		struct engines *engines_tmp;
> >  		struct engine *engine =
> >  				engine_ptr(engines, engines->num_engines);
> >  		char buf[256];
> > @@ -444,14 +445,15 @@ static struct engines *discover_engines(char *device)
> >  			break;
> >  		}
> >  
> > -		engines->num_engines++;
> > -		engines = realloc(engines, sizeof(struct engines) +
> > -				  engines->num_engines * sizeof(struct engine));
> > -		if (!engines) {
> > +		engines_tmp = realloc(engines, sizeof(struct engines) +
> > +				  (engines->num_engines + 1) * sizeof(struct engine));
> > +		if (!engines_tmp) {
> >  			ret = errno;
> >  			break;
> >  		}
> >  
> > +		engines = engines_tmp;
> > +		engines->num_engines++;
> >  		ret = 0;
> >  	}
> >  
> > -- 
> > 2.51.2
> > 
> 
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> -- 
> Best Regards,
> Krzysztof

Thank you all, I merged this. Sebastian, please reply to CI
failures with Cc to Ci team.

Regards,
Kamil

