Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD16E10E0CF
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Nov 2022 19:35:25 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-36ad4cf9132so52587077b3.6
 for <igt-dev@lists.freedesktop.org>; Fri, 04 Nov 2022 12:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221104184850.742606-1-alex.hung@amd.com>
In-Reply-To: <20221104184850.742606-1-alex.hung@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 4 Nov 2022 15:35:14 -0400
Message-ID: <CAJUqKUpHA2spA1ibU9e-WUMZK9iSs25estZPk52aqrva6Dmx_Q@mail.gmail.com>
To: Alex Hung <alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH] kms_chamelium: fix a compile warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 4, 2022 at 2:49 PM Alex Hung <alex.hung@amd.com> wrote:
>
> Fix the following warning:
>
> ../tests/chamelium/kms_chamelium.c: In function =E2=80=98edid_stress_reso=
lution=E2=80=99:
> ../tests/chamelium/kms_chamelium.c:2570:31: warning: declaration of =E2=
=80=98monitor_edid=E2=80=99 shadows a global declaration [-Wshadow]
>  2570 |                 monitor_edid *monitor_edid =3D &edids_list[i];
>       |                               ^~~~~~~~~~~~
> In file included from ../lib/monitor_edids/dp_edids.h:15,
>                  from ../tests/chamelium/kms_chamelium.c:33:
> ../lib/monitor_edids/monitor_edids_helper.h:25:3: note: shadowed declarat=
ion is here
>    25 | } monitor_edid;
>       |   ^~~~~~~~~~~~
>
> Fixes: 6a25c536 (kms_chamelium: Add new EDID stress resolution test)
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/chamelium/kms_chamelium.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamel=
ium.c
> index c824e67e..09839f98 100644
> --- a/tests/chamelium/kms_chamelium.c
> +++ b/tests/chamelium/kms_chamelium.c
> @@ -2567,13 +2567,13 @@ static void edid_stress_resolution(data_t *data, =
struct chamelium_port *port,
>                 bool is_video_stable;
>                 int screen_res_w, screen_res_h;
>
> -               monitor_edid *monitor_edid =3D &edids_list[i];
> +               monitor_edid *edid =3D &edids_list[i];
>                 igt_info("Testing out the EDID for %s\n",
> -                        monitor_edid_get_name(monitor_edid));
> +                        monitor_edid_get_name(edid));
>
>                 /* Getting and Setting the EDID on Chamelium. */
>                 chamelium_edid =3D get_chameleon_edid_from_monitor_edid(
> -                       chamelium, monitor_edid);
> +                       chamelium, edid);
>                 chamelium_port_set_edid(data->chamelium, port, chamelium_=
edid);
>                 free_chamelium_edid_from_monitor_edid(chamelium_edid);
>
> --
> 2.34.1
>
