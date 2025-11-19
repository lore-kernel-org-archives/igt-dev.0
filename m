Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB58CF34B2
	for <igt-dev@archiver.kernel.org>; Wed, 19 Nov 2025 14:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33F110E644;
	Wed, 19 Nov 2025 14:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJDyPitF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D572D10E644
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Nov 2025 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763562743; x=1795098743;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0On6dQLgWmXoGGDBVF4Hnxfatec1HUHWS3wafwuK+IE=;
 b=eJDyPitFGuygICdiVnhH+6FApcJyWTTMBV5n69fON+ujophEX0gaAbri
 38X1ZBcNsIg6gCV7sLSjAIYaj7BVZt5oG1cwdknrLjAZcNI3Dg/V+0B/O
 A7q8E6afaRyoC0dIah+vYssVUE5rtJBWunxgsO0LE47oyfdjB0mMlhHZD
 X3gnkJeL684anG9h3A8bROpxHsTafXNOAiWGWxURutXihNRNblyfRCKyv
 5Dy0YXcRQ/W90M/Lt6iy5r25DwQmAOQpy48baPaemRdma2G3tKYpwI66w
 Gi5AiJQiwhT4PMpE9Xu2DzEQltluKvmSzAb3DgFVR3PcL3Q0Ckx+BeYrh A==;
X-CSE-ConnectionGUID: dibXLzSnQE2FxillNhHm7g==
X-CSE-MsgGUID: pK1L7DWNSg6euuPRedC4Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65537748"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="65537748"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:32:23 -0800
X-CSE-ConnectionGUID: CnIn9YMaTmyCXG/zrzgZTw==
X-CSE-MsgGUID: 1SKguwegTmiNYDLJamcsGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191860887"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.59])
 ([172.28.182.59])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:32:21 -0800
Message-ID: <03df45fa-df3f-44c7-a79e-2873b42db834@linux.intel.com>
Date: Wed, 19 Nov 2025 15:32:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] lib/igt_dir: Allow scanning only the current
 directory
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20251113114615.3736269-1-piotr.piorkowski@intel.com>
 <20251113114615.3736269-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20251113114615.3736269-2-piotr.piorkowski@intel.com>
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
> The check rejecting scan_maxdepth == 0 prevented callers from
> scanning only the current directory without descending into subdirectories.
> Let's remov this restriction to enable using scan_maxdepth = 0 as a valid
> mode to list entries in the top-level directory only.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   lib/igt_dir.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/lib/igt_dir.c b/lib/igt_dir.c
> index e232dbda9c..6ef8e859a4 100644
> --- a/lib/igt_dir.c
> +++ b/lib/igt_dir.c
> @@ -241,7 +241,6 @@ int igt_dir_scan_dirfd(igt_dir_t *config, int scan_maxdepth)
>   	igt_require(config->root_path);
>   	igt_require(config->dirfd >= 0);
>   	igt_require(scan_maxdepth >= -1);
> -	igt_require(scan_maxdepth != 0);

LGTM,

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>   
>   	/* If the linked list is not empty, clean it first */
>   	if (!igt_list_empty(&config->file_list_head)) {
