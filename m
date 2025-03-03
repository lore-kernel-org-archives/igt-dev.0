Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7793C282CD
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 19:09:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006110E3CE;
	Mon,  3 Mar 2025 19:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrdRnqMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A87410E3CE
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 19:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741028941; x=1772564941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ns8+s73YyKChW8sBy3n9RwsB/q3wgwJpMGiIGxpTbkY=;
 b=KrdRnqMvvVCR8bcnngamMvupgA0dQpMDD+tcLbf24meBXKM38GoduRMT
 RZdAEsrI9iM5j1wi6mgV5wO66EuxsI27oMBxAXZ8gUR9kjlqaD6L0rnlJ
 5OK35j3zfDmsTPwZ5W/nAf/MVc//3eT3FqFxjOSySrIf4mXAW4iE85zdf
 U2TZk0i9J0Hmypas4wpnDR640Vw6kv983wiP3z8in1oSgqiymbBKbbTQ0
 hm5tf5VpfTUDLPUeqrqoKP5OjmOIzZ19v0k6ZSf4BW8fB9Zdbjffe9/s9
 Pc9Bx0LOkfyaXA3KsnPk3WIuLgiKS63n16Pr6Y3fkkJsBsoZlEkLcDXwD Q==;
X-CSE-ConnectionGUID: vfjouvyIQ6CuJsa8rbVAPQ==
X-CSE-MsgGUID: hsJhWJrNRjKRj4L7T/r2Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52558292"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="52558292"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:09:00 -0800
X-CSE-ConnectionGUID: ALisg6GQSGabDAX93eCYng==
X-CSE-MsgGUID: uwM7TBS9SCCGmxHegOMxyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155318336"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:08:57 -0800
Date: Mon, 3 Mar 2025 21:08:54 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_gt_freq: Use spinner for
 throttle test
Message-ID: <Z8X-RlXkv2BcLQIM@black.fi.intel.com>
References: <20250303095712.274097-1-raag.jadav@intel.com>
 <Z8XpTaoQDn8_K2Ao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XpTaoQDn8_K2Ao@intel.com>
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

On Mon, Mar 03, 2025 at 12:39:25PM -0500, Rodrigo Vivi wrote:
> On Mon, Mar 03, 2025 at 03:27:12PM +0530, Raag Jadav wrote:
> > Since throttling requires running workload on GPU, make use of spinner
> > to get consistent results from throttle API test.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  tests/intel/xe_gt_freq.c | 32 +++++++++++++++++++++++++-------
> >  1 file changed, 25 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> > index 1fb6d2b53..b501c62db 100644
> > --- a/tests/intel/xe_gt_freq.c
> > +++ b/tests/intel/xe_gt_freq.c
> > @@ -36,6 +36,12 @@
> >   */
> >  #define SLPC_FREQ_LATENCY_US 100000
> >  
> > +enum spin_test {
> > +	SPIN_THROTTLE,
> > +	SPIN_FIXED_FREQ,
> > +	SPIN_RANGE_FREQ,
> > +};
> > +
> >  static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
> >  {
> >  	int ret = -EAGAIN;
> > @@ -352,7 +358,7 @@ static void test_reset(int fd, int gt_id, int cycles)
> >  	}
> >  }
> >  
> > -static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fixed)
> > +static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, enum spin_test test)
> >  {
> >  	struct drm_xe_sync sync[2] = {
> >  		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > @@ -406,10 +412,17 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fix
> >  	igt_info("Running on GT %d Engine %s:%d\n", eci->gt_id,
> >  		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
> >  
> > -	if (fixed)
> > +	switch (test) {
> > +	case SPIN_THROTTLE:
> > +		test_throttle_basic_api(fd, eci->gt_id);
> > +		break;
> > +	case SPIN_FIXED_FREQ:
> >  		test_freq_fixed(fd, eci->gt_id, false);
> > -	else
> > +		break;
> > +	case SPIN_RANGE_FREQ:
> >  		test_freq_range(fd, eci->gt_id, false);
> > +		break;
> > +	};
> >  
> >  	xe_spin_end(spin);
> >  
> > @@ -454,8 +467,13 @@ igt_main
> >  	}
> >  
> >  	igt_subtest("throttle_basic_api") {
> > -		xe_for_each_gt(fd, gt)
> > -			test_throttle_basic_api(fd, gt);
> > +		xe_for_each_gt(fd, gt) {
> > +			xe_for_each_engine(fd, hwe) {
> > +				if (hwe->gt_id != gt)
> > +					continue;
> > +				test_spin(fd, hwe, SPIN_THROTTLE);
> 
> I honestly doubt that any of these very basic and small batches
> we have in these tests will ever cause the GT to be really throttled.

Agree, but this way we can atleast hope for consistent behaviour from
hardware while we scan through multiple entries.

Raag
