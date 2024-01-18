Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029E3C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 10:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7621510E76D;
	Thu, 18 Jan 2024 10:43:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47E510E77C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 10:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705574598; x=1737110598;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XC2nIbSSfaMooEVzeG55Be3jlLdxBCnnmVr02XtgYIw=;
 b=JX2QwOs6AqwMI5i7MRnP4GfnnYd2ciMivADACwEOhg18Ta03fSFJ/4r6
 JiJffYOKJIc2+y8yu2Y+TOVIXgpSgCTstvPwoOOwIRx/iFTBmtdey/Itb
 CjMVUZwP2W5a4yxGmDZVku/SV9SxQpnFbmuyonz//5XVivjDf7PgmAVGG
 uPrf7sjC3oVM/EhEK1Ga6bToWaX/9DMjXGit1HvrC/FDhAZbgPTzmRoR7
 YibAtKkV4+sov7gk5c/8iKVff2JQqekYrTQyKMDabrEhTHCx0dJiF2aNU
 vvBumnreWxmqnGr3Fz9UVcYZywnoYxFQTJT6iIv7MaEv5ImzmaNjT5qhH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7171703"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7171703"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 02:43:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928084153"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="928084153"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 02:43:17 -0800
Date: Thu, 18 Jan 2024 11:43:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH] Fix CAT error by adjusting prefetch size for Xe2
Message-ID: <20240118104314.o4gcqgn27gw22uxt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
References: <440d8d632ad08907dd8fc7ac1b8322176c2b48df.1705523804.git.jagmeet.randhawa@intel.com>
 <4cd6b93f-56cd-42ee-bb07-162917f87a6e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4cd6b93f-56cd-42ee-bb07-162917f87a6e@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi,

On 2024-01-18 at 08:45:12 +0000, Matthew Auld wrote:
> On 17/01/2024 20:46, Jagmeet Randhawa wrote:

please add also i-g-t after PATCH, so with Matthew suggestion
it would look like:

[PATCH i-g-t] tests/intel/xe_exec_store: account for prefetch on Xe2

> > Due to batch pre-fetch being quite aggressive on Xe2, we need
> > an extra 4K page at the end of the batch to ensure HW doesn't
> > pre-fetch beyond the boundaries of the batch itself, hitting
> > an invalid ppGTT page, resulting in CAT errors. Fix this by
> > accounting for the xe_cs_prefetch_size() when calculating
> > the size of the batch.
> > 
> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> 
> Commit title needs to have some kind of prefix like:
> "tests/intel/xe_exec_store".
> 
> If the entire thing is too long then shorten to something like:
> "tests/intel/xe_exec_store: account for prefetch".

I will merge this with this ^, adding also at end "on Xe2".

Regards,
Kamil

> 
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   tests/intel/xe_exec_store.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> > index 2e4f57b47..bed118688 100644
> > --- a/tests/intel/xe_exec_store.c
> > +++ b/tests/intel/xe_exec_store.c
> > @@ -201,7 +201,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
> >   	uint32_t *batch_map;
> >   	size_t bo_size = 4096;
> > -	bo_size = ALIGN(bo_size, xe_get_default_alignment(fd));
> > +	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
> >   	vm = xe_vm_create(fd, 0, 0);
> >   	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
> >   	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
