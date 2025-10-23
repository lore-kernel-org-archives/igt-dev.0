Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F21FCCD193
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 17:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1F10E002;
	Thu, 23 Oct 2025 17:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTIYoTqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4410E938
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761240649; x=1792776649;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LEQJ1waBVvI9q4Ccus2G9RXC/ZFCKqaoSW6WG3M+X04=;
 b=cTIYoTqkqC/CcAZbJA2J+zEHfgV2V86wKkRs9eor1VXivYBcDqEbsDve
 qhbjqrFn5BO+aAG2bCOpXWHwCT0Jr20tTAWDKMERhzgUiYU32A0az4d1o
 OKLSFoEikxAG/DkA4hkq0CP5ePzc5qSB9l4HVkteH2nujhNLYj4SGowtC
 zJ7oXkr4SbLwnlWXhCqqd7uBbq8bjZI6H4NcJvgIikuJKdpRsK67GFtdu
 wQiqbCV49u/WYB659fGCXURDfBaZHBdUjDIvhT3I7z875Dk5qwd7p4tFX
 LuatDFQOqoPFzvZf53URm2VZFmIqEymlee6s3Z+al/AofxL3U+RUZbdeJ A==;
X-CSE-ConnectionGUID: qV3xBstDRtitUt7MiqnoxA==
X-CSE-MsgGUID: 8InqgsO2QRmLyHnQi7mzvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88884539"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="88884539"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 10:30:49 -0700
X-CSE-ConnectionGUID: oRl5Q7GGQ0CPE5AQCEH4rQ==
X-CSE-MsgGUID: 61sloc4SRWeENIy7pOyWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="214872318"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 10:30:48 -0700
Date: Thu, 23 Oct 2025 19:30:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
Subject: Re: [PATCH i-g-t 3/3] intel_gpu_top: Add usage note about i915
 compatibility and Xe driver transition
Message-ID: <20251023173022.7v7eq2jwku2kvib6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 dmitry.v.rogozhkin@intel.com
References: <cover.1761225010.git.sebastian.brzezinka@intel.com>
 <26d376252a4ebc1ca256e476bba0b42611769225.1761225010.git.sebastian.brzezinka@intel.com>
 <631b387f-6f05-45be-b01f-a80dccab186b@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <631b387f-6f05-45be-b01f-a80dccab186b@ursulin.net>
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

Hi Tvrtko,
On 2025-10-23 at 14:55:45 +0100, Tvrtko Ursulin wrote:
> 
> On 23/10/2025 14:21, Sebastian Brzezinka wrote:
> > Updated the usage output to include a note clarifying that intel_gpu_top
> > is intended for Intel GPUs supported by the i915 kernel driver (Gen2
> > through Gen12/Xe-LP). For newer GPUs such as Xe-HPG and Xe2, users are
> > advised to use gputop, which supports the newer Xe kernel driver.
> > 
> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > ---
> >   tools/intel_gpu_top.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> > index 1bd88ba7c..0d0d03717 100644
> > --- a/tools/intel_gpu_top.c
> > +++ b/tools/intel_gpu_top.c
> > @@ -1067,6 +1067,12 @@ usage(const char *appname)
> >   		"\t[-m]            Default to showing all memory regions.\n"
> >   		"\n",
> >   		appname, DEFAULT_PERIOD_MS);
> > +
> > +	printf("Note:\n"
> > +		"\tThis tool is designed for Intel GPUs supported by the i915 kernel driver,\n"
> > +		"\tincluding Gen2 through Gen12 (Xe-LP). For newer GPUs such as Xe-HPG and\n"
> > +		"\tXe2, users should consider using gputop, which supports the newer\n"
> > +		"\tXe kernel driver.\n\n");
> 
> Man page already says the tools reads _i915_ performance counters and if I
> run it with xe loaded I get this:
> 
> $ sudo tools/intel_gpu_top
> No device filter specified and no discrete/integrated i915 devices found
> 
> So it is kind of clear already.
> 
> Downside of the message you add is that gputop currently does not do
> anything Intel specific, no? And there are some files called xe_gputop.c so
> what is with those? Are they orphans? Anyway, downside of the message is
> that you have to update it if it won't be gputop but xe_gputop or whatever.

Well, I see some other effort with adding Xe support into gputop
which for me it better fit into intel_gpu_top. Maybe it will be
a little bigger effort.

> 
> Overall intel_gpu_top could have easily be made support both drivers but
> what do I know.

Good point, as it already needs sudo, unlike gputop.

Regards,
Kamil

> 
> Regards,
> 
> Tvrtko
> 
> >   	printf("To access interactive help, press 'h' while the application is running.\n");
> >   	show_help_screen();
> >   	igt_device_print_filter_types();
> 
