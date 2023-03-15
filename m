Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB8A10E8D5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Mar 2023 15:12:22 +0000 (UTC)
Message-ID: <40812c0b-09f4-3020-4546-605086a5f309@intel.com>
Date: Wed, 15 Mar 2023 16:11:17 +0100
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <cover.1678804829.git.karolina.stolarek@intel.com>
 <086a30feb1e8015eaf3b362e9e09cea50c97a39d.1678804829.git.karolina.stolarek@intel.com>
 <20230315104918.gcyjwmovyzct7rxx@zkempczy-mobl2>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230315104918.gcyjwmovyzct7rxx@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 6/8] tests/i915/gem_blits: Add
 XY_FAST_COPY_BLT support for gem_blits
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

On 15.03.2023 11:49, Zbigniew Kempczyński wrote:
> On Tue, Mar 14, 2023 at 03:44:38PM +0100, Karolina Stolarek wrote:
>> From: Arjun Melkaveri <arjun.melkaveri@intel.com>
>>
>> Test case uses legacy command XY_SRC_COPY_BLT_CMD which is not supported
>> on newer generations. Modify test to use XY_FAST_COPY_BLT.
> 
> Description doesn't match the patch.

Huh, you're right, that's an oversight on my part. Will correct it in 
the next version.

> 
>>
>> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
>> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   tests/i915/gem_blits.c | 21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
>> index e5ef3662..b38d6c7e 100644
>> --- a/tests/i915/gem_blits.c
>> +++ b/tests/i915/gem_blits.c
>> @@ -216,7 +216,12 @@ static void buffer_set_tiling(const struct device *device,
>>   
>>   	if (!blt_has_xy_src_copy(device->fd)) {
>>   		batch[i++] = fast_copy_dword0(buffer->tiling, tiling);
>> -		dword1 = fast_copy_dword1(buffer->tiling, tiling, 32);
>> +		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
>> +		dword1 = fast_copy_dword1(buffer->tiling ?
>> +					  I915_TILING_Yf : I915_TILING_NONE,
>> +					  tiling ?
>> +					  I915_TILING_Yf : I915_TILING_NONE,
>> +					  32);
>>   		batch[i++] = dword1 | pitch;
>>   	} else {
>>   		batch[i] = (XY_SRC_COPY_BLT_CMD |
>> @@ -361,8 +366,11 @@ static bool blit_to_linear(const struct device *device,
>>   	}
>>   
>>   	if (!blt_has_xy_src_copy(device->fd)) {
>> -		batch[i++] = fast_copy_dword0(buffer->tiling, I915_TILING_NONE);
>> -		dword1 = fast_copy_dword1(buffer->tiling, I915_TILING_NONE, 32);
>> +		batch[i++] = fast_copy_dword0(buffer->tiling, 0);
>> +		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
>> +		dword1 = fast_copy_dword1(buffer->tiling ?
>> +					  I915_TILING_Yf : I915_TILING_NONE,
>> +					  0, 32);
> 
> Is that comment adequate to fast_copy_dword1()? Where's tile4 bit set in this patch?

In dw1, we set bits 31 and 30 to specify if we're using new TileY format 
(i.e. Tile4). MTL doesn't support the legacy format, so we have to 
override it here. Come to think of it, we could write something like:

dword1 = fast_copy_dword1(src->tiling == T_YMAJOR,
			  dst->tiling == T_YMAJOR, 32);

to set the required bits.

Thoughts?


All the best,
Karolina
> 
> --
> Zbigniew
> 
> 
>>   		batch[i++] = dword1 | buffer->stride;
>>   	} else {
>>   		batch[i] = (XY_SRC_COPY_BLT_CMD |
>> @@ -705,7 +713,12 @@ blit(const struct device *device,
>>   
>>   	if (!blt_has_xy_src_copy(device->fd)) {
>>   		batch[i++] = fast_copy_dword0(src->tiling, dst->tiling);
>> -		dword1 = fast_copy_dword1(src->tiling, dst->tiling, 32);
>> +		/* Post ATS-M platforms require tile4 bit to be set for YMAJOR mode */
>> +		dword1 = fast_copy_dword1(src->tiling ?
>> +					  I915_TILING_Yf : I915_TILING_NONE,
>> +					  dst->tiling ?
>> +					  I915_TILING_Yf : I915_TILING_NONE,
>> +					  32);
>>   		batch[i++] = dword1 | pitch;
>>   	} else {
>>   		batch[i] = (XY_SRC_COPY_BLT_CMD |
>> -- 
>> 2.25.1
>>
