Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D3B6EBB6
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2020 10:35:00 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <878sln55bu.wl-ashutosh.dixit@intel.com>
References: <20200201001135.10927-1-antonio.argenziano@intel.com>
 <878sln55bu.wl-ashutosh.dixit@intel.com>
Message-ID: <158072609443.20090.15175093501076572991@skylake-alporthouse-com>
Date: Mon, 03 Feb 2020 10:34:54 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_faulting_reloc: Use
 a coherent mapping
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dixit, Ashutosh (2020-02-01 03:55:49)
> On Fri, 31 Jan 2020 16:11:35 -0800, Antonio Argenziano wrote:
> >
> > With mappable aperture not being available on some platforms, use a
> > different mapping. While this is changing a portion of the test, it
> > should keep intact the spirit of the same by submitting relocations to
> > faulting addresses.
> 
> Apart from the nit's on the comments below:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

This is all covered by gem_exec_reloc, we can safely remove this test.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
