Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C797ECDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 14:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C7F10E723;
	Mon, 22 Jun 2026 14:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abWKi26H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACB810E737
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782139862; x=1813675862;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mN9YRauTID9bif6TegK9mnIbSJjS0Acmzv+w0vdLHZw=;
 b=abWKi26HIEOP7mqNI+U4C09mPVFFb91RI5idfK8VNRUMASKCc6ZYrFSm
 r23CKVheK7wyzAnHaVe4RN/kbLveav4aC4qO7OM1Z9OKLHcQ9lCU+IWgy
 fQaBfgSZDXym1HsSzRe9UFfa+0iE9cGrDva7gguGqpaDn2MgaDgoVD7rt
 Kequ3sPnslK2nAGeaSfswLrWBeqkPwjGKuArr6Fzp5FxDhPYQZ6fqhYqV
 AUFJtJ0m3G1oqLFlfH/M26yWARATohf6HMGOjbKwqtewL2cqckO/mzHLT
 nzxPWwAqhuvTSf7Ic9WgSTlqse/fME2c1TtqQLhTeQYyut98qdPovVr9L g==;
X-CSE-ConnectionGUID: 5UofHWYcT4aDxTOtchDLMA==
X-CSE-MsgGUID: l4YXtv1uTH2rt+h8qTzpOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83063078"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="83063078"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 07:51:02 -0700
X-CSE-ConnectionGUID: u5vNOtUDSE6UA1mQUHvDCA==
X-CSE-MsgGUID: Luwt3AbiR8e5sJo6pCW0hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="249102948"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.245.133])
 ([10.245.245.133])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 07:51:01 -0700
Message-ID: <23c5d34e-0a47-4f84-a0e6-d26432711616@intel.com>
Date: Mon, 22 Jun 2026 15:50:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tests/intel/xe_ccs : Add helpers and Negative test
 for VM_Bind Decomp
To: "Balasubramanyam, Smitha" <smitha.balasubramanyam@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
References: <20260527054210.2147520-1-smitha.balasubramanyam@intel.com>
 <20260615123109.2286386-1-smitha.balasubramanyam@intel.com>
 <20260615123109.2286386-2-smitha.balasubramanyam@intel.com>
 <33f7ab9b-7d81-403f-b506-5f56edaa1aef@intel.com>
 <a476ed75-f3ce-4859-846b-f5d5f0968be8@intel.com>
 <PH7PR11MB58630EAE29905C52CC33E31085EF2@PH7PR11MB5863.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <PH7PR11MB58630EAE29905C52CC33E31085EF2@PH7PR11MB5863.namprd11.prod.outlook.com>
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

On 22/06/2026 06:24, Balasubramanyam, Smitha wrote:
> 
> On 15/06/2026 18:02, Matthew Auld wrote:
>> On 15/06/2026 13:31, Smitha Balasubramanyam wrote:
>>> Introduce data structures and helper utilities used by the VM
>>> negative tests to validate the VM_Bind Decomp feature
>>>
>>> These helpers provide resource management and setup/cleanup logic
>>> that simplifies the implementation of the test cases introduced in
>>> subsequent patches.
>>>
>>> One functional subtest is introduced in this patch.
>>> This test verifies handling of invalid UAPI Params in Non-fault Mode.
>>
>> Why is there so much code being added in this series? The negative
>> tests should just be checking that an ioctl gets rejected, when doing
>> various bogus things? Series is adding like +1000 lines of code? What am I missing?
> 
>> Also, if we do need all of this, can we not extend the existing code in some way to handle the negative tests?
> 
> Thanks for the feedback.
> 
> The major bloat in patch 1 is coming from the two positive cases I included in the bad-params test (decompress-default-pat and decompress-gpu-wb-pat).
> For those cases, I was not just checking ioctl outcome, but also doing full mmap + pattern verification + memcmp, which is really positive-test coverage.
> I plan to move those out into a separate follow-up patch.
> 
> For the fault-mode bad-params case, the invalid parameter combinations themselves are the same as the non-fault-mode case.
> I split them in v1 mainly because that follows the current pattern already present in xe_ccs.c, where fault and non-fault positive paths are separate.
> To reduce duplication, I plan to fold the fault-mode and non-fault-mode bad-params coverage into a single implementation driven by a config flag,
> with separate subtest entry points. Please let me know if this is in the right direction.
> 
> I initially wanted to keep the negative test self-contained, but I also see that the setup is almost common between the positive and negative paths.
> So, to contain the code bloat, I plan to refactor the existing positive non-fault case first and then reuse the common setup pieces from there.
> Please let me know if this is in the right direction.
> 

Yeah, code re-use would be good, if possible. I think to make this 
easier to review it might make sense to just keep the scope to negative 
tests, and maybe any extra coverage as another series, if possible. Or 
at the very least split out more stuff into separate patches.

> 
> 

