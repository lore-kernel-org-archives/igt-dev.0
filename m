Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C49CCD1BF
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 18:47:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E742710E641;
	Tue, 28 Oct 2025 18:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EsqMXHaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039D910E641
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 18:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761677248; x=1793213248;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=8gbYQLsiowLFLIQ2RVoF/W8HRrKR6PAGq1GsuCvplr8=;
 b=EsqMXHaq6eUKTMN1QBdOGC99ePO4yeP5Z5zeqlW7Iie6selfXvlZn320
 Bfw7WWO78XHT79O0vePcreTOE4LdmCUbyBuTVzfrGt//42JDnXmjw4LUL
 +A2H6tiNEQRsF5pvmpl+cKD1oWhzfHLm8HfVsCJzYPJiI0dm6l6sJd+Sz
 qgJWBhgZGn+k43xh8wt+/CdAq7RNwfRN1ACikcomDo3DGYzIG5FylAOBV
 4t74gwkBks6yBNzBwEeVz5kkmm2Z1Q78XtisRGarbFAU6J5RRkz+nx8eV
 AEhRBwriOhi5X95B91RfXnpUnxO3etDIlfiT5p4JqX4iM1bilzm8hPhSo Q==;
X-CSE-ConnectionGUID: WzJ+lGgcQqqK40UsakIeRw==
X-CSE-MsgGUID: JH9zFVqESe6G5QkZJDTSiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74388568"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74388568"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:47:27 -0700
X-CSE-ConnectionGUID: SuHy6vQLROuPNJx7wuq/eA==
X-CSE-MsgGUID: Yo2DqMzgTR2NE9mTe+8LQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189746415"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:47:26 -0700
Date: Tue, 28 Oct 2025 19:47:24 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [RFC PATCH v1 1/1] tests/kms_big_fb: Open compatible driver for
 the platform
In-Reply-To: <20251027170058.lqzg4a2ls6fvb5cb@kamilkon-DESK.igk.intel.com>
Message-ID: <7d1e56d1-1a40-4be8-b20a-7c5db01eabaf@intel.com>
References: <20251027130025.1771523-1-michal.grzelak@intel.com>
 <20251027170058.lqzg4a2ls6fvb5cb@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-444543071-1761676159=:1783670"
Content-ID: <f207038d-670e-b199-22c4-eb6334bb66ae@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-444543071-1761676159=:1783670
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <5be64652-38f8-89d6-9373-7ea9bad6deac@intel.com>

Hi Kamil,

On Mon, 27 Oct 2025, Kamil Konieczny wrote:
> On 2025-10-27 at 14:00:25 +0100, Micha³ Grzelak wrote:
>> On platforms older than ADL-P, tests should be executed with i915 loaded
>> before xe. Currently, when tests are executed and xe is loaded first,
>> failures are reported in multiple subtests along errors in the dmesg.
>>
>> Check if i915 has been loaded before xe. If not, open and optionally
>> reload proper driver according to platform's display version.
>
> CI should use IGT_FORCE_DRIVER, like IGT_FORCE_DRIVER=i915
> and/or just unload all other GPU drivers before tests start running.
>
> Could you give links to gitlab issues you are trying to solve?
>

Forgot to include Fixes: or Link: tag. I'm trying to resolve this gitlab
issue [1].

>>
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> ---
>>  tests/intel/kms_big_fb.c | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
>> index 41fdcacab..5e8fa6112 100644
>> --- a/tests/intel/kms_big_fb.c
>> +++ b/tests/intel/kms_big_fb.c
>> @@ -30,6 +30,8 @@
>>   */
>>
>>  #include "igt.h"
>> +#include "igt_device.h"
>> +#include "igt_kmod.h"
>
> This should go after system includes.
>
>>  #include <errno.h>
>>  #include <stdbool.h>
>>  #include <stdio.h>
>> @@ -967,6 +969,30 @@ static bool test_requirements(data_t *input_data, int l)
>>  	return true;
>>  }
>>
>> +static int open_compatible_driver(int drm_fd) {
>> +	uint32_t devid;
>> +	bool is_adl, is_xe;
>> +
>> +	devid = is_intel_device(drm_fd);
>> +	is_adl = intel_display_ver(devid) <= 13;
>> +	is_xe = is_xe_device(drm_fd);
>> +
>> +	if (!is_adl || !is_xe) return drm_fd;
>> +
>> +	igt_xe_driver_unload();
>
> I do not know if it is a good idea.
>
> +cc Karthik and Swati
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>

So far that's the only way I managed to fix the failing tests; it's
because it seems like some tests on adlp fail if i915 wasn't loaded
before xe, hence the weird switch of drivers if it isn't the case.
I tried also to show some motivation behind the patch in response to J-P
[2].

Do I understand you correctly that instead of fixing it per each IGT
test, better solution would be to just set env variables by CI on adlp?

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4543
[2] https://lore.kernel.org/igt-dev/5a2342fd-403b-c0e6-d382-3c0a1245ed5c@intel.com

BR,
Micha³
--8323329-444543071-1761676159=:1783670--
