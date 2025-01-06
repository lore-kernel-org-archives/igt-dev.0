Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE9DE77198
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 17:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17B710E211;
	Mon,  6 Jan 2025 17:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+UYnbgv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1CB10E211
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736184136; x=1767720136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8ySXTNS3fOshtxfGlkm5BKyLM0nzA1z18fRkZxlkHAo=;
 b=a+UYnbgvKvdB6xhT0v+jk0UWRw24cOwalndoHSaG2uYK2w5ALphH8/gc
 LRF85L5ToKustMCKySvo88ZZ2xsaxcTB5AZPgN44HSAU2a3/Ev3h8aMb6
 a2yibia2qPXLHYAdohnqSAKJPYZvVxn0bu15e/SXE4rYKyj83yjIYTpuY
 IYqimzJOYIkAwbO9Kem61esPxg893QRiq9DdBsSf8daBW2m6TQl8QuBtx
 XXM9FmCyC6Bn38VqlMwPT73JxyA17QGzfOO5xa+orM3LnFAc0odVC8ZNc
 4vefA+O0vDXCxFUtx3hWVWMWV9VeKI6PE35/vQWJHo2BqPPRjl8Gu8zWM Q==;
X-CSE-ConnectionGUID: vSX8eFaOTjOF6p/HDYN4gw==
X-CSE-MsgGUID: 7E8n+F8QSSCV1eFccIXPyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="40015937"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="40015937"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:22:15 -0800
X-CSE-ConnectionGUID: nIrERn/tSeKJ60mrOlxBzA==
X-CSE-MsgGUID: IV226U2dQcOLWWl/O/Suqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="107360231"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:22:15 -0800
Date: Mon, 6 Jan 2025 11:22:09 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Do not end cork not
 started
Message-ID: <7xrjfxnws3dsb52s5ajxmy2pr2wjmqo66f6lzkyy24htzv2fwd@att3l3srvkeo>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <CH0PR11MB5444AB1337D3B6E2DCFDFBF9E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444AB1337D3B6E2DCFDFBF9E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Mon, Jan 06, 2025 at 03:08:54PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: De Marchi, Lucas <lucas.demarchi@intel.com>
>Sent: Friday, January 3, 2025 11:16 PM
>To: igt-dev@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gurram, Pravalika <pravalika.gurram@intel.com>
>Subject: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Do not end cork not started
>>
>> If cork was not started, do not try to end it. Similar fix to commit
>> 598c268686f4 ("tests/intel/xe_drm_fdinfo: Do not destroy NULL xe_cork").
>>
>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3869
>> Fixes: 2feb1d6718a1 ("lib/xe/xe_spin: move the spinner related functions to lib")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tests/intel/xe_drm_fdinfo.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index e83c55c64..6549629b4 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -533,7 +533,9 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>>  	read_engine_cycles(fd, pceu1);
>>  	usleep(batch_duration_usec);
>>  	xe_for_each_engine_class(class)
>> -		xe_cork_sync_end(fd, ctx[class]);
>> +		if (ctx[class])
>> +			xe_cork_sync_end(fd, ctx[class]);
>> +
>
>This also needs to be applied to utilization_all_full_load.
>Also: https://patchwork.freedesktop.org/series/143066/

Awesome. Reviewed and applied your more complete version.

thanks
Lucas De Marchi

>-Jonathan Cavitt
>
>>  	read_engine_cycles(fd, pceu2);
>>
>>  	xe_for_each_engine_class(class) {
>> --
>> 2.47.0
>>
>>
