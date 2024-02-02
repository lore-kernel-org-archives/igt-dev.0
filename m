Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B505C48291
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 09:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76E410E2E8;
	Fri,  2 Feb 2024 09:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfOzFNPc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA5E10E2E8
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706867311; x=1738403311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DYoUxDWYnGv6htr2Jw7482+OZpZNdoIPnN9JMqigKhY=;
 b=XfOzFNPcIhrJagdw47pPHruHLZO05xVs+g+ZJMnVuWM7dVamJ3awsMxI
 S9FqyQtbNNLHjqnHmZGVDZnXWwu100BADeoBlM0h8zAz2GwfQA05greqv
 0wbAwv5CAHYwWST2Bgu2qvtCvoOHrBAhD54NqLJHQXELWW/yRoFRnReql
 r+JVlwEVgheKxv6euPRLDBY0sJGdPLvNijHE/ZBLpivPyr8cGbFzolmuZ
 L5AOf1Ih8BekiRr1SsMEkWxMLQ5jWRZaq8FNRLm5DbavA5WSw3uEwGVTw
 6YGgTuKbTCvbOOCVN1+derg6WjT3+MiYDS973ucFCGfWGhdlXpadhfzgz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435266143"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="435266143"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 01:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="37392"
Received: from jatroszk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.112.148])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 01:48:29 -0800
Date: Fri, 2 Feb 2024 10:48:26 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Message-ID: <20240202094826.u5bs3hlqk4wqq4ce@zkempczy-mobl2>
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
> +
>  	if (config->compression && !blt_block_copy_supports_compression(xe))
>  		return;
>  
> -- 
> 2.43.0
> 

Anyway, regardless my doubts:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
