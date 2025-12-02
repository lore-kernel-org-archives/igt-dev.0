Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5758FD116FE
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 10:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1110110E606;
	Tue,  2 Dec 2025 10:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lhc3kSUU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD7410E607
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764671214; x=1796207214;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=aWB1w1wY6X06CJj6EoCJXU8ReUOINK3PMkibmIAD6+M=;
 b=Lhc3kSUUIN5K1IIbvo6RO4o4C22X6+st4YQ6I+O8v2igfUTffRzQZwHv
 k3hPrQUV5ZCI8PNGsn1yAAsNAZ03UAPRQ9dBc51IGeE/CP9FVHItnwoKb
 Y00p7JtZ1nm521L+HgnvxzU1s0qX6195qckEaHYwKroJcnp41vFBMgr4k
 PRfXP621xfZodvle2lOmNS6fukuMLWUPzovNyBSZ2FwG+ylgFGU8gQetf
 XOcQ47dnyVVlwOwlSsyHfmJvw8W8e1qkgQqnfBbBnipb/1oIeRiOR8HaA
 BX7j+NM7uVbM6gx/1GF4c5ufHkR4FtGxbvrBZy8VPBLZsY55siezJ9gvI w==;
X-CSE-ConnectionGUID: zoVIhn0QS0m9QrnrWdBHXA==
X-CSE-MsgGUID: A9fIJwkTTsWsbTYbAwt7ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70489884"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="70489884"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 02:26:54 -0800
X-CSE-ConnectionGUID: mbG+IobiTWOiJRdYPqbvWA==
X-CSE-MsgGUID: IUYig03WQiKUK0z/1NDPrA==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 02:26:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: igt-dev@lists.freedesktop.org, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: Re: [PATCH v2] tests/amdgpu/amd_bo: Add UMQ-based HDP flush
 =?utf-8?Q?VRAM=E2=86=92GTT?= coherency test v2
In-Reply-To: <20251201185947.292015-1-srinivasan.shanmugam@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251201185947.292015-1-srinivasan.shanmugam@amd.com>
Date: Tue, 02 Dec 2025 12:26:47 +0200
Message-ID: <89581f08c27bcbbf7655744177d0a741cd172245@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 02 Dec 2025, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com> wrote:
> +static inline void hdp_flush_mmio(uint32_t *mmio_base)

static inline in .c files considered harmful. ;)

BR,
Jani.


-- 
Jani Nikula, Intel
