Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A7610E276
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 15:21:15 +0000 (UTC)
Date: Mon, 31 Oct 2022 17:21:12 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <Y1/n6AG2xdM+RI1g@platvala-desk.ger.corp.intel.com>
References: <20221031095521.3749655-1-riana.tauro@intel.com>
 <20221031095521.3749655-2-riana.tauro@intel.com>
 <877d0gdnz8.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d0gdnz8.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/debugfs_test: Add basic-hwmon
 test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 08:14:35AM -0700, Dixit, Ashutosh wrote:
> On Mon, 31 Oct 2022 02:55:21 -0700, Riana Tauro wrote:
> >
> > Add a testcase that verifies hwmon directory in dgfx and prints all
> > the entries
> >
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > ---
> >  tests/debugfs_test.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> > index 0b4b6e23..99fef354 100644
> > --- a/tests/debugfs_test.c
> > +++ b/tests/debugfs_test.c
> > @@ -24,12 +24,13 @@
> >
> >  #include "i915/gem.h"
> >  #include "igt.h"
> > +#include "igt_hwmon.h"
> >  #include "igt_sysfs.h"
> >  #include <fcntl.h>
> >  #include <sys/types.h>
> >  #include <dirent.h>
> >
> > -IGT_TEST_DESCRIPTION("Read entries from debugfs and sysfs paths.");
> > +IGT_TEST_DESCRIPTION("Read entries from debugfs,hwmon and sysfs paths.");
>                                                    ^
> Space here ----------------------------------------|
> 
> Do we also need to add this test to fast_feedback testlist to add to BAT as
> some people are asking? Not sure what the procedure for adding to BAT
> testlist is? Let's ask Petri.

What's the runtime of the test? None of the shards executed it, it
looks like.

If the test behaves well and brings value from the greater HW coverage
of the BAT farm, it's a matter of making a patch and getting an ack
from CI.


-- 
Petri Latvala


> 
> Thanks.
> --
> Ashutosh
> 
> 
> >
> >  static void read_and_discard_sysfs_entries(int path_fd, int indent)
> >  {
> > @@ -178,7 +179,7 @@ retry:
> >
> >  igt_main
> >  {
> > -	int fd = -1, debugfs, sysfs;
> > +	int fd = -1, debugfs, sysfs, hwmon_fd;
> >
> >	igt_fixture {
> >		fd = drm_open_driver_master(DRIVER_INTEL);
> > @@ -196,6 +197,15 @@ igt_main
> >	igt_subtest("read_all_entries")
> >		read_and_discard_sysfs_entries(debugfs, 0);
> >
> > +	igt_describe("Read all entries from hwmon path");
> > +	igt_subtest("basic-hwmon") {
> > +		igt_require_f(gem_has_lmem(fd), "Test applicable only for dgfx\n");
> > +		hwmon_fd = igt_hwmon_open(fd);
> > +		igt_assert(hwmon_fd >= 0);
> > +		read_and_discard_sysfs_entries(hwmon_fd, 0);
> > +		close(hwmon_fd);
> > +	}
> > +
> >	igt_describe("Read all debugfs entries with display on/off.");
> >	igt_subtest_group
> >		kms_tests(fd, debugfs);
> > --
> > 2.25.1
> >
