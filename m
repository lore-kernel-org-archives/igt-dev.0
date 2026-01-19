Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74592D29C43
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 16:45:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165AA10E4CC;
	Mon, 19 Jan 2026 16:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUYKpibB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A55010E4CC
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768841135; x=1800377135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UFECi38P0o9FnodPk/K5097pZhw38KmhQIMe61o18ME=;
 b=aUYKpibBEkW2x69H3YFlilIVl5DjYzJio1lW2cQJGEEtIEGRTD6K6WAf
 vXvWvjBZjiuZMzvDJ40sBvuaaXARMfpsfTPby7gvdOAJzW3TGqzuTi33v
 sUX61atjYKFo8Nod/Hk7gZ2UDcHhIL0nxvZTrBVNz+J72j1DavtIF7f4p
 w0ifXOgQSvMEqsf2CVgA5QLoyeF3DJ39za2O+kvRTjBvjjh6063dq6oIU
 BBPuZ0RjkD/jO0eyOefuVxDJWAYSapHkBzMihbpfs3SdjZwAPjEDnY73/
 yQlHHvWGM4V/460utBZzD8B1d/KLahIrZ6OfApe/x6tXTOpHwe19bKisQ g==;
X-CSE-ConnectionGUID: MlvQ9Ff2Tjugb4H+Bpza6w==
X-CSE-MsgGUID: qttjPwiEQl6NVNFXBQNMiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80356381"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="80356381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 08:45:27 -0800
X-CSE-ConnectionGUID: LgBEGOXNQZWcsE8JfmxK7Q==
X-CSE-MsgGUID: 7UYBWR9TQbqtMZTPpQlkDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="205538825"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:45:26 -0800
Date: Mon, 19 Jan 2026 17:45:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 3/5] lib/xe/xe_legacy: Assert fd when CLOSE_FD is set
Message-ID: <20260119164523.44czpckj2wkn5zvz@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-4-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117000456.26207-4-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-01-17 at 00:04:54 +0000, Shuicheng Lin wrote:
> When CLOSE_FD is requested, xe_legacy_test_mode() expects to open its own
> fd. Assert fd is -1 to avoid leaking an already-open descriptor.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  lib/xe/xe_legacy.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 17d0839be..6c0ed56c9 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -73,8 +73,10 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & COMPRESSION)
>  		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
>  
> -	if (flags & CLOSE_FD)
> +	if (flags & CLOSE_FD) {
> +		igt_assert_eq(fd, -1);
>  		fd = drm_open_driver(DRIVER_XE);

Or it could be drm_reopen_driver() ?
For case when fd == -1, all previous igt_require() checks looks
incorrect.

Regards,
Kamil

> +	}
>  
>  #define THREE_SEC	(3 * 1000000000ull)
>  	if (flags & LONG_SPIN)
> -- 
> 2.34.1
> 
