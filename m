Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C37C021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 10:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9248110E7AE;
	Wed, 19 Feb 2025 10:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AsL1qN33";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D4B10E7B2
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739959294; x=1771495294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DApDJ0wD0t+dhHi558UNJcrTrPgrFRiKKk4S/sbg4og=;
 b=AsL1qN33FCrUH50HPCaQ23vH7fg8AvRpEfPd6HgMEV0TFuznDlrwiCOg
 dnFtCfgVv1tSJ1YHCu89C/LCXXhWUmHxhI6hv60kHK4fksje7r+wR3TYE
 HcvX8BxExd4opywmy+ChtinGRwDlwiAWYkDA1+bw4fVDlYRCcAlLAip+8
 mjOHoUbdgYctgpCSu7VRC/dc5CDnYMxuZh95Itv6Z27IBDy0xd/x+IqA1
 RSkFaqTDjb4y7exQqonJ65dF5P1bl+wy4npE5YGPm7Z/gU71eC+Ui6uR9
 5H/6XkNCtBCk4tapjv5UAxLSt4OP1+7acKz0WnX3kpOSEDlWTRDO2xwrF A==;
X-CSE-ConnectionGUID: i7Rlb94XRKKI8bjyE1xJRA==
X-CSE-MsgGUID: TiYchk2uTyittHYVO1UovA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40899089"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40899089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:01:33 -0800
X-CSE-ConnectionGUID: fkBjnQNiQVmZaVvZuzq2DQ==
X-CSE-MsgGUID: llije/0+RBeF3/z7V/BFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145564546"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 02:01:31 -0800
Date: Wed, 19 Feb 2025 11:01:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add kms_sysfs_edid_timing to
 blocklist
Message-ID: <20250219100116.6zymykbos3gdtorr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250213132802.357921-1-swati2.sharma@intel.com>
 <20250214104530.gsqrch2pg6h6owdg@kamilkon-desk.igk.intel.com>
 <b0cc7fba-8b80-4b51-bfef-1f258dd48cbf@intel.com>
 <e1dfcb72-a747-44a3-8961-7ee6d3980718@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1dfcb72-a747-44a3-8961-7ee6d3980718@intel.com>
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
On 2025-02-19 at 13:30:23 +0530, Nautiyal, Ankit K wrote:
> 
> On 2/18/2025 1:02 PM, Sharma, Swati2 wrote:
> > Hi Kamil
> > 
> > On 14-02-2025 04:15 pm, Kamil Konieczny wrote:
> > > Hi Swati,
> > > On 2025-02-13 at 18:58:02 +0530, Swati Sharma wrote:
> > > > Add kms_sysfs_edid_timing to blocklist. Test was written with the
> > > > idea that edid read shouldn't take an unreasonable amount of time.
> > > > The timeout is an arbitrary value because it depends on when the
> > > > display responds and, in some cases, especially when the display
> > > > is coming back from sleep, it can take quite a while. This test
> > > > has sporadic behavior across various platforms connected to
> > > > different displays.
> > > > 
> > > > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > 
> > > Could such measurements be moved to tools into some generic one,
> > > like display_wakeup or display_response?
> > Even I had this proposal to move this test into tools.
> > @ankit any feedback?
> 
> Perhaps there would be some value to have a tool to get the measurement.
> 
> I agree on adding the test to the CI blocklist to reduce noise due to this
> test.
> 
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> 
> 

Thank you, applied.

Regards,
Kamil

[...cut...]
