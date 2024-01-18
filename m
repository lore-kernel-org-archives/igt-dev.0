Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396F6C47077
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 07:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FCC10E12F;
	Thu, 18 Jan 2024 07:33:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D94010E12F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705563219; x=1737099219;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ot9GuvDj3lCsRRk+1gaTAJDi+cXILufUgsoI8A9THeo=;
 b=dDKBum5GPU44GwG7lRjKRNdGCBv8Z+VhFM3Dj7BVvFgxcwXK8gEzSTPi
 8QUZpj61zV9F+y8gD+O+B2NJcZyxaS3AYyK3FoB/EVOIKf0TfPTwrVs2y
 IYJrRk6J4a2+8lcEy5HTBgWcjK2W8188xIaGITbgO3RuDBdhw7oBw1Q7X
 d7PwFvBABsKKvS/2GDVB5WB5MrlJiBEo9fhaXhtnmOGXLepse5Rjs6vZB
 5ZUS0o9le8sRQCtlxk7J5zDRze4Ol6GNgWR3j5IVyZ+p25CVJExi1biDk
 lPfqGaLXeQyJ32c4uyueMGvpBBSimwPrkUG81V5EwXgDZtZx0ywDEXLMx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13723398"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="13723398"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 23:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="1031570277"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="1031570277"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.81.131])
 ([10.213.81.131])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 23:33:36 -0800
Message-ID: <8b95126f-210a-459a-910c-17b8a6bc3dea@intel.com>
Date: Thu, 18 Jan 2024 13:03:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Add LIC Type 1
 scenario
Content-Language: en-US
To: Suraj Kandpal <suraj.kandpal@intel.com>, igt-dev@lists.freedesktop.org
References: <20240116112335.353869-1-suraj.kandpal@intel.com>
 <20240118072721.458334-1-suraj.kandpal@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240118072721.458334-1-suraj.kandpal@intel.com>
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 18-Jan-24 12:57 PM, Suraj Kandpal wrote:
> Currently LIC is done only for type0 content this patch
> adds LIC for type1 content too.
> 
> --v2
> -Use arg[1] [Swati]
> -Mention Functionality [Swati]
> 
> --v3
> -Move back to prev version of comment as type 0 and type 1
> dont have the same functionality [Swati]
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tests/kms_content_protection.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 6d472ee02..3fc575634 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -43,8 +43,13 @@
>   #include "igt_kmod.h"
>   
>   /**
> - * SUBTEST: lic
> - * Description: Test for the integrity of link.
> + * SUBTEST: lic-type-0
> + * Description: Test for the integrity of link for type-0 content.
> + * Functionality: hdcp1.4, hdcp2.2
> + *
> + * SUBTEST: lic-type-1
> + * Description: Test for the integrity of link for type-1 content.
> + * Functionality: hdcp2.2
>    *
>    * SUBTEST: content-type-change
>    * Description: Test the content type change when the content protection already
> @@ -783,11 +788,16 @@ static const struct {
>   	  .cp_tests = CP_DPMS,
>   	  .content_type = HDCP_CONTENT_TYPE_0
>   	},
> -	{ .desc = "Test for the integrity of link.",
> -	  .name = "lic",
> +	{ .desc = "Test for the integrity of link with type 0 content.",
> +	  .name = "lic-type-0",
>   	  .cp_tests = CP_LIC,
>   	  .content_type = HDCP_CONTENT_TYPE_0,
>   	},
> +	{ .desc = "Test for the integrity of link with type 1 content",
> +	  .name = "lic-type-1",
> +	  .cp_tests = CP_LIC,
> +	  .content_type = HDCP_CONTENT_TYPE_1,
> +	},
>   	{ .desc = "Test content protection with content type 1 "
>   		  "that can be handled only through HDCP2.2.",
>   	  .name = "type1",
