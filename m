Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B87DD111A8
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 11:14:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4E10E3A1;
	Mon,  1 Dec 2025 11:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6pK5sRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8694910E3A1
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 11:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764587670; x=1796123670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FF+nmZQC7WLbn+dsoWftZNh9gg5Ix6NQJrBM+A7oF1c=;
 b=d6pK5sRFkNNRn1IP2VGqsc9x+W0t89JH/MQVP1eOZae0oH721P95y7h6
 Zq1gQ9C0IKrgQ8khKDDz483CO6VZrZe9vLOr1KjHvTdejs2bjxb3LJgt+
 icyEZqvnWgh2NOPh8fA+xbzANkHKzjNsirygise+SwonjBmq9VJ1L52Mu
 TthE2D72LYAExp1GqpFSR6ZpD5K5cP8EHe9Qbrk29lDRxWe62jcj1p1EW
 BQJXNNSh6s8C1k76LXIsQwRKohm7S0v3aAO/GLcH+cmoV992FHztcZamH
 8wr6W1VJjruudEvb0QEQ4WMIHclFCB4uKijRnfA2T3nvWvx/jVMVjajU7 A==;
X-CSE-ConnectionGUID: FsJpeAbzQ5qnjfVJbg40Yg==
X-CSE-MsgGUID: NJXp5VJyS2SB9OVp1u71+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66412483"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66412483"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 03:14:30 -0800
X-CSE-ConnectionGUID: jI4ipzZYRWelzfiuKCnuOA==
X-CSE-MsgGUID: b8g+srRCSU2UtmEFG31UvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198519963"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 03:14:27 -0800
Date: Mon, 1 Dec 2025 12:14:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH i-g-t v2 2/3] tests/panthor: Add a test to make sure the
 buffer is zeroed at alloc time
Message-ID: <20251201111409.ylxykp74vpewq5p6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
References: <20251128093858.3844420-1-boris.brezillon@collabora.com>
 <20251128093858.3844420-3-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251128093858.3844420-3-boris.brezillon@collabora.com>
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

Hi Boris,
On 2025-11-28 at 10:38:57 +0100, Boris Brezillon wrote:
> This covering for this bug [1]. Add an IGT test to make sure we don't
> hit that again.
> 
> [1]https://lore.kernel.org/20251107171214.1186299-1-boris.brezillon@collabora.com
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

I merged 1/3 and this one,

Regards,
Kamil

> ---
>  tests/panthor/panthor_gem.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/panthor/panthor_gem.c b/tests/panthor/panthor_gem.c
> index 57cd97e809fd..1566c713f876 100644
> --- a/tests/panthor/panthor_gem.c
> +++ b/tests/panthor/panthor_gem.c
> @@ -66,6 +66,17 @@ igt_main {
>  		igt_panthor_free_bo(fd, &bo);
>  	}
>  
> +	igt_describe_f("Check zero-ing of buffer at creation time");
> +	igt_subtest("bo_zeroed") {
> +		struct panthor_bo bo;
> +
> +		igt_panthor_bo_create_mapped(fd, &bo, getpagesize(), 0, 0);
> +		igt_assert(bo.map);
> +		igt_assert_eq(*((uint32_t *)bo.map), 0);
> +
> +		igt_panthor_free_bo(fd, &bo);
> +	}
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.51.1
> 
