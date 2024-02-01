Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C7C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 21:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5210E481;
	Thu,  1 Feb 2024 21:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgtN2nuU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E1310E6C5
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 21:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706822087; x=1738358087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dEAI3fMZvsF8s03i1aC27AqzL/dy0PvACSR8OwHD7Rs=;
 b=dgtN2nuUjGaZZjcjgzFYDej0c8uYxeecwkqEn/81lErR4IHGMM5I3/ME
 XE0f9zXb1u1och3Sp3xpIsJ8ApdI9K3IPTXafswSzRckuhf7VbybeSxum
 AGfu6HbUp+z3BC1UnxK9/V/es3ZvD1w6IB/oI+3WbGf8ZS3m3U1qMQzMp
 WniM97edoziIE1+9wlbK/1qWX6Tc69QC5WQzuuUKX2Zx3SyADmCaRu+Y1
 rjD1wknYLPNp4nzygiE3kbfGA3MR5x/5Nsb4X/8AexQyrXJgeaG6JxITH
 7pymGNf4Mtqh6GGYNpMCUhPsZ6X7NDBB1PS1EbtG38JxdPjtUANT030SS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="401133306"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="401133306"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 13:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="789050579"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="789050579"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 13:14:44 -0800
Date: Thu, 1 Feb 2024 22:14:41 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Message-ID: <20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2>
References: <20240201103017.321466-1-matthew.auld@intel.com>
 <20240201103017.321466-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240201103017.321466-2-matthew.auld@intel.com>
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

On Thu, Feb 01, 2024 at 10:30:16AM +0000, Matthew Auld wrote:
> On Xe2 compression is handled via PAT indexes and flat CCS, even on
> igpu. Ensure the device has flat CCS support on such hardware, to
> determine if these tests are valid.
> 
> v2: (Zbigniew)
>  - There is at least one uncompressed test also, which is valid
>    regardless of CCS. Move the skip deeper.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_ccs.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 7d0e8ed7a..3430db2d2 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -532,6 +532,7 @@ static void block_copy_test(int xe,
>  			    struct igt_collection *set,
>  			    enum copy_func copy_function)
>  {
> +	uint16_t dev_id = intel_get_drm_devid(xe);
>  	struct drm_xe_engine_class_instance inst = {
>  		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>  	};
> @@ -540,6 +541,9 @@ static void block_copy_test(int xe,
>  	uint32_t vm, exec_queue;
>  	int tiling;
>  
> +	if (AT_LEAST_GEN(dev_id, 20) && config->compression)
> +		igt_require(HAS_FLATCCS(xe));

Just to make sure - above will lead to skip on xe2 if there's
no flatccs.

> +
>  	if (config->compression && !blt_block_copy_supports_compression(xe))
>  		return;

This will check compression either, but indirectly via .cmds_info
set to xe2_cmds_info in which we use BLT_CMD_SUPPORTS_COMPRESSION
flag for block-copy command.

Do we have any Xe2 without compression on block-copy?

--
Zbigniew

>  
> -- 
> 2.43.0
> 
