Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BDC606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UzPd/DOn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9712510F783;
	Tue, 17 Nov 2026 14:25:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF66B10E5F4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 14:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794925458; x=1826461458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tphlfLk7J8H8/JsDn8EUrNgyXqldQbGb/HAt1rCSVGI=;
 b=UzPd/DOn3NVZwdxCxPALg9UGyrbowv3Pr3KvExt2FfQf4KR7ESiM9Z5U
 fZG9whLwpgwaFVCHdEsOGP+lIaCGQZ2QgbeeoC0fhk2bV2wpCt+6xVuj+
 lH3zclL75b6RTRDMsXOBkyAP96TquLIQQQ0zLq/afpiDUrZzjG9nJvFM6
 BUgPguYaTK1u3j6E64PNh9kTX49WNSTDfw+dQWI1LZfbuQQktKaITss3Z
 GaRFyDe2iodCdPzvOJCPsxOcdayE4mI1uJoc4CdH64vOM/bobyX2d33WE
 S0SkEFOo3s3d4TBQ+UAiwtIXU6XuZIJqHUm4J2rCf2uHvVkdOG7LoXX0G g==;
X-CSE-ConnectionGUID: bnkg8qQcQS6Ieg5U/2um+g==
X-CSE-MsgGUID: SQg4QQo9RJunrJ3+AGHCqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3579048"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3579048"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:24:18 -0800
X-CSE-ConnectionGUID: b/761+ccS+6z3JONZ5SPnw==
X-CSE-MsgGUID: 4S5oIPl4Qhu4y09DW3MhSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9698542"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 06:24:16 -0800
Date: Tue, 17 Nov 2026 15:24:10 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t v9 2/9] tests/kms_async_flips: set mask for
 available hardware pipes
Message-ID: <qgsni4nlmcgcrvocwyo2f6r3ffkfrhpi5q4pgkmgs5eby5q4sf@y3kghxqj6v35>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
 <20261106180849.156578-3-michal.grzelak@linux.intel.com>
 <6d3f51f9-b26f-4b05-8bf0-75ba10109f14@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d3f51f9-b26f-4b05-8bf0-75ba10109f14@gmail.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 09:49:39PM GMT, Juha-Pekka Heikkilä wrote:
> On 06/11/2026 20.08, Michał Grzelak wrote:
> > Mapping from hardware pipe into CRTC is needed when testing suspend
> > since we need to run test on at least first and last pipe. Currently
> > there is a direct mapping between CRTC and hardware pipe but this will
> > break after introduction of pipe reordering.
> > 
> > Compute array of all available hardware pipes. While doing it also
> > compute first and last pipe. Recompute the array on each test since
> > testing first and last pipe will only be needed in suspend-resume
> > scenario.
> > 
> > Skip testing CRTCs that map to unavailable pipes. Currently this is a
> > no-op but this will change after limiting suspend tests to first and
> > last pipe.
> > 
> > v7->v8
> > - add patch
> > 
> > Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> > ---
> >   tests/kms_async_flips.c | 30 ++++++++++++++++++++++++++++++
> >   1 file changed, 30 insertions(+)
> > 
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > index 8884efd8ba..a548c73cd9 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -140,6 +140,7 @@ typedef struct {
> >   	bool flip_pending;
> >   	igt_crtc_t *crtc;
> >   	bool alternate_sync_async;
> > +	bool available_pipes[IGT_MAX_PIPES];
> >   	bool suspend_resume;
> >   	bool hang;
> >   	bool dpms;
> > @@ -288,10 +289,36 @@ static void require_overlay_flip_support(data_t *data)
> >   		      "Async flip for overlay planes not supported\n");
> >   }
> > +static bool set_available_hw_pipes(data_t *data)
> > +{
> > +	enum hardware_pipe first_pipe = IGT_MAX_PIPES;
> > +	enum hardware_pipe last_pipe = PIPE_NONE;
> > +	enum hardware_pipe hw_pipe;
> > +	igt_crtc_t *crtc;
> > +
> 
> I think you're going to need to clear available_pipes here because it's
> otherwise left stale between tests and later added suspend-resume part will
> mark all pipes.

Right, need to include it in next version.

BR,
Michał

> 
> > +	for_each_crtc(&data->display, crtc) {
> > +		hw_pipe = crtc->hardware_pipe;
> > +		data->available_pipes[hw_pipe] = true;
> > +
> > +		if (last_pipe < hw_pipe)
> > +			last_pipe = hw_pipe;
> > +
> > +		if (first_pipe > hw_pipe)
> > +			first_pipe = hw_pipe;
> > +	}
> > +
> > +	if (first_pipe == IGT_MAX_PIPES || last_pipe == PIPE_NONE)
> > +	        return false;
> > +
> > +	return true;
> > +}
> > +
> >   static void test_init(data_t *data)
> >   {
> >   	drmModeModeInfo *mode;
> > +	set_available_hw_pipes(data);
> > +
> >   	igt_display_reset(&data->display);
> >   	igt_display_commit(&data->display);
> > @@ -892,6 +919,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
> >   			test_init(data);
> > +			if (!data->available_pipes[crtc->hardware_pipe])
> > +				continue;
> > +
> >   			if (data->linear_modifier)
> >   				data->modifier = DRM_FORMAT_MOD_LINEAR;
> >   			else
> 
