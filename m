Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA78789FD7
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jan 2021 09:59:53 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
Date: Thu, 21 Jan 2021 09:59:48 +0000
Message-ID: <a36d290326d04bcea0907f9b71c79cae@intel.com>
References: <20210120114144.25368-1-jeevan.b@intel.com>
 <20210120122036.GJ7444@platvala-desk.ger.corp.intel.com>
In-Reply-To: <20210120122036.GJ7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/2] tests/kms_rotation_crc: reduce
 execution time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

>-----Original Message-----
>From: Petri Latvala <petri.latvala@intel.com>
>Sent: Wednesday, January 20, 2021 5:51 PM
>To: B, Jeevan <jeevan.b@intel.com>
>Cc: igt-dev@lists.freedesktop.org
>Subject: Re: [igt-dev] [PATCH i-g-t v4 1/2] tests/kms_rotation_crc: reduce
>execution time
>
>On Wed, Jan 20, 2021 at 05:11:43PM +0530, Jeevan B wrote:
>> Restricting the execution to 2 pipes
>> with this change we see 50% improvement in time efficiency.
>>
>> v2: Updated commit message.
>>
>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>  tests/kms_rotation_crc.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
>> 33a97cca..cc404a61 100644
>> --- a/tests/kms_rotation_crc.c
>> +++ b/tests/kms_rotation_crc.c
>> @@ -421,6 +421,10 @@ static void test_plane_rotation(data_t *data, int
>plane_type, bool test_bad_form
>>  		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>>  			continue;
>>
>> +		/* restricting the execution to 2 pipes to reduce execution
>time*/
>> +		if (pipe > PIPE_B && !data->extended)
>> +			break;
>> +
>
>What's the plan for platforms that might have two pipes as A+C?
Hmm, Can we add a flag check here ?? 
So that I can exit when tests gets executed on 2 pipes. 

Thanks
Jeevan B 
>
>
>--
>Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
