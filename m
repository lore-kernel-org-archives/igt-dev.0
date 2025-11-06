Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEB4CCFA03
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 12:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB8110E8A5;
	Thu,  6 Nov 2025 12:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1KO02M+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95AAD10E141
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 12:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762430878; x=1793966878;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gMIQTuVL6EIvQlOUkvugdOOi570yxtWNLDNCb+4/M5Q=;
 b=Q1KO02M+3V7jdDtHDwDr5nEm0eZh+8/eHeiDafafJbsqSUKTJK3zHos5
 /x6itrSG7lb0qRrhJS2sRWApSjeYoIL4TuNdZFJw/OdWkJjlGUQ8C+XyZ
 H31GJ8jXUUk1WRDzNndzvmBYrpuTQvbPDgp/teqAmVXgVkpbk73jQHRSi
 xDwYJSrhVib7df3wOaZhnRIlUVgnQfDn55hBFhN5xBn8lRMkXy6MxbXq9
 0H3jFufWUbU9FpYK3rdnHuuqxAWpP3y3AJKbRWtl6Mp4NPK3mnoLlv3Ho
 h44rbEDvyfIPSaqEcH/Xiy0e92kEQegkw39w/9dRJnIyRUuLD418BGvuP Q==;
X-CSE-ConnectionGUID: IsuevULlRyCiPclE43ymuw==
X-CSE-MsgGUID: lElFY3C/RUyMS3Q6Z573vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68214446"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="68214446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:07:58 -0800
X-CSE-ConnectionGUID: a23XLWDvRfCgt17h5X+3cA==
X-CSE-MsgGUID: YUd8PJGgS+CFVZhVsHYqcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187686335"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.194])
 ([10.245.244.194])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 04:07:57 -0800
Message-ID: <0ca80e1f-0be0-453f-920b-a8c761dfea2b@intel.com>
Date: Thu, 6 Nov 2025 12:07:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20251105115132.97222-3-matthew.auld@intel.com>
 <c8f29191129ffc8349a68abd69851f6fad38e719.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <c8f29191129ffc8349a68abd69851f6fad38e719.camel@linux.intel.com>
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

On 06/11/2025 11:41, Thomas Hellström wrote:
> On Wed, 2025-11-05 at 11:51 +0000, Matthew Auld wrote:
>> We want to be able to intercept the error, if there is one, instead
>> of
>> always asserting a non-zero error. Add a version of
>> prime_fd_to_handle()
>> which allows the caller to handle the error.
>>
>> v2:
>>    - Ensure we use errno.
>> v3 (Kamil & Sanjay):
>>    - Some spelling fixes
>>    - s/i915//
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> 
> Does it make sense to have prime_fd_to_handle() use this now?

Yes, good idea.

> 
> Either way,
> 
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Many thanks.

> 
>> ---
>>   lib/ioctl_wrappers.c | 27 +++++++++++++++++++++++++++
>>   lib/ioctl_wrappers.h |  1 +
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
>> index 176cbdacc..284a502e5 100644
>> --- a/lib/ioctl_wrappers.c
>> +++ b/lib/ioctl_wrappers.c
>> @@ -1139,6 +1139,33 @@ int prime_handle_to_fd_for_mmap(int fd,
>> uint32_t handle)
>>   	return args.fd;
>>   }
>>   
>> +/**
>> + * __prime_fd_to_handle:
>> + * @fd: open drm file descriptor
>> + * @dma_buf_fd: dma-buf fd handle
>> + * @handle: output handle
>> + *
>> + * This wraps the PRIME_FD_TO_HANDLE ioctl, which is used to import
>> a dma-buf
>> + * file-descriptor into a gem buffer object.
>> + *
>> + * Returns: Zero on success, error code otherwise
>> + */
>> +int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle)
>> +{
>> +	struct drm_prime_handle args;
>> +
>> +	memset(&args, 0, sizeof(args));
>> +	args.fd = dma_buf_fd;
>> +	args.flags = 0;
>> +	args.handle = 0;
>> +
>> +	if (igt_ioctl(fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &args))
>> +		return -errno;
>> +
>> +	*handle = args.handle;
>> +	return 0;
>> +}
>> +
>>   /**
>>    * prime_fd_to_handle:
>>    * @fd: open i915 drm file descriptor
>> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
>> index 7cf05e626..5a899f052 100644
>> --- a/lib/ioctl_wrappers.h
>> +++ b/lib/ioctl_wrappers.h
>> @@ -138,6 +138,7 @@ int prime_handle_to_fd(int fd, uint32_t handle);
>>   #endif
>>   int prime_handle_to_fd_for_mmap(int fd, uint32_t handle);
>>   uint32_t prime_fd_to_handle(int fd, int dma_buf_fd);
>> +int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle);
>>   off_t prime_get_size(int dma_buf_fd);
>>   void prime_sync_start(int dma_buf_fd, bool write);
>>   void prime_sync_end(int dma_buf_fd, bool write);
> 

