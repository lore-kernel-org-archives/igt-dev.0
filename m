Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D273FD1CDD3
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCEA10E309;
	Tue, 22 Oct 2024 10:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dH2/NCZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAEC10E309
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729592994; x=1761128994;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=cWA4ih+9LsFc/TAaIh7M/JPOLzKF8TvzdagGNv2KkGU=;
 b=dH2/NCZv7CkuhTCJWfrR7q2nuPnH6rmgDsQrcRBqqalJHRga4C+SVGey
 nacI5ybZzjwEqab2QGVCWEIDrUR6fR6+3te6EyBY2wLwsL+oED+g5T1qL
 4FJOirVV7Pk9cd+cYpw9hxCnkuGhE1zsALclRdzDAUhJ119ggf0DKfThM
 4v4xntuFX7rqWt7mfk5vilRXu/VUEYn6EfZHj7Kk/+uj9LWnMk0XC1BXj
 g2AfV3l/oDrapIHg3uZcZKifX1HTe9KCOZ9phqKGpk8TYIxb9YZ/4uEqz
 qCq/eXdl2cGPYHgwz5P1kc2J1O8H5+43WMtTS8xHntRF+1pnHoYz1BgqQ Q==;
X-CSE-ConnectionGUID: dE0V/yA8S6uzHaxAEaw5Aw==
X-CSE-MsgGUID: /xqsb1s6SJSXydoIUXNQ1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29276647"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29276647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:29:53 -0700
X-CSE-ConnectionGUID: HiPejnG4R7GHisNrCkYoog==
X-CSE-MsgGUID: nfSnu7+BQo6KeeGZrhw+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79834455"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:29:51 -0700
Date: Tue, 22 Oct 2024 12:29:51 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 sai.gowtham.ch@intel.com, katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: Use
 xe_find_engine_by_class
Message-ID: <20241022102951.di4ba2q7p2ooy52p@zkempczy-mobl2>
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
 <20241016101933.4191790-3-pravalika.gurram@intel.com>
 <20241021154057.prfzslhuxmrbo6z4@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241021154057.prfzslhuxmrbo6z4@kamilkon-desk.igk.intel.com>
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

On Mon, Oct 21, 2024 at 05:40:57PM +0200, Kamil Konieczny wrote:
> Hi Pravalika,
> On 2024-10-16 at 15:49:33 +0530, Pravalika Gurram wrote:
> > Use 'xe_find_engine_by_class' helper to get the engine info with the
> > required engine class.  Stop assuming engine id is equal to 1
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > ---
> >  tests/intel/xe_exec_compute_mode.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> > index 82e607848..b238503ea 100644
> > --- a/tests/intel/xe_exec_compute_mode.c
> > +++ b/tests/intel/xe_exec_compute_mode.c
> > @@ -461,7 +461,10 @@ static void lr_mode_workload(int fd)
> >  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> >  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> >  	bo_size = xe_bb_size(fd, sizeof(*spin));
> > -	engine = xe_engine(fd, 1);
> > +
> > +	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
> > +	igt_assert(engine);
> 
> Instead of igt_assert it could be better to use
> 	igt_skip_on(!engine, "message...\n")
> 
> also move that to begin of this function (before vm_create or other inits)
> 
> Regards,
> Kamil

There's no possibility there's no COPY engine. So assert is fine for me
here.

--
Zbigniew

> 
> > +
> >  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
> >  	spin = xe_bo_map(fd, bo, bo_size);
> >  
> > -- 
> > 2.34.1
> > 
