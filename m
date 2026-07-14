Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90491C44501
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 16:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298B410E6CD;
	Tue, 14 Jul 2026 16:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXcECVu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEC910E6CD
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784047028; x=1815583028;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aTVPlFNZhaETWMivf9zJMsXUSZnTaqRXhFIYtmZpBwc=;
 b=DXcECVu7/c0PzB7oB6lHbEla/RxuUPYQYG+gPlzXiFj5bzaCqAFBiAOc
 atUshvFKvk8GPqxSh/kVsTaDFpxYkONDoMsEDA84d9oOCC1pKUkYDSpPt
 ZNH+MbhXv/NILg4NbqQZ0qMn55a1YOGB69yNSbo3m7GNKqpmFgJWZCCYm
 NV9MIu4qx82E4KZn2YuIUT/8tSX4wvd9IfKdeAEaO5bEng0hd91FRok6e
 cHG9XuOUUbg9yS5oZM9gGkJ5pj8GP0mZAB1MfEBUAduycYULufMKSJLgx
 Wi8DUPUZ/8r+b1GMkrKffNS6bQXUqVqRpr/CvvRzHn3pEoMfTqK9JF9Gk Q==;
X-CSE-ConnectionGUID: SPe4GqWySE2Gnox9JzQjaA==
X-CSE-MsgGUID: FBwYTR5dRPmwMhhhKhyy8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84557465"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84557465"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 09:37:07 -0700
X-CSE-ConnectionGUID: 8Ze8yZVkS9CHqF61SyVOhw==
X-CSE-MsgGUID: 1/V+QcJWQJOINLUESHVtoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="280331523"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 09:37:05 -0700
Date: Tue, 14 Jul 2026 18:37:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 Lancelot Wu =?utf-8?B?KOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t v3 1/2] lib/igt_pm: Add CPU idle state control for
 vblank timing stability
Message-ID: <20260714163702.sz6pwsve7ormawdg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 Lancelot Wu =?utf-8?B?KOWQs+eRi+aZnyk=?= <Lancelot.Wu@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
References: <20260710095358.2518446-1-jason-jh.lin@mediatek.com>
 <20260710095358.2518446-2-jason-jh.lin@mediatek.com>
 <20260713120828.afnxibf3ct4hteea@kamilkon-DESK.igk.intel.com>
 <f2ccf5de8b8f1ae3ec0d7198ef4ce29534f85afc.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2ccf5de8b8f1ae3ec0d7198ef4ce29534f85afc.camel@mediatek.com>
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

Hi Jason-JH,
On 2026-07-14 at 07:53:39 +0000, Jason-JH Lin (林睿祥) wrote:
> On Mon, 2026-07-13 at 14:08 +0200, Kamil Konieczny wrote:
> > Hi Jason-JH,
> > On 2026-07-10 at 17:52:47 +0800, Jason-JH Lin wrote:
> > > Add igt_pm_disable_cpu_deep_sleep() and
> > > igt_pm_enable_cpu_deep_sleep()
> > > APIs to control deep CPU idle states (C-states) via sysfs. This
> > > prevents
> > > IRQ latency spikes that affect vblank timestamp acquisition.
> > > 
> > > The functions control state1 and deeper states on all CPUs while
> > > keeping
> > > state0 (WFI) unchanged, providing a balance between timing accuracy
> > > and
> > > power efficiency.
> > > 
> > > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > > ---
> > >  lib/igt_pm.c | 75
> > > ++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/igt_pm.h |  2 ++
> > >  2 files changed, 77 insertions(+)
> > > 
> > > diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> > > index 64b15dd08302..7a8ad8ae3dea 100644
> > > --- a/lib/igt_pm.c
> > > +++ b/lib/igt_pm.c
> > > @@ -1713,3 +1713,78 @@ unsigned int igt_read_pkgc_counter(int
> > > debugfs_root_fd)
> > >  
> > >  	return igt_get_dc_counter(str);
> > >  }
> > > +
> > > +static bool igt_pm_cpu_deep_sleep_control(bool disable)
> > 
> > Please do not use bool params. See below.
> > 
> > > +{
> > > +	char cpu_path[256];
> > > +	char state_path[512];
> > > +	int cpu, state;
> > > +	int count = 0;
> > > +	FILE *fp;
> > > +	const char *value = disable ? "1" : "0";
> > 
> > Pass it as param.
> > 
> > > +	const char *action = disable ? "Disabled" : "Restored";
> > 
> > Same here:
> > 
> > static bool igt_pm_cpu_deep_sleep_control(char *val, char *msg)
> > 
> 
> OK, I'll modify it.
> 
> > > +
> > > +	/* Control state1 and deeper for all CPUs */
> > > +	for (cpu = 0; cpu < 256; cpu++) {
> > 
> > Should you read this '256' dynamically? Or make it a define or
> > const int. Another idea below.
> > 
> > > +		snprintf(cpu_path, sizeof(cpu_path),
> > > +			 "/sys/devices/system/cpu/cpu%d", cpu);
> > > +
> > > +		/* Check if CPU exists */
> > > +		if (access(cpu_path, F_OK) != 0)
> > > +			break;
> > 
> > Why not just readdir and match files starting with "cpu%d"?
> 
> OK, I'll change to readdir instead of using a const int for cpu%d.
> 
> > 
> > > +
> > > +		/* Control state1 and deeper (keep state0 WFI
> > > unchanged) */
> > > +		for (state = 1; state < 10; state++) {
> > > +			snprintf(state_path, sizeof(state_path),
> > > +				 "%s/cpuidle/state%d/disable",
> > > cpu_path, state);
> > > +
> > > +			if (access(state_path, W_OK) != 0)
> > > +				break;
> > > +
> > > +			/* Write '1' to disable, '0' to enable */
> > > +			fp = fopen(state_path, "w");
> > > +			if (fp) {
> > > +				fprintf(fp, "%s", value);
> > > +				fclose(fp);
> > > +				count++;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	if (count > 0)
> > > +		igt_info("%s deep CPU idle states for %d CPU/state
> > > combinations\n",
> > > +			 action, count);
> > > +	else
> > > +		igt_warn("No CPU idle states found to control\n");
> > 
> > Why warning here? What if by default idle states are turned off?
> > Btw when you run this in exit proc, any warn is unexpected and
> > useless.
> 
> OK, I'll remove the warning here.
> 
> > 
> > > +
> > > +	return count > 0;
> > > +}
> > > +
> > > +/**
> > > + * igt_pm_disable_cpu_deep_sleep:
> > > + *
> > > + * Disables deep CPU idle states (C-states) to prevent IRQ latency
> > > spikes
> > > + * during vblank events. This is a system-wide operation that
> > > affects all CPUs.
> > > + *
> > > + * Disables state1 and deeper states while keeping state0 (WFI)
> > > unchanged
> > > + * to ensure stable vblank timing.
> > > + *
> > > + * Returns: true on success, false on failure
> > > + */
> > > +bool igt_pm_disable_cpu_deep_sleep(void)
> > > +{
> > > +	return igt_pm_cpu_deep_sleep_control(true);
> > 
> > igt_pm_cpu_deep_sleep_control("1", "Disabled")
> > 
> > > +}
> > > +
> > > +/**
> > > + * igt_pm_enable_cpu_deep_sleep:
> > > + *
> > > + * Re-enables deep CPU idle states (C-states) that were previously
> > > disabled
> > > + * by igt_pm_disable_cpu_deep_sleep(). This restores power-saving
> > > idle states.
> > > + *
> > > + * Returns: true on success, false on failure
> > > + */
> > > +bool igt_pm_enable_cpu_deep_sleep(void)
> > > +{
> > > +	return igt_pm_cpu_deep_sleep_control(false);
> > 
> > igt_pm_cpu_deep_sleep_control("0", "Enabled")
> > 
> 
> I think we can use one parameter to make it simpler and reduce
> confusion.
> 
> E,g.
> igt_pm_cpu_deep_sleep_control("Enabled");

If you could write this as a string to cpu sysfs file
then yes, if not rather avoid it. E.g. this looks bad:
if (strcmp(param, "Enabled"))
	w = "0";
else
	w = "1";

Regards,
Kamil

> 
> What do you think?
> 
> Regards,
> Jason-JH Lin
> 
> > Regards,
> > Kamil
