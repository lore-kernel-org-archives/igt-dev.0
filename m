Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54276E12E
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Mar 2021 11:00:40 +0000 (UTC)
From: "Bhatt, Jigar" <jigar.bhatt@intel.com>
Date: Fri, 26 Mar 2021 11:00:35 +0000
Message-ID: <DM6PR11MB2825ACD2AE4F23B6BB76E20AFD619@DM6PR11MB2825.namprd11.prod.outlook.com>
References: <1616569087-30691-1-git-send-email-jigar.bhatt@intel.com>
 <1616650650-2195-1-git-send-email-jigar.bhatt@intel.com>
 <eff907c3-d780-ad9a-e19b-afecb4580119@mupuf.org>
In-Reply-To: <eff907c3-d780-ad9a-e19b-afecb4580119@mupuf.org>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t RFC v1] tests/i915_pm_rpm: Add
 suspend-resume-latency test
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
To: Martin Peres <martin.peres@mupuf.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Martin,

Thanks for commenting and reading.
Yes I am measuring the kernel overhead of going to sleep and resuming. Surely I will mention in commit.
After suspend it's taking time in IGT around 0.5 ms. Suspend is fast.
two tests: one with dpms on, and one with dpms off,
earlier it is in single flow but yes that's better idea to separate and measure timing.

Thanks and Regards,
Jigar Bhatt

-----Original Message-----
From: Martin Peres <martin.peres@mupuf.org> 
Sent: Thursday, March 25, 2021 12:53 PM
To: Bhatt, Jigar <jigar.bhatt@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [i-g-t RFC v1] tests/i915_pm_rpm: Add suspend-resume-latency test

On 25/03/2021 07:37, Jigar Bhatt wrote:
> Measuring the suspend-resume time using tracefs, writing Suspend 
> Started, Suspend Completed, Resume Ended timestamp into tracefs file.
> After writing it's reading from tracefs file and measuring different, 
> suspend and resume , individual must be less than 1 sec.

Ahhhh, finally someone got to it! Thanks so much for this, as I was feeling bad for not having had the time to write it myself...

Comments are inlined!

> 
> v1:
> - Add limits.h and time.h
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>   tests/i915/i915_pm_rpm.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 86 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c index 
> 694a3ea..3cc9259 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -53,6 +53,8 @@
>   #include "igt_debugfs.h"
>   #include "igt_device.h"
>   #include "igt_edid.h"
> +#include "limits.h"
> +#include "time.h"
>   
>   #define MSR_PC8_RES	0x630
>   #define MSR_PC9_RES	0x631
> @@ -1998,6 +2000,85 @@ static int opt_handler(int opt, int opt_index, void *data)
>   	return IGT_OPT_HANDLER_SUCCESS;
>   }
>   
> +static void dpms_off(struct mode_set_data *data) {
> +	for (int i = 0; i < data->res->count_connectors; i++) {
> +		drmModeConnectorPtr c = data->connectors[i];
> +
> +		kmstest_set_connector_dpms(drm_fd, c, DRM_MODE_DPMS_OFF);
> +	}
> +}
> +
> +static void dpms_on(struct mode_set_data *data) {
> +	igt_display_t display;
> +
> +	igt_display_require(&display, drm_fd);
> +	for (int i = 0; i < data->res->count_connectors; i++) {
> +		drmModeConnectorPtr c = data->connectors[i];
> +
> +		kmstest_set_connector_dpms(drm_fd, c, DRM_MODE_DPMS_ON);
> +	}
> +}
> +
> +static uint32_t get_trace_timestamp(char *dc_data) {
> +	char *e;
> +	long ret;
> +	char *s = strchr(dc_data, ':');
> +
> +	assert(s);
> +	s++;
> +	ret = strtol(s, &e, 10);
> +	assert(((ret != LONG_MIN && ret != LONG_MAX) || errno != ERANGE) &&
> +		e > s && *e == '\n' && ret >= 0);it is impossible to know from the userspace how long it will take for the machine to go to sleep
> +	return ret;
> +}
> +
> +static long get_timestamp(void)
> +{
> +	struct timespec start;
> +
> +	clock_gettime(CLOCK_MONOTONIC_RAW, &start);
> +	return (start.tv_sec * 1000000 + (start.tv_nsec / 1000)); }

By using a monotonic clock, you are measuring the kernel overhead of going to sleep and resuming, and not the time spent off.

I think you need to explain why you are using it in the commit message (we assume the firmware is basically immediate, as measuring anything there is trickyMartin and measuring the wall time is tricky due to unreliable RTC clocks, and the inability to start the wake up milliseconds after suspend without a kernel patch).

> +
> +static void read_trace(void)
> +{
> +	int fd;
> +	char buf[4096];
> +
> +	fd = open("/sys/kernel/debug/tracing/trace", O_RDONLY);
> +	igt_assert(fd > 0);
> +	igt_assert(read(fd, buf, sizeof(buf)));
> +	igt_assert(((float)(get_trace_timestamp(strstr(buf, "Suspend_Completed")) -
> +			get_trace_timestamp(strstr(buf, "Suspend_Started"))) / 1000000) < 1);
> +	igt_assert(((float)(get_trace_timestamp(strstr(buf, "Resume_Ended")) -
> +			get_trace_timestamp(strstr(buf, "Suspend_Completed"))) / 1000000) < 1);
> +	close(fd);
> +}
> +
> +static void test_suspend_resume_latency(struct mode_set_data *data)
> +{
> +	int fd;
> +	char msg[400];
> +
> +	fd = open("/sys/kernel/debug/tracing/trace_marker", O_WRONLY);
> +	igt_assert(fd > 0);
> +	snprintf(msg, 100, "Suspend_Started : %ld", get_timestamp());
> +	write(fd, msg, strlen(msg));
> +	dpms_off(data);
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +	snprintf(msg, 100, "Suspend_Completed : %ld", get_timestamp());
> +	write(fd, msg, strlen(msg));
> +	dpms_on(data);
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
> +	snprintf(msg, 100, "Resume_Ended : %ld", get_timestamp());
> +	write(fd, msg, strlen(msg));
> +	close(fd);
> +	read_trace();
> +}

Why do you change the DPMS state during the state? Wouldn't you want to 
have two tests: one with dpms on, and one with dpms off?

Martin

> +
>   const char *help_str =
>   	"  --stress\t\tMake the stress-tests more stressful.\n"
>   	"  --stay\t\tDisable all screen and try to go into runtime pm. Useful for debugging.";
> @@ -2147,6 +2228,11 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   		pm_test_caching();
>   	}
>   
> +	igt_subtest("suspend-resume-latency") {
> +		test_suspend_resume_latency(&ms_data);
> +	}
> +
> +
>   	igt_fixture
>   		teardown_environment(false);
>   
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
