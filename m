Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A82606A319
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SvcdSAsU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B110F51F;
	Tue, 20 Oct 2026 12:11:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E0210F54B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792498225; x=1824034225;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HiI0PuD4cy6AG2JK3M6m6OFdAqNQXq+uh8sQLvfoOn4=;
 b=SvcdSAsUvSOr8wrCLXJEANMiVRDghM2k+XQ7HN8MW+w6VVLz/thg5hEo
 Wy9JT46v9heLWLUmRG8JuXFPJblV98e5jRlwWhtYc2k9AYgPRhf6VyTbT
 s7dbSdHhaZFO4hsgoKiQsuUx7ON7csY4Hm2J7r7/m9wQpS1ZBH1jDF4hR
 oa0IiSQql+5LswEtii/y64LFP3krI6bA2vFPaYX1WcmelVB7VGFrsmmYk
 iNChrgBa8puhjnXMS+9tEanVEVgPGbKk76mztKoHD/Mmrgqd76g+2hSnN
 +XB1kfSBTIKrl9U8gwJv/m51+y8tjZ6u2LcfmffZuLtbzwXnxgv8bMfwm Q==;
X-CSE-ConnectionGUID: qMq7yXDbTaiqPDGXibryDg==
X-CSE-MsgGUID: aQq8b9j4RTCid3N/IbFHyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1179685"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1179685"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:10:24 -0700
X-CSE-ConnectionGUID: JslZFnFsSGOXJk3lRj36cA==
X-CSE-MsgGUID: GS7/jP/QRK6TZLUoXsssmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4605609"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 05:10:22 -0700
Date: Tue, 20 Oct 2026 14:10:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t] tests/unigraf_lt: Restrict to Intel drivers
Message-ID: <20261020121020.yuxlfao7gro5zaym@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20260813171156.2353078-1-markyacoub@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813171156.2353078-1-markyacoub@google.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,
On 2026-08-13 at 13:11:56 -0400, Mark Yacoub wrote:
> Currently, `igt_dp_force_link_retrain` natively maps to Intel's
> i915 debugfs architecture. Thus, enforce
> `igt_require_f(is_intel_device(drm_fd))` in the test fixture so
> that this suite explicitly skips rather than blindly failing on
> generic drivers. Other drivers should implement equivalent generic
> IGT hooks before they can execute this verification.
> 
> Signed-off-by: Mark Yacoub <markyacoub@google.com>

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/unigraf/unigraf_lt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
> index 81e6ecd3f..c0d1161f6 100644
> --- a/tests/unigraf/unigraf_lt.c
> +++ b/tests/unigraf/unigraf_lt.c
> @@ -94,6 +94,8 @@ int igt_main()
>  	igt_fixture() {
>  		drm_fd = drm_open_driver(DRIVER_ANY);
>  		igt_assert(drm_fd >= 0);
> +		igt_require_f(is_intel_device(drm_fd),
> +			      "This test relies on Intel-specific debugfs endpoints (e.g., i915_dp_force_link_rate, i915_dp_force_lane_count) for link training verification. Other drivers should implement equivalent generic IGT hooks.\n");
>  
>  		igt_display_require(&display, drm_fd);
>  		unigraf_require_device(drm_fd);
> -- 
> 2.55.0.691.gc56d675ccc-goog
> 
