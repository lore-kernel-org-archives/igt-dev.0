Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A6CC47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 12:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6310F9B6;
	Wed, 31 Jan 2024 12:21:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E010F9B6
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706703670; x=1738239670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YjIHj9/KftyU3jzxn81RCnCDSlEVzgRkVTeFTZX+Jb0=;
 b=WDdcQQap6dMiHpw7TTivHzA5r3CSvlH+Q6M3kUWJG8xlFy/3WFw5dnVK
 uor7RRUsI1pEy6A+wqk618zkFhzxc7ZABbS5RfcaNgPCpEroAXrdSQ9M7
 42m08ebNUxEUjg8zsS/4ypwgr3DLnrxkgIsEyGPk0mtm0fmslk8VU4Xle
 vl9MycIN1lWkYhD5U/5GN1uQilUZ7ZJXi2PHp6k5DbPsChmt+3vId11Lk
 ej1tpiKf7tQGftyo4Ej+mg0+JgfvkyfQl3p0EhQAjZyMmwkL1HY4TjFSv
 acMxkBHs5QD323WTf6HtkYu6XLZCzrPtOusDtH0/xNa+pEybIWBy3+pnL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3423913"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3423913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="30480333"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:21:09 -0800
Date: Wed, 31 Jan 2024 13:21:06 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Message-ID: <20240131122106.4qqf727lanaawtid@zkempczy-mobl2>
References: <20240131114305.202871-1-matthew.auld@intel.com>
 <20240131114305.202871-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240131114305.202871-2-matthew.auld@intel.com>
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

On Wed, Jan 31, 2024 at 11:43:04AM +0000, Matthew Auld wrote:
> On Xe2 compression is handled via PAT indexes and flat CCS, even on
> igpu. Ensure the device has flat CCS support on such hardware, to
> determine if these tests are valid.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_ccs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 7d0e8ed7a..88f812c91 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -653,6 +653,8 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>  	igt_fixture {
>  		xe = drm_open_driver(DRIVER_XE);
>  		igt_require(blt_has_block_copy(xe));
> +		if (AT_LEAST_GEN(xe, 20))
> +			igt_require(HAS_FLATCCS(xe));

We have block-copy-uncompressed which doesn't require flatccs.
I included this in xe_ccs.c to avoid duplicating the test code.
Shouldn't above check be in compressed subtests?

--
Zbigniew

>  
>  		xe_device_get(xe);
>  
> -- 
> 2.43.0
> 
