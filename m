Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857AD90C27
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jul 2022 21:53:29 +0000 (UTC)
Message-ID: <7b89978b-eeb4-0e03-ca88-75586cec7423@amd.com>
Date: Fri, 22 Jul 2022 17:53:24 -0400
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <maira.canal@usp.br>,
 igt-dev@lists.freedesktop.org
References: <20220611190310.654069-1-maira.canal@usp.br>
 <d26f8d7f-4ca3-18ed-f3b6-81b032f0068b@usp.br>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <d26f8d7f-4ca3-18ed-f3b6-81b032f0068b@usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu: Skip multihead MPO tests
 on single display
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: magalilemes00@gmail.com, tales.aparecida@gmail.com,
 Alexander Deucher <alexander.deucher@amd.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Bhawanpreet.Lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-07-12 19:45, Maíra Canal wrote:
> Hi,
> 
> Any chance this commit be merged into master?
> 
> Best Regards,
> - Maíra Canal
> 
> On 6/11/22 16:03, Maíra Canal wrote:
>> [Why]
>> If only one output is connected, all the igt@amdgpu/amd_plane "-multihead"
>> subtests will result in CRASH, such as can be seen in:
>>
>> Starting subtest: mpo-scale-nv12-multihead
>> Received signal SIGSEGV.
>> Stack trace:
>>   #0 [fatal_sig_handler+0x163]
>>   #1 [__sigaction+0x50]
>>   #2 [force_output_mode+0xa]
>>   #3 [test_display_mpo+0x20b]
>>   #4 [__igt_unique____real_main725+0x106d]
>>   #5 [main+0x23]
>>   #6 [__libc_start_call_main+0x80]
>>   #7 [__libc_start_main+0x89]
>>   #8 [_start+0x25]
>> Subtest mpo-scale-nv12-multihead: CRASH (0.009s)
>>
>> In single-display systems, the "-multihead" subtests should SKIP.
>>
>> [How]
>> Count the number of connected outputs on the system and compare it to the
>> ideal number depending on the subtest, using igt_skip_on to assure that
>> multiheaded subtests will SKIP on single display systems.
>>
>> Signed-off-by: Maíra Canal <maira.canal@usp.br>
>> ---
>>   tests/amdgpu/amd_plane.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
>> index faaa1b87..4b2bee49 100644
>> --- a/tests/amdgpu/amd_plane.c
>> +++ b/tests/amdgpu/amd_plane.c
>> @@ -449,9 +449,11 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>>   {
>>   
>>   	igt_display_t *display = &data->display;
>> +	igt_output_t *output;
>>   	uint32_t regamma_lut_size;
>>   	lut_t lut;
>>   	struct fbc fb[4];
>> +	int valid_outputs = 0;
>>   	int videos[][2]= {
>>   		{426, 240},
>>   		{640, 360},
>> @@ -464,6 +466,13 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
>>   
>>   	test_init(data);
>>   
>> +	/* Skip if there is less valid outputs than the required. */
>> +	for_each_connected_output(display, output)
>> +		valid_outputs++;
>> +
>> +	igt_skip_on_f(valid_outputs < display_count,
>> +			"Valid outputs (%d) should be equal or greater than %d\n", valid_outputs, display_count);
>> +
>>   	regamma_lut_size = igt_pipe_obj_get_prop(data->pipe[0], IGT_CRTC_GAMMA_LUT_SIZE);
>>   	igt_assert_lt(0, regamma_lut_size);
>>   	lut_init(&lut, regamma_lut_size);
>> @@ -586,9 +595,17 @@ static void test_mpo_swizzle_toggle_multihead(data_t *data)
>>   {
>>   	struct amdgpu_bo_metadata meta = {};
>>   	igt_display_t *display = &data->display;
>> +	igt_output_t *output;
>>   	igt_fb_t fb_1280_xr24_tiled, fb_1280_ar24_tiled, fb_1920_xb24_tiled,
>>   		fb_1920_xb24_linear, fb_1920_xr24_tiled;
>>   	int w, h;
>> +	int valid_outputs = 0;
>> +
>> +	/* Skip if only one display is connected. */
>> +	for_each_connected_output(display, output)
>> +		valid_outputs++;
>> +
>> +	igt_skip_on_f(valid_outputs == 1, "Must have more than one output connected\n");
>>   
>>   	w = 2400;
>>   	h = 1350;

Hi Maira,

V2 applied in the upstream, see:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a0e2b99ed37499c68504f837c2b351162e0e1f34

Thanks a lot for this patch!

Siqueira
