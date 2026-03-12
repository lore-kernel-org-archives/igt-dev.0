Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE396FD88EF
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6512410E9CF;
	Thu, 12 Mar 2026 10:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izXrVz/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33FD10E9CF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773311006; x=1804847006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=olsZxPEB9lrcKdiEmy8/G3NV4FhAq08Lqe8MbzIbFnM=;
 b=izXrVz/iV80ciYgRU+9HIPJGzQjAdpF4G/ddXs1BvZrs/p8T2vvPyYCg
 V6O8kxFU2sLBTqHI/c22oDF/g9ttO7iLiaoOj5XhrZ4gFFTDp6ZWe065T
 EEdBm9LAIOcj6lyuyCjj4594nNCfkICVU2k25oxtdjO1NIKOY6apKksNc
 ZQGDATmKJJhaRpHK+7V2YbDjNtJgeONWR1F1zR8KongC+/yuKjlnrHgEz
 8atWpcC9pU7qVGd1i9qyxeeaRVnGTBA52XKbTSHsxtKBEbyVrI8ao+q6+
 E+yhUuoOKjXMlUCjdKycMmKxfJaoDNUCYyFY3qcNPc8TErDRA3drN4Dwo g==;
X-CSE-ConnectionGUID: pdT1cCedQ7yDQ5YVqC62jA==
X-CSE-MsgGUID: Ju3axPQUS16O4x0W/K7pQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85874732"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85874732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:23:26 -0700
X-CSE-ConnectionGUID: 7qkJ7FLhQuS6hLrgFDZmLw==
X-CSE-MsgGUID: 2epeyciRQqqePVO4V6KMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="251271418"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:23:24 -0700
Date: Thu, 12 Mar 2026 11:23:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3 1/1] skip kms_flip case for mtk driver
Message-ID: <20260312102306.n4kz7i4kewhohpqx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260312012507.23682-1-xiandong.wang@mediatek.com>
 <20260312012507.23682-2-xiandong.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312012507.23682-2-xiandong.wang@mediatek.com>
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

Hi Xiandong,
On 2026-03-12 at 09:24:58 +0800, Xiandong Wang wrote:
> From: Xiandong Wang <Xiandong.Wang@mediatek.com>
> 

You forgot to write down here a description. I will copy-paste
one sentence from your previous mail here and merge it. With this

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> Signed-off-by: Xiandong Wang <Xiandong.Wang@mediatek.com>
> ---
>  tests/kms_flip.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 49a5f4ed1..29a24c6f0 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -2095,6 +2095,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  
>  		igt_display_require(&display, drm_fd);
>  
> +		igt_skip_on(is_mtk_device(drm_fd));
> +
>  		kmstest_set_vt_graphics_mode();
>  		igt_install_exit_handler(kms_flip_exit_handler);
>  		get_timestamp_format();
> -- 
> 2.46.0
> 
