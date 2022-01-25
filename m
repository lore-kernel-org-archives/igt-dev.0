Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A4310E3E3
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 14:50:06 +0000 (UTC)
Date: Tue, 25 Jan 2022 16:48:42 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YfANykkEvHwKZ4/r@platvala-desk.ger.corp.intel.com>
References: <20220125142920.3812-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220125142920.3812-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_render_copy_redux:
 reduce looping if on simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 04:29:20PM +0200, Juha-Pekka Heikkila wrote:
> On simulation it's interesting plumbing generally works and don't
> waste time executing long loops.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/i915/gem_render_copy_redux.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/gem_render_copy_redux.c b/tests/i915/gem_render_copy_redux.c
> index 6c8d7f755..0ef482b99 100644
> --- a/tests/i915/gem_render_copy_redux.c
> +++ b/tests/i915/gem_render_copy_redux.c
> @@ -207,13 +207,13 @@ igt_main
>  	}
>  
>  	igt_subtest("normal") {
> -		int loop = 100;
> +		int loop = igt_run_in_simulation() ? 3 : 100;
>  		while (loop--)
>  			copy(&data);
>  	}
>  
>  	igt_subtest("interruptible") {
> -		int loop = 100;
> +		int loop = igt_run_in_simulation() ? 3 : 100;
>  		igt_fork_signal_helper();
>  		while (loop--)
>  			copy(&data);
> @@ -221,13 +221,13 @@ igt_main
>  	}
>  
>  	igt_subtest("flink") {
> -		int loop = 100;
> +		int loop = igt_run_in_simulation() ? 3 : 100;
>  		while (loop--)
>  			copy_flink(&data);
>  	}
>  
>  	igt_subtest("flink-interruptible") {
> -		int loop = 100;
> +		int loop = igt_run_in_simulation() ? 3 : 100;


int loop = SLOW_QUICK(100, 3);


-- 
Petri Latvala



>  		igt_fork_signal_helper();
>  		while (loop--)
>  			copy_flink(&data);
> -- 
> 2.28.0
> 
