Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D78010E4BF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Oct 2023 08:02:15 +0000 (UTC)
Message-ID: <126ae5fa-3bcc-808a-9c5a-2acedf177a58@intel.com>
Date: Fri, 6 Oct 2023 10:02:14 +0200
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20231004163729.464980-1-zbigniew.kempczynski@intel.com>
 <20231004163729.464980-2-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20231004163729.464980-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_blt: Release an offset in
 the allocator on buffer destroy
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

On 4.10.2023 18:37, Zbigniew Kempczyński wrote:
> Blitter library code requires allocator handle only at the execution
> time. That means blt_copy_object structure is allocator agnostic and
> offsets are taken for block-copy or fast-copy just before operation.
> Operations on bo's like close/create requires to reflect on the
> allocator state, otherwise allocator will contain outdated
> offsets + sizes leading to fail on allocator operations or the exec.
> 
> Helpers blt_create_object() and blt_destroy_object() are unaware
> of allocator so if in the meantime object was used in block-copy or
> fast-copy it has assigned offset in the allocator. 

Something is slightly off with that sentence. It gets assigned the same 
offset as the "old" object, right?

But the solution itself looks good to me:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

Thanks,
Karolina

> Destroying object
> with blt_destroy_object() doesn't release this offset what might
> cause failures described above.
> 
> There're two possibilities how to solve this - to couple blitter
> library with allocator or provide additional helpers which will
> release offset in the allocator on destroy path. Latter one is
> easier to provide so this is a subject of this change.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>   lib/intel_blt.c | 15 ++++++++++++++-
>   lib/intel_blt.h |  2 ++
>   2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index b55fa9b529..d2ea88d95f 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1470,15 +1470,28 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>   	return obj;
>   }
>   
> -void blt_destroy_object(int fd, struct blt_copy_object *obj)
> +static void __blt_destroy_object(int fd, uint64_t ahnd, struct blt_copy_object *obj)
>   {
>   	if (obj->ptr)
>   		munmap(obj->ptr, obj->size);
>   
>   	gem_close(fd, obj->handle);
> +	if (ahnd)
> +		intel_allocator_free(ahnd, obj->handle);
>   	free(obj);
>   }
>   
> +void blt_destroy_object(int fd, struct blt_copy_object *obj)
> +{
> +	__blt_destroy_object(fd, 0, obj);
> +}
> +
> +void blt_destroy_object_and_alloc_free(int fd, uint64_t ahnd,
> +				       struct blt_copy_object *obj)
> +{
> +	__blt_destroy_object(fd, ahnd, obj);
> +}
> +
>   void blt_set_object(struct blt_copy_object *obj,
>   		    uint32_t handle, uint64_t size, uint32_t region,
>   		    uint8_t mocs, enum blt_tiling_type tiling,
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index d9c8883c7d..a9ddb99647 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -245,6 +245,8 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>   		  enum blt_compression_type compression_type,
>   		  bool create_mapping);
>   void blt_destroy_object(int fd, struct blt_copy_object *obj);
> +void blt_destroy_object_and_alloc_free(int fd, uint64_t ahnd,
> +				       struct blt_copy_object *obj);
>   void blt_set_object(struct blt_copy_object *obj,
>   		    uint32_t handle, uint64_t size, uint32_t region,
>   		    uint8_t mocs, enum blt_tiling_type tiling,
