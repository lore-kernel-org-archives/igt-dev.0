Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA5606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 12:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ub2/i6K1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D0010E2E0;
	Wed, 28 Oct 2026 12:45:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6B510FC0A
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793191447; x=1824727447;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6/xg5gZKFBZtO91vNi6hUFXMxMZiY0UwF1bjS153h4Y=;
 b=Ub2/i6K1Yh8rTviNH8ElB2OgGjWpqM+XjjgY8geGWTfCBqWxVZY5lwmc
 S3DJxc1N/WAElMLVOOXdYKxTQ4h7Sw4CO1x8/6e3VryrJgxuUDiYQEG4v
 xgA9dNpZUW4PO+gZQdwyKssR3EznbElV0F9Zr3obWckKiNRnDm0LsGayX
 1StsvYMmHh3t6Eel/A6OBWC4nKnqOySIIERSRbBn5l7MxFSmW9OGWC028
 nVKuvEpJlzeCrAH7HyfnbTz/OO5PzCOsQJlUjGd3NneEO+B7MBEKIu/rx
 ehM0o7GzgSLHTGEFYDMKUxw/iMdp5DkQbrfLiOlUcpGtrBC+iGLzymktV g==;
X-CSE-ConnectionGUID: 5pWwvj3pTUq66Zmmg+p6eQ==
X-CSE-MsgGUID: IZlMsdkjTgiVDuyegZLUiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1936281"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1936281"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:44:07 -0700
X-CSE-ConnectionGUID: AMLHFAlIQLG8ApaMdu24dQ==
X-CSE-MsgGUID: TonBFO5fS7GSx4Up1BXlIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4693694"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:44:05 -0700
Date: Wed, 28 Oct 2026 13:44:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Update the
 chamelium testlist
Message-ID: <20261028124403.7u6pm474vlggu355@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261027053126.1135315-1-pranay.samala@intel.com>
 <b0ef9213-3981-4620-a74e-ef6c585835db@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0ef9213-3981-4620-a74e-ef6c585835db@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,
On 2026-10-28 at 14:38:56 +0530, Karthik B S wrote:

ci changes can have short prefix intel-ci:
also this could be made into:

[PATCH i-g-t] intel-ci/chamelium-only.testlist: Add [dp|hdmi]-hpd-after-runtime-suspend-d3hot

as there are only two very similar tests added.


Regards,
Kamil

> 
> On 27-10-2026 11:01, Pranay Samala wrote:
> > Update the testlist with newly added tests.
> > 
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> > ---
> >   tests/intel-ci/chamelium-only.testlist | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> > index 6b395e8da..c7d76ab4c 100644
> > --- a/tests/intel-ci/chamelium-only.testlist
> > +++ b/tests/intel-ci/chamelium-only.testlist
> > @@ -97,6 +97,8 @@ igt@kms_chamelium_audio@hdmi-audio-after-suspend
> >   igt@kms_chamelium_edid@dp-edid-change-during-suspend
> >   igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> >   igt@kms_chamelium_hpd@common-hpd-after-suspend
> > +igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot
> >   igt@kms_chamelium_hpd@dp-hpd-after-suspend
> > +igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot
> >   igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> >   igt@kms_chamelium_hpd@vga-hpd-after-suspend
