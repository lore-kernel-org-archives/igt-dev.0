Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D683ED1CDAB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 07:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9446310E60E;
	Tue, 22 Oct 2024 07:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L1ivuiJY";
	dkim-atps=neutral
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B9E10E5FE;
 Tue, 22 Oct 2024 07:57:58 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5c984352742so5677820a12.1; 
 Tue, 22 Oct 2024 00:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729583876; x=1730188676; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2yE4yzZt9ImzEWbWhu/Iv5PBaq2uWmj6v0yXzP5OUmg=;
 b=L1ivuiJY/X1C8fPDg2Ud3b3ACHP49ErirrSMVl7Vhos4/x83IiMn4fT3/Ss2QYovnr
 2ArH7N1J9rNnut8nWem7kHw8w+vfJ9jTaMwu3J386gU11PTm8SlJTFrFsIKxpAmRC+rK
 zRM/aI68KXzyYbw5eCLrVOwSeDvDjp59n231NdTwcvxaUc68p3goE1V5xRTgfUXWYvnc
 F2CT0BCmpRvZ/vIDXI3RjAHR8skx/SPg8rgUuyDpvvTgJZQR09VwMarXAwJuOJckc3yI
 //9Pg4PQa0S+N4UG0nwv6j7kyxu+tazIlP8FqnqqFeuWD5NBOqeITBf+1GTUFzE6KL9/
 YPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729583876; x=1730188676;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2yE4yzZt9ImzEWbWhu/Iv5PBaq2uWmj6v0yXzP5OUmg=;
 b=GHd00Elatjh/8MmbgkN+PUsW00KNtWqFo/yR1QWkMVx4USV0PYUZbnpgTf+EtiSRUx
 ZV86q5wPRy8YH8Kol8kOC+KkuyN7PfLOEHYVZx1ZBigNi89u9kjt7im3+jyg5yGIvjbk
 efrz4atXJdVRfvWdl6BU3vabjIUJHZr/kfAoQDBZ31M0OrYNv9CXK0eA/yjQtwBnBA28
 eXcPIbE01gvaDkQQBxRX1ZzVG02/6Q8FOv8YVD+CgeELd4OwB9XeZTyWg8nlMmzWi5KG
 yNsRRnC3nwike9kN+x7CyqpN/9cG3jqjrNQ5Nff/Qp8qso8bv7Qo6RrmvjZV/YOtHPGh
 5AYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ0Wd0VwrKF1zR4sLWnYEa6ayUmNj1c6iep+2zXQQNiqG6PCPgY8e1NOP9FGaL/QZwJvWagiO1RbXxo5mW@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4S7Q4wkStA2iwkqc8Mh67FirWOG/j4P9Xjis/MM+wm2GLFtH4
 LurCrsLBQIiE4dOd6n3eK4Dmhs1CzIwvl1ilkEpsHfzKzLqKu8hiTTl0fzpdgvQ=
X-Google-Smtp-Source: AGHT+IHK7zp5GfO1DJKd0HQRNuhZCH8AvH1QxSaNcKEmdCIPx1tPI475TTIC/xlEAAIdEoUPr8i6hw==
X-Received: by 2002:a17:906:794c:b0:a99:7676:ceb7 with SMTP id
 a640c23a62f3a-a9a69a76111mr1245802066b.26.1729583875015; 
 Tue, 22 Oct 2024 00:57:55 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.76])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a9a913706bdsm301193766b.101.2024.10.22.00.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 00:57:54 -0700 (PDT)
Message-ID: <c93a843e-dabc-44c7-afb5-79279b2644ea@gmail.com>
Date: Tue, 22 Oct 2024 10:57:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_kms=5Fccs_opti?=
 =?UTF-8?Q?mization_=28rev2=29?=
To: igt-dev@lists.freedesktop.org,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
 <172924835801.1281717.7100623992980391652@2413ebb6fbb6>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <172924835801.1281717.7100623992980391652@2413ebb6fbb6>
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

On these ci logs I don't see anything caused by my changes. Here was 
patched new path for blitting framebuffers in lib and then used that in 
kms_ccs only.

/Juha-Pekka

On 18.10.2024 13.45, Patchwork wrote:
> *Patch Details*
> *Series:*	kms_ccs optimization (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/140106/ <https:// 
> patchwork.freedesktop.org/series/140106/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8078_full -> XEIGTPW_11932_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11932_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11932_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11932_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_vm@large-split-misaligned-binds-2147483648:
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-5/igt@xe_vm@large-split-misaligned-
>         binds-2147483648.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-lnl-3/igt@xe_vm@large-
>         split-misaligned-binds-2147483648.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-change-
>         during-suspend.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-
>         suspend.html> +1 other test skip
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-1/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1178>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-bmg-1/
>         igt@kms_content_protection@legacy.html> +9 other tests dmesg-fail
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1188>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-bmg-7/
>         igt@kms_content_protection@uevent.html> +1 other test dmesg-fail
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-4/igt@kms_cursor_crc@cursor-
>         onscreen-32x10.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html>
>   *
> 
>     igt@kms_cursor_crc@cursor-suspend:
> 
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html> +20 other
>         tests skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-
>         before-cursor-atomic-transitions.html> (Intel XE#2286 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2286>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-
>         atomic-transitions.html>
>   *
> 
>     igt@kms_flip@absolute-wf_vblank@c-dp2:
> 
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-7/igt@kms_flip@absolute-wf_vblank@c-dp2.html>
>         -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_11932/shard-bmg-7/igt@kms_flip@absolute-wf_vblank@c-dp2.html>
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
> 
>       o {shard-bmg}: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-7/igt@kms_plane_scaling@intel-max-src-
>         size@pipe-a-hdmi-a-3.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-bmg-1/
>         igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html>
>         +135 other tests dmesg-warn
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-
>         factor-0-75-with-modifiers.html> -> DMESG-WARN <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-bmg-5/
>         igt@kms_plane_scaling@plane-downscale-factor-0-75-with-
>         modifiers.html>
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
> 
>       o {shard-bmg}: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-bmg-5/
>         igt@kms_plane_scaling@plane-downscale-factor-0-75-with-
>         modifiers@pipe-b.html> +3 other tests dmesg-warn
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-
>         downscale-factor-0-5.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-
>         factor-0-5.html>
>   *
> 
>     igt@xe_live_ktest@xe_eudebug:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html> (Intel
>         XE#2833 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2833>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html>
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11932_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@core_setmaster_vs_auth:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-433/igt@core_setmaster_vs_auth.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@core_setmaster_vs_auth.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>)
>   *
> 
>     igt@fbdev@unaligned-write:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-433/igt@fbdev@unaligned-write.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@fbdev@unaligned-write.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>   *
> 
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-8/igt@kms_atomic_transition@modeset-
>         transition-nonblocking-fencing.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-lnl-7/
>         igt@kms_atomic_transition@modeset-transition-nonblocking-
>         fencing.html> (Intel XE#1701 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1701>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-180:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-434/igt@kms_big_fb@linear-64bpp-
>         rotate-180.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/
>         igt@kms_big_fb@linear-64bpp-rotate-180.html> (Intel XE#877
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
>   *
> 
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-6/igt@kms_big_fb@x-tiled-16bpp-
>         rotate-90.html> (Intel XE#1407 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1407>)
>   *
> 
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-435/igt@kms_big_fb@x-
>         tiled-32bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-
>         rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1124>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@kms_big_fb@yf-tiled-
>         addfb.html> (Intel XE#619 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/619>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-466/igt@kms_big_fb@yf-tiled-
>         max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (Intel
>         XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +8 other tests skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@kms_bw@connected-
>         linear-tiling-4-displays-1920x1080p.html> (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +1
>         other test skip
>   *
> 
>     igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-7/igt@kms_bw@connected-linear-
>         tiling-4-displays-2560x1440p.html> (Intel XE#1512 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>   *
> 
>     igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-464/igt@kms_bw@linear-
>         tiling-3-displays-2560x1440p.html> (Intel XE#367 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1 other test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-
>         basic-4-tiled-dg2-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3 other
>         tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-466/igt@kms_ccs@crc-sprite-
>         planes-basic-4-tiled-lnl-ccs.html> (Intel XE#2907 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-
>         mc-ccs@pipe-a-dp-4.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-464/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#3113 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3113>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-
>         rc-ccs.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-dg2-463/igt@kms_ccs@random-ccs-
>         data-4-tiled-dg2-rc-ccs.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-434/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-
>         dp-4.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1195> / Intel XE#3113 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3113> / Intel
>         XE#3124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-
>         rc-ccs@pipe-b-hdmi-a-6.html> -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-
>         a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1195>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/igt@kms_ccs@random-ccs-
>         data-yf-tiled-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +48 other
>         tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/igt@kms_ccs@random-ccs-
>         data-yf-tiled-ccs@pipe-d-dp-4.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +10
>         other tests skip
>   *
> 
>     igt@kms_chamelium_audio@dp-audio:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-435/
>         igt@kms_chamelium_audio@dp-audio.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +4 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_color@ctm-green-to-red:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-7/igt@kms_chamelium_color@ctm-
>         green-to-red.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_color@ctm-negative:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-435/
>         igt@kms_chamelium_color@ctm-negative.html> (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-storm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-
>         storm.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/373>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-435/
>         igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-8/igt@kms_content_protection@lic-
>         type-0.html> (Intel XE#599 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/599>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_cursor_crc@cursor-offscreen-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/
>         igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/323>)
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-6/igt@kms_cursor_legacy@flip-vs-cursor-
>         atomic-transitions-varying-size.html> -> FAIL <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-lnl-1/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-
>         size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1475>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-433/igt@kms_dsc@dsc-with-
>         bpc-formats.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) +3 other tests skip
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         lnl-6/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#2958
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958>)
>   *
> 
>     igt@kms_feature_discovery@display:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@kms_feature_discovery@display.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-dg2-436/igt@kms_feature_discovery@display.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +15 other tests skip
>   *
> 
>     igt@kms_feature_discovery@display-1x:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-434/
>         igt@kms_feature_discovery@display-1x.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +5 other tests skip
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-3/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-6/igt@kms_flip@2x-flip-vs-
>         blocking-wf-vblank.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-466/igt@kms_flip@2x-flip-vs-
>         expired-vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +5
>         other tests fail
>   *
> 
>     igt@kms_flip@absolute-wf_vblank:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-432/igt@kms_flip@absolute-wf_vblank.html> ->
>         INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_11932/shard-dg2-433/igt@kms_flip@absolute-wf_vblank.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2049>) +1 other test incomplete
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-
>         interruptible@c-edp1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-lnl-5/igt@kms_flip@flip-vs-
>         absolute-wf_vblank-interruptible@c-edp1.html> (Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +4
>         other tests fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-
>         to-64bpp-4tile-downscaling.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-436/
>         igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-
>         downscaling.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +7 other
>         tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling.html> (Intel XE#1401 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1401> / Intel XE#1745 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-8/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-
>         upscaling@pipe-a-default-mode.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-pri-indfb-draw-mmap-wc.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html> (Intel
>         XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) +17 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +5 other tests skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-435/igt@kms_joiner@invalid-
>         modeset-big-joiner.html> (Intel XE#346 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_plane@plane-position-covered@pipe-a-plane-4:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-
>         a-plane-4.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-5/igt@kms_plane@plane-position-
>         covered@pipe-a-plane-4.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +2 other tests
>         dmesg-fail
>   *
> 
>     igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-6/igt@kms_plane@plane-position-hole-
>         dpms@pipe-b-plane-3.html> -> DMESG-WARN <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-lnl-6/
>         igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html>
>         (Intel XE#324 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/324>) +2 other tests dmesg-warn
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-433/
>         igt@kms_pm_backlight@fade.html> (Intel XE#870 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-466/igt@kms_pm_dc@dc5-
>         psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1129>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-
>         non-lpsp.html> (Intel XE#1439 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1439>)
>   *
> 
>     igt@kms_pm_rpm@dpms-non-lpsp:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@kms_pm_rpm@dpms-non-lpsp.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html> (Intel XE#2446
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-
>         overlay-plane-move-continuous-exceed-fully-sf.html> (Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) +1 other test skip
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-
>         plane-move-continuous-exceed-sf.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@kms_psr2_sf@pr-
>         cursor-plane-move-continuous-sf.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3 other
>         tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_psr2_su@page_flip-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-466/igt@kms_psr@fbc-pr-
>         cursor-plane-move.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +6
>         other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-7/igt@kms_psr@fbc-pr-sprite-
>         plane-onoff.html> (Intel XE#1406 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-render@edp-1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-
>         render@edp-1.html> (Intel XE#2948 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) +1 other test
>         fail
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-464/
>         igt@kms_rotation_crc@primary-rotation-270.html> (Intel XE#327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-433/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>   *
> 
>     igt@kms_setmode@basic@pipe-b-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html> (Intel
>         XE#2883 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2883>) +2 other tests fail
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-3/igt@kms_tv_load_detect@load-
>         detect.html> (Intel XE#330 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/330>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-8/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-a-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-lnl-3/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html> (Intel
>         XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) +1 other test fail
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-8/igt@kms_vrr@flip-basic.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         lnl-1/igt@kms_vrr@flip-basic.html> (Intel XE#2443 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +3 other
>         tests fail
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-433/igt@xe_copy_basic@mem-
>         copy-linear-0xfd.html> (Intel XE#1123 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-432/igt@xe_eudebug@basic-vm-
>         bind-metadata-discovery.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2 other
>         tests skip
>   *
> 
>     igt@xe_eudebug_online@resume-one:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-3/igt@xe_eudebug_online@resume-
>         one.html> (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2905>) +1 other test skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-3/igt@xe_evict@evict-beng-mixed-
>         threads-small-multi-vm.html> (Intel XE#688 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-
>         small.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-466/igt@xe_evict@evict-mixed-many-
>         threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) +1 other test
>         timeout
>   *
> 
>     igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-464/igt@xe_exec_balancer@no-exec-cm-parallel-
>         userptr-invalidate-race.html> -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-436/
>         igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-
>         race.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) +27 other tests skip
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-3/igt@xe_exec_basic@multigpu-no-
>         exec-bindexecqueue-userptr-rebind.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-434/
>         igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-
>         race.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/288>) +9 other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-433/
>         igt@xe_live_ktest@xe_bo.html> (Intel XE#2961 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2961>) +1 other test
>         timeout
>   *
> 
>     igt@xe_live_ktest@xe_eudebug:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-6/
>         igt@xe_live_ktest@xe_eudebug.html> (Intel XE#2833 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
>   *
> 
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-1/
>         igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@xe_oa@mmio-
>         triggered-reports.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +4 other
>         tests skip
>   *
> 
>     igt@xe_peer2peer@write:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-8/igt@xe_peer2peer@write.html>
>         (Intel XE#1061 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1061>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-435/igt@xe_pm@d3cold-mmap-
>         system.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1 other test skip
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-432/igt@xe_pm@s2idle-vm-
>         bind-unbind-all.html> (Intel XE#1694 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1694> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s3-basic:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@xe_pm@s3-basic.html> -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-432/igt@xe_pm@s3-basic.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@xe_pm@s4-mocs.html> -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-432/igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) +1 other test
>         abort
>   *
> 
>     igt@xe_pm@s4-multiple-execs:
> 
>       o shard-dg2-set2: NOTRUN -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-432/igt@xe_pm@s4-multiple-
>         execs.html> (Intel XE#1358 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1358> / Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-464/igt@xe_query@multigpu-
>         query-uc-fw-version-guc.html> (Intel XE#944 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3 other tests
>         skip
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@xe_wedged@basic-
>         wedged.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) +9 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_setmaster@master-drop-set-root:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@core_setmaster@master-drop-set-
>         root.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_11932/shard-dg2-435/igt@core_setmaster@master-drop-set-
>         root.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-offset-
>         overflow.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html> +1 other
>         test pass
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-
>         rotate-180-async-flip.html> (Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-
>         async-flip.html> +1 other test pass
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-
>         stride-64bpp-rotate-180-async-flip.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-
>         stride-64bpp-rotate-180-async-flip.html>
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8078/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html> (Intel XE#1195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
>         Intel XE#3113 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3113>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-
>         tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       o {shard-bmg}: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-
>         toggle.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-bmg-7/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>   *
> 
>     igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_cursor_legacy@long-nonblocking-
>         modeset-vs-cursor-atomic.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-dg2-435/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-
>         cursor-atomic.html> +12 other tests pass
>   *
> 
>     igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@kms_cursor_legacy@short-flip-before-
>         cursor-toggle.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-bmg-8/igt@kms_cursor_legacy@short-
>         flip-before-cursor-toggle.html> +13 other tests pass
>   *
> 
>     igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-4/igt@kms_flip@basic-flip-vs-wf_vblank.html>
>         (Intel XE#2882 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2882>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-bmg-7/igt@kms_flip@basic-flip-vs-
>         wf_vblank.html> +1 other test pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible.html> (Intel XE#301 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/301>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html> +4
>         other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-
>         hdmi-a6.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/301>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-466/igt@kms_flip@flip-vs-
>         expired-vblank@a-hdmi-a6.html>
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@c-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@c-
>         edp1.html> (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-lnl-8/igt@kms_flip@plain-flip-ts-
>         check@c-edp1.html> +4 other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-
>         to-32bpp-linear-upscaling.html> (Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-
>         linear-to-32bpp-linear-upscaling.html> +1 other test pass
>   *
> 
>     igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-2:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-lnl-6/igt@kms_plane@plane-position-hole-
>         dpms@pipe-a-plane-2.html> (Intel XE#324 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/324>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-
>         plane-2.html> +3 other tests pass
>   *
> 
>     igt@kms_plane@plane-position-hole@pipe-a-plane-4:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-
>         a-plane-4.html> (Intel XE#324 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/324>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-lnl-1/igt@kms_plane@plane-
>         position-hole@pipe-a-plane-4.html> +3 other tests pass
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-mid:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@kms_plane_alpha_blend@constant-alpha-
>         mid.html> (Intel XE#829 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/829>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-bmg-8/
>         igt@kms_plane_alpha_blend@constant-alpha-mid.html> +1 other test
>         pass
>   *
> 
>     igt@kms_pm_dc@dc5-dpms:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html> (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_pm_rpm@dpms-lpsp.html> (Intel
>         XE#2446 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2446>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-466/igt@kms_pm_rpm@dpms-lpsp.html>
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-
>         dpms.html> (Intel XE#1620 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1620> / Intel XE#2864 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2864>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         lnl-6/igt@kms_pm_rpm@universal-planes-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms@plane-77:
> 
>       o shard-lnl: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-lnl-4/igt@kms_pm_rpm@universal-planes-
>         dpms@plane-77.html> (Intel XE#1620 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         lnl-6/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html>
>   *
> 
>     igt@kms_prop_blob@basic:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@kms_prop_blob@basic.html> (Intel
>         XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-bmg-1/igt@kms_prop_blob@basic.html>
>   *
> 
>     igt@kms_psr@psr2-cursor-plane-onoff:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html>
>         (Intel XE#2948 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2948>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-
>         onoff.html> +3 other tests pass
>   *
> 
>     igt@kms_psr@psr2-dpms:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-8/igt@kms_psr@psr2-dpms.html> (Intel XE#1649
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-lnl-7/igt@kms_psr@psr2-dpms.html> +1 other test pass
>   *
> 
>     igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGT_8078/shard-dg2-436/igt@kms_vblank@wait-forked-busy-
>         hang@pipe-a-dp-4.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-4.html>
>         +1 other test pass
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html>
>         (Intel XE#2364 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2364>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-bmg-5/igt@xe_evict@evict-large-multi-vm-
>         cm.html>
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o {shard-bmg}: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-
>         small.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1473> / Intel XE#2472 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html> +1 other
>         test pass
>   *
> 
>     igt@xe_exec_compute_mode@once-userptr-invalidate:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-7/igt@xe_exec_compute_mode@once-userptr-
>         invalidate.html> (Intel XE#2754 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2754>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-lnl-8/
>         igt@xe_exec_compute_mode@once-userptr-invalidate.html> +1 other
>         test pass
>   *
> 
>     igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@xe_exec_compute_mode@twice-
>         bindexecqueue-userptr-invalidate.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-433/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-
>         invalidate.html> +15 other tests pass
>   *
> 
>     igt@xe_exec_threads@threads-rebind-bindexecqueue:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-lnl-6/igt@xe_exec_threads@threads-rebind-
>         bindexecqueue.html> (Intel XE#1169 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1169>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         lnl-4/igt@xe_exec_threads@threads-rebind-bindexecqueue.html>
>   *
> 
>     igt@xe_live_ktest@xe_migrate:
> 
>       o shard-lnl: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html> (Intel
>         XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1192>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-lnl-1/igt@xe_live_ktest@xe_migrate.html>
>   *
> 
>     igt@xe_module_load@reload-no-display:
> 
>       o {shard-bmg}: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@xe_module_load@reload-no-display.html>
>         -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-bmg-7/igt@xe_module_load@reload-no-display.html> +1 other
>         test pass
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
> 
>       o {shard-bmg}: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-
>         all.html> (Intel XE#1616 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1616>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-
>         unbind-all.html>
>   *
> 
>     igt@xe_pm@s3-multiple-execs:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8078/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html>
>         (Intel XE#1358 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1358> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-466/igt@xe_pm@s3-
>         multiple-execs.html>
>   *
> 
>     igt@xe_pm_residency@toggle-gt-c6:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html>
>         (Intel XE#958 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/958>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_11932/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html>
>   *
> 
>     igt@xe_spin_batch@spin-all:
> 
>       o {shard-bmg}: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-bmg-2/igt@xe_spin_batch@spin-all.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-bmg-2/igt@xe_spin_batch@spin-all.html> +26
>         other tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-
>         rotate-90.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-435/
>         igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-
>         overflow.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/607>)
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-
>         stride-64bpp-rotate-180-hflip.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-
>         mtl-rc-ccs.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-434/
>         igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) +1 other test skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-
>         ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/455> / Intel XE#787 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/787>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +1 other test skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-
>         lnl-ccs.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html> (Intel
>         XE#2907 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>   *
> 
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-
>         gen12-mc-ccs.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-
>         ccs.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2890>) +2 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-
>         ccs.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>)
>   *
> 
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-change-
>         during-suspend.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_chamelium_edid@hdmi-edid-change-during-
>         suspend.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-
>         pipe.html> (Intel XE#2423 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/373>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-32x10:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-434/igt@kms_cursor_crc@cursor-
>         onscreen-32x10.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_cursor_crc@cursor-onscreen-32x10.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x32:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_cursor_crc@cursor-
>         random-32x32.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>         -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-dg2-436/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-
>         before-cursor-atomic-transitions.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-
>         atomic-transitions.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-
>         bpc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-dg2-433/igt@kms_dsc@dsc-with-output-
>         formats-with-bpc.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-
>         interruptible.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank-
>         interruptible.html> (Intel XE#3149 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3149> / Intel XE#886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-
>         yftile-to-32bpp-yftile-downscaling.html> (Intel XE#455 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-
>         yftile-downscaling.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-
>         primscrn-spr-indfb-onoff.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-
>         scaledprimary.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-
>         scaledprimary.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +4 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-
>         y.html> (Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/658>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_11932/shard-dg2-436/
>         igt@kms_frontbuffer_tracking@fbc-tiling-y.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-
>         primscrn-shrfb-plflip-blt.html> (Intel XE#651 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/651>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-
>         plflip-blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test
>         skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-fullscreen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-
>         primscrn-spr-indfb-fullscreen.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-466/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-
>         fullscreen.html> (Intel XE#651 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/651>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-
>         primscrn-shrfb-msflip-blt.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-
>         msflip-blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-
>         indfb-scaledprimary.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html>
>         (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/653>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-slowdraw:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-
>         slowdraw.html> (Intel XE#653 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@psr-slowdraw.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +5
>         other tests skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_joiner@invalid-modeset-ultra-
>         joiner.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/igt@kms_joiner@invalid-
>         modeset-ultra-joiner.html> (Intel XE#2927 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-
>         update-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-
>         area.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_psr@fbc-psr2-suspend:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html> (Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@kms_psr@fbc-psr2-
>         suspend.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_psr@pr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-464/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@kms_psr@pr-sprite-
>         plane-onoff.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +1 other test skip
>   *
> 
>     igt@kms_psr@pr-sprite-render:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@kms_psr@pr-sprite-render.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/IGTPW_11932/shard-dg2-466/
>         igt@kms_psr@pr-sprite-render.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@xe_compute@ccs-mode-compute-kernel:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@xe_compute@ccs-mode-compute-
>         kernel.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@xe_compute@ccs-mode-
>         compute-kernel.html> (Intel XE#1050 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1050>)
>   *
> 
>     igt@xe_eudebug@discovery-empty:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-436/igt@xe_eudebug@discovery-
>         empty.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) +1 other test skip
>   *
> 
>     igt@xe_eudebug_online@debugger-reopen:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@xe_eudebug_online@debugger-
>         reopen.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-463/
>         igt@xe_eudebug_online@debugger-reopen.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1
>         other test skip
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-large:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-
>         large.html> (Intel XE#1000 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1000>) -> TIMEOUT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@xe_evict@evict-
>         mixed-many-threads-large.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-
>         bindexecqueue-userptr-invalidate.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/shard-
>         dg2-434/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         userptr-invalidate.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +3 other tests
>         skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@xe_exec_fault_mode@twice-
>         bindexecqueue-userptr-invalidate-race-imm.html> (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11932/
>         shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-
>         userptr-invalidate-race-imm.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +3 other
>         tests skip
>   *
> 
>     igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-435/igt@xe_oa@oa-unit-concurrent-oa-buffer-
>         read.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-435/igt@xe_oa@oa-unit-
>         concurrent-oa-buffer-read.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>   *
> 
>     igt@xe_oa@short-reads:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-463/igt@xe_oa@short-reads.html> (Intel
>         XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_11932/shard-dg2-436/igt@xe_oa@short-reads.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_pm@d3cold-multiple-execs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#2284 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2284> / Intel XE#366 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/366>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_11932/shard-dg2-436/igt@xe_pm@d3cold-
>         multiple-execs.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_query@multigpu-query-gt-list:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8078/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html>
>         (Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/944>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_11932/shard-dg2-436/igt@xe_query@multigpu-query-gt-
>         list.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_8078 -> IGTPW_11932
>   * Linux: xe-2075-81420006f741f9783adea6ab5620ce54697f1b20 ->
>     xe-2081-86151967bacde225a6052197245126a6264963f0
> 
> IGTPW_11932: 5db34e244795367c4f3dd12702442cbabfc76e40 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2075-81420006f741f9783adea6ab5620ce54697f1b20: 
> 81420006f741f9783adea6ab5620ce54697f1b20
> xe-2081-86151967bacde225a6052197245126a6264963f0: 
> 86151967bacde225a6052197245126a6264963f0
> 

