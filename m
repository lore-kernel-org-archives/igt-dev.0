Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A69CAC5B8
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 04:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6740510E146;
	Wed, 18 Sep 2024 04:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmQkzh+i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3623710E062
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 04:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726634852; x=1758170852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NR/4M4ukabv9EJsMn3aeh6bbXO+APuDxfzha5BmTYuM=;
 b=YmQkzh+ifcrcCpiTUygZjdN9j20PW+76PZ4kPsVoGqlwurjpC2FaiUyB
 tIKKN4GxGn9ro787Wrm4qtC3mBdmS+phkUb8hCxDWfoUY2PSVAjftoR3F
 n2F40Yr5VsgKzfS5eOwFESnSllaEYRtXInY2Q3ea+VGpWfVI4nBpzM3V2
 DZXK2eUPX2+lYUgg+vFyWNMAJg1CpwqpNKE6V4jUEMSeGaVJ5cerWmAIK
 xlUsHkP6BztYexVslgnKii/52Fc/cTRmU3lwGqzYxBpehypK1ARaWFhvA
 ThRw2iOGZhPw9UZPquIfoDuJFFhximKlhmVYNiiOjUx2AnKuq7E4rSFPa g==;
X-CSE-ConnectionGUID: 6EDHMEXOTtS0FywF66I9rg==
X-CSE-MsgGUID: mc64sZ7bSjOf0+OFeX2lzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25684099"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25684099"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 21:47:32 -0700
X-CSE-ConnectionGUID: pUmysW95Tcu6JkpdzUbtrQ==
X-CSE-MsgGUID: wxji+3zSRFaZ9kuxlog+zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69404349"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 21:47:28 -0700
Date: Wed, 18 Sep 2024 06:47:25 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v6 13/17] tests/xe_eudebug: Test eudebug resource
 tracking and manipulation
Message-ID: <20240918044725.44mk2o3z3gvqs4r5@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-14-christoph.manszewski@intel.com>
 <20240912080410.sv5dj555zccodlty@zkempczy-mobl2>
 <0546baa9-6cdb-4379-8b82-e47990866532@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0546baa9-6cdb-4379-8b82-e47990866532@intel.com>
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

On Tue, Sep 17, 2024 at 06:00:51PM +0200, Manszewski, Christoph wrote:
> Hi Zbigniew,
> 
> On 12.09.2024 10:04, Zbigniew Kempczyński wrote:
> > On Thu, Sep 05, 2024 at 11:28:08AM +0200, Christoph Manszewski wrote:
> > > From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > > 
> > > For typical debugging under gdb one can specify two main usecases:
> > > accessing and manupulating resources created by the application and
> > > manipulating thread execution (interrupting and setting breakpoints).
> > > 
> > > This test adds coverage for the former by checking that:
> > > - the debugger reports the expected events for Xe resources created
> > > by the debugged client,
> > > - the debugger is able to read and write the vm of the debugged client.
> > 
> > Hi all.
> > 
> > First of all, on Mika series (v2) sent upstream on xe ml I've noticed
> > some tests are crashing the kernel. From this test perspective this is
> > good, it seems test is doing what it should do. I observe reboot on
> > vm access related subtests: basic-vm-access(-userptr).
> > 
> > > 
> > > Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> > > Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > >   docs/testplan/meson.build |   13 +-
> > >   meson_options.txt         |    2 +-
> > >   tests/intel/xe_eudebug.c  | 2716 +++++++++++++++++++++++++++++++++++++
> > >   tests/meson.build         |    8 +
> > >   4 files changed, 2737 insertions(+), 2 deletions(-)
> > >   create mode 100644 tests/intel/xe_eudebug.c
> > > 
> 
> <cut>
> 
> > > +
> > > +static void vm_bind_clear_test_trigger(struct xe_eudebug_debugger *d,
> > > +				       struct drm_xe_eudebug_event *e)
> > > +{
> > > +	struct drm_xe_eudebug_event_vm_bind_op *eo = (void *)e;
> > > +	struct vm_bind_clear_priv *priv = d->ptr;
> > > +
> > > +	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
> > > +		if (random() & 1) {
> > 
> > What's that random() doing here?
> 
> Apparently this test is supposed to catch a race, where either the client or
> the debugger see some leftover in a new bind. To increase the chance of this
> happening, we need to skip the debugger's vm_open on a preceeding iteration,
> since otherwise we slow down/defer the subsequent bind.

I would add some igt_debug() to get the context in which "random" part
test was executed. This will make it reproducing easier.

--
Zbigniew

> 
> Thanks,
> Christoph
> > 
> > > +			struct drm_xe_eudebug_vm_open vo = { 0, };
> > > +			uint32_t v = 0xc1c1c1c1;
> > > +
> > > +			struct drm_xe_eudebug_event_vm_bind *eb;
> > > +			int fd, delta, r;
> > > +
> > > +			igt_debug("vm bind op event received with ref %lld, addr 0x%llx, range 0x%llx\n",
> > > +				  eo->vm_bind_ref_seqno, eo->addr, eo->range);
> > > +
> > > +			eb = (struct drm_xe_eudebug_event_vm_bind *)
> > > +				xe_eudebug_event_log_find_seqno(d->log, eo->vm_bind_ref_seqno);
> > > +			igt_assert(eb);
> > > +
> > > +			vo.client_handle = eb->client_handle;
> > > +			vo.vm_handle = eb->vm_handle;
> > > +
> > > +			fd = igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
> > > +			igt_assert_lte(0, fd);
> > > +
> > > +			delta = (random() % eo->range) & -4;
> > > +			r = pread(fd, &v, sizeof(v), eo->addr + delta);
> > > +			igt_assert_eq(r, sizeof(v));
> > > +			igt_assert_eq_u32(v, 0);
> > > +
> > > +			close(fd);
> > > +		}
> > > +		priv->bind_count++;
> > > +	}
> > > +
> > > +	if (e->flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
> > > +		priv->unbind_count++;
> > > +}
> > > +
> > > +static void vm_bind_clear_ack_trigger(struct xe_eudebug_debugger *d,
> > > +				      struct drm_xe_eudebug_event *e)
> > > +{
> > > +	struct drm_xe_eudebug_event_vm_bind_ufence *ef = (void *)e;
> > > +
> > > +	xe_eudebug_ack_ufence(d->fd, ef);
> > > +}
> > > +
> > > +/**
> > > + * SUBTEST: vm-bind-clear
> > > + * Description:
> > > + *      Check that fresh buffers we vm_bind into the ppGTT are always clear.
> > > + */
> > > +static void test_vm_bind_clear(int fd)
> > > +{
> > > +	struct vm_bind_clear_priv *priv;
> > > +	struct xe_eudebug_session *s;
> > > +
> > > +	priv = vm_bind_clear_priv_create();
> > > +	s = xe_eudebug_session_create(fd, vm_bind_clear_client, 0, priv);
> > > +
> > > +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
> > > +					vm_bind_clear_test_trigger);
> > > +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> > > +					vm_bind_clear_ack_trigger);
> > > +
> > > +	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
> > > +	xe_eudebug_debugger_start_worker(s->debugger);
> > > +	xe_eudebug_client_start(s->client);
> > > +
> > > +	xe_eudebug_client_wait_done(s->client);
> > > +	xe_eudebug_debugger_stop_worker(s->debugger, 1);
> > > +
> > > +	igt_assert_eq(priv->bind_count, priv->unbind_count);
> > > +	igt_assert_eq(priv->sum * 2, priv->bind_count);
> > > +
> > > +	xe_eudebug_session_destroy(s);
> > > +	vm_bind_clear_priv_destroy(priv);
> > > +}
> > > +
> 
> <cut>
