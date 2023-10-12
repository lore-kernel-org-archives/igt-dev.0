Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <6a80d16c-9bcf-6be8-8267-076c933b463e@linux.intel.com>
Date: Thu, 12 Oct 2023 09:07:04 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <20231011083845.798413-1-tvrtko.ursulin@linux.intel.com>
 <20231011083845.798413-3-tvrtko.ursulin@linux.intel.com>
 <20231011124056.c3e3nnihpa2pahzn@kamilkon-desk.igk.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20231011124056.c3e3nnihpa2pahzn@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tools/intel_gpu_top: Optimise
 interactive display a bit
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


On 11/10/2023 13:40, Kamil Konieczny wrote:
> Hi Tvrtko,
> On 2023-10-11 at 09:38:44 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Padding the percentage bars and table columns with spaces happens quite a
>> lot so lets do better than putchar at a time. Have a table of visually
>> empty strings and build the required length out of those chunks.
>>
>> While at it, also move the percentage bar table into its function scope.
>>
>> v2:
>>   * Fix checkpatch and use ARRAY_SIZE. (Kamil)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks Kamil, now pushed!

Regards,

Tvrtko
