Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997BFC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 12 Jun 2024 07:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3844A10E7A4;
	Wed, 12 Jun 2024 07:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxoS0M7U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B2E10E7A4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2024 07:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718175968; x=1749711968;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=5zNmgHXyDxWJ7Sq1nGwH2FA2fNtPzgk1C3Kq5Wu1kW0=;
 b=UxoS0M7UY9/ycKICUVHgguMuLTfenoYtn3URIMySp8ymhAX5yXZBNw4L
 GB+K4XpYkDq7u5Ga/UtDRMIDUepB6lJYYeOk8f+oJ8ndVf/FDQbV5xPUO
 wARPGsSVwRNIWVc2md0LLhT7xUA81gh/N29iXGfNTijjSo0pmfiTiaLT4
 DkdG/CIOYNj3TPvmg3gvmrtPxlF4G/CZIlJusVYCLi4PYMks351jcvc+N
 guqnWwS9fNTp1KTmpXq4KwTt8DoG8VmoI2lRcNxAX1HQO132r/Bt8ItSi
 dAO+mKNrygFyBQqasS1cOpRB4Op1LaCbc8oI9j7J1dwDMwT4jTyzNkcbK Q==;
X-CSE-ConnectionGUID: u+NXXakKSL+uOlSoEDeQrw==
X-CSE-MsgGUID: jEHPXKLfSZid27WQQpBN5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15091639"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15091639"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:06:06 -0700
X-CSE-ConnectionGUID: akyUi/wJQSWXDNUlpIDQ5A==
X-CSE-MsgGUID: u5dCpOx8R3+3WrvxSDd8wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39586075"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.4.197])
 ([10.246.4.197])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 00:06:05 -0700
Message-ID: <8c53a4dc-6778-4747-bd74-cfe734c53230@intel.com>
Date: Wed, 12 Jun 2024 09:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 4/7] lib/drmtest: Allow to get drm device name
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240607153629.52596-1-kamil.konieczny@linux.intel.com>
 <20240607153629.52596-5-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240607153629.52596-5-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 07.06.2024 17:36, Kamil Konieczny wrote:
> Make this a public function so in tests developers could use it
> instead of hard-coding driver names (such as "i915" or "xe").
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   lib/drmtest.c | 14 +++++++++++++-
>   lib/drmtest.h |  2 ++
>   2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 8ea96ba76..2dd4540b8 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -81,7 +81,19 @@
>    * and [batchbuffer](igt-gpu-tools-intel-batchbuffer.html) libraries as dependencies.
>    */
>   
> -static int __get_drm_device_name(int fd, char *name, int name_size)
> +/**
> + * __get_drm_device_name:
> + * @fd: a drm file descriptor
> + * @name: pointer to memory
> + * @name_size: size of @name
> + *
> + * A wrapper for DRM_IOCTL_VERSION which will write drm device name in @name.
> + *
> + * Returns:
> + * 0  if name of DRM driver was filled in @name
> + * -1 on ioctl fail
> + */
> +int __get_drm_device_name(int fd, char *name, int name_size)

Why still this ugly name?

Beside this:
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

>   {
>   	drm_version_t version;
>   
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 4d9b60882..27e5a18e2 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -38,6 +38,8 @@
>   
>   #include "igt_core.h"
>   
> +int __get_drm_device_name(int fd, char *name, int name_size);
> +
>   /*
>    * NOTE: Theser are _only_ for testcases exercising driver specific rendering
>    * ioctls and uapi (and a bunch of historical reasons). And KMS testcase should

