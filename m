Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1B310E499
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 09:16:54 +0000 (UTC)
Message-ID: <cb3cd5ba-639f-bd05-a64a-b78c76cd9de0@intel.com>
Date: Wed, 31 May 2023 14:46:48 +0530
MIME-Version: 1.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230529164022.339814-1-swati2.sharma@intel.com>
 <20230530173510.qi55lelzipcdclit@zkempczy-mobl2>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230530173510.qi55lelzipcdclit@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_dsc: add limited flag
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



On 30-May-23 11:05 PM, Zbigniew Kempczyński wrote:
> On Mon, May 29, 2023 at 10:10:22PM +0530, Swati Sharma wrote:
>> Add limited flag to restrict test execution to one valid pipe-output
>> combination. By default all tests will run on all valid pipe-output
>> combinations.
>>
>> v2: -rename extended to limited (Kamil)
>>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/i915/kms_dsc.c | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
>> index 3ce28f84..9ddb441d 100644
>> --- a/tests/i915/kms_dsc.c
>> +++ b/tests/i915/kms_dsc.c
>> @@ -51,6 +51,7 @@ typedef struct {
>>   	int input_bpc;
>>   	int disp_ver;
>>   	enum pipe pipe;
>> +	bool limited;
>>   } data_t;
>>   
>>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>> @@ -250,13 +251,34 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
>>   
>>   		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name, name)
>>   			update_display(data, test_type);
>> +
>> +		if (data->limited)
>> +			break;
>>   	}
>>   }
>>   
>> -igt_main
>> +static int opt_handler(int opt, int opt_index, void *_data)
>>   {
>> -	data_t data = {};
> 
> You don't need to introduce static data below, handler has pointer
> to it, and functions are called with &data so keeping this on stack
> is better for me (protects from global access in any place).
> 
>> +	data_t *data = _data;
>> +
>> +	switch (opt) {
>> +	case 'l':
>> +		data->limited = true;
>> +		break;
>> +	default:
>> +		return IGT_OPT_HANDLER_ERROR;
>> +	}
>> +
>> +	return IGT_OPT_HANDLER_SUCCESS;
>> +}
>> +
>> +static const char help_str[] =
>> +	"  --limited\t\tLimit execution to 1 valid pipe-output combo\n";
> 
> I see you're using short option '-l', just add this to line above like:
> 
> "  --limited\t-l\tLimit ..."
> 
>>   
>> +static data_t data = {};
> 
> Keep this on stack. With this nit fixed:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thanks Zbigniew for the review. With above changes floated v3.

> 
> --
> Zbigniew
> 
>> +
>> +igt_main_args("l", NULL, help_str, opt_handler, &data)
>> +{
>>   	igt_fixture {
>>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>>   		data.devid = intel_get_drm_devid(data.drm_fd);
>> -- 
>> 2.25.1
>>
