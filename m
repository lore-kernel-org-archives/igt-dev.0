Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CA3CF649A
	for <igt-dev@archiver.kernel.org>; Sat, 28 Sep 2024 07:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF3910E1EA;
	Sat, 28 Sep 2024 07:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahrYb1Wq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BFF10E1EA
 for <igt-dev@lists.freedesktop.org>; Sat, 28 Sep 2024 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727509589; x=1759045589;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dYq1XjRcr3kU8Q9Nd+nW6OLhxPWu3OM9PJ59P8VaFKs=;
 b=ahrYb1Wqoh1lqdJQ5pyKC/1P4RvDlczP8DaXI6JPFav7lryN2qsdDQz6
 JNXTZlPkNBLDrB1usnUTjSjPkSx3ZxenhlYPhVS3GvREyRYBuhhqt4GH1
 RO7MT+fwz4ToS2/cP4eDTRzaL6MBPefhkQronTlnCeVDw7ejG0QJl33uT
 M3UkhQBTPcYTeqqA6Etw9y9okZNRGO8gjrOj+MgplO03jiRJ1gzrSXFMR
 ms6cf5wkJauh0zY6GZABGD/g+pQYWitloyfMkf6Y06/ZH8VO1n210KJPp
 V165Irji1MTSKDss046Tk2L16EV5cpMq3qFFD3Z0nA6U/UrIQfZhFQUVY g==;
X-CSE-ConnectionGUID: psWeFZ/4TM+XH8X5/GtETQ==
X-CSE-MsgGUID: 6Wb4Pc/ORI+7L2JPx37LCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26605950"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="26605950"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 00:46:28 -0700
X-CSE-ConnectionGUID: jsK8VxueSbqpCQsz9CDfiw==
X-CSE-MsgGUID: aw3hD8SwRniuc5FCbTEGHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; d="scan'208";a="73183959"
Received: from iyeshuru-mobl.ger.corp.intel.com (HELO [10.213.199.216])
 ([10.213.199.216])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2024 00:46:27 -0700
Message-ID: <e90bf39e-c7fe-4007-90ce-0a1a3585fa08@linux.intel.com>
Date: Sat, 28 Sep 2024 09:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t PATCH V2] tests/intel/xe_pm: one suspend/resume cycle for
 all xe engines
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <5cdb17b6-7045-40c7-89b1-b55b6eff6623@linux.intel.com>
 <573a9807-9687-4918-a234-e22dde568bbf@linux.intel.com>
 <Zvbr84hnp1dBnfGg@intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <Zvbr84hnp1dBnfGg@intel.com>
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

Hi Rodrigo,

Thank you very much for the review! I addressed most of your comments in V3, and I will skip the comments I fixed in V3.


On 27.09.2024 19:31, Rodrigo Vivi wrote:
> On Fri, Sep 27, 2024 at 01:38:14PM +0200, Peter Senna Tschudin wrote:
>> Changes the behavior from running one suspend/resume cycle for each
>> xe engine to running a single suspend and resume cycle for all engines
>> considerably reducing the xe_pm run time.
> 
> \o/
> 
> Thanks a lot for that.
> 
> I'm wondering if the thread is not an overkill, but I don't have
> cleaner suggestions...

[...]

>> +}
>> +
>> +/* Do one suspend and resume cycle for all xe engines.
>> + *  - For each xe engine: Create a thread for test_exec
>> + *  - Pause the thread where it expects to suspend and resume
>> + *  - Wait for all threads to reach the pause
>> + *  - Run one suspend and resume cycle
>> + *  - Wake up all threads
>> + *  - Wait the threads to complete
Updated to state which code paths run concurrently:

/* Do one suspend and resume cycle for all xe engines.
 *  - Create a child_exec() thread for each xe engine. Run only one thread
 *    at a time. The parent will wait for the child to signal it is ready
 *    to sleep before creating a new thread.
 *  - Put child_exec() to sleep where it expects to suspend and resume
 *  - Wait for all child_exec() threads to sleep
 *  - Run one suspend and resume cycle
 *  - Wake up all child_exec() threads at once. They will run concurrently.
 *  - Wait for all child_exec() threads to complete
 */

> 
> looks a correct flow for the system suspend... something strange for the runtime pm,
> although d3hot and d3cold works for me here in my DG2...
> 
> I mean, during the thread child execution we are checking if the device is in d3...
> But with multiple threads executing that, we cannot guarantee that anymore that we are
> in d3.... That flow is broken....

Yep, one thread per engine execute that, but only one at a time. There is no concurrency between threads until all threads go to sleep. Does it make a difference?

> 
> I believe it just works because in_d3 also has some sleeps and waits so all
> the threads are executing and waiting... but we shouldn't rely on that.
> 
> Perhaps we should split the regular suspend and runtime_suspend tests entirely?
> trying to encapsulate and reuse the exec functions...

I will be happy to make the change with a little bit of guidance.


[...]


Thank you again Rodrigo!
