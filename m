Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99173C369A2
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 16:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA6410E6F8;
	Tue,  8 Apr 2025 16:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="h7JEtG/2";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE11310E6F8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6GOy4WOa+Hww1xv/ByAhRHv1+XKsQuOeHQQ1eMthWI=; b=h7JEtG/2A5HUgAYscl4ZhQJ9tR
 hZMZm1EgVPIh83PtTP42rJeIRtpGyPmPvf01V8GtCtXB4ciXyCDTTyghYsq87OPTb4unEOwtl+7ai
 TuGudwPJiZnt6NNp456vpdgiEEHtPsi1ZKo2y+fP6SHRoMasKEWWCFOp8u7IceQeuAJetSDRkvZMY
 2KPcTtmUTBiXgSiRF13iTk2HdoyFua835WVByz7yH9dgvnEg/rgEdPniamvg7pKUDseCZzdHJqS5u
 IoanwCNlGEDrAkr3SOwop7JjhSmCELQh9t6ihkN43vLDWxKQjJbgmMydjXxDNuiMUBbFY6WofnW9/
 wx3E3G0A==;
Received: from [187.57.129.172] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u2BU9-00DO9W-L1; Tue, 08 Apr 2025 18:07:37 +0200
Message-ID: <c0b93100-cc37-4f24-8324-3ad4a26d0908@igalia.com>
Date: Tue, 8 Apr 2025 13:07:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] tests/kms_async_flips: Check for atomic async flip
 cap
To: Melissa Wen <mwen@igalia.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, kernel-dev@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
References: <20250408000221.140459-1-andrealmeid@igalia.com>
 <20250408000221.140459-3-andrealmeid@igalia.com>
 <j2kam7redmh5qqqbbunyuoyl235vg3bw32yoqq4azbb4mfrztw@aaepkfnv5u5f>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <j2kam7redmh5qqqbbunyuoyl235vg3bw32yoqq4azbb4mfrztw@aaepkfnv5u5f>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Em 08/04/2025 13:01, Melissa Wen escreveu:
> On 04/07, André Almeida wrote:
>> If a driver doesn't support doing an async flip through the atomic uAPI,
>> the atomic tests fails. Instead of failing, create a function that
>> checks for this capability and skip the test if is unsupported.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> Reviewed-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   tests/kms_async_flips.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 126b96d6b..fc9cbd3f1 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -209,6 +209,14 @@ static void require_monotonic_timestamp(int fd)
>>   	igt_require_f(ret, "Monotonic timestamps not supported\n");
>>   }
>>   
>> +static void require_atomic_async_cap(data_t *data)
>> +{
>> +	int ret = igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP);
>> +
>> +	igt_assert(ret >= 0);
>> +	igt_require_f(ret, "Atomic async flip not supported\n");
> 
> Hmmm.. I don't think we want an assert here. Otherwise, the test aborts
> instead of skipping if the cap wasn't introduced yet in a target kernel
> version.
> 
> drm_get_cap return -EINVAL if this capability doesn't exist in a kernel
> version and zero if it exists but isn't supported by the specific
> driver. Perhaps two igt_require_f makes sense, as below?
> 
> +	igt_require_f(ret > 0, "Atomic async flip cap doesn't exist in
> this kernel\n");

Maybe should be like this:

igt_require_f(ret >= 0, "Atomic async flip cap doesn't exist in this 
kernel; or bad fd\n");

> +	igt_require_f(ret, "Atomic async flip not supported by this
> driver\n");
> 
> WDYT?
> 

You are right, I initially understood that drm_get_cap() would return 0 
if the CAP didn't exist but a quick look in the kernel function 
drm_getcap() shows that this is not the case. I will fix that.

