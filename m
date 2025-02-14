Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF2AC02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 14:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29B810E14C;
	Fri, 14 Feb 2025 14:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVHuqH7u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570A010E14C
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739544182; x=1771080182;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7UmVNpr2IceXIAtHCAqdtDYeVMllAi48UE7QiZTeC0w=;
 b=gVHuqH7u6H4kMDkJ5DdnAMWx6lHR9m6CoBkRnRvDiv1H+vN8FzQDieW5
 1yfvnyD8gvtRAoFEONh37sTmP2LjdPxAZBuCD8v2K/u8KzD5KnPWvZu82
 +ONXGEjGyLLq7df8lCwP+sRPDETCX6rtTYknV63RfWgUH7MsSgGH8dSVc
 iNzuIEWk0E614HUq8ppSOnnWcby51ZSYbNbmsExygyBlExN0nik55eBSf
 OfUrOuVJgeBGZwQItYcXUNN+Z+TK0kKOa8g0BbbeRBOcESn60A4Yaqza+
 IQ6J6kZs/kxyd4iBPkvcVefu27iVjhjzhwTqked0ZJsHXVgqYDkuFRLW3 w==;
X-CSE-ConnectionGUID: rL1kBsiZQBanhGTWqIw3tg==
X-CSE-MsgGUID: BIODILk/R+y0e+QocdUcrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40328978"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40328978"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 06:43:02 -0800
X-CSE-ConnectionGUID: Sm0P1FDqS56fyJNB6eRsvA==
X-CSE-MsgGUID: fTKTgLHeRL6KZK4Avj9wkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="118580463"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 06:42:59 -0800
Date: Fri, 14 Feb 2025 15:42:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
Message-ID: <20250214144243.ri3sdxrc245licz4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
 <20241206171858.wtozqz4n2ntslj43@kamilkon-desk.igk.intel.com>
 <SN6PR11MB2704C4588767DCA7E173E21CDB032@SN6PR11MB2704.namprd11.prod.outlook.com>
 <ff8cdb31-4785-414d-9b1f-3881b5b8de9e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff8cdb31-4785-414d-9b1f-3881b5b8de9e@intel.com>
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

Hi Reddy,
On 2025-02-11 at 18:57:57 +0530, Reddy Guddati, Santhosh wrote:
> 
> 
> On 24-12-2024 14:01, Reddy Guddati, Santhosh wrote:
> > Hi Kamil,
> > 
> >  > Add a new HDCP tool for self-testing and easy deployment
> >  > to client machines. This tool helps diagnose issues,
> >  > determining whether the problem lies in the driver or user space.
> >  >
> >  > The current changes include tool skeleton and get hdcp info
> >  > on the connected outputs.
> >  >
> >  > Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> >  > ---
> >  >  tools/intel_hdcp.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
> >  >  tools/meson.build  |   1 +
> >  >  2 files changed, 204 insertions(+)
> >  >  create mode 100644 tools/intel_hdcp.c
[...]

> >  > +
> >  > +static void hdcp_init(data_t *data)
> >  > +{
> >  > +     data->fd = drm_open_driver_master(DRIVER_ANY);
> > 
> > Imho you should do an open yourself.

One more thing, do not load any display driver in a tool.
We do that in tests when using drm_open_driver*() functions
but tool should expect driver is already loaded.

> > 
> >  > +     if (data->fd < 0) {
> >  > +             fprintf(stderr, "Failed to open DRM driver\n");
> >  > +             exit(EXIT_FAILURE);
> >  > +     }
> >  > +     igt_display_require(&data->display, data->fd);
> > 
> > You are not in test, you cannot 'require' a display in a tool,
> > imho you should inform user that no displays were found and
> > just exit, no igt SKIPs.
> > 
> We need this to use the igt defintions here to stay consistent with the
> other tools in the igt_gpu_tools repository, We are using the igt_*
> functions in the existing tools like
> Igt_dp_compliance, igt_reg etc.
[...]

imho you should use here __igt_has_display() function, and this
function should strive to _not_ use any of igt_assert nor igt_require nor
igt_info nor igt_warn, should be safe to be called outside of igt tests,
for example safe for tool useage here.

In a tool you should _not_ call SKIP, rather tell user that you
didn't find any display, just use printf(....)

I am adding Katarzyna and Zbigniew and few igt maintainers to Cc
as we are thinking about lib/* useage in tools/ and runner/

Please also add a man page for a new tool, for example see 
man/intel_reg.rst

Regards,
Kamil

