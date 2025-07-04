Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F34EC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 12:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80F810EA20;
	Fri,  4 Jul 2025 12:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaoReIrd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300A710EA20
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751633329; x=1783169329;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/EqNwleUYP9alfC76KMtBipZF+M1zJFCSEl9ecwoXfU=;
 b=FaoReIrdhw2dFcgBGtd3v0wTim0b4yNqiIz63h7G5ZhHUd/ExyH0qqjv
 piqMfY6hfNyYfs5WMspynEUC56GuPUMuo01YadDlg1TR4vV9tI31PXDn+
 4p2ncsN6Lbp7jwO975kq5oiJgnpL2l3uayxBm6+XtfsqwDVRAFMKNLC6x
 GCNB+5d0tM7DuzNXSUaIuNVr8JUzDuU7HN3iruXnrxWdhp9E+NAQ4QmtQ
 2Ydu2NE0KNbtaf3OoiEnQYEg/+UF7UImEP9fW+M29voH5+cC5a+YG82ar
 hsuR30+DpM6cF2N+RRTDaXWN3EVVs/uRzt2Er6DjyfAPjMsdrNBJIQkxh w==;
X-CSE-ConnectionGUID: vEx87+MhSpecPPA8ZN/3yA==
X-CSE-MsgGUID: eB2F6I1PS+GaTCco95ifPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64659942"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64659942"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:48:49 -0700
X-CSE-ConnectionGUID: 1HuuzYyCTdaRwCk3OjQw3g==
X-CSE-MsgGUID: YxrShgzEQ2C68b1WFoz/ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154046721"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:48:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: RE: [PATCH] lib/pciids: Add one more PCI ID to BMG
In-Reply-To: <DM8PR11MB5624B0CF53C28F2879698E22C742A@DM8PR11MB5624.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250704113356.100859-1-ravi.kumar.vodapalli@intel.com>
 <24129ab046212a1b989c94fa79b4e3c660dc6118@intel.com>
 <DM8PR11MB5624B0CF53C28F2879698E22C742A@DM8PR11MB5624.namprd11.prod.outlook.com>
Date: Fri, 04 Jul 2025 15:48:44 +0300
Message-ID: <1ea662f14e06dc386a09cf23221a443cbad38d73@intel.com>
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

On Fri, 04 Jul 2025, "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com> wrote:
> Hi Jani,
>
> I have submitted kernel patch it is not yet merged, that's why we are seeing this issue, let wait for kernel patch merge then I will take generated commit id and put in igt patch and resubmit.

Yes, that is exactly what I said.

BR,
Jani.

>
> Thanks,
> Ravi Kumar V
>
> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com> 
> Sent: Friday, July 4, 2025 5:51 PM
> To: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>; Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
> Subject: Re: [PATCH] lib/pciids: Add one more PCI ID to BMG
>
> On Fri, 04 Jul 2025, Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com> wrote:
>> Align with kernel commit f7814ac1cc23 ("drm/xe/bmg: Add one additional 
>> PCI ID")
>
> $ git show f7814ac1cc23
> fatal: ambiguous argument 'f7814ac1cc23': unknown revision or path not in the working tree.
>
> So you've sent a patch but it hasn't been merged. Please wait with the IGT change until it has actually been merged to the kernel.
>
> BR,
> Jani.
>
>> It Adds one more pci id to BMG.
>>
>> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
>> ---
>>  lib/pciids.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/lib/pciids.h b/lib/pciids.h index 129c3172a..666265b5f 
>> 100644
>> --- a/lib/pciids.h
>> +++ b/lib/pciids.h
>> @@ -846,6 +846,7 @@
>>  /* BMG */
>>  #define INTEL_BMG_IDS(MACRO__, ...) \
>>  	MACRO__(0xE202, ## __VA_ARGS__), \
>> +	MACRO__(0xE209, ## __VA_ARGS__), \
>>  	MACRO__(0xE20B, ## __VA_ARGS__), \
>>  	MACRO__(0xE20C, ## __VA_ARGS__), \
>>  	MACRO__(0xE20D, ## __VA_ARGS__), \
>
> --
> Jani Nikula, Intel

-- 
Jani Nikula, Intel
