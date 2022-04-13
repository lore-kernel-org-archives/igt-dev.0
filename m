Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E43D10F06F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 22:00:15 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ec04a2ebadso37086437b3.12
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 15:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220407174215.171440-1-alex.hung@amd.com>
In-Reply-To: <20220407174215.171440-1-alex.hung@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Thu, 14 Apr 2022 00:00:07 +0200
Message-ID: <CAP+8YyFV8mdU+xUqeP0bF+YuNo2Uo=A9WVBJOJBvoc+ZEwuEmw@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
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

On Thu, Apr 7, 2022 at 7:42 PM Alex Hung <alex.hung@amd.com> wrote:
>
> Skip the KMS test cases for planes that has modifiers with
> DCC and DCC_RETILE on AMDGPU.
>
> Current pixel-format and pixel-format-source-clamping subtests do not
> support modifers with DCC or DCC_RETILE in kernel.
>
> 1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors
> "Format requires non-linear modifier for plane 1" because block_size
> (i.e. cpp[1]) == 0. See kernel commits 816853f9dc40 and 8db2dc852941.

We aren't using a linear modifier here, why would this trigger?
>
> 2. the subtests cause kernel's amdgpu_display_verify_sizes to fail
> because they do not provide an extra plane with compression metadata.
> See kernel commit 234055fd9728 for details.

Can we do something more generic by skipping all modifiers where the
number of planes != the number of planes for the format with a linear
modifier?


>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>
> v2: update comments in commit messages
>
>  tests/kms_plane.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 137f23a8..1a71822a 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1004,6 +1004,14 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
>  {
>         int index = plane->index;
>
> +       for (int i = 0; i < plane->format_mod_count; i++) {
> +               if (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
> +                   AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i])) {

This check is only valid if you first check that this is an AMD modifier.


> +                       igt_debug("Skipping planes with DCC or DCC_RETILE\n");
> +                       return true;
> +               }
> +       }
> +
>         if (data->extended)
>                 return false;
>
> --
> 2.35.1
>
