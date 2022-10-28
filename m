Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C78D10E83D
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 13:46:40 +0000 (UTC)
Date: Fri, 28 Oct 2022 15:46:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y1vdPf1uMuYn5WNi@kamilkon-desk1>
References: <20221010145708.1986912-1-petri.latvala@intel.com>
 <20221010145708.1986912-2-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221010145708.1986912-2-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/7] lib/igt_core: Send logs to runner
 with comms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-10-10 at 17:57:03 +0300, Petri Latvala wrote:
> If the runner has opened a socket to talk to it, use it for sending
> logs and other messages.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_core.c | 177 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 132 insertions(+), 45 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 2aee0d08..db0fee2a 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -76,6 +76,7 @@
>  #include "igt_list.h"
>  #include "igt_device_scan.h"
>  #include "igt_thread.h"
> +#include "runnercomms.h"
>  
>  #define UNW_LOCAL_ONLY
>  #include <libunwind.h>
> @@ -456,6 +457,84 @@ static void _igt_log_buffer_reset(void)
>  	pthread_mutex_unlock(&log_buffer_mutex);
>  }
>  
> +__attribute__((format(printf, 2, 3)))
> +static void _log_line_fprintf(FILE* stream, const char *format, ...)
> +{
> +	va_list ap;
> +	char *str;
> +
> +	va_start(ap, format);
> +
> +	if (runner_connected()) {
> +		vasprintf(&str, format, ap);
> +		send_to_runner(runnerpacket_log(fileno(stream), str));
> +		free(str);
> +	} else {
> +		vfprintf(stream, format, ap);
> +	}
> +}
> +
> +enum _subtest_type {
> +      _SUBTEST_TYPE_NORMAL,
> +      _SUBTEST_TYPE_DYNAMIC,
> +};
> +
> +static void _subtest_result_message(enum _subtest_type subtest_type,
> +				    const char *name,
> +				    const char *result,
> +				    double timeelapsed)
> +{
> +	char timestr[32];
> +
> +	snprintf(timestr, sizeof(timestr), "%.3f", timeelapsed);
> +
> +	if (runner_connected()) {
> +		if (subtest_type == _SUBTEST_TYPE_NORMAL)
> +			send_to_runner(runnerpacket_subtest_result(name, result, timestr, NULL));
> +		else
> +			send_to_runner(runnerpacket_dynamic_subtest_result(name, result, timestr, NULL));
> +
> +		return;
> +	}
> +
> +	printf("%s%s %s: %s (%ss)%s\n",
> +	       (!__igt_plain_output) ? "\x1b[1m" : "",
> +	       subtest_type == _SUBTEST_TYPE_NORMAL ? "Subtest" : "Dynamic subtest",
> +	       name,
> +	       result,
> +	       timestr,
> +	       (!__igt_plain_output) ? "\x1b[0m" : "");
> +	fflush(stdout);
> +	if (stderr_needs_sentinel)
> +		fprintf(stderr, "%s %s: %s (%ss)\n",
> +			subtest_type == _SUBTEST_TYPE_NORMAL ? "Subtest" : "Dynamic subtest",
> +			name,
> +			result,
> +			timestr);
> +}
> +
> +static void _subtest_starting_message(enum _subtest_type subtest_type,
> +				      const char *name)
> +{
> +	if (runner_connected()) {
> +		if (subtest_type == _SUBTEST_TYPE_NORMAL)
> +			send_to_runner(runnerpacket_subtest_start(name));
> +		else
> +			send_to_runner(runnerpacket_dynamic_subtest_start(name));
> +
> +		return;
> +	}
> +
> +	igt_info("Starting %s: %s\n",
> +		 subtest_type == _SUBTEST_TYPE_NORMAL ? "subtest" : "dynamic subtest",
> +		 name);
> +	fflush(stdout);
> +	if (stderr_needs_sentinel)
> +		fprintf(stderr, "Starting %s: %s\n",
> +			subtest_type == _SUBTEST_TYPE_NORMAL ? "subtest" : "dynamic subtest",
> +			name);
> +}
> +
>  static void _igt_log_buffer_dump(void)
>  {
>  	uint8_t i;
> @@ -478,31 +557,31 @@ static void _igt_log_buffer_dump(void)
>  	}
>  
>  	if (in_dynamic_subtest)
> -		fprintf(stderr, "Dynamic subtest %s failed.\n", in_dynamic_subtest);
> +		_log_line_fprintf(stderr, "Dynamic subtest %s failed.\n", in_dynamic_subtest);
>  	else if (in_subtest)
> -		fprintf(stderr, "Subtest %s failed.\n", in_subtest);
> +		_log_line_fprintf(stderr, "Subtest %s failed.\n", in_subtest);
>  	else
> -		fprintf(stderr, "Test %s failed.\n", command_str);
> +		_log_line_fprintf(stderr, "Test %s failed.\n", command_str);
>  
>  	if (log_buffer.start == log_buffer.end) {
> -		fprintf(stderr, "No log.\n");
> +		_log_line_fprintf(stderr, "No log.\n");
>  		return;
>  	}
>  
>  	pthread_mutex_lock(&log_buffer_mutex);
> -	fprintf(stderr, "**** DEBUG ****\n");
> +	_log_line_fprintf(stderr, "**** DEBUG ****\n");
>  
>  	i = log_buffer.start;
>  	do {
>  		char *last_line = log_buffer.entries[i];
> -		fprintf(stderr, "%s", last_line);
> +		_log_line_fprintf(stderr, "%s", last_line);
>  		i++;
>  	} while (i != log_buffer.start && i != log_buffer.end);
>  
>  	/* reset the buffer */
>  	log_buffer.start = log_buffer.end = 0;
>  
> -	fprintf(stderr, "****  END  ****\n");
> +	_log_line_fprintf(stderr, "****  END  ****\n");
>  	pthread_mutex_unlock(&log_buffer_mutex);
>  }
>  
> @@ -763,9 +842,19 @@ static void print_version(void)
>  
>  	uname(&uts);
>  
> -	igt_info("IGT-Version: %s-%s (%s) (%s: %s %s)\n", PACKAGE_VERSION,
> -		 IGT_GIT_SHA1, TARGET_CPU_PLATFORM,
> -		 uts.sysname, uts.release, uts.machine);
> +	if (runner_connected()) {
> +		char versionstr[256];
> +
> +		snprintf(versionstr, sizeof(versionstr),
> +			 "IGT-Version: %s-%s (%s) (%s: %s %s)\n", PACKAGE_VERSION,
> +			 IGT_GIT_SHA1, TARGET_CPU_PLATFORM,
> +			 uts.sysname, uts.release, uts.machine);
> +		send_to_runner(runnerpacket_versionstring(versionstr));
> +	} else {
> +		igt_info("IGT-Version: %s-%s (%s) (%s: %s %s)\n", PACKAGE_VERSION,
> +			 IGT_GIT_SHA1, TARGET_CPU_PLATFORM,
> +			 uts.sysname, uts.release, uts.machine);
> +	}
>  }
>  
>  static void print_usage(const char *help_str, bool output_on_stderr)
> @@ -937,6 +1026,11 @@ static void common_init_env(void)
>  	if (env) {
>  		igt_rc_device = strdup(env);
>  	}
> +
> +	env = getenv("IGT_RUNNER_SOCKET_FD");
> +	if (env) {
> +		set_runner_socket(atoi(env));
> +	}
>  }
>  
>  static int common_init(int *argc, char **argv,
> @@ -1329,24 +1423,15 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
>  
>  
>  	if (skip_subtests_henceforth) {
> -		printf("%sSubtest %s: %s%s\n",
> -		       (!__igt_plain_output) ? "\x1b[1m" : "", subtest_name,
> -		       skip_subtests_henceforth == SKIP ?
> -		       "SKIP" : "FAIL", (!__igt_plain_output) ? "\x1b[0m" : "");
> -		fflush(stdout);
> -		if (stderr_needs_sentinel)
> -			fprintf(stderr, "Subtest %s: %s\n", subtest_name,
> -				skip_subtests_henceforth == SKIP ?
> -				"SKIP" : "FAIL");
> +		_subtest_result_message(_SUBTEST_TYPE_NORMAL, subtest_name,
> +					skip_subtests_henceforth == SKIP ? "SKIP" : "FAIL",
> +					0.0);
>  		return false;
>  	}
>  
>  	igt_kmsg(KMSG_INFO "%s: starting subtest %s\n",
>  		 command_str, subtest_name);
> -	igt_info("Starting subtest: %s\n", subtest_name);
> -	fflush(stdout);
> -	if (stderr_needs_sentinel)
> -		fprintf(stderr, "Starting subtest: %s\n", subtest_name);
> +	_subtest_starting_message(_SUBTEST_TYPE_NORMAL, subtest_name);
>  
>  	_igt_log_buffer_reset();
>  	igt_thread_clear_fail_state();
> @@ -1374,10 +1459,7 @@ bool __igt_run_dynamic_subtest(const char *dynamic_subtest_name)
>  
>  	igt_kmsg(KMSG_INFO "%s: starting dynamic subtest %s\n",
>  		 command_str, dynamic_subtest_name);
> -	igt_info("Starting dynamic subtest: %s\n", dynamic_subtest_name);
> -	fflush(stdout);
> -	if (stderr_needs_sentinel)
> -		fprintf(stderr, "Starting dynamic subtest: %s\n", dynamic_subtest_name);
> +	_subtest_starting_message(_SUBTEST_TYPE_DYNAMIC, dynamic_subtest_name);
>  
>  	_igt_log_buffer_reset();
>  	igt_thread_clear_fail_state();
> @@ -1456,23 +1538,16 @@ bool __igt_enter_dynamic_container(void)
>  __noreturn static void exit_subtest(const char *result)
>  {
>  	struct timespec now;
> -	const char *subtest_text = in_dynamic_subtest ? "Dynamic subtest" : "Subtest";
>  	const char **subtest_name = in_dynamic_subtest ? &in_dynamic_subtest : &in_subtest;
>  	struct timespec *thentime = in_dynamic_subtest ? &dynamic_subtest_time : &subtest_time;
>  	jmp_buf *jmptarget = in_dynamic_subtest ? &igt_dynamic_jmpbuf : &igt_subtest_jmpbuf;
>  
>  	igt_gettime(&now);
>  
> -	igt_info("%s%s %s: %s (%.3fs)%s\n",
> -		 (!__igt_plain_output) ? "\x1b[1m" : "",
> -		 subtest_text, *subtest_name, result,
> -		 igt_time_elapsed(thentime, &now),
> -		 (!__igt_plain_output) ? "\x1b[0m" : "");
> -	fflush(stdout);
> -	if (stderr_needs_sentinel)
> -		fprintf(stderr, "%s %s: %s (%.3fs)\n",
> -			subtest_text, *subtest_name,
> -			result, igt_time_elapsed(thentime, &now));
> +	_subtest_result_message(in_dynamic_subtest ? _SUBTEST_TYPE_DYNAMIC : _SUBTEST_TYPE_NORMAL,
> +				*subtest_name,
> +				result,
> +				igt_time_elapsed(thentime, &now));
>  
>  	igt_terminate_spins();
>  
> @@ -1539,7 +1614,15 @@ void igt_skip(const char *f, ...)
>  
>  	if (!igt_only_list_subtests()) {
>  		va_start(args, f);
> -		vprintf(f, args);
> +		if (runner_connected()) {
> +			char *str;
> +
> +			vasprintf(&str, f, args);
> +			send_to_runner(runnerpacket_log(STDOUT_FILENO, str));
> +			free(str);
> +		} else {
> +			vprintf(f, args);
> +		}
>  		va_end(args);
>  	}
>  
> @@ -1827,7 +1910,10 @@ static bool running_under_gdb(void)
>  
>  static void __write_stderr(const char *str, size_t len)
>  {
> -	igt_ignore_warn(write(STDERR_FILENO, str, len));
> +	if (runner_connected())
> +		log_to_runner_sig_safe(str, len);
> +	else
> +		igt_ignore_warn(write(STDERR_FILENO, str, len));
>  }
>  
>  static void write_stderr(const char *str)
> @@ -1840,7 +1926,10 @@ static const char hex[] = "0123456789abcdef";
>  static void
>  xputch(int c)
>  {
> -	igt_ignore_warn(write(STDERR_FILENO, (const void *) &c, 1));
> +	if (runner_connected())
> +		log_to_runner_sig_safe((const void *) &c, 1);
> +	else
> +		igt_ignore_warn(write(STDERR_FILENO, (const void *) &c, 1));
>  }
>  
>  static int
> @@ -2849,11 +2938,9 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>  	/* prepend all except information messages with process, domain and log
>  	 * level information */
>  	if (level != IGT_LOG_INFO) {
> -		fwrite(formatted_line, sizeof(char), strlen(formatted_line),
> -		       file);
> +		_log_line_fprintf(file, "%s", formatted_line);
>  	} else {
> -		fwrite(thread_id, sizeof(char), strlen(thread_id), file);
> -		fwrite(line, sizeof(char), strlen(line), file);
> +		_log_line_fprintf(file, "%s%s", thread_id, line);
>  	}
>  
>  	pthread_mutex_unlock(&print_mutex);
> -- 
> 2.30.2
> 
