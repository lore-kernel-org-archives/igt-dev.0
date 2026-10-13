Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F59CC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 17:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F43E10E15A;
	Tue, 13 Oct 2026 17:57:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EE810E69A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791914176; x=1823450176;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=rHK1OyuT+HfJQ8EDGVDc4ASJ3cfb0DUQU/gFnBnSR38=;
 b=G0pFn7hnwXgE9fF+uUeied/e2pcLvJfLujyGznn6GCfpk4E1zEzxAnEN
 tAdXP9fSrcCdSJBgFTSd6m0RO6FcGSyAFg/y7Z9pFeTOOZx2dFmSBjiuA
 QBOqJfhRUx8PW+1qnJGLFP4QZlItUt8VuF+n9bJtx7ayz2wGSE9HuN9qn
 ekR1gQOdmwvLoI5tsc9MzmaqqJ2W5gO5RHZ/6kyWxPZgGehBWJJ6tBT1Q
 L+b9RKgwxf5LOhwfkNXWYnEwOGm476SVcaZs0yQpMbkc2trPwoSx92VWu
 iI2eZXGtfhvCjLVjkbjb+VPK9B+JXmfpjwvbXprWdSxAI6qILyl2O+GXU Q==;
X-CSE-ConnectionGUID: GEpgwiCaTT+ESGnG7G2+Fg==
X-CSE-MsgGUID: gfoqEywyQ3SrAbF9qXmzOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="551313"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="551313"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 10:56:15 -0700
X-CSE-ConnectionGUID: O8ubQOR7ToGEfxiicip1xQ==
X-CSE-MsgGUID: EJGcekJeTIqqUlqyzQ8+/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1285166"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 10:56:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 10:56:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 10:56:14 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 10:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQFkuxAxStbRKm610eeITuUHXLL+uAQ2VumOBLzw/Yx8bUS85vfMkiOGqVUQlEZ3CxXeWeZu9krAXwjywtmCYPROSErV5piXrSj16jD0HvKreqGqIW3GovWd5ZEh9XDQVJPp3XnhiSvE2NfER8roYYUDubRutnNFtRM3VHQIMBsWEAXmAx2+YFikRtvFgLDfAxen1YzRhwCx36smcIGQYLw1f6puRR6ohXEo7frLD3kYyXL0Uq8dnhd18Q24ukS0dHu3Vn45ehQ+PJ4OdWccFIqYG/3V7sDQ3um6Wu5jj+Rwhf8AWT02VgBlpzOVF2QoijyyaaxoNAWUC1wL3c6/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ocfr4LdciqARXb8AOXvpoL5KLsbVhapp5l6XyOkxzPA=;
 b=goXQSo8bXICzbhiHGAqNfsu9w9TbdlOkb0OvTsmymQ1B2oLNnnwa3H8JUxvj33hwtMMsO/p86qy2ynnjNtlX+9xQSY7oZeGMPzuWk/yyJXiCtT6Dtdq9BNkgiuSkdEXeNtl4olc09BSsEAqlhCKiTeF2+TLt3hBKv1oMx6UtBaUfHrVZvyMD8TGjTTayrMHFp70UxSJQ/HUAOG920sjQbyWYzfSBrDVogIsigO2tDByRpTEinkONk8XymtCkJsPvwXblhiB9Ity1sCvtpnpzufW5cLo1Ytz4eKES6D20e1BhO1LeZTgYYVXFdoeUSv02sTvULRJmT2UVYt5xst/yWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 17:56:12 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::770b:7229:68c0:5ded%3]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 17:56:12 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Daniel Charles <daniel.charles@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t,1/2] lib/igt_core: Check if helper proc was alive before
 kill()
In-Reply-To: <583c175f-9c84-4069-93f9-ec1a76cafd67@intel.com>
References: <20261007-stop-pw-reserve-v1-1-abbd3b879612@intel.com>
 <583c175f-9c84-4069-93f9-ec1a76cafd67@intel.com>
Date: Tue, 13 Oct 2026 14:56:07 -0300
Message-ID: <87o6cxa3ig.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 1224f497-0705-4e7e-d5cc-08df29534468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: rcUBasZflw25X6JyyRLn3zk9rlofLmiN8O5mn6V/IpI6ipDYyGXMk5aalXqQfTsrSqC0NfjEAaCiEWQIee07jw9zeoAnjTTdSZOj82gwd9tkIVBEDUVwHXcCXu7bmaU+/dCOIerom2sFU5zWB0PLmLIcyi6ZG5RVVwCC8jz5PSUt5zP5iTJYxO09R0S2bBRuS6U7tU0SC6Kkv4FbsixbGsJXquyq8vCBndW0/msgFguhkOZj5H9K/yZcGjn06T6kW9nzHtLmTKrejvNkwL7OTI1MCRzDFm0B+vfHp1EqVfc2GqOoF4TWVddI4yBsdeWlfeI77nsBuLsQstNs/CWBF9gUW1ZqEwO/P0Ell+dS+jgDT/PchNTz2cUWNlhIvMskgKF2b4DNXH7D+cFo7Sa2XyZ04yMjEui4SOHsBwoRj5SwTkqNOyzVbOP7/W86A+pokrE8bYN6n+kJwy94pNUq5UQxI6eubdcN97rHDjeFjf0wYvBzp+5sildrLOItOXf004KVAnMHK9jMKAo46ukL01nWlXtUtnpSCCkd5IPozQry6bA/fTzpHLE6NUzkHcd4WQs0lB4qgguYMFQklyudEBTTnQLLIGixHaZb/ZBNoO5nJDPjeW5krasWeRBSlcqc1p520ClOHiyoXNMmhPvVbkG3qfFCvte2IojIFbfPDn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?usZpGG9g3hfEu1OV5nQLLNiJQRJ07SoGKJiKm30G+E220V8qM+a59CnV1VqF?=
 =?us-ascii?Q?OK0k3BC+Xv9Oh3GjJCAQu7hJPneXq+4JIyjLqafVpP8uzb7H7HyxDTWXcPyq?=
 =?us-ascii?Q?m1aCfchc0M/xFLxp6+ut5eHzRBOrTbyHlWR2yGGpB17pfHvxJo6fiIfEUCig?=
 =?us-ascii?Q?UhleaZ3ZPGx4fYVe+ntdbk/qXw9Kg4gCbteuQfLhEKXTHqb84QfalJbY2BqB?=
 =?us-ascii?Q?9cEqG9nsm1z/1FzKvZGObWiAFG5nIgYI0pQA4mqtBWIkp4kHbcurLVZvRWmn?=
 =?us-ascii?Q?5J8Yz+aY8rvfEIEq3gmAgpxxYAhsyYU1Hv84xEkbu3BbLVO/C3f9RXNy96Bl?=
 =?us-ascii?Q?zOZz5xv99mQyFyoEbS/FP4ZIXXdtrO5kNljdEb1FEghO6I4FPG0D8tL8xul2?=
 =?us-ascii?Q?0eewetubPz9reDGXJdLzdiWgzHBbYxZGKJhVB1bISIGN7fKeucaRuIb3GA4A?=
 =?us-ascii?Q?H3/oytYM1s5TJzNnDHb2jrHRVFxtlwztqlBEGAFx5skZnLHjoHx9nAGXVuiW?=
 =?us-ascii?Q?7rM7ylOgJPmmbYWATIAy+igNvjlsGpq5fo6An39OaxMxhLXne6F3ILViDk1U?=
 =?us-ascii?Q?0gt+S1AxL6TMG1gu8AT47whJIwubeWdpAhXKYE7adB3UPt2tvOYi6m00iClE?=
 =?us-ascii?Q?n/cr2AvvtW9LYKdJrGIZncZfqUfPjX/3EdW2ixhjUPM1XCu0mFBMm7xI6Gfo?=
 =?us-ascii?Q?pbdlBLSepS75oAFbLu78E6bsUVmvsgCXOJ8FgQqfhiBH5onbr905Nb+3YXnv?=
 =?us-ascii?Q?6QKjzLW8qTAT0NoKPbHWOMxNOLkSF3QbKO/ny+1DHFptCvW9QdH67qv/Fx60?=
 =?us-ascii?Q?LqyYhbtVBDbuDrWrOGwF/7r2WYoAbP3YiVf/iKpwP9MhvP81YW4YGhFQAzvo?=
 =?us-ascii?Q?mBi8H/YrsYlTxiYcMX2dOUJ4PMgOjXMWpM6LW0eL6TqSRMvdtuWWWHfmhIhG?=
 =?us-ascii?Q?JAhwf6QT0lfI4i/RN7WYwnzc3sQjIRNw5/0O+iiiCiRoE99TuouU+9o5nZcf?=
 =?us-ascii?Q?G+MUtG5Um4FctT2xCf2BpRVR/PRcq7ohfkNVepXqedfaxq4nmcpl0ploUcnB?=
 =?us-ascii?Q?cZlMDXb00RuB8G4RQptEPlnmRbU8/PK4l6SPpgzs1B4p0GljXoW4YWfU55i0?=
 =?us-ascii?Q?7s5cJf9+NTUHyao/rP3NTX1jQiUlkNsGJXmMwB9gSjim+buK3EGh0M+WHVLZ?=
 =?us-ascii?Q?C3BNqVIfZdN9AmaUV+fWD4J7XqmgW5VmWc0on7uejmF3ACFNcemReDx5Oesd?=
 =?us-ascii?Q?Lmo25WJXvH4Id+sQf1B3Acygs/MpCORi/555NEQvZEZMRcinrVMb14UoAxIM?=
 =?us-ascii?Q?SDmdRgCsW2teVLvhm8JIlGjdiwjMgEo+K7oEBwSYJ45V12/+OsF7w3NWTqdU?=
 =?us-ascii?Q?SOatHf/V/SOsCDb1izwRJWk0Z1YxuY5lhPEuX+UN25ql+cDFQ2N/wPMSjC7b?=
 =?us-ascii?Q?ofsnl+ShfldIFsArpoxd1Ob79mEg+dGBwSQxbrNUfEeq6AtumGDQX0Y+nR/m?=
 =?us-ascii?Q?7Lk00WVLJusGMHnD/PknCde03yPP2DEcAHSs6Ae02GTc0qyC+a0oI5ZrvSiC?=
 =?us-ascii?Q?9NPn+O/vpHHnFDA3gak27YHaYWHq4CW1j53oFDr6c/px/ishwXwMZ/ids2ZF?=
 =?us-ascii?Q?syRZRbBtWD4LacZ6dtZl1Gm5sUHyNv/k8ysBw0kqPCS7RZ2gleAyUs7+c9qO?=
 =?us-ascii?Q?+NKOWEMls0BkymXuOJL8srF6MYmcuyoKeHg2j4bAmSKUW6Dc/rXEVqPCSCW1?=
 =?us-ascii?Q?eiTaKzjnnQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Mswl93XOcmmRK4fzTvVb6NtSSig74VhlIrz7yfZIHc1QYhN1DG5sqMciMMYJ0iz++njOIdJ4R1pUFX1ZiuIr9zj2lez/RwK3NzRVjAVOnzuXSlU5kzxUkcSSRVDFmd2HW80FHvJk4pUhplam++4ctiNMcGCE79de6T4p+79JeuQOmlBvEQW5iQZ+ySsal2erHDjC7k126kclCI7Me/ZcKKo1jakIU8TR7f2ZVh3C48f3B3F7BiCNIwhzZcraYiLKFucLvIQvjYNlVKpjA/fV6AR3w9ocSXHpr9KqGJ74Y1Iugd+wn3umpSKdo707A+MIwsyulWscqMdu/2XfUGZbBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1224f497-0705-4e7e-d5cc-08df29534468
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 17:56:12.2652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYscAuX82tVbIIulGkTNMEZKfIRs4DN20V86IEWQWDYb3tyIH5U3y/6qrUJJosgKE6uRnDX6Q4fcboOzK7i6zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
X-OriginatorOrg: intel.com
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

Daniel Charles <daniel.charles@intel.com> writes:

> On 10/7/2026 7:16 AM, Gustavo Sousa wrote:
>> The function igt_stop_helper() does a sanity check by verifying if the
>> helper process died "too early", however it does that by checking if
>> it was terminated due to not handling the signal used in the kill()
>> call.
>>
>> That logic has a flaw though: it the helper process gracefully handles
>> the signal sent by kill() and exits normally, igt_stop_helper() will
>> mistakenly take that as dying too early, because WIFSIGNALED(status)
>> will be false.
>>
>> That's the case with the pw-reserve process: in an upcoming change we
>> will change pipewire_reserve_wait() to call it with execlp().  Because
>> it handles SIGTERM and exits normally, a warning and assertion failure
>> would happen with the current logic.
>>
>> Fix that by checking if the process was alive before calling kill().
>>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>   lib/igt_core.c | 20 +++++++++-----------
>>   1 file changed, 9 insertions(+), 11 deletions(-)
>>
>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>> index 8ee9432923e6..d9949ea131f8 100644
>> --- a/lib/igt_core.c
>> +++ b/lib/igt_core.c
>> @@ -2652,13 +2652,6 @@ int igt_wait_helper(struct igt_helper_process *proc)
>>   	return status;
>>   }
>>   
>> -static bool helper_was_alive(struct igt_helper_process *proc,
>> -			     int status)
>> -{
>> -	return (WIFSIGNALED(status) &&
>> -		WTERMSIG(status) == (proc->use_SIGKILL ? SIGKILL : SIGTERM));
>> -}
>> -
>>   /**
>>    * igt_stop_helper:
>>    * @proc: #igt_helper_process structure
>> @@ -2670,17 +2663,22 @@ static bool helper_was_alive(struct igt_helper_process *proc,
>>   void igt_stop_helper(struct igt_helper_process *proc)
>>   {
>>   	int status;
>> +	int ret;
>>   
>>   	if (!proc->running) /* never even started */
>>   		return;
>>   
>> +	ret = waitpid(proc->pid, &status, WNOHANG);
> put waitpid in a do/while loop to catch any EINT return that may need a 
> retry.

Do you mean EINTR? EINTR would happen only if WNOHANG was not passed in
options.

This call is to check if the child process was still alive by the time
we are about to kill it.

>> +
>> +	if (ret == proc->pid)
>> +		igt_debug("Helper died too early with status=%d\n", status);
>> +
>>   	/* failure here means the pid is already dead and so waiting is safe */
>>   	kill(proc->pid, proc->use_SIGKILL ? SIGKILL : SIGTERM);
>>   
>> -	status = igt_wait_helper(proc);
>> -	if (!helper_was_alive(proc, status))
>> -		igt_debug("Helper died too early with status=%d\n", status);
>> -	assert(helper_was_alive(proc, status));
>> +	assert(ret == 0);
> This assert can be moved before kill call to make sure the correct 
> process is killed.

Hm... This function already assumes proc->pid is the correct process to
be killed.  The objective of the waitpid() call above is rather to check
if the process was still alive (the expected scenario).

If we move this assert() to happen before the kill() call, we risk
leaking the process, because an assertion failure would keep us from
killing the child process.

--
Gustavo Sousa

>
> -- Daniel.
>
>> +
>> +	igt_wait_helper(proc);
>>   }
>>   
>>   static void children_exit_handler(int sig)
