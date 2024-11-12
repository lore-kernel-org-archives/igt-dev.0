Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C0DD32D91
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 11:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A37B10E5BC;
	Tue, 12 Nov 2024 11:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHSkRh2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CFA10E0F3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731409747; x=1762945747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=If0HDE2uEV7xiCJ4Hr/b/rthpHAjYV/zHPNp2gyb0G8=;
 b=IHSkRh2flLKld5vXhdEe4YEg6XLD+cwsfW8H+NnEP3SKuN1Nhm6hT+ZA
 ctH9OtWkRM6rE61jlKXR/3d9AOiB4R5p0NYkDqYYejrjr/XTNji+tfy5H
 H3KwH5gkC23Iuam2PfM/bNyTmG8DnvDrp1RKYwqT/M32j0GSgTRZeVENW
 E5TYpi5eFec5+kLrirm71/6C1O64rBQTyTV96nv77zuCd6dU43/Q41n8F
 nicHlLXVv+rrj4inrg/zBSHWW95zjwuFdx2Duj38BxOSmsf6MazQmoIL1
 zt1+wzeBsphMbq/9waSrYL98TNnu97PJDvSaaBbutZzqSkxoRmAAppYln w==;
X-CSE-ConnectionGUID: m+SvMUMIS5a06nDHKZOLcQ==
X-CSE-MsgGUID: 22Rk1QCUTySdMCB6YqzdbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31004891"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31004891"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:09:07 -0800
X-CSE-ConnectionGUID: pztUEF+bRaSkuTx/nTo10w==
X-CSE-MsgGUID: psZ9JVj0Rg+4D4EMUpgeVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="92360064"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:09:05 -0800
Date: Tue, 12 Nov 2024 12:09:01 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
Message-ID: <20241112110901.omdnfywpzfvsw2mh@zkempczy-mobl2>
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
 <87iksyeplx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87iksyeplx.fsf@intel.com>
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

On Thu, Nov 07, 2024 at 10:49:30PM +0200, Jani Nikula wrote:
> On Thu, 07 Nov 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > On 2024-11-06 at 10:58:46 -0800, Ngai-Mint Kwan wrote:
> >> diff --git a/lib/i915_pciids.h b/lib/pciids.h
> >> similarity index 93%
> >> rename from lib/i915_pciids.h
> >> rename to lib/pciids.h
> >> index 3e39d644e..7632507af 100644
> >> --- a/lib/i915_pciids.h
> >> +++ b/lib/pciids.h
> >> @@ -22,30 +22,23 @@
> >>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> >>   * DEALINGS IN THE SOFTWARE.
> >>   */
> >> -#ifndef _I915_PCIIDS_H
> >> -#define _I915_PCIIDS_H
> >> -
> >> -/*
> >> - * A pci_device_id struct {
> >> - *	__u32 vendor, device;
> >> - *      __u32 subvendor, subdevice;
> >> - *	__u32 class, class_mask;
> >> - *	kernel_ulong_t driver_data;
> >> - * };
> >> - * Don't use C99 here because "class" is reserved and we want to
> >> - * give userspace flexibility.
> >> - */
> >> -#define INTEL_VGA_DEVICE(id, info) { \
> >> -	0x8086,	id, \
> >> -	~0, ~0, \
> >> -	0x030000, 0xff0000, \
> >> -	(unsigned long) info }
> >> -
> >> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
> >> -	0x8086,	0x16a, \
> >> -	0x152d,	0x8990, \
> >> -	0x030000, 0xff0000, \
> >> -	(unsigned long) info }
> >> +#ifndef __PCIIDS_H__
> >> +#define __PCIIDS_H__
> >> +
> >> +#ifdef __KERNEL__
> >
> > I am not sure if we want a kernel defs, this is for userspace
> > so imho this ifdef KERNEL/endif should be deleted. Or write
> > a rationale why you included it here, or make it a comment?
> > +cc Zbigniew
> 
> The file comes verbatim from kernel.

I have mixed feelings about copying kernel headers here directly
if they are not uapi. However __KERNEL__ conditional was added to
this header intentionally so copying this file outside the kernel
and further reuse in userspace code is harmless. But I would add
some explanation to README.md about pciids.h copying procedure
for the future.

--
Zbigniew

> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel
