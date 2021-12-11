Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3DB10E9F1
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Dec 2021 10:29:50 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id g14so36464704edb.8
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Dec 2021 02:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20211207122622.169176-1-ananya.sharma@intel.com>
In-Reply-To: <20211207122622.169176-1-ananya.sharma@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Sat, 11 Dec 2021 12:29:37 +0200
Message-ID: <CAJ=qYWSfyi5SpkOSfSPhXtbtN=nF5moxU3Uwfb4xeMWOHP_zLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_rotation_crc- MPO subtest:
 Mixing different pixel formats and tiling on different planes.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ananya Sharma <ananya.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 7, 2021 at 2:28 PM Ananya Sharma <ananya.sharma@intel.com> wrote:
>
> Addition of P010 pixel format with already existing pixel formats.
>
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>  tests/kms_rotation_crc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 1497120c..b39ae576 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -666,7 +666,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>          * case with tiling are 2 bpp, 4 bpp and NV12.
>          */
>         static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
> -               DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
> +               DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};
>
>         static struct {
>                 igt_rotation_t rotation;
> @@ -753,12 +753,17 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>                                                  */
>                                                 if (p[0].format != DRM_FORMAT_NV12 &&
>                                                     p[1].format != DRM_FORMAT_NV12 &&
> +                                                   p[0].format != DRM_FORMAT_P010 &&
> +                                                   p[1].format != DRM_FORMAT_P010 &&

You could replace above with
"!igt_format_is_yuv_semiplanar(p[0].format) &&
!igt_format_is_yuv_semiplanar(p[1].format)"

>                                                     crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
>                                                         retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
>                                                         have_crc = true;
>                                                 } else if (p[0].format == DRM_FORMAT_NV12 &&
>                                                            p[1].format != DRM_FORMAT_NV12 &&
>                                                            lastroundjformat != DRM_FORMAT_NV12 &&
> +                                                          p[0].format == DRM_FORMAT_P010 &&
> +                                                          p[1].format != DRM_FORMAT_P010 &&
> +                                                          lastroundjformat !=DRM_FORMAT_P010 &&

Above does not work. p[0].format == DRM_FORMAT_NV12 &&  p[0].format ==
DRM_FORMAT_P010 will never be true. Also this rule is written to take
care when p[0] can be NV12 or not NV12 in current and previous round
in order to be able to use previous crc here when rotations did stay
same and p[0] did stay NV12. Now on previous round p[0] can be also
p010 and p[1] can be NV12 or P010 on that round which need to be
checked on. This juggling is because on Intel hw color interpolation
with planar formats is not well defined.

>                                                            planeconfigs[i].rotation == lastroundirotation &&
>                                                            planeconfigs[j].rotation == lastroundjrotation) {
>                                                         /*
> @@ -819,7 +824,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>                                                                                    flipsw,
>                                                                                    &retcrc_sw);
>
> -                                                       if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12)
> +                                                       if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12 &&
> +                                                                       p[0].format != DRM_FORMAT_P010 && p[1].format != DRM_FORMAT_P010)

Here also "!igt_format_is_yuv_semiplanar(p[0].format) &&
!igt_format_is_yuv_semiplanar(p[1].format)"

>                                                                 crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
>                                                                 = retcrc_sw;
>                                                 }
> --
> 2.25.1
>
