Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C92CD5BA4
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 16:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E0A10E190;
	Wed, 20 May 2026 16:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NQUA7afu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E0310E190
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 16:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779296113; x=1810832113;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=X5GrbYEEIy8oAamfAO78nb9iWGut3h8BkGmmZYfdp7g=;
 b=NQUA7afulqqLcmCNUUxkLoK5SuREfgnx/aupi+adbcf75X8p9q7ZPH94
 jMni1GVL7+7Pn1Aee4CyvgpLfiXooFuVvhkgQiMSAIO3jvCOO3PNpVDOj
 8ztUzLgfuQZLNEeJizqTYd9mLMOY03VNdCgK+PTpj/Jp4OcK2tQbuiNp2
 W+ignCNr5y6z+lOT2iZXH3FM1Z8F16w91SAb3yBX0gbgMKGz+Xz5o90cf
 xCc9w2PqyE6JhDce06msRh2L2u5698CTudnc62Dx2elPsNSre24AL/oWx
 oIZg+s8hesxf4sh0HEbMH918qdJOiGRaV4iO2AJzg4dHW+hk0YMTazJBS g==;
X-CSE-ConnectionGUID: zoAyHgUFRNKSHBkgNin8/Q==
X-CSE-MsgGUID: rAR83HAARkyMAczqltcx+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79350675"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="79350675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 09:55:13 -0700
X-CSE-ConnectionGUID: Mnv3LV7QSjazr0vvppTCcA==
X-CSE-MsgGUID: 0inN14FOScSspQB8MYIF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="242051768"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 09:55:09 -0700
Date: Wed, 20 May 2026 18:55:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add igt_disable_cpu_deep_sleep()
 to control CPU C-states
Message-ID: <20260520165507.loxmzhej3rvrg7p7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "gildekel@google.com" <gildekel@google.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "navaremanasi@google.com" <navaremanasi@google.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
References: <20260520064651.3266598-1-jason-jh.lin@mediatek.com>
 <20260520064651.3266598-2-jason-jh.lin@mediatek.com>
 <20260520094837.g3d333dbkd5wntqc@kamilkon-DESK.igk.intel.com>
 <4e16a5e72e2201d71586851a9496a90ff8dbcd39.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e16a5e72e2201d71586851a9496a90ff8dbcd39.camel@mediatek.com>
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
On 2026-05-20 at 10:17:13 +0000, Jason-JH Lin (林睿祥) wrote:
> [snip]
> 
> > > --- a/lib/igt_kms.c
> > > +++ b/lib/igt_kms.c
> > > @@ -6776,6 +6776,72 @@ bool igt_check_output_bpc_equal(igt_crtc_t
> > > *crtc, igt_output_t *output,
> > >  	return (current == bpc);
> > >  }
> > >  
> > > +/**
> > > + * igt_disable_cpu_deep_sleep:
> > > + * @fd: DRM device file descriptor
> > > + * @disable: true to disable deep sleep states, false to restore
> > > them
> > > + *
> > > + * Controls deep CPU idle states (C-states) to prevent IRQ latency
> > > spikes
> > > + * during vblank events. This is a system-wide operation that
> > > affects all CPUs.
> > > + *
> > > + * This is a general API that vendors can extend. Currently:
> > > + * - MediaTek: Disables/enables state1 and deeper states on all
> > > CPUs
> > > + *
> > > + * When @disable is true, disables deep sleep to ensure stable
> > > vblank timing.
> > > + * When @disable is false, restores power-saving idle states.
> > > + *
> > > + * Returns: true on success, false on failure
> > > + */
> > > +bool igt_disable_cpu_deep_sleep(int fd, bool disable)
> > > +{
> > > +	char cpu_path[256];
> > > +	char state_path[512];
> > > +	int cpu, state;
> > > +	int count = 0;
> > > +	FILE *fp;
> > > +	const char *value = disable ? "1" : "0";
> > > +	const char *action = disable ? "Disabled" : "Restored";
> > > +
> > > +	/* Only MediaTek needs this currently - other vendors can
> > > extend here */
> > > +	if (!is_mtk_device(fd))
> > > +		return false;
> > 
> > Do not do this, make it a general function for every user.
> > Also, imho this should be in another lib, not in igt_kms.
> > 
> 
> Hi Kamil,
> 
> Thanks for the feedback.
> 
> For the lib placement, would it be appropriate to move this into
> lib/igt_pm.c?

Looks better.

Regards,
Kamil

> 
> I noticed that the existing APIs in igt_pm don't take fd as a
> parameter for device identification. For consistency, if we agree on
> moving to igt_pm, I'll also move the is_mtk_device() check to the call
> site and remove fd check from the function.
> 
> Best regards,
> Jason-JH Lin
> 
> > Regards,
> > Kamil
> 
