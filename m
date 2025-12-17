Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBA4D65528
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 10:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6CE10E5B7;
	Wed, 17 Dec 2025 10:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="B58+UwrE";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C0C10E5B7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 10:07:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so16064115e9.3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1765966057; x=1766570857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r1rLkXFYtAVAI1xvZNNfuuYmVv3AH5zXauaYyLTJgJo=;
 b=B58+UwrEceMzbS6mgBK+X4Gm72NT+2PkXJYtjlDwmiEBKIEgTr1CPr/pdvshZGdweV
 ezn9KNVe4ffzoIlUniVAHmfcAvH2lWMp1a3CyyJc49Ydr7FmofGj4+ujlMRJGsYGNZw2
 31YtccQTI61K7mErsYy0xOh/2SvTzu/+52vLfMs3OgJAR8a7HJdZuCHJil2dUDTLYOjs
 bKwonEbw0e76FC20x/QxsVoIPaGJnLrZAlTc7VlA6nor1HHfQ+xhAPbEPZTuFkcWXuKe
 JFGIcXmQZ3pCJluKt1zPxKAicWw09ISM0fffCMc+l58qOYTg4l3LDB0ELmTGPtBsI84P
 CAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765966057; x=1766570857;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1rLkXFYtAVAI1xvZNNfuuYmVv3AH5zXauaYyLTJgJo=;
 b=rlwVjwHnxnQ8i5SXP0KZm20u7CRIphbRcEE+taUyyHyLwE+mbyr1IGkGRmqgd4oM/7
 UvDExkubyMty4BHANDCtPkdQWWT9PHQUZPaTcr47znGF4p2mWxoU+MOMGFMiwiil6OHd
 VInP0ZzGqEyWKDRh2f92wzmZUSyfprFy2EYEohYtbQbIbMe5sxSdJRC/GJj9dBbIv0p2
 V8RtlJhLf4v7jZ/x7kX4zXLlYvQQqxC6jJRmgtxQvV+VImheTxXSnRlqysPjVg8C/9wV
 kMIK9ps1X6whG3sqd/Jer6KpBx28jn8lovYaNjEJ3fM7jp1Q9W7L3bPB5qYCoocTbbz/
 AYMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZDqdcZ/5LwMWPlXcIaQdWwR3I9MR1xUBq5XnCST6YewZ6SalkMqHSuynGDSkyXLo3pZKSQ4Vz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxG3RnkyL1DMST+da4E6Jd/G8J1hRRmIUJxyj4pHIfqI19PuHwm
 DbtMBGOyf0A66HDGU6YwqVYayqx7ik13BZ0gBgzoL0GmH+kNWhuh5g9Z0l2BUNKebHSFdAR5Qmq
 SGjw6JvU=
X-Gm-Gg: AY/fxX74OmBaY8Eq7zd5qIkazvNsFl7LAcaO8cJoPAyLV3tUMjPwol4sd6kiB0+mbr2
 S9JDb9UEjAP5b5sBTvn3vno/8x4+rVlyF9uRwOHpoBetrzHaACU2lyP+tq66OdDCbyTDCczLyS9
 yCEAasliQ/bPlrL5vfwJ7NafLehvg7LvOR45eLBdhhOGqKzElC9vdmTmYSwXs25ZsjLLSNAnd5d
 20P/8cn9AUyS/e1IimnRRUikBv1kkX6BC2h7JJYukVohN+jV2yqqAEM5V6XagzpLTy8HLpRrt2C
 ZTyycEImApaF3EKA6Ptg/KSvRS9aUWzV1+FVUfbUYYaxIftkGHi+peE1LasQIDhHe6ME0rfVbT3
 u1u0Iqn2tRj+SDvoNZhtw6zfhvUjVOXxrfgizaYD59Kv5+JK30jz/MnNn6zcyExgBU/bOMGWf4Q
 Xps68bvip4UY8UVbszYrrrV3CZkHV2nO1O
X-Google-Smtp-Source: AGHT+IEz06kXcj6+95llyE21eiSgM6nnSwWd51dM8aYvihWg/qyhU/DgYXf7pGj23u8k/gGF077AJQ==
X-Received: by 2002:a05:600c:608d:b0:477:632a:fd67 with SMTP id
 5b1f17b1804b1-47a8f8c16bfmr194888895e9.12.1765966056622; 
 Wed, 17 Dec 2025 02:07:36 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd8f8b138sm30089005e9.1.2025.12.17.02.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 02:07:36 -0800 (PST)
Message-ID: <ae73f964-90b1-4b46-8e4b-f4bf6ce69abd@ursulin.net>
Date: Wed, 17 Dec 2025 10:07:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/intel_gpu_top: prevent losing original
 pointer on realloc failure
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com
References: <dda88be9f499aec000d32ea52b4baf18751d9de5.1765809053.git.sebastian.brzezinka@intel.com>
 <257cafe7-a9ff-47d1-a862-488305b169a5@ursulin.net>
 <DF0AUA96GTSN.1UWEVS3F6M94I@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <DF0AUA96GTSN.1UWEVS3F6M94I@intel.com>
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


On 17/12/2025 07:05, Sebastian Brzezinka wrote:
> Hi Tvrtko
> On Tue Dec 16, 2025 at 8:02 PM CET, Tvrtko Ursulin wrote:
>>
>> On 15/12/2025 14:45, Sebastian Brzezinka wrote:
>>> Previously, realloc was called directly on engines after incrementing
>>> num_engines. If realloc failed, it would return NULL and overwrite the
>>> original pointer, causing a memory leak and leaving engines inaccessible.
>>> This patch uses a temporary pointer for realloc and only updates engines
>>> after a successful allocation, ensuring the original pointer is preserved
>>> on failure and preventing data loss.
>>
>> I don't see a memory leak, or any other problem really. If realloc fails
>> the flow is this:
>>
>> static struct engines *discover_engines(char *device)
>> {
>> ...
>> 		engines = realloc(engines, sizeof(struct engines) +
>> 				  engines->num_engines * sizeof(struct engine));
>> 		if (!engines) {
>> 			ret = errno;
>> 			break;
>> 		}
>> ...
>> 	if (ret) {
>> 		errno = ret;
>> 		goto err;
>> 	}
>> ...
>> 	return NULL;
>>
>>
>> <back to main>
>>
>> 	engines = discover_engines(pmu_device);
>> 	if (!engines) {
>> 		fprintf(stderr,
>> 			"Failed to detect engines! (%s)\n(Kernel 4.16 or newer is required
>> for i915 PMU support.)\n",
>> 			strerror(errno));
>> 		ret = EXIT_FAILURE;
>> 		goto err_engines;
>> 	}
>>
>> So tools exits with an error message. Maybe I am blind but, again, I
>> don't see a problem?
> 
> When realloc fails, it returns NULL. If we assign that NULL value directly to the
> original pointer, we lose the only reference to the previously allocated memory.
> Since that memory is no longer accessible and cannot be freed, it effectively
> becomes a memory leak for the remainder of the program’s execution. The operating
> system will reclaim the memory when the program exits, but during the program’s
> lifetime, the leak still exists. After the failure, execution jumps to err_engines,
> which skips the cleanup normally performed by free_engines(engines)

I mean your patch is not harmful, but the program will exit when 
discover_engines() fails, so the "memory leak for the remainder of the 
program’s execution", it will be a very short remainder indeed. Hence it 
is not a memory leak I would have concerned myself, while the commit 
message makes it sound like it is fixing something serious talking about 
memory leak and data loss. Just that.

Regards,

Tvrtko

