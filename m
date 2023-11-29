Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132510E1F6
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 14:18:07 +0000 (UTC)
Date: Wed, 29 Nov 2023 15:10:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Message-ID: <20231129141009.oxtumfheo6zpo2iw@kamilkon-desk.igk.intel.com>
References: <20231120143022.4184274-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231120143022.4184274-1-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] test/intel/perf_pmu: Dump drpc for
 correct gt
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

Hi Anshuman,
On 2023-11-20 at 20:00:22 +0530, Anshuman Gupta wrote:
> other-idle-gt rc6 test dumps drpc for wrong gt.

I would suggest rewrite it, like:

In subtest other-idle-gt rc6 waits for wrong gt.

> use gt, which has passed as function argument to
- ^
s/use/Use/

> test_rc6 to dump drpc.
------------ ^
s/to dump/to wait and dump/

> 
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/perf_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index c6e6a8b77..80763af1d 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1981,7 +1981,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>  		}
>  	}
>  
> -	igt_require_f(wait_for_rc6(fd[0], 1, pmus, test_idx),
> +	igt_require_f(wait_for_rc6(fd[0], 1, pmus, gt),
>  		      "failed to enter c6 \n%s\n", drpc = get_drpc(gem_fd, test_idx));

Same correction should be done for get_drpc() call:
static char *get_drpc(int i915, int gt_id)

>  
>  	/* While idle check full RC6. */
> @@ -2022,7 +2022,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
>  		}
>  	}
>  
> -	igt_require_f(wait_for_rc6(fd[0], 5, pmus, test_idx),
> +	igt_require_f(wait_for_rc6(fd[0], 5, pmus, gt),
>  		      "failed to enter c6 \n%s\n", drpc = get_drpc(gem_fd, test_idx));

Same here.

Regards,
Kamil

>  
>  	ts[0] = pmu_read_multi(fd[0], pmus, prev);
> -- 
> 2.25.1
> 
