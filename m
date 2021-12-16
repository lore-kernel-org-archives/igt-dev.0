Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D42711242D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 06:38:11 +0000 (UTC)
Date: Thu, 16 Dec 2021 08:37:32 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YbrerMkSeL+eeMmZ@platvala-desk.ger.corp.intel.com>
References: <20211215103506.17273-1-petri.latvala@intel.com>
 <878rwm0wj1.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rwm0wj1.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Ensure subtest result is
 skip if all dynamic subtests skip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jari Tahvanainen <jari.tahvanainen@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 15, 2021 at 06:31:46AM -0800, Dixit, Ashutosh wrote:
> On Wed, 15 Dec 2021 02:35:06 -0800, Petri Latvala wrote:
> >
> > Even though the best practices for dynamic subtests is to not execute
> > the dynamic subtest at all instead of skipping, there are a couple of
> > tests that to the opposite, without an easy way to construct them
> > along best practices. Accomodate this with fixing the handling of
> > skipping dynamic subtests so that the result of the containing subtest
> > becomes a skip also if all dynamic subtests skip, not just when there
> > are no dynamic subtests.
> 
> I have seen this happen and the patch should convert a success exit status
> to a skip exit status so this is:
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks, merged.


-- 
Petri Latvala
