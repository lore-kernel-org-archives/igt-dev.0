Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <57e33def-e5a6-1adc-ff9f-2cec251d676c@intel.com>
Date: Wed, 29 Jun 2022 11:55:05 +0300
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220628131318.197965-1-matthew.auld@intel.com>
 <20220628131318.197965-3-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20220628131318.197965-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 3/3]
 tests/amdgpu/amdgpu_command_submission: fix uaf
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

Looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>


On 6/28/22 4:13 PM, Matthew Auld wrote:
> ../lib/amdgpu/amd_command_submission.c: In function ‘amdgpu_command_submission_write_linear_helper’:
> ../lib/amdgpu/amd_command_submission.c:201:13: warning: pointer ‘ring_context’ used after ‘free’ [-Wuse-after-free]
>    201 |         r = amdgpu_cs_ctx_free(ring_context->context_handle);
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../lib/amdgpu/amd_command_submission.c:199:9: note: call to ‘free’ here
>    199 |         free(ring_context);
>        |         ^~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> ---
>   lib/amdgpu/amd_command_submission.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 4dc4df95..16939653 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -196,10 +196,10 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>   	}
>   	/* clean resources */
>   	free(ring_context->pm4);
> -	free(ring_context);
>   	/* end of test */
>   	r = amdgpu_cs_ctx_free(ring_context->context_handle);
>   	igt_assert_eq(r, 0);
> +	free(ring_context);
>   }
>   
>   
> 
