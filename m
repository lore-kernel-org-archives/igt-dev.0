Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A0B6E8BB
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 14:22:23 +0000 (UTC)
Date: Fri, 20 Nov 2020 15:22:13 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201120142213.GE6508@kdec5-desk.ger.corp.intel.com>
References: <20201119044800.12686-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119044800.12686-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2] tests/core_auth: Added test description for test case
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 10:18:00AM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2:Modified detailed test descriptions to brief one.
> 
> Cc: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/core_auth.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/core_auth.c b/tests/core_auth.c
> index 9c240fdb..c9ad3fb9 100644
> --- a/tests/core_auth.c
> +++ b/tests/core_auth.c
> @@ -195,6 +195,7 @@ igt_main
>  	int master;
>  
>  	/* root (which we run igt as) should always be authenticated */
> +	igt_describe("Check drm client is always authenticated.");
>  	igt_subtest("getclient-simple") {
>  		int fd = drm_open_driver(DRIVER_ANY);
>  
> @@ -203,6 +204,7 @@ igt_main
>  		close(fd);
>  	}
>  
> +	igt_describe("Use 2 clients, check second is authenticated even when first dropped.");
>  	igt_subtest("getclient-master-drop") {
>  		int fd = drm_open_driver(DRIVER_ANY);
>  		int fd2 = drm_open_driver(DRIVER_ANY);
> @@ -220,11 +222,13 @@ igt_main
>  	igt_subtest_group {
>  		igt_fixture
>  			master = drm_open_driver_master(DRIVER_ANY);
> -
> +	
I am not sure about that new line ^ here.
> +		igt_describe("Test magic numbers for master and slave.");
>  		igt_subtest("basic-auth")
>  			test_basic_auth(master);
>  
>  		/* this must be last, we adjust the rlimit */
> +		igt_describe("Test authentication and magic numbers uniqness for rlimit slaves.");
>  		igt_subtest("many-magics")
>  			test_many_magics(master);
>  	}
At the end - it looks ok.
Reviewed-by: Katarzyna Dec <katarzyna.dec@intel.com>

Kasia :)
> -- 
> 2.28.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
