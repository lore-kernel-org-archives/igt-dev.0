Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F1210E129
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 12:35:22 +0000 (UTC)
Message-ID: <9ef66eae-d450-f2d9-0d6e-ebebabd363ad@intel.com>
Date: Thu, 13 Jul 2023 18:05:04 +0530
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230713071757.246298-1-kunal1.joshi@intel.com>
 <20230713115338.alt3z6l36d3xhi2x@kamilkon-desk1>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230713115338.alt3z6l36d3xhi2x@kamilkon-desk1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/intel-ci/xe.blocklist: Add discarded
 tests in blocklist
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


On 7/13/2023 5:23 PM, Kamil Konieczny wrote:
> Hi Kunal,
>
> small nit regarding subject:
>
> [PATCH] tests/intel-ci/xe.blocklist: Add discarded tests in blocklist
> ------------------------- ^ ------------------------------- ^
>
> You already have 'blocklist' there, no need for repeatition, also
> below you wrote about "not present" ones, so maybe:
>
> [PATCH] tests/intel-ci/xe.blocklist: Add not present tests
>
> On 2023-07-13 at 12:47:57 +0530, Kunal Joshi wrote:
>> Chamelium and PSR config is not present on XE bat as of now
>> and hang tests are yet to be enabled hence added them in blocklist
> --------------------------------------------------------------------^
> Put dot "." at end of sentence.
>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   tests/intel-ci/xe.blocklist.txt | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
>> index 02edeb6b6..43bd360a8 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -82,3 +82,11 @@ igt@kms_plane_lowres@tiling-(4|x|y|yf)
>>   ##################################################################
>>   igt@xe_sysfs*
>>   ##################################################################
>> +# No chamelium/psr setup on XE bat
>> +##################################################################
>> +igt@.*chamelium.*
>> +igt@.*psr.*
>> +##################################################################
>> +# Hang tests not yet enabled
>> +##################################################################
>> +igt@kms_pipe_crc_basic@hang-read-crc
> Why only this one? Maybe it should be:
> igt@kms_.*@.*hang.*
>
> Regards,
> Kamil
>
>> -- 
>> 2.25.1

Thanks Kamil for pointing, have sent next revision with comments addressed

Thanks and Regards
Kunal Joshi

