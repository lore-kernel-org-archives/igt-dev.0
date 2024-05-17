Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295DCC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 13:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877DB10E803;
	Fri, 17 May 2024 13:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FFwSolod";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945E210E1B8;
 Fri, 17 May 2024 13:09:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-420180b5898so760295e9.2; 
 Fri, 17 May 2024 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715951368; x=1716556168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=yuRjarpHJ1YqK1zu4N54vzb/mcVfmRxoXvhVOHb5xxY=;
 b=FFwSolodpUZ++P81l31ytMqjw4VDCsV4acDGwlgOIuzwqYgv5Ff+h4X9nAfJU0RJyJ
 PVqVex94DpUtl024EQrkSKzNeBtUcVIR4wXCBkQ9+me5eMXixhVykVpb0CYJPXelSWyv
 kEVO65uN4kdKKp5ilOsaosS9LaQ7BJK6WkIwxberGl7txYTZbZ6dP42QNFOyPq//gOrw
 ewUYwjHT7FrI3Ev3PImhl1XUJmHMQKoqe6lWrqcDPz+i6BEhJzkR2NRY8nm6E0hx0Tmk
 FZGnxpAzJsnBOePQuabqiKTAwmEvRmaaeTEDGgqoKLgxv8FLaUtdSbZ1pLXogLJBj5Hb
 VWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715951368; x=1716556168;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yuRjarpHJ1YqK1zu4N54vzb/mcVfmRxoXvhVOHb5xxY=;
 b=kfVWPimzDU+1/QZxc1hwfgMzDIUDWr0FRqAWhm6+OY0EE9dY+pMNtxzkkRPf4fgK/0
 PIOW/tyUsOuI6AeFPcfueRScaweU7ODYH6EerlkBgOE5PeIdcF8rLtz46tZ/DL6jDF/i
 a+7I3aHs7Mwl1b8bP46VPCGeAAcBSDT1NVnWhyihV8/+CIEsENM+TvFMXNN7z/PBvf74
 tRkNVl4FTtaGg1jc4a0190BN5YR06SavTRn91NB9oErgUClIK0YkWzkY/vUqq01MsKL/
 LbGCWW58BEgNtCOQgroCJPBmOLr0lWK+cGFDYUcntWIIaRLd4wH0tMZAdxV7id03B2hW
 g+Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsPg+5Jw4UYov+sizowYKzQ0sL+hjS5l3AMPzsPVknMna+DcFTDZQSid8U2XSxpH6eFrT3rCgUvUx1iCNswu5oRVT4zT+MNfFLWjzTk0b+h4vTtyxWsg0hiZqYYy8VFdRHfyw2ZFcOrkT34KARLsBcB6g=
X-Gm-Message-State: AOJu0YyYPr8nG0JEfK/4C7DqSgCPqqk3XqikeGdlleTV4sxdbtcmnvGp
 ZbB1JZVPtFnT+6OF/9YTuvo3/syJvz5LSCCmLDrMxYpjRSUS6RA7
X-Google-Smtp-Source: AGHT+IGwJ95vvcPyfAVyzvIysid3ike/jLMV+JAgBcImzLPwh8dZAmwiiEjCoY9O2e03nvcwW0t/iQ==
X-Received: by 2002:a05:600c:3582:b0:418:29d4:1964 with SMTP id
 5b1f17b1804b1-41fea539b5amr165794545e9.0.1715951367353; 
 Fri, 17 May 2024 06:09:27 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.70])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42004d7ab53sm183734185e9.0.2024.05.17.06.09.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 06:09:26 -0700 (PDT)
Message-ID: <4b54075d-6e61-4b16-bd64-5b548d8d662a@gmail.com>
Date: Fri, 17 May 2024 16:09:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5Bv3=2C1/2=5D_tests/kms=5Fvrr=3A_Add_a_subtest_for_seam?=
 =?UTF-8?Q?less_modeset_to_a_virtual_LRR_mode_=28rev3=29?=
To: Manasi Navare <navaremanasi@chromium.org>,
 "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Drew Davenport <ddavenport@chromium.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <171511150704.1963160.10898754831133154623@8e613ede5ea5>
 <DM8PR11MB5655FA40AC90E66F60532A98E0E52@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNnZdxEFdMXrN0S1G4fx3btLWqEZzZjDFkvd4tmmtv7FXA@mail.gmail.com>
 <IA1PR11MB6348E96F7B76548E5A101208B2E72@IA1PR11MB6348.namprd11.prod.outlook.com>
 <DM8PR11MB565593183B579437602FACB6E0E72@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNmNdmTjB-Wzrcg4Dp37MQMUN7QnVkpLqJYWx2qL0U5Rvw@mail.gmail.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <CAE72mNmNdmTjB-Wzrcg4Dp37MQMUN7QnVkpLqJYWx2qL0U5Rvw@mail.gmail.com>
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Manasi,

I merged your patch.

/Juha-Pekka


On 13.5.2024 22.05, Manasi Navare wrote:
> Hi Jani, Bhanu,
> 
> I have retested this on my end and it runs as expected with VRR capable 
> edp and DP.
> Could you please help getting this merged? We would like to have this 
> run as part of CI and our Chrome automation tests for testing seamless 
> virtual modes with VRR fastset framework.
> 
> Regards
> Manasi
> 
> On Fri, May 10, 2024 at 5:32 AM Saarinen, Jani <jani.saarinen@intel.com 
> <mailto:jani.saarinen@intel.com>> wrote:
> 
>     Hi,____
> 
>     Also this was done
>     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11077
>     <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11077> as
>     BAT issues were re-reported, waiting for shards now ____
> 
>     Would be good to understand is this is real issue ? ____
> 
>     __ __
> 
>     *From:*Golani, Mitulkumar Ajitkumar
>     <mitulkumar.ajitkumar.golani@intel.com
>     <mailto:mitulkumar.ajitkumar.golani@intel.com>>
>     *Sent:* Friday, 10 May 2024 14.00
>     *To:* Manasi Navare <navaremanasi@chromium.org
>     <mailto:navaremanasi@chromium.org>>
>     *Cc:* igt-dev@lists.freedesktop.org
>     <mailto:igt-dev@lists.freedesktop.org>; Saarinen, Jani
>     <jani.saarinen@intel.com <mailto:jani.saarinen@intel.com>>; Modem,
>     Bhanuprakash <bhanuprakash.modem@intel.com
>     <mailto:bhanuprakash.modem@intel.com>>; Sean Paul
>     <seanpaul@chromium.org <mailto:seanpaul@chromium.org>>; Drew
>     Davenport <ddavenport@chromium.org
>     <mailto:ddavenport@chromium.org>>;
>     I915-ci-infra@lists.freedesktop.org
>     <mailto:I915-ci-infra@lists.freedesktop.org>
>     *Subject:* RE: ✗Fi.CI.BAT: failure for series starting with [v3,1/2]
>     tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR
>     mode (rev3)____
> 
>     __ __
> 
>     Hi @Manasi Navare <mailto:navaremanasi@chromium.org>____
> 
> 
>     Hi there,____
> 
>     __ __
> 
>     Seems like following subtests were skipped:____
> 
> 
>     negative-basic(TEST_NEGATIVE) , seamless-rr-switch-vrr (Flag:
>     TEST_SEAMLESS_VRR) , seamless-rr-switch-drrs (Flag: TEST_SEAMLESS_DRRS)
> 
>     negative-basic: This test is designed for non-VRR panels.____
> 
>     seamless-rr-switch-vrr: Specifically for eDP configurations with
>     VRR.____
> 
>     seamless-rr-switch-drrs: Also eDP-specific, for DRRS.____
> 
> 
>     These skips were expected as a DP panel is connected on these machine
> 
>     Thanks
>     Mitul____
> 
>     *From:*Manasi Navare <navaremanasi@chromium.org
>     <mailto:navaremanasi@chromium.org>>
>     *Sent:* Thursday, May 9, 2024 9:54 PM
>     *To:* Saarinen, Jani <jani.saarinen@intel.com
>     <mailto:jani.saarinen@intel.com>>; Modem, Bhanuprakash
>     <bhanuprakash.modem@intel.com
>     <mailto:bhanuprakash.modem@intel.com>>; Sean Paul
>     <seanpaul@chromium.org <mailto:seanpaul@chromium.org>>; Drew
>     Davenport <ddavenport@chromium.org
>     <mailto:ddavenport@chromium.org>>;
>     I915-ci-infra@lists.freedesktop.org
>     <mailto:I915-ci-infra@lists.freedesktop.org>
>     *Cc:* igt-dev@lists.freedesktop.org
>     <mailto:igt-dev@lists.freedesktop.org>
>     *Subject:* Re: ✗Fi.CI.BAT: failure for series starting with [v3,1/2]
>     tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR
>     mode (rev3)____
> 
>     __ __
> 
>     Hi Jani,____
> 
>     __ __
> 
>     Looks like all the VRR basic legacy tests are skipping as well, do
>     none of these devices have a VRR sink connected?____
> 
>     It is expected to skip in that case. I will do some local testing on
>     my device here and confirm.____
> 
>     @Bhanuprakash Modem <mailto:bhanuprakash.modem@intel.com> , are
>     these vrr basic skips expected?____
> 
>     __ __
> 
>     Regards____
> 
>     Manasi____
> 
>     __ __
> 
>     On Tue, May 7, 2024 at 11:33 PM Saarinen, Jani
>     <jani.saarinen@intel.com <mailto:jani.saarinen@intel.com>> wrote:____
> 
>         Hi Manasi____
> 
>         Are those new results expected skips and thus issue can be
>         reported ? ____
> 
>         ____
> 
>         *From:*igt-dev <igt-dev-bounces@lists.freedesktop.org
>         <mailto:igt-dev-bounces@lists.freedesktop.org>> *On Behalf Of
>         *Patchwork
>         *Sent:* Tuesday, 7 May 2024 22.52
>         *To:* Manasi Navare <navaremanasi@chromium.org
>         <mailto:navaremanasi@chromium.org>>
>         *Cc:* igt-dev@lists.freedesktop.org
>         <mailto:igt-dev@lists.freedesktop.org>
>         *Subject:* ✗Fi.CI.BAT: failure for series starting with [v3,1/2]
>         tests/kms_vrr: Add a subtest for seamless modeset to a virtual
>         LRR mode (rev3)____
> 
>         ____
> 
>         *Patch Details*____
> 
>         *Series:*____
> 
>         	
> 
>         series starting with [v3,1/2] tests/kms_vrr: Add a subtest for
>         seamless modeset to a virtual LRR mode (rev3)____
> 
>         *URL:*____
> 
>         	
> 
>         https://patchwork.freedesktop.org/series/132866/
>         <https://patchwork.freedesktop.org/series/132866/>____
> 
>         *State:*____
> 
>         	
> 
>         failure____
> 
>         *Details:*____
> 
>         	
> 
>         https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html>____
> 
> 
>           CI Bug Log - changes from CI_DRM_14723 -> IGTPW_11108____
> 
> 
>             Summary____
> 
>         *FAILURE*____
> 
>         Serious unknown changes coming with IGTPW_11108 absolutely need
>         to be
>         verified manually.____
> 
>         If you think the reported changes have nothing to do with the
>         changes
>         introduced in IGTPW_11108, please notify your bug team
>         ('I915-ci-infra@lists.freedesktop.org
>         <mailto:I915-ci-infra@lists.freedesktop.org>') to allow them
>         to document this new failure mode, which will reduce false
>         positives in CI.____
> 
>         External URL:
>         https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html>____
> 
> 
>             Participating hosts (41 -> 40)____
> 
>         Additional (3): fi-glk-j4005 bat-kbl-2 bat-jsl-1
>         Missing (4): bat-dg2-11 bat-mtlp-9 fi-snb-2520m fi-bsw-n3050 ____
> 
> 
>             Possible new issues____
> 
>         Here are the unknown changes that may have been introduced in
>         IGTPW_11108:____
> 
> 
>               IGT changes____
> 
> 
>                 Possible regressions____
> 
>           * igt@kms_vrr@max-min@pipe-a-dp-1:____
> 
>               o bat-adls-6: NOTRUN -> FAIL
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@max-min@pipe-a-dp-1.html>____
> 
>           * igt@kms_vrr@seamless-rr-switch-virtual (NEW):____
> 
>               o bat-arls-2: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o {bat-arls-4}: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-4/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-adlp-6: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-dg2-14: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-arls-3: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-jsl-3: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-mtlp-8: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-adls-6: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-arls-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-dg1-7: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-adlp-9: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o {bat-rpls-4}: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rpls-4/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-adln-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o {bat-twl-1}: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o bat-rplp-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o fi-rkl-11600: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-virtual.html>____
>               o fi-tgl-1115g4: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@seamless-rr-switch-virtual.html>____
> 
> 
>                 Suppressed____
> 
>         The following results come from untrusted machines, tests, or
>         statuses.
>         They do not affect the overall result.____
> 
>           * igt@i915_module_load@load:____
> 
>               o {bat-apl-1}: PASS
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-apl-1/igt@i915_module_load@load.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-apl-1/igt@i915_module_load@load.html>____
> 
>           * igt@kms_vrr@seamless-rr-switch-vrr:____
> 
>               o {bat-twl-1}: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switch-vrr.html> +2 other tests skip____
> 
> 
>             New tests____
> 
>         New tests have been introduced between CI_DRM_14723 and
>         IGTPW_11108:____
> 
> 
>               New IGT tests (1)____
> 
>           * igt@kms_vrr@seamless-rr-switch-virtual:____
> 
>               o Statuses : 38 skip(s)____
>               o Exec time: [0.0, 0.00] s____
> 
> 
>             Known issues____
> 
>         Here are the changes found in IGTPW_11108 that come from known
>         issues:____
> 
> 
>               IGT changes____
> 
> 
>                 Issues hit____
> 
>           * igt@debugfs_test@basic-hwmon:____
> 
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)____
> 
>           * igt@fbdev@info:____
> 
>               o bat-kbl-2: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@fbdev@info.html> (i915#1849 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>)____
> 
>           * igt@gem_huc_copy@huc-copy:____
> 
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)____
>               o fi-glk-j4005: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html> (i915#2190 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)____
> 
>           * igt@gem_lmem_swapping@parallel-random-engines:____
> 
>               o bat-kbl-2: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html> +49 other tests skip____
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_lmem_swapping@parallel-random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip____
>               o fi-glk-j4005: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_lmem_swapping@parallel-random-engines.html> (i915#4613 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3 other tests skip____
> 
>           * igt@i915_pm_rpm@module-reload:____
> 
>               o bat-adlp-6: PASS
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-adlp-6/igt@i915_pm_rpm@module-reload.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@i915_pm_rpm@module-reload.html> (i915#9427 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9427>) +2 other tests dmesg-warn____
> 
>           * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:____
> 
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html> (i915#4103 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1 other test skip____
> 
>           * igt@kms_dsc@dsc-basic:____
> 
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_dsc@dsc-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#9886 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886>)____
> 
>           * igt@kms_force_connector_basic@force-load-detect:____
> 
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html>____
> 
>           * igt@kms_psr@psr-primary-page-flip:____
> 
>               o fi-glk-j4005: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@kms_psr@psr-primary-page-flip.html> +20 other tests skip____
> 
>           * igt@kms_vrr@flip-basic:____
> 
>               o bat-atsm-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-atsm-1/igt@kms_vrr@flip-basic.html> (i915#6078 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078>) +9 other tests skip____
>               o bat-jsl-3: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@flip-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other tests skip____
>               o fi-ivb-3770: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ivb-3770/igt@kms_vrr@flip-basic.html> +9 other tests skip____
>               o bat-mtlp-8: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@flip-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> / i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +3 other tests skip____
>               o fi-elk-e7500: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-elk-e7500/igt@kms_vrr@flip-basic.html> +9 other tests skip____
>               o bat-dg2-8: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-8/igt@kms_vrr@flip-basic.html> (i915#9197 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197>) +9 other tests skip____
>               o fi-kbl-guc: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-guc/igt@kms_vrr@flip-basic.html> +9 other tests skip____
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@flip-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other tests skip____
> 
>           * igt@kms_vrr@flip-basic-fastset:____
> 
>               o fi-pnv-d510: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-pnv-d510/igt@kms_vrr@flip-basic-fastset.html> +9 other tests skip____
>               o bat-dg1-7: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3 other tests skip____
>               o fi-kbl-7567u: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-7567u/igt@kms_vrr@flip-basic-fastset.html> +9 other tests skip____
>               o bat-adln-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +2 other tests skip____
>               o bat-rplp-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +2 other tests skip____
>               o fi-tgl-1115g4: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3 other tests skip____
>               o fi-cfl-guc: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-guc/igt@kms_vrr@flip-basic-fastset.html> +9 other tests skip____
>               o bat-mtlp-6: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-6/igt@kms_vrr@flip-basic-fastset.html> (i915#9792 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>) +9 other tests skip____
>               o bat-adlp-6: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@flip-basic-fastset.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1 other test skip____
> 
>           * igt@kms_vrr@flip-suspend:____
> 
>               o bat-rplp-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other tests skip____
>               o fi-rkl-11600: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@flip-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other tests skip____
>               o bat-dg1-7: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other tests skip____
>               o bat-adlp-11: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@flip-suspend.html> (i915#10470 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470> / i915#10501 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501>) +6 other tests skip____
>               o bat-adln-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3 other tests skip____
>               o fi-tgl-1115g4: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other tests skip____
> 
>           * igt@kms_vrr@flipline:____
> 
>               o bat-dg2-14: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@flipline.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4 other tests skip____
> 
>           * igt@kms_vrr@max-min:____
> 
>               o bat-adlm-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlm-1/igt@kms_vrr@max-min.html> (i915#9900 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900>) +9 other tests skip____
>               o bat-arls-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@max-min.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +8 other tests skip____
>               o bat-arls-3: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@max-min.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +7 other tests skip____
>               o bat-mtlp-8: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@max-min.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808> / i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3 other tests skip____
> 
>           * igt@kms_vrr@negative-basic:____
> 
>               o bat-adlp-9: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@negative-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)____
>               o bat-adls-6: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@negative-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)____
> 
>           * igt@kms_vrr@seamless-rr-switch-drrs:____
> 
>               o fi-cfl-8700k: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8700k/igt@kms_vrr@seamless-rr-switch-drrs.html> +9 other tests skip____
>               o fi-blb-e6850: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-blb-e6850/igt@kms_vrr@seamless-rr-switch-drrs.html> +9 other tests skip____
>               o bat-dg2-14: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switch-drrs.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3 other tests skip____
>               o fi-bsw-nick: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-bsw-nick/igt@kms_vrr@seamless-rr-switch-drrs.html> +9 other tests skip____
>               o bat-jsl-3: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-drrs.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3 other tests skip____
> 
>           * igt@kms_vrr@seamless-rr-switch-virtual (NEW):____
> 
>               o bat-dg2-9: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-virtual.html> (i915#9197 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197>) +9 other tests skip____
>               o fi-kbl-x1275: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-x1275/igt@kms_vrr@seamless-rr-switch-virtual.html> +9 other tests skip____
>               o bat-adlp-11: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@seamless-rr-switch-virtual.html> (i915#10470 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470>) +2 other tests skip____
>               o fi-cfl-8109u: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8109u/igt@kms_vrr@seamless-rr-switch-virtual.html> +9 other tests skip____
>               o fi-ilk-650: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ilk-650/igt@kms_vrr@seamless-rr-switch-virtual.html> +9 other tests skip____
> 
>           * igt@kms_vrr@seamless-rr-switch-vrr:____
> 
>               o bat-adlp-9: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switch-vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1 other test skip____
>               o bat-adls-6: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switch-vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1 other test skip____
>               o bat-jsl-1: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3 other tests skip____
>               o fi-rkl-11600: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-switch-vrr.html> (i915#9906 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3 other tests skip____
>               o bat-arls-2: NOTRUN -> SKIP
>                 <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switch-vrr.html> (i915#8808 <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +2 other tests skip____
> 
>         {name}: This element is suppressed. This means it is ignored
>         when computing
>         the status of the difference (SUCCESS, WARNING, or FAILURE).____
> 
> 
>             Build changes____
> 
>           * CI: CI-20190529 -> None____
>           * IGT: IGT_7838 -> IGTPW_11108____
> 
>         CI-20190529: 20190529
>         CI_DRM_14723: f58676e47c12a99409b71f7d3bab9f89e14522b4 @
>         git://anongit.freedesktop.org/gfx-ci/linux
>         <http://anongit.freedesktop.org/gfx-ci/linux>
>         IGTPW_11108: 70f39756b8310ef49e565789055cfab85b5cef58 @
>         https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools.git>
>         IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @
>         https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools.git>____
> 

