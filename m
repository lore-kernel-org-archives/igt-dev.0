Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18A86E4B3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Apr 2021 08:04:07 +0000 (UTC)
Date: Tue, 20 Apr 2021 11:04:03 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YH6K8yy6ZUb448NG@intel.com>
References: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
 <20210416174841.20132-4-ville.syrjala@linux.intel.com>
 <YH6GB4Lw4wtHwDuM@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YH6GB4Lw4wtHwDuM@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] lib/kms: Commit primary plane props
 with COMMIT_LEGACY
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 10:43:03AM +0300, Petri Latvala wrote:
> On Fri, Apr 16, 2021 at 08:48:40PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Currently COMMIT_LEGACY for the primary plane only issues the
> > setcrtc ioctl, leaving all other plane properties unchanged
> > even if they were flagged as needing an update. Let's issue
> > the appropriate setprop ioctls in addition to the setcrtc to
> > make sure the plane state really reflects what was requested.
> > =

> > Without this the prop values can leak between tests. Eg. on
> > skl/derivatives running one of the failing kms_plane_alpha_blend
> > subtests first, and following it up with kms_cursor_crc (which
> > only uses legacy commits) causes crc mismatches since the
> > primary plane alpha is still left at some stale value despite
> > igt_plane_reset() trying to reset it back to 1.0.
> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> The reasoning is sound and this seems to do what the commit message
> explains, but why does kms_flip_tiling fail consistently with it?

Dunno yet. Annoyingly it passes with flying color on my local glk.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
