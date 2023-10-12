Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937E010E45D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 08:53:47 +0000 (UTC)
Message-ID: <a514f33c-650e-a306-836c-98f2b8602a77@linux.intel.com>
Date: Thu, 12 Oct 2023 09:53:44 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Lee Shawn C <shawn.c.lee@intel.com>, igt-dev@lists.freedesktop.org
References: <20231011084222.226352-1-shawn.c.lee@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231011084222.226352-1-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests: read engine name again before restore
 timeout value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 11/10/2023 09:42, Lee Shawn C wrote:
> We encounter a unexpected error on chrome book device while
> running this test. The tool will restore GPU engine's timeout
> value but open incorrect file name (XR24 in below). This is
> a workaround patch to avoid this problem before we got the
> root cause.
> 
> openat(AT_FDCWD, "/sys/dev/char/226:0", O_RDONLY) = 12
> openat(12, "dev", O_RDONLY)             = 13
> read(13, "226:0\n", 1023)               = 6
> close(13)                               = 0
> openat(12, "engine", O_RDONLY)          = 13
> close(12)                               = 0
> openat(13, "XR24", O_RDONLY)            = -1 ENOENT (No such file or directory)
> 
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/147
> ---
>   tests/intel/kms_busy.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
> index 5b620658fb18..119e6f1652ce 100644
> --- a/tests/intel/kms_busy.c
> +++ b/tests/intel/kms_busy.c
> @@ -414,9 +414,15 @@ static void gpu_engines_init_timeouts(int fd, int max_engines,
>   	}
>   }
>   
> -static void gpu_engines_restore_timeouts(int fd, int num_engines, const struct gem_engine_properties *props)
> +static void gpu_engines_restore_timeouts(int fd, int num_engines, struct gem_engine_properties *props)
>   {
> -	int i;
> +	const struct intel_execution_engine2 *e;
> +	int i = 0;
> +
> +	for_each_physical_engine(fd, e) {
> +		props[i].engine = e;
> +		i++;
> +	}
>   
>   	for (i = 0; i < num_engines; i++)
>   		gem_engine_properties_restore(fd, &props[i]);

By the look of it bug is in gpu_engines_init_timeouts(). This pointer 
assignment:

	for_each_physical_engine(fd, e) {
		igt_assert(*num_engines < max_engines);

		props[*num_engines].engine = e;

^^^ e is on stack, in scope of for_each_physical_engine, so by the time 
gpu_engines_restore_timeouts() runs it can legitimately point to 
garbage, like XR24 in your example.

Your workaround works, although strictly don't think the order of 
engines is guaranteed. Which is also moot since same preempt_timeout and 
hearbeat_interval is used for all.

Nevertheless, proper fix would be to allocate a make a copy of each 
engine and store a pointer to that. It might be an overkill but, up for 
discussion I guess.

Fixes: 9e635a1c5029 ("tests/kms_busy: Ensure GPU reset when waiting for 
a new FB during modeset")

So I'll be cheeky and add Imre and Juha-Pekka too.

Regards,

Tvrtko
