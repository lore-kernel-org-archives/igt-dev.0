Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C395010E318
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Aug 2023 07:58:18 +0000 (UTC)
Message-ID: <52efbd95-6e27-3d7e-80ed-06a3903aa490@intel.com>
Date: Tue, 1 Aug 2023 13:27:53 +0530
Content-Language: en-US
To: Albert Esteve <aesteve@redhat.com>
References: <20230728143742.322532-1-aesteve@redhat.com>
 <20230728143742.322532-2-aesteve@redhat.com>
 <a5ada367-5eb6-8b97-82eb-af2d36f120b1@intel.com>
 <CADSE00L-KZQgSs63EbpsEms7F6pqyagB_HVG7KzUKcGc3R0oXA@mail.gmail.com>
 <c9bf9ed1-9370-41d3-7f33-1e953f28cfc4@intel.com>
 <CADSE00JZDhCvDiVuhu_8nFe+BPXekHvCE-S+N-smNiFRKyyTYQ@mail.gmail.com>
 <CADSE00JJTDDQ=nxjv0oFDMDYivAp6EE8WU0Q1B94-MfNUtL1TQ@mail.gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <CADSE00JJTDDQ=nxjv0oFDMDYivAp6EE8WU0Q1B94-MfNUtL1TQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/2] igt_kms: add hotspot plane property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, belmouss@redhat.com, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On Mon-31-07-2023 07:06 pm, Albert Esteve wrote:
> 
> 
> On Mon, Jul 31, 2023 at 1:27 PM Albert Esteve <aesteve@redhat.com 
> <mailto:aesteve@redhat.com>> wrote:
> 
> 
> 
>     On Mon, Jul 31, 2023 at 10:49 AM Modem, Bhanuprakash
>     <bhanuprakash.modem@intel.com <mailto:bhanuprakash.modem@intel.com>>
>     wrote:
> 
> 
> 
>         On Mon-31-07-2023 01:42 pm, Albert Esteve wrote:
>          >
>          >
>          >
>          > On Mon, Jul 31, 2023 at 8:30 AM Modem, Bhanuprakash
>          > <bhanuprakash.modem@intel.com
>         <mailto:bhanuprakash.modem@intel.com>
>         <mailto:bhanuprakash.modem@intel.com
>         <mailto:bhanuprakash.modem@intel.com>>> wrote:
>          >
>          >     Hello,
>          >
>          >     On Fri-28-07-2023 08:07 pm, Albert Esteve wrote:
>          >      > Introduce LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT
>          >      > capability definition until patched drm.h uapi header
>          >      > is upstreamed and lands on IGT.
>          >      >
>          >      > CURSOR_PLANE_HOTSPOT capability is enabled
>          >      > conditionally, and then tracked in the igt_display
>          >      > struct.
>          >      >
>          >      > Add HOTSPOT_X and HOTSPOT_Y properties
>          >      > to the atomic_plane_properties struct.
>          >      >
>          >      > Signed-off-by: Albert Esteve <aesteve@redhat.com
>         <mailto:aesteve@redhat.com>
>          >     <mailto:aesteve@redhat.com <mailto:aesteve@redhat.com>>>
>          >      > ---
>          >      >   lib/igt_kms.c | 10 ++++++++++
>          >      >   lib/igt_kms.h | 11 ++++++++++-
>          >      >   2 files changed, 20 insertions(+), 1 deletion(-)
>          >      >
>          >      > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>          >      > index f2b0eed57..73119d0e5 100644
>          >      > --- a/lib/igt_kms.c
>          >      > +++ b/lib/igt_kms.c
>          >      > @@ -601,6 +601,8 @@ const char * const
>          >     igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>          >      >       [IGT_PLANE_CRTC_Y] = "CRTC_Y",
>          >      >       [IGT_PLANE_CRTC_W] = "CRTC_W",
>          >      >       [IGT_PLANE_CRTC_H] = "CRTC_H",
>          >      > +     [IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
>          >      > +     [IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
>          >      >       [IGT_PLANE_FB_ID] = "FB_ID",
>          >      >       [IGT_PLANE_CRTC_ID] = "CRTC_ID",
>          >      >       [IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
>          >      > @@ -2296,6 +2298,11 @@ static void
>         igt_plane_reset(igt_plane_t
>          >     *plane)
>          >      >       if (igt_plane_has_prop(plane,
>         IGT_PLANE_SCALING_FILTER))
>          >      >               igt_plane_set_prop_enum(plane,
>          >     IGT_PLANE_SCALING_FILTER, "Default");
>          >      >
>          >      > +     if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_X))
>          >      > +             igt_plane_set_prop_value(plane,
>          >     IGT_PLANE_HOTSPOT_X, 0);
>          >      > +     if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
>          >      > +             igt_plane_set_prop_value(plane,
>          >     IGT_PLANE_HOTSPOT_Y, 0);
>          >      > +
>          >      >       igt_plane_clear_prop_changed(plane,
>         IGT_PLANE_IN_FENCE_FD);
>          >      >       plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
>          >      >       plane->gem_handle = 0;
>          >      > @@ -2679,6 +2686,9 @@ void
>         igt_display_require(igt_display_t
>          >     *display, int drm_fd)
>          >      >       drmSetClientCap(drm_fd,
>         DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>          >      >       if (drmSetClientCap(drm_fd,
>         DRM_CLIENT_CAP_ATOMIC, 1) == 0)
>          >      >               display->is_atomic = 1;
>          >      > +
>          >      > +     if (drmSetClientCap(drm_fd,
>          >     LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>          >      > +             display->set_hotspots = 1;
>          >
>          >     Any special reason to add this to display struct?
>          >     IMHO, it is better to handle it at test level.
>          >
>          >
>          > Hi Bhanu,
>          >
>          > Mostly for keeping it consistent with the `is_atomic` capability.
>          >
>          > Are you suggesting moving the `drmSetClientCap` to the test?
> 
>         Yes.
> 
>          > I am ok with changing this, just trying to understand what would
>          > be the preferred way here.
> 
>         Either way (adding to display struct or checking at test level)
>         is fine.
> 
>         Generally to maintain the re-usability (ex: checking for the same
>         capability multiple times) we used to cache the capabilities to
>         display
>         struct. If multiple tests (or multiple places in your test) want
>         to use
>         this hotspot capability, you can add it to the display struct.
> 
> 
>     ATM it is only this test. If there is a need for more tests,
>     we can move capability setting back to display, but for the time
>     being I will follow
>     your advice and move it to the test.
> 
>     Something like...?
>     igt_subtest("modeset-atomic-cursor-hotspot") {
>          igt_require(drmSetClientCap(display.drm_fd,
>     LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0);
>          modeset_atomic_cursor_hotspot(&display);
>          igt_assert_eq(drmSetClientCap(display.drm_fd,
>     LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 0), 0);
>     }
> 
> 
> Hi Bhanu,
> 
> As I was testing this, I realized that if I delay setting the 
> capability, the
> `igt_display_require` function will not find the cursor planes as they 
> get disabled
> with the kernel patch that I am testing: 
> https://www.spinics.net/lists/stable/msg667033.html 
> <https://www.spinics.net/lists/stable/msg667033.html>
> 
> Specifically, we need to set the capability before:
> plane_resources = drmModeGetPlaneResources(display->drm_fd);
> 
> ... or else the test will be skipped.
> 
> Therefore, I need to keep it where it is now, and then I can also keep 
> storing
> the capability in the display struct.

Make sense to set the capability in igt_display_require().

Acked-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> 
> 
>         - Bhanu
> 
>          >
>          > Thanks!
>          >
>          >
>          >     - Bhanu
>          >
>          >      >
>          >      >       plane_resources =
>         drmModeGetPlaneResources(display->drm_fd);
>          >      >       igt_assert(plane_resources);
>          >      > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>          >      > index 1b6988c17..cf0a6d82b 100644
>          >      > --- a/lib/igt_kms.h
>          >      > +++ b/lib/igt_kms.h
>          >      > @@ -41,6 +41,12 @@
>          >      >
>          >      >   /* Low-level helpers with kmstest_ prefix */
>          >      >
>          >      > +/**
>          >      > + * Clients which do set cursor hotspot and treat the
>         cursor plane
>          >      > + * like a mouse cursor should set this property.
>          >      > + */
>          >      > +#define LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT    6
>          >      > +
>          >      >   /**
>          >      >    * pipe:
>          >      >    * @PIPE_NONE: Invalid pipe, used for disconnecting
>         a output
>          >     from a pipe.
>          >      > @@ -318,7 +324,9 @@ enum igt_atomic_plane_properties {
>          >      >          IGT_PLANE_ZPOS,
>          >      >          IGT_PLANE_FB_DAMAGE_CLIPS,
>          >      >          IGT_PLANE_SCALING_FILTER,
>          >      > -       IGT_NUM_PLANE_PROPS
>          >      > +       IGT_PLANE_HOTSPOT_X,
>          >      > +       IGT_PLANE_HOTSPOT_Y,
>          >      > +       IGT_NUM_PLANE_PROPS
>          >      >   };
>          >      >
>          >      >   /**
>          >      > @@ -448,6 +456,7 @@ struct igt_display {
>          >      >       igt_pipe_t *pipes;
>          >      >       bool has_cursor_plane;
>          >      >       bool is_atomic;
>          >      > +     bool set_hotspots;
>          >      >       bool first_commit;
>          >      >
>          >      >       uint64_t *modifiers;
>          >
> 
