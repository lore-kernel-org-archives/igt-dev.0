Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117B71133F8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 12:57:09 +0000 (UTC)
Message-ID: <6214d987-2cff-f3d8-c2c9-2809e536b2ad@intel.com>
Date: Fri, 8 Jul 2022 13:56:59 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20220708122704.16216-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220708122704.16216-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_create: use correct type
 for assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 08/07/2022 13:27, Nirmoy Das wrote:
> visible_size is u64 hence use igt_assert_neq_u64 instead
> of igt_assert_neq.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/i915/gem_create.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index 1b694c6ad..d2b41e10b 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -707,7 +707,7 @@ static void create_ext_cpu_access_big(int fd)
>   
>   		lmem_size = qmr.probed_size;
>   		visible_size = qmr.probed_cpu_visible_size;
> -		igt_assert_neq(visible_size, 0);
> +		igt_assert_neq_u64(visible_size, 0);
>   
>   		if (visible_size <= (0.70 * lmem_size)) {
>   			/*
