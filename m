Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA68C47DDB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 09:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD34010EA93;
	Thu,  1 Feb 2024 09:20:56 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 09:20:55 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D01C10EA93
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706779255; x=1738315255;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ppx0zcBYTLKPHuGcY5GnmYl3enGZFaOLHZeRmag6O00=;
 b=Mtev+lcjs67wUBv96HgfSiZVaciOpnxacGurvtXYQrD3tUqUnaiUNVHW
 plheafqmzRhZLJd32GYv0DJrCoRCVB7DEJ6YarSntWdG0qe9khqtmtJBn
 QEJC4LSkuTEIOPOPS01PkZGrdw2lq0CyLVUESNfI/M2fUNyPNCwrar25X
 vhVPJfo8DeOkZ4LGaVlemkOO4WeaWqeAKFPY01gdlwTz4apGkqclbi5QP
 ZotqSft9zTjP0FVanGqVrspsfOZu1gB0SZbzFN788SiPhlCyTARLcgAUW
 3aEvh7eraCzVSly0BQK9odF6VAeHqkWS/c/que9THbtZvZcAnCDGMWSLS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="34569"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="34569"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:13:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119881689"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="1119881689"
Received: from kniesyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.112.105])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:13:46 -0800
Date: Thu, 1 Feb 2024 10:13:44 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pat: assert flat CSS support
 for xe2
Message-ID: <20240201091344.wwkmmacnhcdhlxpz@zkempczy-mobl2>
References: <20240131114305.202871-1-matthew.auld@intel.com>
 <20240131114305.202871-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131114305.202871-3-matthew.auld@intel.com>
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
Cc: igt-dev@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 11:43:05AM +0000, Matthew Auld wrote:
> Xe2+ should support flat CCS compression, and here we are using
> compressed PAT index modes. Assert the platform indeed has flat CCS
> here, otherwise something is likely wrong.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_pat.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 40256bada..3d7d7400c 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1049,6 +1049,7 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  
>  	igt_subtest_with_dynamic("pat-index-xe2") {
>  		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
> +		igt_assert(HAS_FLATCCS(dev_id));
>  		subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
>  						     ARRAY_SIZE(xe2_pat_index_modes));
>  	}
> -- 
> 2.43.0
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
