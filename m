Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F8FCD6E4A
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 12:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFC210FE34;
	Fri, 29 May 2026 12:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SWPjR5AO";
	dkim-atps=neutral
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72C610FE33
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 12:16:06 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1370417c01cso6474568c88.1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780056966; x=1780661766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R1SjcvjcI0hbHADG9l8NOeXrmf1ZMJwhfLHaL6nyInE=;
 b=SWPjR5AOKCB/AA0AqZHKI+6hrXUXDb4mejBEk8965au0r+WH24X8SGPdoOApMS/n+L
 uxG99y7wA5eg0E1WI4Qe1KnCaI/kEzRqQH0Usg9z4LSQZZcx53EafuiAprQGceM3MJJ1
 zeLZjmcc2jiVlAA58zzBTNzKTbqvBSc6hl9Z+FjNeuxCvzX3rHClOUDclViXVwidiXXM
 VWLFDYvotPwGnbbj7OGSenA9APDroU5kx+EC2JsWG7SOWpu21GeKR2ztP+wC2/EbRVmR
 K6n1XAQhBRkrZBXl8+JiTWr5zsGxSNIDJC4SkbsIocTiEfJjfENe31pQ/Swmd7GCsO/v
 S69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780056966; x=1780661766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1SjcvjcI0hbHADG9l8NOeXrmf1ZMJwhfLHaL6nyInE=;
 b=X3JGH1pvjzsbTO6eO46ws0/tQulnQq/vk4vBT8CeW8SYz1gAuXkvtS49Zd5pv6aQQo
 E3nhK7C+7lc6TRAJ0hVxsvCj6E8WRiOgqGGFFpNgSMSDnYsHyzSBkXoWk0geNjVzQlb9
 QaPmGHMof3buhelsTmnI10Qsj9RAixl+gswhrylhKd+N2KxG6LdOaQ9Ayx8Ws+KLdizZ
 obXls99cg1m1/2mN96kwWcCr4N4u1z2IuvQrzw1yAfcFbL2UdCRsgkEPR2kN7EvrANvw
 ond3goUe22NdveISVppHilEzYxNQ0UjWTJzv8a11AP1MAU4km2QLDFDJM1vclslgXHPN
 HSpA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/qPTF4ObyGHmVumBJMKQsGaF1JcFGLp1UwpHNM4eFX9O8CPmZSI1nG6VGJKJNaG0CFYdP6qdk5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZXBDa0y8IlN1eHpww2G/eq/3HfM6GOZByuriPEvYfzsnibKOo
 AmDx3jMvNtOzCUZ4fG6xSwh3AJdcIKh8f9EvDvOlnDrPIKKB6FdEUUPjglvM14Db
X-Gm-Gg: Acq92OEfF+yAGQ5RFmnPVEJy/WdHkJAABb+tJOb+qDTKbdfFSiIEnocq7xbA+coYfof
 KYT7N4ei1RRSOJrnTmNoptFEXjK7oDqF9qZxZO7gyOEQDIa/XM3qk/skFkvOcnaYNWBqi5Tjs7+
 dztpES/IuZzi0jmU9fHR89J5PsdnLFcrKASPhBe88b53bGXmqowe2ufkPMopT35PrfsUdjpD61R
 wflt1muGENGtkVfUpG1gpfuYve7Vsb4LDDkPEz3Ij4oIZ8EIRAW4aRNmbvt67HvdnHrf5JjbOKx
 uebsUFyG/7qpkaMBji6di1S/ELTtnLrpOTUuZq5LCQND8PyRagDay6G318efJ3NqOcrfVKL9qwH
 hGNdfL50CvlejoSoliTpdHHPiLPwgKZu2rIixhaYCFHIffbgtK6FqMgL5Amnllnu6uCR9o1BhS9
 uRiek59t5X1loMsZPRx8ZszsqvhD4ZZ2TVvjLjv42hNsI0WzQ/629TGSkb6lE+3cvsw4buibR6A
 +aQ
X-Received: by 2002:a05:7022:407:b0:136:7d65:4edc with SMTP id
 a92af1059eb24-137aeb9217emr1127989c88.8.1780056965832; 
 Fri, 29 May 2026 05:16:05 -0700 (PDT)
Received: from [192.55.54.47] ([192.55.54.47])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b36af6edsm1004480c88.5.2026.05.29.05.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 05:16:05 -0700 (PDT)
Message-ID: <c949a702-e12a-45fb-968a-262416f7ff0b@gmail.com>
Date: Fri, 29 May 2026 15:16:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 24/25] tests/intel/kms_flip_tiling: Use
 for_each_modifier_with_format()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
 <20260512122143.11013-25-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260512122143.11013-25-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 12/05/2026 15.21, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Replace the nested open coded copies of for_each_modifier_with_format()
> with the real thing.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/intel/kms_flip_tiling.c | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
> index bccacfa7b229..ff79e1458ef2 100644
> --- a/tests/intel/kms_flip_tiling.c
> +++ b/tests/intel/kms_flip_tiling.c
> @@ -230,7 +230,6 @@ int igt_main()
>   		bool run_in_simulation = igt_run_in_simulation();
>   
>   		for_each_crtc_with_valid_output(&data.display, crtc, output) {
> -			uint32_t format[2];
>   			uint64_t modifier[2];
>   			igt_plane_t *plane;
>   
> @@ -244,20 +243,10 @@ int igt_main()
>   
>   			plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> -			for (int i = 0; i < plane->format_mods.count; i++) {
> -				format[0] = plane->format_mods.formats[i];
> -				modifier[0] = plane->format_mods.modifiers[i];
> -
> -				if (format[0] != data.testformat)
> -					continue;
> -
> -				for (int j = 0; j < plane->format_mods.count; j++) {
> -					format[1] = plane->format_mods.formats[j];
> -					modifier[1] = plane->format_mods.modifiers[j];
> -
> -					if (format[1] != data.testformat)
> -						continue;
> -
> +			for_each_modifier_with_format(&plane->format_mods,
> +						      data.testformat, modifier[0]) {
> +				for_each_modifier_with_format(&plane->format_mods,
> +							      data.testformat, modifier[1]) {
>   					if (run_in_simulation &&
>   					    (!is_basic_tiling_modifier(modifier[0]) ||
>   					     !is_basic_tiling_modifier(modifier[1])))

