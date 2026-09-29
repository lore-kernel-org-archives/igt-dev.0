Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B710CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:16:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29B610E8EE;
	Tue, 29 Sep 2026 09:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8Tt4Uw4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87D110EDBB
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790673371; x=1822209371;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kOJvisy64CZ6SigMqX0kM+7BIF+ZuyG+cCyzmgqSd/0=;
 b=F8Tt4Uw4pUvrFaXprSeHoFCV1YK0NSfDSUZMvC91gW+qW2/o5cZXqvG1
 qDPIR7Q2Uz++4ellsSJQG208P9OcBL70rP5l9eucRt2rKn/A2KyNSL3+F
 iHEhZb2fEFq6SmrMFso9XCWZdGcFGcuFZm8B+2BGoxfoLMA+7ewKLAEaz
 pMyU9GcC/qDhG1dU2KaDe9yQN0J80PaJnGqwqYeMeRS7DGBi4gfuv3JdV
 +XWAtLoRXDOUngGnz9Rkq52rxp4Y2YjTfZjn5HL32pxGfibdtd0+98wa1
 v5Ou4mFgOp05cPfjjycSbr0VzOvcVI9fiENiWPNIa25X4eSn0OPy1oPE1 w==;
X-CSE-ConnectionGUID: sKF/A5dWRYCqZFZdY9TKXw==
X-CSE-MsgGUID: iomJoe+0QQCktIfwkmDMvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="116916866"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="116916866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:16:10 -0700
X-CSE-ConnectionGUID: S0owBB6YQYuIGsdWcOpJ0A==
X-CSE-MsgGUID: fDz11Y62TmeHg8CcJBbdog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="273448987"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.233])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:16:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 krzysztof.niemiec@intel.com
Subject: Re: [PATCH i-g-t 7/8] tools/gputop: integrate i915 and xe PMU
 engine monitoring
In-Reply-To: <be7mrp73b7wd3c4zj6tyawxsbbnjqmjbwqrvqjhz7jthqr66m6@mp2dap6vrqsd>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <0b56b441614d8e5e0f24f1c79cdd49efa9a2931a.1790331690.git.sebastian.brzezinka@intel.com>
 <be7mrp73b7wd3c4zj6tyawxsbbnjqmjbwqrvqjhz7jthqr66m6@mp2dap6vrqsd>
Date: Tue, 29 Sep 2026 12:16:06 +0300
Message-ID: <14fa2e4326d5be089719038c32eebb128f4a1f64@intel.com>
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

On Tue, 29 Sep 2026, Krzysztof Karas <krzysztof.karas@intel.com> wrote:
> Hi Sebastian,
>
> [...]
>
>> +static void pmu_devices_init(struct gputop_driver *drv,
>> +			     const struct device_operations *ops,
>> +			     const char *filter, size_t instance_size)
>> +{
>> +	struct igt_device_card *cards;
>> +	int n;
>> +
>> +	n = igt_device_card_match_all(filter, &cards);
>> +	if (n <= 0)
>> +		return;
>> +
>> +	drv->instances = calloc(n, instance_size);
>> +	if (!drv->instances) {
>> +		free(cards);
>> +		return;
>> +	}
>> +
>> +	drv->len = n;
>> +
>> +	for (int i = 0; i < n; i++) {
> I'll be pedantic here: iterators in this patch could be
> unsigned :)

Well, to be really pedantic, never use unsigned unless you really have
to.

Unsigned doesn't protect you from anything, and usually just lead to
trickier situations than using signed would. Use int when you can, and
it'll save you a lot of trouble.


BR,
Jani.



-- 
Jani Nikula, Intel
