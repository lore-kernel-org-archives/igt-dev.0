Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F77989D7C
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2020 20:03:34 +0000 (UTC)
Date: Wed, 3 Jun 2020 13:04:20 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
Message-ID: <20200603200420.GB18979@intel.com>
References: <20200511062647.9514-1-bhanuprakash.modem@intel.com>
 <20200511062647.9514-3-bhanuprakash.modem@intel.com>
 <20200603194714.GA18979@intel.com>
 <079c9e00-481c-1646-0f70-992969559171@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <079c9e00-481c-1646-0f70-992969559171@amd.com>
Subject: Re: [igt-dev] [RFC PATCH 2/2] tests/kms_vrr: Add new subtest to
 validate Flipline mode
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
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Cc: igt-dev@lists.freedesktop.org, pichika.uday.kiran@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 03, 2020 at 03:50:15PM -0400, Kazlauskas, Nicholas wrote:
> On 2020-06-03 3:47 p.m., Manasi Navare wrote:
> >On Mon, May 11, 2020 at 11:56:47AM +0530, bhanuprakash.modem@intel.com wrote:
> >>From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >>
> >>Check flipline mode by making sure that flips happen at flipline
> >>decision boundary.
> >>
> >>Example: if monitor vrr range is 40 - 60Hz and
> >>
> >>* flip at refresh_rate > 60Hz:
> >>   	Flip should happen at the flipline boundary & returned refresh rate
> >>	would be 60Hz.
> >>* flip at refresh_rate == 50Hz:
> >>	Flip should happen right away so returned refresh rate is 50Hz.
> >>* flip at refresh_rate < 40Hz:
> >>	Flip should happen at the vmax so the returned refresh rate
> >>	would be 40Hz.
> >>
> >>Cc: Harry Wentland <harry.wentland@amd.com>
> >>Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> >>Cc: Manasi Navare <manasi.d.navare@intel.com>
> >>Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >>---
> >>  tests/kms_vrr.c | 101 ++++++++++++++++++++++++++++++++++++------------
> >>  1 file changed, 76 insertions(+), 25 deletions(-)
> >>
> >>diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> >>index 0fe28931..c8a8c065 100644
> >>--- a/tests/kms_vrr.c
> >>+++ b/tests/kms_vrr.c
> >>@@ -37,6 +37,7 @@ enum {
> >>  	TEST_NONE = 0,
> >>  	TEST_DPMS = 1 << 0,
> >>  	TEST_SUSPEND = 1 << 1,
> >>+	TEST_FLIPLINE = 1 << 2,
> >>  };
> >>  typedef struct range {
> >>@@ -51,6 +52,12 @@ typedef struct data {
> >>  	igt_fb_t fb1;
> >>  } data_t;
> >>+typedef struct vtest_ns {
> >>+	uint64_t min;
> >>+	uint64_t mid;
> >>+	uint64_t max;
> >>+} vtest_ns_t;
> >>+
> >>  typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
> >>  /* Converts a timespec structure to nanoseconds. */
> >>@@ -100,13 +107,18 @@ static uint64_t rate_from_refresh(uint64_t refresh)
> >>  	return NSECS_PER_SEC / refresh;
> >>  }
> >>-/* Returns the min and max vrr range from the connector debugfs. */
> >>+/* Read min and max vrr range from the connector debugfs.
> >>+ * - min range should be less than the current mode vfreq
> >>+ * - if max range is grater than the current mode vfreq, consider
> >>+ *	current mode vfreq as the max range.
> >>+ */
> >>  static range_t get_vrr_range(data_t *data, igt_output_t *output)
> >>  {
> >>  	char buf[256];
> >>  	char *start_loc;
> >>  	int fd, res;
> >>  	range_t range;
> >>+	drmModeModeInfo *mode = igt_output_get_mode(output);
> >>  	fd = igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
> >>  	igt_assert(fd >= 0);
> >>@@ -118,32 +130,28 @@ static range_t get_vrr_range(data_t *data, igt_output_t *output)
> >>  	igt_assert(start_loc = strstr(buf, "Min: "));
> >>  	igt_assert_eq(sscanf(start_loc, "Min: %u", &range.min), 1);
> >>+	igt_require(mode->vrefresh > range.min);
> >
> >Why is it a req to have mode->vrefresh greater than Range.min? I think it also can be equal
> >to the min refresh rate right? Is it just to make sure that after enabling VRR, we can still
> >strtch the vblank further than the existing vblank to achieve even lower refresh rate?
> >
> >May be in this case also better to add this comment somewhere or something under igt_debug atleast
> >
> >Manasi
> 
> Haven't had a chance to check this update on AMD hardware yet, but I can
> respond to this at least.
> 
> Adaptive sync extends the front porch duration and there's a fixed portion
> of the front porch defined by the current refresh rate rate. You can't
> shorten the fixed portion.
> 
> The monitor will generally blank out if you try.
> 
> Regards,
> Nicholas Kazlauskas

Yes I do agree with you. But what you are saying is that basically you cannot shorten the vblank duration further
which puts limit on the maximum refresh rate that can be achieved meaning that the max refresh rate gets upper bounded
by the current refresh rate. For Eg: if we running at 60Hz, then if IGT requests a refresh rate greater than 60Hz then
the achieved refresh rate would still be 60Hz and thats done on Intel HW using something called as the flipline value
that is set to the minimum Vtotal corresponding to the max refresh rate.

But yea checking mode->vrefresh > range.min is probably a safe check, probably just add some comment to explain this.

Also Nicholas, yes it would be great if you can check that the synchronous atomic commit still work on AMD HW.


Regards
Manasi
> 
> >
> >
> >>  	igt_assert(start_loc = strstr(buf, "Max: "));
> >>  	igt_assert_eq(sscanf(start_loc, "Max: %u", &range.max), 1);
> >>+	range.max = (mode->vrefresh < range.max) ? mode->vrefresh : range.max;
> >>+
> >>  	return range;
> >>  }
> >>-/* Returns a suitable vrr test frequency. */
> >>-static uint64_t get_test_rate_ns(data_t *data, igt_output_t *output)
> >>+/* Returns vrr test frequency for min, mid & max range. */
> >>+static vtest_ns_t get_test_rate_ns(data_t *data, igt_output_t *output)
> >>  {
> >>-	drmModeModeInfo *mode = igt_output_get_mode(output);
> >>  	range_t range;
> >>-	uint64_t vtest;
> >>+	vtest_ns_t vtest_ns;
> >>-	/*
> >>-	 * The frequency with the fastest convergence speed should be
> >>-	 * the midpoint between the current mode vfreq and the min
> >>-	 * supported vfreq.
> >>-	 */
> >>  	range = get_vrr_range(data, output);
> >>-	igt_require(mode->vrefresh > range.min);
> >>+	vtest_ns.min = rate_from_refresh(range.min);
> >>+	vtest_ns.mid = rate_from_refresh(((range.max + range.min) / 2));
> >>+	vtest_ns.max = rate_from_refresh(range.max);
> >>-	vtest = (mode->vrefresh - range.min) / 2 + range.min;
> >>-	igt_require(vtest < mode->vrefresh);
> >>-
> >>-	return rate_from_refresh(vtest);
> >>+	return vtest_ns;
> >>  }
> >>  /* Returns true if an output supports VRR. */
> >>@@ -240,6 +248,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
> >>  	uint64_t start_ns, last_vblank_ns;
> >>  	uint32_t total_flip = 0, total_pass = 0;
> >>  	bool front = false;
> >>+	vtest_ns_t vtest_ns = get_test_rate_ns(data, output);
> >>  	/* Align with the vblank region to speed up convergence. */
> >>  	last_vblank_ns = wait_for_vblank(data, pipe);
> >>@@ -253,10 +262,6 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
> >>  		do_flip(data, pipe, front ? &data->fb1 : &data->fb0);
> >>  		vblank_ns = wait_for_vblank(data, pipe);
> >>-		diff_ns = rate_ns - (vblank_ns - last_vblank_ns);
> >>-		last_vblank_ns = vblank_ns;
> >>-
> >>-		total_flip += 1;
> >>  		/*
> >>  		 * Check if the difference between the two flip timestamps
> >>@@ -266,9 +271,19 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
> >>  		 * difference between 144Hz and 143Hz which should give this
> >>  		 * enough accuracy for most use cases.
> >>  		 */
> >>+		if ((rate_ns <= vtest_ns.min) && (rate_ns >= vtest_ns.max))
> >>+			diff_ns = rate_ns - (vblank_ns - last_vblank_ns);
> >>+		else if (rate_ns > vtest_ns.min)
> >>+			diff_ns = vtest_ns.min - (vblank_ns - last_vblank_ns);
> >>+		else if (rate_ns < vtest_ns.max)
> >>+			diff_ns = vtest_ns.max - (vblank_ns - last_vblank_ns);
> >>+
> >>  		if (llabs(diff_ns) < 50000ll)
> >>  			total_pass += 1;
> >>+		last_vblank_ns = vblank_ns;
> >>+		total_flip += 1;
> >>+
> >>  		now_ns = get_time_ns();
> >>  		if (now_ns - start_ns > duration_ns)
> >>  			break;
> >>@@ -295,10 +310,13 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
> >>  static void
> >>  test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> >>  {
> >>-	uint64_t rate;
> >>  	uint32_t result;
> >>+	vtest_ns_t vtest_ns = get_test_rate_ns(data, output);
> >>+	range_t range = get_vrr_range(data, output);
> >>+	uint64_t rate = vtest_ns.mid;
> >>-	rate = get_test_rate_ns(data, output);
> >>+	igt_info("VRR Test execution on %s, PIPE_%s\n",
> >>+		 output->name, kmstest_pipe_name(pipe));
> >>  	prepare_test(data, output, pipe);
> >>@@ -324,6 +342,35 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> >>  		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> >>  					      SUSPEND_TEST_NONE);
> >>+	/*
> >>+	 * Check flipline mode by making sure that flips happen at flipline
> >>+	 * decision boundary.
> >>+	 *
> >>+	 * Example: if range is 40 - 60Hz and
> >>+	 * if refresh_rate > 60Hz:
> >>+	 *      Flip should happen at the flipline boundary & returned refresh rate
> >>+	 *	would be 60Hz.
> >>+	 * if refresh_rate is 50Hz:
> >>+	 *      Flip will happen right away so returned refresh rate is 50Hz.
> >>+	 * if refresh_rate < 40Hz:
> >>+	 *      Flip should happen at the vmax so the returned refresh rate
> >>+	 *	would be 40Hz.
> >>+	 */
> >>+	if (flags & TEST_FLIPLINE) {
> >>+		rate = rate_from_refresh(range.min - 5);
> >>+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> >>+		igt_assert_f(result > 75,
> >>+			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> >>+			     rate, result);
> >>+
> >>+		rate = rate_from_refresh(range.max + 5);
> >>+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> >>+		igt_assert_f(result > 75,
> >>+			     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> >>+			     rate, result);
> >>+	}
> >>+
> >>+	rate = vtest_ns.mid;
> >>  	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> >>  	set_vrr_on_pipe(data, pipe, 0);
> >>@@ -331,14 +378,14 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> >>  	/* This check is delayed until after VRR is disabled so it isn't
> >>  	 * left enabled if the test fails. */
> >>  	igt_assert_f(result > 75,
> >>-		     "Target VRR on threshold not reached, result was %u%%\n",
> >>-		     result);
> >>+		     "Refresh rate %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
> >>+		     rate, result);
> >>  	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
> >>  	igt_assert_f(result < 10,
> >>-		     "Target VRR off threshold exceeded, result was %u%%\n",
> >>-		     result);
> >>+		     "Refresh rate %"PRIu64"ns: Target VRR off threshold exceeded, result was %u%%\n",
> >>+		     rate, result);
> >>  	igt_remove_fb(data->drm_fd, &data->fb1);
> >>  	igt_remove_fb(data->drm_fd, &data->fb0);
> >>@@ -392,6 +439,10 @@ igt_main
> >>  	igt_subtest("flip-suspend")
> >>  		run_vrr_test(&data, test_basic, TEST_SUSPEND);
> >>+	igt_describe("Make sure that flips happen at flipline decision boundary.");
> >>+	igt_subtest("flipline")
> >>+		run_vrr_test(&data, test_basic, TEST_FLIPLINE);
> >>+
> >>  	igt_fixture {
> >>  		igt_display_fini(&data.display);
> >>  	}
> >>-- 
> >>2.24.1.1.gb6d4d82bd5
> >>
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
