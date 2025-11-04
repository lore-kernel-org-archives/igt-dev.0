Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F95ECCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 12:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E6C10E3FA;
	Tue,  4 Nov 2025 12:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IznMPnyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FA310E3FA
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762258710; x=1793794710;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LkWVA5SaRGnlcPjuiZVQmS30+znOjIVlD9W3h+C9wi8=;
 b=IznMPnyyJuZDtR50gFnsJKA65qunr5q116dzOAPIekp4cXH1xsTN98Zf
 1E7J7EzbcEjoyfA9B/zrkfdW8cXEPHAmVmPhKKcDexZFAwKPb7DPX9Bnm
 6Cs4J8meS05g9ePScDIIbGbnzYK2IWRBEavzk861gXnFw7g0TUY6Jfl6f
 ice1ln/vt9sfANHi94Zz00FKDByAJwZCuyKa0PDbfBaCpAm5VSrpLcph+
 li021Ca0BUhC+z/v6fXSUbqKwOiRXB0fU+mDwesagqX4v075vF4zlEEnT
 fhOtE+mCD59n/N9D6RbS57IVqnQCRuww+s32u97irrZB9vKfTIV6rnLe6 Q==;
X-CSE-ConnectionGUID: J+2rnC+oSfKn6ylzvHPS8w==
X-CSE-MsgGUID: 6yCNmSTfSpGB1YhfUf2FfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63362229"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="63362229"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:18:29 -0800
X-CSE-ConnectionGUID: Gzg1L+WqSDGtREPKzD+qPQ==
X-CSE-MsgGUID: 6IYUYk/HQA69z+u/7vtpYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187094105"
Received: from cmanszew-mobl2.igk.intel.com (HELO [172.28.180.197])
 ([172.28.180.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 04:18:28 -0800
Message-ID: <2f012e43-054f-4cd8-856a-14f740b7d091@intel.com>
Date: Tue, 4 Nov 2025 13:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/7] lib/xe/xe_eudebug: Allow empty event log
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com, maciej.patelczyk@intel.com,
 jan.maslak@intel.com, zbigniew.kempczynski@intel.com
References: <20251014093848.2394531-1-mika.kuoppala@linux.intel.com>
 <20251014093848.2394531-7-mika.kuoppala@linux.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251014093848.2394531-7-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On 14.10.2025 11:38, Mika Kuoppala wrote:
> When we sort event log, we make assumptions that there are some. Remove
> these assumptions as for some tests, debugger might not get any events.
> 
> If events are expected the assertions should be held in test
> case side.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Regards,
Christoph

> ---
>   lib/xe/xe_eudebug.c | 3 +++
>   lib/xe/xe_eudebug.h | 4 ++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
> index 7ea63b22b4..68ab9dc320 100644
> --- a/lib/xe/xe_eudebug.c
> +++ b/lib/xe/xe_eudebug.c
> @@ -870,6 +870,9 @@ static void event_log_sort(struct xe_eudebug_event_log *l)
>   		events++;
>   	}
>   
> +	if (!events)
> +		return;
> +
>   	tmp = xe_eudebug_event_log_create("tmp", l->max_size);
>   
>   	for (i = first_seqno; i <= last_seqno; i++) {
> diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
> index db79726c00..2a0110fe92 100644
> --- a/lib/xe/xe_eudebug.h
> +++ b/lib/xe/xe_eudebug.h
> @@ -101,8 +101,12 @@ next_event(struct drm_xe_eudebug_event *e, struct xe_eudebug_event_log *l)
>   
>   	igt_assert(l);
>   	igt_assert(l->log);
> +	igt_assert(l->max_size);
>   	igt_assert(l->head <= l->max_size);
>   
> +	if (!l->head)
> +		return NULL;
> +
>   	if (!e)
>   		return (struct drm_xe_eudebug_event *)l->log;
>   

