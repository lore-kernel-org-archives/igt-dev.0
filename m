Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8F610E500
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 18:24:34 +0000 (UTC)
Date: Thu, 4 Jan 2024 19:24:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/igt_fb: fix documentation of
 igt_create_color_fb return
Message-ID: <20240104182427.4btfzapnbt3zyfl2@kamilkon-desk.igk.intel.com>
References: <20231226191054.23794-1-mwen@igalia.com>
 <20231226191054.23794-3-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231226191054.23794-3-mwen@igalia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com, Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Melissa,
On 2023-12-26 at 17:57:33 -0100, Melissa Wen wrote:
> igt_create_fb fails without returning a negative error code (unsigned
> int), so does igt_create_color_fb. Remove the `negative error code on
> failure` from function docs to avoid misleading usage.

Why not just make it correct?

int igt_create_color_fb(int fd, int width, int height,

and check for errors and return -errno or what is received.

Regards,
Kamil

> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  lib/igt_fb.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 2cf94013e..2446edd2b 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2174,8 +2174,7 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
>   * with the given color, which is useful for some simple pipe crc based tests.
>   *
>   * Returns:
> - * The kms id of the created framebuffer on success or a negative error code on
> - * failure.
> + * The kms id of the created framebuffer on success.
>   */
>  unsigned int igt_create_color_fb(int fd, int width, int height,
>  				 uint32_t format, uint64_t modifier,
> -- 
> 2.43.0
> 
