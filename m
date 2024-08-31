Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A1FCA101D
	for <igt-dev@archiver.kernel.org>; Sat, 31 Aug 2024 08:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E7A10E0D7;
	Sat, 31 Aug 2024 08:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bK+oxV0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D641910E0D7
 for <igt-dev@lists.freedesktop.org>; Sat, 31 Aug 2024 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725093552; x=1756629552;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+3gUSwwnvOxPDc+u5S8N2ERl4HCqYV5pVOr3j38C8LQ=;
 b=bK+oxV0CLpwGjXwHMYH/qHL3YmdBZo9DZD/tCCd0jMgYK+7VzWYGK6M4
 fyBENMYkcQwisk4mtIBv51bZ+SikhgI+UN21FQAbZ5PGtIF5EAX0pmJuy
 sYiQD05n7tu9BxThy42iR3GV19uhJDdaIJ15sLlSLXCSct1NOaeWj1rtb
 ggll4SJlwKzfIuEd9uVb9aRKJY33e7+rIV8KEVKmm8mdybFnrJrv7ksZv
 wuZ9w44Vy9Q6aAmESYMNRJt2ZyuCSkdGVv3TDFgkzh6SCb8X3wVFulBKM
 dDn6GyWJO4EPJhhQQ4C/ULAU7VMB5VyQusgrKtumQM9h0IdKfZk0suIWR w==;
X-CSE-ConnectionGUID: ukdvz8jNRwexCxeE0YaxZQ==
X-CSE-MsgGUID: wUzoUAT3Q9+QqOQed+DhOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34899510"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="34899510"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 01:39:12 -0700
X-CSE-ConnectionGUID: I8/4595BQuudUdFx4NkreA==
X-CSE-MsgGUID: CP7j4OxuQ7ShilYCh3jaiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; d="scan'208";a="87359969"
Received: from unknown (HELO [10.245.245.247]) ([10.245.245.247])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2024 01:39:10 -0700
Message-ID: <9326496c-6263-4d51-a415-90d2fb23f199@linux.intel.com>
Date: Sat, 31 Aug 2024 10:39:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/kms_vrr: Avoid race between freeing display
 reseources
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com
References: <20240831055845.2839510-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240831055845.2839510-1-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

The sleep seems a workaround.

Can't you just do a blocking commit to disable everything instead?
igt_display_reset()
igt_display_commit2() before igt_display_fini

Den 2024-08-31 kl. 07:58, skrev Mitul Golani:
> While freeing display resources, that schedules driver to execute
> panel power off, which races while scheduling next immediate test.
> Giving time after freeing resources allows driver to avoid race
> between next non blocking atomic commit and panel power off from
> previous test.
> ---
>  tests/kms_vrr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 36a22eebe..481a4253f 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1110,5 +1110,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> +		//Wait for 2 seconds to free-up acquired display resources
> +		sleep(2);
>  	}
>  }

