Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E26D32D9A
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 11:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFF910E136;
	Tue, 12 Nov 2024 11:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bB7xwhPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D34F10E136
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 11:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731412670; x=1762948670;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jRoWCxs8BDEEVh6Xeu6AE5hh7zsBFddUbQCPLgRhtT8=;
 b=bB7xwhPuJiDgYmh8pH1svXU/+S2yH235zqf7U97fHDQKQ8ckdVwIyaBY
 oSFf2feZC3cQa02FtZ3oK8mEG9EolAPij70sfwUH5R6rCiHNcGFSIs4Fc
 mbbtKjlxqndDhxORZOhzxN311pmCa6LjjlPsZqJ6rrw389C/jQlAiRtab
 ART5mRwNtBvIKfFyg9q6BjgNR3hiGnr0niteSN8Oc41kwVkoUKZmAAeZ/
 U3yH08SeuwxoOJDhFpaKHtEHK/XQYRLnjmDgZ0wt1WcChx3VPQnlCO5Sw
 nIuLfkDigLORTC98uc9QXa4tt8UJkEtZu794KEWZesmI/+bZwTualjjER w==;
X-CSE-ConnectionGUID: 4H01SYUcRYmEHGYM/TkYrQ==
X-CSE-MsgGUID: OjY11YoVRrCHJJWlFaM+3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="48753446"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="48753446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:57:49 -0800
X-CSE-ConnectionGUID: oGh0xhSIR3q3fb8MLUcVyw==
X-CSE-MsgGUID: iz4CK67uRwyn/bBhEaGiig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="92201857"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:57:48 -0800
Date: Tue, 12 Nov 2024 12:57:45 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
Message-ID: <20241112115745.qwb2qqovpntdn6uz@zkempczy-mobl2>
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
 <87iksyeplx.fsf@intel.com>
 <20241112110901.omdnfywpzfvsw2mh@zkempczy-mobl2>
 <87cyj0d7co.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87cyj0d7co.fsf@intel.com>
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

On Tue, Nov 12, 2024 at 01:22:47PM +0200, Jani Nikula wrote:
> On Tue, 12 Nov 2024, Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> wrote:
> > On Thu, Nov 07, 2024 at 10:49:30PM +0200, Jani Nikula wrote:
> >> On Thu, 07 Nov 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> >> > On 2024-11-06 at 10:58:46 -0800, Ngai-Mint Kwan wrote:
> >> >> diff --git a/lib/i915_pciids.h b/lib/pciids.h
> >> >> similarity index 93%
> >> >> rename from lib/i915_pciids.h
> >> >> rename to lib/pciids.h
> >> >> index 3e39d644e..7632507af 100644
> >> >> --- a/lib/i915_pciids.h
> >> >> +++ b/lib/pciids.h
> >> >> @@ -22,30 +22,23 @@
> >> >>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> >> >>   * DEALINGS IN THE SOFTWARE.
> >> >>   */
> >> >> -#ifndef _I915_PCIIDS_H
> >> >> -#define _I915_PCIIDS_H
> >> >> -
> >> >> -/*
> >> >> - * A pci_device_id struct {
> >> >> - *	__u32 vendor, device;
> >> >> - *      __u32 subvendor, subdevice;
> >> >> - *	__u32 class, class_mask;
> >> >> - *	kernel_ulong_t driver_data;
> >> >> - * };
> >> >> - * Don't use C99 here because "class" is reserved and we want to
> >> >> - * give userspace flexibility.
> >> >> - */
> >> >> -#define INTEL_VGA_DEVICE(id, info) { \
> >> >> -	0x8086,	id, \
> >> >> -	~0, ~0, \
> >> >> -	0x030000, 0xff0000, \
> >> >> -	(unsigned long) info }
> >> >> -
> >> >> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
> >> >> -	0x8086,	0x16a, \
> >> >> -	0x152d,	0x8990, \
> >> >> -	0x030000, 0xff0000, \
> >> >> -	(unsigned long) info }
> >> >> +#ifndef __PCIIDS_H__
> >> >> +#define __PCIIDS_H__
> >> >> +
> >> >> +#ifdef __KERNEL__
> >> >
> >> > I am not sure if we want a kernel defs, this is for userspace
> >> > so imho this ifdef KERNEL/endif should be deleted. Or write
> >> > a rationale why you included it here, or make it a comment?
> >> > +cc Zbigniew
> >> 
> >> The file comes verbatim from kernel.
> >
> > I have mixed feelings about copying kernel headers here directly
> > if they are not uapi. However __KERNEL__ conditional was added to
> > this header intentionally so copying this file outside the kernel
> > and further reuse in userspace code is harmless. But I would add
> > some explanation to README.md about pciids.h copying procedure
> > for the future.
> 
> We've been doing this for PCI IDs for at least 10 years, and for
> intel_vbt_defs.h for at least 7 years.
> 
> Please feel free to send documentation patches.

I see no __KERNEL__ in current xe_pciids.h and i915_pciids.h so
there's some change from my perspective. intel_vbt_defs.h also
doesn't contain any kernel conditional inside. I think author
of this change should provide additional documentation about this
(not me) - commit message for me is not enough. Till this change
I haven't noticed any __KERNEL__ usage in igt codebase and I think
if it appears it should be documented what's for dead code is
imported to the project.

--
Zbigniew

> 
> 
> BR,
> Jani.
> 
> -- 
> Jani Nikula, Intel
