Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <e3b0efd8-7e4a-9bdf-4725-128c4637e806@linux.intel.com>
Date: Thu, 26 Jan 2023 16:09:29 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <20230112174730.1101192-1-tvrtko.ursulin@linux.intel.com>
 <20230112174730.1101192-2-tvrtko.ursulin@linux.intel.com>
 <20230126153938.3iotcb52eawnwbcl@kamilkon-desk1>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230126153938.3iotcb52eawnwbcl@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] intel_gpu_top: Fix man page
 formatting
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


On 26/01/2023 15:39, Kamil Konieczny wrote:
> On 2023-01-12 at 17:47:27 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> New lines are not respected when rst2man generates the page so try to work
>> around that by followin advice from the Internet.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks! Later I noticed there is one more thing which currently renders 
badly, this line:

   -o <file path | ->

Are you okay with re-review if I can fix that one too and respin?

Regards,

Tvrtko

>> ---
>>   man/intel_gpu_top.rst | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/man/intel_gpu_top.rst b/man/intel_gpu_top.rst
>> index 748c7740c800..b0c95446a011 100644
>> --- a/man/intel_gpu_top.rst
>> +++ b/man/intel_gpu_top.rst
>> @@ -53,13 +53,14 @@ RUNTIME CONTROL
>>   
>>   Supported keys:
>>   
>> -    'q'    Exit from the tool.
>> -    'h'    Show interactive help.
>> -    '1'    Toggle between aggregated engine class and physical engine mode.
>> -    'n'    Toggle display of numeric client busyness overlay.
>> -    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
>> -    'i'    Toggle display of clients which used no GPU time.
>> -    'H'    Toggle between per PID aggregation and individual clients.
>> +|
>> +|    'q'    Exit from the tool.
>> +|    'h'    Show interactive help.
>> +|    '1'    Toggle between aggregated engine class and physical engine mode.
>> +|    'n'    Toggle display of numeric client busyness overlay.
>> +|    's'    Toggle between sort modes (runtime, total runtime, pid, client id).
>> +|    'i'    Toggle display of clients which used no GPU time.
>> +|    'H'    Toggle between per PID aggregation and individual clients.
>>   
>>   DEVICE SELECTION
>>   ================
>> -- 
>> 2.34.1
>>
