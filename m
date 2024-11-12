Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB11D32D8D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D72B10E308;
	Tue, 12 Nov 2024 13:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN7yus23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677FF10E308
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731416536; x=1762952536;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=wJY6BWAl8GAKTqTa/xWKsVcjV9RpksEhcsHS9iRyTtU=;
 b=gN7yus234b5Uk7GbQy7kK336mmYbAW+oFVx+rcgK4Do2eH/2gUnsXNo6
 kRVzWvDRq0J3evtZWtPioM0x3jF/69w0QH4vR5u43t9rSPvOaIdLesHge
 MJ8wPxl1Quj09qZMgD11q/QCi0nKd/WNNclZdZ0YnP5/SlLcOBIMdDlhD
 NenWTqU0cW5b+SKXV2LcyaBch3RDHgLVxqYQD4YKPvdcBR0zaGS//sQ5S
 o9Uo6t+xv/Z50SzHt7W1S1VaSqT29GwHNGwbv5rHTBoTaL9a2EUGqvGy4
 BjsFF1F0jyfk8Z9wcgEr87M0yxlZbAYFhKZ57KAygjNBfBM2YcBp79EmV Q==;
X-CSE-ConnectionGUID: V7MaoWpIRJmD3DQwHQ5ECA==
X-CSE-MsgGUID: EEMFBjrSQJaZU0+UvZyc3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="42633592"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="42633592"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:02:16 -0800
X-CSE-ConnectionGUID: Irw1NOBiRBST7QYyJDc+AA==
X-CSE-MsgGUID: QJhMBCjCSDe5tjM9taaASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87358581"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:02:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Ngai-Mint Kwan
 <ngai-mint.kwan@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib: sync PCI ID macros with kernel
In-Reply-To: <20241112115745.qwb2qqovpntdn6uz@zkempczy-mobl2>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241106185846.1218835-1-ngai-mint.kwan@linux.intel.com>
 <20241107170833.u7e2s6fjpk7qvdks@kamilkon-desk.igk.intel.com>
 <87iksyeplx.fsf@intel.com>
 <20241112110901.omdnfywpzfvsw2mh@zkempczy-mobl2>
 <87cyj0d7co.fsf@intel.com>
 <20241112115745.qwb2qqovpntdn6uz@zkempczy-mobl2>
Date: Tue, 12 Nov 2024 15:02:10 +0200
Message-ID: <871pzgd2r1.fsf@intel.com>
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
> On Tue, Nov 12, 2024 at 01:22:47PM +0200, Jani Nikula wrote:
>> On Tue, 12 Nov 2024, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@int=
el.com> wrote:
>> > On Thu, Nov 07, 2024 at 10:49:30PM +0200, Jani Nikula wrote:
>> >> On Thu, 07 Nov 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com=
> wrote:
>> >> > On 2024-11-06 at 10:58:46 -0800, Ngai-Mint Kwan wrote:
>> >> >> diff --git a/lib/i915_pciids.h b/lib/pciids.h
>> >> >> similarity index 93%
>> >> >> rename from lib/i915_pciids.h
>> >> >> rename to lib/pciids.h
>> >> >> index 3e39d644e..7632507af 100644
>> >> >> --- a/lib/i915_pciids.h
>> >> >> +++ b/lib/pciids.h
>> >> >> @@ -22,30 +22,23 @@
>> >> >>   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
>> >> >>   * DEALINGS IN THE SOFTWARE.
>> >> >>   */
>> >> >> -#ifndef _I915_PCIIDS_H
>> >> >> -#define _I915_PCIIDS_H
>> >> >> -
>> >> >> -/*
>> >> >> - * A pci_device_id struct {
>> >> >> - *	__u32 vendor, device;
>> >> >> - *      __u32 subvendor, subdevice;
>> >> >> - *	__u32 class, class_mask;
>> >> >> - *	kernel_ulong_t driver_data;
>> >> >> - * };
>> >> >> - * Don't use C99 here because "class" is reserved and we want to
>> >> >> - * give userspace flexibility.
>> >> >> - */
>> >> >> -#define INTEL_VGA_DEVICE(id, info) { \
>> >> >> -	0x8086,	id, \
>> >> >> -	~0, ~0, \
>> >> >> -	0x030000, 0xff0000, \
>> >> >> -	(unsigned long) info }
>> >> >> -
>> >> >> -#define INTEL_QUANTA_VGA_DEVICE(info) { \
>> >> >> -	0x8086,	0x16a, \
>> >> >> -	0x152d,	0x8990, \
>> >> >> -	0x030000, 0xff0000, \
>> >> >> -	(unsigned long) info }
>> >> >> +#ifndef __PCIIDS_H__
>> >> >> +#define __PCIIDS_H__
>> >> >> +
>> >> >> +#ifdef __KERNEL__
>> >> >
>> >> > I am not sure if we want a kernel defs, this is for userspace
>> >> > so imho this ifdef KERNEL/endif should be deleted. Or write
>> >> > a rationale why you included it here, or make it a comment?
>> >> > +cc Zbigniew
>> >>=20
>> >> The file comes verbatim from kernel.
>> >
>> > I have mixed feelings about copying kernel headers here directly
>> > if they are not uapi. However __KERNEL__ conditional was added to
>> > this header intentionally so copying this file outside the kernel
>> > and further reuse in userspace code is harmless. But I would add
>> > some explanation to README.md about pciids.h copying procedure
>> > for the future.
>>=20
>> We've been doing this for PCI IDs for at least 10 years, and for
>> intel_vbt_defs.h for at least 7 years.
>>=20
>> Please feel free to send documentation patches.
>
> I see no __KERNEL__ in current xe_pciids.h and i915_pciids.h so
> there's some change from my perspective. intel_vbt_defs.h also
> doesn't contain any kernel conditional inside. I think author
> of this change should provide additional documentation about this
> (not me) - commit message for me is not enough. Till this change
> I haven't noticed any __KERNEL__ usage in igt codebase and I think
> if it appears it should be documented what's for dead code is
> imported to the project.

See igt commit e966143f5c5f ("lib/intel_device_info: use dedicated macro
for struct pci_id_match init"). INTEL_VGA_DEVICE has been unused in igt
since then.

I wrapped the macro in #ifdef __KERNEL__ in kernel commit fc9cb46bdca8
("drm/i915/pciids: use designated initializers in INTEL_VGA_DEVICE()")
to avoid it being used in igt again.

I'm not going to document this further in igt.


BR,
Jani.


--=20
Jani Nikula, Intel
