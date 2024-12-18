Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D10BE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 19:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1854510E436;
	Wed, 18 Dec 2024 19:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPyYhIlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABFE10E337
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 19:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734549237; x=1766085237;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=J+cZahMBdBayOoNdeUuWeTFE6KB5OPEy55t1CEG8Ej4=;
 b=cPyYhIlWfPfB6yELPZ3k8mOgXYMoBLLYs3n5JxHvKVNmt5TogY3Jz/4E
 ML6+wq5hD+ip3HsrkgVkEbaIyZSyhfQIxwsCWB4UTFxVojH/1/sLW8Z6V
 IaMPDxF1XGV9/JDPweTd+OUX5YgOKrsBFXYB7yr6cP8vKfttyniRt45nP
 kn1wd0woZbd51EWiyd5zta/fQBBQXdkKMPPot6Aqw265ozdPA3mL6yTK9
 dUc+VI8tPUTXjXSvTHYiNxtLfbAW9Eqb/Wy+Y383BzhSG6xflGq0ISfVp
 PXj2hJIDPLBZEgDOgsU2BHlTC0//FU586I3aNFudCGEQP1kTiOlANJHc5 Q==;
X-CSE-ConnectionGUID: G2ToOIckTQydFNZ5PEPwXA==
X-CSE-MsgGUID: V4bP+jpBQC6NUlphiYv/0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46429328"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="46429328"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 11:13:56 -0800
X-CSE-ConnectionGUID: HQiBu5vvTMaOk2uwguTf3Q==
X-CSE-MsgGUID: jADNx7hXQS6sxuDf7IenGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102568902"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 11:13:55 -0800
Date: Wed, 18 Dec 2024 20:13:40 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] lib/core: Let ftrace know when the test started
Message-ID: <20241218191340.b4h6fflpjyys67m7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241217183910.1855657-1-umesh.nerlige.ramappa@intel.com>
 <8534il3nj4.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8534il3nj4.wl-ashutosh.dixit@intel.com>
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
On 2024-12-17 at 15:19:59 -0800, Dixit, Ashutosh wrote:
> On Tue, 17 Dec 2024 10:39:10 -0800, Umesh Nerlige Ramappa wrote:
> >
> > It's useful to know the start and end of the test in ftrace to be able
> > to debug some issues. Not sure where to add igt_trace for end, so
> > posting this patch to get some comments.
> 
> Isn't it this (at least looking at dmesg):
> 
> __noreturn static void exit_subtest(const char *result)
> {
> 	...
> 	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
> 		 command_str, *subtest_name, result);

I also think it is already printed in logs.
Umesh if you find out cases where it is not please drop a link
to CI log(s) to look into.

Now that I look at it again the only diff is a place when it is
printed, this one is after (dynamic) subtest ends but I still
think it is also printed in dmesg before a dynamic subtest starts.

For example look into this log:
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12333/shard-snb5/igt@kms_flip@flip-vs-fences@a-vga1.html

there is:
<7> [377.462024] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_modes [drm_kms_helper]] [CONNECTOR:75:DP-1] disconnected
<6> [377.463784] [IGT] kms_flip: starting subtest flip-vs-fences
<6> [377.465812] [IGT] kms_flip: starting dynamic subtest A-VGA1

Regards,
Kamil

