Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486B1C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 10:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C53310E7DA;
	Fri, 31 May 2024 10:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DzTsU+2a";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2E510E3CF;
 Fri, 31 May 2024 10:53:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4213373568dso235025e9.0; 
 Fri, 31 May 2024 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717152798; x=1717757598; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ehggOkxkuUPP6GFfxcA4mIporr2lxP7GkiVFE4Gipw4=;
 b=DzTsU+2aiPWDSqF7DPsElnvKTNiLIdEsjRsLaaxJ7CgIm+6bdVnsARLWK+S2PRY+3T
 uhWXjvVg778ohk3RwHK8kNIodAg4ZGN5wMbMJtkGOghtd+ertL/3wA75zvuEyR8olf/O
 TeHrBfDUnBOQf7TA2vk5ePdx4CJQCjnP8hEvE1kirJtk25F+5NB08f2WEZz5+1KEKhS1
 aPDtTt8iTWzJNsVIQsYsgzV8cjVYhdez+w3u+W8aZNd6vN2/8i3s+9SGeaAZfkLmo7XL
 6lrFiLKH6KaqTcyKpYy62rYAY3+HkiG3MWg8ZRx/RN4ZQjT5rMRAs7QiP/ILu+RZQ8uq
 3hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717152798; x=1717757598;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ehggOkxkuUPP6GFfxcA4mIporr2lxP7GkiVFE4Gipw4=;
 b=jvA4zmdY1MahTKrdRJFpJpbpyRGjKq6JmbiglHTSkVNulZoA+s4f/PcJDJkwKh2c4B
 hbLX8Y2TfEpkhUln5avwUWuEFw3TVJDt/XOb8uwrthJWMhTVQjL58jUZ1Ww2e6JA+qyf
 szC9mXsIYysU5MNhp/54Q+BMjRBax65JPMawEbsEo/ppWVKxXSPSdPY5PhfJXLSr9UUu
 cxXoXLxJUgGAp9FbfRPJIyWA82z6niEoV2pISyHY8ugUqoOUwunHuy4NFvQMtb/E6mit
 kdBwtcJB0vUXoQOUUJ/TBUeVxD0SZbC7TiNFXMd3x/tNP51Z32oM6JRzDpKVTbX7L4I9
 I0HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF7timuaavChCrQxqzqprGhhHMhMe4tjD8VdRet/KVZ4Pp1Wh0ZEB2RZIRwmUiQe976v+Y6aNRh3stF+CD2ir/mZYyWsN894hSrCwhCb8d0TlF7A==
X-Gm-Message-State: AOJu0YzGDt2tVy06CKu3KB3xCUpusOUorhPEUA5U8B5766SkXRUijIz1
 8xLb44lqJQw7A6GneD158JtoDhZ2SV2PAtZ9xpSX/5ryqm3EIA8zkoUuSgfj
X-Google-Smtp-Source: AGHT+IFiGo1xfUjR0ET6jh6+exO0SXJ6sOBNHFnexiYCKUuLe7UxbPfND/B6ZpnrfxhhIVga0GFaZw==
X-Received: by 2002:a05:600c:b91:b0:420:1a3:dd04 with SMTP id
 5b1f17b1804b1-4212e076950mr12655165e9.24.1717152797523; 
 Fri, 31 May 2024 03:53:17 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.77])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4212709d336sm51593395e9.37.2024.05.31.03.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 03:53:17 -0700 (PDT)
Message-ID: <f0e98d92-7a96-46e1-b495-e505eaf6d68f@gmail.com>
Date: Fri, 31 May 2024 13:53:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBDSS54ZUZVTEw6IGZhaWx1cmUgZm9yIGxpYi9pZ3RfZmI6?=
 =?UTF-8?Q?_Mark_Xe_framebuffers_as_slow_access_=28rev2=29?=
To: igt-dev@lists.freedesktop.org,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20240527131747.1340992-1-juhapekka.heikkila@gmail.com>
 <171702232629.2236029.14406282596674932099@8e613ede5ea5>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <171702232629.2236029.14406282596674932099@8e613ede5ea5>
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

I don't see any of these xe or i915 failures relating to my change. Here 
is just changed at what moment framebuffer content is sent to graphics 
memory.

/Juha-Pekka

On 30.5.2024 1.38, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/igt_fb: Mark Xe framebuffers as slow access (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/134081/ 
> <https://patchwork.freedesktop.org/series/134081/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_7873_full -> XEIGTPW_11204_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_11204_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_11204_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (3 -> 2)
> 
> Missing (1): shard-adlp
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_11204_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_flip@flip-vs-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html> +3 other tests incomplete
>   *
> 
>     igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html> +3 other tests fail
>   *
> 
>     {igt@xe_query} (NEW):
> 
>       o {shard-lnl}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-lnl-1/igt@xe_query.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>       o {shard-lnl}: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr.html> +1 other test incomplete
> 
> 
>     New tests
> 
> New tests have been introduced between XEIGT_7873_full and 
> XEIGTPW_11204_full:
> 
> 
>       New IGT tests (1)
> 
>   * igt@xe_query:
>       o Statuses : 1 incomplete(s)
>       o Exec time: [0.0] s
> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_11204_full that come from known 
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
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#623 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/623>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#801 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/801>) +23 other tests skip
>   *
> 
>     igt@kms_async_flips@invalid-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#873 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
>   *
> 
>     igt@kms_async_flips@test-cursor:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_async_flips@test-cursor.html> (Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +3 other tests dmesg-warn
>   *
> 
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html> (Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#316 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +21 other tests skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#607 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#610 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +57 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html> (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#619 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>) +1 other test skip
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_big_joiner@basic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#346 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-4-displays-2160x1440p:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +15 other tests skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html> (Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1252 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252>) +4 other tests skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +433 other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +123 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-c-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#314 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +4 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html> (Intel XE#1152 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-red-to-blue:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#306 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +9 other tests skip
>   *
> 
>     igt@kms_chamelium_frames@vga-frame-dump:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html> (Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#373 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +53 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>) +3 other tests skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html> (Intel XE#307 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html> (Intel XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +7 other tests fail
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@kms_content_protection@lic-type-0.html> (Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>) +1 other test fail
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@kms_content_protection@uevent.html> (Intel XE#1188 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1 other test fail
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#308 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +8 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#323 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>) +5 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282>) +47 other tests dmesg-warn
>   *
> 
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#282 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/282> / Intel XE#910 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/910>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1927 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#3804 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>   *
> 
>     igt@kms_fbcon_fbt@psr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_fbcon_fbt@psr.html> (Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#776 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@kms_feature_discovery@chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#701 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/701>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_feature_discovery@display-3x.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#703 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
>   *
> 
>     igt@kms_feature_discovery@dp-mst:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html> (Intel XE#1137 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_feature_discovery@psr1.html> (Intel XE#1135 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3 other tests skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +164 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +167 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html> (Intel XE#1158 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#605 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/605>)
>   *
> 
>     igt@kms_hdmi_inject@inject-audio:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#417 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/417>)
>   *
> 
>     igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html> (Intel XE#616 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +17 other tests fail
>   *
> 
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#356 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>   *
> 
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162>) +3 other tests dmesg-fail
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> (Intel XE#361 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) +1 other test fail
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +8 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> / Intel XE#498 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/498>) +5 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-d-hdmi-a-6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test incomplete
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +10 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#305 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/305>) +20 other tests skip
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html> (Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-suspend:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#870 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +3 other tests skip
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html> (Intel XE#1129 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#908 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>   *
> 
>     igt@kms_psr2_su@page_flip-nv12:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html> (Intel XE#1122 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +4 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html> (Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +7 other tests skip
>   *
> 
>     igt@kms_psr@psr-dpms:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_psr@psr-dpms.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +102 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html> (Intel XE#1149 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@kms_rmfb@close-fd:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_rmfb@close-fd.html> (Intel XE#294 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/294>) +2 other tests fail
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>) +9 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (Intel XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html> (Intel XE#327 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html> (Intel XE#1729 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>   *
> 
>     igt@kms_tv_load_detect@load-detect:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>   *
> 
>     igt@kms_vrr@flipline:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@kms_vrr@flipline.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +101 other tests skip
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html> (Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#756 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +4 other tests skip
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091>)
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-on.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +2 other tests skip
>   *
> 
>     igt@xe_compute@ccs-mode-compute-kernel:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html> (Intel XE#1050 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050>) +1 other test fail
>   *
> 
>     igt@xe_compute_preempt@compute-preempt:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1280 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> / Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +5 other tests skip
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfd:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>   *
> 
>     igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html> (Intel XE#1123 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +1 other test skip
>   *
> 
>     igt@xe_copy_basic@mem-set-linear-0xfffe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html> (Intel XE#1126 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126> / Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201>) +3 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html> (Intel XE#1041 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041> / Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) +1 other test timeout
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-large-multi-vm-cm:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html> (Intel XE#1600 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-dg2-set2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel XE#392 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/392>) +2 other tests timeout
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-prefetch.html> (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +6 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +140 other tests skip
>   *
> 
>     igt@xe_exec_reset@gt-reset-stress:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1638 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638>)
>   *
> 
>     igt@xe_gt_freq@freq_low_max:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@xe_gt_freq@freq_low_max.html> (Intel XE#1045 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045> / Intel XE#1204 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204>)
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@xe_huc_copy@huc_copy.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#255 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/255>)
>   *
> 
>     igt@xe_media_fill@media-fill:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@xe_media_fill@media-fill.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#560 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/560>)
>   *
> 
>     igt@xe_mmap@small-bar:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@xe_mmap@small-bar.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#512 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>   *
> 
>     igt@xe_module_load@force-load:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-463/igt@xe_module_load@force-load.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#378 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>) +1 other test skip
>   *
> 
>     igt@xe_pat@display-vs-wb-transient:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#1337 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337>)
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@xe_pat@pat-index-xe2.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>) +1 other test skip
>   *
> 
>     igt@xe_peer2peer@read:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@xe_peer2peer@read.html> (Intel XE#1173 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +3 other tests fail
>   *
> 
>     igt@xe_pm@d3cold-basic:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@xe_pm@d3cold-basic.html> (Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-vram:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#366 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +6 other tests skip
>   *
> 
>     igt@xe_pm@s3-vm-bind-unbind-all:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1941 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941>)
>   *
> 
>     igt@xe_pm@s3-vm-bind-userptr:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html> (Intel XE#1162 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162> / Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214>) +8 other tests dmesg-warn
>   *
> 
>     igt@xe_pm@vram-d3cold-threshold:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#579 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>   *
> 
>     igt@xe_query@multigpu-query-engines:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-464/igt@xe_query@multigpu-query-engines.html> (Intel XE#1201 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201> / Intel XE#944 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +14 other tests skip
>   *
> 
>     igt@xe_wedged@basic-wedged:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-434/igt@xe_wedged@basic-wedged.html> (Intel XE#1214 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214> / Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
>   *
> 
>     igt@xe_wedged@wedged-at-any-timeout:
> 
>       o shard-dg2-set2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html> (Intel XE#1760 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760>)
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7873/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html> (Intel XE#718 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html>
>   *
> 
>     igt@kms_psr@fbc-psr2-suspend:
> 
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7873/shard-lnl-4/igt@kms_psr@fbc-psr2-suspend.html> (Intel XE#1830 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-lnl-5/igt@kms_psr@fbc-psr2-suspend.html> +2 other tests pass
>   *
> 
>     igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
> 
>       o {shard-lnl}: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7873/shard-lnl-5/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html> (Intel XE#1330 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html>
>   *
> 
>     igt@xe_exec_fault_mode@invalid-va:
> 
>       o {shard-lnl}: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7873/shard-lnl-1/igt@xe_exec_fault_mode@invalid-va.html> (Intel XE#1488 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11204/shard-lnl-5/igt@xe_exec_fault_mode@invalid-va.html>
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * IGT: IGT_7873 -> IGTPW_11204
>   * Linux: xe-1353-abaeae202dfb4e361edd660a124e22178340725d ->
>     xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1
> 
> IGTPW_11204: 64410420f89e0bfe6f4df4e207507192a8714de4 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-1353-abaeae202dfb4e361edd660a124e22178340725d: 
> abaeae202dfb4e361edd660a124e22178340725d
> xe-1374-55d6179b96e0390025f2ba101c03b94b50cab7a1: 
> 55d6179b96e0390025f2ba101c03b94b50cab7a1
> 

