Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA2DF483E3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 19:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C2F10E44E;
	Mon, 23 Mar 2026 19:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRuam1Sd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2170910E499
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 19:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774292897; x=1805828897;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=E1YW8tWyH31S9OHuSP0AOgST+mob3IDSUqy54HEitoI=;
 b=mRuam1SdzjjIzJObt8ObVRF44mpNhCE19g8Q28xfJdsME1sfRi/mgS8k
 hghU9/8uAOS2Hk0LIk8dGjlT21uJ6y9RQhTY1Tt3bnv6uu4G0N6Z0YrCP
 cYmdlK1sPtT6MLCFWNe189DpbQ8hdeSrGmj2UZCEVdw6H/D/cYf7HOxKN
 m2fN0D/uwSdvU7NJwxNbHWnV6t24WnFgZ9s5RzdsuH/m3ED+QtUxxpRZ1
 xbdpJ7zujwwMiovSVpKU2R1lT/THALQXxN1c/fNBEqYuOwmbxeRmsmPt8
 kaFtC8a/Gj2n+mAoOCUqAPD09vtMdLqyZcMfMcehGCHngCyPAT8bUj1GR A==;
X-CSE-ConnectionGUID: 4KcAPqXFSFCumnnwA+68qg==
X-CSE-MsgGUID: aIOGknh4QKOGUeyM6ne1cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78897364"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="78897364"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:08:17 -0700
X-CSE-ConnectionGUID: CFIykwn6R4ugTMMnWS0oOg==
X-CSE-MsgGUID: iWLJDkOQTNOmbLhZdqoWUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="224126848"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 12:08:16 -0700
Date: Mon, 23 Mar 2026 20:07:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: Renjun Wang <renjunw0@foxmail.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_plane: Allow
 planar-pixel-format-settings to pass on VKMS
Message-ID: <20260323190758.srnxovibguclmd66@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 Renjun Wang <renjunw0@foxmail.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>
References: <tencent_009881AF754F22143F3943B76A2645C05A0A@qq.com>
 <20260204122952.gl5jttuyhdmr2mm4@kamilkon-DESK.igk.intel.com>
 <37dc23bc-8be4-4d83-beae-1e464530667d@intel.com>
 <tencent_B3C0E454F1807377EB51D21A2CB4D9E91A06@qq.com>
 <2cf5b451-dc1a-47bc-9e15-f5e6bf3781ca@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2cf5b451-dc1a-47bc-9e15-f5e6bf3781ca@intel.com>
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

Hi Sharma,,
On 2026-03-19 at 23:41:25 +0530, Sharma, Swati2 wrote:
> Hi Wang
> 
> No, patch LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> 
> On 19-03-2026 01:46 pm, Renjun Wang wrote:
> > Hi Sharma,
> > 
> > The version 2 for this patch is send by Kamil Koneczny[1], and have CI
> > results. Do I need to send version 2 patch again?
> > 
> > 
> > [1] https://lore.kernel.org/igt-dev/20260216185231.164130-1-kamil.konieczny@linux.intel.com/
> > 

Thank you all, I removed all changes from comments and also
improved a little checks for Intel and now merged it.

Regards,
Kamil

> > 
> > Best Regards,
> > 
> > On 2/20/26 04:09, Sharma, Swati2 wrote:
> > > Hi Renjun,
> > > 
> > > On 04-02-2026 05:59 pm, Kamil Konieczny wrote:
> > > > Hi Renjun,
> > > > On 2026-02-01 at 14:11:43 +0800, Renjun Wang wrote:
> > > > > Set expected_rval to 0 for planar-pixel-format-settings tests when
> > > > > running on VKMS driver. VKMS currently accepts odd width/height for
> > > > > NV12, odd horizontal panning for NV12, and odd vertical panning for
> > > > > P016 formats.
> > > > > 
> > > > > Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
> > > > > ---
> > > > >   tests/kms_plane.c | 25 +++++++++++++------------
> > > > >   1 file changed, 13 insertions(+), 12 deletions(-)
> > > > > 
> > > > > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > > > > index 21d80847c..57adfe199 100644
> > > > > --- a/tests/kms_plane.c
> > > > > +++ b/tests/kms_plane.c
> > > > > @@ -1313,11 +1313,9 @@ static void test_planar_settings(data_t *data)
> > > > >       int devid;
> > > > >       int display_ver = -1;
> > > > >       int rval;
> > > > > +    bool is_intel = false;
> > > > > +    bool is_vkms = false;
> > > > >   -    /*
> > > > > -     * If here is added non-intel tests below require will need to be
> > > > > -     * changed to if(..)
> > > > > -     */
> > > > >       igt_require_f(data->display.is_atomic, "Atomic
> > > > > mode-set not supported\n");
> > > > >       if (is_intel_device(data->drm_fd)) {
> > > > >           igt_require_intel(data->drm_fd);
> > > > > @@ -1325,6 +1323,9 @@ static void test_planar_settings(data_t *data)
> > > > >           igt_require(intel_display_ver(devid) >= 9);
> > > > >           display_ver = intel_display_ver(devid);
> > > > >           igt_require(display_ver >= 9);
> > > > > +        is_intel = true;
> > > > > +    } else if (is_vkms_device(data->drm_fd)) {
> > > > > +        is_vkms = true;
> > > > >       }
> > > > >         output = igt_get_single_output_for_pipe(&data->display, pipe);
> > > > > @@ -1337,12 +1338,12 @@ static void test_planar_settings(data_t *data)
> > > > >                     DRM_MODE_ATOMIC_ALLOW_MODESET,
> > > > >                     NULL);
> > > > >   -    /* test against intel_plane_check_src_coordinates() in i915 */
> > > > I am not sure if removing this is proper, maybe move it just below
> > > > before 'if((is_intel...'
> > > > Same concern below, when you remove other i915 comments.
> > > > 
> > > > +cc Karthik and Swati
> > > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > > > 
> > > > > +    /* Test odd width for NV12 format */
> > > > Do we need it here, when just below is DRM_FORMAT_NV12?
> > > > Or is it 'odd width' that is worth pointing out?
> > > > Same concern below.
> > > > 
> > > > Overall looks good. Btw Karthik or Swati, please find someone
> > > > from KMS team and send this for testing, I will ack it then.
> > > > 
> > > > Regards,
> > > > Kamil
> > > 
> > > Agree with Kamil, lets keep existing comments as it is. Please add
> > > your changes on top of those.
> > > 
> > > https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings
> > > 
> > > 
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings
> > > 
> > > 
> > > There isn't any regression on CI results, results are okay.
> > > 
> > > > 
> > > > >       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> > > > >                        DRM_FORMAT_MOD_LINEAR)) {
> > > > >           int expected_rval = -EINVAL;
> > > > >   -        if (display_ver >= 20)
> > > > > +        if ((is_intel && display_ver >= 20) || is_vkms)
> > > > >               expected_rval = 0;
> > > > >             igt_create_fb(data->drm_fd, 257, 256,
> > > > > @@ -1358,12 +1359,12 @@ static void test_planar_settings(data_t *data)
> > > > >           igt_debug("Odd width NV12 framebuffer test skipped\n");
> > > > >       }
> > > > >   -    /* test against intel_plane_check_src_coordinates() in i915 */
> > > > > +    /* Test odd height for NV12 format */
> > > > >       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> > > > >                        DRM_FORMAT_MOD_LINEAR)) {
> > > > >           int expected_rval = -EINVAL;
> > > > >   -        if (display_ver >= 20 && display_ver < 35)
> > > > > +        if ((is_intel && display_ver >= 20 && display_ver <
> > > > > 35) || is_vkms)
> > > > >               expected_rval = 0;
> > > > >             igt_create_fb(data->drm_fd, 256, 257,
> > > > > @@ -1378,13 +1379,12 @@ static void test_planar_settings(data_t *data)
> > > > >       } else {
> > > > >           igt_debug("Odd height NV12 framebuffer test skipped\n");
> > > > >       }
> > > > > -
> > > > > -    /* test against intel_plane_check_src_coordinates() in i915 */
> > > > > +    /*Test odd horizontal panning for NV12 format */
> > > > >       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
> > > > >                        DRM_FORMAT_MOD_LINEAR)) {
> > > > >           int expected_rval = -EINVAL;
> > > > >   -        if (display_ver >= 35)
> > > > > +        if ((is_intel && display_ver >= 35) || is_vkms)
> > > > >               expected_rval = 0;
> > > > >             igt_create_fb(data->drm_fd, 810, 590,
> > > > > @@ -1401,11 +1401,12 @@ static void test_planar_settings(data_t *data)
> > > > >           igt_debug("Odd horizontal pan NV12 framebuffer
> > > > > test skipped\n");
> > > > >       }
> > > > >   +    /* Test odd vertical panning for P016 format */
> > > > >       if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
> > > > >                           DRM_FORMAT_MOD_LINEAR)) {
> > > > >           int expected_rval = -EINVAL;
> > > > >   -        if (display_ver >= 20 && display_ver < 35)
> > > > > +        if ((is_intel && display_ver >= 20 && display_ver <
> > > > > 35) || is_vkms)
> > > > >               expected_rval = 0;
> > > > >             igt_create_color_fb(data->drm_fd, 256, 260,
> > > > > -- 
> > > > > 2.47.3
> > > > > 
> > 
