Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8B1112A6B
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 20:45:17 +0000 (UTC)
Message-ID: <b604bb7f-2a2c-5569-2c37-ee1beb219593@quicinc.com>
Date: Tue, 14 Jun 2022 13:45:16 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Petri Latvala <petri.latvala@intel.com>
References: <20220609170514.138-1-quic_jesszhan@quicinc.com>
 <YqiQVyLDEAlyklWM@platvala-desk.ger.corp.intel.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <YqiQVyLDEAlyklWM@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_debugfs: Add IGT_CRC_SOURCE
 environmental variable
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 6/14/2022 6:42 AM, Petri Latvala wrote:
> On Thu, Jun 09, 2022 at 10:05:14AM -0700, Jessica Zhang wrote:
>> Adds support for the IGT_CRC_SOURCE environmental variable to make it
>> easier for drivers to run tests using custom CRC sources.
>>
>> Example usage:
>> 	`IGT_CRC_SOURCE=intf ./kms_pipe_crc_basic`
>>
>> If the IGT_CRC_SOURCE isn't set, use the original source that was passed
>> in as a parameter to pipe_crc_new().
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   lib/igt_debugfs.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
>> index 7e7ccf22c455..f9404acc3942 100644
>> --- a/lib/igt_debugfs.c
>> +++ b/lib/igt_debugfs.c
>> @@ -719,9 +719,15 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>>   	igt_pipe_crc_t *pipe_crc;
>>   	char buf[128];
>>   	int debugfs;
>> +	char *env_source;
> 
> const char *
> 
> 
> With that fixed,
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

Applied after taking in the `const char *` change. Thanks!

- Jessica Zhang

> 
> 
>>   
>>   	igt_assert(source);
>>   
>> +	env_source = getenv("IGT_CRC_SOURCE");
>> +
>> +	if (!env_source)
>> +		env_source = source;
>> +
>>   	debugfs = igt_debugfs_dir(fd);
>>   	igt_assert(debugfs != -1);
>>   
>> @@ -736,7 +742,7 @@ pipe_crc_new(int fd, enum pipe pipe, const char *source, int flags)
>>   	pipe_crc->fd = fd;
>>   	pipe_crc->dir = debugfs;
>>   	pipe_crc->pipe = pipe;
>> -	pipe_crc->source = strdup(source);
>> +	pipe_crc->source = strdup(env_source);
>>   	igt_assert(pipe_crc->source);
>>   	pipe_crc->flags = flags;
>>   
>> -- 
>> 2.31.0
>>
