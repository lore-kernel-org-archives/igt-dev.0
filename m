Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05553606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mCTDU45F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11F810F4AB;
	Tue, 24 Nov 2026 11:04:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9229D10F4B4
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 11:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795518177; x=1827054177;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=N6eqY6nLPbr4bPiRTSesGHf+GfIblzcW8J9MH+atlFo=;
 b=mCTDU45Fs+GbmaUotNAjvcuexEf8GMKJAoksQMJBm/A85s+YsJ1JcxqN
 9RCehTIUmvreTIpTgFwlMztGC8AJzL1IyxsacUqoqPeMrUK8fOngcqlnE
 Ju5Ykak8ZuvMnJJZJV02CgEZnQekrB67mWTjzMOIpgw8su3FJnACFzRr5
 1pYDO5HmQiwyQWamGn97qCYPeFFCdrEraiUrle1ZnIj0OJ2Edqa7qsv+L
 Ot9CF0azQ5G5S9Z87x/27kBAgsB8e3Wj4Ot1eLXMsqzPJojvwycU9PnFn
 2IdUenkU1w2UgFEmGLIPEchF33L4aaYWyanStix/Aqidcw24HFTNi8DG/ w==;
X-CSE-ConnectionGUID: 2r5jzhI8Qj6UWsSx4XIJrg==
X-CSE-MsgGUID: B++uKwYDSkixfFbNeGo6Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4246639"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4246639"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:02:39 -0800
X-CSE-ConnectionGUID: jVcpQmxQSXqDhhsz6tthEw==
X-CSE-MsgGUID: ZfeS9wlwRYmL0H9cUAvTfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11524131"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 03:02:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, Jeevan B <jeevan.b@intel.com>, =?utf-8?Q?Micha?=
 =?utf-8?Q?=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first
 and last CRTC
In-Reply-To: <20261124062725.952438-1-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261124062725.952438-1-jeevan.b@intel.com>
Date: Tue, 24 Nov 2026 13:02:33 +0200
Message-ID: <6676344cae734db2fddb0783bdeb9712a4d0f963@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Running on every CRTC makes the test hit the timeout on simulation.
> Restrict it to the first and last usable CRTC when running in
> simulation, which keeps coverage while avoiding the timeout.
>
> Move the per-pipe validity check and the per-pipe subtest body into
> pipe_output_valid() and run_pipe() so both the regular and the
> simulation paths can share them.

I think you're overcomplicating things for something that should be
simplified.

I don't know what to say. I don't think my review comments are being
understood.

Below is what I meant, maybe C is the lingua franca. Use the first and
last pipes on simulation, all otherwise. And keep the simulation
conditional stuff mostly out of the main test loops, because it
complicates everything.

Also Cc: Micha=C5=82, this is what I meant in my comments to you too. There=
's
no need for those complicated arrays with bools.


BR,
Jani.


PS. It's untested.


diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17e24..a1111245fb0d 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -284,6 +284,27 @@ static void test_cursor(data_t *data, int size, unsign=
ed int flags)
        test_cursor_spots(data, size, flags);
 }
=20
+static uint32_t get_crtc_index_mask(igt_display_t *display)
+{
+       igt_crtc_t *crtc, *first_pipe_crtc =3D NULL, *last_pipe_crtc =3D NU=
LL;
+       __maybe_unused igt_output_t *output;
+       uint32_t crtc_index_mask =3D 0;
+
+       for_each_crtc_with_single_output(display, crtc, output) {
+               if (!first_pipe_crtc || crtc->hardware_pipe < first_pipe_cr=
tc->hardware_pipe)
+                       first_pipe_crtc =3D crtc;
+               if (!last_pipe_crtc || crtc->hardware_pipe > last_pipe_crtc=
->hardware_pipe)
+                       last_pipe_crtc =3D crtc;
+               crtc_index_mask |=3D 1 << crtc->crtc_index;
+       }
+
+       if (igt_run_in_simulation() && first_pipe_crtc && last_pipe_crtc)
+               crtc_index_mask =3D 1 << first_pipe_crtc->crtc_index |
+                       1 << last_pipe_crtc->crtc_index;
+
+       return crtc_index_mask;
+}
+
 int igt_main()
 {
        static const int cursor_sizes[] =3D { 64, 128, 256 };
@@ -291,6 +312,7 @@ int igt_main()
        igt_crtc_t *crtc;
        igt_output_t *output;
        igt_display_t *display;
+       uint32_t crtc_index_mask =3D 0;
        int i, j;
        struct {
                const char *name;
@@ -322,6 +344,8 @@ int igt_main()
                igt_assert(ret =3D=3D 0 || errno =3D=3D EINVAL);
=20
                kmstest_set_vt_graphics_mode();
+
+               crtc_index_mask =3D get_crtc_index_mask(&data.display);
        }
=20
        for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
@@ -329,6 +353,9 @@ int igt_main()
                igt_subtest_with_dynamic_f("%s", tests[i].name) {
                        for_each_crtc_with_single_output(&data.display, crt=
c,
                                                         output) {
+                               if (!(crtc_index_mask & (1 << crtc->crtc_in=
dex)))
+                                       continue;
+
                                if ((tests[i].flags & TEST_OVERLAY) &&
                                    !igt_crtc_get_plane_type(crtc,
                                                             DRM_PLANE_TYPE=
_OVERLAY))


--=20
Jani Nikula, Intel
