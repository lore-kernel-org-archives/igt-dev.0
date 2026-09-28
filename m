Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61705CA5FA2
	for <igt-dev@archiver.kernel.org>; Mon, 28 Sep 2026 12:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB9510E083;
	Mon, 28 Sep 2026 12:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ljdWzKQz";
	dkim-atps=neutral
Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com
 [74.125.229.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6402B10E011
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 12:33:40 +0000 (UTC)
Received: by mail-dl2-f41.google.com with SMTP id
 a92af1059eb24-1474c6b7742so1329835c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2026 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790598819; x=1791203619; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/T2SQgGmB2ZBh+xs6DMstZc/gCZSeZkpUvZGiBIZWrU=;
 b=ljdWzKQzJ7YtqOi6J0zL97YTCY6Ii9Kjs6h+5wIDmR+fFPuaSFPv7TXFX5RrPXCryR
 5IevNoKx32ha1Ff9OqccjGy3KZmGE2Hnl6BLNcPxLIH9nM1wwRhMZKjfQ3Cqmeyzf3FG
 qEHPRvjeGREay9StMO4F/tMBPO0/SN7naQYsgN5Ff7oY60J57D6H+SBQ6rx2W9jHdmeT
 AGuseSBoLbh77CntcwkJZvLn/m4IKYV1KdrXmWWT/Xv+r0rmBYST9dBwqlc4/zyvKFty
 pMEIrCOmMyOBwWOx2MIv1C5s6OFLJg74d8XKdWSw7Bm/8zlUYDEV3gL3Yi0azb9qOJ1q
 6Udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790598819; x=1791203619;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/T2SQgGmB2ZBh+xs6DMstZc/gCZSeZkpUvZGiBIZWrU=;
 b=h/GBowHcbc542voRAkTp3T6dT1mslQVp/OzFLxlS0c/MFc8oEKjfPRO8P21no9Pt+I
 xcrT7uNYZBJNP8kDxxPiHjMwWA0yMq+bFD33pXOm2HH4riDfCt0Kkqpe0ZpN4eITp8Qg
 FcSbWT4ceJmyK6xHGUAB9sxN4PGTW3E2/juBhk61xM3YSoBtseMt6qQQ3rlRr1BpV2+0
 I0QV8h8uKx2aUP04CBRLKUvWXcxGnrBBRhwjKlMJtB8WAzEwB2FJvarsaWHKaZj839Uj
 22rVcqqWrU/cprzCVejh7N8yzZnDPU1DSagWUke8ieSvH9agA5RbDy34B1wBXSYuoIFG
 Xy4A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwoiudCCaeA7a8faf8v5Kn5O82wAKR5/2/5odLbZp6Q7Cf3DqlNYn4K5zueiHd/dtHiixUzurSD@lists.freedesktop.org
X-Gm-Message-State: AFuF++nczs22CkB0R2jUfTj3p+EUEOqeaKkztagUPIGqzB2E/txI1vDi
 YJL8fRo+nrjK3wa/m+cTGBvhh4PwlMBe6CxZeVg6FwXQRXMfQnvEK4Fn
X-Gm-Gg: AYBFou3YiUJDOtJP40V1GKzVuG6zM7X6P+X1wb445FO1D7Ids56AAABr9wpED2hlq/Y
 dTlIJ9+q8JfMVlurI06a42dbW+9CHOf3WerGI1Tge5tHzn/jaKjhx4Mlxx/Ur2y9bHcdgJLr4NS
 WIi+gS7YsKCN9BQJHd0TFB6YhmiLdJ4Bls9xycRHVmkvFyOiAmO1oVx9tj7nHNz1WCP8itkyWuf
 uzl4I1+avoFanFoyoObkFjl/2TeDyHvbxJtcCgfnVo58MxtA2RVKF/jhkkTnHs+9y1IMlIv7GJ9
 67fkgTF4304JDirjKUUqELgBmDPXLK5HsBBAEJw+mhJcxMW4zllIjDkod7V/02pWvwpTqUhOeBv
 hKU19qa6+a+A+UiKm+JODLrQax9YZa7xG8pScHEnz1o3QK4ITK4yKMjBqKJITMbC0/Ai6SSuxB9
 u4HvR3nMZAFi7wkf4E7eadJt+Dimof89arWgtRz1EP5KIonOj/N8wHp0n3nm3f7zfsoM6EYGCL9
 ulxx+Datme/DefUX9djG5eXUlvervzNvx6aUCp1f3SFOsstOKSIXA==
X-Received: by 2002:a05:701b:20de:20b0:143:342a:3d3a with SMTP id
 a92af1059eb24-146cb603316mr9888028c88.0.1790598819313; 
 Mon, 28 Sep 2026 05:33:39 -0700 (PDT)
Received: from [192.55.55.46] ([192.55.55.46])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-145ad9e097fsm28246517c88.13.2026.09.28.05.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 05:33:38 -0700 (PDT)
Message-ID: <2b70f609-38d2-449b-b95c-c6e427c5035b@gmail.com>
Date: Mon, 28 Sep 2026 15:33:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Update NEWS, bump version to 2.6
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
References: <20260928112227.60071-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20260928112227.60071-1-kamil.konieczny@linux.intel.com>
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

Acked-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 28/09/2026 14.22, Kamil Konieczny wrote:
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   NEWS        | 93 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>   meson.build |  2 +-
>   2 files changed, 94 insertions(+), 1 deletion(-)
> 
> diff --git a/NEWS b/NEWS
> index adb794151..f3d4ee2e5 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -1,3 +1,96 @@
> +Release 2.6 (2026-09-28)
> +------------------------
> +
> +General changes:
> +
> +- Removed xe_eudebug from meson. (Dominik Karol Piątkowski)
> +
> +Devops changes:
> +
> +- Bumped Debian version to bookworm and Fedora to latest 44 (Kamil Konieczny)
> +
> +Runner changes:
> +
> +- New igt_runner option --save-results-after-each-test. (Kamil Konieczny)
> +
> +Library changes:
> +
> +- Continued refactor of display library code. (Jani Nikula)
> +
> +- New platform filtering helpers for skipping tests without modifying test
> +  source code. (Vitaly Prosyak)
> +
> +- Improved setting up the render and compute pipelines for Intel GPUs. (Jan
> +  Maslak)
> +
> +Test changes:
> +
> +- Improved display testing during suspend. (Michał Grzelak)
> +
> +- Added subtest for BACKGROUND_COLOR crtc property. (Maarten Lankhorst)
> +
> +- New test for HDMI TMDS audio bandwidth constraints on Intel GPUs. (Swati
> +  Sharma)
> +
> +- Added subtest for Content Match Refresh Rate (CMRR) across both fixed and
> +  video timing display modes. (Naladala Ramanaidu)
> +
> +- New Xe page offline tests on Intel CRI GPUs. (Tejas Upadhyay)
> +
> +- Added test coverage for FIXED_MATRIX colorops for CSC. (Harry Wentland)
> +
> +- Added GT reset submit stress subtest. (Nishit Sharma)
> +
> +- New tests for SRIOV GGTT accesses by PF and VFs on Xe. (Piotr Piórkowski,
> +  Marcin Bernatowicz and Lukasz Laguna).
> +
> +- Added FIXED_MATRIX colorop subtests. (Swati Sharma)
> +
> +- Added UHBR-to-HBR fallback subtest for UHBR-capable DP connectors.(Sowmiya S)
> +
> +- Improved KMS tests on MediaTek. (Jason-JH Lin)
> +
> +- Added user fence no signal subtest for Intel Xe driver. (Priyanka Dandamudi)
> +
> +- Improved userptr stress test for amdgpu. (Vitaly Prosyak)
> +
> +- Improved Xe OA testing. (Umesh Nerlige Ramappa)
> +
> +- Improved FBC handling in display tests. (Vinod Govindapillai)
> +
> +- Improved amdgpu reset tests. (Jesse Zhang)
> +
> +- Added subtest to validate YUV420 with DC3CO. (Jeevan B)
> +
> +- Ported dmabuf tests to KUnit. (Krzysztof Niemiec)
> +
> +- Added display feature discovery subtests for HDR, VRR and DSC. (Swati Sharma)
> +
> +- Added Panthor sparse VM_BIND tests. (Adrián Larumbe)
> +
> +- Extended BO tests to cover GEM_INFO and cache flags on MSM. (Jitta Vignan)
> +
> +- New tests for PERFCNTR_CONFIG ioctl on MSM GPUs. (Rob Clark)
> +
> +- New tests for PowerVR Imagination GPUs. (Donald Robson, Matt Coster,
> +  Robert Mazur, Frank Binns and Sarah Walker)
> +
> +Tools changes:
> +
> +- Fixed gputop on Panthor. (Deborah Brouwer)
> +
> +- Renamed AMD tool to igt_hdmi_compliance and improved it to work on Intel GPUs
> +  (Swati Sharma)
> +
> +- Improvements in amd_hdmi_compliance. (Fangzhi Zuo and Mark Broadworth)
> +
> +- Decreased number of dynamically linked libraries in many tools. (Sebastian
> +  Brzezinka)
> +
> +
> +And many other bug fixes, improvements, cleanups and new tests.
> +
> +
>   Release 2.5 (2026-06-30)
>   ------------------------
>   
> diff --git a/meson.build b/meson.build
> index 980fb6421..d7bbfd969 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1,5 +1,5 @@
>   project('igt-gpu-tools', 'c',
> -	version : '2.5',
> +	version : '2.6',
>           default_options: [
>             'warning_level=2',
>             'c_std=gnu11',

