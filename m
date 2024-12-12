Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDAEE77180
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 17:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B866E10E48A;
	Thu, 12 Dec 2024 17:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixfCnRBE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940F510E48A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734023204; x=1765559204;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t21l+whDX/f2ps2uwV8IxWBG1juMr0CBEHnd1A54SeE=;
 b=ixfCnRBEytIAfb27Jy12QYII0R8q5NZnfvq5OfGPvpT4g4SK2P/PTGll
 KP4x/iUVOOK/e40z1cQvF/qOVPcf/iF9fOhyYorDC+DE3+51mBT1jRJFO
 ndcyxogoqlSrl9nbL8pCAsKcmcEW5eYmde1kcwWIB1IT53M6+y/3xEnV6
 iBEhRCTCyA4NHKVFlHmXYOCn/LGaCPzsOCwK+LVEZHO3Huf98ur5X1suk
 FCfMXfdFZ0leOPKqfLxHpsTS15WsEYns6BRnRRji/N5o1Zo4XhNNOX2YH
 LvcywOl3cdxKUGjT3Hqwgjx+/7Pc7tt+1pH3qb09ys0uiuEmqYxS388zp g==;
X-CSE-ConnectionGUID: /niWIOlgQACAOFLwr7cMZQ==
X-CSE-MsgGUID: qs7v911TT9qkmlF9h+R0Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38238977"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="38238977"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:06:44 -0800
X-CSE-ConnectionGUID: V6T/rRriRC+Bs/HSlqpQ+g==
X-CSE-MsgGUID: bBgV7CwLSvSPVk+wPzcZig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127289456"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 09:06:42 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Dominik
 Grzegorzek <dominik.grzegorzek@intel.com>, Christoph Manszewski
 <christoph.manszewski@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib/xe_eudebug: Fix and update event filters
In-Reply-To: <20241211191741.36973-2-christoph.manszewski@intel.com>
References: <20241211191741.36973-1-christoph.manszewski@intel.com>
 <20241211191741.36973-2-christoph.manszewski@intel.com>
Date: Thu, 12 Dec 2024 19:07:05 +0200
Message-ID: <87ttb8bzk6.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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

Christoph Manszewski <christoph.manszewski@intel.com> writes:

> At some point (before upstreaming) the eudebug uapi changed and
> the 'DRM_XE_EUDEBUG_EVENT_MAX_EVENT' definition was dropped. Use an
> existing event number for filtering out all events and add missing
> filters for events introduced along the way.
>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  lib/xe/xe_eudebug.h | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index 9aadbe847..823c7f6ea 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -114,17 +114,21 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
>   */
>  #define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		60ULL
>  
> -#define XE_EUDEBUG_FILTER_EVENT_NONE		BIT(DRM_XE_EUDEBUG_EVENT_NONE)
> -#define XE_EUDEBUG_FILTER_EVENT_READ		BIT(DRM_XE_EUDEBUG_EVENT_READ)
> -#define XE_EUDEBUG_FILTER_EVENT_OPEN		BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
> -#define XE_EUDEBUG_FILTER_EVENT_VM		BIT(DRM_XE_EUDEBUG_EVENT_VM)
> -#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
> -#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
> -#define XE_EUDEBUG_FILTER_EVENT_VM_BIND		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
> -#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
> -#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE  BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
> -#define XE_EUDEBUG_FILTER_ALL			GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
> -#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << (_e)) & (_f))
> +#define XE_EUDEBUG_FILTER_EVENT_NONE			BIT(DRM_XE_EUDEBUG_EVENT_NONE)
> +#define XE_EUDEBUG_FILTER_EVENT_READ			BIT(DRM_XE_EUDEBUG_EVENT_READ)
> +#define XE_EUDEBUG_FILTER_EVENT_OPEN			BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
> +#define XE_EUDEBUG_FILTER_EVENT_VM			BIT(DRM_XE_EUDEBUG_EVENT_VM)
> +#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE		BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
> +#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE_PLACEMENTS	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
> +#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION		BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND			BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
> +#define XE_EUDEBUG_FILTER_EVENT_METADATA		BIT(DRM_XE_EUDEBUG_EVENT_METADATA)
> +#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_METADATA	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
> +#define XE_EUDEBUG_FILTER_EVENT_PAGEFAULT		BIT(DRM_XE_EUDEBUG_EVENT_PAGEFAULT)
> +#define XE_EUDEBUG_FILTER_ALL				GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
> +#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e)) & (_f))
>  
>  int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
>  const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
> -- 
> 2.34.1
