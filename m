Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F09CCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DC810E722;
	Thu,  6 Nov 2025 11:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOSn4lB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C10110E722
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762429285; x=1793965285;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Y9aP6VgSZSC0J3YhhWfEqU3rfVeOJ5e/PeQ1VUfB5Bs=;
 b=iOSn4lB7iZbSBFSWM7wfmG2w29JcLI1FFabf2c256QYZkubKPQJEdO7Z
 oWJ9GNIeM/EntKEij4nrE+zM+VaHm5QW1EcBgA+TWuco65eAk9j6S3IK1
 zetTDgWOj8t/F5g16adyiR990/BCMAeSyKGf/ouM2hJc2FjKqq9NpPCVx
 E3PeJcSzXatp1DiTOmtpdVbjaCvuf0foAOkn0MiPlMnTEAc96SbcGqF3x
 rQ+wz3LgrCudCOJ3HC8Mu/XHJhU5v21xOzURTNA7pEVUgT2uPSQVvy1GC
 BvLWrEaziuKuf+N0VV7qkCtuII0u0Ab4Q6RHU7ni0VgKdgUZf07HVhlr+ A==;
X-CSE-ConnectionGUID: gmKyBbIDSJ6ksGbt8HZVfw==
X-CSE-MsgGUID: c/2gmi6CTVOT3o1a7cBBRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64658300"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64658300"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:41:25 -0800
X-CSE-ConnectionGUID: 7wsS++nBT0agxc+AxkshNA==
X-CSE-MsgGUID: J5m1os6nTYajMr4AXPnAzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="187400531"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.174])
 ([10.245.244.174])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:41:23 -0800
Message-ID: <c8f29191129ffc8349a68abd69851f6fad38e719.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 1/2] lib/ioct_wrappers: add __prime_fd_to_handle()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sanjay Yadav
 <sanjay.kumar.yadav@intel.com>
Date: Thu, 06 Nov 2025 12:41:21 +0100
In-Reply-To: <20251105115132.97222-3-matthew.auld@intel.com>
References: <20251105115132.97222-3-matthew.auld@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-11-05 at 11:51 +0000, Matthew Auld wrote:
> We want to be able to intercept the error, if there is one, instead
> of
> always asserting a non-zero error. Add a version of
> prime_fd_to_handle()
> which allows the caller to handle the error.
>=20
> v2:
> =C2=A0 - Ensure we use errno.
> v3 (Kamil & Sanjay):
> =C2=A0 - Some spelling fixes
> =C2=A0 - s/i915//
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Does it make sense to have prime_fd_to_handle() use this now?

Either way,

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0lib/ioctl_wrappers.c | 27 +++++++++++++++++++++++++++
> =C2=A0lib/ioctl_wrappers.h |=C2=A0 1 +
> =C2=A02 files changed, 28 insertions(+)
>=20
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 176cbdacc..284a502e5 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1139,6 +1139,33 @@ int prime_handle_to_fd_for_mmap(int fd,
> uint32_t handle)
> =C2=A0	return args.fd;
> =C2=A0}
> =C2=A0
> +/**
> + * __prime_fd_to_handle:
> + * @fd: open drm file descriptor
> + * @dma_buf_fd: dma-buf fd handle
> + * @handle: output handle
> + *
> + * This wraps the PRIME_FD_TO_HANDLE ioctl, which is used to import
> a dma-buf
> + * file-descriptor into a gem buffer object.
> + *
> + * Returns: Zero on success, error code otherwise
> + */
> +int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle)
> +{
> +	struct drm_prime_handle args;
> +
> +	memset(&args, 0, sizeof(args));
> +	args.fd =3D dma_buf_fd;
> +	args.flags =3D 0;
> +	args.handle =3D 0;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &args))
> +		return -errno;
> +
> +	*handle =3D args.handle;
> +	return 0;
> +}
> +
> =C2=A0/**
> =C2=A0 * prime_fd_to_handle:
> =C2=A0 * @fd: open i915 drm file descriptor
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index 7cf05e626..5a899f052 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -138,6 +138,7 @@ int prime_handle_to_fd(int fd, uint32_t handle);
> =C2=A0#endif
> =C2=A0int prime_handle_to_fd_for_mmap(int fd, uint32_t handle);
> =C2=A0uint32_t prime_fd_to_handle(int fd, int dma_buf_fd);
> +int __prime_fd_to_handle(int fd, int dma_buf_fd, uint32_t *handle);
> =C2=A0off_t prime_get_size(int dma_buf_fd);
> =C2=A0void prime_sync_start(int dma_buf_fd, bool write);
> =C2=A0void prime_sync_end(int dma_buf_fd, bool write);

