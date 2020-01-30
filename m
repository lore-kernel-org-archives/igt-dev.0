Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29956E856
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 14:23:37 +0000 (UTC)
Date: Thu, 30 Jan 2020 16:23:24 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200130142324.GG20639@ideak-desk.fi.intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
 <20200129181601.15918-3-imre.deak@intel.com>
 <158037946007.16598.7471905083101163451@skylake-alporthouse-com>
 <158037998804.16598.2815858479186185052@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158037998804.16598.2815858479186185052@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/9] lib/intel_batchbuffer: Add blitter
 copy using XY_SRC_COPY_BLT
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

On Thu, Jan 30, 2020 at 10:26:28AM +0000, Chris Wilson wrote:
> Quoting Chris Wilson (2020-01-30 10:17:40)
> > Quoting Imre Deak (2020-01-29 18:15:55)
> > > +       if ((src_tiling | dst_tiling) >= I915_TILING_Y) {
> > > +               igt_assert(gen >= 6);
> > > +               batch[i++] = MI_FLUSH_DW | 2;
> > 
> > MI_FLUSH_DW is only 3 dwords on gen6, so
> > 
> > batch[i] = MI_FLUSH_DW | 1;
> > if (has_64b_reloc)
> >         batch[i]++;
> > i++;
> > 
> > or something prettier.
> 
> Actually, you can get away with MI_FLUSH_DW | 2 as that should indicate
> a qword write instead for gen6/7.

Ok, making it qword for gen6/7 and dword for gen8+.

--Imre
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
