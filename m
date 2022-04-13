Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC1610E253
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 19:57:06 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y32so5449454lfa.6
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 12:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220407174215.171440-1-alex.hung@amd.com>
In-Reply-To: <20220407174215.171440-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 13 Apr 2022 15:56:53 -0400
Message-ID: <CAJUqKUpntYp_s6cCt=SSY8JwkqL4TrG+juNGx36yPburAnEs9g@mail.gmail.com>
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
Cc: igt-dev@lists.freedesktop.org, bas@basnieuwenhuizen.nl,
 markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 7, 2022 at 1:42 PM Alex Hung <alex.hung@amd.com> wrote:
title of commit message should include the test name if you're fixing
only 1 text. so it would be tests/kms_plane
>
> Skip the KMS test cases for planes that has modifiers with
nit: s/has/have.
> DCC and DCC_RETILE on AMDGPU.
>
> Current pixel-format and pixel-format-source-clamping subtests do not
> support modifers with DCC or DCC_RETILE in kernel.
nit: s/modifers/modifiers
>
> 1. dcc_formats's cpp[1] is set to 0 and this triggers kernel errors
is [1] referring to a url? i dont see it.
> "Format requires non-linear modifier for plane 1" because block_size
> (i.e. cpp[1]) == 0. See kernel commits 816853f9dc40 and 8db2dc852941.
I would prefer you add links to make it easy to look up.
>
> 2. the subtests cause kernel's amdgpu_display_verify_sizes to fail
> because they do not provide an extra plane with compression metadata.
> See kernel commit 234055fd9728 for details.
ditto

if this is affecting a specific subtest, please add it here.
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
not sure how it compiled, i think you'll need to move int i to above.
> +               if (AMD_FMT_MOD_GET(DCC, plane->modifiers[i]) ||
> +                   AMD_FMT_MOD_GET(DCC_RETILE, plane->modifiers[i])) {
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
