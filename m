Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189F06E235
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:49:11 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:49:07 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200618124907.GI20883@platvala-desk.ger.corp.intel.com>
References: <20200618120623.6853-1-petri.latvala@intel.com>
 <20200618120623.6853-2-petri.latvala@intel.com>
 <20200618122628.pdpptfx7idljgr6v@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618122628.pdpptfx7idljgr6v@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] runner: Introduce --disk-usage-limit
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 03:26:28PM +0300, Arkadiusz Hiler wrote:
> On Thu, Jun 18, 2020 at 03:06:23PM +0300, Petri Latvala wrote:
> > Disk usage limit is a limit of disk space taken, per (dynamic)
> > subtest. If the test's output, kernel log included, exceeds this
> > limit, the test is killed, similarly to killing the test when the
> > kernel gets tainted.
> 
> So this is a combined limit, i.e. shared by stderr, stdout and dmesg,
> right?

Yes, combined limit.

> Also since this is handled by need_to_timeout, will the final test
> result be a timeout?

It will be an incomplete. With an injection in the stdout, like when
killing for taints, for automatic filtering.

> Any particular reason why we are killing the test instead of just
> appending a message that output was truncated and letting the test be?
> 
> When we were talking about this I had imagined something more like:
> 
>  1. size limit per logged file
>  2. test finishes execution
>  3. the logs state that the test was spammy and we truncated the logs
>  4. "promote" passes to warns in such cases
> 
> No strong feeling on which option we will go with, but I would like to
> understand why you went in that way.

In my opinion it's a waste of disk space on the DUT; There shouldn't
be a case where having "too much" (tm) stuff logged is considered
normal. And if we accept that, we might as well also save some time by
killing the test when we go over.

Truncating the logs is possible but way more code; Instead of just
finding the delimit offsets in the stdout file and stuffing that range
to the json string object, you need to construct a new string, making
sure you avoid cutting out the subtest result line. I repeat:
Possible, almost easy. Just more code in an already complex resultgen
codebase for doing a simple thing :P

So in a nutshell: The approach depends on whether spamming logs is
considered "just a warn" or "oh, please no".


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
