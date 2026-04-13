Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE6EBFD21
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 09:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83D910E3A1;
	Mon, 13 Apr 2026 09:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3Bt/emt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539A110E3A1
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 09:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776072600; x=1807608600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aVVaF7hl7R+gOhEtPYn0TSH6l2rFHRc95qDYVDwztH0=;
 b=d3Bt/emtdX69A02I+/CSCJm2kxCsNmC13cdGE7yavtQq59o+IwaBoKvw
 w6hFqZsn+onwOk8N2qcOcWJFhobqaHGjnc+h9rqwyhX+ShM1VxdItB7+R
 lbwKNoYsCde7j6BCQbLIMTZtNTqFZ9YOAGTIucKdzzYjUa3Fi8myUUdc0
 nF6+fHbYdzKUgskAF4emDAPm09wXhXAeSiJk9taYX6vO1SA3WrI/NuwdD
 KB8nd3rQA3xuOblNNrz79oyyMLRvThOi9HbT7mzLhBshrh9htFn0GVVUV
 jGAfXvN0i+REXm+F2LIVNyZdgkWemCxTTUFhKA69RiO3yApt55B7BtraI g==;
X-CSE-ConnectionGUID: gTccwaeKSli3bDiu4jeJMA==
X-CSE-MsgGUID: SFoeXRzpSEeNsYJvOAoJDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76887907"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="76887907"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:30:00 -0700
X-CSE-ConnectionGUID: uAhFEfj4Qyeb5TELifMHow==
X-CSE-MsgGUID: 06EwYoCVS+y7B+FE9+1rew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="229609149"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:29:58 -0700
Date: Mon, 13 Apr 2026 12:29:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: "B, Jeevan" <jeevan.b@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier
 when supported
Message-ID: <ady3cgAzN2t-HCpH@intel.com>
References: <20260316033807.24078-1-jeevan.b@intel.com>
 <abgWhvmToId2i7mj@intel.com>
 <DM4PR11MB6312386897459B61FF1CC3BA9040A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <7b527da4-787f-4623-9bed-f574daec7fb4@intel.com>
 <DM4PR11MB6312D0A1A5310AF1ECBF47EB904EA@DM4PR11MB6312.namprd11.prod.outlook.com>
 <c60ad161-ae0a-47a3-acf0-85a517f6199e@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c60ad161-ae0a-47a3-acf0-85a517f6199e@lankhorst.se>
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

On Mon, Apr 13, 2026 at 11:21:09AM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> My thoughts at the end, I think the focus on linear formats is misguided.

What's misguided is adding driver specific hacks to each and every
test. If we think that the default modifier used for most things
should be something other than linear, then we need to introduce
a proper driver agnostic mechanism tests can use to pick the preferred
modifier.

> 
> Den 2026-03-18 kl. 05:19, skrev B, Jeevan:
> > Hi Ramanaidu,
> > 
> >  
> > 
> > Apart from set_fb_on_crtc I don’t think we need to add this change anywhere else, There are few fb creation happening for cursor.
> > 
> >  
> > 
> > Thanks
> > 
> > Jeevan B
> > 
> >  
> > 
> > *From:*Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> > *Sent:* Wednesday, March 18, 2026 1:14 AM
> > *To:* B, Jeevan <jeevan.b@intel.com>; Ville Syrjälä <ville.syrjala@linux.intel.com>; Murthy, Arun R <arun.r.murthy@intel.com>
> > *Cc:* igt-dev@lists.freedesktop.org
> > *Subject:* Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when supported
> > 
> >  
> > 
> > ++ Arun
> > 
> > Hi Ville,
> > 
> > On 3/16/2026 10:57 PM, B, Jeevan wrote:
> > 
> >         -----Original Message-----
> > 
> >         From: Ville Syrjälä <ville.syrjala@linux.intel.com> <mailto:ville.syrjala@linux.intel.com>
> > 
> >         Sent: Monday, March 16, 2026 8:15 PM
> > 
> >         To: B, Jeevan <jeevan.b@intel.com> <mailto:jeevan.b@intel.com>
> > 
> >         Cc: igt-dev@lists.freedesktop.org <mailto:igt-dev@lists.freedesktop.org>; Naladala, Ramanaidu
> > 
> >         <ramanaidu.naladala@intel.com> <mailto:ramanaidu.naladala@intel.com>
> > 
> >         Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
> > 
> >         supported
> > 
> >          
> > 
> >         On Mon, Mar 16, 2026 at 09:08:07AM +0530, Jeevan B wrote:
> > 
> >             While creating the framebuffer, prefer tile4 when it is supported
> > 
> >             instead of always using linear. Fall back to linear if tile4 is not
> > 
> >             available.
> > 
> >          
> > 
> >         Why?
> > 
> >     On Xe platforms, using the linear modifier takes longer to prepare and submit a flip compared to tiled modifiers. 
> > 
> >     On HRR panels, the available frame time is small, and this delay can cause flips to be submitted in the Evasion region, 
> > 
> >     leading to sequence mismatches.
> > 
> >  
> > 
> > Adding some points:
> > 
> > XE does not include memory optimizations for linear surfaces, which leads to higher processing time for linear buffers. Consequently, linear stress tests are intermittently failing.
> 
> I've been working on GGTT and pinning. The problem with linear pinning is
> that you pin the entire FB into GGTT, using uncached writes.
> 
> Compositors are already aware that linear framebuffers are slow on all
> drivers, not just xe, and will avoid using them at all costs.
> 
> The tests should similarly avoid using linear framebuffers, as they will
> not be representive of real workloads.
> Any non-linear modifier is good, 4-tiled probably bst.
> 
> If you keep using linear, the XRGB101010 format on a 4K monitor
> (3840x2160) would need to over 8000 uncached writes in a row into GGTT,
> stalling synchronously each time on the completion of the write by the
> display hardware.
> This only gets worse when you use other formats with the linear modifier.
> 
> If there is still a problem when using tiled modifiers, and tests
> continue to fail, I have some ideas to make DPT even faster, without
> requiring unbound usage of GGTT.
> 
> Acked-by: Maarten Lankhorst <dev@lankhorst.se>
> 
> Kind regards,
> ~Maarten Lankhorst

-- 
Ville Syrjälä
Intel
