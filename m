Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889B0CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 09:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEAB10E59D;
	Tue,  4 Nov 2025 09:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvUDYvt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB05210E24A
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762249982; x=1793785982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LPfwQBDLqkkQk6ruteWmzjgFWUpvl1P3Dbh+0bChlY0=;
 b=hvUDYvt0tSs6Yi81vqAOgZH06HOL5bvob4LJV7fZGkov5fhvZ6vSzfu5
 ZC5Nhw2xld7bc858QyFx56GX6SvRSBG5EhwxC7XzgeTBsfSAzVQ5k202K
 6byLrNgw+4DjNtgvIdR9/WU3U94pYcAzdt8cIGin8KnZyTqCiyh6Uuihy
 eN+nV0/IpDrgVv1k0XiHiM17hCrcjIr1tm2s2SxepiArJ129WTKR8o1rF
 6dcX8vZLAD9ApG920fkncaSMFYG72erkGRq4rZ8VhJjY9TEw8Cv68HBsa
 JkJEwPLwXGSAklxgEKBRcnV9/efclBG8W1kfncRa6MqRt+RffulV7PClU Q==;
X-CSE-ConnectionGUID: f922ECHaSl+C070BXEtXow==
X-CSE-MsgGUID: BtU1DcSqQ+izM92484f6jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="64036905"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="64036905"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 01:53:02 -0800
X-CSE-ConnectionGUID: wD7CfehlQTa37Av2njwDVQ==
X-CSE-MsgGUID: yQW/no6/R72UpPihJI4VcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186357761"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:53:00 -0800
Date: Tue, 4 Nov 2025 10:52:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Message-ID: <20251104095253.ofghwm5tu77xsaeb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
References: <20251104055129.3826274-1-soham.purkait@intel.com>
 <20251104055129.3826274-3-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104055129.3826274-3-soham.purkait@intel.com>
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

Hi Soham,
On 2025-11-04 at 11:21:28 +0530, Soham Purkait wrote:
> libify xe_spin_sync_wait enabling reuse for Xe driver

Rafter "Make function xe_spin_sync_wait() public ...rest of description"

> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  lib/xe/xe_spin.c | 2 +-
>  lib/xe/xe_spin.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 9909f4e03..d29d8281d 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -302,7 +302,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
>  	return spin;
>  }
>  

Add documentation here, each public function needs one.

Regards,
Kamil

> -static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin)
>  {
>  	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
>  }
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index af32ab563..1cd578e2d 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -77,6 +77,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
>  bool xe_spin_started(struct xe_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>  
>  /*
>   * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
> -- 
> 2.34.1
> 
