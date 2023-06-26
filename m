Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFE710E08B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 17:41:35 +0000 (UTC)
Date: Mon, 26 Jun 2023 19:41:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230626174131.3rokdk5ji2g2cvd4@kamilkon-desk1>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
 <20230626051031.2363120-12-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626051031.2363120-12-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V4 i-g-t 11/24] tests/i915/gem_close_race: Fix the
 double closure of fd
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

Hi Bhanuprakash,
On 2023-06-26 at 10:40:18 +0530, Bhanuprakash Modem wrote:
> Don't close the fd in each thread, instead leave it to be
> closed by process termination
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_close_race.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 1a2efeab2..22cdc5874 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -303,7 +303,7 @@ static void thread(int fd, struct drm_gem_open name,
>  			n++;
>  		} while (1);
>  
> -		close(crashme.fd);
> +		/* leave fd to be closed by process termination */
>  	}
>  
>  	timer_delete(timer);
> -- 
> 2.40.0
> 
