Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF26C2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 16:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6D410E224;
	Fri, 28 Jun 2024 16:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUVB17Ll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71DE10E224
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719590593; x=1751126593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SodUzfwiFDUlfx4U6AEJSAUeykx6vRIYn/xekVJnKnA=;
 b=LUVB17Llghv4rOF7kcV54TevFlS2mbh1qf22mtlFnBiPWzTlk+d8vCaw
 V4xB6wKJ8Omfx6RgC/STY0oodj9xvv+XE0IY+NEZlTorcioadZsP6W7u1
 k8nFgegC+cnxdkjXhH77/XuuUssHAkOig49xu8AN9J3OBA2Tv7UDg/FAO
 sLc1W5XcoTM4vQ4ogOJ75u1wWZ0u9Axkngh9srTvdAW5fN+SFTnLyqiAt
 8M88SGq0CBvEw3PboKzuY2AJFodq7boh30vWYPlblivmvmnTHchGOvVch
 B4xAWuH/f8rrdRkz3BqbOn5sDkNKX2yUf6jxfwgImI3SZ2SXhFR3AAlGY Q==;
X-CSE-ConnectionGUID: HfVilwOKRW6K10V65zR7cA==
X-CSE-MsgGUID: lOUsEjFpRwOSMvo62dKzBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16615488"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16615488"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:03:13 -0700
X-CSE-ConnectionGUID: l2z1CaKdTWONO3YZNzBgPg==
X-CSE-MsgGUID: kq1dd0OQSfeRycKx0fVASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="45526213"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 09:03:11 -0700
Date: Fri, 28 Jun 2024 18:02:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Subject: Re: [PATCH i-g-t 5/5] tests/dumb_buffer: Add subtests for mixing
 dumb buffers with prime
Message-ID: <20240628160257.ut6vfxyho7kqlwh6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Zack Rusin <zack.rusin@broadcom.com>,
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
References: <20240627195615.3695848-1-zack.rusin@broadcom.com>
 <20240627195615.3695848-6-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627195615.3695848-6-zack.rusin@broadcom.com>
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
On 2024-06-27 at 15:56:15 -0400, Zack Rusin wrote:
> New versions of KWin are extensively using dumb buffers with prime. Add
> some basic tests to verify that mixing the dumb buffer interface
> with prime ends up with a well formed buffer.
> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  tests/dumb_buffer.c | 96 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 

This seems unrelated to your series, please send it in separate
one. Few more nits below.

> diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
> index 8e243459c..0651f5d83 100644
> --- a/tests/dumb_buffer.c
> +++ b/tests/dumb_buffer.c
> @@ -69,6 +69,20 @@
>   * SUBTEST: map-uaf
>   *
>   * SUBTEST: map-valid
> + *
> + * SUBTEST: dmabuf-read
> + * Description: Make a dumb buffer, map it using the dumb buffer interface,
> + *              export it via prime, mmap the prime buffer and check
> + *              that its contents matches what we wrote to the dumb
> + *              buffer.
> + * Functionality: dumb_buffers, prime, dmabuf, mmap
----- ^
Do you need it here?

> + *
> + * SUBTEST: dmabuf-write
> + * Description: Make a dumb buffer, map and write to it using the prime
> + *              interface, than map it using the dumb buffer interface
> + *              and check whether its contents matches what we wrote using
> + * 		the prime interface.
> + * Functionality: dumb_buffers, prime, dmabuf, mmap
----- ^
Same here.

Regards,
Kamil

>   */
>  
>  IGT_TEST_DESCRIPTION("This is a test for the generic dumb buffer interface.");
> @@ -388,6 +402,82 @@ static void always_clear(int fd, int timeout)
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
> @@ -414,6 +504,12 @@ igt_main
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
