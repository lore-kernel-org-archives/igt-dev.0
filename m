Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EC4C0218B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 11:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02B310E55E;
	Tue, 21 Jan 2025 11:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nFZTpZQc";
	dkim-atps=neutral
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A02010E55E;
 Tue, 21 Jan 2025 11:09:40 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ee8aa26415so9323301a91.1; 
 Tue, 21 Jan 2025 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737457719; x=1738062519; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VArTLW1UMvpap1+r/W+408dsJtrVnF+QUUPd15Wpo6s=;
 b=nFZTpZQcxrOvvUhC6xAcs4XJlDmSAhoYpmJkEwrPdBGv8lnPATF8bTEvlPpjza06jf
 qjMHrZz8m02d4UAiaFw47wRlHr1/tlx+4ZGjMWhm1IfSO8n472L92Rw/Nc4nOYXo1HcV
 VJpDMoYNEK77CGFsmbggOdstXdKFGzeBCvRq7u7El4ns78cM+FEOIC5hMyxAHwyvYO4/
 3ZUXiHxpcuANpbz8RA2M2BAD1EHwWClwRzJWSpxT6BJoyQjBC4pUscljBzhpD0rnomha
 8YiGar4nyZF+HV1gaJce6sZX4r72QXyTmqJUi9YcgXFSzInzrkdCenAOoKNi17308Pji
 sw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737457719; x=1738062519;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VArTLW1UMvpap1+r/W+408dsJtrVnF+QUUPd15Wpo6s=;
 b=AOaB36vET8tjjAZXVrkdofNAI48lF4zk1H0dPAe4Blr/g6i3XDIG33Ity0TfS57TMx
 gW8mPVqF/LhSvm/9zlAXq8xACYHsy30yw9Ebz4KhMZj2NoHWyI0F6omX6aQlT9R8kthf
 zrqGUDpoqOkF0jjdzAT+x3EQPmBs3iVD58EqvT4lcmC9/jPok3FEZywPNZlLNHZ79rMK
 uj5pYtRsYpNF1CblyAbO5N5LXABZG5kTZe5/+AaihLx7lGEKvSraygiyHUeqhhI4HoQE
 aSZiXNyjGNFz4EpU7B7QsCCG/QwdIz9iv0BRPD0B0kwldh7ZR3tHJVZkfe3sHaCWuE5N
 2mbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHpZqQ5GNE5D2ltvD8y91OpMpZbWincJhJmhZyxGjR/ZN43+a6A00zc3ldre+oASGitRRfQ7dYBdPI/073@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqFqIjhSrVVKoFg1ERDVEG2tWK0WNdEvO3ABkez3sK1PvfSd/Z
 sEMPSGQbdApPGCmo5oy0TKbacn9JM3HZZ/jb6ypIali1zfEk6Ky5Q6ro6C8WY8FXtj2uqJGbeuy
 h1EjlLoo6yT6v5E6NxAkaEXF8oiYtv7Wdu/8=
X-Gm-Gg: ASbGncuxumdnpEopO6xEJdaqZBFl47ba+xGLHILayAHCBRqm6+Ambe6xqYvHMSdbwoH
 kl0emxDy+YoFUUZjs43AO6F7HtRrStyce3DjcCEm13XhTbVfTrloK
X-Google-Smtp-Source: AGHT+IFf6CnmiyhJUCG2+IS4COhe4xlXstlfeBxRq21ncUeB4U7dPWYh0vGGUyhQdTCpug0SiQZf4UggNcwwAAlmewQ=
X-Received: by 2002:a05:6a00:ad8a:b0:72a:bc54:84f7 with SMTP id
 d2e1a72fcca58-72dafa03117mr23408214b3a.12.1737457719082; Tue, 21 Jan 2025
 03:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20250120171021.1029868-1-george.zhang@amd.com>
 <173741053706.2329094.3027441962775722020@b555e5b46a47>
In-Reply-To: <173741053706.2329094.3027441962775722020@b555e5b46a47>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Tue, 21 Jan 2025 13:08:25 +0200
X-Gm-Features: AbW1kva9cShm3Qe07di__W1KwB6xem7kAIZo4W1AoFBUIdwQYUv7MT0Eao1KCW8
Message-ID: <CAJ=qYWTCBDQp-POPzcd6G18DqnZwcmQpf60oer=L+K3YYskfYw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests=2Fkms=5Faddfb=5Fbas?=
 =?UTF-8?Q?ic=3A_Fix_addfb25=5Ftests_to_not_require_intel_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Cc: "Zhang, George" <george.zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

@I915-ci-infra@lists.freedesktop.org These newly spotted regressions
(on this i915 bat and xe full run results) have nothing to do with
this patch, here is just relaxed one subtest group to run on other
than Intel hw hence Intel results shouldn't change because of this
change.

/Juha-Pekka

On Tue, Jan 21, 2025 at 12:02=E2=80=AFAM Patchwork
<patchwork@emeril.freedesktop.org> wrote:
>
> Patch Details
> Series:tests/kms_addfb_basic: Fix addfb25_tests to not require intel (rev=
2)
> URL:https://patchwork.freedesktop.org/series/143739/
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12469/index.html
>
> CI Bug Log - changes from IGT_8199 -> IGTPW_12469
>
> Summary
>
> FAILURE
>
> Serious unknown changes coming with IGTPW_12469 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12469, please notify your bug team (I915-ci-infra@lis=
ts.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in C=
I.
>
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12469/index.=
html
>
> Participating hosts (39 -> 41)
>
> Additional (2): fi-bsw-nick fi-elk-e7500
>
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_12469=
:
>
> IGT changes
>
> Possible regressions
>
> igt@i915_pm_rpm@module-reload:
>
> fi-cfl-8700k: PASS -> ABORT
>
> Known issues
>
> Here are the changes found in IGTPW_12469 that come from known issues:
>
> IGT changes
>
> Issues hit
>
> igt@fbdev@info:
>
> fi-bsw-nick: NOTRUN -> SKIP (i915#1849)
>
> igt@gem_lmem_swapping@parallel-random-engines:
>
> fi-bsw-nick: NOTRUN -> SKIP +43 other tests skip
>
> igt@gem_mmap@basic:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#4083)
>
> igt@gem_tiled_blits@basic:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>
> igt@gem_tiled_pread_basic:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#4079) +1 other test skip
>
> igt@i915_pm_rps@basic-api:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#11681 / i915#6621)
>
> igt@i915_selftest@live:
>
> bat-twl-1: PASS -> ABORT (i915#12919 / i915#13503)
>
> igt@i915_selftest@live@gt_mocs:
>
> bat-twl-1: PASS -> ABORT (i915#12919)
>
> igt@i915_selftest@live@workarounds:
>
> bat-arlh-3: PASS -> DMESG-FAIL (i915#12061) +1 other test dmesg-fail
> bat-arls-5: PASS -> DMESG-FAIL (i915#12061) +1 other test dmesg-fail
>
> igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#5190)
>
> igt@kms_addfb_basic@basic-y-tiled-legacy:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#4215 / i915#5190)
>
> igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#4212) +7 other tests skip
>
> igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test skip
>
> igt@kms_dsc@dsc-basic:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#3555 / i915#3840)
>
> igt@kms_force_connector_basic@force-load-detect:
>
> bat-dg2-13: NOTRUN -> SKIP
>
> igt@kms_force_connector_basic@prune-stale-modes:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#5274)
>
> igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-1:
>
> fi-elk-e7500: NOTRUN -> SKIP +24 other tests skip
>
> igt@kms_pm_backlight@basic-brightness:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#5354)
>
> igt@kms_psr@psr-primary-page-flip:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#1072 / i915#9732) +3 other tests skip
>
> igt@kms_setmode@basic-clone-single-crtc:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#3555)
>
> igt@prime_vgem@basic-fence-flip:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#3708)
>
> igt@prime_vgem@basic-fence-mmap:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test skip
>
> igt@prime_vgem@basic-write:
>
> bat-dg2-13: NOTRUN -> SKIP (i915#3291 / i915#3708) +2 other tests skip
>
> Possible fixes
>
> igt@i915_module_load@load:
>
> bat-dg2-13: ABORT (i915#13530) -> PASS
>
> igt@i915_selftest@live@workarounds:
>
> {bat-arls-6}: DMESG-FAIL (i915#12061) -> PASS +1 other test pass
>
> {name}: This element is suppressed. This means it is ignored when computi=
ng
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
> Build changes
>
> CI: CI-20190529 -> None
> IGT: IGT_8199 -> IGTPW_12469
> Linux: CI_DRM_15983 -> CI_DRM_15985
>
> CI-20190529: 20190529
> CI_DRM_15983: 4d9c78b35c395ed49796502224f3a421b0ce65ef @ git://anongit.fr=
eedesktop.org/gfx-ci/linux
> CI_DRM_15985: fb87b4e061d1844beaca66c8446cfcf60db99a23 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux
> IGTPW_12469: 27414070fc43f52e70d66da13ee97d856fcb0373 @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git
> IGT_8199: 8df1895672949617992cddbc33c5d683865879e8 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git
