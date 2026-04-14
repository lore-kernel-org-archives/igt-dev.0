Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208C6F9D0CA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 13:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA00010E605;
	Tue, 14 Apr 2026 13:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6C8EdGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FBB10E605
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776174009; x=1807710009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+gS05xk+TLL7EtWOPqfAatoviocydu4Ehrc7JjJZLFg=;
 b=k6C8EdGWXmFBsZQswAxb6g0ehz3/qVkpPKM3ONoF3VZ1oCMDjjCBmqQt
 1Ah+XK5ssexmn6j4w1JyV9oi0rL1YZ1H3LyFY5IwQfyh0cen56gW6MR90
 1HRq8jRQdvzG6jJAvIos5KZnkPt/ZfRDCySlWdof1JAfXb6uPwPIkIBcC
 3LLS5+91//gAPbxPDOmsUk1/Oj/Ixc3KY7cuit8LkK2+AQY8LG99PgSvK
 u7Z1w1JDc8NNUdb+eCIRQ5IDrUATWBDdQF8fu+D+A5680Ymk9ScFTRN+o
 jYkx/lwltMmwXttEUqTesprAxNAsegFZu/ISeARll5OUiQOhqVDSIikNG w==;
X-CSE-ConnectionGUID: WmicSLqUS86yiWZxisKMxQ==
X-CSE-MsgGUID: ORSpkWUmRxSzckrTYozgmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77240786"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77240786"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:40:09 -0700
X-CSE-ConnectionGUID: qzWK2almRFWl5ktRUPqzAw==
X-CSE-MsgGUID: 1/bMGd/zSX2PDjlAUDhmsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="226920195"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.235])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 06:40:05 -0700
Date: Tue, 14 Apr 2026 16:40:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Cc: "karthik.b.s@intel.com" <karthik.b.s@intel.com>,
 "swati2.sharma@intel.com" <swati2.sharma@intel.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 "bhanuprakash.modem@gmail.com" <bhanuprakash.modem@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "markyacoub@chromium.org" <markyacoub@chromium.org>
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add MTK device support
Message-ID: <ad5De-s-yxyyTt7s@intel.com>
References: <20260410100806.62906-1-jason-jh.lin@mediatek.com>
 <adjQJE8Ok5K_sNuc@intel.com>
 <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c20c056822e3bb860f48c23f3830a8ae93a67ef.camel@mediatek.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 14, 2026 at 03:11:21AM +0000, Jason-JH Lin (林睿祥) wrote:
> On Fri, 2026-04-10 at 13:25 +0300, Ville Syrjälä wrote:
> > On Fri, Apr 10, 2026 at 06:07:31PM +0800, Jason-JH Lin wrote:
> > > Adapt rotation CRC tests for MTK devices by using Intel-like pipe
> > > CRC
> > > approach with explicit vblank synchronization.
> > > MTK devices require a vblank wait to ensure rotation completes
> > > before
> > > CRC capture.
> > 
> > Instead of adding these checks all over igt I think you should
> > try to fix you kernel CRC implementation to not hand out garbage
> > CRCs.
> > 
> 
> The issue is fundamental to MTK's HW design where all HW configurations
> are applied by GCE (Global Command Engine) triggered by EOF signal.
> 
> MTK HW Configuration Flow:
> 
> igt_display_commit2(display, COMMIT_ATOMIC)
>             │
>             ▼
>        atomic_commit()
>             │
>             ▼
>        CMDQ submit
>             │
>             ▼
>     Wait for next EOF signal ─────────────────┐
>                                               │
>                                               ▼
>                                   GCE applies HW config
>                                   (Rotation parameters, etc.)
>                                   during VBlanking period
>                                 & GCE reads HW CRC from HW register
>                                   into DRAM buffer
>                                               │
>                                               ▼
>                                   Next Active Display Period
>                                   HW renders with new config
>                                               │
>                                               ▼
>                                   EOF → GCE reads HW CRC from
>                                     HW register into DRAM buffer
>                                               │
>                                               ▼
>                                   VBlank+1 → read CRC from DRAM
>                                            → drm_crtc_add_crc_entry() ✅
>                                   (MTK always reports CRC at VBlank+1
>                                    after the EOF capture)
> 
> 
> This design is intentional to ensure all HW settings are fully applied
> within the VBlanking period, guaranteeing tearing-free display updates.
> At the EOF signal, GCE reads the HW CRC from the HW register into a
> DRAM buffer. Note that MTK always reports the CRC at VBlank+1 after the
> EOF capture, which means there is already an inherent one-frame delay
> before the CRC is reported to IGT via drm_crtc_add_crc_entry().
> 
> IGT Expected Behavior (Intel/AMD):
> 
>   igt_display_commit2(display, COMMIT_ATOMIC)
>             │
>             ▼
>        atomic_commit()
>             │
>             ▼
>         VBlank N ──► HW config takes effect immediately ✅
>             │
>             ▼
>         EOF N ──► CRC captured with new config ✅
>             │
>             ▼
>         VBlank N+1 ──────────────────────► igt_pipe_crc_get_current() ✅
> 
> 
> 
> MTK Actual Behavior:
> 
>   igt_display_commit2(display, COMMIT_ATOMIC)
>             │
>             ▼
>        atomic_commit()
>             │
>             ▼
>        CMDQ submit
>             │
>             ▼
>         EOF N ──► GCE applies new config
>                ──► GCE reads CRC(old) from HW register into DRAM
>             │
>       VBlanking N ──► HW updated with new config (tearing-free ✅)
>             │
>         VBlank N+1 ──► CRC(old) reported via drm_crtc_add_crc_entry()
>             │
>         EOF N+1 ──► GCE reads CRC(new) from HW register into DRAM
>             │
>         VBlank N+2 ──► CRC(new) reported via drm_crtc_add_crc_entry()
>             │
>             ▼
>     igt_wait_for_vblank() is needed to ensure
>     igt_pipe_crc_get_current() captures the correct CRC ✅
> 
> As shown above, due to MTK's GCE-based HW architecture, there is an
> inherent multi-frame latency between igt_display_commit2() and the
> correct CRC being available. Unlike Intel/AMD where the new
> configuration takes effect immediately at the next VBlank, MTK requires
> at least 2 VBlanks after atomic_commit() before the correct CRC can be
> captured. Therefore, igt_wait_for_vblank() is necessary to ensure
> igt_pipe_crc_get_current() captures the correct CRC reflecting the new
> rotation configuration.
> 
> Since this timing behavior is inherent to MTK's GCE-based HW
> architecture and cannot be eliminated at the kernel driver level,
> adding igt_wait_for_vblank() in IGT is the appropriate solution.

It doesn't matter how long the latency is. The kernel should accompany
each CRC with the correct frame number for which the CRC was generated.
igt should have to do nothing but wait for the CRC with the correct
frame number to appear.

-- 
Ville Syrjälä
Intel
