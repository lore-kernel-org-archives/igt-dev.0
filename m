Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0160CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 05:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C8510E062;
	Wed, 18 Sep 2024 05:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m45WIqA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BC910E062
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 05:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726636898; x=1758172898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z/UqVYYCQHrohll/hNWL62cHBX2q/v7wtz+2BCf6BPg=;
 b=m45WIqA8KLzCPDhSL7bq3LdW9UyacIoXogAgMQyGQ71Xb2r5d8bLRX3C
 LEYwCrZdaVBLZJGQjnyXvGNO7wpOwXvQDgKJrVgM1NEySKaCHruUPhi7K
 eLYI3ccMozy4rA57LbtQ3XVI7rV/1Jy5zDw0RLNMRzvBsoxe+bCsiXmyH
 /aGtfCLMsb50rNYe/qZwlWPIflV5CxB7SEKiZopudlOgo3WTiPfq5kwHk
 s35stbBzU0ueObBiqSJmSUMSOWz11UzwvouXz88AY+NKMEBdyyF4ezhgJ
 4SYiolXRDC0P/I9V70llCbmFN05qA0Yu7ZmbM1qt0J/TcUvaxsRAggtlV w==;
X-CSE-ConnectionGUID: eqnYTdscSL234/S/l9DQ3g==
X-CSE-MsgGUID: 9AUbCyzZQPe7zhMUs2yZMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25406501"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25406501"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 22:21:38 -0700
X-CSE-ConnectionGUID: gp1Vb3lmThS53SVBr2gxZw==
X-CSE-MsgGUID: 3IGCfJ7JS0+1CTqzk/Ijbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69048632"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.189])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 22:21:34 -0700
Date: Wed, 18 Sep 2024 07:21:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Cc: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v6 16/17] tests/xe_eudebug_online: Debug client
 which runs workloads on EU
Message-ID: <20240918052131.oemx53fsszye7eno@zkempczy-mobl2>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
 <20240905092812.94553-17-christoph.manszewski@intel.com>
 <20240913113902.pdjcijg3ra6ej7ec@zkempczy-mobl2>
 <dc2e936b96901d45b31b15f77e4e9e69f6483543.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc2e936b96901d45b31b15f77e4e9e69f6483543.camel@intel.com>
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

On Tue, Sep 17, 2024 at 09:34:20PM +0200, Grzegorzek, Dominik wrote:

<cut>

> > > +/**
> > > + * SUBTEST: preempt-breakpoint
> > > + * Description:
> > > + *	Verify that eu debugger disables preemption timeout to
> > > + *	prevent reset of workload stopped on breakpoint.
> > > + */
> > > +static void test_preemption(int fd, struct drm_xe_engine_class_instance *hwe)
> > > +{
> > > +	int flags = SHADER_BREAKPOINT | TRIGGER_RESUME_DELAYED;
> > > +	struct xe_eudebug_session *s;
> > > +	struct online_debug_data *data;
> > > +	struct xe_eudebug_client *other;
> > > +
> > > +	data = online_debug_data_create(hwe);
> > > +	s = xe_eudebug_session_create(fd, run_online_client, flags, data);
> > > +	other = xe_eudebug_client_create(fd, run_online_client, SHADER_NOP, data);
> > > +
> > > +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> > > +					eu_attention_debug_trigger);
> > > +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> > > +					eu_attention_resume_trigger);
> > > +	xe_eudebug_debugger_add_trigger(s->debugger, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> > > +					ufence_ack_trigger);
> > > +
> > > +	igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 0);
> > > +	xe_eudebug_debugger_start_worker(s->debugger);
> > > +
> > > +	xe_eudebug_client_start(s->client);
> > > +	sleep(1); /* make sure s->client starts first */
> > 
> > If client would write token it has started this sleep wouldn't be
> > necessary. I mean inside xe_eudebug_client_start() do
> > token_signal/wait_for_client.
> To ensure that the first client executes its workload first, we would need to signal it after
> calling xe_exec. This means that the signaling would need to be incorporated within the client's
> work function. We cannot place wait_for_client inside the generic xe_eudebug_client_start() because
> the work function is defined by the caller. While I could implement a similar mechanism specifically
> for this test, it would require creating a brand new run_online_client()-like function or adding
> wait_for_client in every test that reuses run_online_client(). I decided to keep it simple, albeit
> imperfect. Let me know if you would rather have it changed. 

Ok, now I understand. That's not the client process start is interesting from
our point of view (that's why I suggested to inform caller that is created)
but xe_exec() itself. Signalling to the spawner xe_exec() was called is not
so easy with current code shape. sleep(1) is however long time and likely
first client will start its execution before 'other' (I'm not sure shouldn't
it be called 'another', but that's not important).

Keep as it is now. If we encounter the race win by 'other' then we'll think
how to prevent this.

--

Zbigniew

