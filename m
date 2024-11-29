Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2F0D6EBE6
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 08:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A720F10E125;
	Fri, 29 Nov 2024 08:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjdbQgA9";
	dkim-atps=neutral
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117310E125
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 08:11:32 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7fc2dbee20fso1161410a12.3
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 00:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732867892; x=1733472692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH3JRFYR9TSjCeLs8aD9sNCL4sq6p0TBqVfwMNVcXzI=;
 b=PjdbQgA9KPz7xHErnR4zLRi397O36rImOiyFWVU1Epe55+UwNqNodbgX/+HzdYNgVW
 hr8spK3CQrNCd2vIfZcLzq6clBtUnVgYgJYE23ycaKpWTK1p/2n0I0qQfwRLYAvclK+i
 omerBy2vGCUSCCoApT+LBcyBeFqIRmvnNW7ucU70uQOYM37KNNvuw6vpakjw4KcBLnKz
 zu/1ZwkZzvnT7+apZR0tawy6UdsYv90HRbdP2GrU4joFU8ax1FAh+5ZQXcnjyNk5AD2G
 aJb45/qXtUUoxC3u5qqCPRPV9pRp2aKZjudY8HkWaQe7P7611KlTted9rTFJ9K8058sg
 CQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732867892; x=1733472692;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eH3JRFYR9TSjCeLs8aD9sNCL4sq6p0TBqVfwMNVcXzI=;
 b=AsLj70oswPPQ95C/qJwLnKfiusFamIcRIJfKkAySVIv3M7cbtAfPGZU+CroBeicp/Z
 ehJcs3OU9qmyDdgtv9U6oDKbraeEt+2utRWIRNjqYE1eWYK7nNSZ++1JYy3xWzJ2CdTe
 jMowTPJdBgZmAmTg8Bjon1DKLi+P5hDY0BLfKy2vna+wmJtLj2cQwvWIQOMiGa6Q7M1m
 FKmfZ/3UKea9wmoCylL6XCG44nHSahmUX9uxDFENhto6qYAgNtE72ieM3zkt9u9r/UrY
 mxdUg87QfsL7QdBsmS0SndOjn099CsK7OeqGDWeUtM3Z7HmOI+q2NvcAEyFUhacB8kUn
 E/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWPJLJRZSEfsVyWn6LoEQPmhovvGMn8nx3zaabEmAMEaouUch/Up+kw9pPvPrhKu9PtKuXNL5a@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztpQb2sPnbGLV5G1jZCFIlsj/w2ZWqKNlYe505ESiLOxnWpThR
 11vQP8retrI45oFiPhQE0mJLyYM0Z0KlOwjR7VCpzM7MKqshGdFJneXlbVhKRPD6g4blo9EhHyl
 caoVSYNyFBUhEwf5qCtuNZpZbGcxuG50qWXs=
X-Gm-Gg: ASbGnctNjAdFR5i802BAuS2IhexU8LpPMCpqVs15kvQjptxYPNvxHbymkqteAKE4BZf
 UE2f+zPLMTtVCRaGwferlakSLHJOGiSvKqg==
X-Google-Smtp-Source: AGHT+IG/lLL88H88axRUhnb7h1H7VC5ywxpYTu7cqo9OajicdleDe9vZzbLLyDPckWKuxit6ZKAwF8XsWjVnXmCtzr4=
X-Received: by 2002:a17:90b:52c3:b0:2ee:5691:774e with SMTP id
 98e67ed59e1d1-2ee56917798mr2403453a91.2.1732867892053; Fri, 29 Nov 2024
 00:11:32 -0800 (PST)
MIME-Version: 1.0
References: <20241125171028.383914-1-jeevan.b@intel.com>
 <Z0TAXl62KunlTuxl@intel.com>
 <8af2561a-2b0d-4c69-8f01-3012e3db8ab8@intel.com>
In-Reply-To: <8af2561a-2b0d-4c69-8f01-3012e3db8ab8@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Fri, 29 Nov 2024 10:11:20 +0200
Message-ID: <CAJ=qYWQviTq5O6Zfpg5jExJPS4u74bNnNea24J1zUoPq4V-Xkw@mail.gmail.com>
Subject: Re: [PATCH] tests/intel/kms_pm_rpm: Update cursor_fb3 framebuffer
 creation format
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Jeevan B <jeevan.b@intel.com>, 
 igt-dev@lists.freedesktop.org
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

On Tue, Nov 26, 2024 at 2:02=E2=80=AFPM Sharma, Swati2 <swati2.sharma@intel=
.com> wrote:
>
> Hi Rodrigo,
>
> On 25-11-2024 11:52 pm, Rodrigo Vivi wrote:
> > On Mon, Nov 25, 2024 at 10:40:28PM +0530, Jeevan B wrote:
> >> Updated cursor_fb3 framebuffer creation in the cursor subtest function
> >> to use linear tiling instead of x-tile. As x-tile is no longer support=
ed
> >> on latest platforms.
> > Shouldn't we then add a new format without removing the old ones?
> > Otherwise it looks like you are removing coverage on old platforms.
> Is there any specific reason why x tiling was used initially? Any idea?
> Isn't linear tiling common across all platforms?

Look like that test will need to be looked at bit more detail than
just switch the tiling. Anyway to me it look like Jeevan's patch is
incorrect because this test seem to be trying something with fences,
removing tiling here would invalidate the test. Probably there should
be required gem_require_mappable_ggtt(..) unless the test can be
otherwise rewritten.

> >> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> >> ---
> >>   tests/intel/kms_pm_rpm.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
> >> index 990c50915..aeeaf69f7 100644
> >> --- a/tests/intel/kms_pm_rpm.c
> >> +++ b/tests/intel/kms_pm_rpm.c
> >> @@ -1199,7 +1199,7 @@ static void cursor_subtest(bool dpms)
> >>      igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >>                    DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
> >>      igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
> >> -                  I915_FORMAT_MOD_X_TILED, &cursor_fb3);
> >> +                  DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
> >>
> >>      fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
> >>      fill_igt_fb(&cursor_fb2, 0xFF00FF00);
> >> --
> >> 2.25.1
> >>
