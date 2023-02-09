Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <2825c998-3e11-ccc0-0e0a-ebb874d569fb@linux.intel.com>
Date: Thu, 9 Feb 2023 08:24:56 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Caleb Callaway <caleb.callaway@intel.com>
References: <20230203111636.4138202-1-tvrtko.ursulin@linux.intel.com>
 <20230203111636.4138202-2-tvrtko.ursulin@linux.intel.com>
 <20230208123142.zudgou6bjt7qbin4@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230208123142.zudgou6bjt7qbin4@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/3] intel_gpu_top: Do not
 repeat header lines in non-interactive output
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


On 08/02/2023 12:31, Kamil Konieczny wrote:
> Hi Tvrtko,
> 
> one small nit, see below.
> 
> On 2023-02-03 at 11:16:34 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> If output is redirected to a file, or a pipe, lets not repeat the headers
>> because that can usually mean user is trying to parse the data later and
>> so repeated headers are a hindrance.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Caleb Callaway <caleb.callaway@intel.com>
>> ---
>>   tools/intel_gpu_top.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 0a1de41b3374..e2a7f4753099 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -1391,6 +1391,7 @@ static unsigned int stdout_level;
>>   
>>   #define STDOUT_HEADER_REPEAT 20
>>   static unsigned int stdout_lines = STDOUT_HEADER_REPEAT;
>> +static bool stdout_header_repeat;
>>   
>>   static void
>>   stdout_open_struct(const char *name)
>> @@ -1580,16 +1581,22 @@ static const struct print_operations term_pops = {
>>   
>>   static bool print_groups(struct cnt_group **groups)
>>   {
>> -	unsigned int headers = stdout_lines % STDOUT_HEADER_REPEAT + 1;
>> +	static bool headers_printed = false;
> ----------------------------------- ^
> Remove this initialization (use checkpatch from Linux kernel).
> 
> Please correct and resend (you can keep my r-b).

Fixed and pushed, thanks for the review!

Regards,

Tvrtko
