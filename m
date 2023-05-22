Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DDC10E158
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 13:25:59 +0000 (UTC)
Date: Mon, 22 May 2023 15:25:54 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230522132554.ypfumkzydjpppc7r@kamilkon-desk1>
References: <20230403130124.15946-1-mcanal@igalia.com>
 <20230403130124.15946-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403130124.15946-2-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/kms_rotation_crc: make the
 subtest "bad-pixel-format" i915-specific
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

On 2023-04-03 at 10:01:21 -0300, Maíra Canal wrote:
> The subtest "bad-pixel-format" expects that RGB565 rotation is not
> supported for 90 degrees, which is not necessarily true for non-i915
> devices. Therefore, require the device to be i915 before running the
> subtest "bad-pixel-format", as we can only guarantee bad pixel formats
> for i915 devices.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  tests/kms_rotation_crc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 295aed76..0d7b3962 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1181,6 +1181,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_describe("Checking unsupported pixel format for gen9+ with 90 degree of rotation");
>  	igt_subtest_f("bad-pixel-format") {
> +		igt_require(is_i915_device(data.gfx_fd));
------------------------------ ^
Please change this into is_intel_device

Regards,
Kamil

> +
>  		 /* gen11 enables RGB565 rotation for 90/270 degrees.
>  		  * so apart from this, any other gen11+ pixel format
>  		  * can be used which doesn't support 90/270 degree
> -- 
> 2.39.2
> 
