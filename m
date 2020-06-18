Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6506E179
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:26:31 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:26:28 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200618122628.pdpptfx7idljgr6v@ahiler-desk1.fi.intel.com>
References: <20200618120623.6853-1-petri.latvala@intel.com>
 <20200618120623.6853-2-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618120623.6853-2-petri.latvala@intel.com>
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 03:06:23PM +0300, Petri Latvala wrote:
> Disk usage limit is a limit of disk space taken, per (dynamic)
> subtest. If the test's output, kernel log included, exceeds this
> limit, the test is killed, similarly to killing the test when the
> kernel gets tainted.

So this is a combined limit, i.e. shared by stderr, stdout and dmesg,
right?

Also since this is handled by need_to_timeout, will the final test
result be a timeout?

Any particular reason why we are killing the test instead of just
appending a message that output was truncated and letting the test be?

When we were talking about this I had imagined something more like:

 1. size limit per logged file
 2. test finishes execution
 3. the logs state that the test was spammy and we truncated the logs
 4. "promote" passes to warns in such cases

No strong feeling on which option we will go with, but I would like to
understand why you went in that way.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
