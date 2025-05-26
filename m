Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF38FC5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 11:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A08510E351;
	Mon, 26 May 2025 11:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDoA3ir3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2370710E356
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748258967; x=1779794967;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=c6kiLv9YgJYN9HzUZgiNfa9pYufkF+hi0GCLw+r3mYA=;
 b=XDoA3ir37N6/nXqyywy0RMSUlI2uLaWt1gRkC7xC/KSyvkBUciDmtsx7
 eZRXHmK4mCVhx3/2MYHbsqriVg0Sw6f3WUx/aAcBORMG65pB+hx9fviFS
 1BnbW9tLwnlOAvyW6+zt/fsMN+KSWmotrzmxnIG8lerCN54Hiy0LCUtYi
 5srL7ox+RcX9pHLWV8xJNJTbqhvZVBANxlwezbLUYfiOGbF3qYlCzMe+g
 6LRmVdUCaUxogN64keTg8bR+43LkSZol5nOSEr79cAVDIvD3LNl+DAerR
 o/QHEUm0VMKbmG8ZcwgrFD6iLRnUR4g8rIHHczDpaivj1kUOAphC0lWm+ g==;
X-CSE-ConnectionGUID: GVyS/ndbQQiXkxvIr2YZbw==
X-CSE-MsgGUID: /95hJz/2QSCFbwaLU4vvrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="52856151"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="52856151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 04:29:26 -0700
X-CSE-ConnectionGUID: coz6D9KYTXW0kTidDOpF7Q==
X-CSE-MsgGUID: Fx43B6y0RhOyyi8dod1qzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="143289707"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 04:29:25 -0700
Date: Mon, 26 May 2025 13:29:23 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Sokolowski <jan.sokolowski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH i-g-t v3 3/8] lib/igt_nouveau: fixup print/scan
 formatting for files in lib
Message-ID: <20250526112923.3yl6nbz4ch3i2rdd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 igt-dev@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
References: <20250526080740.67790-1-jan.sokolowski@intel.com>
 <20250526080740.67790-4-jan.sokolowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526080740.67790-4-jan.sokolowski@intel.com>
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

Hi Jan,
On 2025-05-26 at 08:07:35 +0000, Jan Sokolowski wrote:
> Compiling on other architectures than x86-64 causes a lot
> of print/scan formatting warnings.
> 
> Fix formatting by using proper formatters, eg. PRIx64.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>

imho Cc should be before s-o-b, this could be corrected at merge

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_nouveau.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
> index fdf6020a3..62a53c8b1 100644
> --- a/lib/igt_nouveau.c
> +++ b/lib/igt_nouveau.c
> @@ -96,7 +96,7 @@ uint64_t igt_nouveau_get_block_height(uint64_t modifier)
>  		gob_height = 4;
>  		break;
>  	default:
> -		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %lx\n",
> +		igt_fail_on_f(true, "Unknown GOB height/page kind generation 3 in modifier %" PRIx64 "\n",
>  			      modifier);
>  		break;
>  	}
> -- 
> 2.34.1
> 
