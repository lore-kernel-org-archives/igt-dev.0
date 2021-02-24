Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692366E83D
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Feb 2021 03:39:32 +0000 (UTC)
From: "Ram Moon, AnandX" <anandx.ram.moon@intel.com>
Date: Wed, 24 Feb 2021 03:39:09 +0000
Message-ID: <SA2PR11MB5068C9EE663FD1022EF5BD85AE9F9@SA2PR11MB5068.namprd11.prod.outlook.com>
References: <20210223140804.56883-1-anandx.ram.moon@intel.com>
 <a1b2b407-6ac6-0212-a1e0-33429820c4e3@linux.intel.com>
In-Reply-To: <a1b2b407-6ac6-0212-a1e0-33429820c4e3@linux.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] i915/gem_exec_fair: Fix failed assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Tvrtko Ursulin,

-----Original Message-----
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> 
Sent: Tuesday, February 23, 2021 10:05 PM
To: Ram Moon, AnandX <anandx.ram.moon@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] i915/gem_exec_fair: Fix failed assertion


On 23/02/2021 14:08, Anand Moon wrote:
> Changes fix the Failed assertion below
> 
> (gem_exec_fair:1606) CRITICAL: Test assertion failure function deadline, file ../tests/i915/gem_exec_fair.c:1163:
> (gem_exec_fair:1606) CRITICAL: Failed assertion: missed == 0
> (gem_exec_fair:1606) CRITICAL: 1 child, missed 60 frames, overran by 
> 20095804us Subtest basic-deadline failed.
> 
> Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
> ---
>   tests/i915/gem_exec_fair.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c 
> index c1a71f77..9d6f9d50 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -1158,7 +1158,7 @@ static void deadline(int i915, int duration, unsigned int flags)
>   		igt_waitchildren();
>   		close(timeline);
>   
> -		igt_assert_f(missed == 0,
> +		igt_assert_f(missed >= 0,
>   			     "%d child, missed %d frames, overran by %'"PRIu64"us\n",
>   			     num_children, missed, over / 1000);
>   
> 

It's not very good to allow unlimited missed frames. It's akin to turning that assert into igt_info. Which may be okay in itself, given the "red" history of the test in CI. At least until the scheduling improvements land.

Or take a platform where test mostly fails, like SKL or GLK, and try to figure out what is the cause of failure. Is it a test bug, like trying to do too much, too many clients, or a consequence of currently limited
i915 scheduling.

If you are not familiar with the area, or need help translating the test code into "theory of operation", I can help with that (might take some time to figure it out), or Chris (test author) might jump in.


Regards,

Tvrtko

Opps, I know the theory of operation behind this and I have debug this, but I will try to find the root cause of the assertion. 

Thanks
-Anand
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
