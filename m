Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB131C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 15:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621D410E82C;
	Thu, 18 Jan 2024 15:02:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8F410E840
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705590141; x=1737126141;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fge0BDg1nksyBrknD00+AMaIhvjOu8RFQwmnML2e4eQ=;
 b=X6Bv0+EpSHLEctJ7o2ZDEmbC6fLWTkxBLyleenUzXHOouU3+nLd1dwf5
 tuowUiLXDY5hMDU2m62Im3ovqsd/h0xBoHarIPT7UQwqCjEx+XXFDu05y
 RF/S1QekNGIO+tZ+CCyYQ69vjvDiu0yweYYsGFMeb1sQSnt0hFbeFwBBO
 Fx5TaZl+zg5ET3cB8V/dxQLW7ZN0AYPLSX7kL+cw09Yc+DkY57USSCsfc
 JxEWcuH/i/j5E0/4Ng6cj4yytyRQ+RMFcDwWkYw79qACYsylGvFg+J43n
 081TUeKrA6mbkmdOg3VSHDpawsJZzy5FhFA7CB5fk9Kb3naImWfJmTZkt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399342726"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="399342726"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 07:02:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="19124066"
Received: from swatish2-mobl2.gar.corp.intel.com (HELO [10.213.81.131])
 ([10.213.81.131])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 07:02:16 -0800
Message-ID: <532b8bad-c164-4412-b0cb-8d9705fb7f02@intel.com>
Date: Thu, 18 Jan 2024 20:32:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: fix pixel format functionality
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240117081416.234172-1-swati2.sharma@intel.com>
 <20240118094529.7gdevtv7tuvi2pzq@kamilkon-desk.igk.intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20240118094529.7gdevtv7tuvi2pzq@kamilkon-desk.igk.intel.com>
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

On 18-Jan-24 3:15 PM, Kamil Konieczny wrote:
> Hi Swati,
> On 2024-01-17 at 13:44:16 +0530, Swati Sharma wrote:
> 
> in subject add "doc", like:
> 
> [PATCH i-g-t] tests/kms: fix doc pixel format functionality
> ---------------------------- ^^^ added
> 
>> Pixel format functionality is used in different ways. Align all.
> 
> Better:
> In tests documentation, pixel format ...
> 
> with that:
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Regards,
> Kamil

Thanks Kamil! Will fix while merging.

> 
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_psr2_su.c  | 2 +-
>>   tests/kms_pipe_crc_basic.c | 2 +-
>>   tests/kms_plane.c          | 4 ++--
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
>> index 96b4fd2b4..936b5beb3 100644
>> --- a/tests/intel/kms_psr2_su.c
>> +++ b/tests/intel/kms_psr2_su.c
>> @@ -47,7 +47,7 @@
>>    *
>>    * SUBTEST: page_flip-%s
>>    * Description: Test the selective update with %arg[1] when screen changes
>> - * Functionality: pixel-format, psr2, selective_update
>> + * Functionality: pixel_formats, psr2, selective_update
>>    *
>>    * arg[1]:
>>    *
>> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
>> index 3c12d8098..0c19745bc 100644
>> --- a/tests/kms_pipe_crc_basic.c
>> +++ b/tests/kms_pipe_crc_basic.c
>> @@ -68,7 +68,7 @@
>>   /**
>>    * SUBTEST: compare-crc-sanitycheck-%s
>>    * Description: Basic sanity check for CRC mismatches with %arg[1]
>> - * Functionality: crc, pixel_format
>> + * Functionality: crc, pixel_formats
>>    *
>>    * arg[1]:
>>    *
>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>> index 51ca082ae..406aecc04 100644
>> --- a/tests/kms_plane.c
>> +++ b/tests/kms_plane.c
>> @@ -44,7 +44,7 @@
>>   /**
>>    * SUBTEST: planar-pixel-format-settings
>>    * Description: verify planar settings for pixel format are handled correctly
>> - * Functionality: pixel_format, plane
>> + * Functionality: pixel_formats, plane
>>    *
>>    * SUBTEST: plane-position-%s
>>    * Description: Verify plane position using two planes to create a %arg[1]
>> @@ -80,7 +80,7 @@
>>   /**
>>    * SUBTEST: pixel-%s
>>    * Description: verify the pixel formats for given plane and pipe
>> - * Functionality: pixel_format, plane
>> + * Functionality: pixel_formats, plane
>>    *
>>    * arg[1]:
>>    *
>> -- 
>> 2.25.1
>>
