Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 18 Sep 2023 10:17:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <acuibqhswa7alrjto7uokpwcfzisbyxmrnkvbb3usdyco2kuct@wdtecpkkythn>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-14-lucas.demarchi@intel.com>
 <20230918075740.gswvt6joydhzbyfc@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918075740.gswvt6joydhzbyfc@zkempczy-mobl2>
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 13/14] lib/intel_blt: Support
 xe2 in xy-fast-copy command
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 09:57:40AM +0200, Zbigniew Kempczyński wrote:
>On Fri, Sep 15, 2023 at 06:23:45AM -0700, Lucas De Marchi wrote:
>> Xe2 xy-fast-copy command is slightly different, with dw01 and dw07
>> having a few differences: 1) different bitrange for mocs (it was
>> previously absent in dw07); 2) no dst_memory, src_memory;
>> 3) hardcoded dst_type_y and src_type_y to 1.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/intel_blt.c | 76 +++++++++++++++++++++++++++++++++++--------------
>>  1 file changed, 55 insertions(+), 21 deletions(-)
>>
>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> index 0658d67f4..508c2de46 100644
>> --- a/lib/intel_blt.c
>> +++ b/lib/intel_blt.c
>> @@ -1149,16 +1149,27 @@ struct gen12_fast_copy_data {
>>  		uint32_t client:			BITRANGE(29, 31);
>>  	} dw00;
>>
>> -	struct {
>> -		uint32_t dst_pitch:			BITRANGE(0, 15);
>> -		uint32_t rsvd1:				BITRANGE(16, 23);
>> -		uint32_t color_depth:			BITRANGE(24, 26);
>> -		uint32_t rsvd0:				BITRANGE(27, 27);
>> -		uint32_t dst_memory:			BITRANGE(28, 28);
>> -		uint32_t src_memory:			BITRANGE(29, 29);
>> -		uint32_t dst_type_y:			BITRANGE(30, 30);
>> -		uint32_t src_type_y:			BITRANGE(31, 31);
>> -	} dw01;
>> +	union {
>> +		struct {
>> +			uint32_t dst_pitch:			BITRANGE(0, 15);
>> +			uint32_t rsvd1:				BITRANGE(16, 23);
>> +			uint32_t color_depth:			BITRANGE(24, 26);
>> +			uint32_t rsvd0:				BITRANGE(27, 27);
>> +			uint32_t dst_memory:			BITRANGE(28, 28);
>> +			uint32_t src_memory:			BITRANGE(29, 29);
>> +			uint32_t dst_type_y:			BITRANGE(30, 30);
>> +			uint32_t src_type_y:			BITRANGE(31, 31);
>> +		} dw01;
>> +		struct {
>> +			uint32_t dst_pitch:			BITRANGE(0, 15);
>> +			uint32_t rsvd1:				BITRANGE(16, 19);
>
>Similar to block-copy bit 17 is not described here for Xe2.

same reason to merge the fields as explained there.

>
>> +			uint32_t dst_mocs:			BITRANGE(20, 23);
>> +			uint32_t color_depth:			BITRANGE(24, 26);
>> +			uint32_t rsvd0:				BITRANGE(27, 29);
>> +			uint32_t dst_type_y_mb1:		BITRANGE(30, 30);
>> +			uint32_t src_type_y_mb1:		BITRANGE(31, 31);
>> +		} dw01_xe2;
>> +	};
>>
>>  	struct {
>>  		int32_t dst_x1:				BITRANGE(0, 15);
>> @@ -1183,10 +1194,18 @@ struct gen12_fast_copy_data {
>>  		int32_t src_y1:				BITRANGE(16, 31);
>>  	} dw06;
>>
>> -	struct {
>> -		uint32_t src_pitch:			BITRANGE(0, 15);
>> -		uint32_t rsvd0:				BITRANGE(16, 31);
>> -	} dw07;
>> +	union {
>> +		struct {
>> +			uint32_t src_pitch:			BITRANGE(0, 15);
>> +			uint32_t rsvd0:				BITRANGE(16, 31);
>> +		} dw07;
>> +		struct {
>> +			uint32_t src_pitch:			BITRANGE(0, 15);
>> +			uint32_t rsvd0:				BITRANGE(16, 19);
>> +			uint32_t src_mocs:			BITRANGE(20, 23);
>> +			uint32_t rsvd1:				BITRANGE(24, 31);
>> +		} dw07_xe2;
>> +	};
>>
>>  	struct {
>>  		uint32_t src_address_lo;
>> @@ -1285,11 +1304,13 @@ uint64_t emit_blt_fast_copy(int fd,
>>  			    uint64_t bb_pos,
>>  			    bool emit_bbe)
>>  {
>> +	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>>  	struct gen12_fast_copy_data data = {};
>>  	uint64_t dst_offset, src_offset, bb_offset, alignment;
>>  	uint32_t bbe = MI_BATCH_BUFFER_END;
>>  	uint32_t *bb;
>>
>> +
>>  	alignment = get_default_alignment(fd, blt->driver);
>>
>>  	data.dw00.client = 0x2;
>> @@ -1298,12 +1319,20 @@ uint64_t emit_blt_fast_copy(int fd,
>>  	data.dw00.src_tiling = __fast_tiling(blt->src.tiling);
>>  	data.dw00.length = 8;
>>
>> -	data.dw01.dst_pitch = blt->dst.pitch;
>> -	data.dw01.color_depth = __fast_color_depth(blt->color_depth);
>> -	data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
>> -	data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
>> -	data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
>> -	data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
>> +	if (ip_ver >= IP_VER(20, 0)) {
>> +		data.dw01_xe2.dst_pitch = blt->dst.pitch;
>> +		data.dw01_xe2.dst_mocs = blt->dst.mocs;
>> +		data.dw01_xe2.color_depth = __fast_color_depth(blt->color_depth);
>> +		data.dw01_xe2.dst_type_y_mb1 = 1;
>> +		data.dw01_xe2.src_type_y_mb1 = 1;
>
>I would rather use:
>
>src_type_y = 1; /* Must be programmed to on Xe2 */
>...
>
>mb1 - ambiguous for me, megabytes first, lesser 'must be'.

yeah, usually we have "mbz" as "must be zero", so tried to extend it to
"must be one".


I will change this on next version.

>
>> +	} else {
>> +		data.dw01.dst_pitch = blt->dst.pitch;
>> +		data.dw01.color_depth = __fast_color_depth(blt->color_depth);
>> +		data.dw01.dst_memory = __memory_type(blt->fd, blt->driver, blt->dst.region);
>> +		data.dw01.src_memory = __memory_type(blt->fd, blt->driver, blt->src.region);
>> +		data.dw01.dst_type_y = __new_tile_y_type(blt->dst.tiling) ? 1 : 0;
>> +		data.dw01.src_type_y = __new_tile_y_type(blt->src.tiling) ? 1 : 0;
>> +	}
>>
>>  	data.dw02.dst_x1 = blt->dst.x1;
>>  	data.dw02.dst_y1 = blt->dst.y1;
>> @@ -1323,7 +1352,12 @@ uint64_t emit_blt_fast_copy(int fd,
>>  	data.dw06.src_x1 = blt->src.x1;
>>  	data.dw06.src_y1 = blt->src.y1;
>>
>> -	data.dw07.src_pitch = blt->src.pitch;
>> +	if (ip_ver >= IP_VER(20, 0)) {
>> +		data.dw07_xe2.src_pitch = blt->src.pitch;
>> +		data.dw07_xe2.src_mocs = blt->src.mocs;
>> +	} else {
>> +		data.dw07.src_pitch = blt->src.pitch;
>> +	}
>>
>>  	data.dw08.src_address_lo = src_offset;
>>  	data.dw09.src_address_hi = src_offset >> 32;
>> --
>> 2.40.1
>>
>
>With my minor comment addressed:
>
>Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

thanks
Lucas De Marchi

>
>--
>Zbigniew
