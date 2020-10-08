Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2616E0C2
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2020 07:56:30 +0000 (UTC)
Date: Thu, 8 Oct 2020 10:56:26 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201008075626.GJ7444@platvala-desk.ger.corp.intel.com>
References: <20200127142925.13410-1-stanislav.lisovskiy@intel.com>
 <71b61c7ee40b43218f7a856ae357f071@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71b61c7ee40b43218f7a856ae357f071@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v16] igt/tests: Add plane stress test
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
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 10:33:11PM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Stanislav
> > Lisovskiy
> > Sent: Monday, January 27, 2020 7:59 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Peres, Martin <martin.peres@intel.com>; Heikkila, Juha-pekka <juha-
> > pekka.heikkila@intel.com>
> > Subject: [igt-dev] [PATCH i-g-t v16] igt/tests: Add plane stress test
> > 
> > This test attempts to utilize all connected outputs at the same time, using
> > maximum possible resolution and amount of planes, to check whether we are
> > hiting any kind of bandwidth, watermark or other limitations.
> > 
> > v2: Added cpu and gpu load threads, which consume
> >     additional bandwidth.
> > 
> > v3: Removed binary picture file, using pattern fb
> >     instead.
> > 
> > v4: Moved FB creation/removal to better place.
> > 
> > v5: Fixed rebase conflict and changed "fb->tiling"
> >     to "fb->modifier".
> > 
> > v6: Removed unnecessary new macro for iterating on
> >     pipes. Taken into use igt_gettime instead of
> >     clock_gettime.
> > 
> > v7: Put fb reinit into igt_fixture to avoid problems.
> >     Move stress function under igt_subtest. Release planes,
> >     remove redundant commit, assert if no planes can be used.
> > 
> > v8: - Add blitting also, to have more fun
> >     - Now using separate framebuffer per each plane.
> >     - Fixed magic number for bpp value(now based on format)
> >     - Some optimizations, like not applying same mode if it
> >       hasn't change, also don't do highest mode search on
> >       each iteration, just calculate once and use it.
> >     - Some code refactoring: extracted some lengthy code
> >       to separate functions.
> >     - Fixed wrong index for cursor FB(cursor FB is one per pipe)
> > 
> > v9:
> >     - More helper functions(start/stop threads, test init)
> >     - Now doing GPU work in pthreads also
> >     - Do GPU work in a separate framebuffer(not displayed)
> > 
> > v10:
> >     - Fix issue in main testing cycle, code refactoring
> >     - Rebased
> > 
> > v11:
> >     - Fixed issue with suspending/resuming GPU threads
> >       to get crc. Added num_rectangles to be able to customize
> >       number of gpgpu_fill calls.
> > 
> > v12:
> >     - Removed unneeded shared fb functionality and gpu thread
> >       pause/resume.
> >     - Now also using different formats for cursor fb.
> >     - Removed unnecessary parameters for stress function.
> >     - Changed plane_stress function name to pipe_stress(makes sense)
> >     - Put gpgpu_walk x and y bug fix into separate patch.
> > 
> > v13:
> >     - Added tests documentation.
> > 
> > v14:
> >     - Start using igt_get_pipe_crc_current instead in order
> >       to analyze crc in a more efficient way.
> >     - Now checking every frame
> >     - Also now using for_each_connected_output for iterating
> >       on pipes.
> > 
> > v15:
> >     - Code refactoring, extracted gpu fill into separate function.
> >     - Renamed kms_plane_stress to i915_pipe_stress
> >     - Moved to i915 specific folder, where it should be
> >     - Fixed Makefile.sources build failure
> > 
> > v16:
> >     - Fixed build failure after rebase, now stride and size are
> >       under surface substructure.
> 
> Hi Stan,
> Reviewed the implementation and it looks good.
> Some suggestions to enhance it further:
> 1. While doing the pipe stress, you can plan a plane downscaling
> 2. 90 or 270 degree rotation with Y tiled buffer
> Above will demand/require more dbuf and may expose h/w limits
> 3. Most of the time regular run may be fine but transitioning configurations result in underruns.
> While stressing, may be trigger some config changes.
> 
> I feel number of planes and pipes getting enabled is sequential here, can we enable them simultaneously.
> 
> Also do you have some data as to how much time this test is currently taking. Just to ensure
> that fits within the CI time limits defined per test. We can optimize based on how much time we have.


CI results lists the time taken for new tests this way:

### New IGT tests (1) ###

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
      - Statuses : 2 dmesg-fail(s) 4 pass(s) 1 skip(s)
          - Exec time: [0.0, 30.64] s




-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
