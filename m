Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B092D729F3
	for <igt-dev@archiver.kernel.org>; Fri, 29 Nov 2024 18:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390D10E0D2;
	Fri, 29 Nov 2024 18:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxFZb5hq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEC310E575
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Nov 2024 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732904599; x=1764440599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F9CPrfj9hnIkUIcaT4gWdPUBco1cBDSqU7p6//hOTWw=;
 b=YxFZb5hqTkLeo0Ue+cg6u+MF7YXdRH40aQ9FJQf3J5mm8lsAxu60kg0U
 jODV28xzcpqICh4dt8JppcAS5r+vNRUj3ybw7eH0UU/JDyjw45uwEKdgN
 0OnPxm6/UPFCR4aD06NjnT04bjKwCBOkAp1gazUPeCJUCvxuMsAzwxxue
 r5uy+CuQkNC1K24CTax6kahdQ+Z1BFPX90PgLVKhWDEZuknJplu5Sv3lx
 FAnj3lIBC+gEoqnQhdowsJ0tun4JGOZVaSdt+0M+dutuPweQvto0Vbghr
 6OaHqBD+gHfG4tX29/A1eMnn4umL0reHKPraegUjItpt/m9QltbXWmmH3 g==;
X-CSE-ConnectionGUID: AUkccorZSYqYpluSWfya4w==
X-CSE-MsgGUID: 88TEgszuTA+rqECHtJVabQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36811991"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="36811991"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 10:23:18 -0800
X-CSE-ConnectionGUID: L8mO/A9bSaiNLqY8iOgiDQ==
X-CSE-MsgGUID: Au8WM7efQ4GActi0MFDKzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; d="scan'208";a="130027695"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 10:23:16 -0800
Date: Fri, 29 Nov 2024 19:22:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Samala, Pranay" <pranay.samala@intel.com>,
 "B, Jeevan" <jeevan.b@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dsc: Add meaningfull skip message
Message-ID: <20241129182258.3m3jxxxa6fn73m3v@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Samala, Pranay" <pranay.samala@intel.com>,
 "B, Jeevan" <jeevan.b@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
References: <20241125032420.1945935-1-pranay.samala@intel.com>
 <DM4PR11MB63120680914E79DF2142B6A7902E2@DM4PR11MB6312.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4PR11MB63120680914E79DF2142B6A7902E2@DM4PR11MB6312.namprd11.prod.outlook.com>
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

Hi,
On 2024-11-25 at 17:36:16 +0000, B, Jeevan wrote:
> > -----Original Message-----
> > From: Samala, Pranay <pranay.samala@intel.com>
> > Sent: Monday, November 25, 2024 8:54 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> > <swati2.sharma@intel.com>; B, Jeevan <jeevan.b@intel.com>; Lattannavar,
> > Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> > <pranay.samala@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/kms_dsc: Add meaningfull skip message
> > 
> > This patch adds a proper skip message which will be easy to debug.

After this description I would expect only skip messages will
change but later on you did more then this. You should describe
all changes made by a patch, see CONTRIBUTE.md for some pointers.

> > 
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > ---
> >  tests/intel/kms_dsc.c | 36 ++++++++++++++++++++----------------
> >  1 file changed, 20 insertions(+), 16 deletions(-)
> > 

...cut...

> > +			if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
> > +			    (!is_dsc_fractional_bpp_supported(data->disp_ver,
> > +							      data->drm_fd,
> > data->output)))
> > +				continue;
> >  			update_display(data, test_type);
> > +		}
> This introduces new dynamic subtests, 
> LGTM. 
> 
> Reviewed-by: Jeevan B <jeevan.b@intel.com>

Please split this into adding meaningfull messages and second patch
for introducing new dynamic subtests.

Regards,
Kamil

> > 
> >  		if (data->limited)
> >  			break;
> > --
> > 2.34.1
> 
