Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B167FD3C913
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664CF10E72B;
	Wed, 10 Dec 2025 14:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQoBJ5qh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C0F10E72B
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376730; x=1796912730;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=ULyw/wIL2FptFg03Mqh+3LQPY8bSlSWrPkUMJFwsEyI=;
 b=BQoBJ5qhpozyH2YueeNWlySC/UNoQt26xgP9yZ1qsnUl+Gb2RlqpmcUR
 w4cOasm5p43YCaO/Yx3o/WdgOcjPI+024/xE7nL05xz4q4CnddCTltqer
 WqrdTSp1A3AvKhkQW8uYAl8W61njH07vvmDWrbwHOL4jr7p+hGHMWU88L
 aRy2O1KKB5tEU4+tQ6dyY6xWXJKT0pC6kzhW6KPY1i2OTEijFRs2n7/aq
 gRPyCrZFb0QkEKFSk/e8a15plwcbCtz7d2tn0r+lnAOzBdo+6iAP3Z0mo
 7dge0lbTC+F2A8hRRnt4jfjDEgtJjfKeiPmzIlIT0K7MyxE255F5/M684 w==;
X-CSE-ConnectionGUID: hiRqqbcSRcydM8K5xZnBKw==
X-CSE-MsgGUID: UJ/KSe8qQQi/9zPVQ+zbAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67283362"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67283362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:25:30 -0800
X-CSE-ConnectionGUID: Bt9VkjOTSKqloDLNadeDPw==
X-CSE-MsgGUID: 9sf9HVWVRgG3RrfGww6MGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="201641459"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:25:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 06/10] lib/kms: Remove tall tales about 'pipe' in
 DRM_IOCTL_WAIT_VBLANK
In-Reply-To: <20251210093903.15934-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-7-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:25:25 +0200
Message-ID: <2bf7fd924114c7ba2177678cb0023d106945cc6d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The igt_wait_for_vblank_count() docs are talking nonsense about
> DRM_IOCTL_WAIT_VBLANK taking some kind of 'pipe' parameter.
> What it actually takes is the original (short-sighted)
> DRM_VBLANK_SECONDARY flag, and the later extension in the
> form of DRM_VBLANK_HIGH_CRTC_MASK.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 951144bae955..3e7543ae1d88 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5827,15 +5827,6 @@ static int __igt_vblank_wait(int drm_fd, int crtc_=
offset, int count)
>   * @count: Number of vblanks to wait on
>   *
>   * Waits for a given number of vertical blank intervals
> - *
> - * In DRM, 'Pipe', as understood by DRM_IOCTL_WAIT_VBLANK,
> - * is actually an offset of crtc in drmModeRes.crtcs
> - * and it has nothing to do with a hardware concept of a pipe.
> - * They can match but don't have to in case of DRM lease or
> - * non-contiguous pipes.
> - *
> - * To make thing clear we are calling DRM_IOCTL_WAIT_VBLANK's 'pipe'
> - * a crtc_offset.
>   */
>  void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
>  {

--=20
Jani Nikula, Intel
