Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469F210E4B7
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 07:26:47 +0000 (UTC)
Message-ID: <5082cafe-d957-9012-4b93-845bf68b3ac4@intel.com>
Date: Thu, 23 Feb 2023 12:56:31 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>
References: <20230222104806.4817-1-swati2.sharma@intel.com>
 <20230222104806.4817-2-swati2.sharma@intel.com>
 <20230222143507.tt2afueeos3vpf5r@kamilkon-desk1>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230222143507.tt2afueeos3vpf5r@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_hdr: Add negative test
 for invalid metadata sizes
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

Thanks for the reviews! Patch pushed.

On 22-Feb-23 8:05 PM, Kamil Konieczny wrote:
> Hi Swati,
> 
> On 2023-02-22 at 16:18:05 +0530, Swati Sharma wrote:
>> Negative test is added in which HDR output metadata prop is
>> set with invalid sizes.
>>
>> v2: -Fixed nitpicks (Kamil)
>>      -Add cleanup (Kamil)
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> 
> Lgtm,
> 
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
>> ---
>>   tests/kms_hdr.c | 35 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>
>> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
>> index 655c3e14f..63b03089b 100644
>> --- a/tests/kms_hdr.c
>> +++ b/tests/kms_hdr.c
>> @@ -50,6 +50,7 @@ enum {
>>   	TEST_DPMS = 1 << 1,
>>   	TEST_SUSPEND = 1 << 2,
>>   	TEST_SWAP = 1 << 3,
>> +	TEST_INVALID_METADATA_SIZES = 1 << 4,
>>   };
>>   
>>   /* BPC connector state. */
>> @@ -327,6 +328,18 @@ static void set_hdr_output_metadata(data_t *data,
>>   				     meta ? sizeof(*meta) : 0);
>>   }
>>   
>> +/* Sets the HDR output metadata prop with invalid size. */
>> +static int set_invalid_hdr_output_metadata(data_t *data,
>> +					   struct hdr_output_metadata const *meta,
>> +					   size_t length)
>> +{
>> +	igt_output_replace_prop_blob(data->output,
>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> +				     meta ? length : 0);
>> +
>> +	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +}
>> +
>>   /* Converts a double to 861-G spec FP format. */
>>   static uint16_t calc_hdr_float(double val)
>>   {
>> @@ -518,6 +531,22 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
>>   	igt_remove_fb(data->fd, &afb);
>>   }
>>   
>> +static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
>> +{
>> +	struct hdr_output_metadata hdr;
>> +	size_t metadata_size = sizeof(hdr);
>> +
>> +	fill_hdr_output_metadata_st2048(&hdr);
>> +
>> +	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
>> +	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
>> +	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
>> +	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
>> +
>> +	test_fini(data);
>> +	igt_remove_fb(data->fd, &afb);
>> +}
>> +
>>   /* Returns true if an output supports HDR metadata property. */
>>   static bool has_hdr(igt_output_t *output)
>>   {
>> @@ -565,6 +594,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>>   						test_static_toggle(data, pipe, output, flags);
>>   					if (flags & TEST_SWAP)
>>   						test_static_swap(data, pipe, output);
>> +					if (flags & TEST_INVALID_METADATA_SIZES)
>> +						test_invalid_metadata_sizes(data, output);
>>   				}
>>   
>>   				/* One pipe is enough */
>> @@ -613,6 +644,10 @@ igt_main
>>   	igt_subtest_with_dynamic("static-swap")
>>   		test_hdr(&data, TEST_SWAP);
>>   
>> +	igt_describe("Tests invalid HDR metadata sizes");
>> +	igt_subtest_with_dynamic("invalid-metadata-sizes")
>> +		test_hdr(&data, TEST_INVALID_METADATA_SIZES);
>> +
>>   	igt_fixture {
>>   		igt_display_fini(&data.display);
>>   		close(data.fd);
>> -- 
>> 2.25.1
>>

-- 
~Swati Sharma
