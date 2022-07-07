Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <5487db31-4c7b-2f7a-69df-211a14e5d2d8@linux.intel.com>
Date: Thu, 7 Jul 2022 14:52:09 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220707122336.391524-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220707122336.391524-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "lib/i915: request CPU_ACCESS
 for fb objects"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 7/7/2022 2:23 PM, Matthew Auld wrote:
> This reverts commit 3cf110f8dcd1f4f02cf84339664b413abdaebf7d.
>
> This is too big of a hammer it seems, since we can't really support
> flat-CCS with lmem + smem objects, and here adding the flag means we
> also attach the smem placement, which seems to break kms_ccs.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   lib/ioctl_wrappers.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 7713e78b..09eb3ce7 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -635,8 +635,7 @@ uint32_t gem_buffer_create_fb_obj(int fd, uint64_t size)
>   	uint32_t handle;
>   
>   	if (gem_has_lmem(fd))
> -		handle = gem_create_with_cpu_access_in_memory_regions(fd, size,
> -								      REGION_LMEM(0));
> +		handle = gem_create_in_memory_regions(fd, size, REGION_LMEM(0));
>   	else
>   		handle = gem_create(fd, size);
>   
