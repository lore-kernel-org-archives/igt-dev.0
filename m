Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6014810ED66
 for <igt-dev@lists.freedesktop.org>; Thu, 25 May 2023 06:08:16 +0000 (UTC)
Date: Thu, 25 May 2023 08:08:11 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230525060811.rp6loqhas6mufzxv@zkempczy-mobl2>
References: <20230524150403.31460-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230524150403.31460-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: add helper for srandom
 seed initialization
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

On Wed, May 24, 2023 at 05:04:03PM +0200, Kamil Konieczny wrote:
> From: Łukasz Łaguna <lukasz.laguna@intel.com>
> 
> It allows to set specific value with IGT_SRANDOM environment variable.
> 
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Łukasz Łaguna <lukasz.laguna@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/igt_core.c | 16 ++++++++++++++++
>  lib/igt_core.h |  2 ++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index eff3d4272..cd9c2002d 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3367,6 +3367,22 @@ err:
>  	return -1;
>  }
>  
> +/**
> + * igt_srandom:
> + *
> + * It initializes seed for random number generator.
> + * If specific value is needed it can be set with IGT_SRANDOM environment
> + * variable.
> + */
> +void igt_srandom(void)
> +{
> +	const char *param = getenv("IGT_SRANDOM");
> +	int seed = param ? atoi(param) : time(NULL);
> +
> +	srandom(seed);
> +	igt_info("Using IGT_SRANDOM=%d for randomisation\n", seed);
> +}
> +
>  /* IGT wrappers around libpciaccess init/cleanup functions */
>  
>  static void pci_system_exit_handler(int sig)
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 5d5593e05..ef6bed6a5 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1448,6 +1448,8 @@ int igt_system_quiet(const char *command);
>  		free(buf); \
>  	} while (0)
>  
> +void igt_srandom(void);
> +
>  /**
>   * igt_trace:
>   * @format: printf-style format string with optional args
> -- 
> 2.39.2
>

Patch looks good for me. Have you thought to add this to constructor
section?

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
