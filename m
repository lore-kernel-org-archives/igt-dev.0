Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB1C88E45
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 07:17:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C44210E376;
	Fri, 11 Sep 2026 07:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHHT9N4a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E1110F4E6
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 07:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789110911; x=1820646911;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=hwZ6AA9YAlbqUp9+fPnoFwfrjpvF664rfiDV0XIBzfQ=;
 b=UHHT9N4aQPfMB797B6jFjmenzMdBM8htIBAY/gOXI8Gv1tvOwa48EeP7
 bDw23LoXGJHIgs158h3e1byjLYWiKDUG3zJBwl1WpTcIZAvkO5nefsGW7
 ozge/+8L4ms5ScZw8fi70owqU8tbpgXzTt/T7it3UhPuNiXuxOFtLoA3q
 BRUt/0D1c0JZ1CEXGyx53mBklNk+qfBjzh75r7qwNnFWmejrGILD+mvSm
 ECcqUSptRDB4GupwdESs7r9WSnGrywSvFbebZpy4jewBdedBE/Se0jLxr
 OouZNaGDjO1gKMNMbBsgire2oltDCeq7sRGlg0oIcn/DaI19ZGQ65Pbo5 Q==;
X-CSE-ConnectionGUID: ZL8gsOjzS/CKlHIxF3bOgw==
X-CSE-MsgGUID: 3IwukHwlTCOEK75LJQjPKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="112343425"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="112343425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 00:15:10 -0700
X-CSE-ConnectionGUID: VwPd+AWDQnye0F1i/vED8A==
X-CSE-MsgGUID: /Rdp9Q9nTcK3GWDYQHoddA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="268162656"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.127])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 00:15:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v5 04/17] tests/kms_async_flips: limit S/R to
 first and last CRTC
In-Reply-To: <20260910201413.2730574-5-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260910201413.2730574-1-michal.grzelak@intel.com>
 <20260910201413.2730574-5-michal.grzelak@intel.com>
Date: Fri, 11 Sep 2026 10:15:05 +0300
Message-ID: <48cc3a54e0de1ba84573cccc92d261167d859f3f@intel.com>
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

On Thu, 10 Sep 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> In order to increase tests performance limit suspend-resume's execution
> to only first and last CRTC.
>
> v3->v4
> - use crtc instead of display->crtcs (Mohammed)
> - use proper logic operator (Mohammed)
>
> v2->v3
> - add missing S-O-B
>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tests/kms_async_flips.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 8884efd8ba..f373dfcd95 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -873,6 +873,7 @@ static void run_test(data_t *data, void (*test)(data_=
t *))
>  {
>  	igt_crtc_t *crtc;
>  	igt_display_t *display =3D &data->display;
> +	int idx;
>=20=20
>  	if (data->atomic_path)
>  		require_atomic_async_cap(data);
> @@ -885,6 +886,10 @@ static void run_test(data_t *data, void (*test)(data=
_t *))
>  			data->crtc =3D crtc;
>  			igt_display_reset(display);
>=20=20
> +			idx =3D crtc->crtc_index;
> +			if (data->suspend_resume && idx !=3D 0 && idx !=3D display->n_crtcs -=
 1)

This probably doesn't do what you think it does. Or, more precisely, it
only does it by coincidence.

For Intel, the loop's going to be in pipe order, not CRTC index
order. Any of the pipes could have the first and the last CRTC index. As
the only reordering currently happening is ABCD -> ACBD, you'll have
first and last being the same thing.

In the future, this could and likely will change. This will still only
test the first and last *CRTC*, but that will have no bearing on which
pipes are being tested.


BR,
Jani.

> +				continue;
> +
>  			igt_output_set_crtc(data->output,
>  					    crtc);
>  			if (!intel_pipe_output_combo_valid(display))

--=20
Jani Nikula, Intel
