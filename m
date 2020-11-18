Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20201117114050.302583-1-tvrtko.ursulin@linux.intel.com>
 <20201117135918.354284-1-tvrtko.ursulin@linux.intel.com>
 <160562198607.22621.14513375230209122787@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <bad6ead7-30b6-fc26-dfbb-76d1ed913c6d@linux.intel.com>
Date: Wed, 18 Nov 2020 11:56:02 +0000
MIME-Version: 1.0
In-Reply-To: <160562198607.22621.14513375230209122787@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] gem_wsim: Implement device selection
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 17/11/2020 14:06, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-17 13:59:18)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> -L and -D <device> on the command line.
>>
>> With no device specified tool tries to find i915 discrete or integrated in
>> that order.
>>
>> v2:
>>   * Fix error handling and support render devices.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> Hmm, optarg should be a pointer into the argv, so is the copy necessary?

I don't remember if I tried, and I don't see that getopt(3) explains 
optarg from that angle, so probably safest to keep as is. Too lazy to 
try.. Or maybe presence of strdup suggests I did already try and that 
optarg is indeed temporary copy managed by getopt.

Regards,

Tvrtko
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
