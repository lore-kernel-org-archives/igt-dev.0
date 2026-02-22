Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28248C5DF74
	for <igt-dev@archiver.kernel.org>; Sun, 22 Feb 2026 04:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D60610E0D8;
	Sun, 22 Feb 2026 04:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0WWvd2Mc";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FF710E0D8
 for <igt-dev@lists.freedesktop.org>; Sun, 22 Feb 2026 04:43:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=robpK0HIGt6MMYGnHB1rW7WVfMc3QwDKeBwy+UcdP9ezZQI8bS96CGsycUzvBc18RBXycPhphgmmBEWwKuQoCc9BA6fvCRBinzkJhihcGXTHIyiFoSQKeH1gX/yug9f6qiz1ahxzH5v3bbO9xIDkL6oT+bCiJs59ihG24hxRlHH1xTO6+CAMG94d1EOsMGSi9D5PzXIslq5GsaijmipY+BH+NeLf+r9JGontuXWKAk8Yizi2sGXjxhilkgbwKllPtjYwgDyzQkazGY73JqCtwhvNvGsAjVq22/5w+Y5aAnVClfr6hwXfvlHngNix6TZKs0CPX2Dr1N0z+6sQQO18Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjvOKTAOM7HubClHCnJSDdyiOdFGescU3RvRyeBxKfw=;
 b=mhdxrFyJixu10/uNJdy2s23FruONOFInTy8xaqTXcTgi0moFnEliY/Vx0kJkyMzmWEtByk9JeJa5m6cQp0D8fXRZAbznBd3yKrhvuOuaspuF+WbJ5SyoKwFiYHxtX/sBesfbqnzNPDRr4CCGBmbkjJZCs7xQxql7N/bwcjIoWVKFn3wk5YRUPj1Gpi9CSory6g9d45NzxKtFdlvlYOpyxlkopRikv6eGY31SYz12Yra/KxDgaawtU8dpR5/DXZ+aK+rCRzMP5RvuOxDkE14sYK7PIYFjn0QbJtiTOiMC2dv9yUgIGR1pQPdJsZEqexK627zaho2Iq0Z13usSK28Dow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjvOKTAOM7HubClHCnJSDdyiOdFGescU3RvRyeBxKfw=;
 b=0WWvd2McbLaRs9r8KNrfhiX8Alp3SRpJM3pNj/IBnclA0Pcg4AbThghwonP2a54Jrq4A/Iab6S/slAYsIFqSq/4PZFreVUntC23DLWF8ML6lqrUXcTCvYOQjFH8K4PZ+xf/gUN7K78pTpOjO+MdQSLSG82fiafPrEAQpa0U70VI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB7915.namprd12.prod.outlook.com (2603:10b6:510:27c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Sun, 22 Feb
 2026 04:43:12 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 04:43:12 +0000
Content-Type: multipart/alternative;
 boundary="------------VrnE2I50XjnjKCmUEEUe710q"
Message-ID: <b7e4b022-731b-4c2f-93f5-25c52f42f904@amd.com>
Date: Sat, 21 Feb 2026 23:43:08 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: vitaly prosyak <vprosyak@amd.com>
Subject: Assistance Requested: GitLab CI build Failure During Docker Image
 Pull (unexpected EOF)
X-ClientProxiedBy: YQZPR01CA0191.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba4c858-f1c4-4833-ae2f-08de71cce284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0pDclU5QXB0WE5KK2YwQTNaaFIxdHp1RWdKNEJVWGlNaE5kSkU2ZStaZ0lZ?=
 =?utf-8?B?TDV3TmQ1dW04L24wQ3RRaVNNeEErTXhSYzB3YnpPMG00am55cjVEZnU5WmQ5?=
 =?utf-8?B?eThRdjlzMmV1MXlsN3BRRXZtdVZrNG9aRnkvNVFjRThObmYyTnUyaDRna3VB?=
 =?utf-8?B?S0sxWmZTclV2d2lnQlBiZjl2Skh6aktuSVFXQU9lQ1NZMlhhcUVENkZpaFRX?=
 =?utf-8?B?U1h0QTlZTlVoVTNLZEE0bkxROHoxQ0dqOXJoN2F0a0lUWGwrcDBmYzZyaW1h?=
 =?utf-8?B?OTRIQ1IxOGNEMGp4amovbzFUbmdDRzY3ZWt4YTlBaGh0ekNjWlR1cU94ZGFz?=
 =?utf-8?B?UUJXQkpLb2RleFh2eDh4RmpEM0FrQjBiYTZVbHYyUlpKWENqSlZzc25DUGto?=
 =?utf-8?B?c1pBVndlSXpjNkM0TGRSK2lLQnp4Qm1XUk56b2cyVjdxc05IbWYvZEt4bUdW?=
 =?utf-8?B?Sm5INkxNdkYvaGRMeC9hMXRnaHROR1VkMGh2YStITTVPbWhiWjR0SUdtdWxP?=
 =?utf-8?B?SXRKUkZKVHk1UnBWVVh4UkEzMTA3TXNvbmFLZVpVTzBwR2RsVm5zelVvZjNo?=
 =?utf-8?B?Q0hYY0xtOC8vTit5dWFXb0k1RzE3aUpDYndXemJrN0FUV3VicEROT3JKdHFE?=
 =?utf-8?B?OVNqank3Tkxhb2dueHRiVGU0VXA0NHVJQk1hNk5qUVRWYU1hcC9sZTZRc3RI?=
 =?utf-8?B?OTNZdnpQYmVsRTVVTDNHY252UGVVclViMTdwc2U5SnpRUUNrUmk0YWhIQlh3?=
 =?utf-8?B?Q3VadXdiSTYxM2hDbUVyeitEMnM2c0NsT1plWmdIcnVGUENnSDduNEZuT1lL?=
 =?utf-8?B?Q1pLQnE0TWsrQmIxMFFSMm5xaFNFSkd5ekFMZzZ2U3dHN0dla0FmbEg2MjJx?=
 =?utf-8?B?eFFEeThTRk85RjBuQm5KTW5SRFpFQ2tOOUN4VjR5ZXNnV2tLN1BmNkdRYmd2?=
 =?utf-8?B?T0JlQklzYkJrYkJxYTFubDNlb1R6TllmWk93cXRjKzYybDZxaVdhaEYyTWpT?=
 =?utf-8?B?elNFbWNzSXZUa0VLQlpaaGphTkltNzAyNG8zNFFTdVVFUWpCRllhUGZFdEFJ?=
 =?utf-8?B?ZjlEVmw4Si9oOGlRTFBmRGtDSnJaR1V2bTNYSUlnMldlUnMvVEZFZDBsMUhu?=
 =?utf-8?B?MmFRb1RVYnpRTUxCSFFRRC9jMm8rakpubk82ajZCdkpndUxreUNVUGN3UGRu?=
 =?utf-8?B?RGwrYjlaUW82Mk14ZjBONW1tMVB3UXBaSzZmcDNYVUd3T0R5ZXBXL0hMUHlV?=
 =?utf-8?B?VjdVOWFEeWRIMUtyL1hXL1RkaU0vY0hxVldkeGhYYWlnTFplMkRTcVFJUm9H?=
 =?utf-8?B?U1lyOFo1RDRhVGdpVFBJTFNENzR6ZUhXUTdzdU9GaFVYTTlwMUF0RHVJQk1F?=
 =?utf-8?B?WmRkOTFlcGJLVU5nTE1sbCtFYlluWWpBZnBUQ2Q1WUNtcXNWeXZ0ZWNrdzg3?=
 =?utf-8?B?U0I3OEJVdWlqOWc4TXBVeGMyenR3eE9LWFlNSkl3MDN3djMydURlUnNaRE5j?=
 =?utf-8?B?YWJEcitsL3UyMmhLRDllS0VmaUlJaCtnZzVaS0JROFVRdThtM09uSDJHYjJy?=
 =?utf-8?B?T3F0bkdSeXJzV3dzS1FWOHV3aU5EbWRsQno3VXh4ZVJaNTVTeU1IaWc4T3hl?=
 =?utf-8?B?TDNsU25aN3JZOXlDcnRzUFZtQ1hzQlFTQmJiYncvUk1JdFpTSHRhQ2ZKK3Mx?=
 =?utf-8?B?cnhxMC9HK3NnaVU5eFgrUk1vR2M0MVg4ZVVXS1Y3b09OMHZPYXQrSXAxb2lp?=
 =?utf-8?B?cFNYMjk2amVlZzQ4ajJVMHZ2S25hdlhTNmQyOEJmdXNqK1JRV2dITnZpUnlR?=
 =?utf-8?B?a0k0MkU5My95S0FMRXl1VGlTZDlvZC9BMHhTOUhVTUJYdVQ2ZXlOb2hxUEhv?=
 =?utf-8?B?OUlGR1J1WFpFR1RGdjZRcWpFQnVVT1hnN1FPc1kwZnBoU1JRV1ZNR3hMVzZh?=
 =?utf-8?B?Q0dNc3d0bllVREdzNUx0cjVTTHVTYVJGWkUwczJWb05EekNFUWkwb3JabkJM?=
 =?utf-8?B?ZnNMNUYxdWFkTmlqcHBUVTl1aXlMSEZtMFdxMDRGcnRtZFU0TmVZM2JVeGlt?=
 =?utf-8?Q?eGhzMx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlE5VWQ0UDlhRnNSd0duU2ZUR0FyUmJXUlF0dC9nWEVPVUJmenErS2NteDNX?=
 =?utf-8?B?UFQyYkFjR2JOeUtYVjY0cUlqL3Vadlc3NlQrTHNNdzY2NnNTN0tVeTcyZ2Jo?=
 =?utf-8?B?NG9rWVlFSHBobWtDajYyRUFwcWZQcjdLbVBHV1dWMG5ERnh1dDRGMkRFY2lv?=
 =?utf-8?B?NjhGRmpHY1lmYXZjTXdrVHNvaHB2YnNUQ0N5QVpWV1ptQUtYMlE4QXB1aExs?=
 =?utf-8?B?RHozNE1SU3A5M2k3ZWpwUTFUOTdvUW5zWDB5TmhPRzAxaXBJNUxZbk5GTE9F?=
 =?utf-8?B?YkhENTRWSEN0ZGtEaWFYK2hQL0RBcDNaOVJrbERVNmFwT2U1UDVVd1BUMzBX?=
 =?utf-8?B?UU1Ga3RiTm5mYUdrZFc4Q3RVY3lwdHFoZnZHZEdIczdOdDVNZXQvNDFid05U?=
 =?utf-8?B?c0lsWUFrcVIxQm5mS0NOQmd5MTFOUEhTbUR0SitqVktqS2pEczlRMzI0ZmhB?=
 =?utf-8?B?alVtcVl6eXoweVM4Z2F0MHFHU2lKMEFWQ1NmY3BFY2FBc1JKVlZhTEFIcm82?=
 =?utf-8?B?K0FmU3ZrR3RMZUFyZHlmNzJhSUNicUQ4K3Zyc3o4QXZ5bnJFVkoxZ3hSTytG?=
 =?utf-8?B?WEk2VjU2MjdOOTF3MldvVWs1KzZyT04zYXliL2xMY0tmQlVUVHA5eUFsTjJJ?=
 =?utf-8?B?b3NFSnVZSXlEY1pPSDdLcnk0RmNXYzJXeXVFMURKQUoxZlY1N2d6TTdVUUJh?=
 =?utf-8?B?N1JVTUlOTmNEUVV6STlTTzhRVFYvQzFzMExnTmdtRndrRGNuYTFvT3NUWnpl?=
 =?utf-8?B?ZlBzR1BJVnlCQS9mNkZ6WkZ5SjNlNVVJNEw5OG1BMzV4R1A0c0hNQnFuUFR1?=
 =?utf-8?B?QjNWL09INDdUVWtLdE03SmxMWFdaYW80L1VuMW1xR0lVRDVDTVpjYVE3VjJ4?=
 =?utf-8?B?UkN5RUh4UEpwSGdCVUtJR3Q1T3lTSDlRSmlkZjJyS0VIcWZOSVl6dHlCc1VN?=
 =?utf-8?B?R0FHOTR3ekdudFh1dXZEcFk4WXdyMlQwNjBsKzN5UXZWSmRndVpiQ095ZWxX?=
 =?utf-8?B?d2x5WUdSN1BPZHpkT2FVdmRocVJIN1hsYTVSUUI4Nk5TK1NTTU12TWJscmNE?=
 =?utf-8?B?ZnBZYmVuOVM0QTJTU2pmYW9Ic0dsbDNzRVJDUlNiK2RTQWphNjBzT1hZQ25t?=
 =?utf-8?B?WVFpYWlOZE9UcVNweEFXS2J0bWFIOHBNbTR6MEIzeGErOHlVZi9sYUs2VUhv?=
 =?utf-8?B?Qml4WkNLK3JBeVZVSXBaM3ZpSWJNUzlLL1Rvb2YyelRCbUV3RUtnR1NzaHBW?=
 =?utf-8?B?THVCbzVOK1orazdva3ZyZ2xaU1JFUmN2SWw5SnN4U2kxVE5adThVYnNDNEJU?=
 =?utf-8?B?NjFzYXp1YWZPeVJQSmVhM3lXWmtZTHd5TUJ0amRRUkN4dklRdXM1RlNKVmU3?=
 =?utf-8?B?WjJoaVhycWZqK2dmT3VBMzJaT2dMMkc0RU9tTjFBakJMeFZ2WTh3bnhYMHkr?=
 =?utf-8?B?VnVLRTM2Wm1Vd1pCdzNHNFJSNGVwcDlLaGpTU0d1bWpqdzBxNC9sZzF6elNu?=
 =?utf-8?B?SUtxMGdPd0Z3OUE0L2x4UXJpak90SGRWTjNpc3c4R1owdWZUcjRZYVBOejI2?=
 =?utf-8?B?YnpYTjBmVStwSU8xVGx2MVU4Nk5yOFRUN0lDUGVUSFg4QmVZVm5PcGxlM3Fq?=
 =?utf-8?B?Wnk4MHFRZ2JXS2VKT0hIZ0I4bWVBY0FKUXR2d3hmM1RhejNkc29NNDZpamM1?=
 =?utf-8?B?TG02Z2xVdkNqTmM5a2l4WUZGQTRWU1RNdklwYjRZOHJDU1Q0QzViOU1lV0Q4?=
 =?utf-8?B?Wk81TnVybFNpQVRMdmlld1d1YVY5K2ZJL2tTbGszZEttRlQ2dVJhbE4wYjZ1?=
 =?utf-8?B?MS9vekEvWWhBc1hEQjh0KzJhV1pJUkxnUFVmdGlLblRmalNLcmZrZGlBV2to?=
 =?utf-8?B?ZnZ2VmxlQ1NORG1sRkZqNDRleE9GQThtYzJ5aERya0p3WmJybE5mcjdISEpZ?=
 =?utf-8?B?QUt3T2wvSmpncCtaMFlMamZvc3NaVW5US3NzbDRpSVh3cXk5eU9vVkJvdHRH?=
 =?utf-8?B?OUtuZm9wb0hwT2J1NDNMdzh6VWlWTU5RUTE2TlN0eGovd2lENnYzc05NL3FK?=
 =?utf-8?B?WE02MldlNVI0VTNsbHRwUWd0OVErTGNqK2tYc1d2cld6cmN2WHlVcVU2UFhT?=
 =?utf-8?B?Ym9xZWFBeVJHcEdYaXRmWVJjcDhKTzRlR0tLeXgzVk83blBWdzJoMkViVThp?=
 =?utf-8?B?b3pKMmhMUGhmNUNxSjRONmpBcnBVRm5mR0oyWUVVKy9rVyt2ZmsxVW92V2ts?=
 =?utf-8?B?Z0RkSTdtTnhxMWN3a1lqSjdSaTBISS9BWG5rWXhRYTFTcEs0aEpyMm1PT0Fu?=
 =?utf-8?B?KzRMMmc5OVJVUVNLbnZZUHlpamJYY0NjSVUrMURnczFWK3JsaEhudz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba4c858-f1c4-4833-ae2f-08de71cce284
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 04:43:12.5924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmlPCI3Thb5iGkrfITsRm/gtB85dNPNiOPYK7Up32JsKz/Q/90asJAj1RteQZPVIjhEFt8Ct0Fdn3lVA1kNMpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7915
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

--------------VrnE2I50XjnjKCmUEEUe710q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil,

I hope you’re doing well.

I noticed a GitLab CI failure(https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/93765548) 

 after the recent IGT patches were merged, but it looks unrelated to the code changes—the job fails before any build or test steps start.

The failure happens while pulling the Docker image:

registry.freedesktop.org/drm/igt-gpu-tools/build-debian

The runner reports:
“failed to pull image … writing blob … storing blob to file under /var/tmp … happened during read: unexpected EOF”

This seems consistent with an interrupted image download (e.g., transient network/registry issue) or a runner-side storage/tmp problem (since it fails while writing into /var/tmp).

If you have a moment, could you please take a look on the runner side—especially:

  *

    available disk space (including /var/tmp),

  *

    whether there may be a corrupted cached image layer,

  *

    and whether a cache cleanup / forced re-pull would help?

Also, please let me know if there’s anything I can do from my side to help (e.g., provide the full job log link/details, re-run specific jobs, or test a workaround).

Thank you very much for your help.

Best regards,
Vitaly


--------------VrnE2I50XjnjKCmUEEUe710q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p class="isSelectedEnd"><span>Hi Kamil,</span></p>
    <p class="isSelectedEnd"><span>I hope you’re doing well.</span></p>
    <p class="isSelectedEnd"><span>I noticed a GitLab CI
failure(<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/93765548">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/jobs/93765548</a>)&nbsp;</span></p>
    <p class="isSelectedEnd"><span>&nbsp;after the recent IGT patches were
        merged, but it looks unrelated to the code changes—the job fails
        before any build or test steps start.</span></p>
    <p class="isSelectedEnd"><span>The failure happens while pulling the
        Docker image:</span></p>
    <p class="isSelectedEnd"><span>registry.freedesktop.org/drm/igt-gpu-tools/build-debian</span></p>
    <p class="isSelectedEnd"><span>The runner reports:</span><br>
      <span>“failed to pull image … writing blob … storing blob to file
        under /var/tmp … happened during read: unexpected EOF”</span></p>
    <p class="isSelectedEnd"><span>This seems consistent with an
        interrupted image download (e.g., transient network/registry
        issue) or a runner-side storage/tmp problem (since it fails
        while writing into /var/tmp).</span></p>
    <p class="isSelectedEnd"><span>If you have a moment, could you
        please take a look on the runner side—especially:</span></p>
    <ul data-spread="false">
      <li>
        <p class="isSelectedEnd"><span>available disk space (including
            /var/tmp),</span></p>
      </li>
      <li>
        <p class="isSelectedEnd"><span>whether there may be a corrupted
            cached image layer,</span></p>
      </li>
      <li>
        <p class="isSelectedEnd"><span>and whether a cache cleanup /
            forced re-pull would help?</span></p>
      </li>
    </ul>
    <p class="isSelectedEnd"><span>Also, please let me know if there’s
        anything I can do from my side to help (e.g., provide the full
        job log link/details, re-run specific jobs, or test a
        workaround).</span></p>
    <p class="isSelectedEnd"><span>Thank you very much for your help.</span></p>
    <p><span>Best regards,</span><br>
      <span>Vitaly</span></p>
    <p><br>
    </p>
  </body>
</html>

--------------VrnE2I50XjnjKCmUEEUe710q--
