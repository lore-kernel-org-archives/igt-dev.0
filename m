Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF0E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 18:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CE310E0C3;
	Fri, 20 Dec 2024 18:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3k845Co";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8568310E0C3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 18:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734719482; x=1766255482;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E8SjLLfw8ioHdhCrqw8x8nIY7ZPF5w6dLEkAP/FEgOE=;
 b=U3k845Co7iMLKw7ATZUN2e/Z7Qu8aOJ8S5mgqgcQcOu+6T7lAZx2gebc
 SPOOmvzL1dhicoNPU219ii6wNZtuVZWZbSvdNAkkzfvSrgEW9Q1jsBf0y
 Ww3NViTFMeDIv3vmZ7RR76Vk89XdWEUMOgUvzMMOMcZ6OTJC0BvREox9k
 s9x9Fk/bh3cGvfvdlk2xgQN+X7En9Khet57hBBazJk41RHujNjjDu0QcT
 E8Grhv2t5Q35LvV3ZF0tlAcuVrkmj4718b+SUPz8dgexXb4zw6C342AtO
 HP7XLrAJFTR9tIih+2lDY1/6my80MhEJe/fZqlBFheEW3fPC5M6k41U8d w==;
X-CSE-ConnectionGUID: GMedFG5qQga0uctTrDE8xQ==
X-CSE-MsgGUID: xdAID3KZRVKjwGvAX/y7dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="46284418"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="46284418"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 10:31:21 -0800
X-CSE-ConnectionGUID: t9IIZlYPSQu5WOXSMpI/Jw==
X-CSE-MsgGUID: fbV9n/a1Q12S+vydFAyFkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="129393158"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 10:31:19 -0800
Date: Fri, 20 Dec 2024 19:31:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] lib/core: Let ftrace know when the test started
Message-ID: <20241220183117.kkka7sphjjfosv2v@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20241217183910.1855657-1-umesh.nerlige.ramappa@intel.com>
 <8534il3nj4.wl-ashutosh.dixit@intel.com>
 <20241218191340.b4h6fflpjyys67m7@kamilkon-desk.igk.intel.com>
 <85zfks23i1.wl-ashutosh.dixit@intel.com>
 <85y10c23gr.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85y10c23gr.wl-ashutosh.dixit@intel.com>
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
On 2024-12-18 at 11:31:00 -0800, Dixit, Ashutosh wrote:
> On Wed, 18 Dec 2024 11:30:14 -0800, Dixit, Ashutosh wrote:
> >
> > On Wed, 18 Dec 2024 11:13:40 -0800, Kamil Konieczny wrote:
> > >
> > > Hi Dixit,,
> > > On 2024-12-17 at 15:19:59 -0800, Dixit, Ashutosh wrote:
> > > > On Tue, 17 Dec 2024 10:39:10 -0800, Umesh Nerlige Ramappa wrote:
> > > > >
> > > > > It's useful to know the start and end of the test in ftrace to be able
> > > > > to debug some issues. Not sure where to add igt_trace for end, so
> > > > > posting this patch to get some comments.
> > > >
> > > > Isn't it this (at least looking at dmesg):
> > > >
> > > > __noreturn static void exit_subtest(const char *result)
> > > > {
> > > >	...
> > > >	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> > > >		 command_str, *subtest_name, result);
> > >
> > > I also think it is already printed in logs.
> > > Umesh if you find out cases where it is not please drop a link
> > > to CI log(s) to look into.
> > >
> > > Now that I look at it again the only diff is a place when it is
> > > printed, this one is after (dynamic) subtest ends but I still
> > > think it is also printed in dmesg before a dynamic subtest starts.
> > >
> > > For example look into this log:
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12333/shard-snb5/igt@kms_flip@flip-vs-fences@a-vga1.html
> > >
> > > there is:
> > > <7> [377.462024] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:75:DP-1] disconnected
> > > <6> [377.463784] [IGT] kms_flip: starting subtest flip-vs-fences
> > > <6> [377.465812] [IGT] kms_flip: starting dynamic subtest A-VGA1
> >
> > Umesh wants to print in ftrace not dmesg.
> 
> Sorry, better to say ftrace as well as dmesg.

Ah, sorry, I misunderstood it, it is ok for me so

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw one more question before merge, is it safe to call it
even without actual trace enabled? Could it slow down testing?

Or maybe we should add an option to igt for it?

+cc Petri and Lucas.

Also please restart testing for it in our CI if you plan on
merging this change.

Regards,
Kamil

