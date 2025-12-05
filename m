Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B17D2E00E
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 07:00:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9DD10EA21;
	Fri,  5 Dec 2025 07:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ub4xCuCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3F10EA2D
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 07:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764918034; x=1796454034;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KJ/Wlebjotn31T8yIFJwDKuGrPh2X1Opa6mOFjBEKrk=;
 b=Ub4xCuCB0L4KWFfP9oaqdXoaj4xPu+TobFsPyZUBUefFgYfSzCaG2Qft
 oByKqgxbUBpffcig6cfVpfekFTk/H9ITeigpR4TBwIXT9BU+Tz8N2Cbcx
 XCZPgmz3YqPG/0br1EbtGyL2uNGe05s0wyHdAQcmbMMZAkwzpUWLFm7WR
 oxKafMD+rtHN/saVJ36utLI5S1xD3CfbIEiNaIkK77r8jymKYg3+9fXST
 HNG+mUj7uf7VZ1TFAo24tzJ455UoA3O2enQe4E/4gDMocJltiWEdNlC0c
 kz0ZtK1Q6hdx4icg1ZZiwsAcmTt98Vypy8SrKvwp9wUHsocZpSTUoUSce A==;
X-CSE-ConnectionGUID: UWGIu4CPQ3qnhfwLDT/XjA==
X-CSE-MsgGUID: L74RgcyxRWmLIlJjrx8Fdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66910264"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66910264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:00:34 -0800
X-CSE-ConnectionGUID: 6W/XG0KxTfmQ/Codz/58PA==
X-CSE-MsgGUID: Md+E6Su5SRO4v5VfvCNbMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="218577143"
Received: from aashishj-mobl2.gar.corp.intel.com (HELO [10.247.202.66])
 ([10.247.202.66])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 23:00:33 -0800
Message-ID: <9987295c-3e48-4c18-bf62-0c3db5556386@intel.com>
Date: Fri, 5 Dec 2025 12:30:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7 residency
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20251204092548.60528-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251204092548.60528-1-mohammed.thasleem@intel.com>
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


On 04-12-2025 14:55, Mohammed Thasleem wrote:
> This test validates the dgfx Package G7 residency.
>
> v2: Move igt display reset outside loop. (Jeevan)
>      Add G7 residency check before test execution. (Jeevan)
>      Add 4k@144hz supported mode for G7 validation.
> v3: Rename set_output function name. (Kunal)
>      Move all calling functions from igt subset to test_package_g7. (Kunal)
> v4: Move mode detection logic in to is_preferred_mode_present. (Kunal)
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
