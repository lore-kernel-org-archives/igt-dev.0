Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 11 Sep 2023 11:01:42 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230911110142.04abc143@maurocar-mobl2>
In-Reply-To: <20230908123233.137134-26-janusz.krzysztofik@linux.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-26-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 07/17] lib/ktap: Don't
 ignore interrupt signals
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

On Fri,  8 Sep 2023 14:32:41 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> While reading KTAP data from /dev/kmsg we now ignore interrupt signals
> that may occur during read() and we continue reading the data.  No
> explanation has been provided on what that could be needed for.

The reason is that kunit module load takes seconds, as it only finishes
loading after all tests are executed.

So, interrupting IGT won't interrupt the tests, and kmsg will still
be filled by test results.

IMO, the right thing to do here is to ignore interrupts, as otherwise
the logs for the next test will be polluted by the KTAP messages and
the Kernel will be kept on an unstable state, as running tests while
kUnit tests are running is not supported.

> 
> Always return with an error code to the caller when read() fails with
> errno == EINTR, so igt_runner has no problems with killing us promptly
> on timeout.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  lib/igt_ktap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
> index 84fb13218f..3cfb55ec97 100644
> --- a/lib/igt_ktap.c
> +++ b/lib/igt_ktap.c
> @@ -67,7 +67,7 @@ static int log_to_end(enum igt_log_level level, int fd,
>  			}
>  
>  			if (errno == EINTR)
> -				continue;
> +				return -2;
>  
>  			if (errno == EPIPE) {
>  				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> @@ -189,7 +189,7 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
>  			}
>  
>  			if (errno == EINTR)
> -				continue;
> +				return -2;
>  
>  			if (errno == EPIPE) {
>  				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> @@ -233,7 +233,7 @@ static int find_next_tap_subtest(int fd, char *record, char *test_name, bool is_
>  			}
>  
>  			if (errno == EINTR)
> -				continue;
> +				return -2;
>  
>  			if (errno == EPIPE) {
>  				igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
> @@ -388,7 +388,7 @@ static int parse_tap_level(int fd, char *base_test_name, int test_count, bool *f
>  			}
>  
>  			if (errno == EINTR)
> -				continue;
> +				return -1;
>  
>  			if (errno == EAGAIN)
>  				/* No records available */
> @@ -541,7 +541,7 @@ igt_ktap_parser_start:
>  			continue;
>  
>  		if (errno == EINTR)
> -			continue;
> +			goto igt_ktap_parser_end;
>  
>  		if (errno == EPIPE) {
>  			igt_warn("kmsg truncated: too many messages. You may want to increase log_buf_len in kmcdline\n");
