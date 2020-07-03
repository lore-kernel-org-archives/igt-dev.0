Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461C36E34E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2020 11:36:44 +0000 (UTC)
Date: Fri, 3 Jul 2020 14:36:40 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200703113640.7ancbbxh2tun3slf@ahiler-desk1.fi.intel.com>
References: <20200702045307.19202-1-mohammed.khajapasha@intel.com>
 <159368254884.5655.14799178929766667026@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <159368254884.5655.14799178929766667026@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSAgZm9yIGxpYi9p?=
 =?utf-8?q?gt=5Fkms=3A_Add_support_for_display_with_=28rev4=29?=
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
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>, Petri Latvala <petri.latvala@intel.com>, "Kunche,
 Kishore" <kishore.kunche@intel.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 09:35:48AM +0000, Patchwork wrote:
> #### Possible regressions ####
>   * igt@kms_lease@simple_lease:
>     - shard-apl:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl4/igt@kms_lease@simple_lease.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-apl8/igt@kms_lease@simple_lease.html
>     - shard-iclb:         [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb8/igt@kms_lease@simple_lease.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-iclb3/igt@kms_lease@simple_lease.html
>     - shard-glk:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk8/igt@kms_lease@simple_lease.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-glk9/igt@kms_lease@simple_lease.html
>     - shard-hsw:          [PASS][8] -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw1/igt@kms_lease@simple_lease.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-hsw6/igt@kms_lease@simple_lease.html
>     - shard-kbl:          [PASS][10] -> [FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl4/igt@kms_lease@simple_lease.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-kbl6/igt@kms_lease@simple_lease.html
>     - shard-snb:          [PASS][12] -> [FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-snb4/igt@kms_lease@simple_lease.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-snb4/igt@kms_lease@simple_lease.html
>     - shard-tglb:         [PASS][14] -> [FAIL][15]
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb7/igt@kms_lease@simple_lease.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4726/shard-tglb2/igt@kms_lease@simple_lease.html

Ok, let me explain why this is failing.

simple_lease is creating DRM lease with a single CRTC, you should think
about it as a slice of the display where only that CRTC is available.

So on the normal drm_fd we see:
PIPE A: crtc_id: 33
PIPE B: crtc_id: 48
PIPE C: crtc_id: 5d
PIPE D: disabled
PIPE E: disabled
PIPE F: disabled

Then if we crate a lease with pipe B, on it's fd we see:
PIPE A: disabled
PIPE B: crtc_id: 48
PIPE C: disabled
PIPE D: disabled
PIPE E: disabled
PIPE F: disabled

Prior to your changes (so without asking DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID)
the disabled pipes in the beginning would get squashed, as we would get:

PIPE A: crtc_id: 48

... and this worked just fine.


Why drmWaitVBlank() fails after your changes?

The interface, due to historical reasons, is pure jank. We need to
specify which CRTC we expect the vblank on:

/**
 * igt_wait_for_vblank_count:
 * @drm_fd: A drm file descriptor
 * @pipe: Pipe to wait_for_vblank on
 * @count: Number of vblanks to wait on
 *
 * Waits for a given number of vertical blank intervals
 */
void igt_wait_for_vblank_count(int drm_fd, enum pipe pipe, int count)
{
        drmVBlank wait_vbl;
        uint32_t pipe_id_flag;

        memset(&wait_vbl, 0, sizeof(wait_vbl));
        pipe_id_flag = kmstest_get_vbl_flag(pipe);

        wait_vbl.request.type = DRM_VBLANK_RELATIVE;
        wait_vbl.request.type |= pipe_id_flag;
        wait_vbl.request.sequence = count;

        igt_assert(drmWaitVBlank(drm_fd, &wait_vbl) == 0);
}

/**
 * kmstest_get_vbl_flag:
 * @pipe_id: Pipe to convert to flag representation.
 *
 * Convert a pipe id into the flag representation
 * expected in DRM while processing DRM_IOCTL_WAIT_VBLANK.
 */
uint32_t kmstest_get_vbl_flag(uint32_t pipe_id)
{
        if (pipe_id == 0)
                return 0;
        else if (pipe_id == 1)
                return _DRM_VBLANK_SECONDARY;
        else {
                uint32_t pipe_flag = pipe_id << 1;
                igt_assert(!(pipe_flag & ~DRM_VBLANK_HIGH_CRTC_MASK));
                return pipe_flag;
        }
}


This is all confusing as pipe_id is not the same pipe id you get via
DRM_IOCTL_I915_GET_PIPE_FROM_CRTC_ID.

What it actually means by pipe_id is the *crtc offset* in the array of
crtcs (think drmModeResources), which it calls internally (in the
kernel) pipe_inedx. This happens to work correctly with the current
implementation of pipe <-> crtc mapping.

So your changes uncovered a deep rooted problem of mixing multiple
incompatible concepts and poor naming:

crtc_id, pipe index aka crtc offset, i915's concept of pipe, etc.

The easiest workaround would be to introduce crtc_offset in struct
igt_pipe, rename arguments to the vblank helpers accordingly and use the
correct values. This may make things only worse though...

You should rethink why you need non-continuous pipes, how kernel is going
to handle them and expose them to user space and how DRM lease and
wait_for_vblank is going to work with it before proceeding.

As we see here the potential for breakage is high.

-- 
Cheers,
Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
