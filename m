Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247BA10E432
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 06:01:36 +0000 (UTC)
Message-ID: <733391a9-56b0-fbe2-0f9a-25414e65ffda@intel.com>
Date: Tue, 31 May 2022 11:31:23 +0530
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20220530062959.18257-1-karthik.b.s@intel.com>
 <20220530062959.18257-2-karthik.b.s@intel.com>
 <13a03ece-4109-cc46-dd33-565fdec1a3fb@igalia.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <13a03ece-4109-cc46-dd33-565fdec1a3fb@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/2] tests/kms_async_flips: Convert
 tests to dynamic
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

On 5/31/2022 12:57 AM, André Almeida wrote:
> Hi Karthik,
Hi Andre,
> Às 03:29 de 30/05/22, Karthik B S escreveu:
>
> [...]
>
>>   
>>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
>> -		igt_subtest("async-flip-with-page-flip-events")
>> -			test_async_flip(&data, false);
>> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>> +			for_each_pipe(&data.display, pipe) {
>> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>> +						data.output = output;
>> +						data.pipe = pipe;
>> +						test_async_flip(&data, false);
>> +					}
>> +
>> +					if (!data.extended)
>> +						break;
>> +				}
>> +			}
>> +		}
>>   
>>   		igt_describe("Alternate between sync and async flips");
>> -		igt_subtest("alternate-sync-async-flip")
>> -			test_async_flip(&data, true);
>> +		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>> +			for_each_pipe(&data.display, pipe) {
>> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>> +						data.output = output;
>> +						data.pipe = pipe;
>> +						test_async_flip(&data, true);
>> +					}
>> +
>> +					if (!data.extended)
>> +						break;
>> +				}
>> +			}
>> +		}
>>   
>>   		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
>> -		igt_subtest("test-time-stamp")
>> -			test_timestamp(&data);
>> +		igt_subtest_with_dynamic("test-time-stamp") {
>> +			for_each_pipe(&data.display, pipe) {
>> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>> +						data.output = output;
>> +						data.pipe = pipe;
>> +						test_timestamp(&data);
>> +					}
>> +
>> +					if (!data.extended)
>> +						break;
>> +				}
>> +			}
>> +		}
>>   
>>   		igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
>> -		igt_subtest("test-cursor")
>> -			test_cursor(&data);
>> +		igt_subtest_with_dynamic("test-cursor") {
>> +			for_each_pipe(&data.display, pipe) {
>> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>> +						data.output = output;
>> +						data.pipe = pipe;
>> +						test_cursor(&data);
>> +					}
>> +
>> +					if (!data.extended)
>> +						break;
>> +				}
>> +			}
>> +		}
>>   
>>   		igt_describe("Negative case to verify if changes in fb are rejected from kernel as expected");
>> -		igt_subtest("invalid-async-flip")
>> -			test_invalid(&data);
>> +		igt_subtest_with_dynamic("invalid-async-flip") {
>> +			for_each_pipe(&data.display, pipe) {
>> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>> +						data.output = output;
>> +						data.pipe = pipe;
>> +						test_invalid(&data);
>> +					}
>> +
>> +					if (!data.extended)
>> +						break;
>> +				}
>> +			}
>> +		}
>>   
>>   		igt_describe("Use CRC to verify async flip scans out the correct framebuffer");
>> -		igt_subtest("crc")
>> -			test_crc(&data);
>> +		igt_subtest_with_dynamic("crc") {
>> +			for_each_pipe(&data.display, pipe) {
>> +				for_each_valid_output_on_pipe(&data.display, pipe, output) {
>> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
>> +						data.output = output;
>> +						data.pipe = pipe;
>> +						test_crc(&data);
>> +					}
>> +
>> +					if (!data.extended)
>> +						break;
>> +				}
>> +			}
>> +		}
>>   
> I think this is too much code repetition, maybe we could have a helper
> function here?

Sure, will add a helper for this.

Thanks,
Karthik.B.S

