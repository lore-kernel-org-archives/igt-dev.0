Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A724810E7D4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:50:41 +0000 (UTC)
Date: Wed, 12 Apr 2023 14:50:38 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230412125038.mtffq2td35coe4wx@kamilkon-desk1>
References: <20230411132946.17459-1-mcanal@igalia.com>
 <20230411132946.17459-3-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230411132946.17459-3-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/vkms: Add tests that perform
 operations on the primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-04-11 at 10:29:45 -0300, Maíra Canal wrote:
> Commits 4dee3c4b32a6 ("drm/vkms: remove the need for the primary plane
> to be visible") and 4a1b5d183273 ("drm/vkms: allow the primary plane to
> be positioned") allowed vkms to have a non-visible primary plane and
> to position the primary plane in such a way that doesn't cover the
> entire CRTC.
> 
> Those commits ended up making it possible to run tests that perform
> operations on the primary plane. So, add tests that perform operations
---------------------------------- ^^^^^^^
Just write "Added tests ...", we useally do not iwrite at begin
of sentence "So ,". This is not blocking it from merging so
please try to keep it simple in future.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> on the primary plane.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  tests/vkms_ci/vkms.testlist | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/vkms_ci/vkms.testlist b/tests/vkms_ci/vkms.testlist
> index c52dc210..cb15ded1 100644
> --- a/tests/vkms_ci/vkms.testlist
> +++ b/tests/vkms_ci/vkms.testlist
> @@ -13,6 +13,7 @@ igt@kms_atomic_transition@plane-all-modeset-transition
>  igt@kms_atomic_transition@plane-all-transition
>  igt@kms_atomic_transition@plane-all-transition-nonblocking
>  igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait
> +igt@kms_atomic_transition@plane-toggle-modeset-transition
>  igt@kms_atomic_transition@plane-use-after-nonblocking-unbind
>  igt@kms_bw@linear-tiling-1-displays-1920x1080p
>  igt@kms_bw@linear-tiling-1-displays-2560x1440p
> @@ -179,6 +180,7 @@ igt@kms_plane@plane-position-hole-dpms
>  igt@kms_plane_cursor@overlay
>  igt@kms_plane_cursor@primary
>  igt@kms_plane_cursor@viewport
> +igt@kms_plane_lowres@tiling-none
>  igt@kms_plane_multiple@tiling-none
>  igt@kms_plane_scaling@planes-downscale-factor-0-25
>  igt@kms_plane_scaling@planes-downscale-factor-0-5
> @@ -222,6 +224,9 @@ igt@kms_sequence@get-forked-busy
>  igt@kms_sequence@get-idle
>  igt@kms_sequence@queue-busy
>  igt@kms_sequence@queue-idle
> +igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
> +igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
> +igt@kms_universal_plane@universal-plane-pipe-a-functional
>  igt@kms_vblank@crtc-id
>  igt@kms_vblank@invalid
>  igt@kms_vblank@pipe-a-accuracy-idle
> @@ -231,6 +236,7 @@ igt@kms_vblank@pipe-a-query-forked-busy
>  igt@kms_vblank@pipe-a-query-idle
>  igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend
>  igt@kms_vblank@pipe-a-ts-continuation-idle
> +igt@kms_vblank@pipe-a-ts-continuation-modeset
>  igt@kms_vblank@pipe-a-ts-continuation-suspend
>  igt@kms_vblank@pipe-a-wait-busy
>  igt@kms_vblank@pipe-a-wait-forked
> -- 
> 2.39.2
> 
