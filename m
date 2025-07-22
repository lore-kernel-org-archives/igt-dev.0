Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E01C83F1A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 01:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7B710E3CE;
	Tue, 22 Jul 2025 01:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="d/MKkDon";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AE610E3CE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 01:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Seo8n9W0HVgIsqSEIilzwDJMkbXRhJkj2Ju0e77Ed8E=; b=d/MKkDon1kDDcaV6SyNqB4VbHO
 CNGv8tq64b16KD/U5d4OwMzB/i5mCu2dxQgRuorpY5zVGCEZfTm+RKS4k5xKLl9j7z236dSM8TC6Q
 4H8/wjyLm0UREj4at4c8ndWBDGNibs2UdPHMX/QzLc+pCE3c9Rl39CEdqwc3UsOlu6evE14JyECue
 +0R/qpG8OGPdpgt9/tt/mLEnSyb6+iXBIrxU3+/8VKt6Iyjm8adplbhRrgngpVAzVUq/1z5aUJkva
 7xNT5PJeXcHcOo115/tnYwgQV+xhtXP+Dwwpz2VwisHqrHTOqvQN4CRdV3TUuUhoaS4oEpc0GT409
 pvpy1ihw==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ue1R7-001wGe-AW; Tue, 22 Jul 2025 03:04:53 +0200
Message-ID: <d4e175d4-1fbc-4db4-90d7-e791d48ad0d1@igalia.com>
Date: Mon, 21 Jul 2025 22:04:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] lib/igt_vc4: Fix musl libc compilation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Melissa Wen <mwen@igalia.com>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>
References: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
 <20250721155824.112474-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250721155824.112474-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Kamil,

On 21/07/25 12:58, Kamil Konieczny wrote:
> Fix gcc compilation on Void Linux with musl C libs, where
> PAGE_SIZE is already defined. As this is specific for GPU use
> VC4_GPU_PAGE_SIZE.
> 
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> Cc: Vignesh Raman <vignesh.raman@collabora.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   lib/igt_vc4.h               |  2 +-
>   tests/vc4/vc4_create_bo.c   |  4 ++--
>   tests/vc4/vc4_label_bo.c    |  6 +++---
>   tests/vc4/vc4_lookup_fail.c |  2 +-
>   tests/vc4/vc4_mmap.c        | 12 ++++++------
>   tests/vc4/vc4_tiling.c      | 12 ++++++------
>   tests/vc4/vc4_wait_bo.c     |  4 ++--
>   7 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index fe7173c50..901bb25f8 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -31,7 +31,7 @@
>   #include "igt_fb.h"
>   #include "vc4_drm.h"
>   
> -#define PAGE_SIZE 4096
> +#define VC4_GPU_PAGE_SIZE 4096
>   
>   uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
>   int igt_vc4_create_bo(int fd, size_t size);
> diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
> index ba7db1985..c67f626f9 100644
> --- a/tests/vc4/vc4_create_bo.c
> +++ b/tests/vc4/vc4_create_bo.c
> @@ -34,7 +34,7 @@ igt_main
>   	}
>   
>   	igt_subtest("create-bo-4096") {
> -		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   		gem_close(fd, handle);
>   	}
>   
> @@ -53,7 +53,7 @@ igt_main
>   		 * to convince it to land as the only one of its size in the
>   		 * kernel BO cache
>   		 */
> -		size_t size = 3 * PAGE_SIZE, i;
> +		size_t size = 3 * VC4_GPU_PAGE_SIZE, i;
>   
>   		/* Make a BO and free it on our main fd. */
>   		handle = igt_vc4_create_bo(fd, size);
> diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
> index 5d626a92d..dc0ddaa15 100644
> --- a/tests/vc4/vc4_label_bo.c
> +++ b/tests/vc4/vc4_label_bo.c
> @@ -49,7 +49,7 @@ igt_main
>   	}
>   
>   	igt_subtest("set-label") {
> -		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   		set_label(fd, handle, "a test label", 0);
>   		set_label(fd, handle, "a new test label", 0);
>   		gem_close(fd, handle);
> @@ -60,7 +60,7 @@ igt_main
>   	}
>   
>   	igt_subtest("set-bad-name") {
> -		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   
>   		struct drm_vc4_label_bo label = {
>   			.handle = handle,
> @@ -74,7 +74,7 @@ igt_main
>   	}
>   
>   	igt_subtest("set-kernel-name") {
> -		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   		set_label(fd, handle, "BCL", 0);
>   		set_label(fd, handle, "a test label", 0);
>   		set_label(fd, handle, "BCL", 0);
> diff --git a/tests/vc4/vc4_lookup_fail.c b/tests/vc4/vc4_lookup_fail.c
> index 9f179a3fd..76b52ecf3 100644
> --- a/tests/vc4/vc4_lookup_fail.c
> +++ b/tests/vc4/vc4_lookup_fail.c
> @@ -33,7 +33,7 @@ igt_main
>   		fd = drm_open_driver(DRIVER_VC4);
>   
>   	igt_subtest("bad-color-write") {
> -		uint32_t size = PAGE_SIZE;
> +		uint32_t size = VC4_GPU_PAGE_SIZE;
>   		/* A single row will be a page. */
>   		uint32_t width = 1024;
>   		uint32_t height = size / (width * 4);
> diff --git a/tests/vc4/vc4_mmap.c b/tests/vc4/vc4_mmap.c
> index fef25f334..7ca08811e 100644
> --- a/tests/vc4/vc4_mmap.c
> +++ b/tests/vc4/vc4_mmap.c
> @@ -28,16 +28,16 @@ igt_main
>   	igt_describe("Test basics of newly mapped bo like default content, write and read "
>   		     "coherency, mapping existence after gem_close and unmapping.");
>   	igt_subtest("mmap-bo") {
> -		int handle = igt_vc4_create_bo(fd, PAGE_SIZE);
> -		uint32_t *map = igt_vc4_mmap_bo(fd, handle, PAGE_SIZE, PROT_READ | PROT_WRITE);
> -		uint8_t expected[PAGE_SIZE];
> +		int handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
> +		uint32_t *map = igt_vc4_mmap_bo(fd, handle, VC4_GPU_PAGE_SIZE, PROT_READ | PROT_WRITE);
> +		uint8_t expected[VC4_GPU_PAGE_SIZE];
>   
>   		/* Testing contents of newly created objects. */
>   		memset(expected, 0, sizeof(expected));
>   		igt_assert_eq(memcmp(map, expected, sizeof(expected)), 0);
>   
> -		memset(map, 0xd0, PAGE_SIZE);
> -		memset(expected, 0xd0, PAGE_SIZE);
> +		memset(map, 0xd0, VC4_GPU_PAGE_SIZE);
> +		memset(expected, 0xd0, VC4_GPU_PAGE_SIZE);
>   		igt_assert_eq(memcmp(expected, map, sizeof(expected)), 0);
>   
>   		/* Testing that mapping stays after close */
> @@ -45,7 +45,7 @@ igt_main
>   		igt_assert_eq(memcmp(expected, map, sizeof(expected)), 0);
>   
>   		/* Testing unmapping */
> -		munmap(map, PAGE_SIZE);
> +		munmap(map, VC4_GPU_PAGE_SIZE);
>   	}
>   
>   	igt_fixture
> diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
> index e9d3ebfb3..923e210e7 100644
> --- a/tests/vc4/vc4_tiling.c
> +++ b/tests/vc4/vc4_tiling.c
> @@ -49,7 +49,7 @@ igt_main
>   	}
>   
>   	igt_subtest("get-bad-flags") {
> -		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   		struct drm_vc4_get_tiling get = {
>   			.handle = bo,
>   			.flags = 0xd0d0d0d0,
> @@ -59,7 +59,7 @@ igt_main
>   	}
>   
>   	igt_subtest("set-bad-flags") {
> -		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   		struct drm_vc4_set_tiling set = {
>   			.handle = bo,
>   			.flags = 0xd0d0d0d0,
> @@ -70,7 +70,7 @@ igt_main
>   	}
>   
>   	igt_subtest("get-bad-modifier") {
> -		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   		struct drm_vc4_get_tiling get = {
>   			.handle = bo,
>   			.modifier = 0xd0d0d0d0,
> @@ -80,7 +80,7 @@ igt_main
>   	}
>   
>   	igt_subtest("set-bad-modifier") {
> -		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   		struct drm_vc4_set_tiling set = {
>   			.handle = bo,
>   			.modifier = 0xd0d0d0d0,
> @@ -90,7 +90,7 @@ igt_main
>   	}
>   
>   	igt_subtest("set-get") {
> -		int bo = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		int bo = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   
>   		/* Default is untiled. */
>   		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_LINEAR);
> @@ -111,7 +111,7 @@ igt_main
>   		/* Some size that probably nobody else is using, to
>   		 * encourage getting the same BO back from the cache.
>   		 */
> -		int size = 91 * PAGE_SIZE;
> +		int size = 91 * VC4_GPU_PAGE_SIZE;
>   		int bo;
>   
>   		bo = igt_vc4_create_bo(fd, size);
> diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
> index d309acc95..3f4fb4dc6 100644
> --- a/tests/vc4/vc4_wait_bo.c
> +++ b/tests/vc4/vc4_wait_bo.c
> @@ -28,7 +28,7 @@
>   static void
>   test_used_bo(int fd, uint64_t timeout)
>   {
> -	size_t size = PAGE_SIZE;
> +	size_t size = VC4_GPU_PAGE_SIZE;
>   	uint32_t clearval = 0xaabbccdd + timeout;
>   	int handle = igt_vc4_get_cleared_bo(fd, size, clearval);
>   	struct drm_vc4_wait_bo wait = {
> @@ -65,7 +65,7 @@ igt_main
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_VC4);
>   		igt_require(igt_vc4_is_v3d(fd));
> -		bo_handle = igt_vc4_create_bo(fd, PAGE_SIZE);
> +		bo_handle = igt_vc4_create_bo(fd, VC4_GPU_PAGE_SIZE);
>   	}
>   
>   	igt_subtest("bad-bo") {

