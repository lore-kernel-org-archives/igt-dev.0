Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17E96E2A3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2020 03:58:05 +0000 (UTC)
References: <20201023100709.5211-1-karthik.b.s@intel.com>
 <20201023100709.5211-3-karthik.b.s@intel.com>
 <20201023115415.GT7444@platvala-desk.ger.corp.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <2a437f8d-64a6-04d7-f4c6-2bc820884656@intel.com>
Date: Mon, 2 Nov 2020 09:28:01 +0530
MIME-Version: 1.0
In-Reply-To: <20201023115415.GT7444@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] CI HAX: Add MST tests to fast
 feedback testlist
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 10/23/2020 5:24 PM, Petri Latvala wrote:
> On Fri, Oct 23, 2020 at 03:37:09PM +0530, Karthik B S wrote:
>> Add the MST subtests to the fast feedback test list as
>> shards TGL does not have HDCP panels.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel-ci/fast-feedback.testlist | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
>> index 83722f83..fbb4275d 100644
>> --- a/tests/intel-ci/fast-feedback.testlist
>> +++ b/tests/intel-ci/fast-feedback.testlist
>> @@ -155,6 +155,12 @@ igt@vgem_basic@mmap
>>   igt@vgem_basic@second-client
>>   igt@vgem_basic@sysfs
>>   
>> +# HAX: Temporary addition to the fast-feedback list as shards doesnt have MST setup.
>> +igt@kms_content_protectoin@dp-mst-type-0
>> +igt@kms_content_protectoin@dp-mst-lic-type-0
>> +igt@kms_content_protectoin@dp-mst-type-1
>> +igt@kms_content_protectoin@dp-mst-lic-type-1
> 
> 
> Typo, protectoin
>              ^^^^
> 

Thanks for the review.
I'll fix this.
> 
> Do we have MST setups in BAT farm?
> 

That is the information I had.
I will confirm this before sending out the next version.

Thanks,
Karthik.B.S
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
