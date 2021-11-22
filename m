Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <88dca452-9cbb-b99f-0567-519c665736b1@linux.intel.com>
Date: Mon, 22 Nov 2021 09:03:23 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20211119125945.55056-1-tvrtko.ursulin@linux.intel.com>
 <20211119125945.55056-3-tvrtko.ursulin@linux.intel.com>
 <YZesawet06wfQ1SG@platvala-desk.ger.corp.intel.com>
 <8b1bdb41-fe31-8482-655d-724a6937d2c7@linux.intel.com>
 <YZfFlI/cB2OyXZeE@platvala-desk.ger.corp.intel.com>
 <YZfIwtCEqbqs1dIz@platvala-desk.ger.corp.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <YZfIwtCEqbqs1dIz@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] igt/core: Fix build warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 19/11/2021 15:54, Petri Latvala wrote:
> On Fri, Nov 19, 2021 at 05:41:08PM +0200, Petri Latvala wrote:
>> On Fri, Nov 19, 2021 at 03:34:54PM +0000, Tvrtko Ursulin wrote:
>>> On 19/11/2021 13:53, Petri Latvala wrote:
>>>> On Fri, Nov 19, 2021 at 12:59:42PM +0000, Tvrtko Ursulin wrote:
>>> Okay I wasn't sufficiently focused while trying to fix this. No idea then
>>> apart for playing with pragmas.
> 
> 
> How's this:
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index ec05535c..6a4d0270 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -2727,6 +2727,8 @@ void igt_log(const char *domain, enum igt_log_level level, const char *format, .
>   }
>   
>   static pthread_key_t __vlog_line_continuation;
> +static const bool __dummy_true = true;
> +static const bool __dummy_false = false;
>   
>   igt_constructor {
>   	pthread_key_create(&__vlog_line_continuation, NULL);
> @@ -2751,6 +2753,7 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>   	FILE *file;
>   	char *line, *formatted_line;
>   	char *thread_id;
> +	void *line_continuation;
>   	const char *program_name;
>   	const char *igt_log_level_str[] = {
>   		"DEBUG",
> @@ -2785,7 +2788,8 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>   	if (vasprintf(&line, format, args) == -1)
>   		return;
>   
> -	if (pthread_getspecific(__vlog_line_continuation)) {
> +	line_continuation = pthread_getspecific(__vlog_line_continuation);
> +	if (line_continuation != NULL && *(bool *)line_continuation) {
>   		formatted_line = strdup(line);
>   		if (!formatted_line)
>   			goto out;
> @@ -2796,9 +2800,9 @@ void igt_vlog(const char *domain, enum igt_log_level level, const char *format,
>   	}
>   
>   	if (line[strlen(line) - 1] == '\n')
> -		pthread_setspecific(__vlog_line_continuation, (void*) false);
> +		pthread_setspecific(__vlog_line_continuation, &__dummy_false);
>   	else
> -		pthread_setspecific(__vlog_line_continuation, (void*) true);
> +		pthread_setspecific(__vlog_line_continuation, &__dummy_true);
>   
>   	/* append log buffer */
>   	_igt_log_buffer_append(formatted_line);
> diff --git a/lib/igt_thread.c b/lib/igt_thread.c
> index 5bdda410..0d7bce80 100644
> --- a/lib/igt_thread.c
> +++ b/lib/igt_thread.c
> @@ -29,6 +29,7 @@
>   #include "igt_thread.h"
>   
>   static pthread_key_t __igt_is_main_thread;
> +static const bool __dummy_true = true;
>   
>   static _Atomic(bool) __thread_failed = false;
>   
> @@ -65,5 +66,5 @@ bool igt_thread_is_main(void)
>   
>   igt_constructor {
>   	pthread_key_create(&__igt_is_main_thread, NULL);
> -	pthread_setspecific(__igt_is_main_thread, (void*) 0x1);
> +	pthread_setspecific(__igt_is_main_thread, &__dummy_true);

LGTM.

Regards,

Tvrtko
