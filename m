Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9817CD98F2
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 15:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683FA10E49D;
	Mon, 22 Jun 2026 15:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8j5MIvh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82E310E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782141685; x=1813677685;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YJm1vbOMxQ/Dxjjgaevub/lCmB/lUd2kYyVnWTdhdCE=;
 b=f8j5MIvhLnCp/QeJyO8px2s0Qt85/dFHRxCy1L33cL+SutUSNzy7DoLJ
 vK+VkpaOixcqCtr0sn12IOm95s3kaAZh/nvaeYQ2FT+BaCbkh1Vf/OCTE
 p91F6VY0d90Mid5ZI+YPf/5EZz4qDR+gZzM4IKdMYU8COpH8zQ9Cinoz5
 pGD1POcVeoG5zPjc/gDKv0JMhui+0vmgePHv2w0oFb4xSPkXlKGkvrBqA
 53ot2PlnqCdB4jBOUqy369dDP0fZYyO5bW1FGHl4u0dbi+eP3KXx04bwX
 oa8CpTHTKrnIeOeDnck0ODPqGikCtlGkFc0wLXBaOL3lWBardMDZxAL6l w==;
X-CSE-ConnectionGUID: PcutjPXgSKmVU7xx14m/Sg==
X-CSE-MsgGUID: ZCOnYFsnTTWGBUCHe6uZJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100425157"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="100425157"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:21:24 -0700
X-CSE-ConnectionGUID: FH0RdQOZS8a2e+CdgpjWww==
X-CSE-MsgGUID: 4kWwQLuCR5Gf+f0DV3r6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="249109202"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:21:24 -0700
Message-ID: <84ea27a5-9d38-4a15-9b6b-19f104b6da99@intel.com>
Date: Mon, 22 Jun 2026 16:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] tests/intel/xe_ccs : Add CCS corruption neg test
 for VM_BIND decomp
To: "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
References: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
 <20260615123109.2286386-1-smitha.balasubramanyam@intel.com>
 <20260615123109.2286386-4-smitha.balasubramanyam@intel.com>
 <baae1a9a-f704-4590-8ef8-826244dd0486@intel.com>
 <PH7PR11MB5863CC413D11255F8D88E8B285EF2@PH7PR11MB5863.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <PH7PR11MB5863CC413D11255F8D88E8B285EF2@PH7PR11MB5863.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 22/06/2026 07:08, Balasubramanyam, Smitha wrote:
> 
> On 15/06/2026 13:31, Smitha Balasubramanyam wrote:
>> Add a negative test covering VM_BIND decompression verification with
>> corrupted CCS metadata.
>   > > The test also exercises suspend and resume handling during the
>> corruption scenario.
> 
>> What is meant by corrupted CCS here? Is this userspace corrupting something? If so, why does the kernel care? Can you give some more details here please?
> 
> Sure, this testcase is not primarily a negative uAPI rejection check.
> The testcase exercises behavior when userspace intentionally corrupts CCS metadata, then issues VM_BIND with DECOMPRESS and compares outcomes:
> - corrupted-CCS path is expected to differ from source data
> - clean-CCS path is expected to match source data

Does it really matter if userspace tramples the CCS? I assume we already 
create a compressed surface and check that the decompress flag behaves 
as we expect. If we trample the CCS data, then yes that will be visible 
when we decompress, same as when it contains "normal" data. End result 
is the same with main surface being the uncompressed view taking into 
account whatever was in the CCS data (whether corrupted or not 
corrupted) + main surface, with CCS being updated as uncompressed.

If usespace corrupts the CCS then yes that will be visible when you 
decompress it, but that is the same if they corrupt the main surface 
with random garbage? But is it really worth validating that? I guess it 
not clear what we are actually validating here from kernel/hw pov?

If there is some angle here from hw pov you have in mind, with some kind 
of specially crafted CCS corruption trying to trigger something bad, 
then that sounds more like general CCS coverage, and not part of VM_BIND 
decompress flag? Since the decompress thing can be done just as easily 
from userpace directly. Idea with having the kernel do it, is just that 
in some cases it's in the best position to do it, but there is nothing 
special that the kernel does for the decompress part. Plus that flag is 
not universally supported.

> 
> I agree the current test name may not reflect this intent clearly.
> I can rename it to something more explicit, like below if you suggest :
> - vm-bind-decompress-ccs-corruption-behavior-check or
> - vm-bind-decompress-ccs-corruption-comparison
> 

