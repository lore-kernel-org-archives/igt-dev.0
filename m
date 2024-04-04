Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4655CD1292
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 13:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E3C113490;
	Thu,  4 Apr 2024 13:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Glsdxs7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1DB113490
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 13:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712236878; x=1743772878;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hfpaI5O12f1vVv9pJuCdRXZfRx8XbxP6H1w68HFwu8c=;
 b=Glsdxs7kOQozqaKD6YiIDROeBUFh/+rrcbtqzA5vJO1hKHk+8k9xLTuN
 XftwgSN+POPXOrGk5HgzYEDhkKKBPZi6uIFGORs3gQXJwL3OhSDx6Yzb7
 UdYzGESytqnngVJP//S1sCda5oI6nLMw6feWhqbCWL1t+Bj2Orj/pL0Ky
 wASCCiX4CsEHhf9a8HaetXOJm+lUrRp0ghfBfhl8Tj9DOPOgOlM47UdOg
 BpQe89ts8zZksJ5AemCNwaSwiveU7tcY8O1DV0bfxjAzdiBZzmhoeTaeA
 C9vJg6Pls0Fm991///lK5z9dz342kNjla7qvVFdl+N3636XfyZP6sU7gU A==;
X-CSE-ConnectionGUID: CxYT8GaaSRe1Xl8dciL9HA==
X-CSE-MsgGUID: Y3VhRLxySvyRJYo4fFOzfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7632037"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="7632037"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 03:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="827790379"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="827790379"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 03:56:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 13:56:02 +0300
Date: Thu, 4 Apr 2024 13:56:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH i-g-t 4/5] tests/kms_cursor_crc: Test the SIZE_HINTS
 property
Message-ID: <Zg6HQgfK4JZtH2tB@intel.com>
References: <20240315191505.27620-1-ville.syrjala@linux.intel.com>
 <20240315191505.27620-5-ville.syrjala@linux.intel.com>
 <20240404115105.0d2a9694.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404115105.0d2a9694.pekka.paalanen@collabora.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 04, 2024 at 11:51:05AM +0300, Pekka Paalanen wrote:
> On Fri, 15 Mar 2024 21:15:04 +0200
> Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> 
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Make sure the driver accepts all the sizes declared in the
> > plane's SIZE_HINTS property.
> > 
> > TODO: Actually test that each reported size works fully?
> 
> What does this mean? What does cursor_size_supported() do?

It does a TEST_ONLY commit using data->fb and the specified size.
So just confirms that the kernel accepts it, not that it actually
looks correct on screen.

> 
> I don't know that, so it looks like you just create an FB and destroy
> it, never putting it on the plane where the SIZE_HINTS were found.
> 
> >       Would need a bunch of restructuring of the test,
> >       and for the moment i915 is the only driver that
> >       supports SIZE_HINTS and it's already >100% covered
> >       by the existing tests. So I'll leave this for the
> >       next guy whose driver has different needs...
> 
> How would they know to fix this test? They just see the test pass and
> are happy, right?

I would expect them to actually care about testing their driver
properly. But perhaps my expectations are a bit high.

> 
> This is the only question I have here, everything else is
> 
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Ta.

> 
> 
> Thanks,
> pq
> 
> 
> > 
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Jonas Ådahl <jadahl@redhat.com>
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
> > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  tests/kms_cursor_crc.c | 63 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 63 insertions(+)
> > 
> > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> > index 38b354972afd..6543e09d3ebb 100644
> > --- a/tests/kms_cursor_crc.c
> > +++ b/tests/kms_cursor_crc.c
> > @@ -55,6 +55,10 @@
> >   * Description: Check random placement of a cursor with suspend.
> >   * Functionality: cursor, suspend
> >   *
> > + * SUBTEST: cursor-size-hints
> > + * Description: Check that sizes declared in SIZE_HINTS are accepted.
> > + * Functionality: cursor
> > + *
> >   * SUBTEST: cursor-%s
> >   * Description: %arg[1]
> >   *
> > @@ -817,6 +821,46 @@ static bool execution_constraint(enum pipe pipe)
> >  	return false;
> >  }
> >  
> > +static void test_size_hints(data_t *data)
> > +{
> > +	const struct drm_plane_size_hint *hints;
> > +	drmModePropertyBlobPtr blob;
> > +	uint64_t blob_id;
> > +	int count;
> > +
> > +	igt_require(igt_plane_has_prop(data->cursor, IGT_PLANE_SIZE_HINTS));
> > +
> > +	blob_id = igt_plane_get_prop(data->cursor, IGT_PLANE_SIZE_HINTS);
> > +	/*
> > +	 * blob_id==0 is reserved for potential future use, but the
> > +	 * meaning has not yet been defined for fail outright if we see it.
> > +	 */
> > +	igt_assert(blob_id);
> > +
> > +	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
> > +	igt_assert(blob);
> > +
> > +	hints = blob->data;
> > +	count = blob->length / sizeof(hints[0]);
> > +	igt_assert_lt(0, count);
> > +
> > +	for (int i = 0; i < count; i++) {
> > +		int w = hints[i].width;
> > +		int h = hints[i].height;
> > +
> > +		igt_create_fb(data->drm_fd, w, h,
> > +			      DRM_FORMAT_ARGB8888,
> > +			      DRM_FORMAT_MOD_LINEAR,
> > +			      &data->fb);
> > +
> > +		igt_assert(cursor_size_supported(data, w, h));
> > +
> > +		igt_remove_fb(data->drm_fd, &data->fb);
> > +	}
> > +
> > +	drmModeFreePropertyBlob(blob);
> > +}
> > +
> >  static void run_size_tests(data_t *data, int w, int h)
> >  {
> >  	enum pipe pipe;
> > @@ -1011,6 +1055,25 @@ static void run_tests_on_pipe(data_t *data)
> >  	igt_fixture
> >  		igt_remove_fb(data->drm_fd, &data->fb);
> >  
> > +	igt_describe("Check that sizes declared in SIZE_HINTS are accepted.");
> > +	igt_subtest_with_dynamic("cursor-size-hints") {
> > +		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
> > +			if (execution_constraint(pipe))
> > +				continue;
> > +
> > +			data->pipe = pipe;
> > +
> > +			if (!valid_pipe_output_combo(data))
> > +				continue;
> > +
> > +			igt_dynamic_f("pipe-%s-%s",
> > +				      kmstest_pipe_name(pipe),
> > +				      data->output->name)
> > +				run_test(data, test_size_hints,
> > +					 data->cursor_max_w, data->cursor_max_h);
> > +		}
> > +	}
> > +
> >  	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
> >  		int w = cursor_size;
> >  		int h = cursor_size;
> 



-- 
Ville Syrjälä
Intel
