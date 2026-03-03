Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF696EC0463
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 09:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED8110E748;
	Tue,  3 Mar 2026 09:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rn7m7l99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B02010E748
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 09:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772530219; x=1804066219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ftRJ8xrN3exDBXEz93ky5b7CXa5/ih+AC591PyB2xZg=;
 b=Rn7m7l99IjzM2/S4jVNTTN4DetX1eE/E20+GSy0ecGS9wdqdIld8E/a5
 ks07fTHtdj98J3BDbNd17Poi9Ti3x5zE0l4NQxMqHJa6X2AuJq1zCJTKB
 h4IHRABMKmVCxDSg+sRs8XV0MkUgk9GZwC2SbkAAscsSyEvPOZUXcyef9
 TGIy4jrVRzx/Wm1s/KHlrnLg5U/bCXywpQskdPTXEfT3PPHthc9YbjFh+
 gbZCJesbAzqKXJlqegB8hTQ/aAeghPaYtrLG2Kd+I9qcD7SG0czWLrpwL
 fd2PO1351cXFI2WRuzDQbeDygTe6I2T/2h4sQCJmhHGHFdQGxshf+iL+n A==;
X-CSE-ConnectionGUID: 9y+ZMT9dR2S/P9bgLD3UsA==
X-CSE-MsgGUID: 8rzV5h1ET/20aUsWw0aXkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="85027518"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="85027518"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:30:19 -0800
X-CSE-ConnectionGUID: Ky2106RBRcaOXtEPd+hmmw==
X-CSE-MsgGUID: CfUN/sTvRtGbhhRLNyJtUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="218055586"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 01:30:17 -0800
Date: Tue, 3 Mar 2026 11:30:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>
Cc: "Kishore, Sumit" <sumit.kishore@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: Re: [PATCH i-g-t v1] tests/kms_invalid_mode: add prints when test
 skips
Message-ID: <aaaqJVyTMlLAR61d@intel.com>
References: <20260302112339.214912-1-sumit.kishore@intel.com>
 <PH7PR11MB60530C3E22139A4D5B884141E77EA@PH7PR11MB6053.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR11MB60530C3E22139A4D5B884141E77EA@PH7PR11MB6053.namprd11.prod.outlook.com>
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

On Mon, Mar 02, 2026 at 12:20:31PM +0000, Samala, Pranay wrote:
> Hi Sumit,
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of sumit
> > kishore
> > Sent: Monday, March 2, 2026 4:54 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Kishore, Sumit
> > <sumit.kishore@intel.com>
> > Subject: [PATCH i-g-t v1] tests/kms_invalid_mode: add prints when test skips
> Title should start with a capital letter "Add" not "add"
> 
> > 
> > add debug print to display the reason for test skip
> > 
> > Signed-off-by: sumit kishore <sumit.kishore@intel.com>
> > ---
> >  tests/kms_invalid_mode.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> > 5edffb649..8ba488812 100644
> > --- a/tests/kms_invalid_mode.c
> > +++ b/tests/kms_invalid_mode.c
> > @@ -266,7 +266,9 @@ test_output(data_t *data)
> >  	 * sure everything is really getting rejected?
> >  	 */
> >  	mode = *igt_output_get_mode(output);
> > -	igt_require(data->adjust_mode(data, &mode));
> > +	igt_require_f(data->adjust_mode(data, &mode),
> > +		"Skipping as %s has scaling properties\n",
> > igt_output_name(output));
> This skip message isn't quite accurate. Only clock-too-high subtest checks for scaling property. All other adjust_mode functions simply return true.

That check is pretty much outdated anyway. The kernel will reject
the mode if the vrefresh doesn't match any of the connector's
fixed modes. So we should probably just remove the check.

> 
> Imho, It would be better to add the debug message directly in that function.
> 
> Regards,
> Pranay
> > +
> > 
> >  	igt_create_fb(data->drm_fd,
> >  		      max_t(uint16_t, mode.hdisplay, 64),
> > --
> > 2.43.0

-- 
Ville Syrjälä
Intel
