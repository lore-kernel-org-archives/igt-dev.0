Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA229CA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 10:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7763B10EAB3;
	Fri, 22 Aug 2025 10:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNQOHN6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439BA10EAB5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 10:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755858076; x=1787394076;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B6XE4ofhy+XbgtVK/VpHmFfFOiSaSUulfuM0KUjz23A=;
 b=DNQOHN6Dh4X0992CcaxotcMPVbTa9Q9qXCNhNLBJQy37/lHdeB/Yl4gi
 M0xc/+sIiDwseQDVHanMmtBqNjdcWX3PJAAzkMI8wcDDQwOeH8DtJ3g4r
 rIVQ7ItEAy9x+5MLvJyD5Qb/gR+S9SAduQKyMvFKByTXQmPXILaqVYIc4
 mNDslSgblKOeBuxB97rnxUXX4RJSgDLxKMaJErJYFHS8rTo8LOcFxjsXD
 H7lFiVTWAb52VAm3iCPhZrrU1nTuDDPrcxRtanDEZ+CEDn0crun6ZRFyF
 86fyCp5meDyxtK29TrchptejnYEbvobYXKTv2RFzkUGVSN3iTaF0nRrFE g==;
X-CSE-ConnectionGUID: 9eAd/TPOSzCw9QyKlisK3w==
X-CSE-MsgGUID: InCaojB5RxCouGXojtWkBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68763662"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="68763662"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:21:16 -0700
X-CSE-ConnectionGUID: qwQ/RLWySEGRHVQ2RAm6Og==
X-CSE-MsgGUID: Vd2dYCZrTwGtLqtnHUi/kw==
X-ExtLoop1: 1
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.0.246])
 ([10.246.0.246])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 03:21:14 -0700
Message-ID: <1f44e5d1-860f-434b-a212-1e3e6d1f95f8@linux.intel.com>
Date: Fri, 22 Aug 2025 12:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Handle missing
 provisioning data per-GT
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250822093908.414306-1-marcin.bernatowicz@linux.intel.com>
 <82bd517f-f746-4c9a-b6f9-e828d9e16a58@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <82bd517f-f746-4c9a-b6f9-e828d9e16a58@intel.com>
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



On 8/22/2025 11:47 AM, K V P, Satyanarayana wrote:
> 
> 
> On 22-08-2025 15:09, Marcin Bernatowicz wrote:
>> When reading provisioned LMEM ranges from debugfs, some GTs may not
>> expose provisioning data at all. Previously, this caused the test to
>> skip entirely with a "Failed read" reason.
>>
>> Relax the check to treat -ENOENT as a valid case and simply continue
>> to the next GT. This ensures the test is not skipped unnecessarily
>> when provisioning data is absent on some GTs.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> ---
>>   tests/intel/xe_sriov_flr.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>> index fc08703c0..9eebe5f71 100644
>> --- a/tests/intel/xe_sriov_flr.c
>> +++ b/tests/intel/xe_sriov_flr.c
>> @@ -816,7 +816,9 @@ static int populate_vf_lmem_sizes(struct 
>> subcheck_data *data)
>>           ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>>                                     XE_SRIOV_SHARED_RES_LMEM,
>>                                     gt, &ranges, &nr_ranges);
> Is it applicable only for LMEM? What about other provisioning 
> parameters?> 

GGTT is already handled.

-        if (ret) {
>> +        if (ret == -ENOENT) {
>> +            continue;
> Can we add a debug level print here with GT id?> 

Something like: "No lmem_provisioned attribute on gt%u" ?



+        } else if (ret) {
>>               set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
>>                       
>> xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
>>                       gt, ret);
> 

