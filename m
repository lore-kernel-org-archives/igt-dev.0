Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6EE89E9E
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jun 2021 10:31:40 +0000 (UTC)
Date: Mon, 7 Jun 2021 13:33:28 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YL31+I5TOyXFP9Rj@platvala-desk.ger.corp.intel.com>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
 <162283984941.4702.14729353878969234439@emeril.freedesktop.org>
 <20210604210334.GX6936@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604210334.GX6936@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBTcGxp?=
 =?utf-8?q?t_display/graphics_versions_and_add_ADL-P?=
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
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 04, 2021 at 02:03:34PM -0700, Matt Roper wrote:
> On Fri, Jun 04, 2021 at 08:50:49PM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: Split display/graphics versions and add ADL-P
> > URL   : https://patchwork.freedesktop.org/series/91040/
> > State : failure
> > 
> > == Summary ==
> > 
> > IGT patchset build failed on latest successful build
> > 1fbc1e7d602f96a7f4e2b95057eef994656b8e74 i915/gem_exec_schedule: Check for timeslicing
> 
> Why is this series applying/building on top of this commit instead of
> the latest from the master branch?  The master branch has three
> additional commits, one of which contains the device ID's necessary to build
> this series...


Shouldn't happen again. CI was mistakenly left using anongit.fdo as
the IGT repository url and that had hiccups in its mirroring last
week. Now changed to use gitlab.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
