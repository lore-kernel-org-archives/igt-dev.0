Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0FAC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 16:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E19289701;
	Tue, 18 Feb 2025 16:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iDK+nttF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E0D89701
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739894947; x=1771430947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9Kwwbgf4caPxZzIyihj7b9YkN1ZiU7OCjH9b9tedqUw=;
 b=iDK+nttF7VUd1UMKi5uXIGbV1w7cJZpu1kmlK3Io2oKP8bmLfYhPSjBL
 gmsmFRfKwlNSXD4rb7MBsAxkHKQTdSOWMGS8RYGdDtlrGA2oZc6zt7ucc
 dDwWS09ApRNEaykCBzNSyJVKLVg4/eDt2pvwx/xHQ5w7BGbUJ21bvSsqS
 otICubGfVb6JFBjAIaH/utOFZkoN2b10JxCuh9zLm/7HvgtB/rHIfHW9o
 BqFxr7ELz7D64SEEnydN5qTQ/pZ3AVxqxyb+stBjLL9qBJCDDwChXIDvt
 F/fA3JlG6W9xLQZgRF7yEDjI6xKmeRZjataZojTY1WNxlcIcRxJZjXPZ6 A==;
X-CSE-ConnectionGUID: nhb6KrQcQp2lo9CtsNPYMQ==
X-CSE-MsgGUID: 5L3teTc/Qzuwh1cVhY0SUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44359319"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44359319"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:09:07 -0800
X-CSE-ConnectionGUID: 3NsP4FAeRG6mbJZnkGc/Rg==
X-CSE-MsgGUID: YzIrC4ImShiEWZJO81DHUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114405949"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 08:09:06 -0800
Date: Tue, 18 Feb 2025 17:09:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Jordan Justen <jljusten@debian.org>,
 Jordan Justen <jordan.l.justen@intel.com>
Subject: Re: [PATCH i-g-t] tools: rename lsfacts into igt_facts
Message-ID: <20250218160903.nypyzr6ureu24evl@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jordan Justen <jljusten@debian.org>,
 Jordan Justen <jordan.l.justen@intel.com>
References: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
 <32a9510b-a18b-40c7-8f70-8d59b501df48@linux.intel.com>
 <854f3252-689f-44e3-bd77-b671d2c5fe6a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <854f3252-689f-44e3-bd77-b671d2c5fe6a@linux.intel.com>
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
On 2025-02-18 at 08:37:19 +0100, Peter Senna Tschudin wrote:
> 
> 
> On 18.02.2025 08:32, Peter Senna Tschudin wrote:
> > On 17.02.2025 14:32, Kamil Konieczny wrote:
> >> This is a follow up to GitLab issue 168 where name 'power' was
> >> a little too generic. Similarly, name lsfacts looks also a little
> >> too generic, so rename it into igt_facts.
> > 
> > Would you consider keeping the 'ls' part of the name so that it would
> > be called 'igt_lsfacts'? The reason is that the tool simply list facts,
> > while the integration with igt_runner report changes instead of listing
> > facts.
> 
> The '_' is optional, so 'igtlsfacts' is fine too.
> 

I prefer to keep '_' as it was already used in other tools,
also in intel_ ones.

> > 
> > May I ask why the lsgpu tool did not get a rename too? Would a rename to
> > 'igt_lsgpu' help prevent name collisions with system wide tools that have
> > similar objectives?
> 
> Same here, the '_' is optional, so 'igtlsgpu' is fine too.
> 
> > 
> > 
> >>
> >> Cc: Jordan Justen <jljusten@debian.org>
> >> Cc: Jordan Justen <jordan.l.justen@intel.com>
> >> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > Acked-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> > Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

I am a little confused with both ack and r-b, I will take r-b.

Regards,
Kamil

> >> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >> ---
> >>  tools/{lsfacts.c => igt_facts.c} | 12 ++++++------
> >>  tools/meson.build                |  2 +-
> >>  2 files changed, 7 insertions(+), 7 deletions(-)
> >>  rename tools/{lsfacts.c => igt_facts.c} (71%)
> >>
> >> diff --git a/tools/lsfacts.c b/tools/igt_facts.c
> >> similarity index 71%
> >> rename from tools/lsfacts.c
> >> rename to tools/igt_facts.c
> >> index bbe77717a..af3ea2a61 100644
> >> --- a/tools/lsfacts.c
> >> +++ b/tools/igt_facts.c
> >> @@ -7,12 +7,12 @@
> >>  #include "igt_facts.h"
> >>  
> >>  /**
> >> - * SECTION:lsfacts
> >> - * @short_description: lsfacts
> >> - * @title: lsfacts
> >> - * @include: lsfacts.c
> >> + * SECTION:igt_facts
> >> + * @short_description: igt_facts
> >> + * @title: igt_facts
> >> + * @include: igt_facts.c
> >>   *
> >> - * # lsfacts
> >> + * # igtfacts
> >>   *
> >>   * Scan for igt-facts and print them on screen. Indicate if no facts are found.
> >>   */
> >> @@ -20,7 +20,7 @@ int main(int argc, char *argv[])
> >>  {
> >>  	igt_facts_lists_init();
> >>  
> >> -	igt_facts("lsfacts");
> >> +	igt_facts("igt_facts");
> >>  
> >>  	if (igt_facts_are_all_lists_empty())
> >>  		igt_info("No facts found...\n");
> >> diff --git a/tools/meson.build b/tools/meson.build
> >> index f091af380..1dfe1f839 100644
> >> --- a/tools/meson.build
> >> +++ b/tools/meson.build
> >> @@ -12,6 +12,7 @@ foreach prog : tools_progs_noisnt
> >>  endforeach
> >>  
> >>  tools_progs = [
> >> +	'igt_facts',
> >>  	'igt_power',
> >>  	'igt_stats',
> >>  	'intel_audio_dump',
> >> @@ -43,7 +44,6 @@ tools_progs = [
> >>  	'intel_gem_info',
> >>  	'intel_gvtg_test',
> >>  	'dpcd_reg',
> >> -	'lsfacts',
> >>  	'lsgpu',
> >>  ]
> >>  tool_deps = igt_deps
> > 
> 
