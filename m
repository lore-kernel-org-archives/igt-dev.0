Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256F689C80
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 06:36:15 +0000 (UTC)
Date: Tue, 5 May 2020 09:36:13 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200505063613.GH9497@platvala-desk.ger.corp.intel.com>
References: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504112623.285610-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_core: Make assert on
 invalid magic blocks nesting more verbose
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 04, 2020 at 02:26:21PM +0300, Arkadiusz Hiler wrote:
> Instead of ending the execution with cryptic assert let's actually print
> a message explaining the reason and point towards igt_core's documentation.
> 
> I am sticking with assert() instead of abort() because of the
> semi-useful stacktraces it produces.
> 
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  lib/igt_core.c | 55 ++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3f7b9f68..43f0ba8b 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -343,6 +343,21 @@ static bool stderr_needs_sentinel = false;
>  
>  static int _igt_dynamic_tests_executed = -1;
>  
> +__attribute__((format(printf, 2, 3)))
> +static void internal_assert(bool cond, const char *format, ...)
> +{
> +	if (!cond) {
> +		va_list ap;
> +
> +		va_start(ap, format);
> +		vfprintf(stderr, format, ap);
> +		va_end(ap);
> +		fprintf(stderr, "please refer to lib/igt_core documentation\n");
> +
> +		assert(0);
> +	}
> +}
> +
>  const char *igt_test_name(void)
>  {
>  	return command_str;
> @@ -540,8 +555,12 @@ uint64_t igt_nsec_elapsed(struct timespec *start)
>  
>  bool __igt_fixture(void)
>  {
> -	assert(!in_fixture);
> -	assert(test_with_subtests);
> +	internal_assert(!in_fixture,
> +			"nesting multiple igt_fixtures is invalid\n");
> +	internal_assert(!in_subtest,
> +			"nesting igt_fixture in igt_subtest is invalid\n");
> +	internal_assert(test_with_subtests,
> +			"igt_fixture in igt_simple_main is invalid\n");
>  
>  	if (igt_only_list_subtests())
>  		return false;
> @@ -1202,7 +1221,9 @@ static bool valid_name_for_subtest(const char *subtest_name)
>   */
>  bool __igt_run_subtest(const char *subtest_name, const char *file, const int line)
>  {
> -	assert(!igt_can_fail());
> +	internal_assert(!igt_can_fail(),
> +			"igt_subtest can be nested only in igt_main"
> +			" or igt_subtest_group\n");
>  
>  	if (!valid_name_for_subtest(subtest_name)) {
>  		igt_critical("Invalid subtest name \"%s\".\n",
> @@ -1257,8 +1278,8 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
>  
>  bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name)
>  {
> -	assert(in_subtest);
> -	assert(_igt_dynamic_tests_executed >= 0);
> +	internal_assert(in_subtest && _igt_dynamic_tests_executed >= 0,
> +			"igt_dynamic is allowed only inside igt_subtest_with_dynamic\n");
>  
>  	if (!valid_name_for_subtest(dynamic_subtest_name)) {
>  			igt_critical("Invalid dynamic subtest name \"%s\".\n",
> @@ -1311,7 +1332,8 @@ bool igt_only_list_subtests(void)
>  
>  void __igt_subtest_group_save(int *save, int *desc)
>  {
> -	assert(test_with_subtests);
> +	internal_assert(test_with_subtests,
> +			"igt_subtest_group is not allowed in igt_simple_main\n");
>  
>  	if (__current_description[0] != '\0') {
>  		struct description_node *new = calloc(1, sizeof(*new));
> @@ -1414,7 +1436,8 @@ void igt_skip(const char *f, ...)
>  	va_list args;
>  	skipped_one = true;
>  
> -	assert(!test_child);
> +	internal_assert(!test_child,
> +			"skips are not allowed in forks\n");
>  
>  	if (!igt_only_list_subtests()) {
>  		va_start(args, f);
> @@ -1427,7 +1450,9 @@ void igt_skip(const char *f, ...)
>  		exit_subtest("SKIP");
>  	} else if (test_with_subtests) {
>  		skip_subtests_henceforth = SKIP;
> -		assert(in_fixture);
> +		internal_assert(in_fixture,
> +			"skipping is allowed only in fixtures, subtests"
> +			" or igt_simple_main\n");
>  		__igt_fixture_end();
>  	} else {
>  		igt_exitcode = IGT_EXIT_SKIP;
> @@ -1547,7 +1572,8 @@ void igt_fail(int exitcode)
>  	if (in_subtest) {
>  		exit_subtest("FAIL");
>  	} else {
> -		assert(igt_can_fail());
> +		internal_assert(igt_can_fail(), "failing test is only allowed"
> +				" in fixtures, subtests and igt_simple_main");
>  
>  		if (in_fixture) {
>  			skip_subtests_henceforth = FAIL;
> @@ -1612,8 +1638,9 @@ void igt_describe_f(const char *fmt, ...)
>  	int ret;
>  	va_list args;
>  
> -	if (in_subtest && _igt_dynamic_tests_executed >= 0)
> -		assert(!"Documenting dynamic subsubtests is impossible. Document the subtest instead.");
> +	internal_assert(!in_subtest || _igt_dynamic_tests_executed < 0,
> +			"Documenting dynamic subsubtests is impossible."
> +			" Document the subtest instead.");

This is the only internal_assert call with capitalized text.

With more consistency applied,

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>  
>  	if (!describe_subtests)
>  		return;
> @@ -2224,8 +2251,10 @@ static void children_exit_handler(int sig)
>  
>  bool __igt_fork(void)
>  {
> -	assert(!test_with_subtests || in_subtest);
> -	assert(!test_child);
> +	internal_assert(!test_with_subtests || in_subtest,
> +			"forking is only allowed in subtests or igt_simple_main\n");
> +	internal_assert(!test_child,
> +			"forking is not allowed from already forked children\n");
>  
>  	igt_install_exit_handler(children_exit_handler);
>  
> -- 
> 2.25.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
