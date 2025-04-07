Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B1C36010
	for <igt-dev@archiver.kernel.org>; Mon,  7 Apr 2025 07:37:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB94B10E29C;
	Mon,  7 Apr 2025 07:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FgKMrCUA";
	dkim-atps=neutral
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDFC10E29C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Apr 2025 07:37:50 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-22423adf751so37733465ad.2
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Apr 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744011465; x=1744616265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CdVj/s4kbnkcnCwfY3cURFze/Svd6JNBJXBGcZJUi6M=;
 b=FgKMrCUA0CJ55kR6GT4gRIJRCzih0RILCCZiOVLxb8yzX6eQFCmzo8zrmjd4ONba/z
 Rnyy6r8yup7EmjtyHoWucGFMB74TMJPgC8JBD+lUL0dKL/ykKdabFJ6FhmuwDc0SnlmK
 5uzQ2I08QKDpgeLslhuYSuPyw+TNuTB+rbL3LHuABHQj/Pod679M+x0yBVSEgdwYO7L6
 XEZSUycniZ5o86xwsCkRzqF17NjBCLwea+Dn9uHlWNrGGBUHS4mL5ScbSGp14atVPwno
 q2YPJ+pc+qqFqIyHvzYOjx8HDbh+XDK1RL1bRPfly/82YD8BD3UzFRdBkSwln5Fqfv4e
 8QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744011465; x=1744616265;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CdVj/s4kbnkcnCwfY3cURFze/Svd6JNBJXBGcZJUi6M=;
 b=FM+RLy2HbHY3pXE3r6cY+4pDf1/aw6/zEGU0KtHBhyUncTdVoOJyM8PcxjRw51QFUa
 h68Tfh75pV+i6/S80oTmvNtcGjI3sf/7adjUA2WoAfVQ00U61AKgd8ctVTlUkcr0HriY
 Z25Kax++R4f69f581ymt0bM8zKP4wMZZVozJ0j5xdx/SCHoSZcwJgYM5s2M89znPtBju
 njjQX8Oj0ysFyNpB9VVLHRNYrXHNPZZbVo9FS3q1AJE9gGNJOaIBg4/27EdTb2oUZ3zS
 jC7HgqaoE9J4dAvWd2GAlA9a9g9lc0Wjlj5cisPYyOZVpZUeo+stV2rlx96limPle9UV
 kn7A==
X-Gm-Message-State: AOJu0YxRSE2LWW2sP5ukQNld7TIsEjE5DwxUMDPuMU3rKZQUb/UqypVX
 ewdpl0hnI2UJw25C89zldI3Sf5729O+vTe/qScxVDFD6J4YfzyOdrVQQSsN1Mvm1o6LsPDzATpQ
 Y7DUDgpvhFnw5JefzxvH5k7DVAnk=
X-Gm-Gg: ASbGncugvxhTMdKtaLCpRH480lDWjPvsH3uc2iUZDtlSy7KuHHHQJjCbbANG+BcOE1E
 5gFQ/F229Uey7XooCdvsrMXqEdPK4ITQa+bUle76BeqUroyNjf7Y4UBLACfqIvQug3SfrWm5l7f
 xgd6gVy/b7JRthvsVSneGuuISKe6ZrKEOlZn121Q==
X-Google-Smtp-Source: AGHT+IEyNgcxtp+AILZYxR+lett+6HRLexkn8J5cQTM4GdVLX0V4Qm0EYysbi1PQL2Hc2RTTy2Xnh+8bEiYvTFBT3h0=
X-Received: by 2002:a17:903:3bc6:b0:224:18b0:86a0 with SMTP id
 d9443c01a7336-22a8a0a3957mr154151095ad.37.1744011465074; Mon, 07 Apr 2025
 00:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250402043228.404847-1-shekhar.chauhan@intel.com>
In-Reply-To: <20250402043228.404847-1-shekhar.chauhan@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 7 Apr 2025 10:37:32 +0300
X-Gm-Features: ATxdqUF1Xo6kgsRSgFECZ_hZjt3DGZ1sRrdb2qX6e_i9XEu4x9JI3SQhXAk5yTQ
Message-ID: <CAJ=qYWR4cSH6ouN0A+sbvVmkuvUS101CggcMQq2H7A8iks_xdA@mail.gmail.com>
Subject: Re: [PATCH v5] tests/kms_cursor_crc: Test async changes midframe
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
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

Look ok to me. Those CI reported failures don't seem to be anything
relating to this change, here is changed only kms_cursor_crc

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Wed, Apr 2, 2025 at 7:32=E2=80=AFAM Shekhar Chauhan
<shekhar.chauhan@intel.com> wrote:
>
> Check if cursor IOCTLs are behaving in timely manner via CRC.
> Test CRC of the display with 2 cursors, separated by a vblank and a
> sleep so that the drawing of the cursors only happens when the screen is
> active and then compare the CRC of the two cases. This helps validates
> that there is no tearing when doing cursor changes midframe. Test
> consists of two subtests, one for checking the timely change and the
> second test also adds changing position into the first test.
>
> v2: Trim down the description.
> v3: Require Intel device/driver.
> v4: Tweak commit message and test description.
> v5: Move igt_crc_t var to top of func to avoid compiler complain.
>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>  tests/kms_cursor_crc.c | 139 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
>
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 7c6f61f55..c72d00232 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -100,6 +100,16 @@
>   * @max-size:              Max supported size
>   */
>
> +/**
> + * SUBTEST: async-cursor-crc-framebuffer-change
> + * Description: Validate cursor IOCTLs tearing via framebuffer changes.
> + */
> +
> +/**
> + * SUBTEST: async-cursor-crc-position-change
> + * Description: Validate cursor IOCTLs tearing via cursor position chang=
e.
> + */
> +
>  IGT_TEST_DESCRIPTION(
>     "Use the display CRC support to validate cursor plane functionality. =
"
>     "The test will position the cursor plane either fully onscreen, "
> @@ -123,6 +133,11 @@ enum cursor_buffers {
>         MAXCURSORBUFFER
>  };
>
> +enum cursor_change {
> +       FIRSTIMAGE,
> +       SECONDIMAGE
> +};
> +
>  typedef struct {
>         int x;
>         int y;
> @@ -151,6 +166,7 @@ typedef struct {
>         double alpha;
>         int vblank_wait_count; /* because of msm */
>         cursorarea oldcursorarea[MAXCURSORBUFFER];
> +       struct igt_fb timed_fb[2];
>  } data_t;
>
>  static bool extended;
> @@ -674,6 +690,78 @@ static void test_cursor_transparent(data_t *data)
>         data->alpha =3D 1.0;
>  }
>
> +static void do_timed_cursor_fb_change(data_t *data, enum cursor_change c=
hange)
> +{
> +       if (change =3D=3D FIRSTIMAGE) {
> +               igt_plane_set_fb(data->cursor, &data->timed_fb[0]);
> +               igt_plane_set_position(data->cursor,
> +                                      data->left + data->cursor_max_w - =
10,
> +                                      data->bottom - data->cursor_max_h =
- 10);
> +       } else {
> +               igt_plane_set_fb(data->cursor, &data->timed_fb[1]);
> +       }
> +}
> +
> +static void do_timed_cursor_fb_pos_change(data_t *data, enum cursor_chan=
ge change)
> +{
> +       if (change =3D=3D FIRSTIMAGE) {
> +               igt_plane_set_fb(data->cursor, &data->timed_fb[0]);
> +               igt_plane_set_position(data->cursor,
> +                                      data->left + data->cursor_max_w - =
10,
> +                                      data->bottom - data->cursor_max_h =
- 10);
> +       } else {
> +               igt_plane_set_position(data->cursor,
> +                                      data->left + data->cursor_max_w + =
20,
> +                                      data->bottom - data->cursor_max_h =
+ 20);
> +       }
> +}
> +
> +static void timed_cursor_changes(data_t *data, void (changefunc)(data_t =
*, enum cursor_change))
> +{
> +       igt_crc_t crc1, crc2;
> +
> +       /* Legacy cursor API does not guarantee that the cursor update ha=
ppens at vBlank.
> +        * So, not assuming that this happens across all platforms, the t=
est requires
> +        * Intel plaforms.
> +        */
> +       igt_require_intel(data->drm_fd);
> +
> +       data->cursor =3D igt_output_get_plane_type(data->output, DRM_PLAN=
E_TYPE_CURSOR);
> +       changefunc(data, FIRSTIMAGE);
> +
> +       igt_display_commit(&data->display);
> +
> +       /* Extra vblank wait is because nonblocking cursor ioctl */
> +       igt_wait_for_vblank_count(data->drm_fd,
> +                                 data->display.pipes[data->pipe].crtc_of=
fset,
> +                                 data->vblank_wait_count);
> +
> +       igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc1);
> +
> +       /* get the screen refresh rate, then wait for vblank, and
> +        * wait for 1/5 of time of screen refresh and change image.
> +        * change it mid screen to validate that the change happens
> +        * at the end of the current frame.
> +        */
> +       usleep(1.0f / data->refresh / 5.0f * 1e6);
> +
> +       changefunc(data, SECONDIMAGE);
> +       igt_display_commit(&data->display);
> +       igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc2);
> +
> +       igt_assert_crc_equal(&crc1, &crc2);
> +}
> +
> +static void test_crc_cursors(data_t *data)
> +{
> +       timed_cursor_changes(data, do_timed_cursor_fb_change);
> +}
> +
> +static void test_crc_pos_cursors(data_t *data)
> +{
> +       timed_cursor_changes(data, do_timed_cursor_fb_pos_change);
> +}
> +
>  static void test_cursor_opaque(data_t *data)
>  {
>         data->alpha =3D 1.0;
> @@ -1013,6 +1101,57 @@ static void run_tests_on_pipe(data_t *data)
>         }
>
>         igt_fixture {
> +               igt_create_color_fb(data->drm_fd, data->cursor_max_w, dat=
a->cursor_max_h,
> +                               DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEA=
R,
> +                               1.f, 1.f, 1.f, &data->timed_fb[0]);
> +
> +               igt_create_color_fb(data->drm_fd, data->cursor_max_w, dat=
a->cursor_max_h,
> +                               DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEA=
R,
> +                               1.f, 0.f, 0.f, &data->timed_fb[1]);
> +       }
> +
> +       igt_describe("Validate CRC with two cursors");
> +       igt_subtest_with_dynamic("async-cursor-crc-framebuffer-change") {
> +               for_each_pipe_with_single_output(&data->display, pipe, da=
ta->output) {
> +                       if (execution_constraint(pipe))
> +                               continue;
> +
> +                       data->pipe =3D pipe;
> +
> +                       if (!valid_pipe_output_combo(data))
> +                               continue;
> +
> +                       igt_dynamic_f("pipe-%s-%s",
> +                                         kmstest_pipe_name(pipe),
> +                                         data->output->name)
> +                               run_test(data, test_crc_cursors,
> +                                         data->cursor_max_w, data->curso=
r_max_h);
> +               }
> +       }
> +
> +       igt_describe("Validate CRC with two cursors and cursor position c=
hange");
> +       igt_subtest_with_dynamic("async-cursor-crc-position-change") {
> +               for_each_pipe_with_single_output(&data->display, pipe, da=
ta->output) {
> +                       if (execution_constraint(pipe))
> +                               continue;
> +
> +                       data->pipe =3D pipe;
> +
> +                       if (!valid_pipe_output_combo(data))
> +                               continue;
> +
> +                       igt_dynamic_f("pipe-%s-%s",
> +                                         kmstest_pipe_name(pipe),
> +                                         data->output->name)
> +                               run_test(data, test_crc_pos_cursors,
> +                                         data->cursor_max_w, data->curso=
r_max_h);
> +               }
> +       }
> +
> +       igt_fixture {
> +               igt_remove_fb(data->drm_fd, &data->timed_fb[0]);
> +               igt_remove_fb(data->drm_fd, &data->timed_fb[1]);
> +
>                 create_cursor_fb(data, data->cursor_max_w, data->cursor_m=
ax_h);
>         }
>
> --
> 2.34.1
>
