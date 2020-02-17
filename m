Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC79E6E95D
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:00:51 +0000 (UTC)
Date: Mon, 17 Feb 2020 16:00:48 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200217140048.GL25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132313.108855-1-arkadiusz.hiler@intel.com>
 <20200214121958.GC25209@platvala-desk.ger.corp.intel.com>
 <20200217134504.u2fdtbuynjiimhvw@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217134504.u2fdtbuynjiimhvw@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/9] lib/chamelium: Make it clear that
 function asserts
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

On Mon, Feb 17, 2020 at 03:45:04PM +0200, Arkadiusz Hiler wrote:
> On Fri, Feb 14, 2020 at 02:19:58PM +0200, Petri Latvala wrote:
> > On Wed, Feb 12, 2020 at 03:23:13PM +0200, Arkadiusz Hiler wrote:
> > > chamelium_wait_reachable() is asserting internally if the chamelium not
> > > reachable. Let's make it return bool instead and create
> > > void chamelium_assert_reachable() that fails the run.
> > > 
> > > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > 
> > Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> > 
> > Aside, Chamelium stuff is documented in a .txt but are there docs for
> > the lib/igt_chamelium functions anywhere?
> 
> https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Chamelium.html ?

/me blind

I got confuz by the patch context not having documentation comments
visible. And speaking of, docs for chamelium_wait_reachable pls?



-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
