Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559DBC30653
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 10:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CB710E60D;
	Tue, 25 Jun 2024 10:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aadr1yNo";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E9010E5F8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 10:08:59 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4217990f8baso46627385e9.2
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 03:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719310138; x=1719914938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=igSb4VhLSIKseLsEE50+5aOZN9iRVla6a6lDiIlTIYM=;
 b=aadr1yNokGWAQzF8RcgG53sWBei46rDd0vHcdRSZIjPX/erMN8tSAl44z5yQjOun5l
 2O+DPu10WcZnF0u0s24ISLLg6jpK6/NVb0yYy5tt7N8mC+nCgqnmkzOD6bHOSCckn7pM
 0Gicu+c+fFJPFrddSYefO9M2seIfZsW6kxiOzYTp6kEiKOj713lxMfUVAOoUjd0QtRzB
 JmFrtI5oayYGrVi7rpl42A5wPt5cm3bVV3+t2U0C+k+UaJzYHXnnaGMAI3MqQtUd9kIz
 qzWOx22JTm+AkUzfESL0RCuJA3/6iQk4ZgnrlCMGyr6G6kvgniuROuXJ27pcOLUmR8Rd
 38jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719310138; x=1719914938;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=igSb4VhLSIKseLsEE50+5aOZN9iRVla6a6lDiIlTIYM=;
 b=NCLsERrx/BhJUNkBEN+sho9XHESDk4EKZfDK0FBbvvAxllkUQfRTwKztfRbMb4GEmb
 92mjizoPzDexbLjT4CrZULUGfpV61kAG5Neq3mE9CD3MYqyaBkvb496W6EwUmkNf7bQO
 SYzBxGwTCO4i8cGkSCEwan2HBaw4wLBeG3YGxw3WZErfKlXshAUUlh/8jtnx8qNXR0gq
 2NjH4UGYePTdn6nCVE8DcIjNXnae50hsS6g3EwioA9cdPH0d1oX/Nna+FldNrNbbsP6n
 y6Dg1kGLK3a01poBl4eXYXkiiSb2pGWCUtHiej9bjXpuRxatfTU8AUhGPhwMbzDMuLgw
 VhTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrQsiXLKZOSIQxszTX+z2NF0lNQwa9Rs96h39lFJ2VuNlywcXUtH1pKnoebWlGKgvnDTqbXzmTVW+dY8A5qFRdSX6F9Yor59tkt9cjvg==
X-Gm-Message-State: AOJu0YzAHL/+vXr/eJDDN1bDPdKpSvW0/ZL6fan8FWD6nefCdXNwjBPf
 oSe6tg3dIUf9sgZysns9ZrEnXPo5qft6Mw2OgXGKuCelZff6naF9IrDYVY/smUc=
X-Google-Smtp-Source: AGHT+IHof8WgC00Hwr5xIOogp4yf9eGu7+kNC5SFDD2Pt/vyMjU1fPJ71NWBrea63WBZYEGi0rGkqA==
X-Received: by 2002:a05:600c:3b14:b0:424:8c44:b639 with SMTP id
 5b1f17b1804b1-4248c44b70fmr48941375e9.19.1719310137668; 
 Tue, 25 Jun 2024 03:08:57 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.76])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42481910d51sm173596105e9.32.2024.06.25.03.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 03:08:57 -0700 (PDT)
Message-ID: <ab4ce385-f9c3-4705-a46f-0b3a8761ea68@gmail.com>
Date: Tue, 25 Jun 2024 13:08:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_getfb: Skip getfb2-accept-ccs subtest on
 Xe2 platforms
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com
References: <20240621043248.612664-1-pranay.samala@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240621043248.612664-1-pranay.samala@intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 21.6.2024 7.32, Pranay Samala wrote:
> The getfb2-accept-ccs subtest tests on ccs modifiers.
> With Xe2 platforms we no more have the ccs modifiers.
> 
> Adding a check to verify the platform. If it is
> Xe2 platform then test will skip, otherwise it
> will execute further.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_getfb.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index bb9679bc9..81829ca3b 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
>   	igt_require(has_addfb2_iface(fd));
>   	devid = intel_get_drm_devid(fd);
>   
> +	igt_require_f(intel_graphics_ver(devid) < 20,
> +		      "No ccs modifiers on Xe2\n");
> +
>   	if (HAS_FLATCCS(devid)) {
>   		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>   		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);

