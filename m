Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72ABC54E67
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 06:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C7F10ED08;
	Tue, 26 Mar 2024 06:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaLrj6SI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B996810ED08
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 06:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711433039; x=1742969039;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vfGJxEpaq4y1whfscXCB2TNJN6UPCilz/IDCVsPzsQQ=;
 b=YaLrj6SIRU4mPjouQixeQmzYYHTW2n50LvAtfodMD+lv4LhLxnnbLWYz
 NCtIJLj3+ttLJ75fdVWCGEBdWaGZ6zKhVuBbjSS56GHzYkNPQ5iubaRFU
 8A68AkG2awvikpmkHGe5a/XkIb36aIkPOG3lcefm6I0XWK1RtKSg+lBUl
 JAYchm0o/hQQPi0oWWHjoCXPyQuU2FeQ/damj/HZrK8x1f+6swDcDApbZ
 GX5eimVOE49EGZh/oOtqAmj3D3eAFMqI4q7tPjPeTqRDBGb8QdnHK1Y1l
 CO0uRpy3YS/oLZlddi6z8etdyVc9jgz2wjktlf7XyrhCEytDR4uumVGjP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="10261043"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="10261043"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 23:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; d="scan'208";a="15764176"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 23:03:56 -0700
Date: Tue, 26 Mar 2024 07:03:53 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v1 1/3] drm-uapi/xe_drm: Read flat ccs value from
 drm_xe_query_config
Message-ID: <20240326060353.huylsvn5xhhwed37@zkempczy-mobl2>
References: <cover.1711444735.git.akshata.jahagirdar@intel.com>
 <64b587ec51ad3f803ec51afc32f894f05761aadd.1711444735.git.akshata.jahagirdar@intel.com>
 <20240326051937.d62ix7ni6sbbdbjx@zkempczy-mobl2>
 <3b2f7338-195e-4410-b662-290550587a3b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b2f7338-195e-4410-b662-290550587a3b@intel.com>
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

On Mon, Mar 25, 2024 at 10:29:26PM -0700, Jahagirdar, Akshata wrote:
> 
> On 3/25/2024 10:19 PM, Zbigniew Kempczyński wrote:
> > On Tue, Mar 26, 2024 at 02:54:36AM -0700, Akshata Jahagirdar wrote:
> > > Add an additional drm_xe_query_config_flag for reading the value
> > > of flat_ccs of the platform.
> > > This can be used in respective igt testcases.
> > > 
> > > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > > ---
> > >   include/drm-uapi/xe_drm.h | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > > index 4353595a4..b43c8cf76 100644
> > > --- a/include/drm-uapi/xe_drm.h
> > > +++ b/include/drm-uapi/xe_drm.h
> > > @@ -389,6 +389,8 @@ struct drm_xe_query_mem_regions {
> > >    *
> > >    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the device
> > >    *      has usable VRAM
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS - Flag is set if the device
> > > + *      has flat ccs enabled
> > >    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
> > >    *    required by this device, typically SZ_4K or SZ_64K
> > >    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> > > @@ -405,6 +407,7 @@ struct drm_xe_query_config {
> > >   #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> > >   #define DRM_XE_QUERY_CONFIG_FLAGS			1
> > >   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_FLAT_CCS	(1 << 1)
> > May you point me out which kernel patch includes this flag into
> > xe_query.c?
> > 
> > --
> > Zbigniew
> 
> https://patchwork.freedesktop.org/series/131609/

Ok, I've found it already and replied.

Anyway your igt changes won't compile until above change will be
merged. UAPI requires some userspace user, but according to possibility
of turning off flat-ccs in BIOS I think UMDs will be interested to
examine of this flag. Generally this is chicken-and-egg problem -
igts require changes in the kernel which in turn requires userspace
user (which at the moment doesn't exist as this uapi is new).
We introduced some auxiliary files in igt (see i915_drm_local.h or
i915_pciids_local.h) to put necessary definitions there allowing
igts to compile. And when kernel change is merged updating uapi
along with removal of this temporary definitions from "local" files.

But to avoid double work I would just wait for Xe maintainers
opinion about new UAPI. I guess they will ack it and this flag
will be exposed.

--
Zbigniew

> 
> -- Akshata
> 
> > >   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > > -- 
> > > 2.34.1
> > > 
