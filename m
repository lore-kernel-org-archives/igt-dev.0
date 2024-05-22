Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29596C25B77
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 09:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EAF10E080;
	Wed, 22 May 2024 09:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gC8rydto";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A6D10E2F7;
 Wed, 22 May 2024 09:30:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4202c0d316cso3833975e9.1; 
 Wed, 22 May 2024 02:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716370221; x=1716975021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BBYGGwJILkCI01DCndKJ7+hQZaymCdvUJC//S62AwSI=;
 b=gC8rydto9mTuk3Wu26c7JZPjpMVzODpVE9cJQqyGKVOX9aPCk8KtQY37Nlh+9M6o8G
 uqnie3UPAUx5y2yaTKhJKnavCGU2A+UNNlwk1f/O0ZvdSqRmH2C8pj7S1tVjm5sxeTRt
 CXJT2RUOsafLRWmw5+srQxhJRqU8Dq2jeoepVSSsjw7OE9te9/8F+P/iBlRZt8WBD/9H
 hFscWoq4c9Xnrs8yupK+AAjyj9bheteL/RwJszSI077QGgkGS3T9Gs4D0v29pC8NDByE
 UF8ZYOmolc/3hrUlRWU3QnTTding6rW8tG/BKLyuhtYNZmdLDgPw3AypjWen9b+LXOzE
 vhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716370221; x=1716975021;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BBYGGwJILkCI01DCndKJ7+hQZaymCdvUJC//S62AwSI=;
 b=qUjBs/KHiNNwK47nVC2EcelnvSeRpHaSeXzIAxvu64cqayArUf0TfubAMxyvJIh88A
 IS5YKBKQxRVXjeNsxoilFRNk+5LPYgxZN5sdIG/cjA9KmPyRecdydWOgWCYBokHyc/zQ
 9XwldR2ACaglgFYWmeAR4hM9JkhfcaCSfNZzMJGh+hIhoW5U0ObpZ14JHh0p9K8qP6nl
 Ngk8KKkHL6ea6PTYa3PXAGV6cFiCpH5Xm3hRm3/p/OVx/HrjPJ9snZNMtmh2b+WC9IHZ
 nwtuOplTR9wFYGVhgMIXeCdoi1CNBpGxq7RZ4wlZPFSklGQxrgkOe4vUEm5KQBqdYpu0
 T8Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKzNfBGnJ+Evqu9V8BQMIhl+LY/P0WTAiw1aIIkYclD5hiSkVGAksYn06Nn1/bJL3WWVzTG8scOek+9MrrMp441hjClAxFxjd4lDuB7IPogVQMvA==
X-Gm-Message-State: AOJu0Yw0DNLFBuE5OuoEb8bYu5HWNsg8yUPSOR8J98vJ9ipMFf00KJf2
 F5m3BqbP0LtGAGSVO0BCGtGhPTnaDigCRRBZJmokN4id1J+m89WootdEWZckfxE=
X-Google-Smtp-Source: AGHT+IEOwqwr5F4AF/HcPqe6CG8WtTfod04MhfQ721vaV8zvPDtYlrMOXDxCl5t8wFlUh0OUOaqd0g==
X-Received: by 2002:a05:600c:1f84:b0:41a:4623:7ee9 with SMTP id
 5b1f17b1804b1-420e19e5b9emr98619395e9.10.1716370219712; 
 Wed, 22 May 2024 02:30:19 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.137.87])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-41ffd56e4f1sm448276415e9.0.2024.05.22.02.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 02:30:19 -0700 (PDT)
Message-ID: <f1728a3f-5833-4108-b4ae-50877c477425@gmail.com>
Date: Wed, 22 May 2024 12:30:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19w?=
 =?UTF-8?Q?lane=5Fscaling=3A_reduce_unnecessary_work?=
To: igt-dev@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20240521123041.1119357-1-juhapekka.heikkila@gmail.com>
 <171635695121.2165803.15159327448051025559@8e613ede5ea5>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <171635695121.2165803.15159327448051025559@8e613ede5ea5>
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

Those listed regressions have nothing to do with my change. My change 
touch only kms_plane_scaling tests and nothing else.

/Juha-Pekka

On 22.5.2024 8.49, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_plane_scaling: reduce unnecessary work
> *URL:*	https://patchwork.freedesktop.org/series/133878/ 
> <https://patchwork.freedesktop.org/series/133878/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7865_full -> IGTPW_11170_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11170_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11170_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/index.html
> 
> 
>     Participating hosts (9 -> 10)
> 
> Additional (1): shard-snb-0
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_11170_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk8/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-hdmi-a-1.html>
>   *
> 
>     igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a4:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-17/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a4.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a4.html>
>   *
> 
>     igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-edp-1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-mtlp-3/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-d-edp-1.html> +1 other test fail
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11170_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@blit-reloc-keep-cache:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@api_intel_bb@blit-reloc-keep-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@debugfs_test@basic-hwmon:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>   *
> 
>     igt@device_reset@cold-reset-bound:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-5/igt@device_reset@cold-reset-bound.html> (i915#11078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>   *
> 
>     igt@device_reset@unbind-reset-rebind:
> 
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-5/igt@device_reset@unbind-reset-rebind.html> (i915#5507 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5507>)
>       o shard-dg1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html> (i915#11164 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11164>)
>   *
> 
>     igt@drm_fdinfo@busy-idle@bcs0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +6 other tests skip
>   *
> 
>     igt@drm_fdinfo@idle@rcs0:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@drm_fdinfo@idle@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>)
>   *
> 
>     igt@drm_fdinfo@virtual-busy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@drm_fdinfo@virtual-busy.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>   *
> 
>     igt@gem_ccs@block-copy-compressed:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_ccs@block-multicopy-compressed:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@gem_ccs@block-multicopy-compressed.html> (i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-threads:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268>)
>   *
> 
>     igt@gem_ctx_persistence@engines-hostile-preempt:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb5/igt@gem_ctx_persistence@engines-hostile-preempt.html> (i915#1099 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>) +1 other test skip
>   *
> 
>     igt@gem_ctx_sseu@engines:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-3/igt@gem_ctx_sseu@engines.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_ctx_sseu@invalid-sseu:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@gem_ctx_sseu@invalid-sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-3/igt@gem_eio@kms.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-5/igt@gem_eio@kms.html> (i915#10513 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513>)
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-17/igt@gem_eio@unwedge-stress.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_eio@unwedge-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>   *
> 
>     igt@gem_exec_balancer@hog:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@gem_exec_balancer@hog.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +6 other tests skip
>   *
> 
>     igt@gem_exec_capture@capture-invisible@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@gem_exec_capture@capture-invisible@lmem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@gem_exec_capture@capture-invisible@smem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>   *
> 
>     igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-3/igt@gem_exec_capture@capture@vecs0-lmem0.html> (i915#10386 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10386>) +3 other tests fail
>   *
> 
>     igt@gem_exec_capture@many-4k-zero:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb2/igt@gem_exec_capture@many-4k-zero.html> +29 other tests skip
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_exec_capture@many-4k-zero.html> (i915#9606 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9606>)
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@gem_exec_capture@many-4k-zero.html> (i915#9606 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9606>)
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@gem_exec_fair@basic-deadline.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +3 other tests skip
>   *
> 
>     igt@gem_exec_fair@basic-none-solo@rcs0:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-9/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@gem_exec_fair@basic-pace-solo.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-5/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_flush@basic-uc-pro-default:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-1/igt@gem_exec_flush@basic-uc-pro-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +3 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-concurrent0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_exec_reloc@basic-concurrent0.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +11 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +1 other test skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +11 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-write-read-active:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-1/igt@gem_exec_reloc@basic-write-read-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +4 other tests skip
>   *
> 
>     igt@gem_exec_schedule@preempt-queue-chain:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-chain.html> (i915#4537 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-8/igt@gem_fenced_exec_thrash@2-spare-fences.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-3/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_fenced_exec_thrash@too-many-fences:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@gem_fenced_exec_thrash@too-many-fences.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_lmem_swapping@basic@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-7/igt@gem_lmem_swapping@basic@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@gem_lmem_swapping@basic@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>) +1 other test fail
>   *
> 
>     igt@gem_lmem_swapping@heavy-multi@lmem0:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@gem_lmem_swapping@heavy-multi@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-random:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-4/igt@gem_lmem_swapping@heavy-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +2 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>   *
> 
>     igt@gem_lmem_swapping@smem-oom:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk5/igt@gem_lmem_swapping@smem-oom.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +1 other test skip
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg1: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +5 other tests skip
>   *
> 
>     igt@gem_mmap@basic-small-bo:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@gem_mmap@basic-small-bo.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +2 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@basic-write-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-3/igt@gem_mmap_gtt@basic-write-gtt.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +5 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@cpuset-medium-copy-odd:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-5/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +2 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-prefaulted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-10/igt@gem_mmap_wc@write-prefaulted.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +3 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-read:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_mmap_wc@write-read.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +7 other tests skip
>   *
> 
>     igt@gem_partial_pwrite_pread@write:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@gem_partial_pwrite_pread@write.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +1 other test skip
>   *
> 
>     igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +6 other tests skip
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +2 other tests skip
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>   *
> 
>     igt@gem_pxp@verify-pxp-stale-ctx-execution:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@gem_pxp@verify-pxp-stale-ctx-execution.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other test skip
>   *
> 
>     igt@gem_readwrite@read-write:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@gem_readwrite@read-write.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +2 other tests skip
>   *
> 
>     igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-10/igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190> / i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +3 other tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-2/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html> (i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +1 other test skip
>   *
> 
>     igt@gem_set_tiling_vs_blt@tiled-to-tiled:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +8 other tests skip
>   *
> 
>     igt@gem_userptr_blits@coherency-unsync:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@gem_userptr_blits@coherency-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-2/igt@gem_userptr_blits@forbidden-operations.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@sd-probe:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@gem_userptr_blits@sd-probe.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4958 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +2 other tests skip
>   *
> 
>     igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@gem_userptr_blits@unsync-unmap-after-close.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gen7_exec_parse@basic-rejected:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-1/igt@gen7_exec_parse@basic-rejected.html> +10 other tests skip
>   *
> 
>     igt@gen9_exec_parse@batch-zero-length:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@gen9_exec_parse@batch-zero-length.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-secure:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@gen9_exec_parse@bb-secure.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +3 other tests skip
>   *
> 
>     igt@gen9_exec_parse@bb-start-cmd:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-7/igt@gen9_exec_parse@bb-start-cmd.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@secure-batches:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-3/igt@gen9_exec_parse@secure-batches.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>   *
> 
>     igt@i915_module_load@resize-bar:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@i915_module_load@resize-bar.html> (i915#6412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412>)
>   *
> 
>     igt@i915_pm_freq_api@freq-reset-multiple:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-5/igt@i915_pm_freq_api@freq-reset-multiple.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-6/igt@i915_pm_freq_api@freq-reset-multiple.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>   *
> 
>     igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
> 
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591>)
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>) +1 other test skip
>   *
> 
>     igt@i915_pm_sseu@full-enable:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-5/igt@i915_pm_sseu@full-enable.html> (i915#8437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437>)
>   *
> 
>     igt@i915_query@hwconfig_table:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@i915_query@hwconfig_table.html> (i915#6245 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215>)
>   *
> 
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (i915#3826 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3826>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +7 other tests skip
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +11 other tests skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-3/igt@kms_big_fb@4-tiled-addfb.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#2017 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2017>)
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-3/igt@kms_big_fb@linear-64bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_big_fb@linear-64bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> +8 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +4 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html> +54 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +7 other tests skip
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@kms_big_joiner@basic.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>) +1 other test skip
>   *
> 
>     igt@kms_big_joiner@invalid-modeset:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-5/igt@kms_big_joiner@invalid-modeset.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_big_joiner@invalid-modeset-force-joiner:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@kms_big_joiner@invalid-modeset-force-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +6 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +59 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-edp-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +11 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +31 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html> (i915#10278 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278>) +1 other test skip
>   *
> 
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +176 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +99 other tests skip
>   *
> 
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html> (i915#7213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213>) +3 other tests skip
>   *
> 
>     igt@kms_cdclk@plane-scaling:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_cdclk@plane-scaling.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>) +1 other test skip
>   *
> 
>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html> (i915#4087 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087>) +3 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-resolution-list:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-resolution-list.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +5 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +10 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-fast:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +11 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-10/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +3 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-7/igt@kms_content_protection@atomic.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@content-type-change:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_content_protection@content-type-change.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_content_protection@dp-mst-lic-type-1.html> (i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html> (i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-6/igt@kms_content_protection@lic-type-1.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_content_protection@mei-interface.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +2 other tests skip
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-10/igt@kms_content_protection@srm.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-7/igt@kms_content_protection@srm.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>   *
> 
>     igt@kms_content_protection@type1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_content_protection@type1.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-1/igt@kms_content_protection@type1.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@uevent:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_content_protection@uevent.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html> (i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-32x32:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x170:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html> (i915#9809 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>) +3 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>   *
> 
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html> (i915#9067 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@torture-bo@pipe-a:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-snb6/igt@kms_cursor_legacy@torture-bo@pipe-a.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb2/igt@kms_cursor_legacy@torture-bo@pipe-a.html> (i915#10166 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166>)
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@kms_cursor_legacy@torture-bo@pipe-a.html> (i915#10166 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166>)
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9833 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-11/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html> (i915#9227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9227>)
>   *
> 
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html> (i915#9833 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>   *
> 
>     igt@kms_display_modes@mst-extended-mode-negative:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-1/igt@kms_display_modes@mst-extended-mode-negative.html> (i915#8588 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8588>)
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-gtt.html> (i915#8812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>) +1 other test skip
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-3/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_fbcon_fbt@psr-suspend:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_fbcon_fbt@psr-suspend.html> (i915#3469 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@kms_feature_discovery@chamelium.html> (i915#4854 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-6/igt@kms_feature_discovery@display-4x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-9/igt@kms_feature_discovery@psr2.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +6 other tests skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_flip@2x-plain-flip.html> +50 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb7/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>)
>   *
> 
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +6 other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html> +48 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +23 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +8 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +33 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (i915#9766 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (i915#9766 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (i915#9766 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +13 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html> (i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +31 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +7 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@kms_getfb@getfb-reject-ccs.html> (i915#6118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6118>)
>   *
> 
>     igt@kms_hdr@invalid-metadata-sizes:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@kms_hdr@invalid-metadata-sizes.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +1 other test skip
>   *
> 
>     igt@kms_hdr@static-toggle-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@kms_hdr@static-toggle-dpms.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_panel_fitting@legacy.html> (i915#6301 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk7/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html> (i915#7862 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862>) +1 other test fail
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html> (i915#10647 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>) +1 other test fail
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-1/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-2.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +9 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +15 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-1.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +9 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +6 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-d-edp-1.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>)
>   *
> 
>     igt@kms_pm_backlight@basic-brightness:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-1/igt@kms_pm_backlight@basic-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +1 other test skip
>   *
> 
>     igt@kms_pm_backlight@fade:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-5/igt@kms_pm_backlight@fade.html> (i915#9812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_pm_backlight@fade-with-dpms.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_pm_dc@dc6-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>   *
> 
>     igt@kms_pm_dc@dc9-dpms:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_pm_dc@dc9-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +1 other test skip
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_prime@basic-modeset-hybrid:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-14/igt@kms_prime@basic-modeset-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-6/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf@psr2-pipe-b-edp-1.html> (i915#9808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>) +1 other test skip
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_psr2_su@page_flip-p010.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>) +1 other test skip
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_psr2_su@page_flip-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-4/igt@kms_psr2_su@page_flip-xrgb8888.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>   *
> 
>     igt@kms_psr@fbc-pr-cursor-plane-onoff:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@kms_psr@fbc-psr-primary-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk7/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html> +281 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +26 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-7/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html> (i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>) +5 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +17 other tests skip
>   *
> 
>     igt@kms_psr@pr-sprite-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-11/igt@kms_psr@pr-sprite-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>   *
> 
>     igt@kms_psr@psr2-cursor-plane-onoff@edp-1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-mtlp-4/igt@kms_psr@psr2-cursor-plane-onoff@edp-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-7/igt@kms_psr@psr2-cursor-plane-onoff@edp-1.html> (i915#10105 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10105>)
>   *
> 
>     igt@kms_psr@psr2-primary-mmap-gtt@edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-7/igt@kms_psr@psr2-primary-mmap-gtt@edp-1.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077> / i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-14/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-270.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_scaling_modes@scaling-mode-center.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +8 other tests skip
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>) +1 other test skip
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-4.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_vrr@flip-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_vrr@flip-basic-fastset:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1 other test skip
>   *
> 
>     igt@kms_vrr@max-min:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@kms_vrr@max-min.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-4/igt@kms_vrr@max-min.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-5/igt@kms_vrr@max-min.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808> / i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>   *
> 
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-14/igt@kms_writeback@writeback-check-output-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@kms_writeback@writeback-pixel-formats.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@perf@mi-rpc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@perf@mi-rpc.html> (i915#2434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>   *
> 
>     igt@perf@unprivileged-single-ctx-counters:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-4/igt@perf@unprivileged-single-ctx-counters.html> (i915#2433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>   *
> 
>     igt@perf_pmu@cpu-hotplug:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-4/igt@perf_pmu@cpu-hotplug.html> (i915#8850 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850>)
>   *
> 
>     igt@perf_pmu@module-unload:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-6/igt@perf_pmu@module-unload.html> (i915#10537 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10537> / i915#5793 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5793>)
>   *
> 
>     igt@perf_pmu@rc6@other-idle-gt0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@perf_pmu@rc6@other-idle-gt0.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>   *
> 
>     igt@prime_vgem@basic-fence-read:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@basic-read:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-5/igt@prime_vgem@basic-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@fence-flip-hang:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@prime_vgem@fence-read-hang:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-8/igt@prime_vgem@fence-read-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@runner@aborted:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-glk1/igt@runner@aborted.html> (i915#10291 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10291>)
>   *
> 
>     igt@sriov_basic@bind-unbind-vf:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-11/igt@sriov_basic@enable-vfs-autoprobe-off.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-5/igt@syncobj_timeline@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-6/igt@syncobj_timeline@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
>   *
> 
>     igt@v3d/v3d_submit_cl@job-perfmon:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@v3d/v3d_submit_cl@job-perfmon.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +14 other tests skip
>   *
> 
>     igt@v3d/v3d_submit_cl@valid-submission:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-8/igt@v3d/v3d_submit_cl@valid-submission.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +3 other tests skip
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-pad:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@v3d/v3d_submit_csd@bad-pad.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +10 other tests skip
>   *
> 
>     igt@v3d/v3d_submit_csd@job-perfmon:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-8/igt@v3d/v3d_submit_csd@job-perfmon.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +6 other tests skip
>   *
> 
>     igt@vc4/vc4_label_bo@set-label:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-6/igt@vc4/vc4_label_bo@set-label.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +11 other tests skip
>   *
> 
>     igt@vc4/vc4_perfmon@create-perfmon-exceed:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-2/igt@vc4/vc4_perfmon@create-perfmon-exceed.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +1 other test skip
>   *
> 
>     igt@vc4/vc4_perfmon@destroy-invalid-perfmon:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@vc4/vc4_perfmon@destroy-invalid-perfmon.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +5 other tests skip
>   *
> 
>     igt@vc4/vc4_wait_bo@bad-pad:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@vc4/vc4_wait_bo@bad-pad.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +6 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-rkl-1/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-tglu: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-7/igt@i915_module_load@reload-with-fault-injection.html> (i915#10047 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047> / i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9697>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@i915_pm_rps@reset:
> 
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-snb6/igt@i915_pm_rps@reset.html> (i915#7790 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7790>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb6/igt@i915_pm_rps@reset.html>
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html> (i915#10991 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-1.html>
>   *
> 
>     igt@kms_color@ctm-signed@pipe-d:
> 
>       o shard-tglu: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-3/igt@kms_color@ctm-signed@pipe-d.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-9/igt@kms_color@ctm-signed@pipe-d.html>
>   *
> 
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-17/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-15/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a4.html> +1 other test pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html>
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html> (i915#9295 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-2/igt@kms_pm_dc@dc6-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>   *
> 
>     igt@kms_setmode@basic@pipe-a-hdmi-a-1:
> 
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-snb7/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html> (i915#5465 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb7/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html> +1 other test pass
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-tglu-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html>
>   *
> 
>     igt@syncobj_wait@single-wait-signaled:
> 
>       o shard-dg1: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-16/igt@syncobj_wait@single-wait-signaled.html> (i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@syncobj_wait@single-wait-signaled.html> +2 other tests pass
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_create@create-ext-cpu-access-big:
> 
>       o shard-dg2: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html> (i915#9846 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9846>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html> (i915#9364 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9364>)
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-6/igt@gem_eio@kms.html> (i915#5784 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@gem_eio@kms.html> (i915#10513 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513> / i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>)
>   *
> 
>     igt@gem_lmem_swapping@verify-random-ccs@lmem0:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html> (i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423> / i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-dg1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html> (i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982> / i915#9849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-17/igt@i915_module_load@reload-with-fault-injection.html> (i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820> / i915#9849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849>)
>   *
> 
>     igt@kms_content_protection@mei-interface:
> 
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-snb4/igt@kms_content_protection@mei-interface.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-snb7/igt@kms_content_protection@mei-interface.html> (i915#9878 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878>)
>   *
> 
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-16/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html> (i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423> / i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-13/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html> (i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +2 other tests skip
>   *
> 
>     igt@kms_psr@fbc-pr-suspend:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-11/igt@kms_psr@fbc-pr-suspend.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-4/igt@kms_psr@fbc-pr-suspend.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +10 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg1-16/igt@kms_psr@fbc-psr-primary-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg1-18/igt@kms_psr@fbc-psr-primary-mmap-gtt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>   *
> 
>     igt@kms_psr@psr-cursor-render:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7865/shard-dg2-8/igt@kms_psr@psr-cursor-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11170/shard-dg2-11/igt@kms_psr@psr-cursor-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +11 other tests skip
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7865 -> IGTPW_11170
> 
> CI-20190529: 20190529
> CI_DRM_14789: eaa059c9aa97ac2493cb2547c81962abdfab2176 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11170: e722d91b693d8fff0e074327fdef731ef05644fa @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7865: 3578243d16f1ea5055f7baa0b1fe7f520538c4ab @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 

