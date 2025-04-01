Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4278EC36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 13:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA37310E5A2;
	Tue,  1 Apr 2025 13:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qsjio1JO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8BF10E5A2
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743514619; x=1775050619;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XozZyBny78/I8VPzep0VHlcoCqqwT/lAIdOvWjtU1vc=;
 b=Qsjio1JOOugrBcHbruMdYPf2EUIDxlo9f6LlKinTtwJ0hCUJ+UtLSjkP
 hwGrHiUf2NyxQnRAXT3oV1XZm2eQWSZAbZpLjiAFxjtbqwQxxkkZ0Ux7m
 gEolfU/UvvQKl97zdac0J5K8Sc/zzB0+nA2KO6AWY/JD2TFdxkZCPRaaq
 8nzpwS3MWf8e9NTfwHFvk+7Fhclqz+M0Bxorv+FYVnIOJ5EtleoTlLdVw
 Dj3BNcdvvzBCrgFjPzpXCNeT5ZwArSGEmGOHZSDd6+YD3UEUZgmTp6rOc
 Z1AWRLjCDL2AiHaHIEUWIbqEV90p/6CejB5YuFFkb13SqX0IxwbS4187f Q==;
X-CSE-ConnectionGUID: KeORQUA+RbqqnW3DvyWNKw==
X-CSE-MsgGUID: 1UTtA+uVR5+gLTn3TcMk2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="32432755"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="32432755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 06:36:59 -0700
X-CSE-ConnectionGUID: nHIbfTwISd+OuZw9cY85Jg==
X-CSE-MsgGUID: C1tTGrWBRqatTIRXGVovOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126358079"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 06:36:57 -0700
Date: Tue, 1 Apr 2025 15:36:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] CONTRIBUTING: Add subscription and
 patchwork info
Message-ID: <20250401133655.bezeh4v6qmzemhfb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 igt-dev@lists.freedesktop.org,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20250331133424.35873-1-kamil.konieczny@linux.intel.com>
 <20250331133424.35873-2-kamil.konieczny@linux.intel.com>
 <87plhx3zv9.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87plhx3zv9.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2025-03-31 at 09:54:02 -0700, Dixit, Ashutosh wrote:
> On Mon, 31 Mar 2025 06:34:23 -0700, Kamil Konieczny wrote:
> >
> > Add guide and link to subscription into mailing list and link
> > for patchwork.
> >
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > ---
> >  CONTRIBUTING.md | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
> > index 81057a2ad..8370451d6 100644
> > --- a/CONTRIBUTING.md
> > +++ b/CONTRIBUTING.md
> > @@ -63,6 +63,13 @@ Sending Patches
> >
> >    on its first invocation.
> >
> > +- If you plan to contribute regularly, please subscribe to igt-dev mailinglist:
> > +  https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > +  When you are not subscribed, please note that your contribution will take
> > +  more time to reach to mailing list. You could find out if it was delivered or
> > +  what is a testing status of your patches at page:
> > +  https://patchwork.freedesktop.org/project/igt/series/
> 
> I've heard that patchwork is likely to be phased out in the future and
> replaced with some infrastructure around lore.kernel.org (see below).

It will be updated then, now it should describe what we have.

> 
> Maybe we can mention that emails, as well as test results, can also be seen
> at:
> 
> https://lore.kernel.org/igt-dev/

Good point, thank you!

Regards,
Kamil

> 
> > +
> >  - Place relevant prefix in subject, for example when your change is in one
> >    testfile, use its name without '.c' nor '.h' suffix, like:
> >    tests/simple_test: short description
> > --
> > 2.49.0
> >
