Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2475FC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 16:06:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47FF10E3F9;
	Tue, 18 Feb 2025 16:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFQFNVKi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A33910E3F9
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739894794; x=1771430794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vhE+FrDcjIQBi0MIoqybEFxNPUz8YfLiiZpDBPlQp1I=;
 b=aFQFNVKi9aIIw6cTKz91XuAGvP96wyW1FNsvW9TQqOdQ4uFjU67AKt86
 8aOwyEgfLMcARJDHptNfUWW8hQ1lXD1ENL8HR4shvwtOz60VXDkbnNCz0
 nP9u8vMUxP+M0H5dgleg0yWesMdzcKvF44eXC0EOYcQGaUG6fzA5Al+mr
 pEOhH7e1iqSn/rUlOVmMeuqYQwVzQ1VRbfxTZ7IG7vXHsBEl3L3PSe3lZ
 SXg9zq0LhBemLWven9QiEE7S/jp9ux9oy5776hTdbGBouFhfYk+ZdUp5z
 XI3DREa7nUTMrGis+4jQBbUuHB2MLVhhknsZ6XWcbykbKFcyVZIksTk6W Q==;
X-CSE-ConnectionGUID: j7E8qhQaTO6M+HPdCcgmAQ==
X-CSE-MsgGUID: 5K+bBn9tQyCSt0L64K4/Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="58000622"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="58000622"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:06:34 -0800
X-CSE-ConnectionGUID: Mwe8rAYMRf+HBcALvo5/vg==
X-CSE-MsgGUID: hZ3I29SFSQy+YVcXNT0leg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="119531772"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 08:06:32 -0800
Date: Tue, 18 Feb 2025 17:06:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Jordan Justen <jljusten@debian.org>,
 Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: [PATCH i-g-t] tools: rename lsfacts into igt_facts
Message-ID: <20250218160630.373veapbvytfguoh@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jordan Justen <jljusten@debian.org>,
 Jordan Justen <jordan.l.justen@intel.com>
References: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
 <32a9510b-a18b-40c7-8f70-8d59b501df48@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <32a9510b-a18b-40c7-8f70-8d59b501df48@linux.intel.com>
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
On 2025-02-18 at 08:32:08 +0100, Peter Senna Tschudin wrote:
> On 17.02.2025 14:32, Kamil Konieczny wrote:
> > This is a follow up to GitLab issue 168 where name 'power' was
> > a little too generic. Similarly, name lsfacts looks also a little
> > too generic, so rename it into igt_facts.
> 
> Would you consider keeping the 'ls' part of the name so that it would
> be called 'igt_lsfacts'? The reason is that the tool simply list facts,
> while the integration with igt_runner report changes instead of listing
> facts.

I would prefer to have a little more generic name as it will have
room for future extensions, also less letters to type. If you want
you could extend it with --help and printf out what it does.

> 
> May I ask why the lsgpu tool did not get a rename too? Would a rename to
> 'igt_lsgpu' help prevent name collisions with system wide tools that have
> similar objectives?
> 

lsgpu is old tool and it was accepted in times when it was
introduced, it's meaning is also self-explanatory and relates
with igt GPU focus.

Regards,
Kamil

> 
> > 
> > Cc: Jordan Justen <jljusten@debian.org>
> > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Acked-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  tools/{lsfacts.c => igt_facts.c} | 12 ++++++------
> >  tools/meson.build                |  2 +-
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >  rename tools/{lsfacts.c => igt_facts.c} (71%)
> > 
> > diff --git a/tools/lsfacts.c b/tools/igt_facts.c
> > similarity index 71%
> > rename from tools/lsfacts.c
> > rename to tools/igt_facts.c
> > index bbe77717a..af3ea2a61 100644
> > --- a/tools/lsfacts.c
> > +++ b/tools/igt_facts.c
> > @@ -7,12 +7,12 @@
> >  #include "igt_facts.h"
> >  
> >  /**
> > - * SECTION:lsfacts
> > - * @short_description: lsfacts
> > - * @title: lsfacts
> > - * @include: lsfacts.c
> > + * SECTION:igt_facts
> > + * @short_description: igt_facts
> > + * @title: igt_facts
> > + * @include: igt_facts.c
> >   *
> > - * # lsfacts
> > + * # igtfacts
> >   *
> >   * Scan for igt-facts and print them on screen. Indicate if no facts are found.
> >   */
> > @@ -20,7 +20,7 @@ int main(int argc, char *argv[])
> >  {
> >  	igt_facts_lists_init();
> >  
> > -	igt_facts("lsfacts");
> > +	igt_facts("igt_facts");
> >  
> >  	if (igt_facts_are_all_lists_empty())
> >  		igt_info("No facts found...\n");
> > diff --git a/tools/meson.build b/tools/meson.build
> > index f091af380..1dfe1f839 100644
> > --- a/tools/meson.build
> > +++ b/tools/meson.build
> > @@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
> >  endforeach
> >  
> >  tools_progs = [
> > +	'igt_facts',
> >  	'igt_power',
> >  	'igt_stats',
> >  	'intel_audio_dump',
> > @@ -43,7 +44,6 @@ tools_progs = [
> >  	'intel_gem_info',
> >  	'intel_gvtg_test',
> >  	'dpcd_reg',
> > -	'lsfacts',
> >  	'lsgpu',
> >  ]
> >  tool_deps = igt_deps
> 
