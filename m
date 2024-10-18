Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DF5D3C54C
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 07:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0270B10E8A6;
	Fri, 18 Oct 2024 07:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NZ+wqceQ";
	dkim-atps=neutral
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B9410E8A6
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 07:07:44 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so2576452e87.1
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729235262; x=1729840062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GCxW+IVTJw6VWkmbQlX5mc1pkYZfzSaQur+gDjTwN34=;
 b=NZ+wqceQtyg5is/r6uefviFRQamVIy6c01saZ6UA7T2jDEsd4iuLTbSa9gIIeXhOhF
 uXLW+3m/bbkBkVdK2NeX26RT2HmXN6i4iJn0Ia9TTerhhLFNPBUHNHtnXOr101bXZGaF
 lP25H+El3G9BKeJ4D8F7gTNdCdoOswe34xrCUpuMDWt9CNb9kRG2REu56epEfURchye5
 LIWZVHdrF4M+WV6yvHq3d+xeuePJx8GJJ2+tjup6LeaFttlEllY/WJiBGjYN3Fo6Eauk
 F2hMwU0BUt2qqVdSkfrqc1NUqALAJfxjChI7vrkNxbgAhjgaqV/0nibqLI/i6Vho8xNz
 RKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729235262; x=1729840062;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GCxW+IVTJw6VWkmbQlX5mc1pkYZfzSaQur+gDjTwN34=;
 b=jHjdNmfC/cFfR2GY0Zsk/Mysifjp6V9/wdY4I2BiM7iZQzcmOIMDZjwjzUPYxzL4xY
 cuabocKoWpi54HIpoNddCcfbUC0S55mE9SSY6HqbhnLrPyCcZZN9FcMVJK7VoGZE+g0v
 ALHfQ0x1YkwBlCFU77QSnYOdeS98vAkqKAQx03kPyUOtvPBxX0Lk+6tmTaOIPxWCKC7O
 8nUYlLJB+VqGwQhr/h+nubh8BPDKk9nq4imCvHiJr0zI9KD2/rcdmTByErY2KaT4IzB3
 aOH4QJJ3JWsoZXUzU29fVEACqO8IDTK8ls7o9R3voAN0r6k2QR7Kf7/KCekphqJy83aC
 760Q==
X-Gm-Message-State: AOJu0Yz+7ChJJ30XuI5iUCreedw+SasAoQ9UuTiQN6vaJv72FshYuoQ/
 xk9qf9unAH2lPlCbHmxLFttn9FGg62txP+4oUszuKb0xypyqmvyvoL4R1v4qAEI=
X-Google-Smtp-Source: AGHT+IHhaoT6IuiQSDJ8MHKxnRPorxFxZgqCLp9uig/+1gXsDid1XEdsjEtHKNrXhsduGmDPPGU3BA==
X-Received: by 2002:a05:6512:2396:b0:536:54df:bffa with SMTP id
 2adb3069b0e04-53a1544c1e8mr938477e87.45.1729235261623; 
 Fri, 18 Oct 2024 00:07:41 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9a68bf7000sm53170166b.166.2024.10.18.00.07.39
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2024 00:07:41 -0700 (PDT)
Message-ID: <e71e381e-5da7-43a8-b14e-187ac8c23ced@gmail.com>
Date: Fri, 18 Oct 2024 10:07:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Intel Xe2 cannot do hflip
 with tile4
To: igt-dev@lists.freedesktop.org
References: <20240912144645.862462-1-juhapekka.heikkila@gmail.com>
 <e301f56b-4d7d-448f-98f2-b04fa3102609@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <e301f56b-4d7d-448f-98f2-b04fa3102609@intel.com>
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

On 18.10.2024 0.06, Naladala, Ramanaidu wrote:
> Hi JP,
> 
> On 9/12/2024 8:16 PM, Juha-Pekka Heikkila wrote:
>> On Intel Xe2 hw Tile4 no longer can be used with horizontal flip on display.
>> bspec 69853
>>
>> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
>> ---
>>   tests/kms_rotation_crc.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
>> index 8d8c53b5f..3e9190590 100644
>> --- a/tests/kms_rotation_crc.c
>> +++ b/tests/kms_rotation_crc.c
>> @@ -639,6 +639,12 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>>   			    !IS_CHERRYVIEW(data->devid) ||
>>   			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
>>   
>> +		/* Intel Xe2 onwards cannot do reflect tile4 */
>> +		igt_require(!is_intel_device(data->gfx_fd) ||
>> +			    intel_gen(data->devid) < 20 ||
>> +			    !(data->override_modifier == I915_FORMAT_MOD_4_TILED &&
>> +			    data->rotation&IGT_REFLECT_X));
>> +
> As per BSpec (69853) up to XE2, horizontal flip is not supported with 
> linear surface formats. If it is valid to add that check, please do so.

Hi Ramanaidu,

that check has been there long time already.

See here 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/display/skl_universal_plane.c?h=v6.12-rc3#n1587

/Juha-Pekka

>>   		prepare_crtc(data, output, pipe, plane, true);
>>   
>>   		for (i = 0; i < num_rectangle_types; i++) {

