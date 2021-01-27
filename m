Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341E56E323
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jan 2021 13:54:51 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p15so1984611wrq.8
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Jan 2021 05:54:51 -0800 (PST)
References: <20210121183522.26799-1-jeevan.b@intel.com>
 <YBFRf8IVk1zSAU0l@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <d2087e19-7987-9973-9326-69b9e29b3bb5@gmail.com>
Date: Wed, 27 Jan 2021 15:54:43 +0200
MIME-Version: 1.0
In-Reply-To: <YBFRf8IVk1zSAU0l@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation_crc: reduce
 execution time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 27.1.2021 13.41, Petri Latvala wrote:
> On Fri, Jan 22, 2021 at 12:05:21AM +0530, Jeevan B wrote:
>> Restricting the execution to 2 pipes
>> with this change we see 50% improvement in time efficiency.
>>
>> v2: Updated commit message
>> v3: Updated check condition
>>
>> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> No objections from me but I'd like someone more knowledgeable with the
> display code than myself to assess whether limiting this to the first
> two pipes doesn't leave a glaring coverage gap. J-P maybe?
> 

I'm ok with this change. Other pipes are tested by other kms tests which 
are not as slow.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

>> ---
>>   tests/kms_rotation_crc.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
>> index 33a97cca..e7072e20 100644
>> --- a/tests/kms_rotation_crc.c
>> +++ b/tests/kms_rotation_crc.c
>> @@ -405,6 +405,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>>   	igt_display_t *display = &data->display;
>>   	igt_output_t *output;
>>   	enum pipe pipe;
>> +	int pipe_count = 0;
>>   
>>   	if (plane_type == DRM_PLANE_TYPE_CURSOR)
>>   		igt_require(display->has_cursor_plane);
>> @@ -421,6 +422,11 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>>   		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>>   			continue;
>>   
>> +		/* restricting the execution to 2 pipes to reduce execution time*/
>> +		if (pipe_count == 2 && !data->extended)
>> +			break;
>> +		pipe_count++;
>> +
>>   		igt_output_set_pipe(output, pipe);
>>   
>>   		plane = igt_output_get_plane_type(output, plane_type);
>> -- 
>> 2.19.1
>>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
