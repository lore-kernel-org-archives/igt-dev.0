Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23385E64A82
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 11:43:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13C010E1A0;
	Tue,  3 Dec 2024 11:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/JJfodA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447A410E1A0
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 11:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733226210; x=1764762210;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=px0wJNRcVcO5bT8pa15jsDDcHO9piNUjhWNR6ntQETs=;
 b=h/JJfodA3IcV3Z3w/2cOZAgGq4zzbJk5HMVPBOiGXhnvkwaS3P2FVSJs
 ThDCCuykgNA25DxtX2DVozFQjKRxMv8sH0sSI1JDRzNdxgJ5wD/KkhSBp
 H7EkOwnrbkEP1TuHqZDD/rgy/JW4O0wSpO5dcKNTTq1R+zmfIr1QAw6Mr
 +4GdSJgtOJ7Hhx2ZW8bICZo7ivyqza4/zQaDLgFfICfyB7Wq1HoODS174
 VuCPQOEXlovAYxklLwVYdwmNkfvJtT3XLT8V9zyt8bpUv+MuFLIoMJoQZ
 aYQVvlRgLKzJrSGhYuIPYUM/UPYWWNlD3S7ymMARMAglvyv24gsElCACb Q==;
X-CSE-ConnectionGUID: AFJQeNUUSuKlZMxeHcGhug==
X-CSE-MsgGUID: cPLxAs0iRbapeydfBqRT7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32780152"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="32780152"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 03:43:29 -0800
X-CSE-ConnectionGUID: 8myx7M3ISWKcQo+BYzuVrQ==
X-CSE-MsgGUID: 4oM2R1OaS2iPPncwAvBxvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="94245206"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 03:43:27 -0800
Date: Tue, 3 Dec 2024 12:43:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t] tests/vkms: Delete VKMS test list
Message-ID: <20241203114309.5fpajswi4nsjehlf@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Helen Koike <helen.koike@collabora.com>,
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241201114506.19947-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241201114506.19947-1-mcanal@igalia.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Maíra,
On 2024-12-01 at 08:45:06 -0300, Maíra Canal wrote:
> First, this list is severely outdated. Therefore, it doesn't make sense
> to keep an outdated test list in the repository, especially considering
> that it is not being maintained.
> 
> Second, DRM CI now supports VKMS, and developers are maintaining an
> updated list of IGT tests that VKMS supports. Thus, keeping this list
> in IGT is redundant.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  tests/vkms_ci/README        |  21 ----

Can you at least move this into tests/vkms_ci.README

and update it to current state, for example write where more info
could be found and where/how is it testing now? It is not strong
opinion so with or without this you could add

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Btw do you use igt_runner for testing? I am asking this
because we develop a few new features, for example there
is idea of adding facts checks, either into igt_runner or
as an outside programm runned by igt_runner hooks.


Regards,
Kamil

>  tests/vkms_ci/vkms.testlist | 234 ------------------------------------
>  2 files changed, 255 deletions(-)
>  delete mode 100644 tests/vkms_ci/README
>  delete mode 100644 tests/vkms_ci/vkms.testlist
> 
> diff --git a/tests/vkms_ci/README b/tests/vkms_ci/README
> deleted file mode 100644
> index 74a59ae8f..000000000
> --- a/tests/vkms_ci/README
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -This directory contains test lists to be used for vkms's DRM support.
> -The files are passed to igt_runner/piglit with the --test-list parameter
> -directly.
> -
> -The test lists are contained in the IGT repository for several
> -reasons:
> -
> -- The lists stay synchronized with the IGT codebase.
> -- Public availability. Kernel developers can see what tests are run,
> -  and can see what changes are done to the set, when, and why.
> -- Keep track of the features implemented by the vkms DRM driver.
> -
> -=============
> -vkms.testlist
> -=============
> -
> -This test list is meant as a general test suite for the vkms DRM driver,
> -gathering all must-pass tests for the driver.
> -
> -As more features are implemented to the vkms DRM driver, the correspondent
> -tests should be added to this list.
> diff --git a/tests/vkms_ci/vkms.testlist b/tests/vkms_ci/vkms.testlist
> deleted file mode 100644
> index c3333bcb0..000000000
> --- a/tests/vkms_ci/vkms.testlist
> +++ /dev/null
> @@ -1,234 +0,0 @@
> -igt@kms_atomic@atomic-invalid-params
> -igt@kms_atomic@crtc-invalid-params
> -igt@kms_atomic@plane-cursor-legacy
> -igt@kms_atomic@plane-immutable-zpos
> -igt@kms_atomic@plane-invalid-params
> -igt@kms_atomic@plane-primary-legacy
> -igt@kms_atomic@test-only
> -igt@kms_atomic_transition@modeset-transition
> -igt@kms_atomic_transition@modeset-transition-fencing
> -igt@kms_atomic_transition@modeset-transition-nonblocking
> -igt@kms_atomic_transition@modeset-transition-nonblocking-fencing
> -igt@kms_atomic_transition@plane-all-modeset-transition
> -igt@kms_atomic_transition@plane-all-transition
> -igt@kms_atomic_transition@plane-all-transition-nonblocking
> -igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait
> -igt@kms_atomic_transition@plane-toggle-modeset-transition
> -igt@kms_atomic_transition@plane-use-after-nonblocking-unbind
> -igt@kms_bw@linear-tiling-1-displays-1920x1080p
> -igt@kms_bw@linear-tiling-1-displays-2560x1440p
> -igt@kms_bw@linear-tiling-1-displays-3840x2160p
> -igt@kms_bw@linear-tiling-2-displays-1920x1080p
> -igt@kms_bw@linear-tiling-2-displays-2560x1440p
> -igt@kms_bw@linear-tiling-2-displays-3840x2160p
> -igt@kms_concurrent@pipe-a
> -igt@kms_cursor_crc@cursor-alpha-opaque
> -igt@kms_cursor_crc@cursor-alpha-transparent
> -igt@kms_cursor_crc@cursor-dpms
> -igt@kms_cursor_crc@cursor-offscreen-128x128
> -igt@kms_cursor_crc@cursor-offscreen-128x42
> -igt@kms_cursor_crc@cursor-offscreen-256x256
> -igt@kms_cursor_crc@cursor-offscreen-256x85
> -igt@kms_cursor_crc@cursor-offscreen-32x10
> -igt@kms_cursor_crc@cursor-offscreen-32x32
> -igt@kms_cursor_crc@cursor-offscreen-512x170
> -igt@kms_cursor_crc@cursor-offscreen-512x512
> -igt@kms_cursor_crc@cursor-offscreen-64x21
> -igt@kms_cursor_crc@cursor-offscreen-64x64
> -igt@kms_cursor_crc@cursor-onscreen-128x128
> -igt@kms_cursor_crc@cursor-onscreen-128x42
> -igt@kms_cursor_crc@cursor-onscreen-256x256
> -igt@kms_cursor_crc@cursor-onscreen-256x85
> -igt@kms_cursor_crc@cursor-onscreen-32x10
> -igt@kms_cursor_crc@cursor-onscreen-32x32
> -igt@kms_cursor_crc@cursor-onscreen-512x170
> -igt@kms_cursor_crc@cursor-onscreen-512x512
> -igt@kms_cursor_crc@cursor-onscreen-64x21
> -igt@kms_cursor_crc@cursor-onscreen-64x64
> -igt@kms_cursor_crc@cursor-random-128x128
> -igt@kms_cursor_crc@cursor-random-128x42
> -igt@kms_cursor_crc@cursor-random-256x256
> -igt@kms_cursor_crc@cursor-random-256x85
> -igt@kms_cursor_crc@cursor-random-32x10
> -igt@kms_cursor_crc@cursor-random-32x32
> -igt@kms_cursor_crc@cursor-random-512x170
> -igt@kms_cursor_crc@cursor-random-512x512
> -igt@kms_cursor_crc@cursor-random-64x21
> -igt@kms_cursor_crc@cursor-random-64x64
> -igt@kms_cursor_crc@cursor-rapid-movement-128x128
> -igt@kms_cursor_crc@cursor-rapid-movement-128x42
> -igt@kms_cursor_crc@cursor-rapid-movement-256x256
> -igt@kms_cursor_crc@cursor-rapid-movement-256x85
> -igt@kms_cursor_crc@cursor-rapid-movement-32x10
> -igt@kms_cursor_crc@cursor-rapid-movement-32x32
> -igt@kms_cursor_crc@cursor-rapid-movement-512x170
> -igt@kms_cursor_crc@cursor-rapid-movement-512x512
> -igt@kms_cursor_crc@cursor-rapid-movement-64x21
> -igt@kms_cursor_crc@cursor-rapid-movement-64x64
> -igt@kms_cursor_crc@cursor-size-change
> -igt@kms_cursor_crc@cursor-sliding-128x128
> -igt@kms_cursor_crc@cursor-sliding-128x42
> -igt@kms_cursor_crc@cursor-sliding-256x256
> -igt@kms_cursor_crc@cursor-sliding-256x85
> -igt@kms_cursor_crc@cursor-sliding-32x10
> -igt@kms_cursor_crc@cursor-sliding-32x32
> -igt@kms_cursor_crc@cursor-sliding-512x170
> -igt@kms_cursor_crc@cursor-sliding-512x512
> -igt@kms_cursor_crc@cursor-sliding-64x21
> -igt@kms_cursor_crc@cursor-sliding-64x64
> -igt@kms_cursor_crc@cursor-suspend
> -igt@kms_cursor_edge_walk@128x128-left-edge
> -igt@kms_cursor_edge_walk@128x128-right-edge
> -igt@kms_cursor_edge_walk@128x128-top-bottom
> -igt@kms_cursor_edge_walk@128x128-top-edge
> -igt@kms_cursor_edge_walk@256x256-left-edge
> -igt@kms_cursor_edge_walk@256x256-right-edge
> -igt@kms_cursor_edge_walk@256x256-top-bottom
> -igt@kms_cursor_edge_walk@256x256-top-edge
> -igt@kms_cursor_edge_walk@64x64-left-edge
> -igt@kms_cursor_edge_walk@64x64-right-edge
> -igt@kms_cursor_edge_walk@64x64-top-bottom
> -igt@kms_cursor_edge_walk@64x64-top-edge
> -igt@kms_flip@absolute-wf_vblank
> -igt@kms_flip@absolute-wf_vblank-interruptible
> -igt@kms_flip@basic-flip-vs-dpms
> -igt@kms_flip@basic-flip-vs-modeset
> -igt@kms_flip@basic-flip-vs-wf_vblank
> -igt@kms_flip@basic-plain-flip
> -igt@kms_flip@blocking-absolute-wf_vblank
> -igt@kms_flip@blocking-absolute-wf_vblank-interruptible
> -igt@kms_flip@blocking-wf_vblank
> -igt@kms_flip@busy-flip
> -igt@kms_flip@dpms-off-confusion
> -igt@kms_flip@dpms-off-confusion-interruptible
> -igt@kms_flip@dpms-vs-vblank-race
> -igt@kms_flip@dpms-vs-vblank-race-interruptible
> -igt@kms_flip@flip-vs-absolute-wf_vblank
> -igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible
> -igt@kms_flip@flip-vs-blocking-wf-vblank
> -igt@kms_flip@flip-vs-dpms-off-vs-modeset
> -igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible
> -igt@kms_flip@flip-vs-expired-vblank
> -igt@kms_flip@flip-vs-expired-vblank-interruptible
> -igt@kms_flip@flip-vs-panning
> -igt@kms_flip@flip-vs-panning-interruptible
> -igt@kms_flip@flip-vs-rmfb
> -igt@kms_flip@flip-vs-rmfb-interruptible
> -igt@kms_flip@flip-vs-suspend
> -igt@kms_flip@flip-vs-suspend-interruptible
> -igt@kms_flip@flip-vs-wf_vblank-interruptible
> -igt@kms_flip@modeset-vs-vblank-race
> -igt@kms_flip@modeset-vs-vblank-race-interruptible
> -igt@kms_flip@nonblocking-read
> -igt@kms_flip@nonexisting-fb
> -igt@kms_flip@nonexisting-fb-interruptible
> -igt@kms_flip@plain-flip-fb-recreate
> -igt@kms_flip@plain-flip-fb-recreate-interruptible
> -igt@kms_flip@plain-flip-interruptible
> -igt@kms_flip@plain-flip-ts-check
> -igt@kms_flip@plain-flip-ts-check-interruptible
> -igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset
> -igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible
> -igt@kms_flip@wf_vblank-ts-check
> -igt@kms_flip@wf_vblank-ts-check-interruptible
> -igt@kms_flip_event_leak@basic
> -igt@kms_getfb@getfb-addfb-different-handles
> -igt@kms_getfb@getfb-handle-closed
> -igt@kms_getfb@getfb-handle-not-fb
> -igt@kms_getfb@getfb-handle-protection
> -igt@kms_getfb@getfb-handle-valid
> -igt@kms_getfb@getfb-handle-zero
> -igt@kms_getfb@getfb-repeated-different-handles
> -igt@kms_getfb@getfb2-handle-closed
> -igt@kms_getfb@getfb2-handle-not-fb
> -igt@kms_getfb@getfb2-handle-protection
> -igt@kms_getfb@getfb2-handle-zero
> -igt@kms_getfb@getfb2-into-addfb2
> -igt@kms_lease@cursor_implicit_plane
> -igt@kms_lease@empty_lease
> -igt@kms_lease@implicit-plane-lease
> -igt@kms_lease@invalid-create-leases
> -igt@kms_lease@lease-uevent
> -igt@kms_lease@lease_again
> -igt@kms_lease@lease_get
> -igt@kms_lease@lease_invalid_connector
> -igt@kms_lease@lease_invalid_crtc
> -igt@kms_lease@lease_invalid_plane
> -igt@kms_lease@lease_revoke
> -igt@kms_lease@lessee_list
> -igt@kms_lease@master-vs-lease
> -igt@kms_lease@multimaster-lease
> -igt@kms_lease@page_flip_implicit_plane
> -igt@kms_lease@possible-crtcs-filtering
> -igt@kms_lease@setcrtc_implicit_plane
> -igt@kms_lease@simple_lease
> -igt@kms_multipipe_modeset@basic-max-pipe-crc-check
> -igt@kms_pipe_crc_basic@bad-source
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck
> -igt@kms_pipe_crc_basic@disable-crc-after-crtc
> -igt@kms_pipe_crc_basic@nonblocking-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc
> -igt@kms_pipe_crc_basic@read-crc-frame-sequence
> -igt@kms_pipe_crc_basic@suspend-read-crc
> -igt@kms_plane@plane-panning-bottom-right
> -igt@kms_plane@plane-panning-bottom-right-suspend
> -igt@kms_plane@plane-panning-top-left
> -igt@kms_plane@plane-position-covered
> -igt@kms_plane@plane-position-hole
> -igt@kms_plane@plane-position-hole-dpms
> -igt@kms_plane_cursor@overlay
> -igt@kms_plane_cursor@primary
> -igt@kms_plane_cursor@viewport
> -igt@kms_plane_lowres@tiling-none
> -igt@kms_plane_multiple@tiling-none
> -igt@kms_plane_scaling@invalid-parameters
> -igt@kms_prop_blob@basic
> -igt@kms_prop_blob@blob-multiple
> -igt@kms_prop_blob@blob-prop-core
> -igt@kms_prop_blob@blob-prop-lifetime
> -igt@kms_prop_blob@blob-prop-validate
> -igt@kms_prop_blob@invalid-get-prop
> -igt@kms_prop_blob@invalid-get-prop-any
> -igt@kms_prop_blob@invalid-set-prop
> -igt@kms_prop_blob@invalid-set-prop-any
> -igt@kms_properties@connector-properties-atomic
> -igt@kms_properties@connector-properties-legacy
> -igt@kms_properties@crtc-properties-atomic
> -igt@kms_properties@crtc-properties-legacy
> -igt@kms_properties@get_properties-sanity-atomic
> -igt@kms_properties@get_properties-sanity-non-atomic
> -igt@kms_properties@invalid-properties-atomic
> -igt@kms_properties@invalid-properties-legacy
> -igt@kms_properties@plane-properties-atomic
> -igt@kms_properties@plane-properties-legacy
> -igt@kms_rmfb@close-fd
> -igt@kms_rmfb@rmfb-ioctl
> -igt@kms_sequence@get-busy
> -igt@kms_sequence@get-forked
> -igt@kms_sequence@get-forked-busy
> -igt@kms_sequence@get-idle
> -igt@kms_sequence@queue-busy
> -igt@kms_sequence@queue-idle
> -igt@kms_universal_plane@disable-primary-vs-flip-pipe-a
> -igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a
> -igt@kms_universal_plane@universal-plane-pipe-a-functional
> -igt@kms_vblank@crtc-id
> -igt@kms_vblank@invalid
> -igt@kms_vblank@pipe-a-accuracy-idle
> -igt@kms_vblank@pipe-a-query-busy
> -igt@kms_vblank@pipe-a-query-forked
> -igt@kms_vblank@pipe-a-query-forked-busy
> -igt@kms_vblank@pipe-a-query-idle
> -igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend
> -igt@kms_vblank@pipe-a-ts-continuation-idle
> -igt@kms_vblank@pipe-a-ts-continuation-modeset
> -igt@kms_vblank@pipe-a-ts-continuation-suspend
> -igt@kms_vblank@pipe-a-wait-busy
> -igt@kms_vblank@pipe-a-wait-forked
> -igt@kms_vblank@pipe-a-wait-forked-busy
> -igt@kms_vblank@pipe-a-wait-idle
> -igt@kms_writeback@writeback-check-output
> -igt@kms_writeback@writeback-fb-id
> -igt@kms_writeback@writeback-invalid-parameters
> -igt@kms_writeback@writeback-pixel-formats
> -- 
> 2.39.5 (Apple Git-154)
> 
