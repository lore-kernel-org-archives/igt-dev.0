Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C43C48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 14:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C62410E7CB;
	Thu,  8 Feb 2024 14:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XQNx/iF4";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0C10E7CB
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 14:09:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-511717231bfso538717e87.2
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Feb 2024 06:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707401344; x=1708006144; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=R+3Wcw5BrR6m7egYbJpjLC5nxJ1nLlrvVzXJWTnpdf0=;
 b=XQNx/iF4x99nU1q0z3LuGIkY29M2FerQD2HbS2zvrCApxR+FgDa+qZCGVhZ3GLudDu
 pK6GsK5vlfejgMH8rN6LyH/KvXUmCstknR+eqVqyuD0H8lY+fXoAAH7NHMAnbXCuNqmW
 MpoNiZnf5aE7mtZ7wASO8mTHxtqt+0kOVmwuM/Ii/4Za0mRX7nk3EgvnyS2jCLzIO+dD
 eiWEZlKJ5jS0xuxtx7IRf+qmitSMtYjpNXCdSAvGLP71oG54iSXa2/TzV33GBQfUkorC
 6YoJa94gGMvUZS+tXsBCkT8DMlvFCp2IN6SvyCpIkRZOECFRLEtkNPTvsjE8Mspd0w38
 eKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707401344; x=1708006144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R+3Wcw5BrR6m7egYbJpjLC5nxJ1nLlrvVzXJWTnpdf0=;
 b=EcBNo5ru7qAv1/sIIb2UBqmh4iE3oQljd1DwqmYaEJ5hBpCVDPJl7CDD40ceD7BmEd
 YuPA15EqRsS8f5t4fgwzDGtFfhrVSU4MujlJYleL2LDS5JL0IaznTrJhTVeYpUQjVbxs
 QT6CuCS5gXIhDLK7Zi029d2tRNC/7cQcRot7kO2VRPiWxR7Z973WhzrZ3g5ateLboYOK
 d8DdIC4jWjnZpjFsP2uTGADqjE1oxEc7rR4ZzZfbfOn0JBseVEzs/aQ/zWt2TvI/0qrb
 URnba7/apAKypaHCl4ZKLwWrBrogHvB4SLKxAynLQbucGE4TzSePHz1w5fg2UKLDkQhl
 SayA==
X-Gm-Message-State: AOJu0Yzi+Z8MAA0S8HCUehZJXCaVIVTkGThyEYg+XPE0XZhorXtiJY6/
 RKMGNUSBKoMxeN2ylCuVfHA7sjrXyOIUc6c+usgFRWUCPy1uMcbZ
X-Google-Smtp-Source: AGHT+IESwu4PrKPyL4vCl7KCTeaRjAYnWmtvSsn/jrm+Ayrk8BqMGrN1kB2kc6v4KWP/byisX7mZ9A==
X-Received: by 2002:a05:6512:34c3:b0:511:72fd:fc1 with SMTP id
 w3-20020a05651234c300b0051172fd0fc1mr208476lfr.31.1707401343906; 
 Thu, 08 Feb 2024 06:09:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV/YyXRiVx/BW+iM+jDYRcP77GtjYlGUKMzpPPOMDtST6KkasQ5wqZ708JVsnymBGVPdAcA0raw2CcXWuYkMhcljNYineIgSj1cYGpgdAmp7bsne+iGJ+ZMy41B82vl7PNIMCIu
Received: from [0.0.0.0] ([134.134.139.70])
 by smtp.googlemail.com with ESMTPSA id
 m40-20020a05600c3b2800b0040fc26183e8sm1745725wms.8.2024.02.08.06.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 06:09:03 -0800 (PST)
Message-ID: <84ddef1c-d502-470d-8b05-2432416b8f9a@gmail.com>
Date: Thu, 8 Feb 2024 16:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area
 used for CRC test
Content-Language: en-US
To: Vandita Kulkarni <vandita.kulkarni@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, karthik.b.s@intel.com
References: <20240208121039.13701-1-vandita.kulkarni@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240208121039.13701-1-vandita.kulkarni@intel.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Vandita,

On 8.2.2024 14.10, Vandita Kulkarni wrote:
> On some platforms wc_mmap write takes longer to paint the fb,
> which we are using to clobber the already scanned buffer for
> CRC. Hence reducing the clobbered area.
> 
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>   tests/kms_async_flips.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index a0349fa03..2e5960943 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -589,7 +589,7 @@ static void test_crc(data_t *data)
>   
>   	while (clock_ms() - start < 2000) {
>   		/* fill the next fb with the expected color */
> -		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
> +		paint_fb(data, &data->bufs[frame], 10, 10, 0xff0000ff);

Here really is needed to be painted full height of the framebuffer and 
that width can be kept at 1 as any number higher will just increase the 
work.

For async flip part of fb which will become visible is not known here so 
the full height of the fb need to be painted on to catch if there was 
something going wrong.

>   
>   		data->flip_pending = true;
>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
> @@ -600,7 +600,7 @@ static void test_crc(data_t *data)
>   
>   		/* clobber the previous fb which should no longer be scanned out */
>   		frame = !frame;
> -		paint_fb(data, &data->bufs[frame], 1, height, rand());
> +		paint_fb(data, &data->bufs[frame], 10, 10, rand());
>   	}
>   
>   	igt_pipe_crc_stop(data->pipe_crc);

