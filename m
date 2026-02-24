Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF29E9B26C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 14:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9735310E58C;
	Tue, 24 Feb 2026 14:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QpwdzPh7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F1E10E58C
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771942868; x=1803478868;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xHS8gCQctQBHiqQ5fvyyviCZEfiMfqGHvDjZjZwi6aY=;
 b=QpwdzPh7rExCNZgtZN0luualTxKVw+fJCRDRG92h5LbN8VvvvVhGJhDt
 9D6A3qEWlMR/aufPxgJ7p0evyl8WiRuSFBMM6kG7bcNhWDqBpazE7dvXM
 3tdPNokSmSzmdqvuiG9QbObFX+IOYqTKzhNaZWlPOCmHlq3hj+WtLrHIg
 oh5phpz5EmCmUaLW7Y4oUabdYgvQesi6JrxdwI+A8/X6+fAJmim538joE
 acquI7u94lz1APQwg/HFfehlA1Rh3LfRR/PLgmtC652YE9zaVVcFh049V
 xN1eEcEQUuDXewmMjqMYLbdFQTb1Sd7Aa1wGCY6MA6R+AmC0WPsxTuYrQ Q==;
X-CSE-ConnectionGUID: PTRhc5hDTsW7qwj3So3p6Q==
X-CSE-MsgGUID: 8ZxO5ZNrR2GETf0GH1yd6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73135237"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73135237"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:21:08 -0800
X-CSE-ConnectionGUID: oAtEhtwSSSmrt/ycHQ1FlQ==
X-CSE-MsgGUID: AlUF7Hg0SGqIFFtdsWOLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213720440"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:21:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t 5/6] tests/kms_flip: initialize global devid
In-Reply-To: <20260224133242.1678232-6-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260224133242.1678232-1-michal.grzelak@intel.com>
 <20260224133242.1678232-6-michal.grzelak@intel.com>
Date: Tue, 24 Feb 2026 16:21:02 +0200
Message-ID: <2bd21186c4c45585e4e5589219d5bf3d2f8b5ea3@intel.com>
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

On Tue, 24 Feb 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Global variable devid is never initialize. Init it at start of the test.

It's never *used* so should be removed instead?

The other ones should be made static, and making them static reveals a
bunch of other unused variables:

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 49a5f4ed185f..e77a836be4d6 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -269,19 +269,15 @@
=20
 static bool all_crtcs =3D false;
=20
-drmModeRes *resources;
-int drm_fd;
+static drmModeRes *resources;
+static int drm_fd;
 static struct buf_ops *bops;
-uint32_t devid;
-int test_time =3D 3;
 static bool monotonic_timestamp;
 static pthread_t vblank_wait_thread;
 static int max_dotclock;
=20
 static drmModeConnector *last_connector;
=20
-uint32_t *fb_ptr;
-
 static igt_display_t display;
=20
 struct type_name {




>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tests/kms_flip.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ae38096aa..5b3c31ff5 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -2142,6 +2142,8 @@ int igt_main_args("cep", NULL, help_str, opt_handle=
r, NULL)
>  	igt_fixture() {
>  		drm_fd =3D drm_open_driver_master(DRIVER_ANY);
>=20=20
> +		devid =3D intel_get_drm_devid(drm_fd);
> +
>  		igt_display_require(&display, drm_fd);
>=20=20
>  		kmstest_set_vt_graphics_mode();

--=20
Jani Nikula, Intel
