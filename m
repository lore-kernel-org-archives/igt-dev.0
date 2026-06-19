Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45541CD98F2
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 15:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE4F10E0AD;
	Fri, 19 Jun 2026 15:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THdOHazL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881D710E0A4
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781881720; x=1813417720;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vpQwWfHqprbGTAD/fqCCZrvS252iZyJZPbQO/O0ZUt8=;
 b=THdOHazLYN0b7tGT5Gso2NLuFVZB3a6Qe5yZuDePdVmpxVqxs7YUG500
 SSbuKXDfDH3WmT2CqzDFekIsiYepKGCspjZp5QKnDdICzAPCvIeFr1C/i
 3CCv5A4liv4Uirx+zUBHjrf0asOm3HvGCcfOS9Ao2rRdyCn0joYo6fXwS
 3O1CIxA+7VYeuXQGnIqxaPLjXto2Lhww4wjzpBQIBxnDAveDuEcZjFp1y
 LsMIx65qVEVFm82RaQ8iN6Joqkild7NP0qO+b2gXKzDZLzs0xJwNlahqi
 zk/3vLQQZCRiDfNofo4rpmpp3+zofpnGxmepf3sieOHwqdZgUBuXU5mEO A==;
X-CSE-ConnectionGUID: lPzpGuupQACfcfaBxjo9TA==
X-CSE-MsgGUID: 05Smp9EXS7K5mrlD3wfYOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93382708"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="93382708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 08:08:40 -0700
X-CSE-ConnectionGUID: BKLd5ksrSwGRwKuu71tAlw==
X-CSE-MsgGUID: fDbCoEtkSkqn2EMQvBB9vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="272342088"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 08:08:37 -0700
Date: Fri, 19 Jun 2026 17:08:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] tests/panthor/panthor_vm: Add vm_bind
 intersect-with-kbo-range test
Message-ID: <20260619150834.s7vl4cezhpu5vdit@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
 <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
 <20260617124948.buvoihk3cnxltx5e@kamilkon-DESK.igk.intel.com>
 <178187573439.1919959.16101885483682467264.b4-reply@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178187573439.1919959.16101885483682467264.b4-reply@b4>
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

Hi Adrián,
On 2026-06-19 at 14:28:54 +0100, Adrián Larumbe wrote:
> On 2026-06-17 14:49:48+02:00, Kamil Konieczny wrote:
> > Hi Adrián,
> > On 2026-06-16 at 16:43:23 +0100, Adrián Larumbe wrote:
> > 
> > > Users of vm_bind ioctl() should never specify a VA region that intersects
> > > with that reserved for internal kernel BOs.
> > > 
> > > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > > ---
> > >  tests/panthor/panthor_vm.c | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> > > index 92b105b9e83a..9548dbcbaa45 100644
> > > --- a/tests/panthor/panthor_vm.c
> > > +++ b/tests/panthor/panthor_vm.c
> > > @@ -270,6 +270,23 @@ int igt_main() {
> > >  		igt_panthor_vm_destroy(fd, vm_id, 0);
> > >  	}
> > >  
> > > +	igt_describe("Perform a vm_bind in the VM's kernel BOs reserved range");
> > > +	igt_subtest("vm_bind_intersect_kbo_range") {
> > 
> > In our Intel tests we use '-' as word separator, so there is
> > igt@this_is_test_name@and-this-is-subtest-name
> > 
> > But it is only out naming convention, yours can differ.

s/out/ours/

> 
> It seems all existing Panthor tests follow the 'all underscores' naming model.
> If you want I could change them all to fit the Intel pattern, but I guess that's
> best done in a separate patch series.

No need for change, just be consitent in your naming.

Regards,
Kamil

> 
> > LGTM
> > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Regards,
> > Kamil
> > 
> > PS. I could merge it now or should I wait for others to review?
> 
> 
