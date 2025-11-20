Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0CECF8564
	for <igt-dev@archiver.kernel.org>; Thu, 20 Nov 2025 09:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D24110E713;
	Thu, 20 Nov 2025 09:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VJv4z286";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9577610E713
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Nov 2025 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763629823; x=1795165823;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Pn/uCBbNp58yCwbMdEDbGS9cLNsrF16dRUAwnwoGyis=;
 b=VJv4z286t0E/KkwtVKH4MGB8cYgDZ0qF9E90kNRS6Yux/jY3yivsy708
 5BzbVvBZuSUBmm5UB3z3FXn6kkivSWlAQ51fWL5pawO7d4ddcUhOgRQ/1
 QXCdcHx/GqhtCHU+n06eS3d5cX122KgJonebWhTgqC5X3Bfpm1wO4Kym5
 ypLudCJBDkzJVeqEtlLJZpC/rCoxO2MEAOSkPBz8JPkl+7tUobmtFabTf
 NAWv/dy3nWlqx4h4jfCz46Mp36cXvLPL1TLLduBDIc3XSMr/aCQlZ1AQa
 PMHL2I2zwFce/0EUM9vUHiU9pUnC3NkuJJOPDR+htxSvzCwddJrlfqKxe Q==;
X-CSE-ConnectionGUID: 16P/lg4bToW+Xkohm9iE6g==
X-CSE-MsgGUID: S7CMT5TTTiCUa01wxuPGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76300466"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76300466"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:10:22 -0800
X-CSE-ConnectionGUID: YCYxFo1MQXiV3XkCApMYVQ==
X-CSE-MsgGUID: SkWZxnVxREOg4guHTXuPFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="195789470"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.80])
 ([172.28.182.80])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:10:20 -0800
Message-ID: <c36de15a-28ae-40b1-8722-c5a8320cf5b3@linux.intel.com>
Date: Thu, 20 Nov 2025 10:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] lib/debugfs: Add debugfs helpers to open tile
 directory
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
 <20251113114615.3736269-3-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251113114615.3736269-3-piotr.piorkowski@intel.com>
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


On 11/13/2025 12:46 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Let's add igt_debugfs_tile_dir to open the debugfs directory
> corresponding to a given tile index.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   lib/igt_debugfs.c | 32 ++++++++++++++++++++++++++++++++
>   lib/igt_debugfs.h |  1 +
>   2 files changed, 33 insertions(+)
>
> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
> index 210a9cea0d..dec936ebba 100644
> --- a/lib/igt_debugfs.c
> +++ b/lib/igt_debugfs.c
> @@ -226,6 +226,38 @@ int igt_debugfs_gt_dir(int device, unsigned int gt)
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
> +	char tilepath[16];
> +	int ret;
> +
> +	if (!igt_debugfs_path(device, path, sizeof(path)))
> +		return -1;
> +
> +	ret = snprintf(tilepath, sizeof(tilepath), "/tile%u", tile);
> +	igt_assert(ret < sizeof(tilepath));

something wrong with this check

maybe

     len = strlen(path);
     ret = snprintf(path + len, sizeof(path) - len, "/tile%u", tile);
     igt_assert(ret >= 0 && (size_t)ret < sizeof(path) - len);

and drop tilepath and strncat

> +
> +	strncat(path, tilepath, sizeof(path) - 1);
> +
> +	debugfs_tile_dir_fd = open(path, O_RDONLY);
> +	igt_debug_on_f(debugfs_tile_dir_fd < 0, "path: %s\n", path);
> +
> +	return debugfs_tile_dir_fd;
> +}
> +
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
