Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A50810E721
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 13:01:00 +0000 (UTC)
Date: Wed, 6 Dec 2023 14:00:55 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231206130055.caqgpbcwy3liy72h@kamilkon-desk.igk.intel.com>
References: <20231130135259.2220370-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231130135259.2220370-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_store: Test to
 check CONDITIONAL_BATCH_BUFFER_END
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

Hi Priyanka,

On 2023-11-30 at 19:22:59 +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added a basic test to check MI_CONDITIONAL_BATCH_BUFFER_END instruction.
> 
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 45 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 9c14bfd14..66fbacc77 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -21,6 +21,8 @@
>   */
>  
>  #define MAX_INSTANCE 9
> +#define STORE 0
> +#define COND_BATCH 1
>  
>  struct data {
>  	uint32_t batch[16];
> @@ -48,11 +50,38 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
>  	data->addr = batch_addr;
>  }
>  
> +static void cond_batch(struct data *data, uint64_t addr, int value)
> +{
> +	int b;
> +	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> +	uint64_t batch_addr = addr + batch_offset;
> +	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> +	uint64_t sdi_addr = addr + sdi_offset;
> +
> +	b = 0;
> +	data->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
> +	data->batch[b++] = sdi_addr;
> +	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 5 << 12 | 2;
> +	data->batch[b++] = value;
> +	data->batch[b++] = sdi_addr;
> +	data->batch[b++] = sdi_addr >> 32;
> +	data->batch[b++] = MI_BATCH_BUFFER_START | 1;
> +	data->batch[b++] = lower_32_bits(batch_addr);
> +	data->batch[b++] = upper_32_bits(batch_addr);
> +	data->batch[b++] = MI_BATCH_BUFFER_END;
> +	igt_assert(b <= ARRAY_SIZE(data->batch));
> +
> +	data->addr = batch_addr;
> +}
> +
>  /**
>   * SUBTEST: basic-store
>   * Description: Basic test to verify store dword.
> + * SUBTEST: basic-cond-batch
> + * Description: Basic test to verify cond batch end instruction.
>   */
> -static void store(int fd)
> +static void basic_inst(int fd, int inst_type)
>  {
>  	struct drm_xe_sync sync = {
>  		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL,
> @@ -86,7 +115,14 @@ static void store(int fd)
>  
>  	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
>  	data = xe_bo_map(fd, bo, bo_size);
> -	store_dword_batch(data, addr, value);
> +
> +	if (inst_type == STORE)
> +		store_dword_batch(data, addr, value);
> +	else {
> +		/* A random value where it stops at the below value. */
------------ ^
This is not really 'random', just a chosen non-zero, reasonable small
value to check, so imho

		/* A small non-zero value where loop stops at. */

If you want to have it at random, you may use:

    value = 20 + random() % 10;

Regards,
Kamil

> +		value = 20;
> +		cond_batch(data, addr, value);
> +	}
>  
>  	exec_queue = xe_exec_queue_create(fd, vm, hw_engine, 0);
>  	exec.exec_queue_id = exec_queue;
> @@ -302,7 +338,10 @@ igt_main
>  	}
>  
>  	igt_subtest("basic-store")
> -		store(fd);
> +		basic_inst(fd, STORE);
> +
> +	igt_subtest("basic-cond-batch")
> +		basic_inst(fd, COND_BATCH);
>  
>  	igt_subtest("basic-all") {
>  		xe_for_each_gt(fd, gt)
> -- 
> 2.25.1
> 
