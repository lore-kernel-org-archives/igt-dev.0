Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD569C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 12:28:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5551110F9CA;
	Wed, 31 Jan 2024 12:28:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E010F9C8
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 12:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706704114; x=1738240114;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PQQDBVoanzk4jdFhCwl7VWH40HTFoJE3VeDDckdy39o=;
 b=IzJS1k4lSNQQtzxNT5ZnNh+OeH70CNZiWyRqDR92yRkgeIX4AOR3NpwT
 dYBHPLx7wmMOWJQv8MfRyjnqEST4cxl+kbXE7RwWNGRsqn93cJdY/I1kz
 DcBdlOK3WyfcG/3lVBOIU19PeVtiv3uLyY2qmbA8tgnGBrHZhj12SEm8O
 eEUjgzuzstwbIYPLX3BfSOrY7LsHZ89zRB3367OiZIyZSEDTKbrMYC8Z9
 n50FmuKKmw9aeAQnPndr5jy0BwE8VyDJcj3OcpQBj/eOxpUcNISQTMIdG
 9GGwzf8XqHiLpkXjp0Uq+0RYmmkWHPGpPN2V/J0+WQ1ivaB+qZjXI6ES4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3425040"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3425040"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="30481767"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO [10.252.19.208])
 ([10.252.19.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:28:32 -0800
Message-ID: <ad54fad7-ccc1-4902-a49c-aa0e69f6e22f@intel.com>
Date: Wed, 31 Jan 2024 12:28:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240131114305.202871-1-matthew.auld@intel.com>
 <20240131114305.202871-2-matthew.auld@intel.com>
 <20240131122106.4qqf727lanaawtid@zkempczy-mobl2>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240131122106.4qqf727lanaawtid@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 31/01/2024 12:21, Zbigniew Kempczyński wrote:
> On Wed, Jan 31, 2024 at 11:43:04AM +0000, Matthew Auld wrote:
>> On Xe2 compression is handled via PAT indexes and flat CCS, even on
>> igpu. Ensure the device has flat CCS support on such hardware, to
>> determine if these tests are valid.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   tests/intel/xe_ccs.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index 7d0e8ed7a..88f812c91 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -653,6 +653,8 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
>>   	igt_fixture {
>>   		xe = drm_open_driver(DRIVER_XE);
>>   		igt_require(blt_has_block_copy(xe));
>> +		if (AT_LEAST_GEN(xe, 20))
>> +			igt_require(HAS_FLATCCS(xe));
> 
> We have block-copy-uncompressed which doesn't require flatccs.
> I included this in xe_ccs.c to avoid duplicating the test code.
> Shouldn't above check be in compressed subtests?

Yes, I think that makes sense. I didn't look closely enough here.

> 
> --
> Zbigniew
> 
>>   
>>   		xe_device_get(xe);
>>   
>> -- 
>> 2.43.0
>>
