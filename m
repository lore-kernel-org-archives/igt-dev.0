Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A92B10E086
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Oct 2023 09:08:15 +0000 (UTC)
Message-ID: <c9d57a2d-5c2b-0d80-7c52-cfb66fc0e866@intel.com>
Date: Wed, 18 Oct 2023 11:08:10 +0200
Content-Language: en-US
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20231017143654.617723-1-marcin.bernatowicz@linux.intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20231017143654.617723-1-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_blt.c: ensure uint64_t result
 of multiplication
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 17.10.2023 16:36, Marcin Bernatowicz wrote:
> Additionally check for overflow.
> 
> This should allow to exercise large buffers
> ex. xe_exercise_blt -W 16384 -H 16384

I think it would be good to add a dedicated (sub)test case to test large 
buffers.

> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>   lib/intel_blt.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index a76c7a404..f46c85e91 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1607,12 +1607,18 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>   		  bool create_mapping)
>   {
>   	struct blt_copy_object *obj;
> -	uint64_t size = width * height * bpp / 8;
>   	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
>   	uint32_t handle;
> +	uint64_t size;
>   
>   	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
>   
> +	igt_assert_f((UINT64_MAX / 8) >= width &&
> +		     (UINT64_MAX / width) >= height &&
> +		     (UINT64_MAX / (width * height)) >= bpp, "Overflow detected!\n");

OK, it took a bit for me to parse it... So, we first check if we have 
enough space to at least fit width, then compare it against height, and 
then compare all of this to what's left for bpp. Is that correct?

But still, width and height is limited by surface_with and 
surface_height field that are u14 iirc. I don't think that overflow is 
possible here?

> +
> +	size = (uint64_t)width * height * bpp / 8;

Cast takes precedence over *, but this line doesn't trigger any 
warnings, so I think we don't have to add extra ().

All the best,
Karolina

> +
>   	obj = calloc(1, sizeof(*obj));
>   
>   	obj->size = size;
