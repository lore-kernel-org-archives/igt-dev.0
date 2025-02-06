Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E399DC02194
	for <igt-dev@archiver.kernel.org>; Thu,  6 Feb 2025 16:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8909010E846;
	Thu,  6 Feb 2025 16:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7WAhbpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C329E10E303
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2025 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738857790; x=1770393790;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Nk+iG+QK964QV/J0SMLj1jgv6q2waQLKC2ExYQPcFko=;
 b=W7WAhbpzbFok+vdZKr/u4xQEjxOo993qnNEtLicMTp6t9NfZ7FqQGfoI
 jZ/T3wr903cqNgsDJJgE0QIX7lorGqZYK/f4aAl+pVlg4njQtTyTb0aEY
 rE71u2wCWwCGcET3783PDFsPNpaHKqol1FTpp7jMaxTyUu/liIiSHtHf1
 UtnLEk5UWnRohW+hoCvJ8aRfOvBaLFcC6Yr3xEHh/KdxiDeGBlJxaEg92
 qimP4OwHgVmyE83VmZ6fYrYzHAhY+YmZU2CfccKvuN2B6rdbCYXeOpY2K
 9t3lesBUOoGggQxm4UAcv09m3wl3a3xqNhcOSLiks8uUFA4oFPa83X2t9 A==;
X-CSE-ConnectionGUID: tQPQvj59RZ2Ml74zSMmVGQ==
X-CSE-MsgGUID: eafn3lbzTjq3Unv0ieh4lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43391271"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="43391271"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 08:03:09 -0800
X-CSE-ConnectionGUID: 6vp17ftiQ+6wUsPp1xdIbQ==
X-CSE-MsgGUID: NQO9DTE4QzyhTTWxPdwOtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116439692"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO [10.245.246.58])
 ([10.245.246.58])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 08:03:07 -0800
Message-ID: <61d7e949-1c9e-43cc-aa18-c379c55a0d67@intel.com>
Date: Thu, 6 Feb 2025 17:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_eudebug_online: Ignore stale attention
 events during single-step
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com
References: <20250206131455.612021-1-dominik.grzegorzek@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250206131455.612021-1-dominik.grzegorzek@intel.com>
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

Hi Dominik,

On 6.02.2025 14:14, Dominik Grzegorzek wrote:
> Signle step testcases are not filtering stale attention events in
> resume trigger, as a result those expect fixed number of attention
> events to come. If for some reason attention wasn't handeled before the
> next one came test would fail. Filter out all atentions with seqno
> lower than last eu control call.
> 
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
>   tests/intel/xe_eudebug_online.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index ecc32ee97..c98f1ef1f 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -694,6 +694,9 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   
>   	get_aips_offset_table(data, threads);
>   
> +	if (data->last_eu_control_seqno > att->base.seqno)
> +		return;
> +
>   	if (d->flags & TRIGGER_RESUME_PARALLEL_WALK) {
>   		if (data->stepped_threads_count != -1)
>   			if (data->steps_done < SINGLE_STEP_COUNT) {
> @@ -766,9 +769,9 @@ static void eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>   			     data->target_offset + steering_offset(threads)), sz);
>   	fsync(data->vm_fd);
>   
> -	eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> -		      att->exec_queue_handle, att->lrc_handle,
> -		      att->bitmask, att->bitmask_size);
> +	data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, att->client_handle,
> +						    att->exec_queue_handle, att->lrc_handle,
> +						    att->bitmask, att->bitmask_size);
>   
>   	if (data->single_step_bitmask)
>   		for (int i = 0; i < att->bitmask_size; i++)
