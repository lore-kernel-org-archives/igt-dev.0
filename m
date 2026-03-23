Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9A2F46126
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 14:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8341D10E200;
	Mon, 23 Mar 2026 14:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l01J20YD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE8610E200
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774275196; x=1805811196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F70lAdSRJnTfYaG9y0/Vv33rU/zuslZeAl/DCctGKFI=;
 b=l01J20YD3KptpfCcIvEVhVkYIOqMMnzr5Pa5qGeYRpWgSi1m3M4Dh0Qe
 CD6BLKECqFOFucwlVyytr98H0vVWKXei+kHeOQh23xft44G40XKqMcho+
 VuYoy8QdSpVVfuvoFjMkYlCmgv7YKJ7SlZ33FY0basmPNanNWBFgbUGfQ
 NI4O9MUyXPctAhc75lfVyzkFG3x2sfx5JWXx6hdb1LEJ2EAPT3oLr5GPe
 0fgykCPt3OPLF+YhpcGt1SFBe/6hVOsJ3MWlO2BfFFaIpGB8fKDc8F3ia
 iAGl0JY8v0Z0786b2sW3p/oVr/Ic5ZWavnVb5FT6ypaqZ3AByIDgj/RY0 Q==;
X-CSE-ConnectionGUID: XoyICoKDRCm9Fj7iBG9ptw==
X-CSE-MsgGUID: 1WBDxQXfT8SogOenjcYUQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="92846661"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="92846661"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:13:15 -0700
X-CSE-ConnectionGUID: CXQbjJEQTPmrkDMVg+IP7Q==
X-CSE-MsgGUID: 50EKmcapTuCFCEoFwiG66w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="219667752"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 07:13:13 -0700
Date: Mon, 23 Mar 2026 15:12:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
Message-ID: <20260323141257.ss52i45h7jc72m6p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Anirban, Sk" <sk.anirban@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com
References: <20260323070228.1383377-2-sk.anirban@intel.com>
 <a59e6c3b70eccfa43a5902bb089f9e799b1df68a@intel.com>
 <e9e96a80-5a0f-4aad-8b29-e5ff9fd09ddb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e9e96a80-5a0f-4aad-8b29-e5ff9fd09ddb@intel.com>
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

Hi Anirban,,
On 2026-03-23 at 15:11:07 +0530, Anirban, Sk wrote:
> Hi,
> 
> On 23-03-2026 03:00 pm, Jani Nikula wrote:
> > On Mon, 23 Mar 2026, Sk Anirban <sk.anirban@intel.com> wrote:
> > > Fix the unit mismatch caused by interpreting seconds as milliseconds
> > > during suspend duration calculations. Apply MSEC_PER_SEC multiplier
> > > to ensure correct unit handling.
> > > 
> > Fixes: ?
> The change is a part of test gap which is filed internally.
> 
> Thanks,
> 
> Anirban
> 

Do you have a GitLab issue in public xe-kms or igt?
If yes, you could added a Link: or Closes: tag.

Regards,
Kamil

> > 
> > > Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> > > ---
> > >   tests/intel/xe_pm_residency.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> > > index 61b63ed4f..46718a444 100644
> > > --- a/tests/intel/xe_pm_residency.c
> > > +++ b/tests/intel/xe_pm_residency.c
> > > @@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
> > >   		 * elapsed time during suspend is approximately equal to autoresume delay
> > >   		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
> > >   		 */
> > > -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
> > > +		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;
> > >   		residency_start = read_idle_residency(fd, gt);
> > >   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
> > >   		residency_end = read_idle_residency(fd, gt);
