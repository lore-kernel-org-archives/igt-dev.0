Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B57E7719A
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 14:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A360010EE11;
	Thu,  9 Jan 2025 14:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIAlwfu8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA0810EE11
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736433933; x=1767969933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6PMKSu6+237eGeVQXGKBPPN77GRh0vQTC4jZsRKGqUo=;
 b=jIAlwfu88a8OvOO8g37jzL9LSS5vs7SgzAPYpmdxcZZ82NsBf1F9PeDj
 8vAfXwStAqkEoMdL3dsiB2MUXg/amgvFZeD8UY1cZ8AOemsEegUL2Aivp
 7elCr7f/+6p+SR+/kGlbXZVt5QmEgAe7z1sRugopYnGFZq84TjLl81goU
 klCDSmns53woZm+fl8DK7dEpCahXHhb2JmRXDdvEa828/7QLxi/olxALh
 SiHhk2Gg8myUpBh8kP6a0CoeszLDYnCQFh8r13S8bU6lmCv08WkpgobJE
 yk+ytIvds9Eh485z9FEtWxUwIVLL/NGCCnJnHXGIMd5iyRk9ZxI0WpkJ2 w==;
X-CSE-ConnectionGUID: ltcSoggfSguT6d38nAB3hA==
X-CSE-MsgGUID: yqlfBz9/S/mqeLOdwJhLUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36926521"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="36926521"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 06:45:33 -0800
X-CSE-ConnectionGUID: KHtDrYl/SomCwLSgS0PUaw==
X-CSE-MsgGUID: TP4lyTxfSVSKYXtyPsbDJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104301526"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 06:45:31 -0800
Date: Thu, 9 Jan 2025 15:45:17 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL()
 takes 3 arguments, not 4
Message-ID: <20250109144517.hr4flup4b2lwixhj@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
References: <20250103222628.4069004-1-thomas.petazzoni@bootlin.com>
 <BL1PR11MB5445B391A20BFCB58D2EE8D7E5152@BL1PR11MB5445.namprd11.prod.outlook.com>
 <20250104224429.0d3d00de@windsurf>
 <sxukhx63erp73m3zcystgxpvn4nyypde474rmk63v6ndwsfmc7@sfkf2yg7ubik>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sxukhx63erp73m3zcystgxpvn4nyypde474rmk63v6ndwsfmc7@sfkf2yg7ubik>
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
On 2025-01-06 at 11:42:32 -0600, Lucas De Marchi wrote:
> On Sat, Jan 04, 2025 at 10:44:29PM +0100, Thomas Petazzoni wrote:
> > Hello Jonathan,
> > 
> > Thanks for the quick feedback!
> > 
> > On Fri, 3 Jan 2025 23:33:27 +0000
> > "Cavitt, Jonathan" <jonathan.cavitt@intel.com> wrote:
> > 
> > > "HAVE_LIBPROC2_POST_4_0_5_API" works as a name for this new tag,
> > > though I wonder if "HAVE_LIBPROC2_NO_INFO" would also work?
> > 
> > I don't have a strong opinion on the macro name, but "NO_INFO" sounds
> > very generic. Here we're just talking about the "info" argument of this
> > specific PIDS_VAL() macro.
> > 
> > It is worth mentioning that I had reported the issue to upstream
> > procps-ng and they don't consider it as a bug:
> > 
> >  https://gitlab.com/procps-ng/procps/-/issues/366
> > 
> > Also, they said that the SONAME has changed. Which they indeed did in:
> > 
> >  https://gitlab.com/procps-ng/procps/-/commit/f8d20531f840e280fcbe1f3a0634ab72c9b4e74d
> > 
> > So maybe our macro name should be based somehow on this SONAME, which
> > identifies the API version?
> 
> ugh... but the soname is about linking to the library, which is
> unrelated to linking.
> 
> I'd rather wait on that discussion to settle.
> 
> > 
> > > I don't see any other granular version checks in the meson build file (at
> > > least, I don't see any that aren't strict version requirements for certain
> > > dependencies), so AFAICT this type of tag is fairly novel.  So whatever
> > > name we end up choosing may end up inadvertently becoming a
> > > standard naming convention for future tags like this one.
> > 
> > Note that I am not entirely happy with it being a version check.
> > Ideally, we shouldn't check the version, but rather test the feature
> > itself: build a simple program that uses the 4 argument variant of
> > PIDS_VAL() and decide depending on the success/failure which variant we
> > should use. This is generally less fragile than a version check, at
> > least IMO.
> 
> agreed, that would be the next best alternative
> 
> Lucas De Marchi
> 

I merged this as is, if there will be any better solution
it could replace this patch.

Regards,
Kamil

> > 
> > Best regards,
> > 
> > Thomas
> > -- 
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
