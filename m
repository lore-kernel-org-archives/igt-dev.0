Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D2FCCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 16:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBC510E606;
	Tue, 28 Oct 2025 16:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kg7tqcrP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951ED10E606
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 16:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761669361; x=1793205361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7TPwAB+VvRz1WqbhknLUdpoVlaSEDihXdQzTeQ9Sls4=;
 b=kg7tqcrPWOToWWaHbVukMzEzNeyojiz0D/ozO9mfyIlT2C+neNSIfsrH
 1qj52OtrMMno4S7rMWipd15Z5km1k9iPkRFoEEx1ggDFKe5HwsnfU/kXT
 VufoO89dzUNrDtRPj5XlKnjuZMtozLFs5J3PFGe39xQLqhXS7ZH+1Duiz
 7gRAqgbKhX0ZcwbCkuulsstLqWq+jDfDW5/Li0NaeBDvWJJerwBtLJzmw
 abEQHYoyh2MMknVI8RZViR+ZyFZJdokkI/BDm0D/mcEa38RLm2xN/zc8e
 koxMhD5fPCtGrsPPv5iWGcufvugXBG3/rA5FrJsWO1gXadP4+Rw3ERYo8 w==;
X-CSE-ConnectionGUID: domdYW97Rw2scmnujlvkNg==
X-CSE-MsgGUID: 6/kTW5NwRs6MnAIy7Ha/+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74451499"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74451499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:36:00 -0700
X-CSE-ConnectionGUID: a60oU+FfSS2P/2w7460qyA==
X-CSE-MsgGUID: EQqLAvbsSGSy7xaFMNF6tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189450867"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 09:35:58 -0700
Date: Tue, 28 Oct 2025 17:35:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
Subject: Re: [PATCH i-g-t v2 1/1] lib/pciids: Add NVL-S and split out BMG-G21
Message-ID: <20251028163541.gvaycyurtgaykt44@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>
References: <20251028104234.14745-1-kamil.konieczny@linux.intel.com>
 <20251028104234.14745-2-kamil.konieczny@linux.intel.com>
 <4uubshfhdvnc2nxat3mwjoc5x3ayubtitzk534ks2ysb4mlrkd@gfzff2dbt43g>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4uubshfhdvnc2nxat3mwjoc5x3ayubtitzk534ks2ysb4mlrkd@gfzff2dbt43g>
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

Hi Lucas,
On 2025-10-28 at 08:53:39 -0500, Lucas De Marchi wrote:
> On Tue, Oct 28, 2025 at 11:42:34AM +0100, Kamil Konieczny wrote:
> > Sync with drm-next kernel commit c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
> > Link: https://lore.kernel.org/r/20251016-xe3p-v3-11-3dd173a3097a@intel.com
> > 
> > This adds NovaLake-S PCI ids, and with it there are two more PCI
> > ids commits, one for splitting BMG-G21 out of BMG for workarounds
> > and the other adds a kernel macro.
> > 
> > 78de8f876683 ("drm/xe: Handle Wa_22010954014 and Wa_14022085890 as device workarounds")
> > Link: https://lore.kernel.org/r/20251013200944.2499947-40-matthew.d.roper@intel.com
> > 
> > edb660ad79ff ("drm/intel/pciids: Add match on vendor/id only")
> > Link: https://lore.kernel.org/r/20250808-intel-pci-device-v1-1-ce3545d86502@intel.com
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> I don't like the commit message, but I don't care enough about it right
> now neither.
> 
> I think it would be much better if going forward we'd adopt a template
> and maybe even automate it. Something like this:
> 
> 
> 	Subject: lib/pciids: sync with kernel commit {kernel_head}
> 
> 	Synchronize PCI IDs with kernel up to {kernel_head}, which
> 	includes the following changes:
> 
> 	{kernel_log}
> 

Looks ok, I will change subject and description according to it
and will send v3 with your r-b. Imho there should be a mension
from which repo it was taken, drm-next or other, so anyone could
verify it.

Regards,
Kamil

> Which could basically be generated by a (to be added) script:
> 
> 	tools/sync-intel-pciids [--head <commit>] [--base <commit>][--no-commit] <kernel-checkout>
> 
> What it does:
> 	a) inspect the last commit in igt that touched the header and
> 	   find the kernel_base. --base can override that.
> 	b) git -C /path/to/kernel/checkout show $KERNEL_HEAD:include/drm/intel/pciids.h
> 		> lib/pciids.h
> 
> 	   which basically copies the heade from whatever state of the
> 	   kernel checkout we want - some times we may want it from a
> 	   kernel release, some times from a particular branch, as long
> 	   as it keeps moving forward.
> 
> 	   --head can force a specific commit from kernel, otherwise it
> 	   uses a default (drm/drm-next may be a good default).
> 
> 	c) Commit the results with the template above.
> 
> 
> This would avoid having commits to fix things up like because it went
> astray. was done in commit
> 3896691534ef ("lib/pciids: lib/pciids: Add Wildcat Lake"). Same script
> can be easily adapted to help updating the include/uapi
> headers.
> 
> This should get us back to having the updates like we had in the past:
> 
> 	2042426168cf lib: sync i915_pciids.h with kernel commit cfa7772880f8
> 	440669b77f16 lib: sync i915_pciids.h with kernel commit d2c4b1db1c4f
> 	9702d87169f7 lib: sync i915_pciids.h with kernel commit 7858cc0b55e3
> 	ea767a50aa93 lib: sync i915_pciids.h with kernel commit bfbda4722767
> 	940399b2f807 lib: sync i915_pciids.h with kernel commit aa3d586e1624
> 	1dda137aea8b lib: sync i915_pciids.h with kernel commit 5c8c22adc802
> 	167ffe4acb08 lib: sync i915_pciids.h with kernel commit 7b43a37348b7
> 	2763d0874328 lib: sync i915_pciids.h with kernel commit 41c0f8a36f15
> 	00dcfce5cb2b lib: sync i915_pciids.h with kernel commit 432ed92bfb55
> 
> Thoughts?
> 
> Lucas De Marchi
> 
> 
> > 
> > v2: squashed into one commit (Lucas)
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> > lib/pciids.h | 21 +++++++++++++++++++--
> > 1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/pciids.h b/lib/pciids.h
> > index 76f8d26f9..9f095a99d 100644
> > --- a/lib/pciids.h
> > +++ b/lib/pciids.h
> > @@ -26,6 +26,11 @@
> > #define __PCIIDS_H__
> > 
> > #ifdef __KERNEL__
> > +#define INTEL_PCI_DEVICE(_id, _info) { \
> > +	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> > +	.driver_data = (kernel_ulong_t)(_info), \
> > +}
> > +
> > #define INTEL_VGA_DEVICE(_id, _info) { \
> > 	PCI_DEVICE(PCI_VENDOR_ID_INTEL, (_id)), \
> > 	.class = PCI_BASE_CLASS_DISPLAY << 16, .class_mask = 0xff << 16, \
> > @@ -844,7 +849,7 @@
> > 	MACRO__(0x64B0, ## __VA_ARGS__)
> > 
> > /* BMG */
> > -#define INTEL_BMG_IDS(MACRO__, ...) \
> > +#define INTEL_BMG_G21_IDS(MACRO__, ...) \
> > 	MACRO__(0xE202, ## __VA_ARGS__), \
> > 	MACRO__(0xE209, ## __VA_ARGS__), \
> > 	MACRO__(0xE20B, ## __VA_ARGS__), \
> > @@ -853,7 +858,10 @@
> > 	MACRO__(0xE210, ## __VA_ARGS__), \
> > 	MACRO__(0xE211, ## __VA_ARGS__), \
> > 	MACRO__(0xE212, ## __VA_ARGS__), \
> > -	MACRO__(0xE216, ## __VA_ARGS__), \
> > +	MACRO__(0xE216, ## __VA_ARGS__)
> > +
> > +#define INTEL_BMG_IDS(MACRO__, ...) \
> > +	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
> > 	MACRO__(0xE220, ## __VA_ARGS__), \
> > 	MACRO__(0xE221, ## __VA_ARGS__), \
> > 	MACRO__(0xE222, ## __VA_ARGS__), \
> > @@ -876,4 +884,13 @@
> > 	MACRO__(0xFD80, ## __VA_ARGS__), \
> > 	MACRO__(0xFD81, ## __VA_ARGS__)
> > 
> > +/* NVL-S */
> > +#define INTEL_NVLS_IDS(MACRO__, ...) \
> > +	MACRO__(0xD740, ## __VA_ARGS__), \
> > +	MACRO__(0xD741, ## __VA_ARGS__), \
> > +	MACRO__(0xD742, ## __VA_ARGS__), \
> > +	MACRO__(0xD743, ## __VA_ARGS__), \
> > +	MACRO__(0xD744, ## __VA_ARGS__), \
> > +	MACRO__(0xD745, ## __VA_ARGS__)
> > +
> > #endif /* __PCIIDS_H__ */
> > -- 
> > 2.51.1
> > 
