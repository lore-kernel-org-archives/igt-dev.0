Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F607C88E45
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 14:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A8510E3C6;
	Fri, 11 Sep 2026 14:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I3+3OvQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B911A10E3C6
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789138749; x=1820674749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m5cX59RZe8i2FAj5zhj3FVeAai9a3kxDxUixe8XO7lU=;
 b=I3+3OvQjMxODl+ANA3hr0DyYDwa8JYdJyGHZ1Ix0uDZ23+eePBjQfvg6
 FheXjpkWEbVve1tgfNb1M0jz/D0wSUbBF5HTAA3lKDVdXOLWUCfspOp4M
 9+JS1SoaYjQ5hHPa3vEG5x0wpzdv3G4/FZ2Yz5N2Y8/Setj0nTXh7ZFlv
 VvMJi8kRAlgY0z3T2S6BZcxP+UVQe61Ku7Q+P62/p+edTFffj4wQMjTLj
 6lDY/VkEAxph0vTU4wLFQ7TNPTQfMPn191V6GOkHqKIoMomrajfV9baVI
 hkvIgeG1+iTcaU1vBOvXVcqvSOuagzmP1s6DUs1gip5Lai3zhQqd31uTo A==;
X-CSE-ConnectionGUID: xagsdj0YQEGofZjhU5Lz4w==
X-CSE-MsgGUID: N568L5nQQMKmlcdiBGrJNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="112373702"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="112373702"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 07:59:09 -0700
X-CSE-ConnectionGUID: BA3vAM3XSpy4xprSTGVGng==
X-CSE-MsgGUID: mEv6PSfLSLufnuQX2w2mUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="275700881"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 07:59:07 -0700
Date: Fri, 11 Sep 2026 16:59:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH i-g-t v3 1/3] drm-uapi: Sync drm_mode.h with drm-next up
 to 1258f9c9ff1d
Message-ID: <20260911145904.hnobi7jznld4tmet@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
References: <20260907180204.336052-1-kamil.konieczny@linux.intel.com>
 <20260907180204.336052-2-kamil.konieczny@linux.intel.com>
 <a8f7e5f1-144d-481a-97df-fec2d8f35481@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8f7e5f1-144d-481a-97df-fec2d8f35481@intel.com>
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
On 2026-09-10 at 17:25:23 +0530, Sharma, Swati2 wrote:
> Hi Kamil
> 
> Thanks for the patch. LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Applied only this one, thanks! I will resend two last ones
after weekend to test them on -rc3 kernel.

> 
> On 07-09-2026 11:32 pm, Kamil Konieczny wrote:
> > From: Maarten Lankhorst <dev@lankhorst.se>
> > 
> > Sync the drm_mode.h up to commit 1258f9c9ff1d to get all the
> > background property macros. With this following changes comes:
> > 
> > 1258f9c9ff1d ("drm/edid: parse panel type from DisplayID 2.x Display Parameters")
> > a1b6cf8e5e7e ("drm: uapi: Use SPDX in DRM core uAPI headers")
> > 42dab3138176 ("drm/connector: Add a new 'panel_type' property")
> > db971856bbe0 ("drm/colorop: Add 3D LUT support to color pipeline")
> > 7fa3ee8c0a79 ("drm/colorop: Define LUT_1D interpolation")
> > 
> > Update linux_scaffold.h to take the new changes into account.
> > 
> > This differs from drm-next with added DRM_COLOROP_FIXED_MATRIX
> > colorop property and removed to linux kernel includes.

s/to/two/

> > 
> > v3: sync with most recent drm-next change (Kamil)
> > 
> > Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > fix drm-uapi

I also fixed these description mistakes here.

Regards,
Kamil

[cut]

