Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB14C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 12:59:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF210E0AA;
	Fri,  7 Feb 2025 12:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IXyaCDj8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2452D10E0AA
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933192; x=1770469192;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1UvirYAaeO2z3elx9XFP/2kFJIAtolFs27SrCdqQgFo=;
 b=IXyaCDj8p1rnTmcJYcknZCnOSr/CbdSLzeDG6wAsEBlUeUIylWWeQ4Xv
 VE0Pffdf06SB+rd9PmQOjI7N6hdEdbji+P9narZnvQk8SH6GP0OO7TTK9
 DBhzXRVBARGx2iSdewMTYufSbAf/URuJ0HXBaqPMSX6vrmgMrx7le6zSI
 iZD9RmuzKpiZgCALHXbWvNkuRkEK/c/Z3tw8TvUlwXyQrIXkyDCAye9kX
 tqcfL6HZspqILWmPGnddI7nARvF1k3mZbiQHqM4jcupEULETwgOmxtZFo
 V1S9RsNvLkNtyYQ7aedeNHLrJ4D4E81ovq5o6f5vyR7f9xHkmGiEBWxTH g==;
X-CSE-ConnectionGUID: dGiTHmxQRu2pDeZCQGN6tA==
X-CSE-MsgGUID: aZ1nOejyQny82aAElcolow==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39701075"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39701075"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:59:51 -0800
X-CSE-ConnectionGUID: 1Het/DXOQ5+Wl+GcYhZJ6A==
X-CSE-MsgGUID: WPqBZXwJR5GkTRaFDG/kmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112032697"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.126])
 ([10.245.246.126])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 04:59:50 -0800
Message-ID: <d6400f4b-34e5-4299-a903-61128c809479@intel.com>
Date: Fri, 7 Feb 2025 13:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] lib/eudebug: Adjust to upstream uapi rebase
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250207114935.1996323-1-mika.kuoppala@linux.intel.com>
 <20250207114935.1996323-5-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250207114935.1996323-5-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On 7.02.2025 12:49, Mika Kuoppala wrote:
> As eudebug-dev is not merged, it consumes the upstream changes
> as a base. Exec queues got new property of PXP which causes
> PROPERTY_EUDEBUG to jump from 2 to 3.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   include/drm-uapi-experimental/xe_drm_eudebug.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index 714bb93c7..f66de2ff5 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -54,7 +54,7 @@ struct drm_xe_vm_bind_op_ext_attach_debug {
>   
>   /* ... */
>   
> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		2
> +#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_EUDEBUG		3
>   #define     DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE		(1 << 0)
>   
>   /* ... */
