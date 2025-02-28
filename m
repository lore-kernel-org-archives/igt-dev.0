Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC52C19F32
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 03:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D592E10E179;
	Fri, 28 Feb 2025 03:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bC3a1Z2d";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A863C10E179
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2025 03:17:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ama4Apt6tEMhmqqUuTzC1o5wsdq9RXuSVAxLyqNbstmAHOb5Vlg+YK4hEIsFDEgIidnIEkj/Wj2JNa932wgVyqBZpMFamQrvUoeyr8ogqWiLNW7c91DtEWtaCXO+4/aJtAZ0xlr/xNgSS5TeOS2qpnam/pqHnBs0uCyO69wfoh+8gOCpUIIVwP5kxAtoadkfhCz52F9xPt3MdVb6ai2M+tHD1bPAiH1PB/qurvOGNY2ZFrWnNtKwNzpmTgpPVXfbSU8P0W8Gwwx37yxLs8f63t3AfFcozMcLWjrYaQa+PmkiI2qTkRz7j9FBr7tGr0Q3hLmAOJi/7+mHRjiDELUG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gC2PciWQI095GmcDXvo5xZq5OHz8jhgv421DoHNz1Y=;
 b=tC28D8S133A7+49ngmrTsTVFfvud3OaTI1f7SCZDDCXLsTw7g+1tzHGhYGU/SK+4KaZh4CnGopYRVjTcUi+EF9jUWNr5sMf4TwqqCNtIEh170d1ms0Zo9FjQxXH7Aoh60m4I5yyYOCq7sqWqbUoAEH1EPeXvp/BPMiP5VE0yJf6LS780hVGm7G30b9j5792ohIIrxSUL8+lux2kuZPYQeycMZEZUCOzxrzHeAWPIFuWvWcNiNcwdcx4QjXe3I97y3U57wWrnnujyAXQ3EbPpoaKFZKUJcKC5ukBgHDpvozDntwCTYLgm/Cb/06VCMHw5rCBw4fPel0SwJ+yKJj3Ecw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gC2PciWQI095GmcDXvo5xZq5OHz8jhgv421DoHNz1Y=;
 b=bC3a1Z2dYmz8sTmLu7SEULneNbJ2UrHr3qeE0t3zEZYX7xWZGS0cMsnTweF8+RZw3c1VcWfJdGTAH+QVF5Y08e/1+BJkPHe84ZevlA3am7pkEl8v9f+PGgqHcP1cevCXtPM8c0gHbakXi5Db4iSg25sBkXKX+KLjtJh3LE0KHiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ2PR12MB9137.namprd12.prod.outlook.com (2603:10b6:a03:562::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 03:17:34 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 03:17:34 +0000
Message-ID: <b93fa221-a368-4d98-b5e6-3539ba68d6ca@amd.com>
Date: Thu, 27 Feb 2025 22:17:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 "Strawbridge, Michael" <Michael.Strawbridge@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
 <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
 <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
 <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
 <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
 <c4c07559-0bd7-4d77-a890-309b3f772359@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <c4c07559-0bd7-4d77-a890-309b3f772359@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0190.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::33) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ2PR12MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f74a4d-3a64-44d3-1195-08dd57a67208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGFzTXIza0JrcXdNZEVZd0xycUVabW5XZGQyeTFyREROa1g1YkRiNEY5aDNS?=
 =?utf-8?B?d1ZpYit0ek90WElBb3FQSmxWNGdDUW5qZ0R5eG9JYzl1U2s1YjNVYTNZNyty?=
 =?utf-8?B?YkdaN1Q2eHVYRE5KREQrNjVRMWs2STlaRUtUYWJsTGhISWpqSm5aVDZVNzQ3?=
 =?utf-8?B?UlVHaTBkZ1Rma1pZU2pHTmpVanZCQzU0d1BLVWlBZXRWN0xIdERoVkVZdG1U?=
 =?utf-8?B?Q1lWYzU4dnVMczVhV250QTRiVm10eSs2c0Z4b2dFTFFmVXFuT0sxZzRVZ2g5?=
 =?utf-8?B?NGpLOU5TVWdsWjVvQVJIQnFyVDQ3d3gwQ0tQeXE0RE1GbjBhUkRENlJsNlJv?=
 =?utf-8?B?Zld2Y000cldocmpMRG9BaE5iUXR0Z2FsaXpHU2Flb3RJOTRsWFBLWGlQWTU4?=
 =?utf-8?B?bXM3eHpnZDVzU1c5WGhYaVBCSDRhc3hWTzVIVHMxMm8wRk9Bb0JDc3I5Vnh3?=
 =?utf-8?B?NmJPUjNEdHZJd1JxeS9lSUJhUzJFQjRLNVdnbUdjV3lINGgxOTRaUzRwZk16?=
 =?utf-8?B?YTkwZXZwMURCSlpqYk90N1hzbENPanp3NG5jSGhzdWJ2UWxuakdPYWJrSEFq?=
 =?utf-8?B?Z213UForV3RhV1czT0hKMFJuR2oyNDkvRVNITXVZYm9ZOHJCNGMwWG9GcUlh?=
 =?utf-8?B?cnZSWU54QjgwckxhQVM1b0xZNEY0ay8ydklJL05IVWtYQTJUMk9zR0QxUGpR?=
 =?utf-8?B?MGJHRkx3WkF4V3RBV3RUaGlObU1POHVCVFRVS2t1QW95YVhDWUkrQ3hVcDNE?=
 =?utf-8?B?VnVCWGVOdlJDUUlLeHFvTEhlclZ0SjdjMnZKNGNLQkE4YktvK0lMZXRaa3kz?=
 =?utf-8?B?RXZhUnFWeERkUGpKT2VSQTdnSHpMOW0wTko3SmdXcGg1U05IR1VxemN0NmY2?=
 =?utf-8?B?YWlIUHJVUDFnODc0MlpSZWlSYkxWTEpIZXNoZFVqbEIxdXFQWVpVZlEyV0R5?=
 =?utf-8?B?UmcxbXRpaHRNNXpDcnZyNGFxNWkwNmplejJQVFl5elB3cGp1aXo2NUxTNVlv?=
 =?utf-8?B?SGpLUUFFaHBXMG50NVlQSzJTUHMxalVpQXV2Nk84K3E2OHpmRXRRSHJKcThF?=
 =?utf-8?B?MjZNa1VjV3NDb3BGemdmZE5meThCcTBlMjlQQ1ZRUWRwd1Y0WmgzTnhBVDd2?=
 =?utf-8?B?eDZwUW45MisrK1VSdS84enkzVGRLRzJSNFJTWm1FekhYNUJOakpoRXhBV0tK?=
 =?utf-8?B?MUZYY1o0cnJvQkEzTHRIUmFVRWJWeW81QUl5eFZualFqVVp5TnppVGo3TzhU?=
 =?utf-8?B?L0gzUTc0cDJydklVZkVaVTdXVG9KUU5jbDM0OFlvbkRFNStteWxhc09iSkFU?=
 =?utf-8?B?ejQzSWx0d0ZSU0tITmJqSmhGYlhQU0lpMjRSekJIeHJOUGtWS3NCSWVBdVlS?=
 =?utf-8?B?VHQyQ3VpMEZFSGJEN0FUQWFEOFdFb0dCazhmK1JoZTAyMVBaa3dLRE1xdlFs?=
 =?utf-8?B?UjhJZjJrSmZCZExrTGxqd2xpS0VZR1NiRDBtNDhNSU9ZSGFFN2pYampxaTZm?=
 =?utf-8?B?MHdtSURFS0xuSUVtRzlGYWRFanhGdGd5dFp1K1l4bEpid2VabTErSUtuU0pB?=
 =?utf-8?B?dEZUcnlGVHhKeklVbGxXaUlxelVnOHQ3VDhGa2ozQVI4U0k3eCtDelZHSTBY?=
 =?utf-8?B?anU0OTNVR1RmSEpQbGFoenZ2SUYrVVRDbjNWSXJTWnc1NTFFNHhPYXpKWWVL?=
 =?utf-8?B?ZUI1dDN1OFpHd1lHU2pIRTIwSGNGQ3NXZFJuMDhWQkdiTmMzZ3dyMlc2ZUpz?=
 =?utf-8?B?cXlzWXhRZ1B3eE5ITnMxcFg2elBtbGRYbWNGYzB3blNtZUxSZ0twT1E0SWRi?=
 =?utf-8?B?NWF5OUhmMjM3ODJBMS9RQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXBTSkJNNXFWYTBUTUczMm9MNlIvU05iSUs4K1E3cEVtLzlsWTZOTlhxczdG?=
 =?utf-8?B?VDlsL3JGVEd5ekR4NUh6eHpIL1o2MkpXTnl0TWlWM05KN2ZhV25BRm5oQUp3?=
 =?utf-8?B?UFE0MFhQVkFDQXZMcndEM1Y0ZFhpUXkzM0Jib0dNY3BsOXpKT3dyZDBLN2Fv?=
 =?utf-8?B?WXd6aHRpQkpLeVhHSzlMazgwVE5YNGRabnp6dm4xUnNRa29ueHZQb1VNUnJt?=
 =?utf-8?B?amFDcWhnMFM3SGs2VXZjOWdqRGFzS1Z6R096U3EreW9obmZEclAxaU1CTGFz?=
 =?utf-8?B?SjhPL25SRWRKR0pQWnNXdndZMDZRTE1leE4zNFNheHg5V3ZYdmxpZHVRemRq?=
 =?utf-8?B?eVhlM1JocFBNZXdKN0YrV3drOUcvTDUxSGIzZzEvUnk4WjI0U2RIeGdWVEtW?=
 =?utf-8?B?eXpiS0s1NGJteUQvTHN3R0IzMHg5UmtZam5XYkUrWFIrSDlSb282S0Q0dnp6?=
 =?utf-8?B?R0VFK1lWTFJPSGZWVGo2a3ZDdng4WjkydS9wRXdZQy9HOXJHUnB4SWdyMUtl?=
 =?utf-8?B?amQvdUR2aVg4N2FlYUptWU43YmYvM0VRVU9La0F0QlM4akhWNDMzV09JbmY5?=
 =?utf-8?B?MUxYcUJuUldtTXc0K2czWENjTU10WW1KbHE3RWtObVoyeE9KWlZXMjdQUVly?=
 =?utf-8?B?cHZvTGpYUXBjOXJlcTJybS9JZUIveVFhU3Nxa3hRMUFTUXBYdjZqSGplRGxk?=
 =?utf-8?B?THVPWUprWmQwWitrSlhDOWhOa3ppaTdXcXA5ZFNwUTVWaklIazFqOVFSS2p3?=
 =?utf-8?B?M3l6akFmdi9CQ1dnb2ZLdEtMMlJKRnp3N0tlRTU1OFo1clBlczhkalN1bkFD?=
 =?utf-8?B?UjZwNVVTMFR0R210RnpRTTJtRFYzMVprUklBL1FsQ3lQTmFLQVZ6QW1OZEU3?=
 =?utf-8?B?UHF1b3ltSDBiTmlCN09IdHNqR2ZzY0V2YUNWK3RMejIwNmJJYjhQbGlXK0Jo?=
 =?utf-8?B?Z2RUUzFVcE10VEhLVSt0YW5VR3NmNHcrVktZOEwzcVJOK05MaGdjZi9XWTJR?=
 =?utf-8?B?cW1IenFjV2F6MTE0ang0dlNZek5ReVdjY2x3QVRXdEdac3l0QVpKWkxSOGhq?=
 =?utf-8?B?U0RZU0dRRFl1S1hlaGZpZnNodDZjc2FxY2Voai96eWxWaEFFanBOQUNxK3kv?=
 =?utf-8?B?ZEFPdzJjdlBkckRlMUd4M2wrc1F0NTRrSkJjQ2gvMWtDeThseVZVeXFOT1M3?=
 =?utf-8?B?MWFUR1FLbEpOSSt0bGFGbWp5akx0Z0wzMEtsMStiZWhwcnhlS2k1eEYrV0xJ?=
 =?utf-8?B?eUVjV2tXY1RqTnFzZmRNTU1tdFhHaVAvaVBxKyt2ZFY1SlIybVNNK3MySlJ1?=
 =?utf-8?B?SUNRSlJ1SVdqRFc1SnlaMThGNFQvUHgyMWg1NWlndHRzV1BKc041ZlMwaUZL?=
 =?utf-8?B?ZHdFMzY3NmtDOHg2R081dDZoU01sdkhGYUtTWXdDdHhqZUdWMTNMTG91UGFC?=
 =?utf-8?B?Nksvazhrb2JuMEJqZkxQaGJPSXNVTGUraTU2RkxYL1BiYkRjNTUxRDNOc3Iw?=
 =?utf-8?B?UzdhNVJ0VElYUUVGNFpoV29Na0RscnRVeHlEemVsa1FjcG8wRmJLdGxxM0Yw?=
 =?utf-8?B?Tnh2NVo5N0s0K2Z5L1dtRGlQS2FkYjdoUE5LN09Xa3FGT0J5ZzRsRCtUdFZM?=
 =?utf-8?B?WE9HaHk3WjRsRVBiQmw2RlFZcFBqTUwrcmVvQW5vNWRhUy9mOEhzWFgzMWpY?=
 =?utf-8?B?QjBJZnVVUGtMUTNNUnFOVTVRSkF0RmVkMlhmSlViS3FRZktDS1FPbG83dEtZ?=
 =?utf-8?B?RUVyUGh3VW5aN3JBY0VKa013UlRxelJzQlZUZnpzZVRPQTBObE5GSXczalpy?=
 =?utf-8?B?UEpkTDdpcTJOSHUwMjV0OUlTYzg1djdZRzVWV2ZNUm0yUmJOWGlrK1dUbGxj?=
 =?utf-8?B?LzdnYSs3aHRnUWdIckZIdHg3UUlHeHVUelZGelBiVHpLOVprbnJ5ditzSHpJ?=
 =?utf-8?B?TVNGVE1RWGlhTTBWV2lJblVhY003MTJra1Y0THdlSXNhN0RvTGY4R3hvS2xC?=
 =?utf-8?B?YlhpOUMrSUNBSlZwUDlXaHRISmVqZ3hFNVJZRE1VcVpEa1VELzY2bG5RenRW?=
 =?utf-8?B?U1ZmY3A2RnFvY1ZaMVVpUWlhdVdOaWpXMGRwYWpjOFByWGtjZGJ4Zm50L0tl?=
 =?utf-8?Q?vVcfcHrfJ0sTLIE1Rl733ssKT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f74a4d-3a64-44d3-1195-08dd57a67208
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:17:34.7693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pt047JcGsYIteZzrHSrNZJuPc+5sV8ATARx/OjTIcMyKB3vnq04zTuJR8YGUUk0xKfWN/b6qm00vCo4QAcCTAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9137
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


On 2025-02-27 05:27, Peter Senna Tschudin wrote:
> Hello again Vitaly,
>
> [...]
>
>> Hi Peter,
>>
>> Thanks for the update! I really appreciate the effort you’ve put into making the approach more global and vendor-agnostic—great work!
>>
>> It would be incredibly useful to have both --kmemleak options available (for the entire test list and individual tests).
>>
>> Could you kindly provide guidance on how to add these options (-konce or -keach) to igt-runner? For example, how should I modify the following commands to include them?
>>
>> sudo ./scripts/run-tests.sh -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic  
> I’ve sent another revision of the patch that updates scripts/run-tests.sh,
> adding the -K option. This allows you to run tests like this:
>
> sudo ./scripts/run-tests.sh -K each -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic
>
>> or
>>
>> sudo ./scripts/run-tests.sh -v -T /home/infra/igt/custom.testlist  
> Same here:
>
> sudo ./scripts/run-tests.sh -v -K each -T /home/infra/igt/custom.testlist
>
> You can find the patch here: https://patchwork.freedesktop.org/series/143996/
Hi Peter,

Feel free to use:

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

for your three patches. We truly appreciate your work, and we're eagerly awaiting your merge!

The key point is that it shouldn't introduce any regressions since the -keach or -konce options will be disabled by default. Once we enable it and put CI under pressure, we might uncover some surprises—potentially false-positive leaks. If that happens, we can try resolving them by issuing the scan and clear commands twice.

Let’s see how it plays out! Thanks again for your effort.

Thanks, Vitaly

>
> Would you be open to reviewing the new patch and sending your Reviewed-by
> once you think it’s ready? That would help speed up the merge process.
>
> Let me know if I can assist in any way.
>
> Cheers,
>
> Peter
