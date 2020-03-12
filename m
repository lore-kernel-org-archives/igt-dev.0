Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D9789D8A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 10:06:24 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200312090933.20001-1-dominik.grzegorzek@intel.com>
References: <20200312090933.20001-1-dominik.grzegorzek@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158400758071.10732.3610902622324796292@build.alporthouse.com>
Date: Thu, 12 Mar 2020 10:06:20 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 0/3] tests/gem_exec_alignment.c: Update
 subtests
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dominik Grzegorzek (2020-03-12 09:09:30)
> Changes modify many subtest, and implement priority inversion test
> case. Splited into three patches due to code sections shared between 
> pi and many subtest. "PATCH i-g-t 1/3 tests/gem_exec_alignment.c: Timeout
> alarm wrappers" has no sense without at least one of next patches. 
> 
> Dominik Grzegorzek (3):
>   tests/gem_exec_alignment.c: Timeout alarm wrappers
>   tests/gem_exec_alignment.c: Update subtest many

This still doesn't do quite what you would expect as it continues to
eat the signal anyway. In short it is no better than doing,

struct timespec tv = {}

for (alignment = 4096; alignment < gtt_size && igt_seconds_elapsed(&tv) < 5; alignment <<= 1)

>   tests/gem_exec_alignment.c: Add priority inversion test

Here, you don't want to try and fill the whole gtt and risk running for
several hundred seconds, but instead tune the fragmentation so that you
can reasonably expect it to take over 5s. i.e. use the slow
fragmentation loop from -many to consume 5s, and use the next alignment
up (on the already fragmented gtt) for the low-priority client.

Then don't use the SIGARLM for the high priority client, just measure
the elapsed time. Also fix up the igt_debug so that the L/H labels refer
to the right clients.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
