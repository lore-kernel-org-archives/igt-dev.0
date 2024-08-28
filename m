Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F24C5B548
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 14:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5CE10E54D;
	Wed, 28 Aug 2024 14:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOOZTZYw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0910E54D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724856702; x=1756392702;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FXa3POwVREXPeZo5whIcMlOmX2depsFD8FluzqCzYjg=;
 b=cOOZTZYwrewxxoQ3YEbql/pMBAMz5O9glp38n+63ZtxREU5lSFQqwP8l
 krQTGvATWnrNVVEIh9e9rtSPXsRZJIpFG7SP+8IbVqC6ZsE0qVco0No68
 ZsKWz6QFo0zl0MVHFZKcRnwAlK6uEAgRyVw41Vbs7evCLNc9JOmDuIuwF
 ObDfYep9CYi6PaZlebknqvy0WRty4sJ8qfPkRi95IomvoGe4wiX1zMupV
 KZ3ZeO4laR2CrS2Z3IJ8ZMjJBdBnzp6xca0BSL1xqxArD4Ycqb8dtNOVV
 3pzvm6uFotPpi3eE5zVjcArg+rByMrDtWKdX2a/c5keTN117Uxbtqjz+r g==;
X-CSE-ConnectionGUID: M/f4Gh3YQKS77CU5rkYRYg==
X-CSE-MsgGUID: IAto7RUaQMemSccPxZTUgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33960890"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="33960890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:51:41 -0700
X-CSE-ConnectionGUID: tWOELaDDT1Sf4YV8h+GvMg==
X-CSE-MsgGUID: VN//uDf1QEqhgWIE71wfaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="63215944"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 07:51:41 -0700
Message-ID: <d0cc1caf-c711-42f7-9e74-cacdca9a2b0d@linux.intel.com>
Date: Wed, 28 Aug 2024 16:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 06/10] tests/intel/xe_drm_fdinfo: Use usec for
 batch duration
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
 <20240827165449.1706784-7-lucas.demarchi@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240827165449.1706784-7-lucas.demarchi@intel.com>
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


On 8/27/2024 6:54 PM, Lucas De Marchi wrote:
> It's only used to control the time to usleep(), so use a better unit.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 68c21925c..9fb739fba 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -73,7 +73,7 @@ struct pceu_cycles {
>   	uint64_t total_cycles;
>   };
>   
> -const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
> +const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
>   
>   static const char *engine_map[] = {
>   	"rcs",
> @@ -517,7 +517,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
>   	if (flags & TEST_ISOLATION)
>   		read_engine_cycles(new_fd, pceu1[1]);
>   
> -	usleep(batch_duration_ns / 1000);
> +	usleep(batch_duration_usec);
>   	if (flags & TEST_TRAILING_IDLE)
>   		spin_sync_end(fd, ctx);
>   
> @@ -553,7 +553,7 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
>   	}
>   
>   	read_engine_cycles(fd, pceu1);
> -	usleep(batch_duration_ns / 1000);
> +	usleep(batch_duration_usec);
>   	if (flags & TEST_TRAILING_IDLE)
>   		spin_sync_end(fd, ctx);
>   	read_engine_cycles(fd, pceu2);
> @@ -580,7 +580,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
>   	spin_sync_start(fd, ctx);
>   
>   	read_engine_cycles(fd, pceu1);
> -	usleep(batch_duration_ns / 1000);
> +	usleep(batch_duration_usec);
>   
>   	/* destroy queue before sampling again */
>   	spin_sync_end(fd, ctx);
> @@ -619,7 +619,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
>   	}
>   
>   	read_engine_cycles(fd, pceu1);
> -	usleep(batch_duration_ns / 1000);
> +	usleep(batch_duration_usec);
>   	if (flags & TEST_TRAILING_IDLE)
>   		xe_for_each_engine_class(class)
>   			spin_sync_end(fd, ctx[class]);
> @@ -663,7 +663,7 @@ all_busy_check_all(int fd, unsigned int flags)
>   	}
>   
>   	read_engine_cycles(fd, pceu1);
> -	usleep(batch_duration_ns / 1000);
> +	usleep(batch_duration_usec);
>   	if (flags & TEST_TRAILING_IDLE)
>   		xe_for_each_engine_class(class)
>   			spin_sync_end(fd, ctx[class]);
