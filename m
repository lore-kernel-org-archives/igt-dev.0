Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2049.outbound.protection.outlook.com [40.107.102.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF3B6E842
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 12:55:20 +0000 (UTC)
Date: Thu, 26 Aug 2021 08:55:16 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210826125516.dbxzwxmgx5amokkr@outlook.office365.com>
References: <20210728171616.2242447-1-markyacoub@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210728171616.2242447-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_flip: Discard any stale event at
 each retry
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org, robdclark@chromium.org, petri.latvala@intel.com, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshminarayana,

I noticed that the CI pipeline for GitLab failed in this patch. I look
at the log, and I think this failed due to CI instabilities. Could you
trigger the CI again for this patch?

Thanks
Siqueira

On 07/28, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
>=20
> [Why]
> On slower devices, non blocking do_page_flip followed by wait_for_events =
does not finish fast enough to send an event to be consumed by wait_for_eve=
nts.
> Instead, wait_for_events ends up finding an unconsumed event from a
> previous do_page_flip (i.e. a skipped preceding subtest) and signals
> that the userspace is ready to do another do_page_flip while the first
> one hasn't finished yet, resulting in an EBUSY.
>=20
> [How]
> At the beginning of every test running on crtc set, check for any stale
> events and consume them so the kernel has no pending events.
>=20
> Fixes: flip-vs-suspend and flip-vs-suspend-interruptible.
> Tested on ChromeOS Volteer(i915-TGL) and Trogdor(msm)
>=20
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Change-Id: I254a84a202140c332312aba1d9edf15ea78b7a61
> ---
>  tests/kms_flip.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index f2fce8d2..0a2041c5 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1261,6 +1261,26 @@ static bool needs_retry_after_link_reset(struct ud=
ev_monitor *mon)
>  	return hotplug_detected;
>  }
> =20
> +static void discard_any_stale_events() {
> +	fd_set fds;
> +	FD_ZERO(&fds);
> +	FD_SET(drm_fd, &fds);
> +	struct timeval timeout =3D { .tv_sec =3D 3, .tv_usec =3D 0 };
> +	int ret =3D select(drm_fd + 1, &fds, NULL, NULL, &timeout);
> +
> +	if (ret > 0) {
> +		drmEventContext evctx;
> +		memset(&evctx, 0, sizeof evctx);
> +		evctx.version =3D 2;
> +		igt_info("Stale Event found - Discarding now\n");
> +		drmHandleEvent(drm_fd, &evctx);
> +	}
> +	else {
> +		igt_debug("No stale Event found\n");
> +	}
> +}
> +
> +
>  static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs=
,
>  				   int crtc_count, int duration_ms)
>  {
> @@ -1311,6 +1331,9 @@ static void __run_test_on_crtc_set(struct test_outp=
ut *o, int *crtc_idxs,
>  		kmstest_dump_mode(&o->kmode[i]);
> =20
>  retry:
> +	// Discard any pending event that hasn't been consumed from a previous =
retry or subtest.
> +	discard_any_stale_events();
> +
>  	memset(&o->vblank_state, 0, sizeof(o->vblank_state));
>  	memset(&o->flip_state, 0, sizeof(o->flip_state));
>  	o->flip_state.name =3D "flip";
> --=20
> 2.32.0.432.gabb21c7263-goog
>=20
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=3D04%7C01%7CRodrig=
o.Siqueira%40amd.com%7C5bc54d07bd7b47a66e0d08d951eb6c94%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637630893864077242%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DnqwaQ2ruIdx27uUE3kXgGGf5LcJaO7w0GmfSyoHOHP8%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech
