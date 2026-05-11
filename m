Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE72DCD37AC
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 09:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D9710E503;
	Mon, 11 May 2026 09:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CI81exF6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA5C10E503
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778490536; x=1810026536;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xxt6MQuqllAENxxb28v6HDUfwNM21RN8CLIYOsVbClU=;
 b=CI81exF6TOeOuepE2mz/m1qf23tXNU3zQvPgKUwGrbwC54qwPh6Jqza+
 AX7u76Ux57QDeqFpU9xn5k9X/Q/I9fA2qYQ80A9U9VgOHaUzj5e3XzV1k
 faT+iwn1rPCoQatOGwYt5jmB+uzh0RPtkmjIICXOHdTivFrg0Paouu2zX
 RD2kRm4UrPNz93AcWzYpFXH1FsSGaDV5XVlSDg1saVit4LF0wgv+i/hjP
 N/ntL107FTJhX+LGZWJjUhpM1Zfzp8NABnlLQPaYytPWyOuJ8YIQYMauP
 KGubOQPgOeT8d+8VbnmSFbMmSX89AkmBuat1ZAJynRPnPDBpSBdBaHZeT g==;
X-CSE-ConnectionGUID: j380HIXdQ9GOWYJioLrOpw==
X-CSE-MsgGUID: YVBGpiaSSnOGSqGX35G74g==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79355789"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79355789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:08:56 -0700
X-CSE-ConnectionGUID: tRDhBqugTruT2lGN2KcB3Q==
X-CSE-MsgGUID: lxtzEsq+SLCGLP+kmGQ+MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="241755654"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 02:08:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 02:08:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 02:08:55 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 02:08:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IePZCIsGfEJVt/nK2BGjVQVYJUu16dBQqQcZ1mVOD9KJUk0ckVCJp8EAjLNEToZUjYfJPSN/UKKwFdiMYyCfD5qDBVi50G3yJFUBdttnIakYWMWzngBk+exh3yAtbssO04IWDSoPVW3Tra4JS9CmSTqSHbGxc5yZYle2oW0GkbugJ55YNCkvp+mxNx8PDdeUjgAXyOb4+TtfJM+nKtbsUZ0EkVLnkMEcMJFgcUXhjuJEfypNwhRJOuZ/q9loKtYDZW+aPR3DsG+dt1eujLHcyfxzQgi943c+zwB8Y99YUtVkWqFH0W+mtSZ3quIbWQcyPNR6WspkdVx7qo3Z2bB/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afTH9wdSTbHGOMg0kKhlUzKkqsDQTEnTB8/+fzmQWmI=;
 b=jArgrG2BiHJqcte+PdGb073ihJF+Xu5slkJfyNVBs8tyAPoUaxz89LDW/D87Csqs2UirN7LkrJJOBsWXBeZvnVt+5/dgvjyxfz5fTzSHOvCkz6qJSlkj1aYpDylIDxwMnQwpFxrs0YbASD2vMIefXEOPUBSy0GGg/hD+q5R80dh55V01/+Om5ZzXVw9wdStdjgA6F68rqUYzUGkOiQw3kWR55R0qHIJ1OP8ta8fJc4gcJGjC/YlUh37ebBqI5OkrYsZbifuNYKHSnk3/M+POH4mGNA+gL+dTT0X5scc+u7qpzM29RJ4Yw0gxawKuIYksVLw8HWU+JZanEEzi/ePCjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 09:08:47 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 09:08:47 +0000
Message-ID: <2bf0d6fd-e59d-4647-8272-7b5322355dd1@intel.com>
Date: Mon, 11 May 2026 14:38:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/intel/xe_madvise: Add atomic-cpu
 subtest
To: Varun Gupta <varun.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260511035310.32323-1-varun.gupta@intel.com>
 <20260511035310.32323-5-varun.gupta@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260511035310.32323-5-varun.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 06210242-a992-47dc-7bed-08deaf3ce8cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 9xsT31rfrReLQhJnA7T/qY+OkXGwtExxbq3qzUxbLl6mmoYXl/rBa4i+s0nxo6gPvTj1ynVejV3kFcgmdP/z9LJnCTUWDmKlpYxhPPPVjkYO+Fqr0q8Eps2xUEdA9M58QNAT0k26MJtPNjSrwrPbEThwGrKxXLXBEqX7RKKvNvrazCKdXlI0m0zpvEiI93Es2uekf/GUt0RE3czGLB6BC8T1smhM+nbQguCWLk7Y3KE5qaZZeEA8pPMRdSK9eCGyWRKRdy4o4N2yR35sf57IJCaHiPF8mbI0tzUV2K9Qb7EEXBiPLy2UCXZFhkckwG4pEDL6ykhhq9uQH65HKTHiXQpIGLzW4ffx+SQ5lyvBiaSvmR+nVeYSc+acINsj7gWwKlaNYpddCGczAVhfLI40pf6tl6JwM/yKCOL64DINOH0Xpq12x/b3YYwPKNfiq/aa5Qf6K3lLE2zzI4MUtDI/2IutlQ9mIHQQqiaBI5a0cyFEvA0do1XP+uxLE6ou7gQywUT8v7UPhG2tWgdTNgd08z2kXG5aQNZnyU9dDsrVkkHfjxeV42KLrH6zYZ53vbVn6KkLHNliGCtGtlDcNP2+MoTk4CtEN+byFPJOGtG9uN7f5KkFtWiQ3ecQjchQtwXy3o6XC/QOZAhQNIuOQ38+/Mu8qz5wIAP5hl2NDuszVKbo+qPXXtsuX1HIqdzDefko
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlJqTmx6SE1haHQzbjF5SXkzWnI3YXYwRkQwL21ndDdBcTFJOXo5VFBWN2lv?=
 =?utf-8?B?S2EzdWpoNjJkMGd3MVprYXBJdzhLbCs3WHJrRTVLcWVoc1Y2UGowOFpoSGIz?=
 =?utf-8?B?SS9aYmJpallwOHkybUVIMU4yTlpzdTJUcE9CY2laejZPUmo1MTJNQ1BGZUJB?=
 =?utf-8?B?bGRndFdCR3BwN0dsd2MwVUZoS3Y0MmxXVlNUOGpqVTZCY3VLMTluS20yTVVJ?=
 =?utf-8?B?VVhrNkNEVm81NnRoMEpITlJ0ZXV2TnloNEtITEw1ejlOY240STJacW1kSmQy?=
 =?utf-8?B?L2xrWStLNldGQUNOR1E5N2ozSDBSRUFiSVJJQlBhNmREUmErUnl2VVRXZGVm?=
 =?utf-8?B?VnU2TStVbHZockQ1bGtuUjljN3VaMG1JUkl3OHFKNnd0TU9aOHdQYVVkVlJG?=
 =?utf-8?B?K1JweFNUWHRGcW9QbURjMUdGWldpNTJkanR3NUZzcWlZZ2FwS0FSVXdnM3J1?=
 =?utf-8?B?ZWlaUE5VUm5xM25MQjgrQlhwdEFOWE5UcWR1NGRDdUoxUHlxdlBLTlV6cm9p?=
 =?utf-8?B?N3l5T3J2ZW12am1qUG1qNW1XNHFaWHNZWWJYU2t4TXBkYllJeXpvbmVuaStX?=
 =?utf-8?B?RnhubFd6STBvRTJwVlRRcjdleXA3bm82VW93UjQrNXpmVGcvSHgwa3lOcmI5?=
 =?utf-8?B?cjRzN1hXMkpkWFgxM0k2bjYwaG1xTytVSW92K0NQVW5LZ25DM2Ztam1qbzNp?=
 =?utf-8?B?cHRHQllScE5wMkFsY0JxZTh4aXJTTUZZWm9KYlJsbTQ0c3Uzc1J3V2xhT1N5?=
 =?utf-8?B?VVhPbVZZcFNjeWNsb2w1eEVMVkJrcUM3L3lJRjBEMGFDek0zZ0tROWlBL3k0?=
 =?utf-8?B?ZkRSSDdoaTJrVWdhaG1JRXdSdy9mM2VzQjhuRWVkcEswWUNIK2dOeXc3YUxU?=
 =?utf-8?B?QVIrcHdvdldrSmxrK2JYZWl5NElqeXBPT0kwNVZreFFkYkpXSXJ2QlNpeUlm?=
 =?utf-8?B?RElGSCsvZ2dyZnR0NllId2xqWUhkbmZHMllLVTRlNDhySCt5SmVlYm5DcEIv?=
 =?utf-8?B?U1VTK1IxdXhmaDZNb2pZSU1HMWVmRkNnZDlqU2pweW1nd0RqTEFyNnRrNHpq?=
 =?utf-8?B?aXFXRnVOei94KzZWdFZzL2R2QnRXczN3ODZSdFZjcHNUc3BqRHg3RGc0NStU?=
 =?utf-8?B?bEJxNVdVaUd5ZmdDaE1hWmwrTWpoWlE5cXViRlowdlA5V2ZndEV1QUpmcHVv?=
 =?utf-8?B?cWVVRnY1UXRTZURqUjI0djIwaTB5VXlaMGlBTVcyZEFGZjJBd1ZLWVhjZnJv?=
 =?utf-8?B?L3pORWdoTGtOdlRUeWJyaFZITkNqdWoyMWNJT2sxTWtlYVpPMkI1Q0M3ay9n?=
 =?utf-8?B?MlZZM3pDWWx6WEQzVDBmNDZ2d3ZSclVNVnhJdkdxaHpNdHRCamdLUFkvYlVa?=
 =?utf-8?B?Y0dkZFhFY2p0UlpvVzAzVlpaMmJ1aHhzNGk2azVrT1Q1dG13RjJaMVV1UUxL?=
 =?utf-8?B?aDZ0SnQzeG1yQVAzYm56S09JVE5qUXdtR1NhYm1MQllQOXl3QVZlc29DVkJC?=
 =?utf-8?B?QXRFN2MvOGJlVW5NalhWZWRDUGxmL1p0ODhxdlg1d1VuWnhIQVNoUnJ1MVdX?=
 =?utf-8?B?cEpBa2dQWHJkQVZIUTBsc3praXJnbkN6UW9aSmRhRHNCN250eWRXOVdac3FP?=
 =?utf-8?B?eWNFdjlxaWtkOFdTazR1V3BuNll1RWJ1WWVMeTJJWjNpcmx4NjIwd3A4MVZn?=
 =?utf-8?B?YndieFpyclBhZXZJS1FreEdtQUdFN2JBWEVLODZyeTI3TGR4eTNkQkk4U290?=
 =?utf-8?B?bExBYmtuQ2dBZEcvU1lITFFnTGsxNEVTNFhwaklncE92VkFxYmFHTVpXQVJ0?=
 =?utf-8?B?bjFFTFV4ZEJOWGZyVEk5OUF6Ulo5TVpZRTRPcDRQZU5VY0dXRWlGSjdCMXk1?=
 =?utf-8?B?Q2ZmQ29oYlFzc0NGSUNBSWl5MHo0b3VJVnV4RnhQMGhJQlJEUlZDK3pPd3Nl?=
 =?utf-8?B?bnJwNVA3L2tYWXNBUWJJQVU5cHg3OG0xczRiU3hNOG1UKytUNVdkUG1LNHpV?=
 =?utf-8?B?VU41djVTUmJ5OEpuem1SYXFYQUU1M20rcGU3eFRpUXBMMTlhTGZ4NHJsdzIz?=
 =?utf-8?B?eGJJcm9TcUpBUjVrNVlOYzhpY1VaQUxzcDJHWmZzTjFZM3grdkhmekgzaWJJ?=
 =?utf-8?B?SzRvYkZYeTI1KzdZNWcyQ0NsbWc1ZXF2WE5lUnU1R2ZVcnpsVUI4d2diSWg3?=
 =?utf-8?B?SkFTNno5TjBHam1UMkx0VWxOaDFrUzNhczNyL2tRODQ0Y2l6RHhYM0txQThB?=
 =?utf-8?B?Qnl5NzV3YjNqdE15UWl5aWlqQW9OT0VqWlkyRTVNc2RLSGVPeUExVHRVOEl4?=
 =?utf-8?B?TTdVYmVWdXpMYXNIU0VJR0phUytuRXR4T1llZ05hSFBnYzhMdEE4UT09?=
X-Exchange-RoutingPolicyChecked: XmxXUkLWaAcQhlXnezOjdei3nT0jLFulA0cNBKx+z/OhfVrhwM2ohjmifYFyFY9hNqOi/zrazVGBbmazLNU+weWpWcNyKDjjj+TsULXi1cjRxDBh326LXnlQB2dUOQvpplaulFOwBGjU+ddzstcBoJqJCHBeRYAcsglSeps6n3xAeHCk83dBZsRALKxUmAyxeqMo9CQksXflUAQfmSzWibgTFjebE+f8PR3uRdWLNds6/6rO/UnQvWZ5G9j9NQxjuw6u3VpF6Fw1RMtR1QS5FoGZxMmFto+BTRfF6eM/Hz72QtvKpGyyRHZyLVu3lSHVaKSeya3uI/jA7Cz/zwGW/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06210242-a992-47dc-7bed-08deaf3ce8cb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 09:08:47.4487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJhcB0vMl9aTEWOG330navXH7/4A1u+fa4NwOYhKFuaeBsZvYmFM508mx9oIk4F4Ve2VP8JnKMdu3a2A2TCkyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
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


On 5/11/2026 9:22 AM, Varun Gupta wrote:
> Validate that madvise ATOMIC_CPU blocks GPU atomic operations on SVM
> memory.  The test sets ATOMIC_CPU on heap-allocated memory, then
> submits GPU MI_ATOMIC_INC which must fail because the page-fault
> handler returns -EACCES for CPU-only atomic mode, causing an engine
> reset.  The fence wait times out (QUARTER_SEC) and the counter must
> remain 0.  Only the first engine is tested to limit CAT errors from
> repeated resets.
>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>
> v2: Add UNMAP of CPU_ADDR_MIRROR binding before xe_vm_destroy.
>      Add comment explaining break after single-engine run (Nishit).
> ---
>   tests/intel/xe_madvise.c | 83 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index baf50774d..9a5b9eb31 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -959,6 +959,79 @@ static void test_atomic_global(int fd, struct drm_xe_engine_class_instance *eci)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: atomic-cpu
> + * Description: madvise atomic cpu supports only CPU atomic operations,
> + *		test verifies GPU MI_ATOMIC_INC is rejected by fault handler
> + * Test category: functionality test
> + */
> +static void test_atomic_cpu(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct drm_xe_sync sync[1] = {
> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value = USER_FENCE_VALUE },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(sync),
> +	};
> +	struct atomic_data *data;
> +	uint32_t vm, exec_queue;
> +	uint64_t addr;
> +	size_t bo_size;
> +	int va_bits, err;
> +	int64_t timeout = QUARTER_SEC;
> +
> +	va_bits = xe_va_bits(fd);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +
> +	bo_size = xe_bb_size(fd, sizeof(*data));
> +	data = aligned_alloc(bo_size, bo_size);
> +	igt_assert(data);
> +	memset(data, 0, bo_size);
> +
> +	addr = to_user_pointer(data);
> +
> +	sync[0].addr = to_user_pointer(&data->vm_sync);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_MAP,
> +			    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +			    sync, 1, 0, 0);
> +	xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> +	data->vm_sync = 0;
> +
> +	xe_vm_madvise(fd, vm, addr, bo_size, 0,
> +		      DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_CPU, 0, 0);
> +
> +	atomic_build_batch(data, addr);
> +
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	exec.exec_queue_id = exec_queue;
> +	exec.address = addr + ((char *)&data->batch - (char *)data);
> +
> +	/*
> +	 * GPU MI_ATOMIC_INC must fail: page-fault handler returns -EACCES
> +	 * for ATOMIC_CPU mode, causing engine reset.  Wait with a short
> +	 * timeout — the fence should not signal.
> +	 */
> +	sync[0].addr = to_user_pointer(&data->exec_sync);
> +	xe_exec(fd, &exec);
> +	err = __xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
> +			       exec_queue, &timeout);
> +
> +	igt_assert_neq(err, 0);
> +	igt_assert_eq(data->data, 0);
> +
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
> +			    DRM_XE_VM_BIND_OP_UNMAP, 0, NULL, 0, 0, 0);
> +	free(data);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -1030,6 +1103,16 @@ int igt_main()
>   		igt_subtest("atomic-global")
>   			xe_for_each_engine(fd, hwe)
>   				test_atomic_global(fd, hwe);
> +
> +		/* Run on a single engine — each rejection triggers an engine
> +		 * reset and CAT error, running on all engines would generate
> +		 * redundant resets without adding coverage.
> +		 */
> +		igt_subtest("atomic-cpu")
> +			xe_for_each_engine(fd, hwe) {
> +				test_atomic_cpu(fd, hwe);
> +				break;
> +			}
>   	}
>   
>   	igt_fixture() {

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

