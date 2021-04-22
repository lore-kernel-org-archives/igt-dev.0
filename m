Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D8B6EA33
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Apr 2021 06:12:07 +0000 (UTC)
Date: Thu, 22 Apr 2021 09:13:13 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YIET+VN+JnRrbuja@platvala-desk.ger.corp.intel.com>
References: <20210416172724.3203107-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416172724.3203107-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH v2] tests/kms_atomic_transition: Enable
 Primary Plane on Enabling CRTC.
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 01:27:24PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> Setup all plane params before committing anything.
> Do not disable Primary Plane whenever a CRTC is getting enabled.
> 
> AMD Driver requires the primary plane to be enabled whenever the CRTC is, otherwise
> drm_mode_cursor_universal may end up trying to enable the cursor plane while all other
> planes are disabled, which is not supported by the hardware.
> 
> === Changes from v1 ===
> Remove product names from commit message
> 
> Cc: Nicholas.Kazlauskas@amd.com
> ---
>  tests/kms_atomic_transition.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)


I've asked Intel display folks to chime in whether i915 needs any of
this flow needs to be unchanged with is_i915_device(), no response
yet. We also need a word from someone to confirm that this patch does
what it says on the tin for amdgpu. Nicholas, are you able to get
someone to look at this?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
