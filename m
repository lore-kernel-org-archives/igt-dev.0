Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687466E077
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2020 11:19:40 +0000 (UTC)
References: <20200401103606.138917-1-lionel.g.landwerlin@intel.com>
 <158573974814.5852.4343487493123615703@build.alporthouse.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <60809636-b170-dd21-aa13-63d2945db3c6@intel.com>
Date: Wed, 1 Apr 2020 14:19:37 +0300
MIME-Version: 1.0
In-Reply-To: <158573974814.5852.4343487493123615703@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tools/i915-perf-recorder: fix topology
 alignment issue
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 01/04/2020 14:15, Chris Wilson wrote:
> Quoting Lionel Landwerlin (2020-04-01 11:36:06)
>> The additional alignment added when writing into the output was not
>> accounted in the header. This is preventing reading the recorded data.
>>
>> Instead of adding the alignment when writing, just account for it when
>> querying the topology.
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Fixes: f08865e58cd3 ("tools: add i915 perf recorder tool")
>> ---
>>   tools/i915-perf/i915_perf_recorder.c | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
>> index 4d729b0e..104a425b 100644
>> --- a/tools/i915-perf/i915_perf_recorder.c
>> +++ b/tools/i915-perf/i915_perf_recorder.c
>> @@ -485,8 +485,8 @@ get_topology(int drm_fd, uint32_t *topology_size)
>>                  return NULL;
>>   
>>          assert(item.length > 0);
>> -       *topology_size = item.length;
>> -       topo_info = malloc(item.length);
>> +       *topology_size = ALIGN(item.length, 8);
>> +       topo_info = malloc(*topology_size);
>>          item.data_ptr = (uintptr_t) topo_info;
> As I understand the problem statement, when we used the length the
> kernel told us to use, the kernel rejected the query?
>
> Could you clarify as that sounds like a kernel bug.
> -Chris

We get the result of the query from the kernel and write it to the file.

To keep structures in the file aligned to 8 bytes (so that we can mmap 
stuff and it doesn't fall on weird alignments), the topology data size 
has to be aligned as well.


The problem is that we align the data when writing it to the file, but 
fail to update the header.size field properly written just before the 
topology data.


-Lionel

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
