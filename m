Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8718418AB37
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 11:33:46 +0000 (UTC)
Date: Mon, 11 Jul 2022 13:33:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YswKluUDYWhnj7rh@kamilkon-desk1>
References: <20220707065939.33453-1-zbigniew.kempczynski@intel.com>
 <20220707065939.33453-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707065939.33453-5-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] lib/igt_device_scan: Align
 microseconds to six leading zeros
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

On 2022-07-07 at 08:59:37 +0200, Zbigniew Kempczyński wrote:
> Previous format was not correct when DBG() was in use leading to
> not properly aligned output.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_device_scan.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index afb6f07e18..e41c9f8b64 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -34,6 +34,7 @@
>  #include <libudev.h>
>  #include <linux/limits.h>
>  #include <sys/stat.h>
> +#include <sys/time.h>
>  #include <sys/types.h>
>  
>  /**
> @@ -170,7 +171,7 @@
>  { \
>  	struct timeval tm; \
>  	gettimeofday(&tm, NULL); \
> -	printf("%10ld.%03ld: ", tm.tv_sec, tm.tv_usec); \
> +	printf("%10ld.%06ld: ", tm.tv_sec, tm.tv_usec); \
---------------- ^
I checked other debug prints and this is the only place which
uses 10ld for seconds, in other places there is %ld, so maybe
it is worth to change this ?

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

>  	printf(__VA_ARGS__); \
>  }
>  
> -- 
> 2.34.1
> 
