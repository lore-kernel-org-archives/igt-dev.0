Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88D489BD2
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Jan 2020 10:06:48 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <875zhhtm99.wl-ashutosh.dixit@intel.com>
References: <037121df1ee6fcf1fa92ea4a7fb6ba31b39e80ac.1578720512.git.ashutosh.dixit@intel.com>
 <fd2da281033416f29cba6e1ab616164b1cfc6928.1578720512.git.ashutosh.dixit@intel.com>
 <157873229910.10140.6691170131873194678@skylake-alporthouse-com>
 <875zhhtm99.wl-ashutosh.dixit@intel.com>
Message-ID: <157882360367.10140.5434429041477278187@skylake-alporthouse-com>
Date: Sun, 12 Jan 2020 10:06:43 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/treewide: Replace
 gem_mmap__gtt() by gem_mmap__device_coherent()
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Dixit, Ashutosh (2020-01-12 02:57:22)
> On Sat, 11 Jan 2020 00:44:59 -0800, Chris Wilson wrote:
> >
> > Here, we want OFFSET_WC etc added. So leave this style for a later patch,
> > and focus on just converting the ones where we want any old mapping to
> > device_coherent(). Another patch can focus on converting any __cpu maps
> > that are only used for writes to device_coherent.
> 
> Thanks for the feedback Chris, makes sense, will rework and repost.
> 
> Some time ago, Dixit, Ashutosh wrote:
> > On Sat, 11 Jan 2020 00:40:32 -0800, Chris Wilson wrote:
> > > Quoting Ashutosh Dixit (2020-01-11 05:36:52)
> > > > In order to preserve legacy behavior for devices with a mappable
> > > > aperture try a GTT mapping first. Use a WC mapping only for devices
> > > > without a mappable aperture.
> > >
> > > No...? It's just historical legacy from before we even had WC available.
> > > Since we've had WC for basic mmappings, we prefer WC since it is not as
> > > scarce and as precious a resource. (Not that it matters for most tests
> > > since GTT thrashing in basic igt is unheard of!)
> 
> About this, I was assuming if we were using WC instead of GTT on legacy
> (Gen < 6), we would have to set read/write domains to WC too, unless you
> are saying it's not required? (From what I know, for later Gen's, setting
> the domain to either GTT or WC is identical).

The complication is just in mixing GTT and WC mappings [including
implicit paths via reloc/pwrite/pread). And technically that matters for
all gen, as GTT is only coherent on a few platforms.  But it really only
matters if you follow a GTT write with a WC read (GTT write followed by
WC write could also technically race). The answer is not to mix a
device_coherent mapping with any other GEM access [on the same cacheline],
and you can rely on set_domain(GTT).
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
