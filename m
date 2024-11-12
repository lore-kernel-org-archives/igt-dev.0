Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21771D32D92
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 11:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A2710E5CD;
	Tue, 12 Nov 2024 11:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOcgLC/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765E310E5D2
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731410572; x=1762946572;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZPE9wp0IMl1LhngVz76Z+g6dp4lTUOsJHBNwrm0lsw8=;
 b=aOcgLC/AalpxCuujnWW+wjJofSe81J8LifSYRcsqCwUygw8H7fdHl4He
 G5s3SL8/QQh8JUXyKMh0M2pzwew85TPfZXDV44ierWSRYp76jXp1yzyZP
 tky51EyPl6oVSbEEtwq4ZuASJ9bZIcYdoQWHnerxArImP27JctEgD4F2G
 720FSOA7lnd/LkQskAUybA16qP1XzwCpaUv7uxJZj4lqMkbCyabDx5wPD
 Orns7y0GzF0CUltHrNv5sJpJUoYYnh7j2x1emK2VZryOuFJWn9TG11zF4
 4DaoyTqRYb4pjEBEInTMyh97NPl6BX9+22Fo0ZcSW8ZEjTZLQXy60Vsln Q==;
X-CSE-ConnectionGUID: pT0PJx+gTEiSAurfLLAoOw==
X-CSE-MsgGUID: dkgUj0PkTem/iyf4DvUtJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31411625"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31411625"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:22:52 -0800
X-CSE-ConnectionGUID: Qzn3Gm9/Tm2kJ/2RT0zqqA==
X-CSE-MsgGUID: X3aTK1cyTSWRjMohw7cjdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="88230353"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 03:22:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ngai-Mint Kwan
 <ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
In-Reply-To: <20241112110901.omdnfywpzfvsw2mh@zkempczy-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
 <87iksyeplx.fsf@intel.com>
 <20241112110901.omdnfywpzfvsw2mh@zkempczy-mobl2>
Date: Tue, 12 Nov 2024 13:22:47 +0200
Message-ID: <87cyj0d7co.fsf@intel.com>
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

On Tue, 12 Nov 2024, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.=
com> wrote:
> On Thu, Nov 07, 2024 at 10:49:30PM +0200, Jani Nikula wrote:
>> On Thu, 07 Nov 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> w=
rote:
>> > On 2024-11-06 at 10:58:46 -0800, Ngai-Mint Kwan wrote:
>> >> diff --git a/lib/i915_pciids.h b/lib/pciids.h
>> >> similarity index 93%
>> >> rename from lib/i915_pciids.h
>> >> rename to lib/pciids.h
>> >> index 3e39d644e..7632507af 100644
>> >> --- a/lib/i915_pciids.h
>> >> +++ b/lib/pciids.h
>> >> @@ -22,30 +22,23 @@
>> >>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTH=
ER
>> >>   * DEALINGS IN THE SOFTWARE.
>> >>   */
>> >> -#ifndef _I915_PCIIDS_H
>> >> -#define _I915_PCIIDS_H
>> >> -
>> >> -/*
>> >> - * A pci_device_id struct {
>> >> - *	__u32 vendor, device;
>> >> - *      __u32 subvendor, subdevice;
>> >> - *	__u32 class, class_mask;
>> >> - *	kernel_ulong_t driver_data;
>> >> - * };
>> >> - * Don't use C99 here because "class" is reserved and we want to
>> >> - * give userspace flexibility.
>> >> - */
>> >> -#define INTEL_VGA_DEVICE(id, info) { \
>> >> -	0x8086,	id, \
>> >> -	~0, ~0, \
>> >> -	0x030000, 0xff0000, \
>> >> -	(unsigned long) info }
>> >> -
>> >> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
>> >> -	0x8086,	0x16a, \
>> >> -	0x152d,	0x8990, \
>> >> -	0x030000, 0xff0000, \
>> >> -	(unsigned long) info }
>> >> +#ifndef __PCIIDS_H__
>> >> +#define __PCIIDS_H__
>> >> +
>> >> +#ifdef __KERNEL__
>> >
>> > I am not sure if we want a kernel defs, this is for userspace
>> > so imho this ifdef KERNEL/endif should be deleted. Or write
>> > a rationale why you included it here, or make it a comment?
>> > +cc Zbigniew
>>=20
>> The file comes verbatim from kernel.
>
> I have mixed feelings about copying kernel headers here directly
> if they are not uapi. However __KERNEL__ conditional was added to
> this header intentionally so copying this file outside the kernel
> and further reuse in userspace code is harmless. But I would add
> some explanation to README.md about pciids.h copying procedure
> for the future.

We've been doing this for PCI IDs for at least 10 years, and for
intel_vbt_defs.h for at least 7 years.

Please feel free to send documentation patches.


BR,
Jani.

--=20
Jani Nikula, Intel
