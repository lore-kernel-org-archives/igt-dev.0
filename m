Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE88CD4851
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 15:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAE210E166;
	Thu, 14 May 2026 15:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOFdRcC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B099510E166
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778771181; x=1810307181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3StbHqOBtMyF5jygC4E61cQ4FL1pPA4bkCPjmwuf2Z4=;
 b=hOFdRcC1TTCQoQipGhTBhbLRzyvkmnYIfy1Xzq86DDACihZGqQ+h5AE0
 q5ovRutt9cwQtX6oBclBWbe/55JCEsX68eQDFQfjX+gmVALLAX3/nUMaN
 JZ8dLGsJWD7u+5jpVIdMEwsAY8bT4VmiUxLPgLBBBShkKvOPDGS+uhtEk
 Pr3CeAU7Td98SE61cdpTwwntAHIT1IvAT3pkL2Lji6SKSllmHhLXWFdkN
 VeMClQahayU7wrnKIRPMJK3lUy/dSbd1N6RndIBEc6QlYOI5bebhH5jr9
 JVC1LRBW68IDFQ6T8F+PFVzrMImXsLwuvWakUKFJZc9eVJHO1XIDqZQDr A==;
X-CSE-ConnectionGUID: bxEssXChSoWSAufJH5rpGA==
X-CSE-MsgGUID: dZ6mklRCSuyaG2iLKd2ShA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91100309"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="91100309"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 08:06:21 -0700
X-CSE-ConnectionGUID: BOyspMCrS86VZ3IV8FISbg==
X-CSE-MsgGUID: QCQlQY/3QhiI/0j/Fgg9eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="242751309"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 08:06:20 -0700
Date: Thu, 14 May 2026 17:06:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [igt-dev] [PATCH] tests/amdgpu: Add KFD IOCTL fuzzing test -
 Apologies for build failures
Message-ID: <20260514150617.d3jezd4ceun7lg46@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <a243c8c9-7681-4633-a25a-2b01fa33a53a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a243c8c9-7681-4633-a25a-2b01fa33a53a@amd.com>
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

Hi vitaly,
On 2026-05-07 at 00:08:18 -0400, vitaly prosyak wrote:
> Hi Kamil,
> 
> I apologize for the build failures in my recent amd_fuzzing_kfd patch series and the need for 3 additional fixup patches to address ARM cross-compilation issues.
> 
> The failures were due to:
> 1. Missing drm/drm.h include dependency on some systems
> 2. Incomplete KFD IOCTL struct definitions on ARM (forward declarations only)
> 3. KFD being x86/x86_64 specific (AMD GPUs not supported on ARM)
> 
> I've now submitted fixes that:
> - Add proper header dependencies and guards
> - Restrict KFD tests to x86/x86_64 architectures only in meson.build
> - Follow the same pattern as amd_kfd_dmabuf_unload.c
> 
> I'm curious - is there a way to see build failure results from patchwork.freedesktop.org before patches are merged? I couldn't find build status information on the patchwork interface, but I'd like to catch these issues earlier in the future. If you could point me to where CI build results are posted, I would greatly appreciate it.
> 
> Sorry again for the extra churn, and thank you for maintaining IGT!
> 
> Best regards,
> Vitaly 
> 

I will talk with our CI, I hope they could reintroduce compilation
step for different arch like armhf or arm64. We had pipeline
with builds but that was disabled during recent GitLab upgrade,
when no GitLab repos were available.

Regards,
Kamil

PS. for reference how it was before:
https://patchwork.freedesktop.org/series/138642/
with status line from GitLab.Pipeline

