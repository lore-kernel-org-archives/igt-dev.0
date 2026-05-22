Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DF2CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 10:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267E10F540;
	Fri, 22 May 2026 10:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gRI1S+yg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1FD10F540
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779445012; x=1810981012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+/VRQCX6s/jyF3dSJtfxXSgL2g+ljXHAYj+Vq9JpQZM=;
 b=gRI1S+ygTmdwlgmFDP6NcSilZWODJzjeH2Jpmq6ZHwqNpJhkBfYZKCPm
 fQf/b4/cBo8VsVSlkJ9ePAI22so4V5MYGxfsHjij6NAPMG5+0h1xX4Tb/
 4WH7eG0H403gKnRv/t0bF0SCr4KCmkl7RPqoyl1Z+y4yWWg7jPvhXjZqj
 A4Ctx0uGsW9q30ALPuh51M1pmGMBQDYeA3KjOzO7yEd/VRm6xTjekugA3
 ANujPt3eUxVwEK3K7D/KrsCLg/4ADnBSPNz+WPy6dbfYEN2uM1kRCX0p4
 ZBe9lbp6rxuUXnpgATwNw5jjsS+1f1XcUpD7s6kBb27lo1bufWTs2jZi/ w==;
X-CSE-ConnectionGUID: lsJrBUnpTyyzI9Q16by0KQ==
X-CSE-MsgGUID: rN/F9rNoSnSfOKboR54FAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="103051423"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="103051423"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 03:16:51 -0700
X-CSE-ConnectionGUID: VO5gltasQumA1SQ08fDDOA==
X-CSE-MsgGUID: TJR2YTbyRiOSbl2YYzfoYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="236445014"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 03:16:49 -0700
Date: Fri, 22 May 2026 12:16:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, matthew.auld@intel.com
Subject: Re: [PATCH i-g-t v2] drm/xe/xe_pm: Have high VRAM usage during
 system suspend
Message-ID: <20260522101647.7iklarhhq33ikoo6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, matthew.auld@intel.com
References: <20260522042443.1055111-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260522042443.1055111-1-karthik.poosa@intel.com>
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
On 2026-05-22 at 09:54:43 +0530, Karthik Poosa wrote:

small nit about subject, I guess you used prefix from kernel
while it should be from igt, so

[PATCH i-g-t v2] tests/intel/xe_pm: Have high VRAM usage during

Regards,
Kamil

> Create high VRAM usage by allocating multiple BOs prior to system suspend.
> This increases eviction time, helping to expose any unknown issues in the
> suspend‑resume flow.
> 
> v2:
>  - Split large BO into 8MB chunks and map jobs per chunk. (Matthew)
>  - Use SZ_1M for buffer size. (Zbigniew)
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: GitHub Copilot (GPT-5.3-Codex)
> ---
>  tests/intel/xe_pm.c | 171 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 119 insertions(+), 52 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 54f2e9d18..14c51a0d1 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
[cut]
