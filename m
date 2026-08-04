Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D193C55184
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 14:10:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB5B10EA87;
	Tue,  4 Aug 2026 14:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4nvTJcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524F10EA7E
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 14:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785852624; x=1817388624;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ioj0grclwAG4ku3UxdNECUgoQ23hKmucGkgLJBqdAek=;
 b=l4nvTJcl2GmCvBcN/YPJPthWEJ6jHeAUYyo4tu09FzcrjTr4/UYNUkLX
 1k9WS201aVjwlTIIDmz525SD3YUMjv/coX/QFZoCqMXtm+2cxak6RYE78
 EOHL/Eg0ts+hhQXQu6DiSGRZ2eOfxr1nuKuJj4DIUxFzTZXUqdMgCuOgh
 KjUKch9x6LhqiX5KYTKULEagnQBReYoGm4Ps3VW3DuFoXqzYg3FzqAO4s
 08mb5iqHMThbbnY8irbKpM+ncL2b92ITKIUO9ariIr2lur1WM9jr6IqIX
 DRtyTrSWvATDU1ycv5OXNiSQYhGAkI4NhODgL/vkuGgBSuwUiNauuO1CP w==;
X-CSE-ConnectionGUID: QLbrw8gVR1mM4CBFPfzpcQ==
X-CSE-MsgGUID: 2J/ZI0B4TgmXkFtOzKR0CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="96996295"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="96996295"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 07:10:22 -0700
X-CSE-ConnectionGUID: aeAb8NhWTSS41cVDCiXkuA==
X-CSE-MsgGUID: VUzvE4MKRXOCiD7h6FfEHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="257188955"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.68])
 ([172.28.182.68])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 07:10:20 -0700
Message-ID: <16c0d74e-4e28-42fa-813f-448886509c39@linux.intel.com>
Date: Tue, 4 Aug 2026 16:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/igt_device_scan: Extract helper setting device
 filter from fd
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, janusz.krzysztofik@intel.com
References: <20260729100918.842807-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260729100918.842807-1-lukasz.laguna@intel.com>
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


On 7/29/2026 12:09 PM, Lukasz Laguna wrote:
> Helper sets device filter to the device corresponding to DRM device file
> descriptor. Move the implementation from core_hotunplug test into the
> library, so it can be reused in other tests.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v3:
>   - move it to igt_device_scan (Janusz)
> ---
>   lib/igt_device_scan.c  | 23 +++++++++++++++++++++++
>   lib/igt_device_scan.h  |  2 ++
>   tests/core_hotunplug.c | 17 +----------------
>   3 files changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 7c7995224..decf19646 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -2477,3 +2477,26 @@ int igt_device_prepare_filtered_view(const char *vendor)
>   
>   	return gpu_count;
>   }
> +
> +/**
> + * igt_device_set_filter_from_fd:
> + * @fd: DRM device file descriptor
> + *
> + * Set device filter to the device corresponding to @fd.
> + */
> +void igt_device_set_filter_from_fd(int fd)
> +{
> +	const char *filter_type = "sys:";
> +	char filter[strlen(filter_type) + PATH_MAX + 1];
> +	char *dst = stpcpy(filter, filter_type);
> +	char path[PATH_MAX + 1];
> +	struct stat st;
> +
> +	igt_assert(!fstat(fd, &st) && S_ISCHR(st.st_mode));
> +	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device",
> +		 major(st.st_rdev), minor(st.st_rdev));
> +	igt_assert(realpath(path, dst));
> +
> +	igt_device_filter_free_all();
> +	igt_assert_eq(igt_device_filter_add(filter), 1);
> +}
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index f24a193cd..ac75fea8c 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -103,4 +103,6 @@ int igt_open_render(struct igt_device_card *card);
>   /* Add or use filters to match multiGPU devices */
>   int igt_device_prepare_filtered_view(const char *vendor);
>   
> +void igt_device_set_filter_from_fd(int fd);
> +
>   #endif /* __IGT_DEVICE_SCAN_H__ */
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 7c9dae1bf..33de65369 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -550,21 +550,6 @@ static void post_healthcheck(struct hotunplug *priv)
>   	cleanup(priv);
>   }
>   
> -static void set_filter_from_device(int fd)
> -{
> -	const char *filter_type = "sys:";
> -	char filter[strlen(filter_type) + PATH_MAX + 1];
> -	char *dst = stpcpy(filter, filter_type);
> -	char path[PATH_MAX + 1];
> -
> -	igt_assert(igt_sysfs_path(fd, path, PATH_MAX));
> -	igt_ignore_warn(strncat(path, "/device", PATH_MAX - strlen(path)));
> -	igt_assert(realpath(path, dst));
> -
> -	igt_device_filter_free_all();
> -	igt_assert_eq(igt_device_filter_add(filter), 1);
> -}
> -
>   /* Subtests */
>   
>   static void unbind_rebind(struct hotunplug *priv)
> @@ -713,7 +698,7 @@ int igt_main()
>   		}
>   
>   		/* Make sure subtests always reopen the same device */
> -		set_filter_from_device(fd_drm);
> +		igt_device_set_filter_from_fd(fd_drm);
>   
>   		igt_assert_eq(close_device(fd_drm, "", "selected "), -1);
>   

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

