Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F5CD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 18:27:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A3D10E8E7;
	Wed, 27 May 2026 18:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AndcOIZI";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF1110E8E6
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJ2iwitJdaqp03uCkr2u3z1Wjw6OhCsmIKiwB1Go2/0=; b=AndcOIZI4HtWdIYjQC2Ucmp/Fz
 bY9J2S0IvT2pocIjZbaFu0sY/RiGh9+wzUwsV/Y/i6vl9c6+gni2mlecJ+gn8PPNToWas25pFkH10
 r4CU5Udeo5iYw94U6HxHKWJDWrOFjf/cfxLtd0mWQVT8HuFM++9pwQm7RANLzi8459Ir2dlp7cFNR
 c9uU8tmULhzijPLJ+tGwngWz/8FgCiarwedOzDw7kSZXsrQXSinthJGzGFIGIVZa12Q8zlSPB6sa/
 +IHnhYnNjHz+CAd8J8lAkJ2uhFhMBNZ/mtX8ybewMpKznLwxQXHPIvkftMSsLgVZ9mxQ3YkJ8xuYd
 X7l/RGiA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wSIyT-0091qp-G3; Wed, 27 May 2026 20:27:25 +0200
Message-ID: <49ecba32-7389-44c4-a27b-559a1bd59cdf@Igalia.com>
Date: Wed, 27 May 2026 11:27:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Fix for closing incorrect file handles
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260525183932.3139043-1-John.Harrison@Igalia.com>
 <20260526093113.ggux52ik7ve6rcnx@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260526093113.ggux52ik7ve6rcnx@kamilkon-DESK.igk.intel.com>
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

On 5/26/26 02:31, Kamil Konieczny wrote:
> Hi John,
> On 2026-05-25 at 11:39:32 -0700, John Harrison wrote:
>> The writeback fence fd was only set to an invalid value if writeback
>> was actually enabled. However, the cleanup code would close the handle
>> if it was valid. As the uninitialised value is zero and zero is a
>> valid handle, that meant that stdin was closed at cleanup!
>>
>> Generally not a problem if clean up only happens at test exit. But if
>> a test wanted to close and re-open the driver, then closing random
>> file handles could lead to problems.
>>
>> So make sure the handle is always invalid irrespective of the use of
>> writeback.
>>
> +cc Karthik and Swati as this is KMS code
>
>> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
>> ---
>>   lib/igt_kms.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index e20307923..0f1ce03a9 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -2764,10 +2764,9 @@ static void igt_output_reset(igt_output_t *output)
>>   
>>   	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID))
>>   		igt_output_set_prop_value(output, IGT_CONNECTOR_WRITEBACK_FB_ID, 0);
>> -	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR)) {
>> +	if (igt_output_has_prop(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR))
>>   		igt_output_clear_prop_changed(output, IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR);
>> -		output->writeback_out_fence_fd = -1;
>> -	}
>> +	output->writeback_out_fence_fd = -1;
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
> PS. style looks strange, useally there should be a newline after if block.
Yeah, that entire block is pretty dense. Not sure if that was 
intentional and wanted. All I changed was to pull the fd assignment 
outside of the if. I figured I would leave the style choice as is. I can 
send a follow up patch to add a bunch of blank lines if you want.

John.

>
>>   	if (igt_output_has_prop(output, IGT_CONNECTOR_DITHERING_MODE))
>>   		igt_output_set_prop_enum(output, IGT_CONNECTOR_DITHERING_MODE,
>>   					 "off");
>> -- 
>> 2.43.0
>>

