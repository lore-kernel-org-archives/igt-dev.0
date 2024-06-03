Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A0BC25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1897B10E2E1;
	Mon,  3 Jun 2024 07:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGYBHVLw";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B03110E2E1
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 07:31:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42138eadf64so8558765e9.3
 for <igt-dev@lists.freedesktop.org>; Mon, 03 Jun 2024 00:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717399901; x=1718004701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dq/EIuwXcgZ3e98/Wv5a90ZC3wRt5FOimIu0E3CWJcQ=;
 b=WGYBHVLwQmTLqN69HNdkoJvnMNLuVmxDepD5ik3Iv0r1/B9Joc9/PrxWCb6y2af4M0
 sJF50VCbiyPjfor8Tn/XwtceJOVbCFClXeMTy6AIzbYxdbl1a2g92dgYF55bhFxZm4aK
 TgIzAaFXq2/4qlllXRehdQ2LvhYi70YtJy02JJO8daTwjzh37I4LCpe4duExbPeangiU
 fWlqw90Aadmc3HPJq7+WQI/EAFPV8pQiIZ/qPuL/5Dx8+yYz9xmxjM1ZRhVr8YbWywrS
 p5rJbHNqAgU2KNaPWqX4Hcjk/Tu+nCVAq+/S6HcYEBuxtwjCfOYdG0OV36X6QDgWm+1u
 i4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717399901; x=1718004701;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dq/EIuwXcgZ3e98/Wv5a90ZC3wRt5FOimIu0E3CWJcQ=;
 b=gPKL77jLapRaYfXvWIxUuD/o6Is4Zc0vG07GeQS8MIixpXa/bkMhr6pdPZMkYPqjzn
 T+1ABF/6ASq7ESerCRDODDpQ/TqqUw6WpdSnQa0X7O2TEdqm/wPlYVN2EtIQjOUlVk00
 j3q//r4V/AvPX6fWDc8C9CwZUk6vGi21k7x/dh5j0YRBsA0zmgEp1MTvx1C2PMoXLx5x
 MfMXNh+/tXL8E8+B480jquyiPzgTjHc2XXR8mOYWDxdpzjDxHdgIRWjOCWoRsJl5yPYX
 r4yuclDJdSc1HPG4L2PyzBHTiFe51ZnIes1i+JHCVWqNQ9OSxNM19K4zP9BJQ99i31Lg
 cDbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOm/F9CuDZdWzZZWbuv7qNRGXvi6VyB0GE+z6LsdrTUwnRQQRBnEdnvl6JdB67UUEcSiMc9Z2esIOxsSCMiB19knjxVKiKVfWB5kEJbg==
X-Gm-Message-State: AOJu0YzHyBRWABA8AZgw3MCPCAqeoGT5cB5ijCOVlkDgh88mAGmyjhok
 2wbdhKZ7vtqUG72sbHvZMwpYHyetRhg+W4EDAww577JtZGgn+c/X
X-Google-Smtp-Source: AGHT+IHxxSfYjuSM8ql7Azhu8PHHcYy0eKZh6m6HZG61JORBJMUwKCJNb9mNZEv5qvaYDplISYiu5Q==
X-Received: by 2002:a05:600c:c06:b0:421:21d2:abf5 with SMTP id
 5b1f17b1804b1-4212e0a534dmr68995255e9.31.1717399900547; 
 Mon, 03 Jun 2024 00:31:40 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4213cd1c075sm27710155e9.0.2024.06.03.00.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 00:31:40 -0700 (PDT)
Message-ID: <f209cd97-8370-4e00-86ac-41ddcfd3bcca@gmail.com>
Date: Mon, 3 Jun 2024 10:31:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 02/12] lib/intel_bufops: Fix mapping/unmapping for
 i915 and xe
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
 <20240527073345.54729-3-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240527073345.54729-3-zbigniew.kempczynski@intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 27.5.2024 10.33, Zbigniew Kempczyński wrote:
> It looks previously there was no user of intel-buf mapping code so
> missing xe path wasn't notice. Lets add xe path along with correct
> buffer size mapping.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/intel_bufops.c | 39 ++++++++++++++++++++++++---------------
>   1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 313c2665ae..b4ccf4c093 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -1232,37 +1232,46 @@ void intel_buf_destroy(struct intel_buf *buf)
>   
>   void *intel_buf_cpu_map(struct intel_buf *buf, bool write)
>   {
> -	int i915 = buf_ops_get_fd(buf->bops);
> +	int fd = buf_ops_get_fd(buf->bops);
>   
>   	igt_assert(buf);
>   	igt_assert(buf->ptr == NULL); /* already mapped */
>   
>   	buf->cpu_write = write;
> -	buf->ptr = gem_mmap__cpu_coherent(i915, buf->handle, 0,
> -					  buf->surface[0].size,
> -					  write ? PROT_WRITE : PROT_READ);
>   
> -	gem_set_domain(i915, buf->handle,
> -		       I915_GEM_DOMAIN_CPU,
> -		       write ? I915_GEM_DOMAIN_CPU : 0);
> +	if (is_xe_device(fd)) {
> +		buf->ptr = xe_bo_map(fd, buf->handle, buf->bo_size);
> +	} else {
> +		buf->ptr = gem_mmap__cpu_coherent(fd, buf->handle, 0,
> +						  buf->bo_size,
> +						  write ? PROT_WRITE : PROT_READ);
> +
> +		gem_set_domain(fd, buf->handle,
> +			       I915_GEM_DOMAIN_CPU,
> +			       write ? I915_GEM_DOMAIN_CPU : 0);
> +	}
>   
>   	return buf->ptr;
>   }
>   
>   void *intel_buf_device_map(struct intel_buf *buf, bool write)
>   {
> -	int i915 = buf_ops_get_fd(buf->bops);
> +	int fd = buf_ops_get_fd(buf->bops);
>   
>   	igt_assert(buf);
>   	igt_assert(buf->ptr == NULL); /* already mapped */
>   
> -	buf->ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
> -					     buf->surface[0].size,
> -					     write ? PROT_WRITE : PROT_READ);
> +	if (is_xe_device(fd)) {
> +		buf->ptr = xe_bo_map(fd, buf->handle, buf->bo_size);
> +	} else {
> +		buf->ptr = gem_mmap__device_coherent(fd, buf->handle, 0,
> +						     buf->bo_size,
> +						     write ? PROT_WRITE : PROT_READ);
>   
> -	gem_set_domain(i915, buf->handle,
> -		       I915_GEM_DOMAIN_WC,
> -		       write ? I915_GEM_DOMAIN_WC : 0);
> +		gem_set_domain(fd, buf->handle,
> +			       I915_GEM_DOMAIN_WC,
> +			       write ? I915_GEM_DOMAIN_WC : 0);
> +	}
>   
>   	return buf->ptr;
>   }
> @@ -1272,7 +1281,7 @@ void intel_buf_unmap(struct intel_buf *buf)
>   	igt_assert(buf);
>   	igt_assert(buf->ptr);
>   
> -	munmap(buf->ptr, buf->surface[0].size);
> +	munmap(buf->ptr, buf->bo_size);
>   	buf->ptr = NULL;
>   }
>   

