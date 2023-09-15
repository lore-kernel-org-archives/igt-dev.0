Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 15 Sep 2023 12:43:52 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230915124352.13abc789@maurocar-mobl2>
In-Reply-To: <20230908123233.137134-30-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-30-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 11/17] lib/kunit: Fail /
 skip on kernel taint
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

On Fri,  8 Sep 2023 14:32:45 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Similar to how igt_kselftest() handles kernel taints, fail current dynamic
> sub-subtest and skip remaining ones when a kernel taint is detected during
> execution of kunit test cases.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Yeah, makes sense to me.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_kmod.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 020df286b8..988ac164cb 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -761,6 +761,7 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
>  	bool is_builtin;
>  	struct ktap_test_results *results;
>  	struct ktap_test_results_element *temp;
> +	unsigned long taints;
>  	int flags, ret;
>  
>  	igt_skip_on_f(tst->kmsg < 0, "Could not open /dev/kmsg\n");
> @@ -785,12 +786,20 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
>  
>  	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) != NULL)
>  	{
> +		if (igt_kernel_tainted(&taints)) {
> +			ktap_parser_cancel();
> +			break;
> +		}
> +
>  		if (READ_ONCE(results->head) != NULL) {
>  			pthread_mutex_lock(&results->mutex);
>  
> -			igt_dynamic(results->head->test_name)
> +			igt_dynamic(results->head->test_name) {
>  				igt_assert(READ_ONCE(results->head->passed));
>  
> +				igt_fail_on(igt_kernel_tainted(&taints));
> +			}
> +
>  			temp = results->head;
>  			results->head = results->head->next;
>  			free(temp);
> @@ -801,6 +810,7 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
>  
>  	ret = ktap_parser_stop();
>  
> +	igt_skip_on(igt_kernel_tainted(&taints));
>  	igt_skip_on_f(ret, "KTAP parser failed\n");
>  }
>  
