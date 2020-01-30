Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EA66E40D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 01:21:57 +0000 (UTC)
References: <20200130011016.5214-1-vinay.belgaumkar@intel.com>
From: vbelgaum <vinay.belgaumkar@intel.com>
Message-ID: <0f845029-4bb3-c7f9-0eb6-279f481fe9dc@intel.com>
Date: Wed, 29 Jan 2020 17:21:25 -0800
MIME-Version: 1.0
In-Reply-To: <20200130011016.5214-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_madvise: Use
 gem_mmap__device_coherent
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 01/29/2020 05:10 PM, Vinay Belgaumkar wrote:
> Allow test to run on platforms without aperture as well.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Please disregard this patch, will resend the series.

Thanks,
Vinay.
> Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>   tests/i915/gem_madvise.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
> index 7162a5c3..56ce91cb 100644
> --- a/tests/i915/gem_madvise.c
> +++ b/tests/i915/gem_madvise.c
> @@ -63,7 +63,7 @@ dontneed_before_mmap(void)
>   
>   	handle = gem_create(fd, OBJECT_SIZE);
>   	gem_madvise(fd, handle, I915_MADV_DONTNEED);
> -	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
> +	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
>   	close(fd);
>   
>   	signal(SIGSEGV, sigtrap);
> @@ -90,7 +90,7 @@ dontneed_after_mmap(void)
>   	char *ptr;
>   
>   	handle = gem_create(fd, OBJECT_SIZE);
> -	ptr = gem_mmap__gtt(fd, handle, OBJECT_SIZE, PROT_READ | PROT_WRITE);
> +	ptr = gem_mmap__device_coherent(fd, handle, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
>   	igt_assert(ptr);
>   	gem_madvise(fd, handle, I915_MADV_DONTNEED);
>   	close(fd);

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
