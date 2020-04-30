Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C526E1A4
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2020 09:29:29 +0000 (UTC)
Date: Thu, 30 Apr 2020 12:29:25 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200430092925.d7jb25g36az3byet@ahiler-desk1.fi.intel.com>
References: <20200429154902.201712-1-arkadiusz.hiler@intel.com>
 <20200429154902.201712-3-arkadiusz.hiler@intel.com>
 <20200430090148.GA9497@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430090148.GA9497@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/drmtest: Introduce
 __drm_open_driver_another
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

On Thu, Apr 30, 2020 at 12:01:48PM +0300, Petri Latvala wrote:
> On Wed, Apr 29, 2020 at 06:49:02PM +0300, Arkadiusz Hiler wrote:
> > __drm_open_driver_another(int idx, ...) is a counterpart to
> > __drm_open_driver(..) with the following changes:
> > 
> > If device filters are provided the idx-th filter is used and the first
> > matching device is selected.
> > 
> > Consecutive calls to it, with increasing idx (starting from zero) are
> > guaranteed to return fd of a different /dev/dri/ node than the previous
> > calls or -1.
> > 
> > Counterparts to other existing drm_open_*() should be introduced in
> > similar fashion as the need arises.
> > 
> > kms_prime test is converted to use this new call and dumb buffers
> > directly.
> 
> If there's going to be new revisions of this series, can the kms_prime
> changes be split to a separate patch?

yep

> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Mika Kahola <mika.kahola@intel.com>
> > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > ---
> >  lib/drmtest.c     | 163 +++++++++++++++++++++++++++++++++++++++-------
> >  lib/drmtest.h     |   1 +
> >  tests/kms_prime.c | 107 ++++++++++++++++++------------
> >  3 files changed, 208 insertions(+), 63 deletions(-)
> > 
> > diff --git a/lib/drmtest.c b/lib/drmtest.c
> > index 7b2fd337..538fcf65 100644
> > --- a/lib/drmtest.c
> > +++ b/lib/drmtest.c
> > @@ -339,6 +387,87 @@ static bool __get_the_first_card(struct igt_device_card *card)
> >  	return false;
> >  }
> >  
> > +/**
> > + * __drm_open_driver_another:
> > + * @idx: index of the device you are opening
> > + * @chipset: OR'd flags for each chipset to search, eg. #DRIVER_INTEL
> > + *
> > + * This function is intended to be used instead of drm_open_driver() for tests
> > + * that are opening multiple /dev/dri/card* nodes, usually for the purpose of
> > + * multi-GPU testing.
> > + *
> > + * This function opens device in the following order:
> > + *
> > + * 1. when --device arguments are present:
> > + *   * device scanning is executed,
> > + *   * idx-th filter (starting with 0, filters are semicolon separated) is used
> > + *   * if there is no idx-th filter, goto 2
> > + *   * first device maching the filter is selected
> > + *   * if it's already opened (for indexes = 0..idx-1) we fail with -1
> > + *   * otherwise open the device and return the fd
> > + *
> > + * 2. compatibility mode - open the first DRM device we can find that is not
> > + *    already opened for indexes 0..idx-1, searching up to 16 device nodes
> > + *
> > + * The test is reponsible to test the interaction between devices in both
> > + * directions if applicable.
> > + *
> > + * Example:
> > + *
> > + * |[<!-- language="c" -->
> > + * igt_subtest_with_dynamic("basic") {
> > + * 	int first_fd = -1;
> > + * 	int second_fd = -1;
> > + *
> > + * 	first_fd = __drm_open_driver_another(0, DRIVER_ANY);
> > + * 	igt_require(first_fd >= 0);
> > + *
> > + * 	second_fd = __drm_open_driver_another(1, DRIVER_ANY);
> > + * 	igt_require(second_fd >= 0);
> > + *
> > + * 	if (can_do_foo(first_fd, second_fd))
> > + * 		igt_dynamic("first-to-second")
> > + * 			test_basic_from_to(first_fd, second_fd);
> > + *
> > + * 	if (can_do_foo(second_fd, first_fd))
> > + * 		igt_dynamic("second-to-first")
> > + * 			test_basic_from_to(second_fd, first_fd);
> > + *
> > + * 	close(first_fd);
> > + * 	close(second_fd);
> > + * }
> > + * ]|
> > + *
> > + * Returns:
> > + * An open DRM fd or -1 on error
> > + */
> > +int __drm_open_driver_another(int idx, int chipset)
> > +{
> > +	int fd = -1;
> > +	if (igt_device_filter_count() > idx) {
> > +		bool found;
> > +		struct igt_device_card card;
> > +
> > +		found = __get_card_for_nth_filter(idx, &card);
> > +
> > +		if (!found || !strlen(card.card))
> > +			igt_warn("No card matches the filter!\n");
> > +		else if (_is_already_opened(card.card, idx))
> > +			igt_warn("card maching filter %d is already opened\n", idx);
> > +		else
> > +			fd = __open_driver_exact(card.card, chipset);
> > +
> > +	} else {
> > +		/* no filter for device idx, let's open whatever is available */
> > +		fd = __open_driver("/dev/dri/card", 0, chipset, idx);
> > +	}
> 
> 
> Hmm, took me a while to grasp the full flow from drm_open_driver() to
> __try_modprobe() and pals and how that's changed with this...
> 
> The difference between drm_open_driver() and __drm_open_driver() is
> that the latter doesn't install i915-specific atexit() handlers. Do we
> need that kind of functionality for _another()?

And skips if fd < 0.

Similar atexit() handler would be necessary for tests that use
_another() with any workload submission, so I would say, yeah, we would
eventually need it and it makes sense to have it as the default one.

It's not needed for this particular test though, so I haven't bothered
to create it yet.

> Is it documented that anyone using device filters will need to
> modprobe themselves if they target a driver that we normally modprobe?

Good catch, let's add:

 found = __get_card_for_nth_filter(idx, &card);
+
+if (!found) {
+	__try_modprobe(chipset);
+	found = __get_card_for_nth_filter(idx, &card);
+}

> > diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> > index 3241c514..8cb2ca2a 100644
> > --- a/tests/kms_prime.c
> > +++ b/tests/kms_prime.c
> > @@ -228,29 +249,35 @@ static void test_crc(int exporter_fd, int importer_fd)
> >  	igt_display_fini(&display);
> >  }
> >  
> > -static void run_test_crc(int export_chipset, int import_chipset)
> > -{
> > -	int importer_fd = -1;
> > -	int exporter_fd = -1;
> > -
> > -	exporter_fd = drm_open_driver(export_chipset);
> > -	importer_fd = drm_open_driver_master(import_chipset);
> > -
> > -	igt_require(has_prime_export(exporter_fd));
> > -	igt_require(has_prime_import(importer_fd));
> > -	igt_require_pipe_crc(importer_fd);
> > -
> > -	test_crc(exporter_fd, importer_fd);
> > -	close(importer_fd);
> > -	close(exporter_fd);
> > -}
> > -
> >  igt_main
> >  {
> > -	igt_fixture {
> > +	igt_fixture
> >  		kmstest_set_vt_graphics_mode();
> > +
> > +	igt_describe("Make a dumb color buffer, export to another device and"
> > +		     " compare the CRCs with a buffer native to that device");
> > +	igt_subtest_with_dynamic("basic-crc") {
> > +		int first_fd = -1;
> > +		int second_fd = -1;
> > +
> > +		/* ANY = anything that is not VGEM */
> > +		first_fd = __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
> > +		igt_require(first_fd >= 0);
> > +
> > +		second_fd = __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
> > +		igt_require(second_fd >= 0);
> 
> For people not using filters, we can get some predictability for this
> by only using DRIVER_VGEM for the second_fd, can't we?

This would force strict ordering on filters - if you want to use vgem it
would always need to be the second one. I would like to avoid that.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
