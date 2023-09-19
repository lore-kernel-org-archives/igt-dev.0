Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 08:36:06 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230919083606.2903010a@maurocar-mobl2>
In-Reply-To: <20230918134249.31645-36-janusz.krzysztofik@linux.intel.com>
References: <20230918134249.31645-19-janusz.krzysztofik@linux.intel.com>
 <20230918134249.31645-36-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v3 17/17] lib/kunit: Omit
 suite name prefix if the same as subtest name
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Isabella Basso <isabbasso@riseup.net>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 18 Sep 2023 15:43:07 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Kunit test modules usually contain one test suite, named after the module
> name with the trailing "_test" or "_kunit" suffix omitted.  Since we
> follow the same convention when we derive subtest names from module names,
> there is a great chance that those two names match.  Take this into
> account when composing names for IGT dynamic sub-subtest names and drop
> the leading test suite name component when it is the same as subtest name.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_kmod.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index f6e0ab07ce..05c837031c 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -863,7 +863,8 @@ static void kunit_result_free(struct igt_ktap_result *r,
>   *
>   * Returns: IGT default codes
>   */
> -static void __igt_kunit(struct igt_ktest *tst, const char *opts)
> +static void
> +__igt_kunit(struct igt_ktest *tst, const char *name, const char *opts)
>  {
>  	struct modprobe_data modprobe = { pthread_self(), tst->kmod, opts, 0,
>  					  PTHREAD_MUTEX_INITIALIZER, };
> @@ -902,7 +903,11 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
>  
>  		r = igt_list_first_entry(&results, r, link);
>  
> -		igt_dynamic_f("%s-%s", r->suite_name, r->case_name) {
> +		igt_dynamic_f("%s%s%s",
> +			      strcmp(r->suite_name, name) ?  r->suite_name : "",
> +			      strcmp(r->suite_name, name) ? "-" : "",
> +			      r->case_name) {
> +
>  			if (r->code == IGT_EXIT_INVALID) {
>  				/* parametrized test case, get actual result */
>  				kunit_result_free(r, &suite_name, &case_name);
> @@ -1011,7 +1016,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>  	 * and for documentation.
>  	 */
>  	igt_subtest_with_dynamic(name)
> -		__igt_kunit(&tst, opts);
> +		__igt_kunit(&tst, name, opts);
>  
>  	igt_fixture
>  		igt_ktest_end(&tst);
