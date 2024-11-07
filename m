Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E96D5D68A
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 20:49:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F85E10E8E2;
	Thu,  7 Nov 2024 20:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ye+BzN2F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AD110E8E2
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 20:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731012577; x=1762548577;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2LSTuYNvDEK+iZYCm2FwX5X2IAcrzhJJJQ++AUaOl5o=;
 b=Ye+BzN2F5mIBEFzOe8b3UONA8cgyAfXaFSY/vgKbCYz0rddJ2efKzWV9
 ISblkwwVH6IjuRjxitUDIgFH41r0fCP8WTc9gNkz3vVsNwAg2IuSrc0Yu
 XpLR4mN2LIdG6ogVx1k8l08u1mUwoooTPbw8aobs36KoOR+ECe/wzQ3It
 ui8AR9/3zkUqdI9rC7CPypKaVXJVpL/ngdpK1uL5Z7zVOTpTzK16jMcBs
 ec/yusYfI3TuNiR+63ex8gJkoT/7cDyorBz8ZfCLg4XtIgM650wO4JOws
 nZzO53EIJ0JX+QAdH5afGitmCTlRgSNaR0XydPUku8WoLsf2K10+BL5lV Q==;
X-CSE-ConnectionGUID: W1PsH91lTR2FdVr3cH2W9Q==
X-CSE-MsgGUID: bAjm8BpKTJC6Fde08fZ6iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34572138"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34572138"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 12:49:36 -0800
X-CSE-ConnectionGUID: i1tUK0tkR52SVDsEKhnz4w==
X-CSE-MsgGUID: 4vFv0AmmRb6RI8EOYPpAow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85638138"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.233])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 12:49:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>, Zbigniew =?utf-8?Q?Ke?=
 =?utf-8?Q?mpczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
In-Reply-To: <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
Date: Thu, 07 Nov 2024 22:49:30 +0200
Message-ID: <87iksyeplx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 07 Nov 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> On 2024-11-06 at 10:58:46 -0800, Ngai-Mint Kwan wrote:
>> diff --git a/lib/i915_pciids.h b/lib/pciids.h
>> similarity index 93%
>> rename from lib/i915_pciids.h
>> rename to lib/pciids.h
>> index 3e39d644e..7632507af 100644
>> --- a/lib/i915_pciids.h
>> +++ b/lib/pciids.h
>> @@ -22,30 +22,23 @@
>>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>   * DEALINGS IN THE SOFTWARE.
>>   */
>> -#ifndef _I915_PCIIDS_H
>> -#define _I915_PCIIDS_H
>> -
>> -/*
>> - * A pci_device_id struct {
>> - *	__u32 vendor, device;
>> - *      __u32 subvendor, subdevice;
>> - *	__u32 class, class_mask;
>> - *	kernel_ulong_t driver_data;
>> - * };
>> - * Don't use C99 here because "class" is reserved and we want to
>> - * give userspace flexibility.
>> - */
>> -#define INTEL_VGA_DEVICE(id, info) { \
>> -	0x8086,	id, \
>> -	~0, ~0, \
>> -	0x030000, 0xff0000, \
>> -	(unsigned long) info }
>> -
>> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
>> -	0x8086,	0x16a, \
>> -	0x152d,	0x8990, \
>> -	0x030000, 0xff0000, \
>> -	(unsigned long) info }
>> +#ifndef __PCIIDS_H__
>> +#define __PCIIDS_H__
>> +
>> +#ifdef __KERNEL__
>
> I am not sure if we want a kernel defs, this is for userspace
> so imho this ifdef KERNEL/endif should be deleted. Or write
> a rationale why you included it here, or make it a comment?
> +cc Zbigniew

The file comes verbatim from kernel.

BR,
Jani.


-- 
Jani Nikula, Intel
