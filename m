Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 11 Sep 2023 11:03:39 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230911110339.267f2a2a@maurocar-mobl2>
In-Reply-To: <20230908123233.137134-28-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-28-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 09/17] lib/ktap: Drop
 is_running flag
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

On Fri,  8 Sep 2023 14:32:43 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Since we now call pthread_cancel() when we want to stop KTAP parser before
> it completes, and we take care of returning failure in that case as a
> result of KTAP parsing, we no longer need to check a flag that indicates
> whether we should continue parsing or return a failure.  Drop that flag.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

LGTM.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>


> ---
>  lib/igt_ktap.c | 32 --------------------------------
>  1 file changed, 32 deletions(-)
> 
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 1e75b2ec23..fe77b62680 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -18,7 +18,6 @@
>  struct ktap_parser_args {
>  	int fd;
>  	bool is_builtin;
> -	volatile bool is_running;
>  	int ret;
>  } ktap_args;
>  
> @@ -61,11 +60,6 @@ static int log_to_end(enum igt_log_level level, int fd,
>  		igt_log(IGT_LOG_DOMAIN, level, "%s", record);
>  
>  		while (read(fd, record, BUF_LEN) < 0) {
> -			if (!READ_ONCE(ktap_args.is_running)) {
> -				igt_warn("ktap parser stopped\n");
> -				return -2;
> -			}
> -
>  			if (errno == EINTR)
>  				return -2;
>  
> @@ -183,11 +177,6 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
>  
>  	if (is_builtin) {
>  		while (read(fd, record, BUF_LEN) < 0) {
> -			if (!READ_ONCE(ktap_args.is_running)) {
> -				igt_warn("ktap parser stopped\n");
> -				return -2;
> -			}
> -
>  			if (errno == EINTR)
>  				return -2;
>  
> @@ -227,11 +216,6 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
>  			cutoff[0] = '\0';
>  
>  		while (read(fd, record, BUF_LEN) < 0) {
> -			if (!READ_ONCE(ktap_args.is_running)) {
> -				igt_warn("ktap parser stopped\n");
> -				return -2;
> -			}
> -
>  			if (errno == EINTR)
>  				return -2;
>  
> @@ -382,11 +366,6 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
>  
>  	for (int i = 0; i < test_count; i++) {
>  		while (read(fd, record, BUF_LEN) < 0) {
> -			if (!READ_ONCE(ktap_args.is_running)) {
> -				igt_warn("ktap parser stopped\n");
> -				return -1;
> -			}
> -
>  			if (errno == EINTR)
>  				return -1;
>  
> @@ -523,19 +502,11 @@ void *igt_ktap_parser(void *unused)
>  	failed_tests = false;
>  	found_tests = false;
>  
> -	if (!READ_ONCE(ktap_args.is_running))
> -		goto igt_ktap_parser_end;
> -
>  igt_ktap_parser_start:
>  	test_name[0] = '\0';
>  	test_name[BUF_LEN] = '\0';
>  
>  	while (read(fd, record, BUF_LEN) < 0) {
> -		if (!READ_ONCE(ktap_args.is_running)) {
> -			igt_warn("ktap parser stopped\n");
> -			goto igt_ktap_parser_end;
> -		}
> -
>  		if (errno == EAGAIN)
>  			/* No records available */
>  			continue;
> @@ -595,7 +566,6 @@ struct ktap_test_results *ktap_parser_start(int fd, bool is_builtin)
>  
>  	ktap_args.fd = fd;
>  	ktap_args.is_builtin = is_builtin;
> -	ktap_args.is_running = true;
>  	ktap_args.ret = IGT_EXIT_FAILURE;
>  	pthread_create(&ktap_parser_thread, NULL, igt_ktap_parser, NULL);
>  
> @@ -604,13 +574,11 @@ struct ktap_test_results *ktap_parser_start(int fd, bool is_builtin)
>  
>  void ktap_parser_cancel(void)
>  {
> -	ktap_args.is_running = false;
>  	pthread_cancel(ktap_parser_thread);
>  }
>  
>  int ktap_parser_stop(void)
>  {
> -	ktap_args.is_running = false;
>  	pthread_join(ktap_parser_thread, NULL);
>  	return ktap_args.ret;
>  }
