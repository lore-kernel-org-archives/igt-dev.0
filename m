Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7F6E039
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Nov 2021 13:23:40 +0000 (UTC)
Date: Fri, 5 Nov 2021 15:22:23 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YYUwDxrjnkq9uRF5@platvala-desk.ger.corp.intel.com>
References: <20211022092537.3089-1-tzimmermann@suse.de>
 <e73f0cfa-ab1c-a368-1970-d8d238881d20@suse.de>
 <YX/4O7blra9zWqtC@platvala-desk.ger.corp.intel.com>
 <DM8PR11MB5655AE796C58F3EFD0B64802E08E9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <DM8PR11MB5655D0542FF5E58F7F3C7BBBE08E9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <10d14e45-0659-7982-1a57-0e50b9962a98@suse.de>
 <DM8PR11MB56550F7E9C868CB6925FFCDDE08E9@DM8PR11MB5655.namprd11.prod.outlook.com>
 <458666f6-fd11-aca6-238e-63f748480e82@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <458666f6-fd11-aca6-238e-63f748480e82@suse.de>
Subject: Re: [igt-dev] [PATCH v4 0/2] tests/fbdev: Additional tests for
 resolution and panning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Syrjala,
 Ville" <ville.syrjala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 05, 2021 at 10:41:08AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.11.21 um 10:32 schrieb Saarinen, Jani:
> > Hi,
> > > -----Original Message-----
> > > From: Thomas Zimmermann <tzimmermann@suse.de>
> > > Sent: perjantai 5. marraskuuta 2021 11.22
> > > To: Saarinen, Jani <jani.saarinen@intel.com>; Latvala, Petri
> > > <petri.latvala@intel.com>; Syrjala, Ville <ville.syrjala@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org
> > > Subject: Re: [igt-dev] [PATCH v4 0/2] tests/fbdev: Additional tests for resolution and
> > > panning
> > > 
> > > Hi
> > > 
> > > Am 05.11.21 um 09:51 schrieb Saarinen, Jani:
> > > > +@Syrjala, Ville who reviewed.
> > > > 
> > > > > -----Original Message-----
> > > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > > > Saarinen, Jani
> > > > > Sent: perjantai 5. marraskuuta 2021 10.23
> > > > > To: Latvala, Petri <petri.latvala@intel.com>; Thomas Zimmermann
> > > > > <tzimmermann@suse.de>
> > > > > Cc: igt-dev@lists.freedesktop.org
> > > > > Subject: Re: [igt-dev] [PATCH v4 0/2] tests/fbdev: Additional tests
> > > > > for resolution and panning
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > > -----Original Message-----
> > > > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > > > > Petri Latvala
> > > > > > Sent: maanantai 1. marraskuuta 2021 16.23
> > > > > > To: Thomas Zimmermann <tzimmermann@suse.de>drm_atomic_plane_check
> > > > > > Cc: igt-dev@lists.freedesktop.org
> > > > > > Subject: Re: [igt-dev] [PATCH v4 0/2] tests/fbdev: Additional tests
> > > > > > for resolution and panning
> > > > > > 
> > > > > > On Mon, Nov 01, 2021 at 03:17:54PM +0100, Thomas Zimmermann wrote:
> > > > > > > Ping for merging these patches.
> > > > > > 
> > > > > > Merged the lot, thanks.
> > > > > Caused now this:
> > > > > https://gitlab.freedesktop.org/drm/intel/-/issues/4435
> > > > > So failing on several systems.
> > > 
> > > The test tries move the scanout location within the fbdev memory. This works with
> > > other drivers.
> > > 
> > > Did you check that i915 supports this? Can you get a full backtrace, so that we see
> > > for which parameters it fails.
> > Did you check the logs in bug: eg
> > https://intel-gfx-ci.01.org/tree/drm-tip/drmtip_939/fi-tgl-1115g4/igt@fbdev@pan.html
> > Does this include data you ask for?
> 
> I did. The line
> 
>    #2 [<unknown>+0x0]
> 
> would contain that information. There are no debugging symbols available, I
> guess?


With the extra debug traces from
https://patchwork.freedesktop.org/series/96609/ we get

(fbdev:6665) DEBUG: Jump to opposite end of virtual screen
(fbdev:6665) CRITICAL: Test assertion failure function pan_test, file ../tests/fbdev.c:65:
(fbdev:6665) CRITICAL: Failed assertion: ret == expected_ret
(fbdev:6665) CRITICAL: Last errno: 28, No space left on device
(fbdev:6665) CRITICAL: ioctl(FBIOPAN_DISPLAY) returned ret=-1, expected 0

Ville already found the cause though and commented on
https://gitlab.freedesktop.org/drm/intel/-/issues/4435


-- 
Petri Latvala
