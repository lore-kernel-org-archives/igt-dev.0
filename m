Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <cb36f370-6b21-c825-b06f-04b66b720612@linux.intel.com>
Date: Wed, 8 Jun 2022 15:25:27 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, igt-dev@lists.freedesktop.org
References: <20220525183702.490989-1-matthew.auld@intel.com>
 <20220525183702.490989-10-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220525183702.490989-10-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 9/9] lib/i915: request
 CPU_ACCESS for fb objects
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Patch 6 is missing commit message, with that and the GitLab.Pipeline 
warning fix the series LGTM

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 5/25/2022 8:37 PM, Matthew Auld wrote:
> kms_frontbuffer_tracking@basic falls over if the fb needs to be migrated
> from non-mappable device memory, to the mappable part, due to being
> temporarily pinned for scanout, when hitting the CPU fault handler,
> which just gives us SIGBUS. If the device has a small BAR let's attempt
> to use the mappable portion, if possible.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   lib/ioctl_wrappers.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 09eb3ce7..7713e78b 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -635,7 +635,8 @@ uint32_t gem_buffer_create_fb_obj(int fd, uint64_t size)
>   	uint32_t handle;
>   
>   	if (gem_has_lmem(fd))
> -		handle = gem_create_in_memory_regions(fd, size, REGION_LMEM(0));
> +		handle = gem_create_with_cpu_access_in_memory_regions(fd, size,
> +								      REGION_LMEM(0));
>   	else
>   		handle = gem_create(fd, size);
>   
