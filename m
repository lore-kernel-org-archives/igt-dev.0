Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BE310E36E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 10:17:04 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>, Nidhi Gupta
 <nidhi1.gupta@intel.com>
In-Reply-To: <YzF5cga2b9655bdK@platvala-desk.ger.corp.intel.com>
References: <20220926031318.17284-1-nidhi1.gupta@intel.com>
 <YzF5cga2b9655bdK@platvala-desk.ger.corp.intel.com>
Date: Mon, 26 Sep 2022 13:16:41 +0300
Message-ID: <87r0zy30fq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_backlight: Add new
 subtest to validate dual panel backlight
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 26 Sep 2022, Petri Latvala <petri.latvala@intel.com> wrote:
> On Mon, Sep 26, 2022 at 08:43:18AM +0530, Nidhi Gupta wrote:
>> Since driver can now support multiple eDPs and Debugfs structure for
>> backlight changed per connector the test should then iterate through
>> all eDP connectors.
>> 
>> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
>> ---
>>  tests/i915/i915_pm_backlight.c | 70 +++++++++++++++++++---------------
>>  1 file changed, 39 insertions(+), 31 deletions(-)
>> 
>> diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
>> index cafae7f7..1532193b 100644
>> --- a/tests/i915/i915_pm_backlight.c
>> +++ b/tests/i915/i915_pm_backlight.c
>> @@ -37,25 +37,26 @@
>>  
>>  struct context {
>>  	int max;
>> +	const char *path;
>>  };
>>  
>>  
>>  #define TOLERANCE 5 /* percent */
>> -#define BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
>> +#define BACKLIGHT_PATH "/sys/class/backlight"
>>  
>>  #define FADESTEPS 10
>>  #define FADESPEED 100 /* milliseconds between steps */
>>  
>>  IGT_TEST_DESCRIPTION("Basic backlight sysfs test");
>>  
>> -static int backlight_read(int *result, const char *fname)
>> +static int backlight_read(int *result, const char *fname, struct context *context)
>>  {
>>  	int fd;
>>  	char full[PATH_MAX];
>>  	char dst[64];
>>  	int r, e;
>>  
>> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
>> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
>>  
>>  	fd = open(full, O_RDONLY);
>>  	if (fd == -1)
>> @@ -73,14 +74,14 @@ static int backlight_read(int *result, const char *fname)
>>  	return errno;
>>  }
>>  
>> -static int backlight_write(int value, const char *fname)
>> +static int backlight_write(int value, const char *fname, struct context *context)
>>  {
>>  	int fd;
>>  	char full[PATH_MAX];
>>  	char src[64];
>>  	int len;
>>  
>> -	igt_assert(snprintf(full, PATH_MAX, "%s/%s", BACKLIGHT_PATH, fname) < PATH_MAX);
>> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s", BACKLIGHT_PATH, context->path, fname) < PATH_MAX);
>>  	fd = open(full, O_WRONLY);
>>  	if (fd == -1)
>>  		return -errno;
>> @@ -100,12 +101,12 @@ static void test_and_verify(struct context *context, int val)
>>  	const int tolerance = val * TOLERANCE / 100;
>>  	int result;
>>  
>> -	igt_assert_eq(backlight_write(val, "brightness"), 0);
>> -	igt_assert_eq(backlight_read(&result, "brightness"), 0);
>> +	igt_assert_eq(backlight_write(val, "brightness", context), 0);
>> +	igt_assert_eq(backlight_read(&result, "brightness", context), 0);
>>  	/* Check that the exact value sticks */
>>  	igt_assert_eq(result, val);
>>  
>> -	igt_assert_eq(backlight_read(&result, "actual_brightness"), 0);
>> +	igt_assert_eq(backlight_read(&result, "actual_brightness", context), 0);
>>  	/* Some rounding may happen depending on hw */
>>  	igt_assert_f(result >= max(0, val - tolerance) &&
>>  		     result <= min(context->max, val + tolerance),
>> @@ -124,16 +125,16 @@ static void test_bad_brightness(struct context *context)
>>  {
>>  	int val;
>>  	/* First write some sane value */
>> -	backlight_write(context->max / 2, "brightness");
>> +	backlight_write(context->max / 2, "brightness", context);
>>  	/* Writing invalid values should fail and not change the value */
>> -	igt_assert_lt(backlight_write(-1, "brightness"), 0);
>> -	backlight_read(&val, "brightness");
>> +	igt_assert_lt(backlight_write(-1, "brightness", context), 0);
>> +	backlight_read(&val, "brightness", context);
>>  	igt_assert_eq(val, context->max / 2);
>> -	igt_assert_lt(backlight_write(context->max + 1, "brightness"), 0);
>> -	backlight_read(&val, "brightness");
>> +	igt_assert_lt(backlight_write(context->max + 1, "brightness", context), 0);
>> +	backlight_read(&val, "brightness", context);
>>  	igt_assert_eq(val, context->max / 2);
>> -	igt_assert_lt(backlight_write(INT_MAX, "brightness"), 0);
>> -	backlight_read(&val, "brightness");
>> +	igt_assert_lt(backlight_write(INT_MAX, "brightness", context), 0);
>> +	backlight_read(&val, "brightness", context);
>>  	igt_assert_eq(val, context->max / 2);
>>  }
>>  
>> @@ -186,6 +187,7 @@ igt_main
>>  	igt_display_t display;
>>  	igt_output_t *output;
>>  	struct igt_fb fb;
>> +	char paths[][50] = { "intel_backlight", "card0-eDP-2-backlight" };
>
> Hardcoding "intel_backlight" is ok but is it possible to construct
> that other name from the used device? "eDP-2" is easy with
> igt_output_name, but I'm not sure how to elegantly get "card0" out of
> an fd...

They're symlinks of the form:

intel_backlight -> ../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight

so should be possible to figure out.


BR,
Jani.


> 
>
> Also consider having dynamic subtests instead for each output that has
> backlight controls available.

-- 
Jani Nikula, Intel Open Source Graphics Center
