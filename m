Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1738410E1F2
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Apr 2022 17:23:06 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id o62so5271846ybo.2
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Apr 2022 10:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220406170659.898333-1-alex.hung@amd.com>
In-Reply-To: <20220406170659.898333-1-alex.hung@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 6 Apr 2022 19:23:05 +0200
Message-ID: <CAP+8YyGTTF_zu3VV3ow1ERV94KDopTfY7D+hYiXHH8iFdpAYLQ@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms: Skip kms test cases for DCC and
 DCC_RETILE
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

Can you add a comment on why we are skipping them?

On Wed, Apr 6, 2022 at 7:07 PM Alex Hung <alex.hung@amd.com> wrote:
>
> Skip the KMS test cases for planes that has modifiers with
> DCC and DCC_RETILE on AMDGPU.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
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
