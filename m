Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5831C61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 11:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C84F10E52D;
	Wed, 26 Aug 2026 11:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neDoiYGd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFE010EBFE
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787743315; x=1819279315;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UirtdbW0oorE7lHUlRi4gGr3aw2ToR/HOj5CsQBvXAg=;
 b=neDoiYGdldGR5zkuOknLY9q+xUCu5YeCjDDLwxuZIZ6tmHWu6MCHJN4X
 oL8O1gX1ZbzHp/2CAh9WtB4DKbpUcM/CA30CU+JDeccXl7GroDrCmzYda
 3dJOiZ146vXNpW9Bvru5lP7aC3+iGoTfkL5S4Trt544wLldSWTzFjHUdw
 xePF9FxtBiReqUHSUL3nBEsWIVymMTX29HQVGiaMjJRiT8+MQK0/BDSjr
 2ynN5Tcs9PirQ2DankxaVAAf1Ym/ujyBz7jwI6Z9+ZHvolnArne6Pijzc
 Jwo5TW8xZl46WqYMzCKIx2/2p7x9W2pQADpFHV8lQRu94s2i99wrjA0GV A==;
X-CSE-ConnectionGUID: Rw+8Ja/VQGWEWQMegRrOTQ==
X-CSE-MsgGUID: vglivgSFS+yglSCt7g27SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88276944"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88276944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 04:21:50 -0700
X-CSE-ConnectionGUID: AorHTwbpRbetZEptmq8GSw==
X-CSE-MsgGUID: aXs3okGqTdqSLo/l4pyIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271054220"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 04:21:48 -0700
Date: Wed, 26 Aug 2026 13:21:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 igt-dev@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/gem_exec_params: add
 invalid-offset-multiple-buffers test
Message-ID: <20260826112146.m3btkp55a2l44jfv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 igt-dev@lists.freedesktop.org,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <20260819152108.58688-2-krzysztof.niemiec@intel.com>
 <gda37yz65qif5ugay37oko4xj57emhqznqaf2imil5k3z25w7y@hbpp5mhzkqs3>
 <aob1Jdrp54F491Je@kniemiec-mobl1>
 <rgysxjgtb7rurtpf4hnk7x6aw5pce3izhm36qrzku2tq5x52aa@5j6gy6tfhxvt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <rgysxjgtb7rurtpf4hnk7x6aw5pce3izhm36qrzku2tq5x52aa@5j6gy6tfhxvt>
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

Hi Krzysztof,
On 2026-08-26 at 07:41:42 +0000, Krzysztof Karas wrote:
> Hi Krzysztof,
> 
> thanks for explaining, I have no further issues:
> 
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 

Applied, thanks!



Regards,
Kamil

> On 2026-08-20 at 15:17:37 +0200, Krzysztof Niemiec wrote:
> > Hi Krzysztof
> > 
> > On 2026-08-20 at 07:15:23 +0000, Krzysztof Karas wrote:
> > > Hi Krzysztof,
> > > 
> > > On 2026-08-19 at 17:21:09 +0200, Krzysztof Niemiec wrote:
> > > > Add coverage for the case where the batch start offset is invalid with
> > > > multiple BOs submitted, which was buggy in the kernel until 4fe2bd195435
> > > > ("drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer")
> > > > 
> > > > Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> > > > ---
> > > > 
> > > > v2:
> > > >  - Reword comments to be more specific (Krzysztof K, Sebastian)
> > > >  - Get rid of the context id parameter (previously set in rsvd2, which
> > > >    should have been rsvd1) - which turns out isn't actually required to
> > > >    trigger the correct error path (Sebastian)
> > > >  - Capitalize sentences (Andi, off-list)
> > > > 
> > > >  tests/intel/gem_exec_params.c | 50 +++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 50 insertions(+)
> > > > 
> > > > diff --git a/tests/intel/gem_exec_params.c b/tests/intel/gem_exec_params.c
> > > > index 3ba4c530b..c405190a0 100644
> > > > --- a/tests/intel/gem_exec_params.c
> > > > +++ b/tests/intel/gem_exec_params.c
> > > > @@ -85,6 +85,8 @@
> > > >   *
> > > >   * SUBTEST: invalid-flag
> > > >   *
> > > > + * SUBTEST: invalid-offset-multiple-buffers
> > > > + *
> > > >   * SUBTEST: invalid-ring
> > > >   *
> > > >   * SUBTEST: invalid-ring2
> > > > @@ -404,6 +406,51 @@ static void test_invalid_batch_start(int fd)
> > > >  	gem_close(fd, exec.handle);
> > > >  }
> > > >  
> > > > +/*
> > > > + * This test is checking for a NULL deref in eb_release_vmas()
> > > > + * (see 4fe2bd195435 for kernel fix), which happens when multiple buffers
> > > > + * are submitted to the execbuf ioctl and some of them are invalid.
> > > > + *
> > > > + * The __gem_execbuf() call is always expected to fail with an -EINVAL,
> > > > + * because the bug mentioned above is in the error path, which is
> > > > + * deliberately triggered. Affected systems, however, will not handle it
> > > > + * cleanly and will crash with a NULL deref.
> > > > + */
> > > > +
> > > > +static void test_invalid_offset_multiple_buffers(int fd)
> > > > +{
> > > > +	struct drm_i915_gem_exec_object2 exec[2];
> > > > +	struct drm_i915_gem_execbuffer2 execbuf;
> > > > +	uint32_t size = 0x1000;
> > > Why this particular size?
> > > 
> > 
> > gem_create ioctl rounds up size to "the largest of minimum page sizes in the
> > specified memory regions" (in this case simply PAGE_SIZE), then checks
> > the alignment to PAGE_SIZE anyway. So this can be anything as long as it is
> > not 0, and most of the tests I see default to 4096 byte objects with no
> > additional explanation.
> > 
> > If 0x1000 is less readable than 4096 then I can change it
> > 
> > > > +
> > > > +	memset(exec, 0, sizeof(exec));
> > > > +	memset(&execbuf, 0, sizeof(execbuf));
> > > > +
> > > > +	exec[0].handle = batch_create_size(fd, size);
> > > > +	exec[1].handle = batch_create_size(fd, size);
> > > > +
> > > > +	/*
> > > > +	 * To test 4fe2bd195435, we need multiple buffers submitted and
> > > > +	 * eb_add_vma() to fail. eb_add_vma() checks whether
> > > > +	 * batch_start_offset + batch_len is smaller than the vma size, and
> > > > +	 * fails with -EINVAL if it isn't. Submitting two buffers and setting
> > > > +	 * the offset to the size of the first batch will trigger this
> > > > +	 * error path.
> > > > +	 */
> > > > +
> > > > +	execbuf.buffers_ptr = to_user_pointer(exec);
> > > > +	execbuf.buffer_count = 2;
> > > > +	execbuf.batch_start_offset = size;
> > > Would setting any large value as offset trigger the desired
> > > error path? Is using "size" here significant?
> > > 
> > 
> > batch_start_offset >= size triggers the error path. The actual check I'm
> > targeting [1] uses range_overflows_t() to check the interval
> > [batch_start_offset, batch_start_offset + batch_len), if it lies in [0, size)
> > (both right-open). AKA it checks if what we say is the batch is within the
> > batch's vma.
> > 
> > Any value of batch_start_offset >= size will fail the range_overflows() check,
> > triggering the failure (see [2], "Any range starting at or beyond @max
> > is considered an overflow", batch_len needn't be set with start_offset >=
> > size). I think this is the most straightforward way to fail eb_add_vma()
> > 
> > [1] https://elixir.bootlin.com/linux/v7.2/source/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c#L608-L614
> > [2] https://elixir.bootlin.com/linux/v7.2/source/include/linux/overflow.h#L235-L268
> > 
> > Thanks
> > Krzysztof
> > 
> > > > +
> > > > +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EINVAL);
> > > > +
> > > > +	gem_sync(fd, exec[0].handle);
> > > > +	gem_sync(fd, exec[1].handle);
> > > > +
> > > > +	gem_close(fd, exec[0].handle);
> > > > +	gem_close(fd, exec[1].handle);
> > > > +}
> > > > +
> > > >  static void test_larger_than_life_batch(int fd)
> > > >  {
> > > >  	const struct intel_execution_engine2 *e;
> > > > @@ -705,6 +752,9 @@ int igt_main()
> > > >  	igt_subtest("larger-than-life-batch")
> > > >  		test_larger_than_life_batch(fd);
> > > >  
> > > > +	igt_subtest("invalid-offset-multiple-buffers")
> > > > +		test_invalid_offset_multiple_buffers(fd);
> > > > +
> > > >  #define DIRT(name) \
> > > >  	igt_subtest(#name "-dirt") { \
> > > >  		execbuf.flags = 0; \
> > > > -- 
> > > > 2.55.0
> > > > 
> > > 
> > > -- 
> > > Best Regards,
> > > Krzysztof
> 
> -- 
> Best Regards,
> Krzysztof
