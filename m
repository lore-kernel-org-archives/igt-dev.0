Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA89BC47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 10:55:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455091127EE;
	Mon, 29 Jan 2024 10:55:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500471127EE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706525744; x=1738061744;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WPoNSK0D7COX7rHQ3SOR6u04wLL4MplVqWUdvp+yqZw=;
 b=BltkQkaTsgRDgBT7TY0g4oKYtYk/nBGNkvha4f0zC5MXos8af7A1RpUz
 4s69QlDCeVCzA2q/Hdd4uczGSCYvRKdvqzkskztzafizydKhbnqpLqI3K
 hzCsVngCb2C2h87NyuNjk9yDjNUw9grzXkqWhdXEwvE6bT1oG/jM6Wq6R
 Ajsao+c5mrOnAoJwLAZBUol+NoMjoKyuIoSCP/MNv6JOV99U+ZaNppXby
 rQ/Ib8CVnPbvEX0Cs8pz76/iYyhJ+xu3u5HD/g/w4ushfkzES5CphGJpk
 69NgcaiDg5rH1Sl5Nm7DLH1yJc+15Puna+Zcyj+0aXFJa04OB2HVVv+jA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10030266"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10030266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:55:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="36091574"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:55:42 -0800
Date: Mon, 29 Jan 2024 11:55:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_exec_atomic: Skip on unsupported
 config
Message-ID: <20240129105525.ytxcchtjvvr3lnig@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>,
 janga.rahul.kumar@intel.com
References: <20240129080155.31648-1-nirmoy.das@intel.com>
 <20240129084706.4abndzwylmz6z4pe@kamilkon-desk.igk.intel.com>
 <266dbc80-7c5c-48e7-ac4e-4aed3bd9f5a6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <266dbc80-7c5c-48e7-ac4e-4aed3bd9f5a6@intel.com>
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Nirmoy,
On 2024-01-29 at 14:39:17 +0530, Nirmoy Das wrote:
> 
> On 1/29/2024 2:17 PM, Kamil Konieczny wrote:
> > Hi Nirmoy,
> > On 2024-01-29 at 09:01:55 +0100, Nirmoy Das wrote:
> > > Atomics on system memory for dGPU is not functional
> > > at this moment hence skip on such configuration.
> > > 
> > > v2: remove the skip_on.
> > > 
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Thanks, Kamil. Please also help me  merge this one. Currently I don't have
> access to my devel machine.
> 
> 
> Nirmoy
> 

I will wait for GitLab merge and xeBAT tests.
While at this I will also change subject, you removed skip so:

[PATCH i-g-t v2] tests/intel/xe_exec_atomic: don't test system memory

Regards,
Kamil

> > 
> > > ---
> > >   tests/intel/xe_exec_atomic.c | 9 ++++-----
> > >   1 file changed, 4 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
> > > index 7ee80816c..48c70ec72 100644
> > > --- a/tests/intel/xe_exec_atomic.c
> > > +++ b/tests/intel/xe_exec_atomic.c
> > > @@ -112,9 +112,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
> > >   static bool has_atomics(int fd, uint32_t region)
> > >   {
> > > -	/* System memory atomics on PVC doesn't work */
> > > -	if (region == system_memory(fd) &&
> > > -	    IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
> > > +	/* System memory atomics on dGPU is not functional as of now */
> > > +	if (region == system_memory(fd) && xe_has_vram(fd))
> > >   		return false;
> > >   	return true;
> > > @@ -135,8 +134,8 @@ igt_main
> > >   			uint64_t memreg = all_memory_regions(fd), region;
> > >   			xe_for_each_mem_region(fd, memreg, region) {
> > > -
> > > -				igt_skip_on(!has_atomics(fd, region));
> > > +				if (!has_atomics(fd, region))
> > > +					continue;
> > >   				igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d-%s-memory",
> > >   					      xe_engine_class_string(hwe->engine_class),
> > > -- 
> > > 2.42.0
> > > 
