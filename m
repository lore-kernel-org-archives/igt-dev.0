Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4E410E094
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 10:29:15 +0000 (UTC)
Message-ID: <1750a0e6-c868-4f5a-b1fa-4dd3a5ac0947@intel.com>
Date: Mon, 23 Oct 2023 15:59:09 +0530
MIME-Version: 1.0
Content-Language: en-US
To: "Lobo, Melanie" <melanie.lobo@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
 <20231019180630.20689-1-melanie.lobo@intel.com>
 <b5630343-e691-48ad-9ee7-93ff2eb6733b@intel.com>
 <DS0PR11MB64952CEC04ABDA995ED7EEB788D8A@DS0PR11MB6495.namprd11.prod.outlook.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <DS0PR11MB64952CEC04ABDA995ED7EEB788D8A@DS0PR11MB6495.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] tests/intel/kms_flip_scaled_crc: Add support
 for FP16 compressed formats
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


On 23-Oct-23 3:54 PM, Lobo, Melanie wrote:
> 
> 
>> -----Original Message-----
>> From: Sharma, Swati2 <swati2.sharma@intel.com>
>> Sent: Monday, October 23, 2023 11:10 AM
>> To: Lobo, Melanie <melanie.lobo@intel.com>; igt-dev@lists.freedesktop.org
>> Cc: juhapekka.heikkila@gmail.com; Modem, Bhanuprakash
>> <bhanuprakash.modem@intel.com>; kamil.konieczny@linux.intel.com
>> Subject: Re: [PATCH] tests/intel/kms_flip_scaled_crc: Add support for FP16
>> compressed formats
>>
>> Hi Melanie,
>>
>> It seems tests are skipping on MTLP
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10024/shards-
>> all.html?testfilter=4tilemtlrcccs
>>
>> Test requirement not met in function setup_fb, file
>> ../../../usr/src/igt-gpu-tools/tests/intel/kms_flip_scaled_crc.c:622:
>> Test requirement: igt_display_has_format_mod(&data->display, format,
>> modifier)
>> Dynamic subtest pipe-A-default-mode: SKIP (0.378s)
>>
>> Can you check once?
>>
> 
> Hi Swati,
> This IGT test requires kernel patch https://patchwork.freedesktop.org/patch/563854/?series=124957&rev=4 .
>   May be because of that all the tests skip.
> 
> Regards,
> Melanie Lobo

ohh
Is it possible for you to use "Test-with" used to test combined IGT and 
kernel changes. More details:
https://intel-gfx-ci.01.org/test-with.html

> 
>> On 19-Oct-23 11:36 PM, Melanie Lobo wrote:
>>> MTL supports FP16 format which is a binary floating-point computer
>>> number format that occupies 16 bits in computer memory. In this test
>>> platform shall render compression in display engine to receive
>>> FP16 compressed formats.
>>>
>>> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>>> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> cc: Swati Sharma <swati2.sharma@intel.com>
>>> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
>>> ---
>>>    lib/intel_aux_pgtable.c           |  5 +++++
>>>    tests/intel/kms_flip_scaled_crc.c | 24 ++++++++++++++++++++++++
>>>    2 files changed, 29 insertions(+)
>>>
>>> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c index
>>> 7c79521344de..a612df407692 100644
>>> --- a/lib/intel_aux_pgtable.c
>>> +++ b/lib/intel_aux_pgtable.c
>>> @@ -21,6 +21,7 @@
>>>    #define AUX_FORMAT_AYUV		0x09
>>>    #define AUX_FORMAT_ARGB_8B	0x0A
>>>    #define AUX_FORMAT_NV12_21	0x0F
>>> +#define AUX_FORMAT_XRGB16161616_64B 0x10
>>>
>>>    struct pgtable_level_desc {
>>>    	int idx_shift;
>>> @@ -305,6 +306,10 @@ static uint64_t pgt_get_l1_flags(const struct
>> intel_buf *buf, int surface_idx)
>>>    			entry.e.format = AUX_FORMAT_ARGB_8B;
>>>    			entry.e.depth = bpp_to_depth_val(32);
>>>    			break;
>>> +		case 64:
>>> +			entry.e.format = AUX_FORMAT_XRGB16161616_64B;
>>> +			entry.e.depth = bpp_to_depth_val(64);
>>> +			break;
>>>    		default:
>>>    			igt_assert(0);
>>>    		}
>>> diff --git a/tests/intel/kms_flip_scaled_crc.c
>>> b/tests/intel/kms_flip_scaled_crc.c
>>> index 2997b63fac40..6874f747b280 100644
>>> --- a/tests/intel/kms_flip_scaled_crc.c
>>> +++ b/tests/intel/kms_flip_scaled_crc.c
>>> @@ -142,6 +142,14 @@
>>>     * Mega feature: General Display Features
>>>     * Test category: functionality test
>>>     *
>>> + * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-%s
>>> + * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress
>> CD
>>> + *              clock programming
>>> + * Driver requirement: i915, xe
>>> + * Functionality: ccs, scaling, tiling, vblank
>>> + * Mega feature: General Display Features
>>> + * Test category: functionality test
>>> + *
>>>     * arg[1]:
>>>     *
>>>     * @downscaling:        Downscaled
>>> @@ -406,6 +414,14 @@ const struct {
>>>    		1.0,
>>>    		2.0,
>>>    	},
>>> +	{
>>> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-downscaling",
>>> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to
>> stress CD clock programming",
>>> +		I915_FORMAT_MOD_4_TILED,
>> DRM_FORMAT_XRGB16161616F,
>>> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
>> DRM_FORMAT_XRGB16161616F,
>>> +		1.0,
>>> +		2.0,
>>> +	},
>>>    	{
>>>    		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
>>>    		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress
>> CD
>>> clock programming", @@ -590,6 +606,14 @@ const struct {
>>>    		0.5,
>>>    		1.0,
>>>    	},
>>> +	{
>>> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-upscaling",
>>> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress
>> CD clock programming",
>>> +		I915_FORMAT_MOD_4_TILED,
>> DRM_FORMAT_XRGB16161616F,
>>> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
>> DRM_FORMAT_XRGB16161616F,
>>> +		0.5,
>>> +		1.0,
>>> +	},
>>>    };
>>>
>>>    static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t
>>> width,
