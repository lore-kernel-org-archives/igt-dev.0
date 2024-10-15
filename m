Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A742CFC273
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 07:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99CA10E0DB;
	Tue, 15 Oct 2024 07:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqloyZ8d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1347F10E0DB
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728978616; x=1760514616;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nolCtlOrtPxV1Vf+m/Thu9wGCFWofrAVtCTj57xOHII=;
 b=RqloyZ8dQBZWCgWgcYPdcgXow9Ux/YvevtxLlZfvI9SK9suNlI7x/Wpe
 2lfS/s5VDNpxdvGiLEk5YV4IRad9qyEOcEfhvpjFv7eTUclKK7D+kWtKK
 0mmWpQWh0gMXf+igp2Ny5kZN5L44PNaFlizd114mH/qkA/82b5gES2xcz
 jlIlGDGKWstisFZIP0pISwZzBnL8YHY9rr7R80PeUNQ5tIA7Lw/9zMEty
 kbhlFPHNovsRDpsWl9iT+MIiCq++vftHjYWBeXqT4dr6UwAAHm3hnxkaB
 FvCtAWBdgpfQV2WxQRZ+BT3Md+P46Xq30cGLQMVTk8bs+dF73oydpsBLH g==;
X-CSE-ConnectionGUID: 7ZwnatRvQK2sAIvzx4QAuw==
X-CSE-MsgGUID: pdHyYtA6RAKuQb8syDsoBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39730098"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="39730098"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 00:50:16 -0700
X-CSE-ConnectionGUID: S9bJenIERLKeIwlWwvhgwg==
X-CSE-MsgGUID: rwN6UqGRR8+gnnZeklBthw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="78631213"
Received: from sfineste-mobl.ger.corp.intel.com (HELO [10.245.148.92])
 ([10.245.148.92])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 00:50:13 -0700
Message-ID: <fe1eb612-2d67-408c-adad-5770a7ea8989@linux.intel.com>
Date: Tue, 15 Oct 2024 09:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_exec_reset: Explicitly declare exec
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jani.saarinen@intel.com,
 ashutosh.dixit@intel.com
References: <20241014220011.264642-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241014220011.264642-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 10/15/2024 12:00 AM, Jonathan Cavitt wrote:
> In the gt-reset-stress subtest, we define a drm_xe_exec exec without
> declaring any of its variable values.  We then define some of the struct
> values separately later in execution.  Instead of doing this, we should
> explicitly declare exec to equal a new struct with the assigned values
> initialized during construction.  This prevents any values from being
> assigned garbage data during execution.
>
> v2: Define assigned variables as a part of declaration, rather than
> separately later during exeuction. (Dixit)
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Jani Saarinen <jani.saarinen@intel.com>
> CC: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index b5d5f43eab..43ef1e3345 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -628,7 +628,10 @@ static void submit_jobs(struct gt_thread_data *t)
>  			.engine_instance = 0,
>  			.gt_id = 0,
>  		};
> -		struct drm_xe_exec exec;
> +		struct drm_xe_exec exec = {
> +			.address = addr,
> +			.num_batch_buffer = 1,
> +		};
>  		int ret;
>  
>  		/* GuC IDs can get exhausted */
> @@ -636,8 +639,6 @@ static void submit_jobs(struct gt_thread_data *t)
>  		if (ret)
>  			continue;
>  
> -		exec.address = addr;
> -		exec.num_batch_buffer = 1;
>  		xe_exec(fd, &exec);
>  		xe_exec_queue_destroy(fd, exec.exec_queue_id);
>  	}
