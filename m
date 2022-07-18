Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <b45b9801-fd41-a78f-e7fa-1c56f7557da0@linux.intel.com>
Date: Mon, 18 Jul 2022 11:04:14 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220715111937.1245586-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220715111937.1245586-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_create: use 48b
 addressing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 7/15/2022 1:19 PM, Matthew Auld wrote:
> The object here could be very large (8G+), so make sure we allow using
> the entire address space, to avoid sometimes hitting -ENOSPC.
>
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6446
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   tests/i915/gem_create.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index 1b694c6a..ff022713 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -538,7 +538,9 @@ static int upload(int fd, uint32_t handle)
>   	 * for sure placed in one of requested regions.
>   	 */
>   	exec[0].handle = handle;
> +	exec[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>   	exec[1].handle = batch_create_size(fd, PAGE_SIZE);
> +	exec[1].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>   
>   	return __gem_execbuf(fd, &execbuf);
>   }
