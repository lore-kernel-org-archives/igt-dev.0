Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71FFCA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 16:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAF310E1A4;
	Wed,  3 Sep 2025 16:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5hzEvUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7588E10E1A4
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756916600; x=1788452600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5pWE3DieZhncxfmCav+51gnzBaw4vVzZonalmsMvJls=;
 b=Q5hzEvUPjbCygzvXCNml83MBkIIMYwFfLWJ5Th+chrY4ZMcUYVO/t3Sr
 5TentiQ2cOs/yWHrZ6Nk5ytRDbGvZStwd+8ZIBEpP9pKb92zSpUXMT5/I
 ah70WEcyjy8t4y58+3928VxWkHa7dWEUbgD4Llpehui9p3nqwI2uc9bVi
 Buc+P9hAaldazNxXdfLWNfkVquTimo6jfKehnD8uu2KbqmJjJ14GdAPR7
 7Im3FljLgqK3+cPAxV+zlAB3ny9EUNqmIWFknlHSE3V4roV+3gQjUcr7v
 fFpl1xt7GgHTLM+0l2EEncxhbaktsMl0JebaZEIpGoEM+XIS7bYQknMEo Q==;
X-CSE-ConnectionGUID: xkIb8TtlSXem9Q+HIQ0Clw==
X-CSE-MsgGUID: Lu5NNUFCTdqtl6Z39++mAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59172603"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="59172603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 09:23:20 -0700
X-CSE-ConnectionGUID: zbsXQl8XTSe/H8oWDCSQuQ==
X-CSE-MsgGUID: ot/zWJxPQ1iFHTZMgbFDyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="202584477"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 09:23:19 -0700
Date: Wed, 3 Sep 2025 18:23:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org,
 kunal1.joshi@intel.com
Subject: Re: [PATCH] chamelium-only.testlist: Reorder audio tests to fix init
 issue
Message-ID: <20250903162304.4v2h77u2rhnsatpe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Jeevan B <jeevan.b@intel.com>,
 igt-dev@lists.freedesktop.org, kunal1.joshi@intel.com
References: <20250825052941.1135136-1-jeevan.b@intel.com>
 <034cfcf2-11c8-4fbf-8e3d-74bc6dfd1079@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <034cfcf2-11c8-4fbf-8e3d-74bc6dfd1079@intel.com>
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

Hi Karthik,
On 2025-08-26 at 08:46:40 +0530, Karthik B S wrote:
> Hi  Jeevan,
> 
> Please update subject line.
> 
> "intel-ci: Reorder chamelium audio tests to fix init issue"
> 
> On 8/25/2025 10:59 AM, Jeevan B wrote:
> > Fix audio failures caused when HDMI audio test ran after DP audio.
> Nit: "test runs after"
> > Reordering ensures HDMI audio gets enough time to initialize before
> > running the tests.
> 
> Please add fixes tag pointing the gitlab issue.
> 
> With these updates, LGTM.
> 
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> 
> > 
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >   tests/intel-ci/i915.chamelium-only.testlist | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> > index fa4e4e588..22e12108d 100644
> > --- a/tests/intel-ci/i915.chamelium-only.testlist
> > +++ b/tests/intel-ci/i915.chamelium-only.testlist
> > @@ -1,8 +1,6 @@
> >   igt@kms_feature_discovery@chamelium
> >   igt@kms_chamelium_audio@dp-audio
> >   igt@kms_chamelium_audio@dp-audio-edid
> > -igt@kms_chamelium_audio@hdmi-audio
> > -igt@kms_chamelium_audio@hdmi-audio-edid

If change from dp-audio to hdmi-audio is causing some trouble
with initial setup, could it be solved with a test itself?

For example there are some kms lib patches from:
https://patchwork.freedesktop.org/series/151772/

and maybe this one will be helpfull:
https://patchwork.freedesktop.org/patch/670381/?series=151772&rev=2
[i-g-t,v3,02/29] lib/igt_kms: Add helper to wait for a specific status on a connector

Regards,
Kamil

> >   igt@kms_chamelium_color@ctm-0-25
> >   igt@kms_chamelium_color@ctm-0-50
> >   igt@kms_chamelium_color@ctm-0-75
> > @@ -58,6 +56,8 @@ igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> >   igt@kms_chamelium_hpd@hdmi-hpd-storm
> >   igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> >   igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> > +igt@kms_chamelium_audio@hdmi-audio
> > +igt@kms_chamelium_audio@hdmi-audio-edid
> >   igt@kms_chamelium_hpd@vga-hpd
> >   igt@kms_chamelium_hpd@vga-hpd-after-suspend
> >   igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
