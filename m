Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D54F013F0
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 09:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7E010E37C;
	Mon, 16 Mar 2026 09:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMja8SZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056C710E37C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 09:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773652239; x=1805188239;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LRVQZN29M7OrteeKzT3T41Hk2MmG1bS3S6xLma+V51Y=;
 b=KMja8SZli2GrjplY3R02hlcXqYseU4cgiV5ysmgErZn5382giXHqU5HF
 YFuqaFi1N5nUpEYEMltlYt5IfjDloSJfOpeiMUyKptyCPNNof4XHOnd/L
 ReeJgLZ5Vsx/yjWQ1hNeyL6IVjP+oBh/U+lRPknbb0yQ4owdRBm4Lrpds
 ymFO1vQCoCxlGLHhtsLOaObf+UcGgtSywlJ5pu3cvgt3XXOAUIvkpe9zL
 PsbbYsamYMTMXrF7p1N5EdOn+Rs+l8869RA1edZ2LjK4FdN+e6YkA2oUd
 OBlKIYs3FTuIwSACvD2zrLoT2b/y/rI/n1e6o3HL0V/tnxIta3mbfd93Y A==;
X-CSE-ConnectionGUID: 5FY9s3yiSPmyOwA5IhA5Hw==
X-CSE-MsgGUID: lhPxCyoCTWeyT6PpQtf0ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="97272853"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="97272853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 02:10:38 -0700
X-CSE-ConnectionGUID: /4iZrRZTSgOKzrrVY0pmUg==
X-CSE-MsgGUID: NfHaXuZbTuu3MDoXRoLmLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="221081300"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.135])
 ([172.28.180.135])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 02:10:37 -0700
Message-ID: <c2d6c5cc-241a-4066-8efd-bb77f49b3ef0@linux.intel.com>
Date: Mon, 16 Mar 2026 10:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on
 SR-IOV VF
To: "Gote, Nitin R" <nitin.r.gote@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>
References: <20260224112041.297334-2-nitin.r.gote@intel.com>
 <20260224132012.prlzw36las3j4uzk@kamilkon-DESK.igk.intel.com>
 <09f01ecd-46dd-4712-90e7-a51aea8cd219@linux.intel.com>
 <SA3PR11MB81189734B2EAC66EF2632888D046A@SA3PR11MB8118.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <SA3PR11MB81189734B2EAC66EF2632888D046A@SA3PR11MB8118.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 3/10/2026 5:37 AM, Gote, Nitin R wrote:
> Hi Marcin,
>
>> -----Original Message-----
>> From: Bernatowicz, Marcin <marcin.bernatowicz@linux.intel.com>
>> Sent: Thursday, March 5, 2026 9:51 PM
>> To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Gote, Nitin R
>> <nitin.r.gote@intel.com>; igt-dev@lists.freedesktop.org; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>
>> Subject: Re: [PATCH] tests/intel/xe_configfs: Skip ctx-restore subtests on SR-IOV
>> VF
>>
>>
>> On 2/24/2026 2:20 PM, Kamil Konieczny wrote:
>>> Hi Nitin,
>>> On 2026-02-24 at 16:50:42 +0530, Nitin Gote wrote:
>>>> The ctx-restore subtests use intel_register_read() via direct MMIO
>>>> (PCI BAR) access to verify that the batch buffer wrote the expected
>>>> register values. On SR-IOV Virtual Functions (VF), only a very
>>>> limited subset of registers is accessible. Registers like 0x4F100 are
>>>> not exposed to VFs, so the read always returns 0, causing a false
>>>> test failure.
>>>>
>>>> Skip all ctx-restore subtests (post-bb, mid-bb, and their invalid
>>>> variants) when the device is running in SR-IOV VF mode.
>> Does it mean the feature is not applicable to VFs or just the verification is a bit
>> harder ?
> The ctx-restore feature itself works on VFs -- the GuC handles context
> save/restore for VFs just like the PF. The issue is strictly with the
> test's verification method.
>
> The test uses intel_register_read() via direct PCI BAR MMIO to read
> back register 0x4F100, which is blocked by the HW MMIO filter on VFs.
> I looked into alternatives but couldn't find a suitable VF-accessible
> register -- the VF MMIO filter only exposes IRQ registers
> (0x190010-0x1900f4) and VF_SW_FLAG registers (0x190240), which are
> used by GuC communication and not suitable as test scratch.
>
> Given there's no VF-safe register available, I think the skip with an
> accurate message seems like the correct approach:
>
> igt_require_f(!is_vf_device,
> "MMIO register readback not possible on VF\n");

I do not see a better way, so let skip

NIT: igt_skip_on(is_vf_device, ...)  reads a bit easier

Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

>
> Please let me know if you'd prefer a different approach.
> Thank you.
>
> - Nitin
>
>>> +cc Lukasz and Marcin
>>>
>>>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>>>> ---
>>>>    tests/intel/xe_configfs.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
