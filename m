Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C7ACD98E4
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 12:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498FD10E338;
	Wed, 17 Jun 2026 12:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jk2S/Mub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFEF10E338
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781700415; x=1813236415;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5lZ5/POeTzYzHWEQLwm+jJVEjAMjYKHue6tByjLvY6Q=;
 b=jk2S/Mubjq4i/AW3+3f0VA2bq5oLWAlVb8+YPbCnogjM34X7jGhQRiHN
 INEftHcEQ31DMVFj3zAuWfCOhiLPCxEBpTjhfiI5MeaKIadNEuREQ3EG0
 3Lribi8mBycb4q4nklNBxgoiSonzcRohCxzbAZvXGxGQ4uxBPCcN7GJQf
 lAfmPFjlg1xamg1LNUVPjLA9Cdt0tWcvpF8N7H0oQP6qqP0CalMRl09cw
 GrP1AzwTnowNC8hmBsR2fqdWhRyrrfsNBudf3loMVpOls7pJU3V/hHgUd
 raeKlyjuTebv4DPv7b7K5thsbBpn/0YghrKaxlHavd6sV3KfI3ikRk23F Q==;
X-CSE-ConnectionGUID: khXjuZDXTFSMuvK4afupiw==
X-CSE-MsgGUID: Spnut2MIS1a8sMeJMzQxiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="86147821"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="86147821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:46:54 -0700
X-CSE-ConnectionGUID: BLGd+0RsS2estQGdZJRkDQ==
X-CSE-MsgGUID: JYjuPZMNTdC0KPcpObUdRA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 05:46:51 -0700
Date: Wed, 17 Jun 2026 14:46:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 1/2] panthor: Provide a way to access user VA range when
 creating a VM
Message-ID: <20260617124649.hpabgrl7zg43o4oi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
 <20260616-panthor-vmbind-checkaddr-v1-1-f35b1b067f7c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616-panthor-vmbind-checkaddr-v1-1-f35b1b067f7c@collabora.com>
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
On 2026-06-16 at 16:43:22 +0100, Adrián Larumbe wrote:
> This will be used in a future test that will check VM_BIND map range
> does not intersect with the range reserved for internal BO's.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_panthor.c | 5 ++++-
>  lib/igt_panthor.h | 7 ++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index 7ffb61eb38e9..11d8ec342f0b 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -201,7 +201,7 @@ void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err)
>   *
>   * Creates a VM.
>   */
> -void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
> +void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err, uint64_t *uva_range)
>  {
>  	struct drm_panthor_vm_create vm_create = {};
>  
> @@ -210,6 +210,9 @@ void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
>  	} else {
>  		do_ioctl(fd, DRM_IOCTL_PANTHOR_VM_CREATE, &vm_create);
>  		*vm_id = vm_create.id;
> +
> +		if (uva_range)
> +			*uva_range = vm_create.user_va_range;
>  	}
>  }
>  
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index be8490840f3a..64b0e687eef1 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -17,7 +17,7 @@ struct panthor_bo {
>  };
>  
>  void igt_panthor_query(int fd, int32_t type, void *data, size_t size, int err);
> -void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err);
> +void igt_panthor_vm_create_userva_range(int fd, uint32_t *vm_id, int err, uint64_t *uva_range);
>  void igt_panthor_vm_destroy(int fd, uint32_t vm_id, int err);
>  void igt_panthor_vm_bind_offset(int fd, uint32_t vm_id, uint32_t bo_handle, uint64_t va,
>  				uint64_t size, uint64_t ofsfet, uint32_t flags, int err);
> @@ -44,6 +44,11 @@ static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handl
>  	igt_panthor_vm_bind_offset(fd, vm_id, bo_handle, va, size, 0, flags, err);
>  }
>  
> +static inline void igt_panthor_vm_create(int fd, uint32_t *vm_id, int err)
> +{
> +	igt_panthor_vm_create_userva_range(fd, vm_id, err, 0);
> +}
> +
>  enum cs_opcode {
>  	CS_OPCODE_NOP = 0,
>  	CS_OPCODE_MOVE48 = 1,
> 
> -- 
> 2.54.0
> 
