Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6586E312
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 11:00:59 +0000 (UTC)
Date: Tue, 19 May 2020 14:00:56 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200519110056.GA9497@platvala-desk.ger.corp.intel.com>
References: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519105408.10565-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_params: Fix verifying of
 debugfs parameters
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 19, 2020 at 01:54:08PM +0300, Juha-Pekka Heikkila wrote:
> After found correct place in debugfs for parameters there
> was used wrong path for verifying existence of parameter
> which caused fallback path to be used.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_params.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_params.c b/lib/igt_params.c
> index d8649dfd..410ca650 100644
> --- a/lib/igt_params.c
> +++ b/lib/igt_params.c
> @@ -143,14 +143,14 @@ static int __igt_params_open(int device, char **outpath, const char *param)
>  
>  		devname = openat(dir, "name", O_RDONLY);
>  		igt_require_f(devname >= 0,
> -		              "Driver need to name itself in debugfs!");
> +			      "Driver need to name itself in debugfs!");
>  
>  		read(devname, searchname, sizeof(searchname));
>  		close(devname);
>  
>  		foundname = strtok_r(searchname, " ", &ctx);
>  		igt_require_f(foundname,
> -		              "Driver need to name itself in debugfs!");
> +			      "Driver need to name itself in debugfs!");


While changing whitespace here, also add the missing \n to the string!

But do take a look at Chris's cleanup patches.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
