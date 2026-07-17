Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E671C44520
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 12:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C508310F547;
	Fri, 17 Jul 2026 12:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3rZM/qv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797B10F547
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784291819; x=1815827819;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ixyNwR/rKR1bPcAiwaoLE7F10snWV+eJVCXGb3gpyWk=;
 b=h3rZM/qvGJXXdLIRBd0K1gdB8jfBXGl9DVzbTdYhRwA3YsenYSWAZw5q
 9h5eKmIS8nZSN9CGpwz4v6KvSHXg7AY+nwtwtWVqAtV1274RKiM0jizIq
 uoC3nEi/RwAYnsMFWqwi435ZYodE9OGl9ljqcI8+VrTWARKrNzFHIjuap
 kM5xSKdUdsmqLQggSozLHpZrvZwTlK/lK6nykhEErOgJVRofYNcn3tRnX
 xtU6S8W60+dlJm5XwtnM4HE/2r0M+ZHDIJMv+YVDAb+zzGrpPCq8yP5Qt
 M+mIIwWQow1l5mGKG410fbE7yrYiPbLngQHqGN5p3+Wzui5Gc7/xR+lzQ g==;
X-CSE-ConnectionGUID: c2Y6K/WCS1a+4Subnr3jxw==
X-CSE-MsgGUID: tiwj/wiBTAaEGlqHchkACw==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96474057"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="96474057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2026 05:36:59 -0700
X-CSE-ConnectionGUID: 1i/9wZQpSVmD19vuyhRaoQ==
X-CSE-MsgGUID: kyco0r5sRMGFYe6SQvtErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; d="scan'208";a="250423858"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 05:36:55 -0700
Date: Fri, 17 Jul 2026 14:36:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH i-g-t v3] tests/kms_hdr: Skip unsupported formats in
 bpc-switch test
Message-ID: <20260717123653.ncv3xmnc7lphelkj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Fei Shao <fshao@chromium.org>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Lancelot Wu <Lancelot.Wu@mediatek.com>,
 Manasi Navare <navaremanasi@google.com>,
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20260709073913.1645371-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709073913.1645371-1-jason-jh.lin@mediatek.com>
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

Hi Jason-JH,
On 2026-07-09 at 15:38:52 +0800, Jason-JH Lin wrote:
> Check if the primary plane supports the test format before attempting
> to create framebuffer. This allows the test to gracefully skip formats
> not supported by the hardware (e.g., FP16 formats on MediaTek) instead
> of failing with assertion errors.
> 
> Fixes: 5d46625cfb21 ("tests/kms_hdr: add FP16 format coverage")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

You got r-b from Swati and you didn't change code
so in such cases, when you resend, please add r-b.

Btw I apllied this today, thx!

Regards,
Kamil

> ---
>  tests/kms_hdr.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index 5d6337c1bd65..e23d5e4691aa 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -299,9 +299,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>  
>  				igt_dynamic_f("pipe-%s-%s-%s",
>  					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i]))
> +					      igt_format_str(hdr_test_formats[i])) {
> +					igt_require_f(igt_plane_has_format_mod(data->primary,
> +									       hdr_test_formats[i],
> +									       DRM_FORMAT_MOD_LINEAR),
> +						      "%s: Primary plane doesn't support format %s.\n",
> +						      igt_output_name(output),
> +						      igt_format_str(hdr_test_formats[i]));
> +
>  					test_bpc_switch_on_output(data, crtc, output,
>  								  hdr_test_formats[i], flags);
> +				}
>  
>  				test_fini(data);
>  			}
> -- 
> 2.43.0
> 
