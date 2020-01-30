Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E3A6F9A9
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 13:18:06 +0000 (UTC)
Date: Thu, 30 Jan 2020 15:17:53 +0200
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200130131753.GC20639@ideak-desk.fi.intel.com>
References: <20200129181601.15918-1-imre.deak@intel.com>
 <20200129181601.15918-6-imre.deak@intel.com>
 <158037974995.16598.9824585981329699370@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158037974995.16598.9824585981329699370@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/9] lib/igt_fb: Fall back from gtt map
 to coherent map on platforms w/o aperture
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

On Thu, Jan 30, 2020 at 10:22:29AM +0000, Chris Wilson wrote:
> Quoting Imre Deak (2020-01-29 18:15:58)
> > Use a device coherent map instead of GGTT map on platforms w/o an
> > aperture.
> 
> The decision tree here leads much to be desired. The usual practice is
> to use sw detiling since that has been faster than HW since byt.

This fixes the use of map_bo() when the user just wants to fill the
buffer with a pattern (for instance clearing for yuv), so detiling is
not needed in that case.

> -Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
