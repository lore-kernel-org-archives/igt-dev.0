Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379326E179
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2020 12:26:57 +0000 (UTC)
Date: Thu, 18 Jun 2020 15:26:53 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200618122653.augytzk5h3cczrnz@ahiler-desk1.fi.intel.com>
References: <20200618120623.6853-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618120623.6853-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] runner: Inject a message when
 killing test to taints
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

On Thu, Jun 18, 2020 at 03:06:22PM +0300, Petri Latvala wrote:
> Normally runner injecting a message to the test's stdout/stderr logs
> has a race condition; The test outputs have special lines (subtest
> starting/ending) and accidentally injecting stuff in between would
> cause funky results.
> 
> When we're killing a test because the kernel got tainted, we know
> already that we're not getting a subtest ending line and we can
> inject, if we make sure we have newlines printed before and after the
> injection.
> 
> Having a message in the stdout of the test will aid automatic bug
> filtering.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
