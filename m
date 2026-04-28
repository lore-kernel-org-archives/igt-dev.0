Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A4AFF886C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 08:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC72C10E30E;
	Tue, 28 Apr 2026 08:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hP2Zm0D7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5446010E30E
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777365199; x=1808901199;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KYjY6gp1mkUlra37GqnWjT452Zl6qJB8NH7OKZtLn9Y=;
 b=hP2Zm0D7FMxQtSKU+uhcHQtxccAN7qpug93EElj0l520ORn5lH8LdxOw
 HoNZy95cNRlgguJ4EJGpo0R8G9bBoXmpGgXIItlDumCLlz8MR9MA8DPeI
 MuDuRShbGEX9jPESNXV+q/8dsl4s/P4YQ/7mOwXQ9MVpi29p6nYDCiX/h
 tlL12lCCq4MwK0Nar/NzMP/NX9KdorNNM0x0E744gEq62FBji0+ZTqwoY
 JeiySzfNoIKJ7Zux6GUUaYmPe5YQ5l2Mbkl7L0HlTA2rxnoxIBfGg4Umx
 undZ1MxgrW9vspW3AA6XM29rkjTKb9U3fRHnWtPD+XrNUpaGK8QgBhkpW Q==;
X-CSE-ConnectionGUID: QkgpBi6mSrqx8wdW1ZBFQA==
X-CSE-MsgGUID: ONLjyDx6RiWLjd+CA60E5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89727433"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="89727433"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 01:33:19 -0700
X-CSE-ConnectionGUID: O8udjXngRvuDICp+WZ3/bw==
X-CSE-MsgGUID: oVbcbIeWQ+mnIwuUo3KhhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="238226897"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 01:33:18 -0700
Date: Tue, 28 Apr 2026 10:32:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com
Subject: Re: [PATCH i-g-t 5/8] tools/intel_vbt_defs: sync intel_vbt_defs.h
 with kernel commit 1b85a9b04681
Message-ID: <20260428083258.6nunbdfmavzo42iw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
 <20260427124607.3115567-6-ankit.k.nautiyal@intel.com>
 <20260427144130.uiqrfekvsovvzknm@kamilkon-DESK.igk.intel.com>
 <e9388540-8fa6-497f-a0ce-941c321bea8c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9388540-8fa6-497f-a0ce-941c321bea8c@intel.com>
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

Hi Nautiyal,,
On 2026-04-28 at 09:27:34 +0530, Nautiyal, Ankit K wrote:
> 
> On 4/27/2026 8:11 PM, Kamil Konieczny wrote:
> > Hi Ankit,
> > On 2026-04-27 at 18:16:04 +0530, Ankit Nautiyal wrote:
> > > Synchronize intel_vbt_defs.h with kernel commit:
> > > 
> > > 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
> > > 
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> > Please squash changes into one commit, with desccription like:
> > 
> > Synchronize intel_vbt_defs.h with kernel up to commit 1b85a9b04681,
> > this will bring up following changes:
> > 
> > 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
> > 203c7904f2d8 ("drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc")
> > 4d33c77cf2c3 ("drm/i915/vbt: Add eDP Data rate overrride field in VBT")
> 
> Thanks Kamil.
> 
> These commits were generated using Jani’s sync script, which intentionally
> produces one IGT commit per kernel commit touching intel_vbt_defs.h.
> 
> If the preferred style here is a single squashed commit instead, I can
> squash these and resend.
> 

For a few it do not matter but for more than, say, five, I would
prefer a single squashed one. Btw no need for resend, it could be
squashed at merge time.

Regards,
Kamil

> 
> Regards,
> 
> Ankit
> 
> 
> > 
> > imho you coud keep r-b from Karthik.
> > 
> > Regards,
> > Kamil
> > 
> > > ---
> > >   tools/intel_vbt_defs.h | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
> > > index 57fda5824c9c..0dc13d080e8a 100644
> > > --- a/tools/intel_vbt_defs.h
> > > +++ b/tools/intel_vbt_defs.h
> > > @@ -1109,6 +1109,7 @@ struct bdb_edp {
> > >   	u16 edp_dsc_disable;					/* 251+ */
> > >   	u16 t6_delay_support;					/* 260+ */
> > >   	u16 link_idle_time[16];					/* 260+ */
> > > +	u16 pipe_joiner_enable;					/* 261+ */
> > >   } __packed;
> > >   /*
> > > -- 
> > > 2.45.2
> > > 
