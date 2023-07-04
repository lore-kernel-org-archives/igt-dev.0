Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6D010E07A
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 12:41:18 +0000 (UTC)
Message-ID: <f307f97a-506a-4897-46a7-52ce032aa8b6@linux.intel.com>
Date: Tue, 4 Jul 2023 13:41:14 +0100
MIME-Version: 1.0
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
 <20230526064624.2886063-3-mauro.chehab@linux.intel.com>
 <843966cc-f42a-5ec8-34d5-80cb832b8ee1@linux.intel.com>
In-Reply-To: <843966cc-f42a-5ec8-34d5-80cb832b8ee1@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] testplan/meson.build: make it check
 for missing i915 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 04/07/2023 13:28, Tvrtko Ursulin wrote:
> 
> On 26/05/2023 07:46, Mauro Carvalho Chehab wrote:
>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>
>> Now that i915 is fully documented, check it at build time.
> 
> This step seems to be slow as molasses and it also rebuilds the Xe test 
> plan when I touch an i915 test.
> 
> What is the way to disable it all when configuring the build?
> 
> Regards,
> 
> Tvrtko
> 
> P.S. I also find the "now that i915 is fully documented" statement a bit 
> of a chuckle, since random two tests I happened to open haven't really 
> been documented - it rather looks to be a bit of a charade.
> 
> I wouldn't care really apart from it significantly slowing down the 
> development workflow.

# time ninja
[1/448] Generating lib/version.h with a custom command
fatal: not a git repository (or any of the parent directories): .git
[6/6] Generating docs/testplan/i915_tests.rst with a custom command

real    0m24.363s
user    0m6.530s
sys     0m20.968s

24 seconds.. I just changed one i915 test. :(

Regards,

Tvrtko

> 
>> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>> ---
>>   docs/testplan/meson.build | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
>> index 6cd44be5ccd3..bf73dd32a15f 100644
>> --- a/docs/testplan/meson.build
>> +++ b/docs/testplan/meson.build
>> @@ -30,13 +30,13 @@ xe_test_dict = {
>>   if build_xe
>>       test_dict = {
>> -        'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
>> +        'i915_tests': { 'input': i915_test_config, 'extra_args': 
>> check_testlist },
>>           'kms_tests': { 'input': kms_test_config, 'extra_args': [] },
>>           'xe_tests': { 'input': xe_test_config, 'extra_args': 
>> check_testlist }
>>           }
>>   else
>>       test_dict = {
>> -          'i915_tests': { 'input': i915_test_config, 'extra_args': [] },
>> +          'i915_tests': { 'input': i915_test_config, 'extra_args': 
>> check_testlist },
>>             'kms_tests': { 'input': kms_test_config, 'extra_args': [] }
>>           }
>>   endif

