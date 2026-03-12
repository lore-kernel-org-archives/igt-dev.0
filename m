Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB4103E2EB
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 13:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764B810EA4B;
	Thu, 12 Mar 2026 13:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z3+3El/H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D816B10EA4B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 13:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773322463; x=1804858463;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F8sZiO/7oxTMYcbQzV7/vtVxoXGmrmN81T79kIez3IQ=;
 b=Z3+3El/HWCD2NHinT7Izvvbufehv8eF+xq1jr3tna+vaX6rlA3w2/GC+
 RhWLXfHimY8HCpVP1k73ZM9eCX79AmQHHIo9DjaqgIfDLOokMOCz7JMkC
 RxcHu6rHqs5smj9npT8c5Z4XQfwPkk2JdE4wgMffmFjdkXJjMYdcYs+G5
 7WosKbCp032yiwhjlD8Z2mAseq2HR9N2cpm7gJPCjJuEqZfm31M9AwgnL
 n5KBy3iyyruRSKJ9a+jtfWpSrKD41fmdBSUBp+mpmixf3xWx/q82S+pXB
 4P3mD50k/Au4fU6/td0UmOoby6nq2TO8/02FFD0vRsIhAvzVrCqrc8O4+ Q==;
X-CSE-ConnectionGUID: g9+ghCmYRz+BX3Phty5tNQ==
X-CSE-MsgGUID: Ma2T24AYSiaqiR6ai9phVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74526633"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74526633"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 06:34:15 -0700
X-CSE-ConnectionGUID: 0oBf9Nb3QCekbYXLuzAzYg==
X-CSE-MsgGUID: q4k787AORQy0xbj4CqWgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220765374"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 06:34:02 -0700
Date: Thu, 12 Mar 2026 14:33:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3 1/1] skip kms_flip case for mtk driver
Message-ID: <20260312133359.v2762oikzujy7enr@kamilkon-DESK.igk.intel.com>
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

I merged it with corrections, also changed subject:

tests/kms_flip: skip on MTK driver

In our future commits please add a name of changed test
like above (without '.c').

Regards,
Kamil

> 
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
