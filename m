Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5A4F0182A
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 11:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D033F10ECFE;
	Fri,  6 Mar 2026 11:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="by1j3LHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBCE10ECFB
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772797111; x=1804333111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zMvDtV17HQH34tOqf+mSuCN64zLSneaDEsvaJQXBy50=;
 b=by1j3LHGf7SrizzRJyq819PAGgRP8h/9wk9xOAuB2qmdicENZIZvLIsv
 T4WLOTvihca5ExjPQL0gg2sM4NU66QSKPVKz70+9e6nwyHG+syx0Et7Dn
 yR4bLiUga8kyZXsLqge2FRS4OROQ/dMHkROpupiQpvk6l46iHOOJcpBx9
 v8+wYt2UBtwINCIkajkqxC0jzA6Vx2UVC/hmXvml/ziu5yBulCP8H5eQu
 JwHJhZO7GTTIVey+QOx21936n9Pq+7Ibt5JWffKBA+KWjAdSUhKQnahvK
 TBcWm/+eIiha660p0fklhSpGpk1rLYmiAggtz368wcPHN2bI/mlDNKKjK A==;
X-CSE-ConnectionGUID: /jkDiP3jQZqDQAINZJ2y2Q==
X-CSE-MsgGUID: zjWwLHdVRgmAq97v/0fllQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="74019338"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="74019338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:38:30 -0800
X-CSE-ConnectionGUID: NBZr0ZNyR9O3MhNplj9mdQ==
X-CSE-MsgGUID: HIQrshdyS4yIK3ZE1QZ1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218137771"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.250])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:38:29 -0800
Date: Fri, 6 Mar 2026 13:38:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH i-g-t 2/5] tests/nouveau_crc: Convert to dynamic subtests
Message-ID: <aaq8seg15gKhcQRW@intel.com>
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
 <20260305134038.6995-3-ville.syrjala@linux.intel.com>
 <b1ef4fb6690311311b053d7165b3760a1e66bd44@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1ef4fb6690311311b053d7165b3760a1e66bd44@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Mar 06, 2026 at 01:13:52PM +0200, Jani Nikula wrote:
> On Thu, 05 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > nouveau_crc is the last holdout for for_each_pipe_static(). Convert
> > the tests to use dynamic per-pipe subtests so that we can nuke
> > for_each_pipe_static() and convert everything to use igt_crtc_t.
> 
> Looks legit, although the diff is a bit hard to follow.

Aye. I forgot to note that 'git show --ignore-all-space' makes it
actually legible. But to do that one actually has to apply the
patch :/

> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> > Untested due to lack of hardware.
> >
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_kms.h       |  12 -----
> >  tests/nouveau_crc.c | 113 ++++++++++++++++++++++++++------------------
> >  2 files changed, 68 insertions(+), 57 deletions(-)
> >
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index e91c6567757e..9514ef03f0e8 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -720,18 +720,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
> >  	for_each_output((display), (output))	\
> >  		for_each_if ((!(igt_output_is_connected((output)))))
> >  
> > -/**
> > - * for_each_pipe_static:
> > - * @pipe: The pipe to iterate.
> > - *
> > - * This for loop iterates over all pipes supported by IGT libraries.
> > - *
> > - * This should be used to enumerate per-pipe subtests since it has no runtime
> > - * depencies.
> > - */
> > -#define for_each_pipe_static(pipe) \
> > -	for (pipe = 0; pipe < IGT_MAX_PIPES; pipe++)
> > -
> >  /**
> >   * for_each_crtc:
> >   * @display: a pointer to an #igt_display_t structure
> > diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> > index 393414339ab0..59fa8a2daeb8 100644
> > --- a/tests/nouveau_crc.c
> > +++ b/tests/nouveau_crc.c
> > @@ -297,6 +297,16 @@ static void test_source(data_t *data, const char *source)
> >  	free(crcs);
> >  }
> >  
> > +static void test_source_outp_complete(data_t *data)
> > +{
> > +	test_source(data, "outp-complete");
> > +}
> > +
> > +static void test_source_rg(data_t *data)
> > +{
> > +	test_source(data, "rg");
> > +}
> > +
> >  static void test_source_outp_inactive(data_t *data)
> >  {
> >  	struct color_fb colors[] = {
> > @@ -365,13 +375,17 @@ static void cleanup_test(data_t *data)
> >  	close(data->nv_crc_dir);
> >  }
> >  
> > +static void run_test(data_t *data, void (*test)(data_t *data))
> > +{
> > +	setup_test(data);
> > +	test(data);
> > +	cleanup_test(data);
> > +}
> > +
> >  data_t data = {0};
> >  
> > -#define pipe_test(name) igt_subtest_f("pipe-%s-" name, kmstest_pipe_name(pipe))
> >  int igt_main()
> >  {
> > -	int pipe;
> > -
> >  	igt_fixture() {
> >  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> >  		igt_require_nouveau(data.drm_fd);
> > @@ -383,50 +397,59 @@ int igt_main()
> >  		igt_display_reset(&data.display);
> >  	}
> >  
> > -	for_each_pipe_static(pipe) {
> > -		igt_fixture() {
> > -			data.crtc = igt_crtc_for_pipe(&data.display, pipe);
> > -			igt_require(data.crtc->valid);
> > -
> > -			setup_test(&data);
> > +	/* We don't need to test this on every pipe, but the setup is the same */
> > +	igt_describe("Make sure that the CRC notifier context flip threshold "
> > +		     "is reset to its default value after a single capture.");
> > +	igt_subtest("ctx-flip-threshold-reset-after-capture") {
> > +		data.crtc = igt_crtc_for_pipe(&data.display, PIPE_A);
> > +		igt_require(data.crtc->valid);
> > +
> > +		run_test(&data, test_ctx_flip_threshold_reset_after_capture);
> > +	}
> > +
> > +	igt_describe("Make sure the association between each CRC and its "
> > +		     "respective frame index is not broken when the driver "
> > +		     "performs a notifier context flip.");
> > +	igt_subtest("ctx-flip-detection") {
> > +		for_each_crtc(&data.display, data.crtc) {
> > +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> > +				run_test(&data, test_ctx_flip_detection);
> >  		}
> > -
> > -		/* We don't need to test this on every pipe, but the setup is the same */
> > -		if (pipe == PIPE_A) {
> > -			igt_describe("Make sure that the CRC notifier context flip threshold "
> > -				     "is reset to its default value after a single capture.");
> > -			igt_subtest("ctx-flip-threshold-reset-after-capture")
> > -				test_ctx_flip_threshold_reset_after_capture(&data);
> > +	}
> > +
> > +	igt_describe("Make sure that igt_pipe_crc_get_current() works even "
> > +		     "when the CRC for the current frame index is lost.");
> > +	igt_subtest("ctx-flip-skip-current-frame") {
> > +		for_each_crtc(&data.display, data.crtc) {
> > +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> > +				run_test(&data, test_ctx_flip_skip_current_frame);
> >  		}
> > -
> > -		igt_describe("Make sure the association between each CRC and its "
> > -			     "respective frame index is not broken when the driver "
> > -			     "performs a notifier context flip.");
> > -		pipe_test("ctx-flip-detection")
> > -			test_ctx_flip_detection(&data);
> > -
> > -		igt_describe("Make sure that igt_pipe_crc_get_current() works even "
> > -			     "when the CRC for the current frame index is lost.");
> > -		pipe_test("ctx-flip-skip-current-frame")
> > -			test_ctx_flip_skip_current_frame(&data);
> > -
> > -		igt_describe("Check that basic CRC readback using the outp-complete "
> > -			     "source works.");
> > -		pipe_test("source-outp-complete")
> > -			test_source(&data, "outp-complete");
> > -
> > -		igt_describe("Check that basic CRC readback using the rg source "
> > -			     "works.");
> > -		pipe_test("source-rg")
> > -			test_source(&data, "rg");
> > -
> > -		igt_describe("Make sure that the outp-inactive source is actually "
> > -			     "capturing the inactive raster.");
> > -		pipe_test("source-outp-inactive")
> > -			test_source_outp_inactive(&data);
> > -
> > -		igt_fixture() {
> > -			cleanup_test(&data);
> > +	}
> > +
> > +	igt_describe("Check that basic CRC readback using the outp-complete "
> > +		     "source works.");
> > +	igt_subtest("source-outp-complete") {
> > +		for_each_crtc(&data.display, data.crtc) {
> > +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> > +				run_test(&data, test_source_outp_complete);
> > +		}
> > +	}
> > +
> > +	igt_describe("Check that basic CRC readback using the rg source "
> > +		     "works.");
> > +	igt_subtest("source-rg") {
> > +		for_each_crtc(&data.display, data.crtc) {
> > +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> > +				run_test(&data, test_source_rg);
> > +		}
> > +	}
> > +
> > +	igt_describe("Make sure that the outp-inactive source is actually "
> > +		     "capturing the inactive raster.");
> > +	igt_subtest("source-outp-inactive") {
> > +		for_each_crtc(&data.display, data.crtc) {
> > +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> > +				run_test(&data, test_source_outp_inactive);
> >  		}
> >  	}
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
