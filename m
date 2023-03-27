Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2614910E5FE
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:56:16 +0000 (UTC)
Message-ID: <11545306-bb95-1498-1780-f4f87d4966be@intel.com>
Date: Mon, 27 Mar 2023 15:56:11 +0200
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20230324133346.2284000-1-vikas.srivastava@intel.com>
 <20230324133346.2284000-2-vikas.srivastava@intel.com>
 <20230327125255.vd2qwbnvsahxcbqu@kamilkon-desk1>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230327125255.vd2qwbnvsahxcbqu@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] lib/intel_batchbuffer: Enable
 XY_FAST_COPY_BLT support for api_intel_bb
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

On 27.03.2023 14:52, Kamil Konieczny wrote:
> Hi Vikas,
> 
> On 2023-03-24 at 19:03:43 +0530, Vikas Srivastava wrote:
>> Test case uses legacy command XY_SRC_COPY_BLT_CMD which is
>> not supported on newer platforms. Modified test to use
>> XY_FAST_COPY_BLT.
>>
> 
> Put here Cc like:
> 
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
>> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
>> ---
>>   lib/intel_batchbuffer.c | 63 +++++++++++++++++++++++++++--------------
>>   1 file changed, 42 insertions(+), 21 deletions(-)
>>
>> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
>> index da4c238cae..b1eff42fcb 100644
>> --- a/lib/intel_batchbuffer.c
>> +++ b/lib/intel_batchbuffer.c
>> @@ -2407,11 +2407,17 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
>>    */
>>   void intel_bb_blit_start(struct intel_bb *ibb, uint32_t flags)
>>   {
>> -	intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
>> -		     XY_SRC_COPY_BLT_WRITE_ALPHA |
>> -		     XY_SRC_COPY_BLT_WRITE_RGB |
>> -		     flags |
>> -		     (6 + 2 * (ibb->gen >= 8)));
>> +	if (blt_has_fast_copy(ibb->i915))
>> +		intel_bb_out(ibb, XY_FAST_COPY_BLT | flags);
>> +	else if (blt_has_xy_src_copy(ibb->i915))
>> +
>> +		intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
>> +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
>> +			     XY_SRC_COPY_BLT_WRITE_RGB |
>> +			     flags |
>> +			     (6 + 2 * (ibb->gen >= 8)));
>> +	else
>> +		igt_assert_f(0, "No supported blit command found\n");
>>   }
>>   
>>   /*
>> @@ -2449,12 +2455,22 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
>>   
>>   	if (gen >= 4 && src->tiling != I915_TILING_NONE) {
>>   		src_pitch /= 4;
>> -		cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
>> +		if (blt_has_fast_copy(ibb->i915))
>> +			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
>> +		else if (blt_has_xy_src_copy(ibb->i915))
>> +			cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
>> +		else
>> +			igt_assert_f(0, "No supported blit command found\n");
>>   	}
>>   
>>   	if (gen >= 4 && dst->tiling != I915_TILING_NONE) {
>>   		dst_pitch /= 4;
>> -		cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
>> +		if (blt_has_fast_copy(ibb->i915))
>> +			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
>> +		else if (blt_has_xy_src_copy(ibb->i915))
> -------------------- ^
> Here you can use else without if() as it was already checked above.

I think we want to select either fast or xy_src blit, not both. Most 
platforms would go with both ifs.

> 
>> +			cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
>> +		else
>> +			igt_assert_f(0, "No supported blit command found\n");
> 
> This was ruled out with SRC_TILED above so no need to repeat
> "else igt_assert" here.

It's a belt and suspenders approach, as this shouldn't be happening, but 
this assert will show us quickly if we miss important definitions in 
intel_cmds_info. I did something similar in my gem_blits patches, so 
that's why I recommended doing it here.

Many thanks,
Karolina

> 
>>   	}
>>   
>>   	CHECK_RANGE(src_x1); CHECK_RANGE(src_y1);
>> @@ -2465,20 +2481,25 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
>>   	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
>>   
>>   	br13_bits = 0;
>> -	switch (bpp) {
>> -	case 8:
>> -		break;
>> -	case 16:		/* supporting only RGB565, not ARGB1555 */
>> -		br13_bits |= 1 << 24;
>> -		break;
>> -	case 32:
>> -		br13_bits |= 3 << 24;
>> -		cmd_bits |= (XY_SRC_COPY_BLT_WRITE_ALPHA |
>> -			     XY_SRC_COPY_BLT_WRITE_RGB);
>> -		break;
>> -	default:
>> -		igt_fail(IGT_EXIT_FAILURE);
>> -	}
>> +	if (blt_has_xy_src_copy(ibb->i915)) {
> 
> The instruction for dword0 and dword1 should be of the same kind,
> so if you will use fast_copy if it is supported then it should
> be used for both dw0 and dw1 as Karolina observed.
> 
>> +		switch (bpp) {
>> +		case 8:
>> +			break;
>> +		case 16:		/* supporting only RGB565, not ARGB1555 */
>> +			br13_bits |= 1 << 24;
>> +			break;
>> +		case 32:
>> +			br13_bits |= 3 << 24;
>> +			cmd_bits |= (XY_SRC_COPY_BLT_WRITE_ALPHA |
>> +				     XY_SRC_COPY_BLT_WRITE_RGB);
>> +			break;
>> +		default:
>> +			igt_fail(IGT_EXIT_FAILURE);
>> +		}
>> +	} else if (blt_has_fast_copy(ibb->i915)) {
> -------------- ^
> Here you can use else without if().
> 
>> +		br13_bits = fast_copy_dword1(ibb->i915, src->tiling, dst->tiling, bpp);
>> +	} else
>> +		igt_assert_f(0, "No supported blit command found\n");
> 
> Same here, no need for that final else.
> 
> Regards,
> Kamil
> 
>>   
>>   	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
>>   		intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
>> -- 
>> 2.25.1
>>
