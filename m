Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA736E151
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 15:35:44 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id d17so11925839lfv.0
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 08:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210709152751.2947886-1-markyacoub@chromium.org>
 <20210723143728.54fljrwfz3glfwmo@outlook.office365.com>
In-Reply-To: <20210723143728.54fljrwfz3glfwmo@outlook.office365.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 29 Jul 2021 11:35:32 -0400
Message-ID: <CAJUqKUp3EOWBpO5gkGQPNCy=KRUC1T8YE3W3+SswN+et9O9H4g@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_atomic: igt_require_pipe_crc for
 plane_immutable_zpos
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>, Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 10:37 AM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> On 07/09, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > kms_atomic:plane_immutable_zpos subtest uses CRC in debugfs which is
> > not supported by some drivers.
> >
> > [How]
> > igt_require_pipe_crc before the test begins.
> >
> > Test: kms_atomic:plane-immutable-zpos on ChromeOS Trogdor(msm) and Zork(amdgpu)
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  tests/kms_atomic.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> > index df9c9df7..4b262257 100644
> > --- a/tests/kms_atomic.c
> > +++ b/tests/kms_atomic.c
> > @@ -375,6 +375,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
> >       uint32_t w_lower, h_lower, w_upper, h_upper;
> >
> >       igt_require(n_planes >= 2);
> > +     igt_require_pipe_crc(display->drm_fd);
>
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
> Just for curiosity, what is the result for this test in your Zork
> system?
it looks good to me:
Starting subtest: plane-immutable-zpos
Subtest plane-immutable-zpos: SUCCESS (0.373s)

>
> Thanks
>
> >       mode = igt_output_get_mode(output);
> >       primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> > --
> > 2.32.0.93.g670b81a890-goog
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=04%7C01%7CRodrigo.Siqueira%40amd.com%7C96d85f55a3064d29832c08d942ee2170%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637614413326773397%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SKj30lk%2BZtlcT9iiROaeRlOnnh7psSUFzSbfi2w7JF0%3D&amp;reserved=0
>
> --
> Rodrigo Siqueira
> https://siqueira.tech
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
