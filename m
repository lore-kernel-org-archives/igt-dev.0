Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A10BC3600B
	for <igt-dev@archiver.kernel.org>; Mon, 31 Mar 2025 13:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FC110E40F;
	Mon, 31 Mar 2025 13:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UeQSFolB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E216E10E123
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Mar 2025 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743426365; x=1774962365;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/rWUNsYkbgmvzc9kUTrlhNDqoOwfKnakjzv+LY4YKWk=;
 b=UeQSFolBVXA0eUdepjTsJPfVwmsFloFMbuByF5UJMgANF85k+mZrSxEw
 wSVBM+W+L+3yoxFoxk7Naqwn586M9xi08IH1PN7vw2qxk6SniE6hU+sEg
 JDCb9n8PTWVZ0XrWAT/aHfdcmpPJqhnlyi010YkcI5hscs/xgbGbu7vnx
 dSSH/drbIvqWC8tucXuZMznAOrKlJ8mINAPWltCU8dgY+3D6tTTPjlPMT
 obq5R77b6fsO/fZW8SG718nEmVmUWiE/yNP4ntW0xSyb8enAN4SEhFvzX
 8iOs1OSVsol73lLC1CmZRRtu+8lLQVow12gpCd30QnraoyErmh3Hk6zdr w==;
X-CSE-ConnectionGUID: IBBls2WrQRSDwjYN2DKrEQ==
X-CSE-MsgGUID: rr+GH1jnSy2z6TRibZS90A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="47434500"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="47434500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:06:03 -0700
X-CSE-ConnectionGUID: f/vOCes6QguJiGuqqpbGmw==
X-CSE-MsgGUID: e/n2IEfIRwqmwp56d8qwig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130196251"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 06:06:02 -0700
Date: Mon, 31 Mar 2025 15:06:00 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/2] CONTRIBUTING: Add subscription and
 patchwork info
Message-ID: <20250331130600.435vwrzadtoa4ci5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250327153139.37746-1-kamil.konieczny@linux.intel.com>
 <20250327153139.37746-2-kamil.konieczny@linux.intel.com>
 <81a189e4-cce6-405d-97b8-707f207351fe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81a189e4-cce6-405d-97b8-707f207351fe@intel.com>
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

Hi Hajda,,
On 2025-03-31 at 12:45:21 +0200, Hajda, Andrzej wrote:
> 
> W dniu 27.03.2025 o 16:31, Kamil Konieczny pisze:
> > Add guide and link to subscription into mailing list and link
> > for patchwork.
> > 
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >   CONTRIBUTING.md | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > index 81057a2ad..b571b5e68 100644
> > --- a/CONTRIBUTING.md
> > +++ b/CONTRIBUTING.md
> > @@ -63,6 +63,13 @@ Sending Patches
> >     on its first invocation.
> > +- If you plan contribute regularly please subscribe to igt-dev mailinglist:
> 
> 
> s/plan/plan to/ ?
> 
> s/regularly/regularly,/?
> 

I will change this, thx.

Regards,
Kamil

> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Regards
> Andrzej
> 
> 
> > +  https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > +  When you are not subscribed, please note that your contribution will take
> > +  more time to reach to mailing list. You could find out if it was delivered or
> > +  what is a testing status of your patches at patchwork page:
> > +  https://patchwork.freedesktop.org/project/igt/series/
> > +
> >   - Place relevant prefix in subject, for example when your change is in one
> >     testfile, use its name without '.c' nor '.h' suffix, like:
> >     tests/simple_test: short description
