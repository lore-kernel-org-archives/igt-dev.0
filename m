Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <a7f63810-d8c0-7a5e-58ca-8b91100c2741@linux.intel.com>
Date: Mon, 2 Oct 2023 09:31:25 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20230929110949.342325-1-tvrtko.ursulin@linux.intel.com>
 <ZRbv2jgIi1xN298e@unerlige-ril>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <ZRbv2jgIi1xN298e@unerlige-ril>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_gpu_top: Restore user
 friendly error message
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 29/09/2023 16:40, Umesh Nerlige Ramappa wrote:
> On Fri, Sep 29, 2023 at 12:09:49PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> We have a nice error message displayed when an user with insufficient
>> permissions tries to run the tool, but that got lost while Meteorlake
>> support was added. Bring it back in.
>>
>> v2:
>> * Propagate unexpected errno on multi-tile systems too. (Umesh)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>> tools/intel_gpu_top.c | 8 +++++---
>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>> index 87e9681e53b4..10601e66b18e 100644
>> --- a/tools/intel_gpu_top.c
>> +++ b/tools/intel_gpu_top.c
>> @@ -554,9 +554,9 @@ static int get_num_gts(uint64_t type)
>>
>>         close(fd);
>>     }
>> -    assert(!errno || errno == ENOENT);
>> -    assert(cnt > 0);
>> -    errno = 0;
>> +
>> +    if (!cnt || (errno && errno != ENOENT))
>> +        cnt = -errno;
> 
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Pushed, thanks!

Regards,

Tvrtko
