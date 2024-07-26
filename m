Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3191AC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 19:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D738E10E9EE;
	Fri, 26 Jul 2024 19:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StKTOG6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD72B10E9EE
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 19:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722021668; x=1753557668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wq+/RKIroiXPfg5Nx5YgnufLioWZjfXzdXsSSl6v9u4=;
 b=StKTOG6+UBbBzQSfBvzgQc+fj5N1/wZe+d9A8o59N0y5pr3X9G1xfDzp
 eYeFgsml1VqJthl0JENdShqvWgIh1ext3G4F4tpt3mcqOcwzog/2/NEje
 6D/PseBPkC7yR9rIO7hk0Tx+ieWM+Wp9QhDqSuKvw3qzAW1peytxiv4w1
 KSAS/v4YIxUV81/lnieUkeYV8I6tKPZH5bDb4oACCOAXyn03bbgVhr9yO
 InuXc8xUTI9le+Qe38bsHualb2xBBuTnJ1tQJKofWGyGlXD8M2jAUV7W2
 naH9pPQtrSzZs45ggv6qOu/2eIfHizep2XkV34BObpuybqnkzjKIoKBQ6 g==;
X-CSE-ConnectionGUID: DDq4xIi/Qqe9FdH/3Ga2Og==
X-CSE-MsgGUID: MpdT+zj1RzW+bViEEnVDtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19521102"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19521102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 12:21:07 -0700
X-CSE-ConnectionGUID: 5fVNb5JkTa+S+LpJU8zw+w==
X-CSE-MsgGUID: 1ZCYxvaCRv6q9WOOw6nokA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="76575382"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 12:21:06 -0700
Date: Fri, 26 Jul 2024 21:21:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [PATCH i-g-t] tests/dumb_buffer: Add subtests for mixing dumb
 buffers with prime
Message-ID: <20240726192103.74ksf6x6e6bbtj3m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240628190318.700537-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240628190318.700537-1-zack.rusin@broadcom.com>
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

Hi Zack,
On 2024-06-28 at 15:03:18 -0400, Zack Rusin wrote:
> New versions of KWin are extensively using dumb buffers with prime. Add
> some basic tests to verify that mixing the dumb buffer interface
> with prime ends up with a well formed buffer.
> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>

Adding Juha-Pekka and Bhanu to Cc:

+Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Regards,
Kamil

> ---
>  tests/dumb_buffer.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 8e243459c..62e9b419d 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -69,6 +69,18 @@
>   * SUBTEST: map-uaf
>   *
>   * SUBTEST: map-valid
> + *
> + * SUBTEST: dmabuf-read
> + * Description: Make a dumb buffer, map it using the dumb buffer interface,
> + *              export it via prime, mmap the prime buffer and check
> + *              that its contents matches what we wrote to the dumb
> + *              buffer.
> + *
> + * SUBTEST: dmabuf-write
> + * Description: Make a dumb buffer, map and write to it using the prime
> + *              interface, than map it using the dumb buffer interface
> + *              and check whether its contents matches what we wrote using
> + * 		the prime interface.
>   */
>  
>  IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
> @@ -388,6 +400,82 @@ static void always_clear(int fd, int timeout)
>  	igt_info("Checked %'lu page allocations\n", checked);
>  }
>  
> +static const uint32_t pattern[] = {
> +	0xff000000, 0x00ff0000, 0x0000ff00, 0x000000ff,
> +	0x000000ff, 0x0000ff00, 0x00ff0000, 0xff000000,
> +	0x00ffff00, 0xff0000ff, 0x00ff00ff, 0xff00ff00,
> +	0xff0000ff, 0x00ff00ff, 0x00ffff00, 0xff00ff00
> +};
> +
> +static void dmabuf_read(int fd)
> +{
> +	struct drm_mode_create_dumb create = {
> +		.width = 64,
> +		.height = 64,
> +		.bpp = 32,
> +	};
> +	int dma_buf_fd;
> +	uint32_t *ptr;
> +
> +	dumb_create(fd, &create);
> +	ptr = dumb_map(fd, create.handle, create.size, PROT_WRITE);
> +	igt_assert(ptr != MAP_FAILED);
> +	igt_assert(ptr != NULL);
> +	igt_assert(create.size > sizeof(pattern));
> +	memcpy(ptr, pattern, sizeof(pattern));
> +	munmap(ptr, create.size);
> +
> +	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, create.handle);
> +
> +	/* Skip if DRM_RDWR is not supported */
> +	igt_skip_on(errno == EINVAL);
> +
> +	ptr = mmap(NULL, create.size, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
> +	igt_assert(ptr != MAP_FAILED);
> +
> +	/* Check pattern correctness */
> +	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
> +
> +	munmap(ptr, create.size);
> +	close(dma_buf_fd);
> +
> +	dumb_destroy(fd, create.handle);
> +}
> +
> +static void dmabuf_write(int fd)
> +{
> +	struct drm_mode_create_dumb create = {
> +		.width = 64,
> +		.height = 64,
> +		.bpp = 32,
> +	};
> +	int dma_buf_fd;
> +	uint32_t *ptr;
> +
> +	dumb_create(fd, &create);
> +
> +	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, create.handle);
> +	/* Skip if DRM_RDWR is not supported */
> +	igt_skip_on(errno == EINVAL);
> +
> +	ptr = mmap(NULL, create.size, PROT_READ | PROT_WRITE, MAP_SHARED, dma_buf_fd, 0);
> +	igt_assert(ptr != MAP_FAILED);
> +	memcpy(ptr, pattern, sizeof(pattern));
> +	munmap(ptr, create.size);
> +
> +
> +	ptr = dumb_map(fd, create.handle, create.size, PROT_READ);
> +	igt_assert(ptr != MAP_FAILED);
> +	igt_assert(ptr != NULL);
> +	igt_assert(create.size > sizeof(pattern));
> +	igt_assert(memcmp(ptr, pattern, sizeof(pattern)) == 0);
> +	munmap(ptr, create.size);
> +
> +	close(dma_buf_fd);
> +
> +	dumb_destroy(fd, create.handle);
> +}
> +
>  igt_main
>  {
>  	int fd = -1;
> @@ -414,6 +502,12 @@ igt_main
>  	igt_subtest("create-clear")
>  		always_clear(fd, 30);
>  
> +	igt_subtest("dmabuf-read")
> +		dmabuf_read(fd);
> +
> +	igt_subtest("dmabuf-write")
> +		dmabuf_write(fd);
> +
>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.40.1
> 
