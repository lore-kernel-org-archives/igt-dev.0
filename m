Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053C6FC6167
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 16:52:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA79610ED45;
	Fri, 13 Sep 2024 16:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFYQlMKt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9115E10ED45
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726246332; x=1757782332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P7zCFAVKInb4TprJOf5HWFogFIURkYAWwPBB+AV76GU=;
 b=dFYQlMKt/5IFviYvQGjQ0mcoiFemT/Zmkgj7KB/zIte22NEP/VvTX3FI
 yGmynRd5WcBQilMtLaOISQGeJ4a7et+PClWAr5MJDjGsaWqw8SWVBB7ao
 T1bLKvRFzjGMRlyv/CmbC+nHPbYgS3XmunlQEiIVPgbDVjDt+XEM6tM0h
 pKIve4LVVr9Tr57uyuO0AXf3sdoGZ0cp5EAZ6wW/jnmTPeyZmRDqbmw1K
 aJWotTLrJMxZDvS814f6nIANSY3HXZrdx+hxke2S+Ow7alOxf1yX/Q/Vl
 MVtQFD23WnDRl4SH3d0LrdD7+uwRVaGn8EyR/MKOWI0y152DujV2mJp4I A==;
X-CSE-ConnectionGUID: jcj163F2SsOA4OxOE/x+8g==
X-CSE-MsgGUID: tj8o+v7pSTOMfoTOpxIpOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="36532547"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="36532547"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 09:52:11 -0700
X-CSE-ConnectionGUID: RG4lmziLSNCBEd3hvM331g==
X-CSE-MsgGUID: jEXtOtmMRLS+01p9I1AaOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="68895075"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 09:52:09 -0700
Date: Fri, 13 Sep 2024 18:52:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, vinay.belgaumkar@intel.com,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t] gputop: Print message without clients
Message-ID: <20240913165205.jjcvkbbaw7ghtgjj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 vinay.belgaumkar@intel.com, Tvrtko Ursulin <tursulin@ursulin.net>
References: <20240912141426.4115404-1-lucas.demarchi@intel.com>
 <20240912152459.mobiy2gamphm2amt@kamilkon-DESK.igk.intel.com>
 <sv3j2ncod3winjgli56hhcgctnl7f2tulzimrsd74jumq5cmgo@4via275aohjt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sv3j2ncod3winjgli56hhcgctnl7f2tulzimrsd74jumq5cmgo@4via275aohjt>
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

Hi Lucas,
On 2024-09-12 at 11:06:09 -0500, Lucas De Marchi wrote:
> On Thu, Sep 12, 2024 at 05:24:59PM GMT, Kamil Konieczny wrote:
> > Hi Lucas,
> > On 2024-09-12 at 07:14:26 -0700, Lucas De Marchi wrote:
> > > Devs are often confused why gputop doesn't display anything and think it
> > > doesn't yet support the driver/platform. This is different from
> > > intel_gpu_top that can display a header with engines, because in that
> > > case there is a fixed set of engines and no variance according to the
> > > driver.
> > > 
> > > Print a message to give a hint that nothing is displayed because there's
> > > nothing running.
> > 
> > Could we diplay at least current power consumption and accumulated one?
> 
> but those are not supported in gputop yet, AFAIK. What igt functions
> and/or kernel interfaces are you suggesting?
> 
> Lucas De Marchi
> 

I didn't have time for looking how/what to use,
just used intel_gpu_top -c and see:


Freq MHz req,Freq MHz act,IRQ /s,RC6 %,Power W gpu,Power W pkg,IMC MiB/s rd,IMC MiB/s wr,RCS %,RCS se,RCS wa,BCS %,BCS se,BCS wa,VCS %,VCS se,VCS wa,VECS %,VECS se,VECS wa
0.000000,0.000000,0.000000,99.993090,0.000000,4.020512,1051.870011,24.579949,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.000000,0.000000,0.991862,100.000000,0.000000,0.656479,200.265345,3.654343,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
0.

The one interesting field is 'Power W gpu', I assume most drm/gpu
drivers have it? Next one is Freq MHz act.

Regards,
Kamil

> > 
> > It is only a suggestion, so
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  tools/gputop.c | 14 ++++++++++++--
> > >  1 file changed, 12 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/gputop.c b/tools/gputop.c
> > > index 8842eebbd..43b01f566 100644
> > > --- a/tools/gputop.c
> > > +++ b/tools/gputop.c
> > > @@ -39,6 +39,9 @@ enum utilization_type {
> > > 
> > >  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> > > 
> > > +#define ANSI_HEADER "\033[7m"
> > > +#define ANSI_RESET "\033[0m"
> > > +
> > >  static void n_spaces(const unsigned int n)
> > >  {
> > >  	unsigned int i;
> > > @@ -82,7 +85,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
> > >  	if (lines++ >= con_h)
> > >  		return lines;
> > > 
> > > -	printf("\033[7m");
> > > +	printf(ANSI_HEADER);
> > >  	ret = printf("DRM minor %u", c->drm_minor);
> > >  	n_spaces(con_w - ret);
> > > 
> > > @@ -123,7 +126,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
> > >  		}
> > >  	}
> > > 
> > > -	printf(" %-*s\033[0m\n", con_w - len - 1, "NAME");
> > > +	printf(" %-*s" ANSI_RESET "\n", con_w - len - 1, "NAME");
> > > 
> > >  	return lines;
> > >  }
> > > @@ -447,6 +450,13 @@ int main(int argc, char **argv)
> > >  		update_console_size(&con_w, &con_h);
> > >  		clrscr();
> > > 
> > > +		if (!clients->num_clients) {
> > > +			const char *msg = " (No GPU clients yet. Start workload to see stats)";
> > > +
> > > +			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
> > > +			       (int)(con_w - strlen(msg) - 1), msg);
> > > +		}
> > > +
> > >  		igt_for_each_drm_client(clients, c, i) {
> > >  			assert(c->status != IGT_DRM_CLIENT_PROBE);
> > >  			if (c->status != IGT_DRM_CLIENT_ALIVE)
> > > --
> > > 2.43.0
> > > 
