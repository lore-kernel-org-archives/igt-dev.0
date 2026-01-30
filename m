Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCC2E6BF03
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 11:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBDA10E179;
	Fri, 30 Jan 2026 11:32:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AFA0NAhU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D216D10E179
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769772728; x=1801308728;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lrn1bklYAmdNHa08ZSgbwKWStx0DjPEU4np+hNXO06M=;
 b=AFA0NAhUzSZAHdJA5MiaeFJmZal+w2aVgWOjrOSw6DPQgQ0c+kczJTY5
 spCawJI5rMf2mWZzzv9FNjTqpevZIVZxF7kX6XCaTsGgvDF9kcZbk8+dl
 wXCQNKLprfNnvbtoaot/mU6vJCDDqWoR0c3GMRPLL3kzAZbAqtLBtqKCD
 Mxtc8F3+5UXtsLev5bT0+OvPqLBOtl/KHncf5RGL9QUYXYTtMnpM4wuFw
 S6cLgkarkNTOAjJgOCbc34VW80DYLPlwUc8kpBA2TLV9qU8gK5/W+Vj30
 GaAlPfjzipYTKk5d1aSWbWpNFwBcLBCV0RBTEvfoOuYoyCmwKRO0oq+P1 A==;
X-CSE-ConnectionGUID: lzvGG3ywQ5yu8yd4/+Qd7A==
X-CSE-MsgGUID: miOLl23zQjyuLBWLkg/afw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71059318"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71059318"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 03:32:08 -0800
X-CSE-ConnectionGUID: LijuHpsKSL+XzzSn+G+A9g==
X-CSE-MsgGUID: oDBxX1sITP2A17P2nVgajA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="208834379"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 03:32:06 -0800
Date: Fri, 30 Jan 2026 12:32:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "B S, Karthik" <karthik.b.s@intel.com>,
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v9 03/11] tools/intel_hdcp: Function to get valid
 HDCP output
Message-ID: <20260130113204.p43ajxmbbby7zwzt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "B S, Karthik" <karthik.b.s@intel.com>,
 "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Konieczny, Kamil" <kamil.konieczny@intel.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
 <20260127094257.572736-4-santhosh.reddy.guddati@intel.com>
 <DM3PPF208195D8D8903EEE28A745279003CE390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D8903EEE28A745279003CE390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
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

Hi Kandpal,,
On 2026-01-27 at 11:01:40 +0000, Kandpal, Suraj wrote:
> > Subject: [PATCH i-g-t v9 03/11] tools/intel_hdcp: Function to get valid HDCP
> > output
> > 
> > Add a function to get valid HDCP output for a given connector
> > 
> > Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> > ---
> >  tools/intel_hdcp.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index 6ca067b41..2b38c8cf2
> > 100644
> > --- a/tools/intel_hdcp.c
> > +++ b/tools/intel_hdcp.c
> > @@ -31,6 +31,32 @@ typedef struct data {
> >  	enum hdcp_type hdcp_type;
> >  } data_t;
> > 
> > +static igt_output_t *get_hdcp_output(data_t *data, uint32_t
> > +connector_id, bool *is_valid) {
> > +	drmModeConnector *connector =
> > drmModeGetConnectorCurrent(data->fd, connector_id);
> > +	igt_output_t *output;
> > +
> > +	*is_valid = false;
> > +
> 
> Extra line not required 
> 
> Other than that LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 

Thank you all, I fixed this and pushed.

Regards,
Kamil 

> > +	if (!connector)
> > +		return NULL;
> > +
> > +	output = igt_output_from_connector(&data->display, connector);
> > +	if (!output) {
> > +		drmModeFreeConnector(connector);
> > +		return NULL;
> > +	}
> > +
> > +	if (connector->connection != DRM_MODE_CONNECTED || connector-
> > >encoder_id == 0) {
> > +		drmModeFreeConnector(connector);
> > +		return NULL;
> > +	}
> > +
> > +	drmModeFreeConnector(connector);
> > +	*is_valid = true;
> > +	return output;
> > +}
> > +
> >  static const char *get_hdcp_version(int fd, char *connector_name)  {
> >  	char buf[MAX_HDCP_BUF_LEN];
> > --
> > 2.34.1
> 
