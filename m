Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 11 Sep 2023 11:02:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230911110241.156b3259@maurocar-mobl2>
In-Reply-To: <20230908123233.137134-27-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-27-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 08/17] lib/kunit: Cancel
 KTP parser on module load failure
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

On Fri,  8 Sep 2023 14:32:42 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> For our KTAP parser to be running in parallel with kunit test module
> loading, we now start it in a separate thread before we load the module.
> If the module loading fails then we join the KTAP parser thread right
> after that failure.  If the KTAP thread sleeps for some reason then we
> can fail to break the test immediately.
> 
> Cancel the KTAP parser thread right after module load error and before
> joining it.

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/igt_kmod.c | 1 +
>  lib/igt_ktap.c | 6 ++++++
>  lib/igt_ktap.h | 1 +
>  3 files changed, 8 insertions(+)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 78b8eb8f53..fb0bd21ee5 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -773,6 +773,7 @@ static void __igt_kunit(struct igt_ktest *tst, const char *opts)
>  	results = ktap_parser_start(tst->kmsg, is_builtin);
>  
>  	if (igt_debug_on(igt_kmod_load(tst->module_name, opts) < 0)) {
> +		ktap_parser_cancel();
>  		igt_ignore_warn(ktap_parser_stop());
>  		igt_skip("Unable to load %s module\n", tst->module_name);
>  	}
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 3cfb55ec97..1e75b2ec23 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -602,6 +602,12 @@ struct ktap_test_results *ktap_parser_start(int fd, bool is_builtin)
>  	return &results;
>  }
>  
> +void ktap_parser_cancel(void)
> +{
> +	ktap_args.is_running = false;
> +	pthread_cancel(ktap_parser_thread);
> +}
> +
>  int ktap_parser_stop(void)
>  {
>  	ktap_args.is_running = false;
> diff --git a/lib/igt_ktap.h b/lib/igt_ktap.h
> index ea57c2bb9b..991800e912 100644
> --- a/lib/igt_ktap.h
> +++ b/lib/igt_ktap.h
> @@ -45,6 +45,7 @@ struct ktap_test_results {
>  
>  
>  struct ktap_test_results *ktap_parser_start(int fd, bool is_builtin);
> +void ktap_parser_cancel(void);
>  int ktap_parser_stop(void);
>  
>  #endif /* IGT_KTAP_H */
