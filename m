Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E91D10390
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 09:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3D910E531;
	Wed, 26 Nov 2025 09:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXmGG0N8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBFE10E531
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764147733; x=1795683733;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2ygfMJOWwB5GWLVxVUYvm6QQfQDjRUeHuGogmGMqqoo=;
 b=mXmGG0N8kJVMiQKAeikIGI9TIH++Z7wprFJcN43JcKOzUru9ZwFbV1Xs
 D4riMXGfEzTCH3cUzQeUpKxrxeboijaLysB7ZlFYRdXChyv7/TN/lbHP/
 xR6LKuKhYFZh4fi30w9SoK998P7IEISc2NvTFuo6ZdFtYS2orZRgfigP3
 CfDSLkcGoCZf4F74E1qXmwdLfRT5/fCjO8verZbgiKzkiRs8tLHlw3sgf
 Ha+wNf7FgIXdh6I5zYBKeCkSLVp9j9x35szdN9wve+oZgykbCIwcKmOFZ
 se5lMVwupUWmxbmGddPMSFQNfQemL2qjp3Q5Ml3rcPBUQ85N7aze5N8Q+ w==;
X-CSE-ConnectionGUID: zs9obKWwR2y/VeljsSN3gQ==
X-CSE-MsgGUID: iGIMiqgbTBi0mkFbEeHv6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77287919"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77287919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:02:13 -0800
X-CSE-ConnectionGUID: H9pvuIThQ9a5pDq9UgVjZA==
X-CSE-MsgGUID: AOU4V/nsQo+lmuezllrmnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="197370658"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.72])
 ([172.28.182.72])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 01:02:11 -0800
Message-ID: <ee0eef5f-2a3d-44d1-bf89-c4855d15d938@linux.intel.com>
Date: Wed, 26 Nov 2025 10:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] lib/debugfs: Add debugfs helpers to open tile
 directory
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251125165028.36533-1-piotr.piorkowski@intel.com>
 <20251125165028.36533-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251125165028.36533-3-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 11/25/2025 5:50 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Let's add igt_debugfs_tile_dir to open the debugfs directory
> corresponding to a given tile index.
>
> v2:
>   - rewrite use of snprintf (Marcin)
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/igt_debugfs.c | 31 +++++++++++++++++++++++++++++++
>   lib/igt_debugfs.h |  1 +
>   2 files changed, 32 insertions(+)
>
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 210a9cea0d..e95c4ce682 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -226,6 +226,37 @@ int igt_debugfs_gt_dir(int device, unsigned int gt)
>   	return debugfs_gt_dir_fd;
>   }
>   
> +/**
> + * igt_debugfs_tile_dir:
> + * @device: fd of the device
> + * @tile: tile index
> + *
> + * This opens the debugfs directory corresponding to tile for use
> + * with igt_sysfs_get() and related functions.
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_debugfs_tile_dir(int device, uint8_t tile)
> +{
> +	int debugfs_tile_dir_fd;
> +	char path[PATH_MAX];
> +	size_t len;
> +	int ret;
> +
> +	if (!igt_debugfs_path(device, path, sizeof(path)))
> +		return -1;
> +
> +	len = strlen(path);
> +	ret = snprintf(path + len, sizeof(path) - len, "/tile%u", tile);
> +	igt_assert(ret < sizeof(path) - len);

what if ret < 0 ?

igt_assert(ret >= 0 && (size_t)ret < sizeof(path) - len);

> +
> +	debugfs_tile_dir_fd = open(path, O_RDONLY);
> +	igt_debug_on_f(debugfs_tile_dir_fd < 0, "path: %s\n", path);
> +
> +	return debugfs_tile_dir_fd;
> +}
> +

With assert condition fixed:

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   /**
>    * igt_debugfs_connector_dir:
>    * @device: fd of the device
> diff --git a/lib/igt_debugfs.h b/lib/igt_debugfs.h
> index f4044d5458..76dbff3e8e 100644
> --- a/lib/igt_debugfs.h
> +++ b/lib/igt_debugfs.h
> @@ -49,6 +49,7 @@ bool igt_debugfs_search(int fd, const char *filename, const char *substring);
>   int igt_debugfs_gt_dir(int device, unsigned int gt);
>   int igt_debugfs_gt_open(int device, unsigned int gt, const char *filename,
>   			int mode);
> +int igt_debugfs_tile_dir(int device, uint8_t tile);
>   
>   /**
>    * igt_debugfs_read:
