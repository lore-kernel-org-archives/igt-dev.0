Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B1D10E0B5
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jul 2023 07:28:16 +0000 (UTC)
Message-ID: <df7bf6c0-4d1f-3259-4c58-53fb1b0bc2ba@intel.com>
Date: Mon, 3 Jul 2023 09:27:44 +0200
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20230628081050.2002028-1-karolina.stolarek@intel.com>
 <20230630154349.s2uihetlo7agaw3p@kamilkon-desk1>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230630154349.s2uihetlo7agaw3p@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_batchbuffer: Remove unused
 argument in exec_blit
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

On 30.06.2023 17:43, Kamil Konieczny wrote:
> Hi Karolina,
> On 2023-06-28 at 10:10:50 +0200, Karolina Stolarek wrote:
>> We don't use information about platform's gen anymore, so
>> stop passing it in.
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> 
> Even if it will be needed we can get it from fd, so

That is true, many thanks for the review, Kamil.

And I see that my changes are already merged, even more thanks to you :)

All the best,
Karolina

> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
>> ---
>>   lib/intel_batchbuffer.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index 186f65aff..0e92c6f70 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -214,8 +214,8 @@ static uint32_t find_engine(const intel_ctx_cfg_t *cfg, unsigned int class)
>>   
>>   static void exec_blit(int fd,
>>   		      struct drm_i915_gem_exec_object2 *objs,
>> -		      uint32_t count, unsigned int gen,
>> -		      uint32_t ctx, const intel_ctx_cfg_t *cfg)
>> +		      uint32_t count, uint32_t ctx,
>> +		      const intel_ctx_cfg_t *cfg)
>>   {
>>   	struct drm_i915_gem_execbuffer2 exec;
>>   	uint32_t devid = intel_get_drm_devid(fd);
>> @@ -514,7 +514,7 @@ void igt_blitter_src_copy(int fd,
>>   		objs[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>>   	}
>>   
>> -	exec_blit(fd, objs, 3, gen, ctx, cfg);
>> +	exec_blit(fd, objs, 3, ctx, cfg);
>>   
>>   	gem_close(fd, batch_handle);
>>   }
>> @@ -636,7 +636,7 @@ void igt_blitter_fast_copy__raw(int fd,
>>   		objs[2].flags |= EXEC_OBJECT_PINNED;
>>   	}
>>   
>> -	exec_blit(fd, objs, 3, intel_gen(intel_get_drm_devid(fd)), ctx, cfg);
>> +	exec_blit(fd, objs, 3, ctx, cfg);
>>   
>>   	gem_close(fd, batch_handle);
>>   }
>> -- 
>> 2.25.1
>>
