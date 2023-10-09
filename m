Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 9 Oct 2023 19:09:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231009170931.mcs7mnacy35dpwop@kamilkon-desk.igk.intel.com>
References: <20231009122750.519112-13-janusz.krzysztofik@linux.intel.com>
 <20231009122750.519112-20-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231009122750.519112-20-janusz.krzysztofik@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 07/11] lib/ktap: Drop workaround for
 missing top level KTAP headers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janusz,
On 2023-10-09 at 14:27:58 +0200, Janusz Krzysztofik wrote:
> A workaround was implemented in IGT KTAP parser so it could accepted KTAP
> reports with missing top level KTAP version and test suite plan headers.
> Since kernel side commit c95e7c05c139 ("kunit: Report the count of test
> suites in a module"), included in the mainline kernel since v6.6-rc1, has
> fixed that issue, that workaround is no longer needed.  Drop it.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_ktap.c              | 12 ------------
>  lib/tests/igt_ktap_parser.c |  3 +--
>  2 files changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 53a6c63288..7c52ba11ed 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -84,18 +84,6 @@ int igt_ktap_parse(const char *buf, struct igt_ktap_results *ktap)
>  		   igt_debug_on(sscanf(buf,
>  				       "%*1[ ]%*1[ ]%*1[ ]%*1[ ]KTAP%*[ ]version%*[ ]%u %n",
>  				       &n, &len) == 1 && len == strlen(buf))) {
> -		/*
> -		 * TODO: drop the following workaround as soon as
> -		 * kernel side issue of missing lines with top level
> -		 * KTAP version and test suite plan is fixed.
> -		 */
> -		if (ktap->expect == KTAP_START) {
> -			ktap->suite_count = 1;
> -			ktap->suite_last = 0;
> -			ktap->suite_name = NULL;
> -			ktap->expect = SUITE_START;
> -		}
> -
>  		if (igt_debug_on(ktap->expect != SUITE_START))
>  			return -EPROTO;
>  
> diff --git a/lib/tests/igt_ktap_parser.c b/lib/tests/igt_ktap_parser.c
> index 6357bdf6a5..476e14092f 100644
> --- a/lib/tests/igt_ktap_parser.c
> +++ b/lib/tests/igt_ktap_parser.c
> @@ -190,8 +190,7 @@ static void ktap_top_version(void)
>  
>  	ktap = igt_ktap_alloc(&results);
>  	igt_require(ktap);
> -	/* TODO: change to -EPROTO as soon as related workaround is dropped */
> -	igt_assert_eq(igt_ktap_parse("    KTAP version 1\n", ktap), -EINPROGRESS);
> +	igt_assert_eq(igt_ktap_parse("    KTAP version 1\n", ktap), -EPROTO);
>  	igt_ktap_free(ktap);
>  
>  	ktap = igt_ktap_alloc(&results);
> -- 
> 2.42.0
> 
