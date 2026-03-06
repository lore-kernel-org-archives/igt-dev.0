Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CCDF01827
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 11:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A94D10ECEC;
	Fri,  6 Mar 2026 11:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTose5CU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36410ECEC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772795637; x=1804331637;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=mZZXXfQmK+M+Q85c91aMPtrC28VDJhSKAkEIMEMW/Jk=;
 b=UTose5CUeHgb43/ibXa96ZTWc+T+LVCBi0mjFJckw+WVbr5l8dyHH0QS
 n3Xd+tb/V74dim4LuwfXytygUbc5p1VFDIEtWw7mMk6F4em4diY5s5fhj
 NKue0uLtB0J88+GHW9dpmiprbroT3p8ErpWtD1HB9Wd3Pe22SetLf1WXV
 NW1IczhUd2MQDofj/P1e1QW2IERK/51MEtOuqIiVOtYzbpBnk9bSU9rns
 2Jrytc3R1iS9NO0WyHm2cif3acs9trW9s6AO8Jdq+Gfwm4VIJ3b81xcb/
 9vLwSS12qmVLuH/BEdlaPzAYpErs1gZnQCFi5t05XZivreeCL/4ZMh6bL Q==;
X-CSE-ConnectionGUID: zXy02rYiT+iUwC19PRk3uQ==
X-CSE-MsgGUID: EyYphXE1QSygg2/CMJpNeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91475899"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="91475899"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:13:57 -0800
X-CSE-ConnectionGUID: edR6RPzOQiqCQzdwUn+MUw==
X-CSE-MsgGUID: 3WiKyjEGRQ+8VWdSHxI17Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="216123193"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 03:13:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH i-g-t 2/5] tests/nouveau_crc: Convert to dynamic subtests
In-Reply-To: <20260305134038.6995-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260305134038.6995-1-ville.syrjala@linux.intel.com>
 <20260305134038.6995-3-ville.syrjala@linux.intel.com>
Date: Fri, 06 Mar 2026 13:13:52 +0200
Message-ID: <b1ef4fb6690311311b053d7165b3760a1e66bd44@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 05 Mar 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> nouveau_crc is the last holdout for for_each_pipe_static(). Convert
> the tests to use dynamic per-pipe subtests so that we can nuke
> for_each_pipe_static() and convert everything to use igt_crtc_t.

Looks legit, although the diff is a bit hard to follow.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> Untested due to lack of hardware.
>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.h       |  12 -----
>  tests/nouveau_crc.c | 113 ++++++++++++++++++++++++++------------------
>  2 files changed, 68 insertions(+), 57 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e91c6567757e..9514ef03f0e8 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -720,18 +720,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc=
_t *crtc, igt_output_t *outp
>  	for_each_output((display), (output))	\
>  		for_each_if ((!(igt_output_is_connected((output)))))
>=20=20
> -/**
> - * for_each_pipe_static:
> - * @pipe: The pipe to iterate.
> - *
> - * This for loop iterates over all pipes supported by IGT libraries.
> - *
> - * This should be used to enumerate per-pipe subtests since it has no ru=
ntime
> - * depencies.
> - */
> -#define for_each_pipe_static(pipe) \
> -	for (pipe =3D 0; pipe < IGT_MAX_PIPES; pipe++)
> -
>  /**
>   * for_each_crtc:
>   * @display: a pointer to an #igt_display_t structure
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index 393414339ab0..59fa8a2daeb8 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -297,6 +297,16 @@ static void test_source(data_t *data, const char *so=
urce)
>  	free(crcs);
>  }
>=20=20
> +static void test_source_outp_complete(data_t *data)
> +{
> +	test_source(data, "outp-complete");
> +}
> +
> +static void test_source_rg(data_t *data)
> +{
> +	test_source(data, "rg");
> +}
> +
>  static void test_source_outp_inactive(data_t *data)
>  {
>  	struct color_fb colors[] =3D {
> @@ -365,13 +375,17 @@ static void cleanup_test(data_t *data)
>  	close(data->nv_crc_dir);
>  }
>=20=20
> +static void run_test(data_t *data, void (*test)(data_t *data))
> +{
> +	setup_test(data);
> +	test(data);
> +	cleanup_test(data);
> +}
> +
>  data_t data =3D {0};
>=20=20
> -#define pipe_test(name) igt_subtest_f("pipe-%s-" name, kmstest_pipe_name=
(pipe))
>  int igt_main()
>  {
> -	int pipe;
> -
>  	igt_fixture() {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>  		igt_require_nouveau(data.drm_fd);
> @@ -383,50 +397,59 @@ int igt_main()
>  		igt_display_reset(&data.display);
>  	}
>=20=20
> -	for_each_pipe_static(pipe) {
> -		igt_fixture() {
> -			data.crtc =3D igt_crtc_for_pipe(&data.display, pipe);
> -			igt_require(data.crtc->valid);
> -
> -			setup_test(&data);
> +	/* We don't need to test this on every pipe, but the setup is the same =
*/
> +	igt_describe("Make sure that the CRC notifier context flip threshold "
> +		     "is reset to its default value after a single capture.");
> +	igt_subtest("ctx-flip-threshold-reset-after-capture") {
> +		data.crtc =3D igt_crtc_for_pipe(&data.display, PIPE_A);
> +		igt_require(data.crtc->valid);
> +
> +		run_test(&data, test_ctx_flip_threshold_reset_after_capture);
> +	}
> +
> +	igt_describe("Make sure the association between each CRC and its "
> +		     "respective frame index is not broken when the driver "
> +		     "performs a notifier context flip.");
> +	igt_subtest("ctx-flip-detection") {
> +		for_each_crtc(&data.display, data.crtc) {
> +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> +				run_test(&data, test_ctx_flip_detection);
>  		}
> -
> -		/* We don't need to test this on every pipe, but the setup is the same=
 */
> -		if (pipe =3D=3D PIPE_A) {
> -			igt_describe("Make sure that the CRC notifier context flip threshold "
> -				     "is reset to its default value after a single capture.");
> -			igt_subtest("ctx-flip-threshold-reset-after-capture")
> -				test_ctx_flip_threshold_reset_after_capture(&data);
> +	}
> +
> +	igt_describe("Make sure that igt_pipe_crc_get_current() works even "
> +		     "when the CRC for the current frame index is lost.");
> +	igt_subtest("ctx-flip-skip-current-frame") {
> +		for_each_crtc(&data.display, data.crtc) {
> +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> +				run_test(&data, test_ctx_flip_skip_current_frame);
>  		}
> -
> -		igt_describe("Make sure the association between each CRC and its "
> -			     "respective frame index is not broken when the driver "
> -			     "performs a notifier context flip.");
> -		pipe_test("ctx-flip-detection")
> -			test_ctx_flip_detection(&data);
> -
> -		igt_describe("Make sure that igt_pipe_crc_get_current() works even "
> -			     "when the CRC for the current frame index is lost.");
> -		pipe_test("ctx-flip-skip-current-frame")
> -			test_ctx_flip_skip_current_frame(&data);
> -
> -		igt_describe("Check that basic CRC readback using the outp-complete "
> -			     "source works.");
> -		pipe_test("source-outp-complete")
> -			test_source(&data, "outp-complete");
> -
> -		igt_describe("Check that basic CRC readback using the rg source "
> -			     "works.");
> -		pipe_test("source-rg")
> -			test_source(&data, "rg");
> -
> -		igt_describe("Make sure that the outp-inactive source is actually "
> -			     "capturing the inactive raster.");
> -		pipe_test("source-outp-inactive")
> -			test_source_outp_inactive(&data);
> -
> -		igt_fixture() {
> -			cleanup_test(&data);
> +	}
> +
> +	igt_describe("Check that basic CRC readback using the outp-complete "
> +		     "source works.");
> +	igt_subtest("source-outp-complete") {
> +		for_each_crtc(&data.display, data.crtc) {
> +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> +				run_test(&data, test_source_outp_complete);
> +		}
> +	}
> +
> +	igt_describe("Check that basic CRC readback using the rg source "
> +		     "works.");
> +	igt_subtest("source-rg") {
> +		for_each_crtc(&data.display, data.crtc) {
> +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> +				run_test(&data, test_source_rg);
> +		}
> +	}
> +
> +	igt_describe("Make sure that the outp-inactive source is actually "
> +		     "capturing the inactive raster.");
> +	igt_subtest("source-outp-inactive") {
> +		for_each_crtc(&data.display, data.crtc) {
> +			igt_dynamic_f("pipe-%s", igt_crtc_name(data.crtc))
> +				run_test(&data, test_source_outp_inactive);
>  		}
>  	}

--=20
Jani Nikula, Intel
