Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521396E491
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 10:51:54 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 20 Sep 2021 10:51:51 +0000
Message-ID: <DM8PR11MB571976A46DFFE625ED0F1D068DA09@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20210916142722.17881-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916142722.17881-1-vidya.srinivas@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: Fix CRC
 mismatch for flip-vs-cursor-busy-crc-*
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Thursday, September 16, 2021 7:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; markyacoub@google=
.com;
> Srinivas, Vidya <vidya.srinivas@intel.com>
> Subject: [PATCH i-g-t] tests/kms_cursor_legacy: Fix CRC mismatch for flip=
-vs-
> cursor-busy-crc-*
>=20
> Few variants of Intel devices are failing randomly with CRC mismatch for
> flip-vs-cursor-busy-crc-atomic and flip-vs-cursor-busy-crc-legacy.
> Patch adds stop of CRC collection to fix this issue.
>=20
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_cursor_legacy.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 3ddea9c35340..8136280701e6 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1401,6 +1401,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t
> *display, bool atomic)
>  		igt_assert_crc_equal(&crcs[i], &test_crc);
>  	}
>=20
> +	igt_pipe_crc_stop(pipe_crc);
=20
LGTM:
Reviewed-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>

- Bhanu

>  	igt_remove_fb(display->drm_fd, &fb_info[1]);
>  	igt_remove_fb(display->drm_fd, &fb_info[0]);
>  	igt_remove_fb(display->drm_fd, &cursor_fb);
> --
> 2.33.0
