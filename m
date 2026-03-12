Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD4F1067042
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA32C10EA34;
	Thu, 12 Mar 2026 15:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObNT+nKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF6C10EA34
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328190; x=1804864190;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=umdv6KKBFlrrxdJJhm5HVZEyP2kSrUMCglqHpBZx/nk=;
 b=ObNT+nKsQg8XxnbksgLk7uXuyYYL3xb9BYIXNsQLozkFbshucU2cNu6/
 /k2pG4ayrWgmQgaj5VBcMLazsKx/TRdWdCMBmJG4lMsPlfBtSa0cuGmSq
 RFtneK1VSriFK59ThTLF03ozHYROGzACEsNt+VgDLm20KNiyuc8ONdCyK
 zNceWil0LRlYm1+JpHKGRs0XhS21OkdmdogeGbRR+DPM3lI9EmAX9oFUg
 MBk7akzvBHg0KFEZD+hQISEij6N2uUm2u17N5BKgBrK0NZZoTq3Cu1HTJ
 vUFugyzCQbHgJin7RWhlQfnyb0nr4+PglT+1DcWgfCM9pn45DAp/AQkZv Q==;
X-CSE-ConnectionGUID: blD7hzh5Qpa7sLmVOLXrKA==
X-CSE-MsgGUID: ReWAr669QEqIzKE9UXui9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77031580"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77031580"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:09:50 -0700
X-CSE-ConnectionGUID: +n7MiOUJQ+et5KxnaZaa1g==
X-CSE-MsgGUID: CWcmhAn0TBW+V8DKrRhN+g==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 08:09:49 -0700
Date: Thu, 12 Mar 2026 16:09:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t v1 5/6] lib/intel_batchbuffer: update api docs url
Message-ID: <20260312150947.y5f6jjd6c2eayij3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
References: <20260220150202.1013804-1-pawel.sikora@intel.com>
 <20260220150202.1013804-6-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260220150202.1013804-6-pawel.sikora@intel.com>
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

Hi Pawel,
On 2026-02-20 at 16:01:59 +0100, Pawel Sikora wrote:
> Due to the migration from gtk-doc to mkdocs(cdoc)
> for API reference generation, the links
> to the old documentation need to be adjusted
> to match the new cross-referencing format.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil
> ---
>  lib/intel_batchbuffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 3b25a385b..46eb82ab8 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -60,7 +60,7 @@
>   * @title: Batch Buffer
>   * @include: igt.h
>   *
> - * Note that this library's header pulls in the [i-g-t core](igt-gpu-tools-i-g-t-core.html)
> + * Note that this library's header pulls in the :file:`igt_core.h`
>   * library as a dependency.
>   */
>  
> -- 
> 2.51.0
> 
