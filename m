Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC005C0005B
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9B710E988;
	Thu, 11 Apr 2024 13:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwN01V1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06B010E988
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841805; x=1744377805;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=cFeq4PJBnF9M7I7avRyaPeN3nBVYOEYO7ts4kddLFro=;
 b=NwN01V1ZlcopyhIkC+perpHjCj8Q90Th4Wlmn7aHBcwWTyu60al+np2m
 Jsz68/hZUuI+O0xOibewf++2Wuk7T1hj4ozJ3kNrt4qqvuIiEgHQikfhN
 Ddexi3lrqIKA/cWZhkmG6x2sas4DPq8MCd2QBE/oblAQ41X2qRCxpRrbB
 QCwCRViHK2AynxFqr0Lcn0lkvlxtK/44sRLVy0L8nOt1SvRPprXhGx8SG
 Csglj/pTo2cDiy7IF1YE3W93HEpUlV4MyqPDD5/K2hl+8nu3ympTyziVw
 4mCLkR00sGXBDCEL+SFtEgtjFdiqLLVNhZsJwPAV+cMOvHXd6W7lixLgC Q==;
X-CSE-ConnectionGUID: bEDsKwgsQyWypuJUZzPe1A==
X-CSE-MsgGUID: 9Kt3dB4sRqCShX80ShN+cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25761734"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25761734"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:23:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="827793557"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="827793557"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 11 Apr 2024 06:23:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 16:23:20 +0300
Date: Thu, 11 Apr 2024 16:23:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/kms: Simplify force_connectors[] error
 handling
Message-ID: <ZhfkSJdayjDYejQZ@intel.com>
References: <20240410150229.28922-1-ville.syrjala@linux.intel.com>
 <20240410150229.28922-2-ville.syrjala@linux.intel.com>
 <20240411082511.sovecvuopmcuhcnr@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411082511.sovecvuopmcuhcnr@kamilkon-desk.igk.intel.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 11, 2024 at 10:25:11AM +0200, Kamil Konieczny wrote:
> Hi Ville,
> On 2024-04-10 at 18:02:28 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > The failure to allocate a forced_connector entry is entirely
> > our own fault. If we hit this then we've screwd up and made
> > the array too small. Skip the error handling and just assert
> > that we must have enough room in the array.
> > 
> > Cc: Kunal Joshi <kunal1.joshi@intel.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_kms.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index f7dd1db91827..19bb4ac66ece 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -1518,8 +1518,7 @@ static struct igt_forced_connector *forced_connector_alloc(void)
> >  	for (i = 0; forced_connectors[i].connector_type; i++)
> >  		;
> >  
> > -	if (i >= ARRAY_SIZE(forced_connectors))
> > -		return NULL;
> > +	igt_assert_lt(i, ARRAY_SIZE(forced_connectors));
> 
> Asserts in libs are ugly, could we just realloc it once?

We never realloc anything. It's a static array.

> Btw (i == ARRAY_SIZE(forced_connectors) should be ok? Or do
> we treat this as a end-of-array guard?

That's past the end of the array.

> 
> If you insist on keeping assert please at least give a message
> for ease of debug.

Looks like I actually dropped the assert entirely in the next patch
and let it explode naturally. Which it actually did in CI because
I made a booboo in _alloc()...

> 
> Regards,
> Kamil
> 
> >  
> >  	return &forced_connectors[i];
> >  }
> > @@ -1558,11 +1557,6 @@ static bool force_connector(int drm_fd,
> >  	}
> >  
> >  	c = forced_connector_alloc();
> > -	if (!c) {
> > -		igt_warn("Connector limit reached, %s will not be reset\n", name);
> > -		close(dir);
> > -		return true;
> > -	}
> >  
> >  	c->idx = idx;
> >  	c->connector_type = connector->connector_type;
> > -- 
> > 2.43.2
> > 

-- 
Ville Syrjälä
Intel
