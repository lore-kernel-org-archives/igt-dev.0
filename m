Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6FF892AE
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 11:07:00 +0000 (UTC)
Date: Tue, 23 May 2023 13:06:57 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230523110657.nljlr5a54tb22fbl@zkempczy-mobl2>
References: <20230522163918.31881-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522163918.31881-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/drmtest: Igt info msg on opened
 device
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

On Mon, May 22, 2023 at 06:39:18PM +0200, Kamil Konieczny wrote:
> From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> 
> Log info of each opened device path (ex. "Opened device: /dev/dri/card0")
> to have a trace of devices under test.
> Device path opened for the first time is logged at info level,
> subsequent opens (if any) are logged at debug level.
> 
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/drmtest.c | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 7630bb793..4181644bf 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -205,6 +205,33 @@ static const struct module {
>  	{}
>  };
>  
> +struct _opened_device_path {
> +	char *path;
> +	struct igt_list_head link;
> +};
> +
> +/* Logs path of opened device. Device path opened for the first time is logged at info level,
> +   subsequent opens (if any) are logged at debug level */
> +static void log_opened_device_path(const char *device_path)
> +{
> +	static IGT_LIST_HEAD(opened_paths);
> +	struct _opened_device_path *item;
> +
> +	igt_list_for_each_entry(item, &opened_paths, link) {
> +		if (!strcmp(item->path, device_path)) {
> +			igt_debug("Opened previously opened device: %s\n", device_path);
> +			return;
> +		}
> +	}
> +
> +	item = calloc(1, sizeof(struct _opened_device_path));
> +	igt_assert(item);
> +	item->path = strdup(device_path);
> +	igt_assert(item->path);

Maybe assert on 'device_path' at function beginning. Regardless decision
looks correct from my perspective.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +	igt_list_add(&item->link, &opened_paths);
> +	igt_info("Opened device: %s\n", item->path);
> +}
> +
>  static int open_device(const char *name, unsigned int chipset)
>  {
>  	const char *forced;
> @@ -235,8 +262,11 @@ static int open_device(const char *name, unsigned int chipset)
>  			break;
>  		}
>  	}
> -	if ((chipset & chip) == chip)
> +
> +	if ((chipset & chip) == chip) {
> +		log_opened_device_path(name);
>  		return fd;
> +	}
>  
>  err:
>  	close(fd);
> -- 
> 2.39.2
> 
