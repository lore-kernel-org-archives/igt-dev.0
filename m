Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F368D6EAA4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 15:01:02 +0000 (UTC)
Date: Tue, 17 Nov 2020 17:00:57 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20201117150057.GB1158100@ideak-desk.fi.intel.com>
References: <20201117144356.1253838-1-imre.deak@intel.com>
 <160562465275.22621.7389784130169909263@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160562465275.22621.7389784130169909263@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/fbdev: Add mmap readback subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 17, 2020 at 02:50:52PM +0000, Chris Wilson wrote:
> Quoting Imre Deak (2020-11-17 14:43:56)
> > Add a simple subtest checking that the mmap address we get for an FB
> > corresponds to the content that we read back from the FB via the read
> > syscall.
> 
> Please coordinate with https://patchwork.freedesktop.org/series/83955/
> and decide what is the best approach since you both implement the same
> test.

Thanks, the test I add isn't needed then, Thomas' read subtest already
covers that.

> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
