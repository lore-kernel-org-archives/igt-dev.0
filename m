Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC827CA0FE1
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 07:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BA210E1AB;
	Mon, 25 Aug 2025 07:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNi4mBwy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F1D10E1AB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756105892; x=1787641892;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ve/NOa9P3+3zeM0XYlZIpjxTtGbFDNkMdNTMp3mxfDE=;
 b=BNi4mBwyFFUyT3YX2DxYg2w0fyYu2GoSFtepVCRCaK/wYGNlNQm39C3K
 72WPgfwMp/aPBGUc4qYLcmC81z8GkeXNauKhNxDFkYpgJVB785PRPcG+6
 CiQvd+h5Pgs4xUbdhHdInO7wMJiU9ApN4BSa43Nx/kO+kg8j+W67FsEns
 065P+s1R70RHGzaoCperDHZ5HTWMnWA4PDgXeOw/A8DU0Ro5/YfEpPc7e
 Qc256P5W8u3JZ6YhgM8Da0d8N/QyrkaRpIK8TATX+8QbJRsADrwfc2wZ1
 Dv2IUpgWAPJ4xuH/0AdZWhO4ykzfVDNdsLTeBJ61/ATMAFZTUNJFJpKsI g==;
X-CSE-ConnectionGUID: DaiUYWewRb+fbXWFduwH/Q==
X-CSE-MsgGUID: Td2AYdRkTNu6ARtHnpRuqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="68579708"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="68579708"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 00:11:32 -0700
X-CSE-ConnectionGUID: 5iE9QHhYQTWzm5wAJLn3tg==
X-CSE-MsgGUID: LnK5Xbd4Qo2n2FEpcMb21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="192880305"
Received: from unknown (HELO [10.246.0.246]) ([10.246.0.246])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 00:11:29 -0700
Message-ID: <2bf166f2-34d9-4a1c-b0f6-43edf71cb3aa@linux.intel.com>
Date: Mon, 25 Aug 2025 09:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_sriov_flr: Handle missing
 provisioning data per-GT
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250822093908.414306-1-marcin.bernatowicz@linux.intel.com>
 <82bd517f-f746-4c9a-b6f9-e828d9e16a58@intel.com>
 <1f44e5d1-860f-434b-a212-1e3e6d1f95f8@linux.intel.com>
 <c08912d8-b0a7-4e3d-a616-60f88d0f4d97@intel.com>
 <b40b8073-a0b4-4cf0-9dd7-ac588ec41191@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <b40b8073-a0b4-4cf0-9dd7-ac588ec41191@intel.com>
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



On 8/22/2025 3:00 PM, Michal Wajdeczko wrote:
> 
> 
> On 8/22/2025 2:48 PM, K V P, Satyanarayana wrote:
>>
>>
>> On 22-08-2025 15:51, Bernatowicz, Marcin wrote:
>>>
>>>
>>> On 8/22/2025 11:47 AM, K V P, Satyanarayana wrote:
>>>>
>>>>
>>>> On 22-08-2025 15:09, Marcin Bernatowicz wrote:
>>>>> When reading provisioned LMEM ranges from debugfs, some GTs may not
>>>>> expose provisioning data at all. Previously, this caused the test to
>>>>> skip entirely with a "Failed read" reason.
>>>>>
>>>>> Relax the check to treat -ENOENT as a valid case and simply continue
>>>>> to the next GT. This ensures the test is not skipped unnecessarily
>>>>> when provisioning data is absent on some GTs.
>>>>>
>>>>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>>>>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>>>>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>>>>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>>>>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>>>> ---
>>>>>    tests/intel/xe_sriov_flr.c | 4 +++-
>>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>>>>> index fc08703c0..9eebe5f71 100644
>>>>> --- a/tests/intel/xe_sriov_flr.c
>>>>> +++ b/tests/intel/xe_sriov_flr.c
>>>>> @@ -816,7 +816,9 @@ static int populate_vf_lmem_sizes(struct subcheck_data *data)
>>>>>            ret = xe_sriov_pf_debugfs_read_provisioned_ranges(data->pf_fd,
>>>>>                                      XE_SRIOV_SHARED_RES_LMEM,
>>>>>                                      gt, &ranges, &nr_ranges);
>>>> Is it applicable only for LMEM? What about other provisioning parameters?>
>>>
>>> GGTT is already handled.
>>>
>>> -        if (ret) {
>>>>> +        if (ret == -ENOENT) {
>>>>> +            continue;
>>>> Can we add a debug level print here with GT id?>
>>>
>>> Something like: "No lmem_provisioned attribute on gt%u" ?
>>>
>> Yes. With adding this debug print,
> 
> IMO we shouldn't even try to read LMEM provisioning from media GTs,
> as today it is exposed on primary GT (gt0) only, and this is just due
> to some early xe debugfs limitations, as there was no tile concept there,
> but since it was added recently, in the (near) future we might want to expose
> LMEM directly under Tile only (tile0), but definitely never under media GT
> 
> and without that call, there will be no need to handle expected error nor
> print a little misleading debug message (as it's not about missing attribute)

Thanks Michal, makes sense. For now I can limit the iteration to only 
root/primary GTs, that should avoid hitting the -ENOENT path and keep
the debug logs cleaner.

I don’t see a tile-level query in the API today – only queries for GTs
which also report their tile_id. Anyway, we’ll follow up with a separate
patch to adjust the helpers for the new tileX/gtY/[pf|vfZ] layout.

> 
>> Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>
>>>
>>>
>>> +        } else if (ret) {
>>>>>                set_skip_reason(data, "Failed read %s on gt%u (%d)\n",
>>>>> xe_sriov_debugfs_provisioned_attr_name(XE_SRIOV_SHARED_RES_LMEM),
>>>>>                        gt, ret);
>>>>
>>>
>>
> 

