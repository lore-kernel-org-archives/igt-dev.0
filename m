Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD34DC47DD9
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 16:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7347910F5C3;
	Mon, 22 Jan 2024 16:22:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B251010F55F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 16:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705940555; x=1737476555;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kDk7tiVMHY+mENAd08Jgmqpv9Aj0B78WO4c9SaNERSM=;
 b=WBhiTYSaS1YPT3MXmfau0Cpzeq4ah9uq0VkShpeQ63GvUiXw+VLBlLX3
 +DYeM9wQvV+RiTkFj2feyEDqwxTnNTriJ+nJFCJFRtugXzX2WP+Hho7xH
 vSitOhraICXAwgX7e654ql89x59P4A8Wu0ol9jOQtHx/ADiHeNpejtmvC
 uhpxHQbzA199H6ZPZt5kSUDIxjYwI/WoXlQjg84+lJLDW+UqEiUomuHCM
 a48Xp630yGszd7LQ0cbLUBh0EbXwr98L+jA6wfmeVrHcPjE2P3mZ9KI09
 r7n0elrZS/5eagNooF/G4i7czcN95k8BkP/nPWXa/aXx/2pBCba8H5uyK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="400115784"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="400115784"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:22:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="27412272"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 08:22:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 08:22:34 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 08:22:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 08:22:33 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 08:22:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToEkj2OR6sscFsg2F88JNZ/XqXVgJ8RpTgaw/Igedn8yNTYIz14EKfNaoZYIebk1xEtEAs2TFDn0Yemka1Hyi2qiK/1NfR8uJhwIBnesB8SNPyM9lM1M4u+zbjXqej+mnnYKEGQFyvGmG9M8pvdgNiZ/F8/T8B5xTYUxwamG3ix8lvdrZ5o2ICl4o2qjcbzgraoMqTScbOlRF34g0zFywv2sfnkEAIwEqjWeIp5Ye3MOnmP6G7Jn8UNVevh0FvaeiitUBNtd54/uIiPMUjV3YrFROgclmwXAdWJFSFV8WmXShkQcmKM2pYq34SWBXn/2m8fA5+uITtk9jmLaKltjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUWp0QxbMyGkYFCMm3GeGdCvoBcN0c3TTzQ0dM1h7uE=;
 b=b2mwLHuO05B5cVaBKygEgnNikLaUAhZBsU4VAdsbJvbmijFpmtCXoAVtQdrcxZ03GtCqphh/h4CD0Wf7048W8/VAmht7fD0bxIoZbv+DA9gyLesxnul0T4QNt+Cfyae7ie/U3fLGFE3r7Qk3UbXg22b+Duelgskb58ceMK+1CKdBpaUjq5hhJUIEe05dO/Nmy6Qmq9BsMGGTp6iQl4TL92T2V1zvNLOrOoFArGuvGhJa0KeVk5AN4OT6QSHQIBn6b6CDEqWR2V68g89R8n3kBIdi+crUL6Ai+OHSFXAq8t3DcBXGVquLoM9rlaP1ikprkUBwtPMTq1vGC58qeAq/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7481.namprd11.prod.outlook.com (2603:10b6:8:14b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 16:22:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 16:22:31 +0000
Date: Mon, 22 Jan 2024 10:22:29 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t] lib/xe: Boost prefetch size to 4KB
Message-ID: <hz2mhm64qw3vusw4qgwvf5pvib3xskw6ldn7zjgjeqgfm7j5f2@swwcz2vw5s4l>
References: <20240122154302.54660-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122154302.54660-1-matthew.auld@intel.com>
X-ClientProxiedBy: BY3PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea77f20-2885-4f3e-168d-08dc1b665526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sLt4rFsK5gAiJOO5Yugbbki6Hs6zkeY1H/BGG24ImvNGGanNxzrQGz/9ZwY2zDJ36yO1j8MtcJ0yzh8ERchlQ997O4UAy65lkWs4JS7faaVmT3CwZJlAZh6pDqW7FTfu1o8lCVeXFS+ynlaMieadiWnVhFVZFZsSiC1p8vUh5eROGsPbmnkPxpSUVsD+GH4lwo1THGez6cfGEMnXVQRheptRGRlL9jCueVKamPlJ7q4QaSsZNfwCvQDcSWwuW/weYVzFytV7cLSecLyVoQRg1MG+CnVk3tXsglEYJjTiiXXza+1CEIG5n+UO+R1f2QtZTNC7Cx4CznHiMgwE7w00/0q9Wq+KhQ02IzBfLLnSlrF6q3MwqZTAeuBhnA3RqZjnG/iaF/kKZ95NjoqQOtZ1k+1slo6LRWVes+9Mls0txoXouhfl7jLZPXhn6P3w506VkFZ1m1o6SEdvgQcCJraXJEAmR8RPcCNca2RMk7pt4Gj3Jo2RbP1e43wMFmP8aclgBPEWsuWLdvaMOHSPjXCKBjmHPUzsZn44BGA+csSdB7wXy73mEKVKlAIHGbSeAobC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(376002)(136003)(346002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(82960400001)(2906002)(33716001)(41300700001)(86362001)(6862004)(8676002)(8936002)(4326008)(66574015)(6486002)(83380400001)(6512007)(9686003)(26005)(66556008)(66946007)(6506007)(66476007)(107886003)(6636002)(316002)(5660300002)(4744005)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0pMWHd3RzJvR1J4RFQ2c2RpUmNxTzhzT3FORERZdzFqeStsMjFhMmNmRElE?=
 =?utf-8?B?QlJrSDIyYmhYbk9rZDRYakR5Q1M0ZVVMaTFzRWlKY2l1WW11V1F2ZG85SVRL?=
 =?utf-8?B?b1gwMWpybXBDNzY1ajFjT29LeFZNbGNjMm84ZUpDK3pTR0dQV05nYWk3Ylgw?=
 =?utf-8?B?SzE3RmtEZG16QldTTi9SWHRSc0pZQlN0K2hFa2dLMWtBcmEwNVNVSDJnZUVr?=
 =?utf-8?B?QlpTM3RyRzRmU3JkZkl6bEdTTjZvOEJkVHYxeGRyOUwweFhDaXgzUURENE82?=
 =?utf-8?B?T3dZM1daSDVoWEJHOXpJT0I5c0JkazBVNk1XYTZPMzNsZjFzRys3TWdqVkZG?=
 =?utf-8?B?enlOMzdVUmJFbUxMOEc3d3FIcklrTW5ZOGdveml0QjZudDBCNWhoYkhrN0g2?=
 =?utf-8?B?eCtUditPNlM4aXYwZmlNdlV4NkR5NUZHakQya2h4YkVhTWZHTjYzR3lTcElt?=
 =?utf-8?B?dCtncTF2eFZEV1FPY2hOVlRMVjR1dzZaaHI3R1MyVGNSM1lGOXh3RDZJRXll?=
 =?utf-8?B?NXNYTktUcGJtQkU3RGhqeUhTNlFWWW1wVC9Pem41TytJakQzaU5WanRlQzV1?=
 =?utf-8?B?UnppdGxEdzFQSWtPSENSWUZNSEhGdHcyTVBqckJoNFE5bjNVQ0FmTVAwM3Bv?=
 =?utf-8?B?NHp0L21OVHJqb1JPTzdRZVlRc0RBM3FzYklSL21JN1NLZlpmbVB6V1dlVkNp?=
 =?utf-8?B?S3h0TWhjRVhFSjAwbkx2eVk2T09yKzZGSHhKYTBjTnNUTTgrSUxKUDRRN3ll?=
 =?utf-8?B?blUrVERIYk05d2ZyMmJsVkZNenVPVTgyUzIwRWRhMmJJUEw4L3lFN21SY1k0?=
 =?utf-8?B?MWloTmV5amtHV0tNZE9mNEVPTThWd0krSjJuTytiT3QyWDlmREg4endRcEEw?=
 =?utf-8?B?bmlUZWxTSmtTTndmR2t1ZkR3ZGxmZlZlQVd4VlNyd2xFaW9RNUUxMm5lM1Uw?=
 =?utf-8?B?czhudDVXc3lWRnlQL2dOcmFxVDc4K2YxR3BqUDFJajJNdnNXWjBLU1F6d0NF?=
 =?utf-8?B?aUlPN042VlFJYW4wQW8yZzZVTEJpb1dhaDZGSjJXZm5VZVkyODI4NDZzSnNy?=
 =?utf-8?B?VzhCTnZoWDRMdnQxWmNhQk9mOU1NZzRkY3RPMlFQQXdvMmhTZkN0OTFJam9H?=
 =?utf-8?B?YWNtaitBM1BYZ1FsdHNuaFgycGJOZy9YbFoxSlJIQmxUbUxKb2poK3RWRlVY?=
 =?utf-8?B?czNjcWdnUGsycmJkdndtUGRIUUdaR3hVNGJSalRlcXVKNkdhTlVSb2t2ekxF?=
 =?utf-8?B?Qm5sNjF0Q2dZZHFCTXNTRXFLemdGdVA0SFpnVms1aFJJRUJUR0tYcFRpUW9l?=
 =?utf-8?B?TUtUeE5Tb2FqWTNDVm5QdDZNSlQ2VGtXc1dOVlpySlNXQW1yMW9TRnh1VDV4?=
 =?utf-8?B?d2JQN0M2eHpwL29MeERWT1BNTk5IaFVXc1BIUllWSURvVlZ4dk8wZ2JlZHJT?=
 =?utf-8?B?R2xzUFV6bDFHTHJwdDA5U051ckp1NzYyVWxwT1VNQlAzQnBYcEZhcGNudkVQ?=
 =?utf-8?B?TDRxSEVtcXNZOFgyMWhKZDZuUEtFU1VYU1VzNU1pUnlLL2lyZjN1V0d6Rm4x?=
 =?utf-8?B?bzEwekpjZ29DUHBFYjY3WjN1Z0x4ZE1jd0dBRnkybDN0TXZnK3pqVk5aZkF5?=
 =?utf-8?B?dXZDc1RIcFVPeTExYm9NRXF1RVJMM2FxeUN4RCtTdTY2M3ZXRUFoejZCNkNC?=
 =?utf-8?B?RVhMRlI2cmtYTnVaKzc1c0hiWHF2Z1VPbnlZWDlRa2dQRmcwdUV5VndpMDQ1?=
 =?utf-8?B?WDk2Q2pzTFlWOExsQm10T0YwMmsxU21obkxQZlkvRjF6NlAvRW1Ec0hrbHBI?=
 =?utf-8?B?dlVFZysxSDVQc0kxc3BTRmMwN21Qdm9RUzI5NDJnK2ZhQXBuVVZHRE5VYUk2?=
 =?utf-8?B?WFpqZmJtZ3IvdnA1cDFYOWpDN1l4TUhpNTljbEVzZVhMU2IyVXUwVlZnRHVi?=
 =?utf-8?B?MlB6d2dmMTJpRDBqcE5CeElQOWMweSthcFkwL0JDNEVRNHZid3pFV0loWkV2?=
 =?utf-8?B?MFN6VW82eXdxbkhHeGdISHVKUGdIQzhWTjZkcnhzcXZoTGtHT3p3eGhMeDJU?=
 =?utf-8?B?dlpVd0xPbXFBcndUMkZCdmFQWHpRZWVaN1o0cWgrWFVOTWx3WEpnYUpyL3JU?=
 =?utf-8?B?N1BsbHRUQU5odFNUUUNYTmRaS2F1bCtYejB2R3pZMVRSV2lmRXNWeVp1RDdV?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea77f20-2885-4f3e-168d-08dc1b665526
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 16:22:31.0765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ByWYEQsTlI3ZDkXdAPkkRTNsxdh7TbhsiYyIApMNbotDsZc3gEPpK5PKeJKu0I1TdkAKkwvt4XKnI59IzNJvp5zPw1ED7PNvmSLE28DSYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7481
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 03:43:02PM +0000, Matthew Auld wrote:
>From: Lucas De Marchi <lucas.demarchi@intel.com>
>
>For Xe2, the prefetch for RCS is 4KB, so boost it.
>
>BSpec: 60223
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>


humn... looks like I forgot to merge this?

pushed now. Thanks for the reminder.

Lucas De Marchi

>---
> lib/xe/xe_ioctl.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
>index 39605a019..0979eec6d 100644
>--- a/lib/xe/xe_ioctl.c
>+++ b/lib/xe/xe_ioctl.c
>@@ -48,7 +48,7 @@
>
> uint32_t xe_cs_prefetch_size(int fd)
> {
>-	return 2048;
>+	return 4096;
> }
>
> uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
>-- 
>2.43.0
>
