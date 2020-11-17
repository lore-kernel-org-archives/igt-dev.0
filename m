Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20201117114050.302583-1-tvrtko.ursulin@linux.intel.com>
 <160561548452.22621.12237070971991385724@build.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <8bdb8c26-cd11-2826-7ecf-89a30bb7d7a8@linux.intel.com>
Date: Tue, 17 Nov 2020 12:33:11 +0000
MIME-Version: 1.0
In-Reply-To: <160561548452.22621.12237070971991385724@build.alporthouse.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t] gem_wsim: Implement device selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 17/11/2020 12:18, Chris Wilson wrote:
> Quoting Tvrtko Ursulin (2020-11-17 11:40:50)
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> -L and -D <device> on the command line.
>>
>> With no device specified tool tries to find i915 discrete or integrated in
>> that order.
> 
> Ok, looks straightforward enough. (I still like having an idiot's guide
> with examples of -L output and what to pass to -D).
> 
>> +       fd = igt_open_card(&card);
>> +       igt_require(fd);
> 
> Does igt_require() still generate weirdness when used outside of igt
> tests?

It appears to do nothing. But more importantly I don't know how I ended 
up with it here. Probably some copy & paste again.

> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Can I convert to igt_assert and keep the r-b?

Regards,

Tvrtko

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
