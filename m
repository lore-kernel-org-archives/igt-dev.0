Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6280AECE579
	for <igt-dev@archiver.kernel.org>; Mon,  9 Sep 2024 15:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEF110E5B3;
	Mon,  9 Sep 2024 15:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyseXph7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F2410E5B3
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2024 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725895684; x=1757431684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QTBJPn5i5VP3lOkYYfF3X5RFCTm885dcUHe/zzs9PzA=;
 b=RyseXph7tspZ3AeHN9XG5sQwZKTws0cleW/m9i9B6vha+ThvUodDdchY
 ijb5Ly8hohj6F9hu21LChnJsK3V1J7oX2DjNF+0OCAjAByxiW1r+UwdrH
 biTiTEi0DfQ51xd3m6hd2S7i1RraBf0S0sQFIzlZklV995Rjs8+0KkcQQ
 grJpswsekhmRl3aDOEE+3croLWbhN8GZyRkt4Y5xDAEbufoKayBNGzGx3
 Kbb9SHFYjbVQNSiJ1krHuvSyHqlX6ceuPM0AUcol7soRcFEAvEfW5VRqg
 Gzcc7zZgqYdjB7BPTfho7QFFmCCSR7OSo0XS75+dEJBQB/ldAbsuur88r A==;
X-CSE-ConnectionGUID: 4q1VU6slQdKoRaYftvcpzg==
X-CSE-MsgGUID: Q9VLBnOkTn2ZEdyCflUhRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42076034"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="42076034"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 08:28:04 -0700
X-CSE-ConnectionGUID: QVV/Gc2jQ2OTMHN5c2UAdw==
X-CSE-MsgGUID: 7+NwVuzZTcOMv/VfK4c9pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; d="scan'208";a="66952376"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 08:28:01 -0700
Date: Mon, 9 Sep 2024 17:27:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle (somewhat) amdgpu
 memory stats
Message-ID: <20240909152758.4ye4sbd7zgzmttgh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>
References: <20240904155919.74744-1-tursulin@igalia.com>
 <g4g7g32mqlhpz34j3u4mztsdjgmimne3srcwipw72y542mkweu@44rhdzyauoxa>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <g4g7g32mqlhpz34j3u4mztsdjgmimne3srcwipw72y542mkweu@44rhdzyauoxa>
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

Hi Lucas,
On 2024-09-05 at 07:55:14 -0500, Lucas De Marchi wrote:
> On Wed, Sep 04, 2024 at 04:59:19PM GMT, Tvrtko Ursulin wrote:
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > 
> > Code so far only handles the clients using the common DRM helper.
> > 
> > Handle the amdgpu driver which uses a slightly different set of keys. More
> > specifically, outputs drm-memory-<region> instead of drm-resident-<region>.
> > 
> > With this added gputop starts showing resident memory usage for amdgpu.
> > 
> > v2:
> > * Semantics of amdgpu drm-memory- are like resident, not total.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Christian König <christian.koenig@amd.com>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> # v1
> 
> my r-b stands.
> 
> Lucas De Marchi

Could you look into a regression reported for XeFULL:

igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11696/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

Regards,
Kamil

