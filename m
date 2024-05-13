Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B0FC25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 19:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C58810E32E;
	Mon, 13 May 2024 19:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="aiFu83If";
	dkim-atps=neutral
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8702F10E32E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 19:05:16 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso1235474866b.2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 12:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715627114; x=1716231914;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fq6qSplheU1t4SRTjoMlkRoBiGtUET8eBvYoUqawkbU=;
 b=aiFu83IfdTjLZf3K6C5Ers0+TVFxWk32v4xisJUBiW0FZp1yoxckS9i+ukEG8qe1ie
 6esrM4iZ36MSV7OwaZs7i/jd8gSTE3mUMSY48MPyOQ9Cx/aR01ctFOxCl9ls0+r1Xhpo
 qnhx4tNZLyWj7Dpg0SjFxyw6KiHq8Kn57lBPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715627114; x=1716231914;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fq6qSplheU1t4SRTjoMlkRoBiGtUET8eBvYoUqawkbU=;
 b=b6rQ/KKFc+vGpIDgZ5b04DTp/cHYmAELj0zdZDplJOGd/P+dXaV7fpNzbpUipKnkwh
 MWpIe8DetRRSYOOJy9nzbewuqNEDKEQxsDiGm7QlFVlE3eCvFpXGYUUlG/iAMPBnznEU
 s9qxEKMXHaWPooSxQ324yZztzKZoCsx37hXVE16hHxdZQVaVPmEQdksidRNU0nUooD6A
 wnRVRLkh6IVD53/P1kdDu7wvX/NB3HXOYgJTcxhFIjNncloYiPZJxdefm4oPjwoeRKN7
 vF/n1osGOMpiWXCprd0IDgWDx/IJ9cyfcSd+iz46H8J2uHekG2Jd1glNdalGRiSlbbtE
 tMWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyKdNxx6aEAiGCLLr5736cjq8aASMRQXZutJNZ2TK42F1aKZFOCMdU8DpGaxKHN/Cfk2Xb7n3G781wcJKUR53pPBsVBGWH/n3RS6Th7g==
X-Gm-Message-State: AOJu0Yy9cbuzSVk6YP4Nbkpbn9ZEJcR8zCZ9sXlsF6WEL1Kq8NgJuon4
 WxxzdZcHjBGy4dIj2IIBlZm20ECsCHYGaZgWM1YpoHVI9B/B3OfpAARlwBt7HJ8f8AfNVtWdI0N
 MwdlxYLv5cNSzmNRBvfuzL4VaEAieMJJqMJKk
X-Google-Smtp-Source: AGHT+IF5HRbZ9Oo/aW6V23hgmYzhnxMqZZycRnZjIIq79TvBpjU6OASGCUe+8NuiByy3yNPO4+p5jFQzdITES5iKEnE=
X-Received: by 2002:a17:906:ae45:b0:a59:c208:a4c with SMTP id
 a640c23a62f3a-a5a2d583d60mr645641266b.17.1715627114268; Mon, 13 May 2024
 12:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <171511150704.1963160.10898754831133154623@8e613ede5ea5>
 <DM8PR11MB5655FA40AC90E66F60532A98E0E52@DM8PR11MB5655.namprd11.prod.outlook.com>
 <CAE72mNnZdxEFdMXrN0S1G4fx3btLWqEZzZjDFkvd4tmmtv7FXA@mail.gmail.com>
 <IA1PR11MB6348E96F7B76548E5A101208B2E72@IA1PR11MB6348.namprd11.prod.outlook.com>
 <DM8PR11MB565593183B579437602FACB6E0E72@DM8PR11MB5655.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB565593183B579437602FACB6E0E72@DM8PR11MB5655.namprd11.prod.outlook.com>
From: Manasi Navare <navaremanasi@chromium.org>
Date: Mon, 13 May 2024 12:05:03 -0700
Message-ID: <CAE72mNmNdmTjB-Wzrcg4Dp37MQMUN7QnVkpLqJYWx2qL0U5Rvw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_series_starting_with_?=
 =?UTF-8?Q?=5Bv3=2C1=2F2=5D_tests=2Fkms=5Fvrr=3A_Add_a_subtest_for_seamless_modeset_t?=
 =?UTF-8?Q?o_a_virtual_LRR_mode_=28rev3=29?=
To: "Saarinen, Jani" <jani.saarinen@intel.com>
Cc: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 Sean Paul <seanpaul@chromium.org>, 
 Drew Davenport <ddavenport@chromium.org>, 
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000b6a3ee06185a9034"
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

--000000000000b6a3ee06185a9034
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani, Bhanu,

I have retested this on my end and it runs as expected with VRR capable edp
and DP.
Could you please help getting this merged? We would like to have this run
as part of CI and our Chrome automation tests for testing seamless virtual
modes with VRR fastset framework.

Regards
Manasi

On Fri, May 10, 2024 at 5:32=E2=80=AFAM Saarinen, Jani <jani.saarinen@intel=
.com>
wrote:

> Hi,
>
> Also this was done
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11077 as BAT
> issues were re-reported, waiting for shards now
>
> Would be good to understand is this is real issue ?
>
>
>
> *From:* Golani, Mitulkumar Ajitkumar <
> mitulkumar.ajitkumar.golani@intel.com>
> *Sent:* Friday, 10 May 2024 14.00
> *To:* Manasi Navare <navaremanasi@chromium.org>
> *Cc:* igt-dev@lists.freedesktop.org; Saarinen, Jani <
> jani.saarinen@intel.com>; Modem, Bhanuprakash <
> bhanuprakash.modem@intel.com>; Sean Paul <seanpaul@chromium.org>; Drew
> Davenport <ddavenport@chromium.org>; I915-ci-infra@lists.freedesktop.org
> *Subject:* RE: =E2=9C=97 Fi.CI.BAT: failure for series starting with [v3,=
1/2]
> tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
> (rev3)
>
>
>
> Hi @Manasi Navare <navaremanasi@chromium.org>
>
>
> Hi there,
>
>
>
> Seems like following subtests were skipped:
>
>
> negative-basic(TEST_NEGATIVE) , seamless-rr-switch-vrr (Flag:
> TEST_SEAMLESS_VRR) , seamless-rr-switch-drrs (Flag: TEST_SEAMLESS_DRRS)
>
> negative-basic: This test is designed for non-VRR panels.
>
> seamless-rr-switch-vrr: Specifically for eDP configurations with VRR.
>
> seamless-rr-switch-drrs: Also eDP-specific, for DRRS.
>
>
> These skips were expected as a DP panel is connected on these machine
>
> Thanks
> Mitul
>
> *From:* Manasi Navare <navaremanasi@chromium.org>
> *Sent:* Thursday, May 9, 2024 9:54 PM
> *To:* Saarinen, Jani <jani.saarinen@intel.com>; Modem, Bhanuprakash <
> bhanuprakash.modem@intel.com>; Sean Paul <seanpaul@chromium.org>; Drew
> Davenport <ddavenport@chromium.org>; I915-ci-infra@lists.freedesktop.org
> *Cc:* igt-dev@lists.freedesktop.org
> *Subject:* Re: =E2=9C=97 Fi.CI.BAT: failure for series starting with [v3,=
1/2]
> tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
> (rev3)
>
>
>
> Hi Jani,
>
>
>
> Looks like all the VRR basic legacy tests are skipping as well, do none o=
f
> these devices have a VRR sink connected?
>
> It is expected to skip in that case. I will do some local testing on my
> device here and confirm.
>
> @Bhanuprakash Modem <bhanuprakash.modem@intel.com> , are these vrr basic
> skips expected?
>
>
>
> Regards
>
> Manasi
>
>
>
> On Tue, May 7, 2024 at 11:33=E2=80=AFPM Saarinen, Jani <jani.saarinen@int=
el.com>
> wrote:
>
> Hi Manasi
>
> Are those new results expected skips and thus issue can be reported ?
>
>
>
> *From:* igt-dev <igt-dev-bounces@lists.freedesktop.org> *On Behalf Of *
> Patchwork
> *Sent:* Tuesday, 7 May 2024 22.52
> *To:* Manasi Navare <navaremanasi@chromium.org>
> *Cc:* igt-dev@lists.freedesktop.org
> *Subject:* =E2=9C=97 Fi.CI.BAT: failure for series starting with [v3,1/2]
> tests/kms_vrr: Add a subtest for seamless modeset to a virtual LRR mode
> (rev3)
>
>
>
> *Patch Details*
>
> *Series:*
>
> series starting with [v3,1/2] tests/kms_vrr: Add a subtest for seamless
> modeset to a virtual LRR mode (rev3)
>
> *URL:*
>
> https://patchwork.freedesktop.org/series/132866/
>
> *State:*
>
> failure
>
> *Details:*
>
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html
> CI Bug Log - changes from CI_DRM_14723 -> IGTPW_11108 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_11108 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11108, please notify your bug team ('
> I915-ci-infra@lists.freedesktop.org') to allow them
> to document this new failure mode, which will reduce false positives in C=
I.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html
> Participating hosts (41 -> 40)
>
> Additional (3): fi-glk-j4005 bat-kbl-2 bat-jsl-1
> Missing (4): bat-dg2-11 bat-mtlp-9 fi-snb-2520m fi-bsw-n3050
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_11108=
:
> IGT changes Possible regressions
>
>    - igt@kms_vrr@max-min@pipe-a-dp-1:
>
>
>    - bat-adls-6: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/ig=
t@kms_vrr@max-min@pipe-a-dp-1.html>
>
>
>    - igt@kms_vrr@seamless-rr-switch-virtual (NEW):
>
>
>    - bat-arls-2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - {bat-arls-4}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-4/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-adlp-6: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-dg2-14: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-arls-3: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-jsl-3: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt=
@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-mtlp-8: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-adls-6: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-arls-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-dg1-7: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt=
@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-adlp-9: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - {bat-rpls-4}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rpls-4/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-adln-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - {bat-twl-1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt=
@kms_vrr@seamless-rr-switch-virtual.html>
>       - bat-rplp-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/=
igt@kms_vrr@seamless-rr-switch-virtual.html>
>       - fi-tgl-1115g4: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4=
/igt@kms_vrr@seamless-rr-switch-virtual.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@i915_module_load@load:
>
>
>    - {bat-apl-1}: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-apl-1/ig=
t@i915_module_load@load.html>
>       -> ABORT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-apl-1/igt=
@i915_module_load@load.html>
>
>
>    - igt@kms_vrr@seamless-rr-switch-vrr:
>
>
>    - {bat-twl-1}: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt=
@kms_vrr@seamless-rr-switch-vrr.html>
>       +2 other tests skip
>
> New tests
>
> New tests have been introduced between CI_DRM_14723 and IGTPW_11108:
> New IGT tests (1)
>
>    - igt@kms_vrr@seamless-rr-switch-virtual:
>
>
>    - Statuses : 38 skip(s)
>       - Exec time: [0.0, 0.00] s
>
> Known issues
>
> Here are the changes found in IGTPW_11108 that come from known issues:
> IGT changes Issues hit
>
>    - igt@debugfs_test@basic-hwmon:
>
>
>    - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@debugfs_test@basic-hwmon.html>
>       (i915#9318
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>
>
>    - igt@fbdev@info:
>
>
>    - bat-kbl-2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt=
@fbdev@info.html>
>       (i915#1849
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849>)
>
>
>    - igt@gem_huc_copy@huc-copy:
>
>
>    - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@gem_huc_copy@huc-copy.html>
>       (i915#2190
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>       - fi-glk-j4005: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/=
igt@gem_huc_copy@huc-copy.html>
>       (i915#2190
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>
>
>    - igt@gem_lmem_swapping@parallel-random-engines:
>
>
>    - bat-kbl-2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt=
@gem_lmem_swapping@parallel-random-engines.html>
>       +49 other tests skip
>       - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@gem_lmem_swapping@parallel-random-engines.html>
>       (i915#4613
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3
>       other tests skip
>       - fi-glk-j4005: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/=
igt@gem_lmem_swapping@parallel-random-engines.html>
>       (i915#4613
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>) +3
>       other tests skip
>
>
>    - igt@i915_pm_rpm@module-reload:
>
>
>    - bat-adlp-6: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14723/bat-adlp-6/i=
gt@i915_pm_rpm@module-reload.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/ig=
t@i915_pm_rpm@module-reload.html>
>       (i915#9427
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9427>) +2
>       other tests dmesg-warn
>
>
>    - igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>
>
>    - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html>
>       (i915#4103
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>) +1
>       other test skip
>
>
>    - igt@kms_dsc@dsc-basic:
>
>
>    - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@kms_dsc@dsc-basic.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>       i915#9886
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886>)
>
>
>    - igt@kms_force_connector_basic@force-load-detect:
>
>
>    - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@kms_force_connector_basic@force-load-detect.html>
>
>
>    - igt@kms_psr@psr-primary-page-flip:
>
>
>    - fi-glk-j4005: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/=
igt@kms_psr@psr-primary-page-flip.html>
>       +20 other tests skip
>
>
>    - igt@kms_vrr@flip-basic:
>
>
>    - bat-atsm-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-atsm-1/ig=
t@kms_vrr@flip-basic.html>
>       (i915#6078
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078>) +9
>       other tests skip
>       - bat-jsl-3: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt=
@kms_vrr@flip-basic.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3
>       other tests skip
>       - fi-ivb-3770: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ivb-3770/i=
gt@kms_vrr@flip-basic.html>
>       +9 other tests skip
>       - bat-mtlp-8: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/ig=
t@kms_vrr@flip-basic.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555> /
>       i915#8808
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +3
>       other tests skip
>       - fi-elk-e7500: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-elk-e7500/=
igt@kms_vrr@flip-basic.html>
>       +9 other tests skip
>       - bat-dg2-8: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-8/igt=
@kms_vrr@flip-basic.html>
>       (i915#9197
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197>) +9
>       other tests skip
>       - fi-kbl-guc: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-guc/ig=
t@kms_vrr@flip-basic.html>
>       +9 other tests skip
>       - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@kms_vrr@flip-basic.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4
>       other tests skip
>
>
>    - igt@kms_vrr@flip-basic-fastset:
>
>
>    - fi-pnv-d510: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-pnv-d510/i=
gt@kms_vrr@flip-basic-fastset.html>
>       +9 other tests skip
>       - bat-dg1-7: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt=
@kms_vrr@flip-basic-fastset.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3
>       other tests skip
>       - fi-kbl-7567u: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-7567u/=
igt@kms_vrr@flip-basic-fastset.html>
>       +9 other tests skip
>       - bat-adln-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/ig=
t@kms_vrr@flip-basic-fastset.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +2
>       other tests skip
>       - bat-rplp-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/ig=
t@kms_vrr@flip-basic-fastset.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +2
>       other tests skip
>       - fi-tgl-1115g4: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4=
/igt@kms_vrr@flip-basic-fastset.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3
>       other tests skip
>       - fi-cfl-guc: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-guc/ig=
t@kms_vrr@flip-basic-fastset.html>
>       +9 other tests skip
>       - bat-mtlp-6: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-6/ig=
t@kms_vrr@flip-basic-fastset.html>
>       (i915#9792
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792>) +9
>       other tests skip
>       - bat-adlp-6: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/ig=
t@kms_vrr@flip-basic-fastset.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1
>       other test skip
>
>
>    - igt@kms_vrr@flip-suspend:
>
>
>    - bat-rplp-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/ig=
t@kms_vrr@flip-suspend.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3
>       other tests skip
>       - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/=
igt@kms_vrr@flip-suspend.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4
>       other tests skip
>       - bat-dg1-7: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt=
@kms_vrr@flip-suspend.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4
>       other tests skip
>       - bat-adlp-11: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/i=
gt@kms_vrr@flip-suspend.html>
>       (i915#10470
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470> /
>       i915#10501
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501>) +6
>       other tests skip
>       - bat-adln-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/ig=
t@kms_vrr@flip-suspend.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +3
>       other tests skip
>       - fi-tgl-1115g4: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4=
/igt@kms_vrr@flip-suspend.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4
>       other tests skip
>
>
>    - igt@kms_vrr@flipline:
>
>
>    - bat-dg2-14: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/ig=
t@kms_vrr@flipline.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>) +4
>       other tests skip
>
>
>    - igt@kms_vrr@max-min:
>
>
>    - bat-adlm-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlm-1/ig=
t@kms_vrr@max-min.html>
>       (i915#9900
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9900>) +9
>       other tests skip
>       - bat-arls-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/ig=
t@kms_vrr@max-min.html>
>       (i915#8808
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +8
>       other tests skip
>       - bat-arls-3: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/ig=
t@kms_vrr@max-min.html>
>       (i915#8808
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +7
>       other tests skip
>       - bat-mtlp-8: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/ig=
t@kms_vrr@max-min.html>
>       (i915#8808
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808> /
>       i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3
>       other tests skip
>
>
>    - igt@kms_vrr@negative-basic:
>
>
>    - bat-adlp-9: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/ig=
t@kms_vrr@negative-basic.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       - bat-adls-6: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/ig=
t@kms_vrr@negative-basic.html>
>       (i915#3555
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>
>
>    - igt@kms_vrr@seamless-rr-switch-drrs:
>
>
>    - fi-cfl-8700k: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8700k/=
igt@kms_vrr@seamless-rr-switch-drrs.html>
>       +9 other tests skip
>       - fi-blb-e6850: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-blb-e6850/=
igt@kms_vrr@seamless-rr-switch-drrs.html>
>       +9 other tests skip
>       - bat-dg2-14: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/ig=
t@kms_vrr@seamless-rr-switch-drrs.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3
>       other tests skip
>       - fi-bsw-nick: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-bsw-nick/i=
gt@kms_vrr@seamless-rr-switch-drrs.html>
>       +9 other tests skip
>       - bat-jsl-3: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt=
@kms_vrr@seamless-rr-switch-drrs.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3
>       other tests skip
>
>
>    - igt@kms_vrr@seamless-rr-switch-virtual (NEW):
>
>
>    - bat-dg2-9: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-9/igt=
@kms_vrr@seamless-rr-switch-virtual.html>
>       (i915#9197
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197>) +9
>       other tests skip
>       - fi-kbl-x1275: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-x1275/=
igt@kms_vrr@seamless-rr-switch-virtual.html>
>       +9 other tests skip
>       - bat-adlp-11: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/i=
gt@kms_vrr@seamless-rr-switch-virtual.html>
>       (i915#10470
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470>) +2
>       other tests skip
>       - fi-cfl-8109u: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8109u/=
igt@kms_vrr@seamless-rr-switch-virtual.html>
>       +9 other tests skip
>       - fi-ilk-650: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ilk-650/ig=
t@kms_vrr@seamless-rr-switch-virtual.html>
>       +9 other tests skip
>
>
>    - igt@kms_vrr@seamless-rr-switch-vrr:
>
>
>    - bat-adlp-9: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/ig=
t@kms_vrr@seamless-rr-switch-vrr.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1
>       other test skip
>       - bat-adls-6: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/ig=
t@kms_vrr@seamless-rr-switch-vrr.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +1
>       other test skip
>       - bat-jsl-1: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt=
@kms_vrr@seamless-rr-switch-vrr.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3
>       other tests skip
>       - fi-rkl-11600: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/=
igt@kms_vrr@seamless-rr-switch-vrr.html>
>       (i915#9906
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>) +3
>       other tests skip
>       - bat-arls-2: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/ig=
t@kms_vrr@seamless-rr-switch-vrr.html>
>       (i915#8808
>       <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>) +2
>       other tests skip
>
> {name}: This element is suppressed. This means it is ignored when computi=
ng
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7838 -> IGTPW_11108
>
> CI-20190529: 20190529
> CI_DRM_14723: f58676e47c12a99409b71f7d3bab9f89e14522b4 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11108: 70f39756b8310ef49e565789055cfab85b5cef58 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
>

--000000000000b6a3ee06185a9034
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jani, Bhanu,<div><br></div><div>I have retested this on=
 my end and it runs as expected with VRR capable edp and DP.</div><div>Coul=
d you please help getting this merged? We would like to have this run as pa=
rt of CI and our Chrome automation tests for testing seamless virtual modes=
 with VRR fastset framework.</div><div><br></div><div>Regards</div><div>Man=
asi</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, May 10, 2024 at 5:32=E2=80=AFAM Saarinen, Jani &lt;<a href=
=3D"mailto:jani.saarinen@intel.com">jani.saarinen@intel.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"en-FI" style=3D"overflow-wrap: break-word;">
<div>
<p class=3D"MsoNormal"><span lang=3D"en-FI">Hi,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-FI">Also this was done
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11077" t=
arget=3D"_blank">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
077</a> as BAT issues were re-reported, waiting for shards now
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-FI">Would be good to understand is =
this is real issue ?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"en-FI"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Golani, Mitulkumar Ajitkumar &lt;<a href=3D"mailto:mitulkumar.a=
jitkumar.golani@intel.com" target=3D"_blank">mitulkumar.ajitkumar.golani@in=
tel.com</a>&gt;
<br>
<b>Sent:</b> Friday, 10 May 2024 14.00<br>
<b>To:</b> Manasi Navare &lt;<a href=3D"mailto:navaremanasi@chromium.org" t=
arget=3D"_blank">navaremanasi@chromium.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blan=
k">igt-dev@lists.freedesktop.org</a>; Saarinen, Jani &lt;<a href=3D"mailto:=
jani.saarinen@intel.com" target=3D"_blank">jani.saarinen@intel.com</a>&gt;;=
 Modem, Bhanuprakash &lt;<a href=3D"mailto:bhanuprakash.modem@intel.com" ta=
rget=3D"_blank">bhanuprakash.modem@intel.com</a>&gt;; Sean Paul &lt;<a href=
=3D"mailto:seanpaul@chromium.org" target=3D"_blank">seanpaul@chromium.org</=
a>&gt;; Drew Davenport &lt;<a href=3D"mailto:ddavenport@chromium.org" targe=
t=3D"_blank">ddavenport@chromium.org</a>&gt;; <a href=3D"mailto:I915-ci-inf=
ra@lists.freedesktop.org" target=3D"_blank">I915-ci-infra@lists.freedesktop=
.org</a><br>
<b>Subject:</b> RE: </span><span lang=3D"EN-US" style=3D"font-family:&quot;=
Segoe UI Symbol&quot;,sans-serif">=E2=9C=97</span><span lang=3D"EN-US"> Fi.=
CI.BAT: failure for series starting with [v3,1/2] tests/kms_vrr: Add a subt=
est for seamless modeset to a virtual LRR mode (rev3)<u></u><u></u></span><=
/p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Hi <a id=3D"m_19647676542543481=
21OWAAMADAC529919804AFD920C98C18C00189C" href=3D"mailto:navaremanasi@chromi=
um.org" target=3D"_blank">
<span style=3D"font-family:Calibri,sans-serif;text-decoration:none">@Manasi=
 Navare</span></a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><br>
Hi there,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Seems like following subtests w=
ere skipped:<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><br>
</span><span><span lang=3D"EN-IN">negative-basic(TEST_NEGATIVE) , seamless-=
rr-switch-vrr (Flag: TEST_SEAMLESS_VRR) , seamless-rr-switch-drrs (Flag:
</span></span><span lang=3D"EN-IN">TEST_SEAMLESS_DRRS)<br>
<br>
negative-basic: This test is designed for non-VRR panels.<u></u><u></u></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">seamless-rr-switch-vrr: Specifi=
cally for eDP configurations with VRR.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">seamless-rr-switch-drrs: Also e=
DP-specific, for DRRS.<u></u><u></u></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt"><span lang=3D"EN-IN"><b=
r>
These skips were expected as a DP panel is connected on these machine<br>
<br>
Thanks<br>
Mitul<u></u><u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Manasi Navare &lt;<a href=3D"mailto:navaremanasi@chromium.org" =
target=3D"_blank">navaremanasi@chromium.org</a>&gt;
<br>
<b>Sent:</b> Thursday, May 9, 2024 9:54 PM<br>
<b>To:</b> Saarinen, Jani &lt;<a href=3D"mailto:jani.saarinen@intel.com" ta=
rget=3D"_blank">jani.saarinen@intel.com</a>&gt;; Modem, Bhanuprakash &lt;<a=
 href=3D"mailto:bhanuprakash.modem@intel.com" target=3D"_blank">bhanuprakas=
h.modem@intel.com</a>&gt;; Sean Paul &lt;<a href=3D"mailto:seanpaul@chromiu=
m.org" target=3D"_blank">seanpaul@chromium.org</a>&gt;;
 Drew Davenport &lt;<a href=3D"mailto:ddavenport@chromium.org" target=3D"_b=
lank">ddavenport@chromium.org</a>&gt;;
<a href=3D"mailto:I915-ci-infra@lists.freedesktop.org" target=3D"_blank">I9=
15-ci-infra@lists.freedesktop.org</a><br>
<b>Cc:</b> <a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blan=
k">igt-dev@lists.freedesktop.org</a><br>
<b>Subject:</b> Re: </span><span lang=3D"EN-US" style=3D"font-family:&quot;=
Segoe UI Symbol&quot;,sans-serif">=E2=9C=97</span><span lang=3D"EN-US"> Fi.=
CI.BAT: failure for series starting with [v3,1/2] tests/kms_vrr: Add a subt=
est for seamless modeset to a virtual LRR mode (rev3)<u></u><u></u></span><=
/p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Hi Jani,<u></u><u></u></span></=
p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Looks like all the VRR basic le=
gacy tests are skipping as well, do none of these devices=C2=A0have a VRR s=
ink connected?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">It is expected to skip in that =
case. I will do some local testing on my device here and confirm.<u></u><u>=
</u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><a href=3D"mailto:bhanuprakash.=
modem@intel.com" target=3D"_blank">@Bhanuprakash Modem</a>=C2=A0, are these=
 vrr basic skips expected?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Regards<u></u><u></u></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Manasi<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">On Tue, May 7, 2024 at 11:33=E2=
=80=AFPM Saarinen, Jani &lt;<a href=3D"mailto:jani.saarinen@intel.com" targ=
et=3D"_blank">jani.saarinen@intel.com</a>&gt; wrote:<u></u><u></u></span></=
p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Hi Manasi<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">Are those new results expected =
skips and thus issue can be reported ?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">=C2=A0<u></u><u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> igt-dev &lt;<a href=3D"mailto:igt-dev-bounces@lists.freedesktop=
.org" target=3D"_blank">igt-dev-bounces@lists.freedesktop.org</a>&gt;
<b>On Behalf Of </b>Patchwork<br>
<b>Sent:</b> Tuesday, 7 May 2024 22.52<br>
<b>To:</b> Manasi Navare &lt;<a href=3D"mailto:navaremanasi@chromium.org" t=
arget=3D"_blank">navaremanasi@chromium.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blan=
k">igt-dev@lists.freedesktop.org</a><br>
<b>Subject:</b> </span><span lang=3D"EN-US" style=3D"font-family:&quot;Sego=
e UI Symbol&quot;,sans-serif">=E2=9C=97</span><span lang=3D"EN-US"> Fi.CI.B=
AT: failure for series starting with [v3,1/2] tests/kms_vrr: Add a subtest =
for seamless modeset to a virtual LRR mode (rev3)</span><span lang=3D"EN-IN=
"><u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-IN">=C2=A0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-IN">Patch Details</span></b><spa=
n lang=3D"EN-IN">
<u></u><u></u></span></p>
<table border=3D"0" cellspacing=3D"3" cellpadding=3D"0">
<tbody>
<tr>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal"><b>Series:</b><u></u><u></u></p>
</td>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal">series starting with [v3,1/2] tests/kms_vrr: Add a s=
ubtest for seamless modeset to a virtual LRR mode (rev3)<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal"><b>URL:</b><u></u><u></u></p>
</td>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal"><a href=3D"https://patchwork.freedesktop.org/series/=
132866/" target=3D"_blank">https://patchwork.freedesktop.org/series/132866/=
</a><u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal"><b>State:</b><u></u><u></u></p>
</td>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal">failure<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal"><b>Details:</b><u></u><u></u></p>
</td>
<td style=3D"padding:2pt">
<p class=3D"MsoNormal"><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_11108/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_11108/index.html</a><u></u><u></u></p>
</td>
</tr>
</tbody>
</table>
<h1><span lang=3D"EN-IN">CI Bug Log - changes from CI_DRM_14723 -&gt; IGTPW=
_11108<u></u><u></u></span></h1>
<h2><span lang=3D"EN-IN">Summary<u></u><u></u></span></h2>
<p><strong><span lang=3D"EN-IN" style=3D"font-family:Calibri,sans-serif">FA=
ILURE</span></strong><span lang=3D"EN-IN"><u></u><u></u></span></p>
<p><span lang=3D"EN-IN">Serious unknown changes coming with IGTPW_11108 abs=
olutely need to be<br>
verified manually.<u></u><u></u></span></p>
<p><span lang=3D"EN-IN">If you think the reported changes have nothing to d=
o with the changes<br>
introduced in IGTPW_11108, please notify your bug team (&#39;<a href=3D"mai=
lto:I915-ci-infra@lists.freedesktop.org" target=3D"_blank">I915-ci-infra@li=
sts.freedesktop.org</a>&#39;) to allow them<br>
to document this new failure mode, which will reduce false positives in CI.=
<u></u><u></u></span></p>
<p><span lang=3D"EN-IN">External URL: <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_11108/index.html" target=3D"_blank">
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11108/index.html</a><u></u><=
u></u></span></p>
<h2><span lang=3D"EN-IN">Participating hosts (41 -&gt; 40)<u></u><u></u></s=
pan></h2>
<p><span lang=3D"EN-IN">Additional (3): fi-glk-j4005 bat-kbl-2 bat-jsl-1 <b=
r>
Missing (4): bat-dg2-11 bat-mtlp-9 fi-snb-2520m fi-bsw-n3050 <u></u><u></u>=
</span></p>
<h2><span lang=3D"EN-IN">Possible new issues<u></u><u></u></span></h2>
<p><span lang=3D"EN-IN">Here are the unknown changes that may have been int=
roduced in IGTPW_11108:<u></u><u></u></span></p>
<h3><span lang=3D"EN-IN">IGT changes<u></u><u></u></span></h3>
<h4><span lang=3D"EN-IN">Possible regressions<u></u><u></u></span></h4>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@max-min@pipe-a-dp-1:<u></u><u></u></span><=
/li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adls-6: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@max-min@pipe-a-dp=
-1.html" target=3D"_blank">
FAIL</a><u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@seamless-rr-switch-virtual (NEW):<u></u><u=
></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-arls-2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">{bat-arls-4}: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-4/igt@kms_vrr@seamless-rr-swi=
tch-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlp-6: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-dg2-14: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-arls-3: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-3: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-=
virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-mtlp-8: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adls-6: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-=
virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-arls-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-dg1-7: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@seamless-rr-switch-=
virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlp-9: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">{bat-rpls-4}: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/bat-rpls-4/igt@kms_vrr@seamless-rr-swi=
tch-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adln-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">{bat-twl-1}: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-rplp-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-rkl-11600: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-s=
witch-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-tgl-1115g4: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@seamless-rr=
-switch-virtual.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li></ul>
</ul>
<h4><span lang=3D"EN-IN">Suppressed<u></u><u></u></span></h4>
<p><span lang=3D"EN-IN">The following results come from untrusted machines,=
 tests, or statuses.<br>
They do not affect the overall result.<u></u><u></u></span></p>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@i915_module_load@load:<u></u><u></u></span></li></=
ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">{bat-apl-1}: <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_14723/bat-apl-1/igt@i915_module_load@load.html" target=3D=
"_blank">
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11=
108/bat-apl-1/igt@i915_module_load@load.html" target=3D"_blank">
ABORT</a><u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@seamless-rr-switch-vrr:<u></u><u></u></spa=
n></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">{bat-twl-1}: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11108/bat-twl-1/igt@kms_vrr@seamless-rr-switc=
h-vrr.html" target=3D"_blank">
SKIP</a> +2 other tests skip<u></u><u></u></span></li></ul>
</ul>
<h2><span lang=3D"EN-IN">New tests<u></u><u></u></span></h2>
<p><span lang=3D"EN-IN">New tests have been introduced between CI_DRM_14723=
 and IGTPW_11108:<u></u><u></u></span></p>
<h3><span lang=3D"EN-IN">New IGT tests (1)<u></u><u></u></span></h3>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@seamless-rr-switch-virtual:<u></u><u></u><=
/span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">Statuses : 38 skip(s)<u></u><u></u></span></li><li cla=
ss=3D"MsoNormal">
<span lang=3D"EN-IN">Exec time: [0.0, 0.00] s<u></u><u></u></span></li></ul=
>
</ul>
<h2><span lang=3D"EN-IN">Known issues<u></u><u></u></span></h2>
<p><span lang=3D"EN-IN">Here are the changes found in IGTPW_11108 that come=
 from known issues:<u></u><u></u></span></p>
<h3><span lang=3D"EN-IN">IGT changes<u></u><u></u></span></h3>
<h4><span lang=3D"EN-IN">Issues hit<u></u><u></u></span></h4>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@debugfs_test@basic-hwmon:<u></u><u></u></span></li=
></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@debugfs_test@basic-hwmon.ht=
ml" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9318" target=3D"_blank">i915#9318</a>)<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@fbdev@info:<u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-kbl-2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@fbdev@info.html" target=3D"=
_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/1849" target=3D"_blank">i915#1849</a>)<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@gem_huc_copy@huc-copy:<u></u><u></u></span></li></=
ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_huc_copy@huc-copy.html"=
 target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2190" target=3D"_blank">i915#2190</a>)<u></u><u></u></span></li><li class=
=3D"MsoNormal">
<span lang=3D"EN-IN">fi-glk-j4005: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_huc_copy@huc-copy=
.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2190" target=3D"_blank">i915#2190</a>)<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@gem_lmem_swapping@parallel-random-engines:<u></u><=
u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-kbl-2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-kbl-2/igt@gem_lmem_swapping@parallel-=
random-engines.html" target=3D"_blank">
SKIP</a> +49 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorm=
al">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@gem_lmem_swapping@parallel-=
random-engines.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4613" target=3D"_blank">i915#4613</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-glk-j4005: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@gem_lmem_swapping@par=
allel-random-engines.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4613" target=3D"_blank">i915#4613</a>) +3 other tests skip<u></u><u></u><=
/span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@i915_pm_rpm@module-reload:<u></u><u></u></span></l=
i></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlp-6: <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_14723/bat-adlp-6/igt@i915_pm_rpm@module-reload.html" targe=
t=3D"_blank">
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11=
108/bat-adlp-6/igt@i915_pm_rpm@module-reload.html" target=3D"_blank">
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9427" target=3D"_blank">i915#9427</a>) +2 other tests dmesg-warn<u>=
</u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_cursor_legacy@basic-busy-flip-before-cursor-le=
gacy:<u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-legacy.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4103" target=3D"_blank">i915#4103</a>) +1 other test skip<u></u><u></u></=
span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_dsc@dsc-basic:<u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_dsc@dsc-basic.html" tar=
get=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886" ta=
rget=3D"_blank">
i915#9886</a>)<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_force_connector_basic@force-load-detect:<u></u=
><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_force_connector_basic@f=
orce-load-detect.html" target=3D"_blank">
SKIP</a><u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_psr@psr-primary-page-flip:<u></u><u></u></span=
></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-glk-j4005: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-glk-j4005/igt@kms_psr@psr-primary-p=
age-flip.html" target=3D"_blank">
SKIP</a> +20 other tests skip<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@flip-basic:<u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-atsm-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-atsm-1/igt@kms_vrr@flip-basic.html" =
target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/6078" target=3D"_blank">i915#6078</a>) +9 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-3: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@flip-basic.html" ta=
rget=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-ivb-3770: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11108/fi-ivb-3770/igt@kms_vrr@flip-basic.html=
" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-mtlp-8: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@flip-basic.html" =
target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808" ta=
rget=3D"_blank">
i915#8808</a>) +3 other tests skip<u></u><u></u></span></li><li class=3D"Ms=
oNormal">
<span lang=3D"EN-IN">fi-elk-e7500: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-elk-e7500/igt@kms_vrr@flip-basic.ht=
ml" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-dg2-8: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-8/igt@kms_vrr@flip-basic.html" ta=
rget=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9197" target=3D"_blank">i915#9197</a>) +9 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-kbl-guc: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-guc/igt@kms_vrr@flip-basic.html" =
target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@flip-basic.html" ta=
rget=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +4 other tests skip<u></u><u></u><=
/span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@flip-basic-fastset:<u></u><u></u></span></=
li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-pnv-d510: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11108/fi-pnv-d510/igt@kms_vrr@flip-basic-fast=
set.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-dg1-7: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-basic-fastset.=
html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-kbl-7567u: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-7567u/igt@kms_vrr@flip-basic-fa=
stset.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-adln-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-basic-fastse=
t.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +2 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-rplp-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-basic-fastse=
t.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +2 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-tgl-1115g4: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-basic-=
fastset.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-cfl-guc: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-guc/igt@kms_vrr@flip-basic-fastse=
t.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-mtlp-6: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-6/igt@kms_vrr@flip-basic-fastse=
t.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9792" target=3D"_blank">i915#9792</a>) +9 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlp-6: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-6/igt@kms_vrr@flip-basic-fastse=
t.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +1 other test skip<u></u><u></u></=
span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@flip-suspend:<u></u><u></u></span></li></u=
l>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-rplp-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-rplp-1/igt@kms_vrr@flip-suspend.html=
" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-rkl-11600: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@flip-suspend.=
html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +4 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-dg1-7: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-dg1-7/igt@kms_vrr@flip-suspend.html" =
target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +4 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlp-11: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@flip-suspend.ht=
ml" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/10470" target=3D"_blank">i915#10470</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10501" t=
arget=3D"_blank">
i915#10501</a>) +6 other tests skip<u></u><u></u></span></li><li class=3D"M=
soNormal">
<span lang=3D"EN-IN">bat-adln-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adln-1/igt@kms_vrr@flip-suspend.html=
" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-tgl-1115g4: NOTRUN -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_11108/fi-tgl-1115g4/igt@kms_vrr@flip-suspen=
d.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +4 other tests skip<u></u><u></u><=
/span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@flipline:<u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-dg2-14: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@flipline.html" ta=
rget=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>) +4 other tests skip<u></u><u></u><=
/span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@max-min:<u></u><u></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlm-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlm-1/igt@kms_vrr@max-min.html" tar=
get=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9900" target=3D"_blank">i915#9900</a>) +9 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-arls-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-1/igt@kms_vrr@max-min.html" tar=
get=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8808" target=3D"_blank">i915#8808</a>) +8 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-arls-3: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-3/igt@kms_vrr@max-min.html" tar=
get=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8808" target=3D"_blank">i915#8808</a>) +7 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-mtlp-8: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-mtlp-8/igt@kms_vrr@max-min.html" tar=
get=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8808" target=3D"_blank">i915#8808</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" ta=
rget=3D"_blank">
i915#9906</a>) +3 other tests skip<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@negative-basic:<u></u><u></u></span></li><=
/ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlp-9: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@negative-basic.ht=
ml" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>)<u></u><u></u></span></li><li class=
=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adls-6: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@negative-basic.ht=
ml" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3555" target=3D"_blank">i915#3555</a>)<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@seamless-rr-switch-drrs:<u></u><u></u></sp=
an></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-cfl-8700k: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8700k/igt@kms_vrr@seamless-rr-s=
witch-drrs.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">fi-blb-e6850: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-blb-e6850/igt@kms_vrr@seamless-rr-s=
witch-drrs.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-dg2-14: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-14/igt@kms_vrr@seamless-rr-switc=
h-drrs.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-bsw-nick: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11108/fi-bsw-nick/igt@kms_vrr@seamless-rr-swi=
tch-drrs.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-jsl-3: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-3/igt@kms_vrr@seamless-rr-switch-=
drrs.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +3 other tests skip<u></u><u></u><=
/span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@seamless-rr-switch-virtual (NEW):<u></u><u=
></u></span></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-dg2-9: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-dg2-9/igt@kms_vrr@seamless-rr-switch-=
virtual.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9197" target=3D"_blank">i915#9197</a>) +9 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-kbl-x1275: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-kbl-x1275/igt@kms_vrr@seamless-rr-s=
witch-virtual.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">bat-adlp-11: NOTRUN -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-11/igt@kms_vrr@seamless-rr-swi=
tch-virtual.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/10470" target=3D"_blank">i915#10470</a>) +2 other tests skip<u></u><u></u=
></span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-cfl-8109u: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-cfl-8109u/igt@kms_vrr@seamless-rr-s=
witch-virtual.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li><li class=3D"MsoNorma=
l">
<span lang=3D"EN-IN">fi-ilk-650: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/fi-ilk-650/igt@kms_vrr@seamless-rr-switc=
h-virtual.html" target=3D"_blank">
SKIP</a> +9 other tests skip<u></u><u></u></span></li></ul>
</ul>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">igt@kms_vrr@seamless-rr-switch-vrr:<u></u><u></u></spa=
n></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adlp-9: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adlp-9/igt@kms_vrr@seamless-rr-switc=
h-vrr.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +1 other test skip<u></u><u></u></=
span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-adls-6: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-adls-6/igt@kms_vrr@seamless-rr-switc=
h-vrr.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +1 other test skip<u></u><u></u></=
span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-jsl-1: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_11108/bat-jsl-1/igt@kms_vrr@seamless-rr-switch-=
vrr.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">fi-rkl-11600: NOTRUN -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_11108/fi-rkl-11600/igt@kms_vrr@seamless-rr-s=
witch-vrr.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9906" target=3D"_blank">i915#9906</a>) +3 other tests skip<u></u><u></u><=
/span></li><li class=3D"MsoNormal">
<span lang=3D"EN-IN">bat-arls-2: NOTRUN -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11108/bat-arls-2/igt@kms_vrr@seamless-rr-switc=
h-vrr.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/8808" target=3D"_blank">i915#8808</a>) +2 other tests skip<u></u><u></u><=
/span></li></ul>
</ul>
<p><span lang=3D"EN-IN">{name}: This element is suppressed. This means it i=
s ignored when computing<br>
the status of the difference (SUCCESS, WARNING, or FAILURE).<u></u><u></u><=
/span></p>
<h2><span lang=3D"EN-IN">Build changes<u></u><u></u></span></h2>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<span lang=3D"EN-IN">CI: CI-20190529 -&gt; None<u></u><u></u></span></li><l=
i class=3D"MsoNormal">
<span lang=3D"EN-IN">IGT: IGT_7838 -&gt; IGTPW_11108<u></u><u></u></span></=
li></ul>
<p><span lang=3D"EN-IN">CI-20190529: 20190529<br>
CI_DRM_14723: f58676e47c12a99409b71f7d3bab9f89e14522b4 @ git://<a href=3D"h=
ttp://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.freed=
esktop.org/gfx-ci/linux</a><br>
IGTPW_11108: 70f39756b8310ef49e565789055cfab85b5cef58 @ <a href=3D"https://=
gitlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ <a href=3D"https://git=
lab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><u></u><u></u></spa=
n></p>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000b6a3ee06185a9034--
