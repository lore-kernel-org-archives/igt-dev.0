Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CDC10E070
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Oct 2022 08:55:07 +0000 (UTC)
Date: Fri, 14 Oct 2022 11:54:49 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <Y0kj2X+FL/HQpMdg@platvala-desk.ger.corp.intel.com>
References: <20221014080255.19062-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014080255.19062-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_display_modes: Test cleanup
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

On Fri, Oct 14, 2022 at 01:32:55PM +0530, Jeevan B wrote:
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_display_modes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index eff30cbb..9a2199d3 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -162,7 +162,7 @@ igt_main
>  	igt_subtest_with_dynamic("extended-mode-basic") {
>  		for (i = 0; i < data.n_pipes - 1; i++) {
>  			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(pipe[i]),
> -					kmstest_pipe_name(pipe[i+1]));
> +					kmstest_pipe_name(pipe[i+1]))
>  			run_extendedmode_basic(&data, pipe[i], pipe[i+1]);
>  		}
>  	}

Commit message says "test cleanup" but this is a bugfix, please
rewrite it.

While at it, fix the indentation of the line
run_extendedmode_basic(&data, pipe[i], pipe[i+1]);


-- 
Petri Latvala
