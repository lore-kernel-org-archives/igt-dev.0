Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20200211003742.863630-1-chris@chris-wilson.co.uk>
 <20200211004255.GA2535@jack.zhora.eu>
 <158141747934.5235.15646593670790864278@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <52e2f277-e709-05b2-d66a-833fe8b234f1@linux.intel.com>
Date: Tue, 11 Feb 2020 13:00:19 +0000
MIME-Version: 1.0
In-Reply-To: <158141747934.5235.15646593670790864278@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_nop: Keep a
 copy of the names
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Andi Shyti <andi@etezian.org>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 11/02/2020 10:37, Chris Wilson wrote:
> Quoting Andi Shyti (2020-02-11 00:42:55)
>> Hi Chris,
>>
>> On Tue, Feb 11, 2020 at 12:37:42AM +0000, Chris Wilson wrote:
>>> The engine names are now stored inside the iterator and not as static
>>> strings. If we wish to use them later, we need to make a copy.
>>
>> But we are not using them later. Your patch just copies and frees
>> an array.
> 
> They are used inside an igt_info() in the child processes. Output at the
> moment is quite strange.

I also don't get this - child has a copy of everything how can it not work?

Regards,

Tvrtko


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
