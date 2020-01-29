Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC16F6F579
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 14:14:25 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <158030646210.11197.985551830684189117@skylake-alporthouse-com>
References: <20200129135619.15949-1-petri.latvala@intel.com>
 <158030646210.11197.985551830684189117@skylake-alporthouse-com>
Date: Wed, 29 Jan 2020 16:13:36 +0200
Message-ID: <87blqm9wq7.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Make the result an incomplete
 if a test is killed due to taint
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Quoting Petri Latvala (2020-01-29 13:56:19)
>> If we're checking for taints, we kill the test as soon as we notice a
>> taint. Out of the box, such killing will get marked as such and yields
>> a 'timeout' result, which is misleading. The test didn't spend too
>> much time, it just did nasties.
>> 
>> Make sure taint-killing results in an 'incomplete' result
>> instead. It's still not completely truthful for the state of the
>> testing but closer than a 'timeout'. And stands out more in CI result
>> analysis.
>> 
>> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>
> Incomplete has been synonymous in my mind with the "kernel oopsed" so it
> worksforme. Even if the HW dies, everyone blames the kernel for letting
> it die!
>

So with this patch, we can now assume 'incomplete' is always
atleast oops/bug_on or a more catastrophics system hang?

-Mika
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
