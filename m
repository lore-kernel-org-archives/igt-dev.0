Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9BAC02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 14:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C601610E3BF;
	Tue, 18 Feb 2025 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T7HCs9+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4284B10E3BF
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739887591; x=1771423591;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lbPju4KpaPXiX2GSyEiKhrFVySsTfFg4aJgvzRfN3oI=;
 b=T7HCs9+s5ThBhg7+Gd5E2y8Hb7gRi8nQDrqJIOyOaEbLBXl9LX69b2KG
 sWwC8ZIrygZQou0WPV3Fmz/jg3f7Cd4yKOErmNmyBjh2F3K6XO9Wnc6bR
 K/raFAJM2KXpSl68OnVP+DdDVjN7o41jNd8t4U4WDp3vgOAAcIlN/E3ov
 riiUKLjjP9EuoKU1vj3BIGIkoibvbztgDmuDFpm5oBzo0JOXZxKECEha1
 H6h2/PQxHBiL7GTJj+o8CyNKwK/krGm1V0gN1//YsJhUuRA1EIK4lKTrp
 N5+1n8vCOZL27TR3CV8inF8X96FKGpLu7Qe/F10uszozBbbcffgKMoUsE w==;
X-CSE-ConnectionGUID: Dn/aFUBEQqqKWIMTORA+jQ==
X-CSE-MsgGUID: AKsGhdKkRvOnynRnHbowNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="57986607"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="57986607"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 06:06:31 -0800
X-CSE-ConnectionGUID: cRFyjSGwRQip/lBpL04OfQ==
X-CSE-MsgGUID: Xi5lPYosQcCAzbwMMUj7/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114325437"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 18 Feb 2025 06:06:30 -0800
Received: from [10.245.113.167] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.113.167])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C848337B99;
 Tue, 18 Feb 2025 14:06:28 +0000 (GMT)
Message-ID: <d1ee88cd-bcbe-4840-9e0a-4d9c71b8fe1e@intel.com>
Date: Tue, 18 Feb 2025 15:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
To: Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: igt-dev@lists.freedesktop.org
References: <20250207072902.12582-1-satyanarayana.k.v.p@intel.com>
 <20250207072902.12582-5-satyanarayana.k.v.p@intel.com>
 <Z7SPn9Kstq7TKErm@fdugast-desk>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z7SPn9Kstq7TKErm@fdugast-desk>
Content-Type: text/plain; charset=UTF-8
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



On 18.02.2025 14:48, Francois Dugast wrote:
> On Fri, Feb 07, 2025 at 12:59:02PM +0530, Satyanarayana K V P wrote:

>> +
>> +	/* Get the iteration count from environment */
>> +	iter = get_fault_inject_iter();
>> +	iter_start = iter ? : 0;
>> +	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
>> +	for (int i = iter_start; i < iter_end; i++) {
>> +		fault_params->space = i;
>> +		setup_injection_fault(fault_params);
>> +		inject_fault_probe(fd, pci_slot, function_name);
>> +	}
> 
> This loop is specific to the guc test, it is not present for other tests.
> What is different about this test, why do we need to inject a fault at a
> given iteration?
> 
> In case IGT_FAULT_INJECT_ITERATION is not set, why running
> inject_fault_probe() 100 times instead of just once like with existing
> tests during probe?
> 

Because all xe_init() kind of functions are called just once during
driver probe, so it is sufficient to fail first/all calls to them.

OTOH driver communicates with the GuC multiple times, and the real
failure can happen at different call, hence the need to inject failure
in GuC communication functions, like guc_mmio_send() or guc_ct_send(),
but it can't be just first call or all calls, but we need to be able to
select specific iteration to fail.

Only with that approach we can provide sufficient coverage of the driver
probe related to GuC.

Michal
