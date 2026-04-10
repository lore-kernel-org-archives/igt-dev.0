Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0812EE99057
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC56810E881;
	Fri, 10 Apr 2026 08:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dogli+Go";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF8E10E881
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775810486; x=1807346486;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VbHeOwGIDybXsrsIgTdttYBTXdNOviA38ezpYjIu/w0=;
 b=dogli+GoNPs3FjfCClIaMniX18iLqer9lv3PN0SZmIYLL64UMEQrjFLB
 PfwbQM+2xjZ6uJdARbJcxzwzxgXGXCPcrzK0lpAltmQurBmCfDCTFjS6s
 yrMBebrV52EfnhQ7a7PY+Twhwxq2E6aVumpp+KsSJA0hpXiPHFSy+TL9F
 hjm2N1xl5oZf4NFHlXUu/hBG9ddIPclt9pGwKgBddO3bW55qWW5W49PeB
 r8G1GVsTEpmyURB0t6kcyXAmbr0rhyxhq241lPKpORg76V4w7vN0r9ePs
 J2fr9sMfBIzQbhxKCgMpPnMpQTaO5qshRo+ZEWZUuFgoIZjWVq+L85RKz w==;
X-CSE-ConnectionGUID: wijH/S/PTvCBG/uh9zROkg==
X-CSE-MsgGUID: jH9FG8QeR9q2fB+4dCt8HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76543696"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76543696"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:41:25 -0700
X-CSE-ConnectionGUID: 2+u2zpxjTf6jYLLzFkYQ8w==
X-CSE-MsgGUID: 89JKqsNjR4y5YuCB1+S8QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="226314237"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:41:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:41:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 01:41:24 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:41:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTco6egC25mRVlorQqtL8Wrr2a9SWmclgv1vQiFk3J8mH9L6LNWr1Sp1fSoxjxHPdS3Nhl7fjsEiuz5DqHJa7hFRkvXeFhIGN5TAWRWueHdpd7vxUBZ0oB9taMfZdV6AXRD3qQpnHddxO0ZtFbZHGQF3eKFXpCFa+/8devTL8wTNZZQ2bvPRNmlwfsF8zQriRyoBuByT1DmnePeMzJzEkRZn82nX0fkUtJ56IwSGdrZoWgdWB6zTHQd3D1iKDPyJlW5b05JwuCM+drS6KXCfWtcumH29qOQ/OWgXUO7wx5yv3BDAtXrmtxV00Zov81zHkMCEcBvCFMUniH1Vo4Ew7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAlB3139M6F+PuVOP1cFBX8oU+pwGM1jjXLR4FOCksk=;
 b=SbEFYo3o8yzvlkISs+gW09bRRoI1qycNc+OodFo/HaBvFKn43bG4yBARXYlLCweAQ9a4VvQx9d0C7jg2KMmlOCj6ZPDdHeOaGrCoWoowzk4vv9y4LzZ8MjoaOytE0tuvUWa+fK6tmnB8SF8Jo49b25gw/qo4v7eiQkYf6/g3FU19uZtt69PBUlT8e89MNSzMKB6rVHp0LrjVcLOqL3XraFQx3ejCc7mxNgZP9x1pbVrcLt7hYdqLMouQavxKkfC8PNVBQxxNn4Ik5RygjC9zNZhQY59DLaPIoDI60+9o1yZpW4idufVQtDFoR8PC0CXRK9DRmOBmxP48BcDoAhh7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 08:41:20 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 08:41:19 +0000
Message-ID: <3e92fded-d486-4bbc-b0b6-4fc1333ecdaf@intel.com>
Date: Fri, 10 Apr 2026 14:11:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 8/9] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
 <20260409070118.2211602-9-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260409070118.2211602-9-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b0b861-6228-47e2-df34-08de96dcf003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: cnWVUCCT3gYlsOO8Wfw0cktdFsZRV0RZLImN/967W51bnGKWt8dDpyoJJK2FXytlxQwp3LWMBDwIMKbIhvEEi9WutXx+5E2jjykP9fcbtu/wMd7MAaPGHcfxBOoH3Lr1kIrvFtmLGmdzDIzLcrpU/zsiymVYvVmLmCm05ycWTY2MA86/UP1cm3eIob5fsF/6TZXSVO/qyp9k2NgmAMtMAucdO2MKstXfeTGA6069CVSWr2YpwYm3qh5joVCe/qys49IBZHgvA+0v3pmduzI0CbO+2+jB5q1yDhnuag9l44vLxHxL/PUYEAYon4b61/6HCEZWb+qsBsG/izpKB2cKsCWGMrbsxu5HTP6zZpI1Y2N5g4hvdvl5a1vNJt//zAHcBajW5ahEd4MWsO76f+aI3pDvTGu+JejN/ml2kgLCAciGobcRVjmRk6gQzCSjTU1IOOvRxsJKCcEdYFlp+9IA+znhj6XpIgm+gnWmbcTijdeZ7el6mp0txcsJwlJ0chWaOnCglmtu4sYS1Td+89SX4bE4ufQ+7tH72bJlSJO10yBcINbfchSCV1wD56KayqPHsd+Th41N1MrgA94q3y7WpZisT9rN6wVp4KtnFmvH9Ml5AklDeBJmvEKKJaDy3btWxqJWpnJlhL0IaOjJM0jOtEX0PnQwAnmWOk8XiaXx4bFVleyTs6WrN9Wa6MwkT40lWSh2Kbw9EmXw590zA/+jXcTNz4j4XJbsomWp1pPmQNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clcxMGFrWDNOcGViMzhsMCtKU0RER2hmMTloSmtZVkx3YlR4QlY2Ty9KUW5T?=
 =?utf-8?B?WDBMUW1mME5TeXpGZUNqblU4anY0NWp4eDJEUXErZ1ArUEJYMDk1T0UvZlZz?=
 =?utf-8?B?VWtna0FzL05VSUV2Ym1ScDl5STJEZkRLMzBQRTlKbkhCSUpPODVRY2NzQ2NV?=
 =?utf-8?B?RmRDY0tYZUVkdVl6Z3loUzVnYlpnZ0lnTlhjSXVRN2dCSGVLZHFieWIxazB2?=
 =?utf-8?B?VmxLU3NoQ3V6andFa0xyZ3lBczRjVSs0WWwzbGVPK3ozU29tNGd4OUpMOFVH?=
 =?utf-8?B?ZGxlN244U3ZNZUp6eFY2VUhZS3lBZWJOM21ZVG40dmlCTkJ0RWhKOFhXTktH?=
 =?utf-8?B?SjBqMHhQQk5SUmN2WGtLNVF5OVkrYXoxQmdRa2d2dWJtdUY2NEhTTFk5cm96?=
 =?utf-8?B?YWFYSC9tQldueHZJNEJZaUJEYXY1ei9YUE9iQ210K0ZZcG12WFo2WUlxaTdu?=
 =?utf-8?B?eVdKVUtZUkpsdTd1OTk1NnY5dnh3cDBEcUk5b1c4cFNRemVIYytkdytmS2ZZ?=
 =?utf-8?B?SkVRN1JweVdUcVI0dUR5eFg4SC9RcWR6TENQWmQ1b29hSWtsMTJtWWhsbVNK?=
 =?utf-8?B?SlNla3pjZVlBcHUzeFA3WVRDQWp6bDRxNVpxU0ZDckpkUzZYbFpwRjV1akFi?=
 =?utf-8?B?ejdFbUFaSUJiWngwWmNBRlhiQTlIUFNzeTAxa055anU5VE5rVHYzQ3JoaUNl?=
 =?utf-8?B?Rjg0ckZzaHhIeHJ4R1g3U3VCQVU1c3ZuYjMrNW1tQzVSQTNNZU1mTDl1ZDVP?=
 =?utf-8?B?TW5iVEFlNktIVk5nWC9xWlhPaVVIclpZTjNyWWpnRWNoSUxKaHRoN0N3RHJM?=
 =?utf-8?B?VnlrQ3h1V3c4TTlBNEd2ZnRqSTJLNzBRQjFQRHNYWmhuS1luZm9NeTdQeGZT?=
 =?utf-8?B?dnV4Z2pRYW96L1RXeWs4OW9uZXFNWnRsT2FvWFBXVmVicUR3cFR3dXFiUVA0?=
 =?utf-8?B?YzdqSXNrWlR2c3E3SFFXTGY2VzlxaE1ONlVCZVZuTzArcHJYcnRvV0JjRFJJ?=
 =?utf-8?B?em9uQU1IK2wxdEV1TjRacGNkY3hZWi9obUo3dnJwY1dOWDlQK28rTW5mOHhS?=
 =?utf-8?B?dGNDVDJreU52MnBhMVl6SUVOVUZHbjJ6UHFXeXphbUxDbGxQN3F4SDBSMGNJ?=
 =?utf-8?B?NGhBR1F4aWVZU2M5dXY5RG9UdXlOaTYzUmpjUDJvWVVtR215dWVONDYwZmdt?=
 =?utf-8?B?YlJ5QVRsTEtZSmZmRXY4UE0zV2RVdElsQmFzVE9pVEp4V0xhQ2NYbk8ya1E1?=
 =?utf-8?B?WHNjTUtBd0hFRERDcGFlS2dndFJvYkI0SkFlZitaYndDUktWbVY4T21rQ2l2?=
 =?utf-8?B?ZGE1d1ZEZG8wZWRxNnBYNkw1eTR2U2wyTzNwcE1iblRRSGxUd1hLeDZqSzEr?=
 =?utf-8?B?WG1lNGMxV2w4Vzc0bW5VTk0xUTIxcDkwT1hiMTlmTGU0MFVsN2lJbVhPKzE1?=
 =?utf-8?B?SHJ3ZGtsOVZhSkYvMURsSHRydkhqVlVnRExlam1Nd2JRaXo0MHZBaFNwRGJW?=
 =?utf-8?B?MzNwTzlXME10L1lDQkpXUlZZTnhTc0YzQXFMaXlyU2tITWFlQVAveVNoODRk?=
 =?utf-8?B?UXdvNlhWTk1CSEh4SEtueWJlREVuR0FOMFdENGZTVmF3YVpNZUpuOWhtbkc0?=
 =?utf-8?B?N0FPcHNkRThWK0FGSysxY200STQwTmdVZTAydXdLc1phMkRDNlBUM2NKRDR3?=
 =?utf-8?B?TGtaRkdvSktLQW8wYVhtRURheVk4bjUzR3RVaFRmT1ZWYkdTNUtDRlNPTkZL?=
 =?utf-8?B?THljZmtBRzdoTVBDZDdnNmovN3VmWVFQaEFES1JMZC96ZWRNQWxoRUtxZDNF?=
 =?utf-8?B?aDRKbDkwUXVGMHdWZk9mYUs2dEFTeDlvWW1RbURDdVc1YUF1VXJaVDJMeE9X?=
 =?utf-8?B?OW9CRmhITDJucTJkdkN5VzVITEZBbGo1VkRDUkF1STVxRWdLVTNYR0UwWW1m?=
 =?utf-8?B?bDc2TlRCd04yY1VBdVlWZjBOVkEvZkcyMmZxQ0U3UjJUWkZVZENCeEtlcGtu?=
 =?utf-8?B?TFkyci9WbDVLR09pNW9hQS9rYzV6RVAzOFFyOG8vNjJndVR0dDh4cTF4a2hw?=
 =?utf-8?B?eFNieGRhZFpPMWdwOHRSYVRpUUpDRzNzYWtOUEpSakJHaDE1eTdheGtyWFJW?=
 =?utf-8?B?ZmszdEwwQmhreWRoTFJ1Ukc3Nm1jME1uNmpzNE1RWEtLSkN5OXdXaGZpTi9x?=
 =?utf-8?B?K1NSMHhkQXg3UjlVRUpxVDJCcURLS3ZmSTlzYzhWWUs5bVYxbDVyazJXb0la?=
 =?utf-8?B?dGl0ZmdCM0RDVi92Q3F1Tk1VbzZPYTFyUWhwZ0tYWmVNNXJrMmtaMWNTMkpp?=
 =?utf-8?B?UHhHRTJCSHF4ZURaNTJZLzAwSGxzUnozUDNITDNzaDJLQlBDL2MyQT09?=
X-Exchange-RoutingPolicyChecked: CQ1gbtmjrohz8dD0BLG0nLo6ScWiQsJS1NWcPT5j7oOW3qeJd//OkBL2bZ8SDp7v+svZBFVREh0f045qFqxg6d0CJJwN58vUgRzGV93Weke69u89NXyJIBSY94ZFlqN4krTvHUNvJ7uC+T8pbAKGncWWNq4fWBy7O1qvhyoOqWcM/i+9ZGkBtvDrlROctHyqgI2VJ6uGnqp6hghub7Q6BB2Xl8pBiEi7u94cq+ORCbL1mjXA7VSNrzUNtryockm73WzemPzwzBprwt1QsY+l136CbCNu6Br0900A79I87xa06zEpFA2jiGQ0Vi2lsIVvwP07Fq6YEl/FkJwc2UAW/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b0b861-6228-47e2-df34-08de96dcf003
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:41:19.8207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXFPAvRRUq9dapvI073BaK/LvYXg+lgQhukju+QpSBlGu37jYl7dEvLbmRGYrT9XJzezisWPNxYmJ/2ECEgcDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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


On 4/9/2026 12:31 PM, Arvind Yadav wrote:
> This test validates that purgeable state is tracked per-VMA when a
> single BO is bound in multiple VMs. The test creates one BO shared
> across two VMs at different virtual addresses. It verifies that marking
> only one VMA as DONTNEED does not make the BO purgeable, but marking
> both VMAs as DONTNEED allows the kernel to purge the shared BO. This
> ensures proper per-VMA tracking for shared memory.
>
> v4:
>    -  The comment now clarifies that triggering pressure. (Nishit)
>
> v6:
>    - Move resource cleanup before igt_skip() to avoid leaking VM and BO
>      handles on platforms where memory pressure cannot be induced; replace
>      igt_assert_eq(retained, 0) with a graceful skip. (Nishit)
> v7:
>    - Removed unused 'hwe' parameter.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 114 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 114 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 18bec198e..28a77e938 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -20,6 +20,7 @@
>   
>   /* Purgeable test constants */
>   #define PURGEABLE_ADDR		0x1a0000
> +#define PURGEABLE_ADDR2		0x2b0000
>   #define PURGEABLE_BATCH_ADDR	0x3c0000
>   #define PURGEABLE_BO_SIZE	4096
>   #define PURGEABLE_FENCE_VAL	0xbeef
> @@ -257,6 +258,58 @@ static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
>   	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0, NSEC_PER_SEC);
>   }
>   
> +/**
> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared BO
> + * @fd: DRM file descriptor
> + * @vm1: Output first VM handle
> + * @vm2: Output second VM handle
> + * @bo: Output shared BO handle
> + * @addr1: Virtual address in VM1
> + * @addr2: Virtual address in VM2
> + * @size: Size of the BO
> + * @use_scratch: Whether to use scratch page flag for VMs
> + *
> + * Helper to create two VMs and bind one shared BO in both VMs.
> + * Returns mapped pointer to the BO.
> + */
> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1, uint32_t *vm2,
> +					       uint32_t *bo, uint64_t addr1,
> +					       uint64_t addr2, size_t size,
> +					       bool use_scratch)
> +{
> +	struct drm_xe_sync sync = {
> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> +		.timeline_value = 1,
> +	};
> +	uint64_t sync_val = 0;
> +	void *map;
> +
> +	/* Create two VMs */
> +	*vm1 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
> +	*vm2 = xe_vm_create(fd, use_scratch ? DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
> +
> +	/* Create shared BO */
> +	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +
> +	map = xe_bo_map(fd, *bo, size);
> +	memset(map, 0xAB, size);
> +
> +	/* Bind BO in VM1 */
> +	sync.addr = to_user_pointer(&sync_val);
> +	sync_val = 0;
> +	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
> +
> +	/* Bind BO in VM2 */
> +	sync_val = 0;
> +	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
> +
> +	return map;
> +}
> +
>   /**
>    * SUBTEST: dontneed-before-mmap
>    * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> @@ -536,6 +589,61 @@ static void test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: per-vma-tracking
> + * Description: One BO in two VMs becomes purgeable only when both VMAs are DONTNEED
> + * Test category: functionality test
> + */
> +static void test_per_vma_tracking(int fd)
> +{
> +	uint32_t bo, vm1, vm2;
> +	uint64_t addr1 = PURGEABLE_ADDR;
> +	uint64_t addr2 = PURGEABLE_ADDR2;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	uint32_t retained;
> +	void *map;
> +
> +	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
> +						addr1, addr2,
> +						bo_size, false);
> +
> +	/* Mark VMA1 as DONTNEED */
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/* Mark both VMAs as DONTNEED */
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	igt_assert_eq(retained, 1);
> +
> +	/*
> +	 * Trigger pressure and verify BO was purged.
> +	 * Using vm1 is sufficient since both VMAs are DONTNEED - kernel can purge the BO.
> +	 */
> +	trigger_memory_pressure(fd);
> +
> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +	munmap(map, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm1);
> +	xe_vm_destroy(fd, vm2);
> +
> +	if (retained != 0)
> +		igt_skip("Unable to induce purge on this platform/config");
> +
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -578,6 +686,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("per-vma-tracking")
> +		xe_for_each_engine(fd, hwe) {
> +			test_per_vma_tracking(fd);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);

LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

