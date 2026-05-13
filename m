Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201C3CD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 14:01:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C212B10EE8F;
	Wed, 13 May 2026 14:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R+lQ0uW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8516510EE8F
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778680862; x=1810216862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ozuVxzWWNc/xZrTCqw90doF9m5OYyp/VV48a9AP3K58=;
 b=R+lQ0uW7UcjsjFIlgwRhDkUezwP5dqJpROFV+HC47i43EhlIL3Tt1S0w
 dtS8R7KzMlHi4f/4jSzvCN47ir/4AUhZZjRiMUs7waVYHhHw3PhZyYt3u
 3IDrmoli1nncrkl7Y6XMeUMDt+b9fW3QEKgPQMYEJQCv+v8XhYFlzC09k
 hHWyoqhOp2fsun616NX8qjFAhjumukuG9LvYFoSiijnLSiEqHQWx13K7L
 sV3U0jGi/JyRJ2DvBQmn5TPVIE5INsj6ndJC7Khc4fpfWjoGpwXMwTjlo
 9I45Gv9EGy/UhUvAgQOBCdwWuEdodiwrseczmbi4JFp6+HvoZ4yWxVgpC g==;
X-CSE-ConnectionGUID: QmG+Z9iTSbirZVSdMABXoQ==
X-CSE-MsgGUID: CrWONq9bR+mNV8BIseFgQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83481704"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="83481704"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 07:01:02 -0700
X-CSE-ConnectionGUID: 2Kt/pbqnSH6yxsrZfdK3pg==
X-CSE-MsgGUID: tWLWFbfOTrqJU/IoSOCU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237111891"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 07:00:59 -0700
Date: Wed, 13 May 2026 16:00:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v2 2/3] panthor: Add IGT library helper for Panthor
 sparse mappings
Message-ID: <20260513140056.xbj7dhf6ks4d3dch@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 igt-dev@lists.freedesktop.org,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, kernel@collabora.com
References: <20260508172537.3456595-1-adrian.larumbe@collabora.com>
 <20260508172537.3456595-3-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508172537.3456595-3-adrian.larumbe@collabora.com>
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

Hi Adrián,
On 2026-05-08 at 18:25:34 +0100, Adrián Larumbe wrote:
> Because Panthor sparse VM_BIND's require a specific set of flags, and also
> no BO handle shall be specified for them, this helper will help to reduce
> some noise in future sparse binding tests.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  lib/igt_panthor.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index be8490840f3a..b9edbd320329 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -44,6 +44,15 @@ static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handl
>  	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
>  }
>  
> +static inline void igt_panthor_vm_bind_sparse(int fd, uint32_t vm_id,
> +					      uint64_t va, uint64_t size, int err)
> +{
> +	uint32_t flags = DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
> +		DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE | DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;

This would be imho better with all aligned:

	uint32_t flags = DRM_PANTHOR_VM_BIND_OP_TYPE_MAP |
			 DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE |
			 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;


LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil


> +
> +	igt_panthor_vm_bind_offset(fd, vm_id, 0, va, size, 0, flags, err);
> +}
> +
>  enum cs_opcode {
>  	CS_OPCODE_NOP = 0,
>  	CS_OPCODE_MOVE48 = 1,
> -- 
> 2.53.0
> 
