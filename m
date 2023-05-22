Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AF810E329
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 13:20:12 +0000 (UTC)
Date: Mon, 22 May 2023 15:20:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230522132008.p4wjgghozqxge7uu@kamilkon-desk1>
References: <20230425152904.238487-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425152904.238487-1-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane: allow pixel-format
 tests to run on drivers without legacy LUT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Maira,

On 2023-04-25 at 12:29:04 -0300, Maíra Canal wrote:
> Currently, the tests pixel-format and pixel-format-source-clamping
> fail for drivers that doesn't have support for legacy LUT, as they
> are not able to complete drmModeCrtcSetGamma() successfully. Therefore,
> if !crtc->gamma_size, don't set legacy LUT and allow the pixel-format
> tests to run even if the driver doesn't support legacy LUT.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  tests/kms_plane.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 62aee9ad..9b49f951 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -455,6 +455,9 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
---------------------------- ^
Maybe you should change that to bool.

>  	lut_size = crtc->gamma_size;
>  	drmModeFreeCrtc(crtc);
>  
> +	if (!crtc->gamma_size)
----------- ^
Use lut_size here, see function set_c8_legacy_lut
and correct caller sites to check if it is supported.

Regards,
Kamil

> +		return;
> +
>  	lut = malloc(sizeof(uint16_t) * lut_size);
>  
>  	for (i = 0; i < lut_size; i++)
> -- 
> 2.40.0
> 
