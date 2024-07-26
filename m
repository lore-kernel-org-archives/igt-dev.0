Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73C8C3DA49
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 19:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A02110E9EE;
	Fri, 26 Jul 2024 19:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XN77lgba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D88D10E9EE
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722021240; x=1753557240;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JMRET7YaqfqeqP6tHQA8nzONiLX8U5NvMOsumEJkFMI=;
 b=XN77lgbaog41Axo3YRpil5XFFZRFX9Tb4zq4tiyn90llfHAaxvT9WaiZ
 ROtpCqj5g6zU/zKtbCa+lpCVzMjnvWqJ/PNX/QrlAJLIJ3Fop+RepT7Ma
 TjezW6gIxqU4JuMoR3rYR8kGlSez8rDB65ekQobj7/yat7gMDWdbiOfQd
 0LwVOoQ+bE87zPFI02BwSNPngvv35MDZcs+609Lqtv8FnSLsiCig2J3IM
 2FP55ljSQ1NK9yjFePl6xIyF6b0OgBet54dVcjJvrYt3cw2sbtTjS0qKk
 KBv+VXXbh+H3au9CG9ZzaiLhEHWJ6p9eJc/QwgCCAYwBe64aeTT55Uh6g g==;
X-CSE-ConnectionGUID: AKNEqRBJSPaXtzTJgHLfeQ==
X-CSE-MsgGUID: xeTmOZCrRze+J5goVlVIgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19433547"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19433547"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 12:13:59 -0700
X-CSE-ConnectionGUID: 3ciROVlfSPqnpPgewEHycw==
X-CSE-MsgGUID: QYMkW6/yT1u633x4wpqy1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53262349"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.42])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 12:13:59 -0700
Date: Fri, 26 Jul 2024 21:13:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v3] tests/intel/xe_vm: Add test for 64k page corners
Message-ID: <20240726191352.w6mtvnuktiauxdyx@zkempczy-mobl2>
References: <20240725184538.1938050-1-matthew.brost@intel.com>
 <20240726090248.ot2eujrklooz2uhx@zkempczy-mobl2>
 <ZqOTu8pgoy6in4ou@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZqOTu8pgoy6in4ou@DUT025-TGLU.fm.intel.com>
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

On Fri, Jul 26, 2024 at 12:16:59PM +0000, Matthew Brost wrote:
> On Fri, Jul 26, 2024 at 11:04:25AM +0200, Zbigniew Kempczyński wrote:
> > On Thu, Jul 25, 2024 at 11:45:38AM -0700, Matthew Brost wrote:
> > > Add sections which splits 64k pages in 4k pages or splits compact 64k in
> > > 64k pages.
> > > 
> > > v2:
> > >  - Use SZ_* (Zbigniew)
> > >  - Remove clock block (Zbigniew)
> > >  - Update commit message / comments
> > > v3:
> > >  - Send correct version
> > > 
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  tests/intel/xe_vm.c | 125 ++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 125 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > > index a4f6c7a0b4..f41c6aca53 100644
> > > --- a/tests/intel/xe_vm.c
> > > +++ b/tests/intel/xe_vm.c
> > > @@ -366,6 +366,125 @@ static void userptr_invalid(int fd)
> > >  	xe_vm_destroy(fd, vm);
> > >  }
> > >  
> > > +/**
> > > + * SUBTEST: compact-64k-pages
> > > + * Description:
> > > + *	Take corner cases related to compact and 64k pages
> > > + * Functionality: bind
> > > + * Test category: functionality test
> > > + */
> > > +static void compact_64k_pages(int fd, struct drm_xe_engine_class_instance *eci)
> > > +{
> > > +	size_t page_size = xe_get_default_alignment(fd);
> > > +	uint64_t addr0 = 0x10000000ull, addr1;
> > > +	uint32_t vm;
> > > +	uint32_t bo0, bo1;
> > > +	uint32_t exec_queue;
> > > +	void *ptr0, *ptr1;
> > > +	struct drm_xe_sync sync[2] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > > +			.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > > +	};
> > > +	struct {
> > > +		uint32_t batch[16];
> > > +		uint64_t pad;
> > > +		uint32_t data;
> > > +	} *data = NULL;
> > > +	struct drm_xe_exec exec = {
> > > +		.num_batch_buffer = 1,
> > > +		.num_syncs = 2,
> > > +		.syncs = to_user_pointer(sync),
> > > +	};
> > > +	uint64_t batch_offset;
> > > +	uint64_t batch_addr;
> > > +	uint64_t sdi_offset;
> > > +	uint64_t sdi_addr;
> > > +	int b = 0;
> > > +
> > > +	vm = xe_vm_create(fd, 0, 0);
> > > +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > > +
> > > +	bo0 = xe_bo_create(fd, vm, SZ_8M,
> > > +			   vram_if_possible(fd, eci->gt_id),
> > > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	ptr0 = xe_bo_map(fd, bo0, SZ_8M);
> > > +
> > > +	bo1 = xe_bo_create(fd, vm, SZ_8M / 2,
> > > +			   vram_if_possible(fd, eci->gt_id),
> > > +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > +	ptr1 = xe_bo_map(fd, bo1, SZ_8M / 2);
> > > +
> > > +	sync[0].handle = syncobj_create(fd, 0);
> > > +	if (page_size == SZ_4K) {
> > > +		/* Setup mapping to split a 64k PTE in cache */
> > > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_64K, 0, 0);
> > > +
> > > +		addr1 = addr0 + (SZ_64K / 2);
> > > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_64K / 2,
> > > +				 sync, 1);
> > > +	} else if (page_size == SZ_64K) {
> > > +		addr0 += page_size;
> > > +
> > > +		/* Setup mapping to split compact 64k pages */
> > > +		xe_vm_bind_async(fd, vm, 0, bo0, 0, addr0, SZ_8M, 0, 0);
> > > +
> > > +		addr1 = addr0 + (SZ_8M / 4);
> > > +		xe_vm_bind_async(fd, vm, 0, bo1, 0, addr1, SZ_8M / 2,
> > > +				 sync, 1);
> > > +	}
> > > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> > > +
> > > +	/* Verify 1st and 2nd mappings working */
> > > +	batch_offset = (char *)&data[0].batch - (char *)data;
> > > +	batch_addr = addr0 + batch_offset;
> > > +	sdi_offset = (char *)&data[0].data - (char *)data;
> > > +	sdi_addr = addr0 + sdi_offset;
> > > +	data = ptr0;
> > > +
> > > +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > +	data[0].batch[b++] = sdi_addr;
> > > +	data[0].batch[b++] = sdi_addr >> 32;
> > > +	data[0].batch[b++] = 0xc0ffee;
> > > +
> > > +	sdi_addr = addr1 + sdi_offset;
> > > +	data[0].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> > > +	data[0].batch[b++] = sdi_addr;
> > > +	data[0].batch[b++] = sdi_addr >> 32;
> > > +	data[0].batch[b++] = 0xc0ffee;
> > > +
> > > +	data[0].batch[b++] = MI_BATCH_BUFFER_END;
> > > +	igt_assert(b <= ARRAY_SIZE(data[0].batch));
> > > +
> > > +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	sync[1].handle = syncobj_create(fd, 0);
> > > +	exec.exec_queue_id = exec_queue;
> > > +	exec.address = batch_addr;
> > > +	xe_exec(fd, &exec);
> > > +
> > > +	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
> > > +				NULL));
> > 
> > This will fit in same line ase syncobj_wait() below.
> > 
> 
> No, you need to wait here the exec to signal before checking the data
> and unbinding.

I meant code style, not functionality (NULL may be in same line).


igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));

--
Zbigniew

>
> 
> > > +	igt_assert_eq(data[0].data, 0xc0ffee);
> > > +	data = ptr1;
> > > +	igt_assert_eq(data[0].data, 0xc0ffee);
> > > +
> > > +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	syncobj_reset(fd, &sync[0].handle, 1);
> > > +	xe_vm_unbind_all_async(fd, vm, 0, bo0, 0, 0);
> > > +	xe_vm_unbind_all_async(fd, vm, 0, bo1, sync, 1);
> > > +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> 
> This waits on the unbinds.
> 
> > > +
> > > +	xe_exec_queue_destroy(fd, exec_queue);
> > > +	syncobj_destroy(fd, sync[0].handle);
> > > +	syncobj_destroy(fd, sync[1].handle);
> > > +	munmap(ptr0, SZ_8M);
> > > +	munmap(ptr1, SZ_8M / 2);
> > > +	gem_close(fd, bo0);
> > > +	gem_close(fd, bo1);
> > > +	xe_vm_destroy(fd, vm);
> > > +}
> > > +
> > >  /**
> > >   * SUBTEST: shared-%s-page
> > >   * Description: Test shared arg[1] page
> > > @@ -1973,6 +2092,12 @@ igt_main
> > >  	igt_subtest("bind-flag-invalid")
> > >  		bind_flag_invalid(fd);
> > >  
> > > +	igt_subtest("compact-64k-pages")
> > > +		xe_for_each_engine(fd, hwe) {
> > > +			compact_64k_pages(fd, hwe);
> > > +			break;
> > > +		}
> > > +
> > >  	igt_subtest("shared-pte-page")
> > >  		xe_for_each_engine(fd, hwe)
> > >  			shared_pte_page(fd, hwe, 4,
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Regardless addressing nit above:
> > 
> > Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > 
> 
> Thanks.
> 
> Matt
> 
> > --
> > Zbigniew
