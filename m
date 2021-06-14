Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E39289D84
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 10:04:35 +0000 (UTC)
References: <20210614082746.7951-1-karthik.b.s@intel.com>
 <3c9716b4408c43d09b6a81c47ce96a49@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <551c9e3f-7dc9-4051-f43b-149bd54fc1d3@intel.com>
Date: Mon, 14 Jun 2021 15:34:31 +0530
MIME-Version: 1.0
In-Reply-To: <3c9716b4408c43d09b6a81c47ce96a49@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Assign the proper
 output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Joshi, Kunal1" <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On 6/14/2021 3:17 PM, Kulkarni, Vandita wrote:
>> -----Original Message-----
>> From: B S, Karthik <karthik.b.s@intel.com>
>> Sent: Monday, June 14, 2021 1:58 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Kulkarni, Vandita <vandita.kulkarni@intel.com>; Joshi, Kunal1
>> <kunal1.joshi@intel.com>; B S, Karthik <karthik.b.s@intel.com>
>> Subject: [PATCH i-g-t] tests/kms_dp_dsc: Assign the proper output
>>
>> Use 'output' here rather than 'data->output' as it is still not populated.
>>
>> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/3494
> Fixes - patch that introduced this
> Closes - issue id
> With that fixed,
> LGTM.
> Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>

Thank you for the rb. I will update the patch accordingly.

Thanks,

Karthik.B.S

>
> Thanks,
> Vandita
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/kms_dp_dsc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c index
>> 2446fd82..12180b19 100644
>> --- a/tests/kms_dp_dsc.c
>> +++ b/tests/kms_dp_dsc.c
>> @@ -228,7 +228,7 @@ static void run_test(data_t *data, igt_output_t
>> *output,  {
>>   	enum pipe pipe;
>>
>> -	data->mode = igt_output_get_mode(data->output);
>> +	data->mode = igt_output_get_mode(output);
>>   	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
>>   			      data->mode->vdisplay,
>>   			      DRM_FORMAT_XRGB8888,
>> --
>> 2.22.0


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
