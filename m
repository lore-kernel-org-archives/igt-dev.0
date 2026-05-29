Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA40CD6E50
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 15:10:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D586112091;
	Fri, 29 May 2026 15:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEV7uYjV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921A011208F
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780067381; x=1811603381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WyqwbF9A5A5VmiY4zkqB8Loyx4oqwWaSUeUvdrSnpU8=;
 b=XEV7uYjVwYQ6fCrvvpy9VcJ93JVZcc2bZG5ovQlHYYi337uaeY7Vfiwk
 aXpcf50B/AF3cM3GmwBFq4iLTz0B2rJQB7JsBblIRjQsRDxlf9nzqT0DX
 Q/jl4O+6w/uDaYJMaC7mUTa4lptXO2lvMo3pIgGJ8mtBAsMhru+EdBPsV
 F5MPRCVLq3RQvLD0vX7+twEnl2eRYtWpj8QzenbrT/sSwYRIz+CdASy8m
 A64s7/4BgaJTnFZVVmDGUjKyRz4pZgqxeQ/D0Rd9kvwO0DJiJKvaLSvLt
 7mSLuqCctH4Z0AAgGCB8mimacqH49Vl9NxmWnf/euIKC023eVBM52JOE+ w==;
X-CSE-ConnectionGUID: rePNAt7xQSK819wmi0A8gQ==
X-CSE-MsgGUID: rTL46ts3Te+h4eKzuQMafQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92393690"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="92393690"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:09:41 -0700
X-CSE-ConnectionGUID: +I4yWv5OTGCkXXdoKjAVzQ==
X-CSE-MsgGUID: os2r+1koSeCTzBoe49c4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; d="scan'208";a="247813993"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2026 08:09:34 -0700
Date: Fri, 29 May 2026 18:09:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "Thomas, Sobin" <sobin.thomas@intel.com>
Subject: Re: [PATCH i-g-t v1 0/4] RFC: Create smaller dmesg reports for a test
Message-ID: <ahmsKpVfFj3G8DP9@intel.com>
References: <20260520154947.116726-1-kamil.konieczny@linux.intel.com>
 <5a9494611b1644f3113d6972e55103e3aeead1fa.camel@intel.com>
 <425e70c4ff7133d6101ed0e52902aa3d73dc3dc1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <425e70c4ff7133d6101ed0e52902aa3d73dc3dc1@intel.com>
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

On Fri, May 29, 2026 at 03:52:13PM +0300, Jani Nikula wrote:
> On Fri, 29 May 2026, "Knop, Ryszard" <ryszard.knop@intel.com> wrote:
> > IMO this is going to end up either unused, and people will keep
> > complaining they want a higher limit anyways, or overused, and people
> > will complain why some of their logs are randomly missing from CI logs.
> >
> > In general it seems like this does not break the CI infra directly, so
> > I won't say no to anything here, but it's one of those things that dial
> > up the magic and we seem to have lots of that in disk limits recently.
> 
> Overall seems like there are a number of hacky approaches being added,
> e.g. tweaking of the drm.debug parameter value, and filtering parts of
> the dmesg.
> 
> Debugging issues is often seriously difficult even with the full
> dmesg. Having an imcomplete dmesg makes everything more difficult. And
> it's the worst if you don't even know that when looking at the dmesg.
> 
> We could *maybe* discuss reducing the stored dmesgs for tests that
> passed. Or reduce the time the dmesgs are stored for passed dmesgs. But
> even then it's often useful to see the passed results when debugging
> failed results.
> 
> But no matter what, full dmesgs should be the standard for failed tests,
> and nothing less is acceptable.

If disk space is the issue then just compress the damn logs.

-- 
Ville Syrjälä
Intel
