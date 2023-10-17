Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEA310E309
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Oct 2023 15:43:29 +0000 (UTC)
Date: Tue, 17 Oct 2023 17:43:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20231017154309.ifxs4nz2g4sn7xlf@kamilkon-desk.igk.intel.com>
References: <20231017125428.607100-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231017125428.607100-1-marcin.bernatowicz@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/drmtest.h: make ALIGN work with
 uint64_t values
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Marcin,
On 2023-10-17 at 12:54:28 +0000, Marcin Bernatowicz wrote:
> Let alignment be the same type as aligned value.
> Based on kernel code.
> 
> This should fix code like:
> 
> uint32_t a = 4096;
> uint64_t v = 32768ULL * 32768 * 4;
> 
> v = ALIGN(v, a);
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/drmtest.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 97ab6e759..524d81b7a 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -87,7 +87,8 @@ void __set_forced_driver(const char *name);
>   *
>   * Macro to align a value @v to a specified unit @a.
>   */
> -#define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
> +#define ALIGN(v, a) ALIGN_MASK(v, (typeof(v))(a) - 1)
> +#define ALIGN_MASK(v, mask) (((v) + (mask)) & ~(mask))
>  
>  /**
>   * ALIGN_DOWN:
> -- 
> 2.42.0
> 

