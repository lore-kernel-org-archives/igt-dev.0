Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473CCC25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFE810E2DB;
	Mon,  3 Jun 2024 07:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KkEj/U29";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABC510E245;
 Mon,  3 Jun 2024 07:21:11 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42134bb9677so21961555e9.2; 
 Mon, 03 Jun 2024 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717399269; x=1718004069; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=X5uhfTjejO84vGVuXLKSMiccfwup2WZs0gELz+1ty94=;
 b=KkEj/U29bklKW4BxVuhVp8AD9ZqikLbJHONqJGLE9nSSFD9A8XEMzkHZXPOn/s41ae
 R/S/bhwSc9kjxpExdjHmGI0+NpvdleUcPi0Yg0gpKU93o6YkhVspMfW1eQpOp/V63vSI
 j1lancZAco2AKZBYWOXGEhGj5IiOe2RBtpnE8ZREfCZHVmx+tvnS/fCiouqmZdch6rOv
 y0Kv5yFr7mlQSYxGhT/CKfAjEj+ivVT2nfe9GGadjgx1YT0lCahQKfLf9ruMUN/3Loi8
 kSk0xMboXMuIVCHPVH8o1g9gmClKBmw0n6dnTGRm4Pjjbo2AuPOAHbX62ZmQ0/OMGzeB
 E9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717399269; x=1718004069;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5uhfTjejO84vGVuXLKSMiccfwup2WZs0gELz+1ty94=;
 b=tJPNICUCV8bFwDeV9BSqquf7zPYGF+NvZ+jRv6MthkWimCkHOQmfVGmOghv8IH2Kls
 9DMM/0YEpzcIIVkmlcu53ObYw/hrytXsBGgiMrkHsDWEJC/fRwQdsoRmZ7KWo9U+dEaA
 3yqci3BdUockpQ8iBMdAKMMfUUQU0bF9bNxkgrHg8nbv0cwxU0H0Tu/heBo0f+/c5goC
 1J1BWFSFgiOLVCD4ghYNrHArsVpgoKNJSSj2yTTXzm36xE+WZbE2bemKnZhZV85iwS3v
 063B0LSuZVHdTLNT1yMYO1+ogB2au+lCq6Ws74i5Xc6BIIigUth5cG/StkFppoTZRoz2
 56yA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULmdw+v02UFJrTVV2rjqS/+yWvYC9DFDy/mZdn1SOz2ZjPqBaOUzPIxiXF/IYKdBV2Q6EuHFfiwkHgfJeLaIkbkTmc4WzH1W/D/ZpJtuEgIIcTww==
X-Gm-Message-State: AOJu0Yzj/4vKUjFSjBLmvSeOUjp1n4goww8UJe0erYpZdPx0PC5A0USN
 PQKUy96X+jcB4tB4cI0GLRLK+rcVCgHhO88Gmkv/LDXwfMHiHF8Zc6yGDbGuSLM=
X-Google-Smtp-Source: AGHT+IFzDI5BdCz32vWtbnkBgMMdy6u5l0GlncINhoUetetrAiHbQN4UFOrL0APdaNCCcLOijgcQBA==
X-Received: by 2002:a05:600c:794:b0:421:28e6:991b with SMTP id
 5b1f17b1804b1-4212e0a5246mr79321205e9.29.1717399268028; 
 Mon, 03 Jun 2024 00:21:08 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.73])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4212279d287sm109219845e9.0.2024.06.03.00.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 00:21:07 -0700 (PDT)
Message-ID: <d7735adb-5e65-4c21-a9d6-a4ad84680008@gmail.com>
Date: Mon, 3 Jun 2024 10:21:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_Intel_blitte?=
 =?UTF-8?Q?r_framebuffer_copying_sanitizing_=28rev7=29?=
To: igt-dev@lists.freedesktop.org,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
 <171716096401.2241947.16016678028010889065@8e613ede5ea5>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <171716096401.2241947.16016678028010889065@8e613ede5ea5>
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

I don't see these new regressions relating to my change.

/Juha-Pekka

On 31.5.2024 16.09, Patchwork wrote:
> *Patch Details*
> *Series:*	Intel blitter framebuffer copying sanitizing (rev7)
> *URL:*	https://patchwork.freedesktop.org/series/132733/ 
> <https://patchwork.freedesktop.org/series/132733/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7874_full -> IGTPW_11208_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_11208_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11208_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/index.html
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_11208_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@i915_hangman@gt-error-state-capture@vecs1:
> 
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@i915_hangman@gt-error-state-capture@vecs1.html>
>   *
> 
>     igt@i915_pipe_stress@stress-xrgb8888-ytiled:
> 
>       o shard-dg1: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html> +1 other test incomplete
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-c-edp-1:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-c-edp-1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-c-edp-1.html>
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@kms_pm_dc@deep-pkgc.html>
> 
> 
>     New tests
> 
> New tests have been introduced between IGT_7874_full and IGTPW_11208_full:
> 
> 
>       New IGT tests (3)
> 
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a1-hdmi-a2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.93] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a1-hdmi-a2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.55] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.45] s
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_11208_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@api_intel_bb@object-reloc-purge-cache:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@api_intel_bb@object-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@api_intel_bb@object-reloc-purge-cache.html> (i915#8411 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>   *
> 
>     igt@drm_fdinfo@busy@vcs1:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@drm_fdinfo@busy@vcs1.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +11 other tests skip
>   *
> 
>     igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html> (i915#8414 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>) +13 other tests skip
>   *
> 
>     igt@gem_basic@multigpu-create-close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-8/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_ccs@block-copy-compressed:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_ccs@block-multicopy-compressed:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html> (i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-6/igt@gem_ccs@block-multicopy-compressed.html> (i915#9323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>   *
> 
>     igt@gem_close_race@multigpu-basic-process:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>   *
> 
>     igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html> (i915#6335 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268>)
>   *
> 
>     igt@gem_ctx_persistence@hang:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@gem_ctx_persistence@hang.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@heartbeat-close:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@gem_ctx_persistence@heartbeat-close.html> (i915#8555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>   *
> 
>     igt@gem_ctx_persistence@legacy-engines-mixed-process:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html> (i915#1099 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>   *
> 
>     igt@gem_ctx_sseu@invalid-sseu:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@gem_ctx_sseu@invalid-sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@gem_ctx_sseu@invalid-sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>) +1 other test skip
>   *
> 
>     igt@gem_ctx_sseu@mmap-args:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-3/igt@gem_ctx_sseu@mmap-args.html> (i915#280 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-snb4/igt@gem_eio@unwedge-stress.html> (i915#8898 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898>)
>   *
> 
>     igt@gem_exec_balancer@bonded-false-hang:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@gem_exec_balancer@bonded-false-hang.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +1 other test skip
>   *
> 
>     igt@gem_exec_balancer@bonded-sync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@gem_exec_balancer@bonded-sync.html> (i915#4771 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>   *
> 
>     igt@gem_exec_balancer@parallel-bb-first:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_exec_balancer@parallel-bb-first.html> (i915#4525 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>) +1 other test skip
>   *
> 
>     igt@gem_exec_capture@capture-invisible@smem0:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-8/igt@gem_exec_capture@capture-invisible@smem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>   *
> 
>     igt@gem_exec_capture@capture-recoverable:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html> (i915#6344 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344>)
>   *
> 
>     igt@gem_exec_fair@basic-deadline:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2846>)
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +1 other test fail
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@gem_exec_fair@basic-none-rrul@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +1 other test fail
>   *
> 
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
> 
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-8/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>)
>   *
> 
>     igt@gem_exec_fair@basic-pace@rcs0:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) +4 other tests fail
>   *
> 
>     igt@gem_exec_fair@basic-throttle:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@gem_exec_fair@basic-throttle.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>   *
> 
>     igt@gem_exec_fence@submit:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@gem_exec_fence@submit.html> (i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>) +2 other tests skip
>   *
> 
>     igt@gem_exec_flush@basic-uc-rw-default:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@gem_exec_flush@basic-uc-rw-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +5 other tests skip
>   *
> 
>     igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@gem_exec_flush@basic-wb-ro-before-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>) +4 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-cpu-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +3 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-noreloc:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-8/igt@gem_exec_reloc@basic-wc-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +1 other test skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-read-active:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@gem_exec_reloc@basic-wc-read-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +11 other tests skip
>   *
> 
>     igt@gem_exec_reloc@basic-wc-read-noreloc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_exec_reloc@basic-wc-read-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>) +14 other tests skip
>   *
> 
>     igt@gem_exec_schedule@preempt-queue-contexts:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts.html> (i915#4537 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>   *
> 
>     igt@gem_exec_schedule@semaphore-power:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_exec_schedule@semaphore-power.html> (i915#7276 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-threaded-none:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@gem_fence_thrash@bo-write-verify-threaded-none.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +2 other tests skip
>   *
> 
>     igt@gem_fence_thrash@bo-write-verify-y:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@gem_fence_thrash@bo-write-verify-y.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>) +1 other test skip
>   *
> 
>     igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-8/igt@gem_fenced_exec_thrash@2-spare-fences.html> (i915#4860 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-multi-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>) +1 other test fail
>   *
> 
>     igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-2/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>)
>   *
> 
>     igt@gem_lmem_swapping@random-engines:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk6/igt@gem_lmem_swapping@random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>       o shard-dg1: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#5493 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>   *
> 
>     igt@gem_lmem_swapping@verify-random:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip
>   *
> 
>     igt@gem_madvise@dontneed-before-exec:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-4/igt@gem_madvise@dontneed-before-exec.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +4 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@big-copy-odd:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@gem_mmap_gtt@big-copy-odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +8 other tests skip
>   *
> 
>     igt@gem_mmap_gtt@hang-busy:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@gem_mmap_gtt@hang-busy.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +3 other tests skip
>   *
> 
>     igt@gem_mmap_wc@fault-concurrent:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@gem_mmap_wc@fault-concurrent.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +6 other tests skip
>   *
> 
>     igt@gem_mmap_wc@write-read:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@gem_mmap_wc@write-read.html> (i915#4083 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>) +5 other tests skip
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@gem_pread@exhaustion.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +6 other tests skip
>   *
> 
>     igt@gem_pread@snoop:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@gem_pread@snoop.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +2 other tests skip
>   *
> 
>     igt@gem_pwrite_snooped:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_pwrite_snooped.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>) +5 other tests skip
>   *
> 
>     igt@gem_pxp@create-regular-buffer:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-5/igt@gem_pxp@create-regular-buffer.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other test skip
>   *
> 
>     igt@gem_pxp@display-protected-crc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-8/igt@gem_pxp@display-protected-crc.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +2 other tests skip
>   *
> 
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +1 other test skip
>   *
> 
>     igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +5 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-4/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html> (i915#4270 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>) +4 other tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html> +383 other tests skip
>   *
> 
>     igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190> / i915#8428 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>) +5 other tests skip
>   *
> 
>     igt@gem_render_tiled_blits@basic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@gem_render_tiled_blits@basic.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>   *
> 
>     igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html> (i915#4079 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>) +1 other test skip
>   *
> 
>     igt@gem_softpin@allocator-evict@ccs0:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-6/igt@gem_softpin@allocator-evict@ccs0.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-3/igt@gem_softpin@allocator-evict@ccs0.html> (i915#10652 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10652>)
>   *
> 
>     igt@gem_spin_batch@spin-all-new:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-2/igt@gem_spin_batch@spin-all-new.html> (i915#5889 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5889>)
>   *
> 
>     igt@gem_tiled_partial_pwrite_pread@writes-after-reads:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@gem_tiled_partial_pwrite_pread@writes-after-reads.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>) +12 other tests skip
>   *
> 
>     igt@gem_userptr_blits@create-destroy-unsync:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@gem_userptr_blits@create-destroy-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@dmabuf-sync:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk6/igt@gem_userptr_blits@dmabuf-sync.html> (i915#3323 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@gem_userptr_blits@dmabuf-sync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@forbidden-operations:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-4/igt@gem_userptr_blits@forbidden-operations.html> (i915#3282 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>) +1 other test skip
>   *
> 
>     igt@gem_userptr_blits@relocations:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@gem_userptr_blits@relocations.html> (i915#3281 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281> / i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>   *
> 
>     igt@gem_userptr_blits@sd-probe:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-13/igt@gem_userptr_blits@sd-probe.html> (i915#3297 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297> / i915#4958 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>   *
> 
>     igt@gen9_exec_parse@batch-invalid-length:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-7/igt@gen9_exec_parse@batch-invalid-length.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@bb-chained:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-6/igt@gen9_exec_parse@bb-chained.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>   *
> 
>     igt@gen9_exec_parse@bb-oversize:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-4/igt@gen9_exec_parse@bb-oversize.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +6 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@gen9_exec_parse@bb-oversize.html> (i915#2527 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>) +2 other tests skip
>   *
> 
>     igt@gen9_exec_parse@valid-registers:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@gen9_exec_parse@valid-registers.html> (i915#2856 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>) +3 other tests skip
>   *
> 
>     igt@i915_module_load@load:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@i915_module_load@load.html> (i915#6227 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6227>)
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html> (i915#9849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849>)
>       o shard-glk: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html> (i915#9849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849>)
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html> (i915#10131 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>)
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html> (i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820> / i915#9849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849>)
>   *
> 
>     igt@i915_pm_freq_api@freq-basic-api:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@i915_pm_freq_api@freq-basic-api.html> (i915#8399 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>   *
> 
>     igt@i915_pm_rps@basic-api:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@i915_pm_rps@basic-api.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>) +1 other test skip
>   *
> 
>     igt@i915_pm_rps@min-max-config-loaded:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-5/igt@i915_pm_rps@min-max-config-loaded.html> (i915#6621 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621>)
>   *
> 
>     igt@i915_pm_rps@thresholds-park@gt0:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-6/igt@i915_pm_rps@thresholds-park@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_pm_rps@thresholds-park@gt1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-6/igt@i915_pm_rps@thresholds-park@gt1.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_pm_rps@thresholds@gt0:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-3/igt@i915_pm_rps@thresholds@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@i915_pm_rps@thresholds@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925>)
>   *
> 
>     igt@i915_power@sanity:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-mtlp-3/igt@i915_power@sanity.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@i915_power@sanity.html> (i915#7984 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>   *
> 
>     igt@i915_query@hwconfig_table:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-13/igt@i915_query@hwconfig_table.html> (i915#6245 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-3/igt@i915_query@hwconfig_table.html> (i915#6245 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>   *
> 
>     igt@i915_query@test-query-geometry-subslices:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html> (i915#5723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>   *
> 
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_addfb_basic@basic-y-tiled-legacy.html> (i915#4215 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html> (i915#8709 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>) +3 other tests skip
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>   *
> 
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769> / i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-snb6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (i915#1769 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>   *
> 
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +5 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +9 other tests skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html> (i915#5286 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-14/igt@kms_big_fb@linear-32bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +3 other tests skip
>   *
> 
>     igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@kms_big_fb@linear-64bpp-rotate-270.html> +5 other tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> (i915#3638 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>) +2 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>) +8 other tests skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>) +6 other tests skip
>   *
> 
>     igt@kms_big_joiner@basic:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@kms_big_joiner@basic.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@kms_big_joiner@basic.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_big_joiner@invalid-modeset-force-joiner:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_big_joiner@invalid-modeset-force-joiner.html> (i915#10656 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-4.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +103 other tests skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +15 other tests skip
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#10434 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +6 other tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +73 other tests skip
>   *
> 
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html> (i915#10307 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307> / i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +172 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1.html> (i915#6095 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html> (i915#10278 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278>)
>   *
> 
>     igt@kms_cdclk@mode-transition-all-outputs:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html> (i915#3742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>   *
> 
>     igt@kms_chamelium_audio@hdmi-audio-edid:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-13/igt@kms_chamelium_audio@hdmi-audio-edid.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +12 other tests skip
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +4 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +11 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +7 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>) +3 other tests skip
>   *
> 
>     igt@kms_content_protection@atomic:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@kms_content_protection@atomic.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-6/igt@kms_content_protection@atomic.html> (i915#6944 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944> / i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116> / i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_content_protection@atomic-dpms.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@kms_content_protection@atomic-dpms.html> (i915#7118 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118> / i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-6/igt@kms_content_protection@dp-mst-lic-type-0.html> (i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116> / i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>   *
> 
>     igt@kms_content_protection@dp-mst-type-1:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html> (i915#3116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_content_protection@dp-mst-type-1.html> (i915#3299 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>   *
> 
>     igt@kms_content_protection@lic-type-0:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@kms_content_protection@lic-type-0.html> (i915#9424 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (i915#7173 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>   *
> 
>     igt@kms_content_protection@srm:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-13/igt@kms_content_protection@srm.html> (i915#7116 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-128x42:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html> (i915#8814 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>) +1 other test skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-32x32:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@kms_cursor_crc@cursor-random-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +6 other tests skip
>   *
> 
>     igt@kms_cursor_crc@cursor-random-512x170:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-4/igt@kms_cursor_crc@cursor-random-512x170.html> (i915#3359 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +8 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +2 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>   *
> 
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9833 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html> (i915#9833 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-2.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>   *
> 
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html> (i915#9723 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>   *
> 
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +1 other test skip
>   *
> 
>     igt@kms_dp_aux_dev:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-11/igt@kms_dp_aux_dev.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_dp_aux_dev.html> (i915#1257 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257>)
>   *
> 
>     igt@kms_draw_crc@draw-method-mmap-gtt:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-14/igt@kms_draw_crc@draw-method-mmap-gtt.html> (i915#8812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_draw_crc@draw-method-mmap-gtt.html> (i915#8812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812>)
>   *
> 
>     igt@kms_dsc@dsc-fractional-bpp:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html> (i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-bpc-formats:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-2/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_dsc@dsc-with-output-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@kms_dsc@dsc-with-output-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>   *
> 
>     igt@kms_feature_discovery@chamelium:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_feature_discovery@chamelium.html> (i915#4854 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>   *
> 
>     igt@kms_feature_discovery@display-4x:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-14/igt@kms_feature_discovery@display-4x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_feature_discovery@display-4x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-8/igt@kms_feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_feature_discovery@psr2:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_feature_discovery@psr2.html> (i915#658 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>   *
> 
>     igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +1 other test skip
>   *
> 
>     igt@kms_flip@2x-plain-flip:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_flip@2x-plain-flip.html> +54 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html> (i915#3637 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>) +2 other tests skip
>   *
> 
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html> (i915#9934 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>) +9 other tests skip
>   *
> 
>     igt@kms_flip@flip-vs-fences-interruptible:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_flip@flip-vs-fences-interruptible.html> (i915#8381 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +3 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8810 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>) +1 other test skip
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_force_connector_basic@prune-stale-modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +19 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +18 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-stridechange:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-stridechange.html> (i915#6880 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +20 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html> +47 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html> +47 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html> (i915#1825 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>) +44 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (i915#9766 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +11 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html> (i915#3023 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>) +29 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>) +21 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +2 other tests skip
>   *
> 
>     igt@kms_hdr@bpc-switch-dpms:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +3 other tests skip
>   *
> 
>     igt@kms_hdr@static-toggle-suspend:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>) +2 other tests skip
>   *
> 
>     igt@kms_panel_fitting@atomic-fastset:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html> (i915#6301 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>   *
> 
>     igt@kms_panel_fitting@legacy:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-6/igt@kms_panel_fitting@legacy.html> (i915#6301 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_panel_fitting@legacy.html> (i915#6301 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>   *
> 
>     igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk8/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html> (i915#10647 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>) +3 other tests fail
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> 
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html> (i915#8292 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292>)
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c-hdmi-a-4.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d-hdmi-a-1.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a-hdmi-a-2.html> (i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +7 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +1 other test skip
>   *
> 
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +3 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235> / i915#9423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>) +11 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>) +2 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-edp-1.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#5235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235>)
>   *
> 
>     igt@kms_pm_backlight@bad-brightness:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>) +1 other test skip
>   *
> 
>     igt@kms_pm_backlight@fade-with-dpms:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html> (i915#5354 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.html> (i915#9812 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>) +1 other test skip
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_pm_dc@dc6-dpms.html> (i915#5978 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_pm_dc@dc6-dpms.html> (i915#3361 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>   *
> 
>     igt@kms_pm_lpsp@kms-lpsp:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-2/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@kms_pm_lpsp@kms-lpsp.html> (i915#9340 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>   *
> 
>     igt@kms_pm_rpm@dpms-lpsp:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@kms_pm_rpm@dpms-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-10/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-lpsp:
> 
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) +1 other test skip
>   *
> 
>     igt@kms_prime@d3hot:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@kms_prime@d3hot.html> (i915#6524 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>   *
> 
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html> +25 other tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf@psr2-pipe-a-edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-5/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf@psr2-pipe-a-edp-1.html> (i915#9808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>) +1 other test skip
>   *
> 
>     igt@kms_psr2_su@page_flip-p010:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_psr2_su@page_flip-p010.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@kms_psr2_su@page_flip-p010.html> (i915#9683 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>) +1 other test skip
>   *
> 
>     igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html> (i915#9688 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>) +3 other tests skip
>   *
> 
>     igt@kms_psr@psr-cursor-render:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@kms_psr@psr-cursor-render.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +4 other tests skip
>   *
> 
>     igt@kms_psr@psr-sprite-plane-move:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@kms_psr@psr-sprite-plane-move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +22 other tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-mmap-cpu:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_psr@psr2-primary-mmap-cpu.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +29 other tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-page-flip:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-3/igt@kms_psr@psr2-primary-page-flip.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +10 other tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-render:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-9/igt@kms_psr@psr2-primary-render.html> (i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +8 other tests skip
>   *
> 
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>) +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html> (i915#9685 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>   *
> 
>     igt@kms_rotation_crc@exhaust-fences:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html> (i915#4884 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884>)
>   *
> 
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html> (i915#5289 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-270:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-snb2/igt@kms_rotation_crc@sprite-rotation-270.html> +36 other tests skip
>   *
> 
>     igt@kms_rotation_crc@sprite-rotation-90:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235>)
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
> 
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-tglu-5/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html> (i915#9196 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196>)
>   *
> 
>     igt@kms_vrr@flip-basic:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-8/igt@kms_vrr@flip-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>)
>   *
> 
>     igt@kms_vrr@negative-basic:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@kms_vrr@negative-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_vrr@seamless-rr-switch-drrs:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>   *
> 
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html> (i915#2437 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437> / i915#9412 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>   *
> 
>     igt@perf@global-sseu-config-invalid:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-5/igt@perf@global-sseu-config-invalid.html> (i915#7387 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>   *
> 
>     igt@perf@per-context-mode-unprivileged:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@perf@per-context-mode-unprivileged.html> (i915#2433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>) +1 other test skip
>   *
> 
>     igt@perf@unprivileged-single-ctx-counters:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-1/igt@perf@unprivileged-single-ctx-counters.html> (i915#2433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>   *
> 
>     igt@perf_pmu@busy-double-start@vecs0:
> 
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-mtlp-5/igt@perf_pmu@busy-double-start@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-4/igt@perf_pmu@busy-double-start@vecs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>) +2 other tests fail
>   *
> 
>     igt@perf_pmu@cpu-hotplug:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-3/igt@perf_pmu@cpu-hotplug.html> (i915#8850 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850>)
>   *
> 
>     igt@perf_pmu@rc6-all-gts:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@perf_pmu@rc6-all-gts.html> (i915#8516 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>   *
> 
>     igt@prime_vgem@fence-flip-hang:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>) +1 other test skip
>   *
> 
>     igt@prime_vgem@fence-write-hang:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@prime_vgem@fence-write-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>   *
> 
>     igt@sriov_basic@bind-unbind-vf:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@sriov_basic@bind-unbind-vf.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>) +1 other test skip
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-10/igt@sriov_basic@enable-vfs-autoprobe-off.html> (i915#9917 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>   *
> 
>     igt@syncobj_timeline@invalid-wait-zero-handles:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-snb4/igt@syncobj_timeline@invalid-wait-zero-handles.html> (i915#9781 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9781>)
>   *
> 
>     igt@syncobj_wait@invalid-wait-zero-handles:
> 
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-17/igt@syncobj_wait@invalid-wait-zero-handles.html> (i915#9779 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9779>)
>   *
> 
>     igt@v3d/v3d_perfmon@create-two-perfmon:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@v3d/v3d_perfmon@create-two-perfmon.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +8 other tests skip
>   *
> 
>     igt@v3d/v3d_perfmon@get-values-valid-perfmon:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-16/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +12 other tests skip
>   *
> 
>     igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-4/igt@v3d/v3d_submit_csd@bad-multisync-out-sync.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@vc4/vc4_mmap@mmap-bad-handle:
> 
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-14/igt@vc4/vc4_mmap@mmap-bad-handle.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +6 other tests skip
>   *
> 
>     igt@vc4/vc4_tiling@get-bad-flags:
> 
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-flags.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +7 other tests skip
>   *
> 
>     igt@vc4/vc4_wait_bo@bad-bo:
> 
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@vc4/vc4_wait_bo@bad-bo.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +9 other tests skip
>   *
> 
>     igt@vc4/vc4_wait_bo@bad-pad:
> 
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-1/igt@vc4/vc4_wait_bo@bad-pad.html> (i915#7711 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711>) +1 other test skip
>   *
> 
>     igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
> 
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-9/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html> (i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) +7 other tests skip
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@drm_fdinfo@most-busy-check-all@rcs0:
> 
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7742>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-rkl-5/igt@drm_fdinfo@most-busy-check-all@rcs0.html>
>   *
> 
>     igt@gem_ctx_exec@basic-nohangcheck:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-tglu-7/igt@gem_ctx_exec@basic-nohangcheck.html> (i915#6268 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6268>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-8/igt@gem_ctx_exec@basic-nohangcheck.html>
>   *
> 
>     igt@gem_eio@reset-stress:
> 
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg1-16/igt@gem_eio@reset-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@gem_eio@reset-stress.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>   *
> 
>     igt@gem_exec_schedule@noreorder-corked@vecs0:
> 
>       o shard-dg1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg1-16/igt@gem_exec_schedule@noreorder-corked@vecs0.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-18/igt@gem_exec_schedule@noreorder-corked@vecs0.html>
>   *
> 
>     igt@gem_lmem_swapping@basic@lmem0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-2/igt@gem_lmem_swapping@basic@lmem0.html> (i915#10378 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html>
>   *
> 
>     igt@i915_module_load@reload-with-fault-injection:
> 
>       o shard-tglu: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html> (i915#10047 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047> / i915#10887 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887> / i915#9820 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-9/igt@i915_module_load@reload-with-fault-injection.html>
>   *
> 
>     igt@i915_pm_rps@reset:
> 
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-snb2/igt@i915_pm_rps@reset.html> (i915#7790 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7790>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-snb5/igt@i915_pm_rps@reset.html>
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> (i915#2017 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2017>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>   *
> 
>     igt@kms_fbcon_fbt@fbc-suspend:
> 
>       o shard-tglu: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-tglu-4/igt@kms_fbcon_fbt@fbc-suspend.html> (i915#8797 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8797> / i915#9878 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-3/igt@kms_fbcon_fbt@fbc-suspend.html>
>   *
> 
>     igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-6/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html> (i915#2122 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html> +2 other tests pass
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-tglu-7/igt@kms_pm_dc@dc6-dpms.html> (i915#9295 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-tglu-4/igt@kms_pm_dc@dc6-dpms.html>
>   *
> 
>     igt@kms_pm_rpm@i2c:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-2/igt@kms_pm_rpm@i2c.html> (i915#8717 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8717>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@kms_pm_rpm@i2c.html>
>   *
> 
>     igt@kms_pm_rpm@modeset-non-lpsp:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-10/igt@kms_pm_rpm@modeset-non-lpsp.html> (i915#9519 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp.html>
>   *
> 
>     igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-edp-1:
> 
>       o shard-mtlp: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-mtlp-7/igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-mtlp-5/igt@kms_vblank@ts-continuation-modeset-hang@pipe-d-edp-1.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@gem_eio@kms:
> 
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-2/igt@gem_eio@kms.html> (i915#10513 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-10/igt@gem_eio@kms.html> (i915#10513 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513> / i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>)
>       o shard-dg1: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg1-16/igt@gem_eio@kms.html> (i915#10513 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513> / i915#1982 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@gem_eio@kms.html> (i915#10513 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513>)
>   *
> 
>     igt@gem_mmap_gtt@fault-concurrent-x:
> 
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg1-18/igt@gem_mmap_gtt@fault-concurrent-x.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077> / i915#4423 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg1-15/igt@gem_mmap_gtt@fault-concurrent-x.html> (i915#4077 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> (i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html> (i915#10433 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433> / i915#3458 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>) +5 other tests skip
>   *
> 
>     igt@kms_psr@fbc-psr-cursor-plane-move:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-11/igt@kms_psr@fbc-psr-cursor-plane-move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-2/igt@kms_psr@fbc-psr-cursor-plane-move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +3 other tests skip
>   *
> 
>     igt@kms_psr@psr2-primary-blt:
> 
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-2/igt@kms_psr@psr2-primary-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-11/igt@kms_psr@psr2-primary-blt.html> (i915#1072 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072> / i915#9673 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673> / i915#9732 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>) +10 other tests skip
>   *
> 
>     igt@perf@non-zero-reason@0-rcs0:
> 
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7874/shard-dg2-5/igt@perf@non-zero-reason@0-rcs0.html> (i915#7484 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7484>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11208/shard-dg2-1/igt@perf@non-zero-reason@0-rcs0.html> (i915#9100 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7874 -> IGTPW_11208
> 
> CI-20190529: 20190529
> CI_DRM_14852: bdab4dd15a635eedc4b4d95be9d4155be46e5e4b @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11208: 2d531a8b665bd13c53ef4ce39245abe3ffaff349 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7874: 4d9b4ee12b5f0852c02818ca9a886355b43fbbff @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 

