Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <99a016bd-d3da-154c-4bca-46ff66bb1932@intel.com>
Date: Mon, 1 May 2023 12:44:14 -0700
Content-Language: en-GB
References: <20230425201926.99086-1-John.C.Harrison@Intel.com>
 <20230425201926.99086-2-John.C.Harrison@Intel.com>
 <874jp29urv.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <874jp29urv.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/2] lib/intel_decode:
 Decode Gen12 ring/batch instructions correctly
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On 4/26/2023 14:51, Dixit, Ashutosh wrote:
> On Tue, 25 Apr 2023 13:19:25 -0700, John.C.Harrison@Intel.com wrote:
>> @@ -3623,7 +3624,17 @@ decode_3d_965(struct intel_decode *ctx)
>> 		return len;
>>
>> 	case 0x7a00:
>> -		if (IS_GEN6(devid) || IS_GEN7(devid)) {
>> +		if (IS_GEN12(devid)) {
>> +			if (len != 6)
>> +				fprintf(out, "Bad count in PIPE_CONTROL\n");
>> +			instr_out(ctx, 0, "PIPE_CONTROL\n");
>> +			instr_out(ctx, 1, "flags\n");
>> +			instr_out(ctx, 2, "write address low\n");
>> +			instr_out(ctx, 3, "write address high\n");
>> +			instr_out(ctx, 4, "write data low\n");
>> +			instr_out(ctx, 5, "write data high\n");
>> +			return len;
> Is there a reference for this? I can review but have no idea what's going
> on here. The rest of the patch looks good. Thanks.
Just the bspec definition of PIPE_CONTROL. On later gens it has more 
data - 64bit rather than 32bit addressing I think.

John.

>
>> +		} else if (IS_GEN6(devid) || IS_GEN7(devid)) {
>> 			if (len != 4 && len != 5)
>> 				fprintf(out, "Bad count in PIPE_CONTROL\n");
>>
>> --
>> 2.39.1
>>


