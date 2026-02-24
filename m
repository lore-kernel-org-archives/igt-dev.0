Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C065DE9B269
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 14:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D14010E596;
	Tue, 24 Feb 2026 14:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrkYFnhK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3429C10E596
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941896; x=1803477896;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=3RCV/oim3JDZfFd426B3B3dhjVQyUVawjTH2uofL10w=;
 b=DrkYFnhKBh1gR83hLj++AXtft6IxIVHbolMWPARjIwql7Ucf4iJp2IKl
 aJ6MbwXp2fOm/k8XI3dzsCOdcHoyuPVg/KOYMfC5bJFwppZxlzUs64CCV
 5N3idkzjNWvKM+3ALcriISwayWsSIyKLpSiesIRsCNFfY1i0D97QAl12B
 qmqid9OjYu2ikjWU38oZzRpuiswog0VUVpgIuxmMSPSYzJeg3U3FSQW68
 Gm2PXA8sj4Q08rsD06hxshvK2Ta12Yp7f14tNzUicvn6epwp8PHasqi+4
 o4oD4eKvJt+Z2tl0wJ8B59Yyr93gxviCds0F8gbFoC1K9BtrOlMPeLiku g==;
X-CSE-ConnectionGUID: 9ZY00pYwQdO6sd23Wkoynw==
X-CSE-MsgGUID: bU71PtiRSkKJRYIlEcDfeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84316826"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84316826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:04:56 -0800
X-CSE-ConnectionGUID: vuA0C40pRdKZ+vfhcYuHTw==
X-CSE-MsgGUID: x5X5/AXVS9qc11TgYoKG+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220900778"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:04:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v3 22/23] tests/kms: Use igt_crtc_t instead of
 enum pipe, part 3
In-Reply-To: <20260224085153.12766-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-23-ville.syrjala@linux.intel.com>
 <20260224085153.12766-1-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 16:04:51 +0200
Message-ID: <ef829d66817c55fe12dd9d1409287938aac035f4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 24 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert several kms tests to use igt_crtc_t instead
> of enum pipe. These specific tests currently track the pipe
> in their data structure. Replace that with the crtc instead.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
