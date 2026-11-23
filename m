Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9B2606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3CFe4Ms
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13C310F120;
	Mon, 23 Nov 2026 18:14:11 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2D010E0AB
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 18:13:06 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3ac9f49b984so2052662a91.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795457586; x=1796062386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=IBSHiZTJNFiHNbgrHMXoPTen8eWfPrIKbQPLeresatw=;
 b=H3CFe4MsA0qu1ka6dw7aK/2MyEe7Xb1Eb+NO+N1osLUjO2NH+Qm7+KvWLpKvkgjAJb
 StihRrAfIxzDDfDpkLlRiKoQ4n2oQohe+kcC/4qJ/cr3194Lrrw6xvWkoS34ScWw5ooT
 1jHwmAf80saBHHxBAC9uJuq5iZhy1Se03MnpP7jnTGi2rBTF7uK3/scSJkiSVsVXNF+J
 ltOi9QIrNk/nut1NEUvreS/CXlYSuHteii2YE5A+bQqzf4nZ8bMD+e7w1DILyzwHw3qh
 56OEmnh6is+QQrQRPyI/B+Kk5rXYG/xK+rGAdmYxKt3FWaRP/qR1Bttl+Q4u0lpnDGUS
 zrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795457586; x=1796062386;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=IBSHiZTJNFiHNbgrHMXoPTen8eWfPrIKbQPLeresatw=;
 b=eK72xuuPBsW6Qoenr6cUV5JWdsTbgNNZ3Dz17F0dDxgPrsK1oyIKyOqVWWsKdunD9n
 2o+5sFOrzoBK53t/VnFgiRQQvyBsokczoz0si/wBi8kL0WVwjeOaKVV9dE7rubywl9Ux
 A6TxYqMB/dPfnKevK4R364YDY/xiVCnRsSSXfW45xkUhTS9QATp3D+84k7aiqMeJkRJx
 mil2/gQMPWt7H2iQKcHwfjAhyRioIvrXJqwfsQCRC/sRRax1gXjBjXLvaPZPb4GXrtIo
 dZ3k/ilkreOO8ZKV/Kxm9nuNETrDJwrqtxNv314eugXL5HaFJeyl5d1fZ5smoBFwJUZM
 B26g==
X-Forwarded-Encrypted: i=1;
 AL+hErFIJGeLLSZ7kkjdfPFHu0FF+cFGzjzMv+2R+gYfVpRutjI0F+LIdtC9qfD+2076/uRsZYsRaLlq@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+yME9PpBKm97/njjpzpfdPW3FvaoVU+W+z9DAidNkY3TDQvJZH
 wmzj8ywAzG2PmqdoGxadPEtX2pyKtCM/TNereUtCL6N4SFc3URsSVvUx8396D0buPP8=
X-Gm-Gg: AZFdTZcpH6z7Kdh8GSHS+jZLD+ONSZ5nTIi13ZWuZFDtweh1wEmbt9fT054NnpEfrYY
 YpmNlOOODC0Ni6SkzB8YzA/Y/4EgEA3n0VrMkw4EYUvYylIDD1gwfZvzFYagA9oCqKNKVkqhTbZ
 NKxV7AGI7jCFnsarMbaNyp+JUWVTaBDY2X6UJn8H4n9P4WSc1ciskIgpOiQP1Gl/iulvelgmukF
 Ss31rvEaD5+Et084oJVqeDQbKK5KSG+q/mmgzn1ahZeA5xdQws/VNV8eheZOjvHWjrRER2L9ba9
 zjH3Rgor44N/ryTgoOXe9uOsZXPSYFtZ9dazrDDVYa1ECgyEWKVXiHfcNi23lL+TLIhdAQio2Xz
 5QT75ZXsLPjZvaBx0FJv7ZQdF958p9cGEP6qTQkTBcRSWBdYbCO9rJ2ststmc/gsuOWtG/lTw2i
 ZrXKbdDFB7qPU3+lkLkSW3QnownJGZhO3zeVJyZDcIVLVFhsqm+YbagOYaf70Z02+6I8l3/fL77
 Pm//xJug7lxlYDSFmmxp9OpEwXnc11WLArS8M/v0WUuZcq1Mh0agHkeCliNDch/+I11/OpMpPq1
 BBR9ga3Pjs3yblVHhmydW5jl13CkZ/T9owlTmn9BnuNdqcxmgRBOfnZER1m9f5H4lDDr8r9Q5l9
 g
X-Received: by 2002:a17:90b:2e8e:b0:3b4:323f:bdce with SMTP id
 98e67ed59e1d1-3b4323fd218mr6970398a91.35.1795457585954; 
 Mon, 23 Nov 2026 10:13:05 -0800 (PST)
Received: from [134.134.139.77] ([134.134.139.77])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cde6d0818c1sm5549978a12.30.2026.11.23.10.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 10:13:05 -0800 (PST)
Message-ID: <3ac4922e-f812-4432-82a2-5c0b8ffd3fd1@gmail.com>
Date: Mon, 23 Nov 2026 20:13:02 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: Try all blend modes when resetting it
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
References: <20261117103356.303340-1-zhengxingda@iscas.ac.cn>
 <424a48b2-4f44-4f0b-97a4-aab35c5153eb@gmail.com>
Content-Language: en-US
In-Reply-To: <424a48b2-4f44-4f0b-97a4-aab35c5153eb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

merged.

On 20/11/2026 16.02, Juha-Pekka Heikkilä wrote:
> Look ok
> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> 
> If nobody else get to merge this I'll merge it on Monday when I have 
> access to my machine.
> 
> /Juha-Pekka
> 
> On 17/11/2026 12.33, Icenowy Zheng wrote:
>> Since Linux 7.3, the pixel blend mode property of planes would be
>> present (and required when the plane supports formats w/ alpha) even
>> when Pre-multiplied isn't supported, which leads to assertion failure in
>> igt_plane_reset().
>>
>> Add logic to try all possible values for this property mimicking the
>> logic of kernel deciding the default value.
>>
>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>> ---
>>   lib/igt_kms.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 915c6a8a2..789da08b3 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -2644,6 +2644,22 @@ static int get_drm_plane_type(int drm_fd, 
>> uint32_t plane_id)
>>       return DRM_PLANE_TYPE_OVERLAY;
>>   }
>> +static void igt_plane_reset_blend_mode(igt_plane_t *plane)
>> +{
>> +    bool result;
>> +
>> +    result = igt_plane_try_prop_enum(plane, 
>> IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
>> +    if (result)
>> +        return;
>> +
>> +    result = igt_plane_try_prop_enum(plane, 
>> IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
>> +    if (result)
>> +        return;
>> +
>> +    result = igt_plane_try_prop_enum(plane, 
>> IGT_PLANE_PIXEL_BLEND_MODE, "None");
>> +    igt_assert(result);
>> +}
>> +
>>   static void igt_plane_reset(igt_plane_t *plane)
>>   {
>>       igt_display_t *display = plane->crtc->display;
>> @@ -2679,7 +2695,7 @@ static void igt_plane_reset(igt_plane_t *plane)
>>           igt_plane_set_prop_value(plane, IGT_PLANE_ROTATION, 
>> IGT_ROTATION_0);
>>       if (igt_plane_has_prop(plane, IGT_PLANE_PIXEL_BLEND_MODE))
>> -        igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, 
>> "Pre-multiplied");
>> +        igt_plane_reset_blend_mode(plane);
>>       if (igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>>           igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xffff);
> 

