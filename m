Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DEBCCF2C1
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 22:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705BD10E233;
	Fri, 16 Oct 2026 22:11:28 +0000 (UTC)
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com
 [165.173.182.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB671129F8
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 22:10:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1792188627; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XbtoW8CykOsg3XpXFp1NPj5WCpsOqROqxsWmMWvmPKfd+LV4IWv+dpD5SvLtKFIRWKxPOxX2tzpJzaslL9wWRaqpIZoRRbpAcCb8rL/GxLAgBGHNsjYuKnKng7UWSymXwhWUcXk1z5/ozv9vpEaVioTA2Biq1rV1XUcF+f3gGHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1792188627;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=U2LYfsBEvrdc40P6poqM1m/DKrw/ua4dLDMwP9JvGrk=; 
 b=cRUbdPBEBgbCf0x0rgC+FVObl8J4xK30aBlp6lNqbUDJgHAwnk3vtUpXYnB5H4sz80EXJCE+O2gcTV74ofVOPGo6M6WCpeEsK5Ru1sZyEQGwybw9WfEx1n81RFls58qDxk6mt79dAJJvjuO4+oyygesEGkl3v9Vhrtb0PUSd5k0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792188627; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=U2LYfsBEvrdc40P6poqM1m/DKrw/ua4dLDMwP9JvGrk=;
 b=PtkMt7GaHVmLQO6kKhyL9KWjeQtZ6IYPlehP997KfmrNzIAXw9kBPfwwqjzX1T+1
 HHjjwD47KD4SBqVtK/bTx/vc4kNovZ/XMKLHRQA7uKDPMuN5sTJBNRnoVqLZs2EwAdG
 6atYITcDrh3ApeLhB9zTnugLOyUHseYWF7qGVB2c=
Received: by smtp.zohomail.com with SMTPS id 1792188625137408.5783766028868;
 Fri, 16 Oct 2026 15:10:25 -0700 (PDT)
Date: Fri, 16 Oct 2026 15:10:23 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, steven.price@arm.com,
 daniel.almeida@collabora.com, kamil.konieczny@linux.intel.com
Subject: Re: [PATCH i-g-t 2/2] panthor: test dev_query buffer size variations
Message-ID: <atKgz-gMO1x10uhx@um790>
References: <20261015-b4-dev_query-v1-0-70ffafa4131e@collabora.com>
 <20261015-b4-dev_query-v1-2-70ffafa4131e@collabora.com>
 <atHpLtAzeOw8042v@e142607>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atHpLtAzeOw8042v@e142607>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/292.169.41
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

On Fri, Oct 16, 2026 at 10:06:54AM +0100, Liviu Dudau wrote:
> On Thu, Oct 15, 2026 at 04:44:58PM -0700, Deborah Brouwer wrote:
> > Add tests to check that the kernel driver will gracefully handle userspace
> > buffers that are smaller or larger than the kernel driver expected.
> > 
> > Also, add a test to ensure that the kernel driver is enforcing the
> > minimum buffer size and that the kernel driver will provide the size
> > when the userpointer is null.
> > 
> > This ensures UAPI compliance for DRM_IOCTL_PANTHOR_DEV_QUERY.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  tests/panthor/panthor_query.c | 64 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> > 
> > diff --git a/tests/panthor/panthor_query.c b/tests/panthor/panthor_query.c
> > index afd58a5bd..8ff2e9652 100644
> > --- a/tests/panthor/panthor_query.c
> > +++ b/tests/panthor/panthor_query.c
> > @@ -7,6 +7,10 @@
> >  #include "panthor_drm.h"
> >  #include <stdint.h>
> >  
> > +#define GPU_INFO_MIN_SIZE \
> > +	(offsetof(struct drm_panthor_gpu_info, tiler_present) + \
> > +	 sizeof(((struct drm_panthor_gpu_info *)0)->tiler_present))
> > +
> >  int igt_main() {
> >  	int fd = -1;
> >  
> > @@ -20,10 +24,70 @@ int igt_main() {
> >  		struct drm_panthor_gpu_info gpu = {};
> >  
> >  		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, &gpu, sizeof(gpu), 0);
> > +		igt_assert_neq(gpu.gpu_id, 0);
> > +	}
> > +
> > +	igt_describe("Ensure kernel returns a GPU_INFO size.");
> > +	igt_subtest("query-size-null-pointer") {
> > +		uint32_t size;
> > +
> > +		size = igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO, NULL, 0, 0);
> > +
> > +		/*
> > +		 * The kernel returns its output structure size, which may be out
> > +		 * of sync with the header used to build these tests, so don't expect
> > +		 * that the sizes will match necessarily.
> > +		 */
> > +		igt_assert(size >= GPU_INFO_MIN_SIZE);
> > +	}
> > +
> > +	igt_describe("Ensure kernel enforces GPU_INFO minimum size.");
> > +	igt_subtest("query-size-too-small") {
> > +		struct drm_panthor_gpu_info gpu = {};
> > +
> > +		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> > +				  &gpu, GPU_INFO_MIN_SIZE - 1, EINVAL);
> > +	}
> > +
> > +	igt_describe("Ensure kernel accepts GPU_INFO minimum size.");
> > +	igt_subtest("query-min-size") {
> > +		struct drm_panthor_gpu_info gpu = {};
> > +
> > +		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> > +				  &gpu, GPU_INFO_MIN_SIZE, 0);
> 
> This last test feels redundant. We've checked that the kernel expects a struct of
> at least GPU_INFO_MIN_SIZE and we've checked that smaller sizes are rejected. If
> GPU_INFO_MIN_SIZE is rejected that means we are no longer supporting that size
> and user space should be upgraded, not necessarily that the kernel has a bug.

Ok, yes that makes sense, I'll drop this test in v2.
Thanks for reviewing this.

> 
> 
> Best regards,
> Liviu
> 
> >  
> >  		igt_assert_neq(gpu.gpu_id, 0);
> >  	}
> >  
> > +	igt_describe("Ensure kernel zeros out unused part of buffer.");
> > +	igt_subtest("query-too-big") {
> > +		uint32_t size;
> > +		size_t buf_size;
> > +		uint8_t *buf;
> > +
> > +		/*
> > +		 * Create a buffer that is larger than necessary.
> > +		 * Start with the size returned by the kernel in case it is out of
> > +		 * sync with these tests. Then add an extra 16 bytes and initialize
> > +		 * the entire buffer to non-zero values.
> > +		 */
> > +		size = igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> > +					 NULL, 0, 0);
> > +		buf_size = (size_t)size + 16;
> > +		buf = malloc(buf_size);
> > +		igt_assert(buf);
> > +		memset(buf, 0xff, buf_size);
> > +
> > +		igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> > +				  buf, buf_size, 0);
> > +
> > +		/* Check that the extra bytes were zeroed. */
> > +		for (size_t i = size; i < buf_size; i++)
> > +			igt_assert_eq(buf[i], 0);
> > +
> > +		free(buf);
> > +	}
> > +
> >  	igt_fixture() {
> >  		drm_close_driver(fd);
> >  	}
> > 
> > -- 
> > 2.56.0
> > 
> 
> -- 
> ====================
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     ¯\_(ツ)_/¯
