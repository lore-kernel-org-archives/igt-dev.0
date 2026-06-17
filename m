Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53897CD98E2
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 15:55:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FD010E959;
	Wed, 17 Jun 2026 15:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Q/c6ruzG";
	dkim-atps=neutral
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A319610E571
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 15:54:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EC79302F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 08:54:38 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 031113F915
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1781711683; bh=hnfkxM33c8R8nqk5aITe24mVTC/tWL9SbPizJOscZUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q/c6ruzG42Rgh23IHblMuSPAOBK5R+9XY7IGfm86q7BfMRBguaov2ka3t+WC4GkIf
 AHtCoxcBD58CJwF3IHNniVwt3VVHO7MN30OVFQkuqGTxSdvorq+EOn17kHlDuRfo9W
 nX4mxocsVylrqMj49Ze45Z42onrRnsADyx+GrQ2Q=
Date: Wed, 17 Jun 2026 16:54:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 1/2] panthor: Provide a way to access user VA range when
 creating a VM
Message-ID: <ajLDOGRXbxippTsQ@e142607>
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

On Tue, Jun 16, 2026 at 04:43:22PM +0100, Adrián Larumbe wrote:
> This will be used in a future test that will check VM_BIND map range
> does not intersect with the range reserved for internal BO's.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

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

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
