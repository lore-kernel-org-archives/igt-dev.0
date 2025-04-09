Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1180DC36002
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 10:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9B610E31C;
	Wed,  9 Apr 2025 10:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMqKmcpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8F510E31C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744195317; x=1775731317;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pugQCWBpEWfHoM7wVXMLZ6e1xtUvQceafI9bqpCepvk=;
 b=gMqKmcpHjerdz1Vx9n7gFlXuWGqt0RMBR6J3jnrxCG+VjB0YGqqvRMOb
 JvnginIKIW/R6FxwdCujUiotyIAgy8GEa7b60dmvISE33Yj7kHrK+Cdjw
 ayc8SUPaBNa+JIV/sPBTnV5tXtSczy7P3P8GlRmw7nYfjy2mydXFt0F5q
 7D/bqKf3uTfnTcQnq5UPNAe9ceeZgNuKhrz6hG2WvDQmBp34q+WYSH7Mc
 1efeFjRnTYV2qAXPUZcKHcDCtGLzbjMkoYTXsrFIR8mRnGfXUjxpd+oqa
 E5fQN1EjFV3cy8MG03h6Lu9Wr8R1zyuOBt6GXI6+HyeLNzhOTpyIFQKYD A==;
X-CSE-ConnectionGUID: CclKZIbkSI69VTZOdYMuPQ==
X-CSE-MsgGUID: U2YCcCDQSrqskZ9XWXstWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56646830"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="56646830"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 03:41:56 -0700
X-CSE-ConnectionGUID: bV8te0GNQ+SmpxPfIIInyg==
X-CSE-MsgGUID: gVT1b7ceTbyRRZAyF6BmOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="128895450"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:41:54 -0700
Date: Wed, 9 Apr 2025 12:41:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_exec_sip_eudebug: skip
 eudebug tests on VF
Message-ID: <20250409104139.4svoq22traw4tenk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250403115307.232213-1-jan.sokolowski@intel.com>
 <c1cd94bb-303c-450e-95ad-e34f07af99a6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c1cd94bb-303c-450e-95ad-e34f07af99a6@intel.com>
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

Hi,
On 2025-04-09 at 11:08:38 +0200, Manszewski, Christoph wrote:
> Hi Jan,
> 
> On 3.04.2025 13:53, Jan Sokolowski wrote:
> > Tests using eudebug are not compatible with VF functionality.
> > A way to check for that scenario is to check eudebug toggle
> > capability.
> > 
> > Skip a test that tries to use eudebug toggle if it doesn't
> > exist.
> 
> I think that the commit message is not quite appropriate. The title should
> be something like:
> 'lib/xe/xe_eudebug: Skip when disabling eudebug with no eudebug support.'

Small nit - no dot '.' at end of subject, so
s/support\./support/

> 
> And the description then should somehow capture what we have currently and
> what this change brings.
> 
> > 
> > v2: Changed the idea from disabling a single test to disabling
> > all possible tests.
> 
> Personally I am not a fan of having versions in a commit message. IMO it
> should describe the commit itself. Cover letters are a better place to track
> something like this for the sake of discussion. Ofc this is simple change so
> just skipping the version history and cover letter should be ok.
> 

Or just place versioning after '---' so git am will ignore it
and it will not be added at merge.

Sometimes they bring some info about why/what was changes
but I agree they are usally optional.

Regards,
Kamil

> > 
> > Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> > Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> > Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
> > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Please don't include r-b without explicit consent.
> 
> Regards,
> Christoph
> 
> > Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> > ---
> >   lib/xe/xe_eudebug.c | 5 +----
> >   1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> > index ec946058b..667c31c6e 100644
> > --- a/lib/xe/xe_eudebug.c
> > +++ b/lib/xe/xe_eudebug.c
> > @@ -1794,10 +1794,7 @@ bool xe_eudebug_enable(int fd, bool enable)
> >   	bool old = false;
> >   	int ret = __xe_eudebug_enable_getset(fd, &old, &enable);
> > -	if (ret) {
> > -		igt_skip_on(enable);
> > -		old = false;
> > -	}
> > +	igt_skip_on(ret);
> >   	return old;
> >   }
> 
