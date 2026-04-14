Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA9FF9D0E8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 16:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B21910E009;
	Tue, 14 Apr 2026 16:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHqVkw50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B8510E009
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 16:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776185685; x=1807721685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4Bk6ZkfomGmZsJPVaYGL0yx87bbAu/nEPDoLnu+Qhe0=;
 b=UHqVkw501v6KFmBAdXZpHuRd+JEj06H9nRG1vsO4nZP9HUQlM74RtQUr
 5WM9WmQH1bMnIZufdEY/j0NreWhwuDnnS8IfxxzHCs7kPU/NW4X7udiv+
 131ZqqnBYbPlVA3L31nLK0uX57USIbpvYQPq1Saeo3gkXNU+OvEYaZer6
 JqnkBISwSsLAL6LtA4dHMME+2o0Q/35AS5+086uJOc/ndLwpK+pYct1YY
 4Jmu2/Y8KPqANVjrgRG2SKu8Rm5iT2ycjq40SRE0OB867WExsiUhheh16
 M5D8Br1E3ptX9Bpgv4zS/YJoP+FXCZ7d0AtEOLi34adC5LTrpLjofRteT A==;
X-CSE-ConnectionGUID: A4buz2sqR9idMfAvEa85kw==
X-CSE-MsgGUID: 5fFCt+4kRx6hNd8XfsTjdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77176029"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77176029"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:54:45 -0700
X-CSE-ConnectionGUID: qOI4INZ7TXepBv52TMHu5A==
X-CSE-MsgGUID: Rg1dNzsKTg+7vDEkCKF8VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230078106"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:54:44 -0700
Date: Tue, 14 Apr 2026 18:54:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
Cc: "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 Kamil Konieczny <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/kms_vrr: Drop cmrr subtest for redesign
Message-ID: <20260414165441.efc4dumqxqpdrfu3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 Kamil Konieczny <kamil.konieczny@intel.com>
References: <20260411175919.1135989-1-ramanaidu.naladala@intel.com>
 <0db970cc-f4b6-4999-9571-b835ddff5bf2@intel.com>
 <e42a2961-53e0-473c-8fde-a663de6615e5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e42a2961-53e0-473c-8fde-a663de6615e5@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Naladala,
On 2026-04-14 at 19:11:33 +0530, Naladala, Ramanaidu wrote:
> Hi Swati,
> 
> On 4/13/2026 8:51 PM, Sharma, Swati2 wrote:
> > Hi Ramanaidu,
> > 
> > Shouldn't we revert 7f0a262891b7888a09e4a1838eb688ad9c676324 ?
> Recent patches caused the revert to fail, so a new patch has been submitted.
> > 
> > commit 7f0a262891b7888a09e4a1838eb688ad9c676324
> > Author: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Date:   Tue Jun 18 13:12:25 2024 +0530
> > 
> >     tests/kms_vrr: New subtest for CMRR
> > 
> > ++Kamil
> > 
> > On 11-04-2026 11:29 pm, Naladala Ramanaidu wrote:
> > > Remove the CMRR subtest due to a change in test approach requiring
> > > a complete rewrite. The subtest will be reintroduced in a future
> > > patch with a revised test methodology.

If that is a case imho you could still add a comment about
reverting changes introduced by commit, after above explanation
add:

This reverts commit 7f0a262891b7 ("tests/kms_vrr: New subtest for CMRR")

Regards,
Kamil

> > > 
> > > Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> > > ---
> > >   tests/kms_vrr.c | 132 +-----------------------------------------------
> > >   1 file changed, 1 insertion(+), 131 deletions(-)
> > > 
> > > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > > index ec0692b2f..01f078d2c 100644
> > > --- a/tests/kms_vrr.c
> > > +++ b/tests/kms_vrr.c
> > > @@ -36,10 +36,6 @@
> > >   #include <signal.h>
> > >     /**
> > > - * SUBTEST: cmrr
> > > - * Description: Test to validate the content rate to exactly match
> > > with the
> > > - *         requested rate without any frame drops.
> > > - *
> > >    * SUBTEST: flip-basic
> > >    * Description: Tests that VRR is enabled and that the difference
> > > between flip
> > >    *              timestamps converges to the requested rate
> > > @@ -90,9 +86,6 @@
> > >    */
> > >   #define TEST_DURATION_NS (5000000000ull)
> > >   -#define CMRR_PRECISION_TOLERANCE    10
> > > -#define VREFRESH_MODIFIER    0.1
> > > -
> > >   enum {
> > >       TEST_BASIC = 1 << 0,
> > >       TEST_DPMS = 1 << 1,
> > > @@ -103,7 +96,6 @@ enum {
> > >       TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> > >       TEST_FASTSET = 1 << 7,
> > >       TEST_MAXMIN = 1 << 8,
> > > -    TEST_CMRR = 1 << 9,
> > >       TEST_LINK_OFF = 1 << 10,
> > >       TEST_NEGATIVE = 1 << 11,
> > >       TEST_FORCE_RR = 1 << 12,
> > > @@ -252,21 +244,6 @@ virtual_rr_vrr_range_mode(drmModeModeInfo
> > > *mode, float virtual_refresh_rate)
> > >       mode->vrefresh = virtual_refresh_rate;
> > >   }
> > >   -static bool
> > > -is_cmrr_mode(drmModeModeInfoPtr mode)
> > > -{
> > > -    int calculated_refresh, actual_refresh, pixel_clock_per_line;
> > > -
> > > -    actual_refresh = mode->vrefresh * 100;
> > > -    pixel_clock_per_line = mode->clock * 1000 / mode->htotal;
> > > -    calculated_refresh = pixel_clock_per_line * 100 / mode->vtotal;
> > > -
> > > -    if ((actual_refresh - calculated_refresh) <
> > > CMRR_PRECISION_TOLERANCE)
> > > -        return false;
> > > -
> > > -    return true;
> > > -}
> > > -
> > >   /* Read min and max vrr range from the connector debugfs. */
> > >   static range_t
> > >   get_vrr_range(data_t *data, igt_output_t *output)
> > > @@ -600,57 +577,6 @@ flip_and_measure(data_t *data, igt_output_t
> > > *output,
> > >       return 0;
> > >   }
> > >   -static uint32_t
> > > -flip_and_measure_cmrr(data_t *data, igt_output_t *output,
> > > -              uint64_t duration_ns)
> > > -{
> > > -    uint64_t start_ns, last_event_ns, event_ns;
> > > -    uint32_t total_flip = 0, total_pass = 0;
> > > -    bool front = false;
> > > -    drmModeModeInfoPtr mode = igt_output_get_mode(output);
> > > -    uint64_t req_rate_ns =
> > > igt_kms_frame_time_from_vrefresh(mode->vrefresh +
> > > VREFRESH_MODIFIER);
> > > -    uint64_t exp_rate_ns =
> > > igt_kms_frame_time_from_vrefresh(mode->vrefresh);
> > > -    uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1
> > > scan line. */
> > > -
> > > -    igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
> > > -         "expected rate: %"PRIu64" ns - %"PRIu64" ns (%.2f-%.2f Hz)\n",
> > > -         req_rate_ns, (mode->vrefresh + VREFRESH_MODIFIER),
> > > -         (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
> > > -         (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
> > > -         (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
> > > -
> > > -    do_flip(data, &data->fb[0]);
> > > -    start_ns = last_event_ns = get_kernel_event_ns(data,
> > > DRM_EVENT_FLIP_COMPLETE);
> > > -    do {
> > > -        int64_t target_ns, wait_ns, diff_ns = exp_rate_ns;
> > > -
> > > -        front = !front;
> > > -        do_flip(data, front ? &data->fb[1] : &data->fb[0]);
> > > -
> > > -        event_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> > > -        igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%.2f Hz)\n",
> > > -              event_ns - last_event_ns, (float)NSECS_PER_SEC /
> > > (event_ns - last_event_ns));
> > > -
> > > -        diff_ns -= event_ns - last_event_ns;
> > > -        if (llabs(diff_ns) <= threshold_ns)
> > > -            total_pass += 1;
> > > -
> > > -        last_event_ns = event_ns;
> > > -        total_flip += 1;
> > > -
> > > -        diff_ns = event_ns - start_ns;
> > > -        wait_ns = ((diff_ns + req_rate_ns - 1) / req_rate_ns) *
> > > req_rate_ns;
> > > -        wait_ns -= diff_ns;
> > > -        target_ns = event_ns + wait_ns;
> > > -        while (get_time_ns() < target_ns - 10);
> > > -    } while (event_ns - start_ns <= duration_ns);
> > > -
> > > -    igt_info("Completed %u flips, %u vblanks were in threshold for
> > > (%.2f Hz) %"PRIu64"ns.\n",
> > > -         total_flip, total_pass, (mode->vrefresh +
> > > VREFRESH_MODIFIER), req_rate_ns);
> > > -
> > > -    return total_flip ? ((total_pass * 100) / total_flip) : 0;
> > > -}
> > > -
> > >   /* Basic VRR flip functionality test - enable, measure, disable,
> > > measure */
> > >   static void
> > >   test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> > > @@ -946,54 +872,6 @@ test_lobf(data_t *data, igt_crtc_t *crtc,
> > > igt_output_t *output,
> > >       igt_assert_f(lobf_enabled, "LOBF not enabled\n");
> > >   }
> > >   -static void
> > > -test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
> > > -      uint32_t flags)
> > > -{
> > > -    uint32_t result;
> > > -    int i;
> > > -    bool found = false;
> > > -    drmModeConnectorPtr connector = output->config.connector;
> > > -    drmModeModeInfo mode = *igt_output_get_mode(output);
> > > -
> > > -    igt_info("CMRR test execution on %s, PIPE_%s with VRR range:
> > > (%u-%u) Hz\n",
> > > -         output->name, igt_crtc_name(crtc), data->range.min,
> > > -         data->range.max);
> > > -
> > > -    for (i = 0; i < connector->count_modes; i++) {
> > > -        if (is_cmrr_mode(&connector->modes[i])) {
> > > -            mode = connector->modes[i];
> > > -
> > > -            found = true;
> > > -            break;
> > > -        }
> > > -    }
> > > -
> > > -    igt_info("Selected mode: ");
> > > -    kmstest_dump_mode(&mode);
> > > -
> > > -    if (!found) {
> > > -        igt_info("No CMRR mode found on %s, try to tweak the
> > > clock.\n", output->name);
> > > -
> > > -        mode.clock = (mode.htotal * mode.vtotal * (mode.vrefresh +
> > > VREFRESH_MODIFIER)) / 1000;
> > > -
> > > -        igt_info("Tweaked mode: ");
> > > -        kmstest_dump_mode(&mode);
> > > -    }
> > > -
> > > -    igt_output_override_mode(output, &mode);
> > > -
> > > -    if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
> > > -        prepare_test(data, output,
> > > -                 crtc);
> > > -        result = flip_and_measure_cmrr(data, output,
> > > TEST_DURATION_NS * 2);
> > > -        igt_assert_f(result > 75,
> > > -                 "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on
> > > threshold not reached, result was %u%%\n",
> > > -                 mode.vrefresh,
> > > igt_kms_frame_time_from_vrefresh(mode.vrefresh),
> > > -                 result);
> > > -    }
> > > -}
> > > -
> > >   static void test_cleanup(data_t *data, igt_crtc_t *crtc,
> > > igt_output_t *output)
> > >   {
> > >       igt_crtc_set_prop_value(crtc,
> > > @@ -1013,7 +891,7 @@ static void test_cleanup(data_t *data,
> > > igt_crtc_t *crtc, igt_output_t *output)
> > >   static bool output_constraint(data_t *data, igt_output_t *output,
> > > uint32_t flags)
> > >   {
> > >   -    if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS |
> > > TEST_CMRR)) &&
> > > +    if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
> > >           output->config.connector->connector_type !=
> > > DRM_MODE_CONNECTOR_eDP) {
> > >           igt_info("%s: Connected panel is not eDP.\n",
> > > igt_output_name(output));
> > >           return false;
> > > @@ -1226,14 +1104,6 @@ int igt_main_args("drs:", long_opts,
> > > help_str, opt_handler, &data)
> > >           igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> > >               run_vrr_test(&data, test_seamless_virtual_rr_basic,
> > > TEST_SEAMLESS_VIRTUAL_RR);
> > >   -        igt_describe("Test to validate the content rate exactly
> > > matches with the "
> > > -                 "requested rate without any frame drops.");
> > > -        igt_subtest_with_dynamic("cmrr") {
> > > - igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >=
> > > 20);
> > > -
> > > -            run_vrr_test(&data, test_cmrr, TEST_CMRR);
> > > -        }
> > > -
> > >           igt_describe("Test to validate the link-off between active
> > > frames in "
> > >                    "non-PSR operation.");
> > >           igt_subtest_with_dynamic("lobf") {
