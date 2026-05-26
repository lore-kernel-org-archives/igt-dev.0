Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0CCCD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 08:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1102710E603;
	Tue, 26 May 2026 08:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pH3EJ0EL";
	dkim-atps=neutral
X-Greylist: delayed 592 seconds by postgrey-1.36 at gabe;
 Tue, 26 May 2026 07:28:30 UTC
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E771F10E518
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:28:30 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gPkcq4DrWz9ttZ;
 Tue, 26 May 2026 09:18:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1779779915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBcO1cyGH97BiK9gQd6ON1azT13m7UfhCCZ4AO7rn74=;
 b=pH3EJ0ELjFN5rlQaonChfoG+q3GZ+dQhgxii/G9+ZDI6tD9F12mqkbtscQKHG0fnQR8tC7
 lSf0tifzEE5mq7fhOuDB6cHJBTbKL+4TeWKejqZRH5wLRM3Ah/klBq9u4gJ+h1gIjPNqB7
 WQ6u3oyVBj55Xq8ydwkGkdQHJnuvocAp6GBoOOqElVgnEnq23uypKtYpmbhEMZEi0erKHh
 37GiaaAaVGuNfeblNtBe3sUez68DTqdOaNgUKR5HfQw0xJhvNaNMoLJMeyZyRf45SptD3j
 5rCT6Vf60Wv6kss1v/o+GegqLVKZSihqaa7mmJMMtQVPcFlgoW+NQCRocxZIrQ==
Message-ID: <9af879858bda09b11af3a4f4cd216b5876be4068.camel@mailbox.org>
Subject: Re: [PATCH i-g-t v7 5/7] tests/intel/kms_pm_dc: Add new test for
 dc3co framedrop validation
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com, 
 mohammed.thasleem@intel.com, ramanaidu.naladala@intel.com
Date: Tue, 26 May 2026 09:18:31 +0200
In-Reply-To: <20260526064105.1818876-6-jeevan.b@intel.com>
References: <20260526064105.1818876-1-jeevan.b@intel.com>
 <20260526064105.1818876-6-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: rqrkjgkb4qxoy4w4d551ypatuffe1x8a
X-MBO-RS-ID: 496e5d573174072cf49
X-Mailman-Approved-At: Tue, 26 May 2026 08:18:53 +0000
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

Hi Jeevan,

I have scanned your series and notices following:

On Tue, 2026-05-26 at 12:11 +0530, Jeevan B wrote:
> Add a new subtest to validate that no frame drops occur during
> DC3CO entry, ensuring that no frame drops are detected and DC3CO
> is successfully triggered during the test.

There is some kind of repetition here. It's not wrong but it sound weird.


> v2: Simplify validation by alternating commits and waiting for
> =C2=A0=C2=A0=C2=A0 kernel vblank after each commit. Verify vblank sequenc=
e keeps
> =C2=A0=C2=A0=C2=A0 advancing no dropped/stalled updates and confirm DC3CO=
 counter
> =C2=A0=C2=A0=C2=A0 increments.

Why do you put v2: in the changelog instead of the cover letter? I haven't
seen this before.

The diff is good

best regards
 Manuel

>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
> =C2=A0tests/intel/kms_pm_dc.c | 110 +++++++++++++++++++++++++++++++++++++=
+++
> =C2=A01 file changed, 110 insertions(+)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 57dade47d..620ba9329 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -51,6 +51,10 @@
> =C2=A0 * Description: Make sure that system enters DC3CO when PSR2 or PR =
is active and
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 system is in SLEEP state
> =C2=A0 *
> + * SUBTEST: dc3co-framedrop-check
> + * Description: Verify that DC3CO entry does not cause frame drops and s=
uccessfully
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 enters the power state
> + *
> =C2=A0 * SUBTEST: dc5-dpms
> =C2=A0 * Description: Validate display engine entry to DC5 state while al=
l connectors's
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 DPMS property set to OFF
> @@ -342,6 +346,82 @@ static void test_dc3co_vpb_simulation(data_t *data)
> =C2=A0	cleanup_dc3co_fbs(data);
> =C2=A0}
> =C2=A0
> +static uint32_t wait_for_next_vblank_seq(data_t *data)
> +{
> +	drmVBlank wait =3D {};
> +	igt_crtc_t *crtc =3D data->output->pending_crtc;
> +
> +	igt_assert_f(crtc, "No CRTC bound to output for vblank wait\n");
> +
> +	wait.request.type =3D kmstest_get_vbl_flag(crtc->crtc_index) |
> +						 DRM_VBLANK_RELATIVE |
> +						 DRM_VBLANK_NEXTONMISS;
> +	wait.request.sequence =3D 1;
> +	igt_assert_eq(drmWaitVBlank(data->drm_fd, &wait), 0);
> +
> +	return wait.reply.sequence;
> +}
> +
> +static void detect_dc3co_framedrop(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_prev_cnt;
> +	uint32_t dc3co_cur_cnt;
> +	uint32_t prev_vblank_seq =3D 0;
> +	uint32_t vblank_seq;
> +	int delay;
> +	int dc3co_target_flips =3D 200;
> +	int verify_commits =3D 300;
> +	int committed =3D 0;
> +	bool dc3co_after_target =3D false;
> +	bool front =3D false;
> +
> +	igt_require_f(data->mode->vrefresh !=3D 0, "Invalid vrefresh rate of 0\=
n");
> +
> +	primary =3D igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIM=
ARY);
> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit(&data->display);
> +
> +	dc3co_prev_cnt =3D igt_read_dc_counter(data->debugfs_fd, IGT_INTEL_CHEC=
K_DC3CO);
> +
> +	delay =3D (int)(1.5 * (1000000 / data->mode->vrefresh));
> +
> +	while (committed < verify_commits) {
> +		front =3D !front;
> +		igt_plane_set_fb(primary, front ? &data->fb_rgr : &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +
> +		vblank_seq =3D wait_for_next_vblank_seq(data);
> +		if (prev_vblank_seq)
> +			igt_assert_f(igt_vblank_after(vblank_seq, prev_vblank_seq),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Vblank sequence did not advance after comm=
it
> %d\n",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 committed + 1);
> +		prev_vblank_seq =3D vblank_seq;
> +		committed++;
> +		usleep(delay);
> +
> +		dc3co_cur_cnt =3D igt_read_dc_counter(data->debugfs_fd,
> +						=C2=A0=C2=A0=C2=A0 IGT_INTEL_CHECK_DC3CO);
> +		if (committed >=3D dc3co_target_flips && dc3co_cur_cnt > dc3co_prev_cn=
t)
> +			dc3co_after_target =3D true;
> +	}
> +
> +	igt_assert_eq(committed, verify_commits);
> +	igt_assert_f(dc3co_after_target,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "DC3CO did not increment after %d flips while=
 validating %d
> commits\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 dc3co_target_flips, verify_commits);
> +}
> +
> +static void test_dc3co_framedrop(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co(data);
> +	setup_videoplayback(data);
> +	detect_dc3co_framedrop(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
> =C2=A0static void test_dc5_retention_flops(data_t *data, int dc_flag)
> =C2=A0{
> =C2=A0	uint32_t dc_counter_before_psr;
> @@ -693,6 +773,36 @@ int igt_main()
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	igt_describe("Validate that no frame drops occur during DC3CO entry "
> +			=C2=A0=C2=A0=C2=A0=C2=A0 "while alternating framebuffers with PSR2 or=
 Panel Replay
> active");
> +	igt_subtest_with_dynamic("dc3co-framedrop-check") {
> +		static const struct dc3co_test_mode dc3co_modes[] =3D {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,=C2=A0=C2=A0=C2=A0 "pr"=C2=A0=C2=A0 },
> +		};
> +
> +		for (int i =3D 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			const char *name =3D dc3co_modes[i].name;
> +			data.op_psr_mode =3D dc3co_modes[i].mode;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 data.debugfs_fd,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 data.op_psr_mode, NULL));
> +
> +				if (data.op_psr_mode =3D=3D PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 intel_display_ver(data.devid) >=3D
> 35,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Platform does not support DC3CO
> with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >=3D
> 35,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Platform does not support DC3CO
> with Panel Replay\n");
> +
> +				test_dc3co_framedrop(&data);
> +			}
> +		}
> +	}
> +
> =C2=A0	igt_describe("This test validates display engine entry to DC5 stat=
e "
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 "while PSR is active");
> =C2=A0	igt_subtest("dc5-psr") {
