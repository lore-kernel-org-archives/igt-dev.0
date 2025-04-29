Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C493AC369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 09:15:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8B10E3F9;
	Tue, 29 Apr 2025 09:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POMhvfJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD8910E2EF
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745918118; x=1777454118;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oTZM6qOE0eAU7uV67HHns76m7Rr8OIxoXpu44baYy60=;
 b=POMhvfJm/Xx6XJ9Ve26nGqw1AHCWLy1Agky9g31yOXZGjZTM9FjT0DQs
 IVrCVIGey7Hk7WUjF/n3S2sLm19V7VI8U9GVVh2BQsyTkjS5QLEO/mGF4
 Cwwbvfj9MOxNSUcZMIzrNe5iVwyGVjPW7apNnGDEpB3xvnsVDANHtuXHB
 uEt+dgxetAflzy4a9UnU1ThTpkw8pUsHYxFenauQkxKsx+x3zC1BH3JOA
 V2lKEtfz3QIIkJCa/IsgrFWUvhkLN8HM1HiFLC/FbYFgDinm4y1bQABs/
 ZdrV0XjBRRGb/kA4Dt79qWiorOw1EVYasYUjPHHFAEFDerzmV7+jq0cVH g==;
X-CSE-ConnectionGUID: 9l5jo9akTCa0ddQEtamTQw==
X-CSE-MsgGUID: pj0m2LloQWK/M2fa4mf1aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47689000"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="47689000"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:15:14 -0700
X-CSE-ConnectionGUID: 7s+5jzJpTb6+df+gbILWdw==
X-CSE-MsgGUID: OXJaXSyoR6ihk6j1JQE6QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="138952521"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 02:15:12 -0700
Date: Tue, 29 Apr 2025 11:14:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe/xe_ioctl: Fix compilation on 32-bit armhf
Message-ID: <20250429091453.fum5b3iw4yz5l2ct@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250428162122.152829-1-kamil.konieczny@linux.intel.com>
 <aA-sUTROMev9m5zK@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aA-sUTROMev9m5zK@fdugast-desk>
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

Hi Francois,
On 2025-04-28 at 18:26:57 +0200, Francois Dugast wrote:
> Hi,
> 
> On Mon, Apr 28, 2025 at 06:21:22PM +0200, Kamil Konieczny wrote:
> > Fix some compilation eerors on 32-bit platforms like armhf:
> 
> s/eerors/errors/
> 
> > 
> > ../lib/xe/xe_ioctl.c:443:7: error: conflicting types for xe_bo_map_fixed void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
> >        ^~~~~~~~~~~~~~~
> > In file included from ../lib/xe/xe_ioctl.c:46:
> > ../lib/xe/xe_ioctl.h:89:7: note: previous declaration of xe_bo_map_fixed was here
> >  void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
> >        ^~~~~~~~~~~~~~~
> > ../lib/xe/xe_ioctl.c: In function xe_bo_map_fixed:
> > ../lib/xe/xe_ioctl.c:449:13: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
> >   map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
> >              ^
> > cc1: some warnings being treated as errors
> > 
> > Fixes: 9eda33fedff7 ("tests/xe: Add system_allocator test")
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> I recently came across the same error and the same solution for commit 18f9cc22
> "lib/intel_compute: Allow the user to override input and output addresses", so:
> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> Francois
> 

Uh, it looks more complicated, let me dig in into this as there
are still compilation errors in those 32-bit containers.

Regards,
Kamil

> > ---
> >  lib/xe/xe_ioctl.c | 2 +-
> >  lib/xe/xe_ioctl.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > index 785fc9184..53a53cd0d 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -446,7 +446,7 @@ void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr)
> >  	void *map;
> >  
> >  	mmo = xe_bo_mmap_offset(fd, bo);
> > -	map = mmap((void *)addr, size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
> > +	map = mmap(from_user_pointer(addr), size, PROT_WRITE, MAP_SHARED | MAP_FIXED, fd, mmo);
> >  	igt_assert(map != MAP_FAILED);
> >  
> >  	return map;
> > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> > index 554a33c9c..522094ae2 100644
> > --- a/lib/xe/xe_ioctl.h
> > +++ b/lib/xe/xe_ioctl.h
> > @@ -86,7 +86,7 @@ uint32_t xe_exec_queue_create_class(int fd, uint32_t vm, uint16_t class);
> >  void xe_exec_queue_destroy(int fd, uint32_t exec_queue);
> >  uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
> >  void *xe_bo_map(int fd, uint32_t bo, size_t size);
> > -void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, long unsigned int addr);
> > +void *xe_bo_map_fixed(int fd, uint32_t bo, size_t size, uint64_t addr);
> >  void *xe_bo_mmap_ext(int fd, uint32_t bo, size_t size, int prot);
> >  int __xe_exec(int fd, struct drm_xe_exec *exec);
> >  void xe_exec(int fd, struct drm_xe_exec *exec);
> > -- 
> > 2.49.0
> > 
