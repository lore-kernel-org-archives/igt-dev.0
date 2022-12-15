Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A9510E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 13:27:11 +0000 (UTC)
Date: Thu, 15 Dec 2022 14:27:07 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20221215132707.gqqnhmbdxonqtyx7@zkempczy-mobl2>
References: <20221214105142.249666-1-karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221214105142.249666-1-karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_ccs: Fix memory leak in
 destroy_object
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 11:51:42AM +0100, Karolina Stolarek wrote:
> Free the copy object itself after gem_close
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  tests/i915/gem_ccs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index 4ecb3e36..00f08eea 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -141,6 +141,7 @@ static void destroy_object(int i915, struct blt_copy_object *obj)
>  		munmap(obj->ptr, obj->size);
>  
>  	gem_close(i915, obj->handle);
> +	free(obj);

Yes, it is missing here:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  }
>  
>  static void set_blt_object(struct blt_copy_object *obj,
> -- 
> 2.25.1
> 
