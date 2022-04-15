Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E38310E360
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Apr 2022 00:59:20 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id e71so12277377ybf.8
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 17:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220407174215.171440-1-alex.hung@amd.com>
 <CAP+8YyFV8mdU+xUqeP0bF+YuNo2Uo=A9WVBJOJBvoc+ZEwuEmw@mail.gmail.com>
 <BYAPR12MB3048D361909BF8758C8CEA4CF7EF9@BYAPR12MB3048.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3048D361909BF8758C8CEA4CF7EF9@BYAPR12MB3048.namprd12.prod.outlook.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 15 Apr 2022 02:59:11 +0200
Message-ID: <CAP+8YyHsf1dwdh1-1b8oY2iRosG8OBTBNtegGqRh+NKKWi_fEQ@mail.gmail.com>
To: "Hung, Alex" <Alex.Hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t][V2] tests/kms: Skip kms test cases for
 DCC and DCC_RETILE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 14, 2022 at 3:01 AM Hung, Alex <Alex.Hung@amd.com> wrote:
>
> [AMD Official Use Only]
>
>
>
>
> ________________________________
> From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Sent: 13 April 2022 16:00
> To: Hung, Alex <Alex.Hung@amd.com>
> Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>; Mark Yacoub <markyacoub@google.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>
> Subject: Re: [PATCH i-g-t][V2] tests/kms: Skip kms test cases for DCC and DCC_RETILE
>
> On Thu, Apr 7, 2022 at 7:42 PM Alex Hung <alex.hung@amd.com> wrote:
> >
> > Skip the KMS test cases for planes that has modifiers with
> > DCC and DCC_RETILE on AMDGPU.
> >
> > Current pixel-format and pixel-format-source-clamping subtests do not
> > support modifers with DCC or DCC_RETILE in kernel.
> >
> > 1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors
> > "Format requires non-linear modifier for plane 1" because block_size
> > (i.e. cpp[1]) == 0. See kernel commits 816853f9dc40 and 8db2dc852941.
>
> We aren't using a linear modifier here, why would this trigger?
>
> The data seems to be all zero, and r->modifier[i] will be zero and equals DRM_FORMAT_MOD_LINEAR (= 0)

So if we hit this case at least one of the r->modifier[i] should be a
DCC modifier. AFAIU KMS rules are that all planes should have the same
modifier (though I cannot quickly find a check for it), so this seems
like a test issue to me.
>
> >
> > 2. the subtests cause kernel's amdgpu_display_verify_sizes to fail
> > because they do not provide an extra plane with compression metadata.
> > See kernel commit 234055fd9728 for details.
>
> Can we do something more generic by skipping all modifiers where the
> number of planes != the number of planes for the format with a linear
> modifier?
>
> ===================
> Do you mean something like below:
>
>         int nlinear = 0;
>         int i;
>
>         for (i = 0; i < plane->format_mod_count; i++)
>                 if (plane->modifiers[i] == DRM_FORMAT_MOD_LINEAR)
>                         nlinear++;
>
>         if (plane->format_mod_count != nlinear)
>                 return true;
>
> This will affect more than DCC.

No, I mean something like get_format_info_for(format,
DRM_FORMAT_MOD_LINEAR)->num_planes != get_format_info_for(format,
plane->modifiers[0])->num_planes . If the test can't synthesize the
extra planes this seems like the obvious skip condition (no idea how
you'd query this in IGT though)
>
> >
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > ---
> >
> > v2: update comments in commit messages
> >
> >  tests/kms_plane.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > index 137f23a8..1a71822a 100644
> > --- a/tests/kms_plane.c
> > +++ b/tests/kms_plane.c
> > @@ -1004,6 +1004,14 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
> >  {
> >         int index = plane->index;
> >
> > +       for (int i = 0; i < plane->format_mod_count; i++) {
> > +               if (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
> > +                   AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i])) {
>
> This check is only valid if you first check that this is an AMD modifier.
>
> ===================
> Thanks. This can be fixed by the following if it is to be used.
>
>         for (i = 0; i < plane->format_mod_count; i++) {
>                 if (IS_AMD_FMT_MOD(plane->modifiers[i]) &&
>                     (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
>                      AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i]))) {
>                         igt_debug("Skipping planes with DCC or DCC_RETILE\n");
>                         return true;
>                 }
>         }

Seems fine by me.
>
>
> > +                       igt_debug("Skipping planes with DCC or DCC_RETILE\n");
> > +                       return true;
> > +               }
> > +       }
> > +
> >         if (data->extended)
> >                 return false;
> >
> > --
> > 2.35.1
> >
