Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D2510E9E7
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Oct 2023 15:17:54 +0000 (UTC)
Date: Fri, 27 Oct 2023 17:17:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20231027151735.gjfqbfetzuh5eloa@kamilkon-desk.igk.intel.com>
References: <20231027131746.18635-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231027131746.18635-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] intel/xe_exec_store.c: Fix the check
 for num of placements in store_all.
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

Hi Sai,

On 2023-10-27 at 18:47:46 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 

please improve subject:

[PATCH i-g-t] intel/xe_exec_store.c: Fix the check for num of placements in store_all.
-------------------------------- ^^ ------------------------------------------------ ^
Drop ".c" and last dot ".":
s/_store.c:/_store:/
s/_all./_all/

Also add "tests/" at begin:

[PATCH i-g-t] tests/intel/xe_exec_store: Fix the check for num of placements in store_all

> Intension is to run this test on GT's with supported engines and whose
> number of placements expected to be atleast one.
--------------------------------------^
s/atleast/at least/

> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 90684b8cb..0b084eb10 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -147,7 +147,8 @@ static void store_all(int fd, int gt, int class)
>  		eci[num_placements++] = *hwe;
>  	}
>  
> -	igt_require(num_placements);
> +	if (num_placements < 1)
> +		return;

This change could hide case when no test will be executed.

Regards,
Kamil

>  
>  	for (i = 0; i < num_placements; i++) {
>  		struct drm_xe_exec_queue_create create = {
> -- 
> 2.39.1
> 
