Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC996E44A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 14:29:24 +0000 (UTC)
Date: Fri, 6 Mar 2020 16:29:20 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200306142920.a3g65eixtqkwnucc@ahiler-desk1.fi.intel.com>
References: <1583452975-8507-1-git-send-email-kunal1.joshi@intel.com>
 <1583452975-8507-2-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583452975-8507-2-git-send-email-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_chamelium: Add support to
 validate RGB/YUV pixel formats
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 05:32:55AM +0530, Kunal Joshi wrote:
> Currently, only hard coded pixel formats are validated which are not
> generic across platforms which leads to SKIPS.
> Added support to validate only those pixel formats which are supported by
> platform. Covering both RGB and YUV pixel formats.
> 
> v2: added support for RGB pixel formats (Swati)
> v3: simplified constraint and made it more readable (Petri)
> v4: -used igt_format_str instead of macro to print fourcc code (Ville)
>     -dropped patch#1 because of above change
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_chamelium.c | 124 +++++++++++++++++++-------------------------------
>  1 file changed, 48 insertions(+), 76 deletions(-)
> 
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 5c4a189..a0ec925 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -2612,6 +2612,14 @@ static const struct edid *get_edid(enum test_edid edid)
>  			if (chamelium_port_get_type(port) == \
>  			    DRM_MODE_CONNECTOR_ ## type__)
>  
> +#define connector_subtest_start(name__, type__)              \
> +	igt_subtest_with_dynamic(name__)                     \
> +		for_each_port(p, port)                       \
> +			if (chamelium_port_get_type(port) == \
> +			    DRM_MODE_CONNECTOR_ ## type__) {
> +
> +#define connector_subtest_end }

I agree with petri on having explicit {}. All the other macros are
following that, e.g.: igt_subtest.

#define connector_subtest_start(name__, type__)              \
       igt_subtest_with_dynamic(name__)                     \
               for_each_port(p, port)                       \
                       if (chamelium_port_get_type(port) == \
                           DRM_MODE_CONNECTOR_ ## type__)


connector_subtest_start("hdmi-rgb-pixel-format", HDMIA) {
 /* ... */
}

> @@ -2817,54 +2825,31 @@ igt_main
>  					       CHAMELIUM_CHECK_CRC, 3);
>  
>  		igt_describe(test_display_one_mode_desc);
> -		connector_subtest("hdmi-crc-argb8888", HDMIA)
> -			test_display_one_mode(&data, port, DRM_FORMAT_ARGB8888,
> -					      CHAMELIUM_CHECK_CRC, 1);
> -
> -		igt_describe(test_display_one_mode_desc);
> -		connector_subtest("hdmi-crc-abgr8888", HDMIA)
> -			test_display_one_mode(&data, port, DRM_FORMAT_ABGR8888,
> -					      CHAMELIUM_CHECK_CRC, 1);
> -
> -		igt_describe(test_display_one_mode_desc);
> -		connector_subtest("hdmi-crc-xrgb8888", HDMIA)
> -			test_display_one_mode(&data, port, DRM_FORMAT_XRGB8888,
> -					      CHAMELIUM_CHECK_CRC, 1);
> +		connector_subtest_start("hdmi-rgb-pixel-format", HDMIA)

you are dropping few thing from the titles, especially information that
this is chamelium CRC tests

how about naming them:
  hdmi-crc-nonplanar-formats instead of rgb
  hdmi-crc-planar-formats instead of yuv

and then having the dunamic subsubtests named after the format alone, so
the end result would be like this:

igt@kms_chamelium@hdmi-crc-nonplanar-formats@rgb888

other than that looks good to me, thanks! :-)

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
