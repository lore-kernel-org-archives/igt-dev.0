Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FB8E77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 17:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A4110E22D;
	Mon,  6 Jan 2025 17:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YonOjpVY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA98510E22D
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 17:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736185357; x=1767721357;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RyMLzU4DsGcYo20GQl1NPrjbO19w9VrjpIwL2hcrv3E=;
 b=YonOjpVYp/JvILvCV3vJH8FleYc5SGjLYCbJ/NRc12G3x3b0la76Dhvr
 AW+584ANOTzYyRVilPNEDBJAf03W78ld7/zrvSEtFvfd0ecaqx5fPqyLS
 HrMRblvLeUEw5dZ0iC51XnUzN7iBCUZc75CvFgNERkPaaGropbvwnYpZB
 G4r4ZaqF39AQ49VTzrxG4wcMxovwM1baBdTDhum0CWGMQPXIXHRxtxXKL
 mPzbzmxM7BbLt/HxKQv+Fq3+ZcWGuEkJRFaTuFDcpazJeGdTKYcB7KMP1
 IdbyNYhGcV6wj3lkJhjxsO3INkTRxwBCO8XBpnmxjkxMYDyIZTy2UqhXg w==;
X-CSE-ConnectionGUID: pneqk/XbRzKg6ydyvAow6Q==
X-CSE-MsgGUID: 23jyYFChR0eL6zVWw/gfGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61715530"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="61715530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:42:37 -0800
X-CSE-ConnectionGUID: P8xxMTpeRhGL5NEjgGrmIQ==
X-CSE-MsgGUID: flLBIOovR96JgxKGLaHMxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="133355856"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 09:42:37 -0800
Date: Mon, 6 Jan 2025 11:42:32 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL()
 takes 3 arguments, not 4
Message-ID: <sxukhx63erp73m3zcystgxpvn4nyypde474rmk63v6ndwsfmc7@sfkf2yg7ubik>
References: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
 <BL1PR11MB5445B391A20BFCB58D2EE8D7E5152@BL1PR11MB5445.namprd11.prod.outlook.com>
 <20250104224429.0d3d00de@windsurf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250104224429.0d3d00de@windsurf>
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

On Sat, Jan 04, 2025 at 10:44:29PM +0100, Thomas Petazzoni wrote:
>Hello Jonathan,
>
>Thanks for the quick feedback!
>
>On Fri, 3 Jan 2025 23:33:27 +0000
>"Cavitt, Jonathan" <jonathan.cavitt@intel.com> wrote:
>
>> "HAVE_LIBPROC2_POST_4_0_5_API" works as a name for this new tag,
>> though I wonder if "HAVE_LIBPROC2_NO_INFO" would also work?
>
>I don't have a strong opinion on the macro name, but "NO_INFO" sounds
>very generic. Here we're just talking about the "info" argument of this
>specific PIDS_VAL() macro.
>
>It is worth mentioning that I had reported the issue to upstream
>procps-ng and they don't consider it as a bug:
>
>  https://gitlab.com/procps-ng/procps/-/issues/366
>
>Also, they said that the SONAME has changed. Which they indeed did in:
>
>  https://gitlab.com/procps-ng/procps/-/commit/f8d20531f840e280fcbe1f3a0634ab72c9b4e74d
>
>So maybe our macro name should be based somehow on this SONAME, which
>identifies the API version?

ugh... but the soname is about linking to the library, which is
unrelated to linking.

I'd rather wait on that discussion to settle.

>
>> I don't see any other granular version checks in the meson build file (at
>> least, I don't see any that aren't strict version requirements for certain
>> dependencies), so AFAICT this type of tag is fairly novel.  So whatever
>> name we end up choosing may end up inadvertently becoming a
>> standard naming convention for future tags like this one.
>
>Note that I am not entirely happy with it being a version check.
>Ideally, we shouldn't check the version, but rather test the feature
>itself: build a simple program that uses the 4 argument variant of
>PIDS_VAL() and decide depending on the success/failure which variant we
>should use. This is generally less fragile than a version check, at
>least IMO.

agreed, that would be the next best alternative

Lucas De Marchi

>
>Best regards,
>
>Thomas
>-- 
>Thomas Petazzoni, co-owner and CEO, Bootlin
>Embedded Linux and Kernel engineering and training
>https://bootlin.com
