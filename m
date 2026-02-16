Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B342E63F1E
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 05:48:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3097B10E069;
	Mon, 16 Feb 2026 05:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A9BYMPMC";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39710E069
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 05:48:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gog/gcWDuBEDWJlYbf6CUV19i7U9VG81QQy5NaDSWjgj90ZhJ4s7PnBbHPT/d4AUtwrWR14HLxPH/HntuXtfb4PEeX3sGAH547U4EyKK6XgIWZvv2eG+Kd8fUGb2wGB/B7np4mFfaNK+AQOte2sR1eoRoOoJUq0YHRbTjcPlVoHOI4bMFhULxWvoHhjSeaprnRtBm/Q6m1HUyMoXkwAQEo+5M+Z3NYAoW40BmF83+7TDjgxcpHluzSzw+Z2VhYxvdK7y69kgKBhO0Tb0jfTwkPldgZNpObas5FSzPyS54iRfcRIgHxlLNrCSipJQ6FdkpsReL/Gp4po/WqmIRFAcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nq6fvxTN5nC4I+uCjviMakFpw8XaGtmi8rK9ltZ0Z4=;
 b=L2CFB4MfaaMAySLVHsrVZDtKoOytwrq4C4KmNkIMoAA5aZqStHp9zc/lEavyRuml3anV00UlJ6FPtfm6t+QAe2X/2XSQGBmLBwhP9AghI2yskaAAJm6Ibl8p1HfoZKCk47JYrUClLhFrAYGP3Q9KhE3mocRTlHiq5ctPODWi/DnLsbC7jMGdKhMDG4eO5mOWBxrY+BwnWqSCtQ/JUMKgBqqnKf+YLKV7XMw2PgMhCIePAEepXZzxDXEa9sP0Qq2esG22t1iN/pCGkFPE1f/wk0f2N+4XRnGud7EitzKGK3AMuvL65libqAl9jAKGtZvtl1Y2q8EOMCtbSKaxSILNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nq6fvxTN5nC4I+uCjviMakFpw8XaGtmi8rK9ltZ0Z4=;
 b=A9BYMPMC/MzT05iPvPcdgy4SJJOzOKqjWxv2NWKoG4xeelNQReEM0j71PelPKIatXoQy6JNJ/OBPGrD7V49NUSTKOSUQ1mab54s4ftHQBpBGiPdRr6l+HrdcWrfx0v2ybKV0l5C48ZZX+wtz+1/fp01PXu2Mbe36Etn1+U1ECqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 05:48:15 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 05:48:15 +0000
Message-ID: <95706055-96d0-4db3-a45b-e38de2bea20a@amd.com>
Date: Mon, 16 Feb 2026 00:48:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/amdgpu: add fence wait multi packet test
To: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
References: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
 <20260211113922.11211-2-yogesh.mohanmarimuthu@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260211113922.11211-2-yogesh.mohanmarimuthu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::19) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d477dc-be5c-43b9-6b20-08de6d1efa63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHpJOEVRSkZCUEpoZy8wUGczamxJZlA2TjZrbzBYckJBVmxORWRGNVpEZ2RR?=
 =?utf-8?B?VVZMamkxbWY0NWZZSWlnRHN5eHhvVndYK28xM1U4WmVESG1hRVpabWNEZjJu?=
 =?utf-8?B?VVR3cFEzWXBCYmE5UWpidFViTVZ4UW0vRkxlYzN6QTdITnhUYzlyb3BjTGRm?=
 =?utf-8?B?R3E0SFJ6bHFnMHVjZWhmVFBuVFVKWGUzSnZjNGNMbjJseisrNjBXZXZFLzZB?=
 =?utf-8?B?MUluYURtMFhDdXFXNk8rTkpzRFRBYUsydzBvVUtlZkQ3WTdqRjd6TGpIVlFZ?=
 =?utf-8?B?bzBzS0tPaklzeUVWaGRDRHFXRU9XdkFueWwwcFlKSGRFb1BudWtCd3puOXBS?=
 =?utf-8?B?OWQ2ZFo0bE9JNXNVaXp1OVdGV1Zaemg1WkpUVElZUzBaWGYrbFpicGFYNHd6?=
 =?utf-8?B?alBYcXNld0lCZ3hjb1VqWjkyaW9ONkNhY1VOa2x4M1JzcVVnNnVYblYzbU1O?=
 =?utf-8?B?T0xxb3hqK2VrTHgrOWEwK0JPbGtuMlg1eGtKa1R4UnhtSXNvakRMcUE4RUFU?=
 =?utf-8?B?Sm8yTEQxUDRwTnF0Vk1vV09OZFVNNzRVenJpKy9XTzNYTjRlbHFOaEU5RmZs?=
 =?utf-8?B?UlRqMkFMZEZkcmRyNWVBSTEzdzFjRTZrcDFIdlYvZ3VTaHVZd2QwWnhlVTVo?=
 =?utf-8?B?NUVERmFzZmxUaXB0Qkdhd1Z0d2FJWlM3dHlNMWcwN3JsYjBkMXU3eHE2eTlM?=
 =?utf-8?B?TW5TVEdSM1lWUnZhQkRHdEtUcnI3SlRwOXVnNXp5bFZqcVkzK3IzMC9PdjUv?=
 =?utf-8?B?S3ZBWm1ERGpOOG40Z0J4TEw3dTJlWEtMcU9KZVRRU1lDKzA4MU5VYmFSUUZx?=
 =?utf-8?B?TUNCTUV5S2FVZjBldUhJbUhVTW1nQTlkRnRQQTRYSjlTM0tOT2Z2Z3lvVko5?=
 =?utf-8?B?OUp5cmRSWnIwZThCOEwrV3FhZDBvQi9iaVVGZ1k1Y3pSTDhmWWdFT0pYcTVY?=
 =?utf-8?B?MkVIMjBLYVBRbEZGbGJsdTlLMHlCZWp0ZzRoRlJmNlRMWC90Qy90QVNHKzFz?=
 =?utf-8?B?RHFuYnByNGlrU2pBeDByRlNTdDNsV2NGRXA5c0x0NEp6djd1eXB1SXVod1JJ?=
 =?utf-8?B?UDBOZ2N5NmJmaGx6SGpMTDZITGkvdEhmUVlJQ1pKMzcremo4NFRaZHY2YzlK?=
 =?utf-8?B?aDhUMFdWM3lEaitiU2JpVjA3MFJpeGEzN3F6NnJGTFA4R0lLRVI2UlU4VTIy?=
 =?utf-8?B?clJjS2lXT2h6VlRTeERvZW1FSWNqMlNucGRCNzE5eERlaU4yRGxhTStGTmhq?=
 =?utf-8?B?ZGVVOHFzVVVaNXBuRWhPMFRUdnpOSGViSXNZYmJpWk8ybnZmdWtUSUtBU2Uw?=
 =?utf-8?B?NVIxR2Nha2c2L0Q5eGxib0s1ZXBqb09oRUFpbFVjV1NlaGdWMTlmMllvdmRC?=
 =?utf-8?B?bUp2UjQwaHZ0Qy84SXBFOWpPWUtOOVprenYycDBIZ0ZocFpNUXlPZjhoRWpm?=
 =?utf-8?B?bklCdWpKN3kvd05jbTREdDU3MFo4MEZuNDF6R0IzNEhOTjhYQUhTUkM1bFA1?=
 =?utf-8?B?aEl6dlpIZWZHd0pEaUlvd3RUYXlVbitUZ216L2Qzb25Xc0lwK3NEVVRxU0dS?=
 =?utf-8?B?MUtHZDduTitPYjh1a2YrZ1I0MUtua3pmMDNNQ1p2UW4ySlY1d05DWEs3SGhL?=
 =?utf-8?B?QzRBWXExbDMvUTQ5U2JTWWtqOVJON2JzUDdLazU1V3oyZXVPQndCV1ZvNHB6?=
 =?utf-8?B?eFhtWDJrTEFSVUdpb2RSNks1OEUzd3UwNnBWQXR1NkdHVHJVVUZDWkJWR3lq?=
 =?utf-8?B?citaTm5LL3JzT2dwSjdDVnlYSmlydUVTUW0xcG1veGZQZ3o2b2dzWWx6NytY?=
 =?utf-8?B?WGdPcy9aRVdZWXdIQ2dJeFo0eDJKY3cyWWhZS3pJQ3hvV25YdFlzQWR0Wndn?=
 =?utf-8?B?M1VyQ0NUYko4Q3BrblNkRG9ubW5CREM5UFZtUVlaRFVEeVd5VUtvK2dLWEdL?=
 =?utf-8?B?THd1Qi9uNGRNSWRLQWY1SzZxTlZSak1vSFZVd1Y0VmpkeUhEcWtUTG1tOE4w?=
 =?utf-8?B?YmlZcjc3eUVCdWFWejVSMFdLYmJKZ3pvZE45dlNjN250Wml1QUJEQTZxRjdO?=
 =?utf-8?B?cG8reFllMTVZZGVWaVNZWWlDV0FPVVowN3RuM0xYWnJsa21icW5Xa01kY1Mw?=
 =?utf-8?Q?jmFw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3RpZlllU0JMU25JWnRzQ0lWOEFRa2RmNHZBMmhBaXNmazRhZldIL3E0ZlJJ?=
 =?utf-8?B?dUdWOTR4MHhsYzVBTmVtOWsrQVZ6TittUXo1VlBMcDN4NWlyU2o2YWRkZTB1?=
 =?utf-8?B?MFg0RjZZWXVMM1BVOWc5bEtYYTBCUlhUeUN6QnltUTVPY3piYlBvR0xWZWhz?=
 =?utf-8?B?Sm1Nd3NRSDdUa1RPbFNQVExEQU8xaDBDZXRUWks0RHl3T2o5Y2xqVmhCN1VL?=
 =?utf-8?B?UFRCbFl4RjNUYjB5aGJ3V1NWWFB4VWdKcHBCdG1xQ2JKakVtTUxmUUxkckVP?=
 =?utf-8?B?eFJWc1FmcHF0andJSmxxNlo0c0hIbm9CZXRYUE9idDVibmtQNXp3c1M1VTR3?=
 =?utf-8?B?dnVKK2Y2b0JDbFRxQlZIK3IvcXdDSVNlWkxOeTBTb2dLdlpNcUgwczlCb2tX?=
 =?utf-8?B?WEhKTHJLcklCQm9HQXhJQzJYU0ZBTHNNdGd0ZWdINnUwamxoa1VFYzdFZHJn?=
 =?utf-8?B?V1dOM3BEOE1vbWVRMHFlQ1I5b3lzdUtvNytVUzUveURNVzVEUWFZaDlKWlB3?=
 =?utf-8?B?V0hFTUFPRWZLN0ZkUWxuanFmNkZoYmdQcTZvbUYyN2hycmE2UXBQVXRlVDN4?=
 =?utf-8?B?cVdycUJvaFFVVE9jaHp0b3BDcTh4Y09vYXNOT3M2RVdCSEw4MWlaU0YrendL?=
 =?utf-8?B?WFZLOXFmekFNNE04K2lhVlBLN1lLUG1yNk5zU2h3WHJIcllJSU95aFpQRDRV?=
 =?utf-8?B?QUNLb0RRYzcxeGlSNSt6ak80bHo2YVE3L0pIUmlKd0liWldUaWJEYUVicExj?=
 =?utf-8?B?Rm14TnllWmg0Vi9nMnVLYURWQ0Zabk43RXM2NWZwMXFnTVJsOFZDTEtULytk?=
 =?utf-8?B?V3BXajl0MGhOc21id0ZRTU8zdURGQ1lWdDk3RDdQbjBhUTF4VEpiSll5bGRz?=
 =?utf-8?B?a3htTjlTZGZLK2lpNTU4Y1k2cnpNZDFjMnNDeGNCMnNqNkVkUkxlajI1elJW?=
 =?utf-8?B?UmxqT3FrRE1RcE9kMHJRSVFRdjBBanQ5YmNTeCtDSGprK3JaejAxUjRRRHVO?=
 =?utf-8?B?c1hSMW85QWprVzM1QTlieitIV21JRUc1NHdEZ2k2WnYxQlpIN3U5NWVCektk?=
 =?utf-8?B?VmNTNHo0b1FlZzljQ0dVcCtQWHZObXlHR3hNUnpIUzVEbXBWRGszQ3YxajFv?=
 =?utf-8?B?VlVtalo4bEEwMDFwYWw4M2FLbk1iYlNwY3NoeXJpTTVLTDlVNlQ2WWMvWUs3?=
 =?utf-8?B?K1dlSmQ1VTNqNXVQSlNLYytPc2x4WGJRS1dUWHZ0MTVTa1VEcHlYZHpwcUI2?=
 =?utf-8?B?WVdXRzA3NmtmY2tTZmY5bWdpY3Flakc0QlN1S2NFUnF4NnFEdlhTRzVpZ2VP?=
 =?utf-8?B?SHNKUERXejZyY3pRelNiS0RZOUY2NHpjNi9lS2lVRFFFdDVYNUlaKzFZVzN2?=
 =?utf-8?B?bnNkTXcrOVB0REZrZWl0aTZNdzBJT1BhVnBldFhiT1U2U1RGQ3JHSWVGYi81?=
 =?utf-8?B?eUw1bjh6bDBWUXFhNWlmc1U0OUI5SFF4ZW1Ha21hSE81dHlWWTA0dlFrVk5s?=
 =?utf-8?B?T0Z5QnhDTTdKY0p3OC93QUZpOXNQKzllblNZOEZPN0RLRjJKTXJ3bXpkVDll?=
 =?utf-8?B?eUJ1b0FuenpyUUFXNlhKSDdneExLanVZdUQ4dzlqTlg1UldaRDhJMmg0UWEw?=
 =?utf-8?B?QU0vZFN5TEZpZDl4NkZzUXVnVHk5T3ZjV2tFNkI2SzRvbkEyNmRWRW1CTjZC?=
 =?utf-8?B?QzNXSFNyeDIwUFdjRGhKbmEycXlYaFNTZDFKR01Gamtpc2xENzIrREtHZVp2?=
 =?utf-8?B?dnhkZSsweDBIMlo1cWZLK3dIclp0MjBXZXRZOUFYenNMMjZXek51dC9acHBE?=
 =?utf-8?B?dHpmT0tncDBwQ1dOMDB5bFNUWGdsbEM2SEpoekhyZ1Zjb0llcmlpeFlubUQ1?=
 =?utf-8?B?QUMvS2dGekpMOEVWNmZRWnA0dDNlYjRBN2l6WmVNeXloSDU1eVVzY0piMzdz?=
 =?utf-8?B?cWtMTWtLQnpTeW00REs4WFUyUHVrMm9ybFhCRXRyNTFLSkVobWZNSjU4a0NR?=
 =?utf-8?B?anFPZnoxZ1Y0ckxJR3hoMmJZeUNPanVSQXgrQmQxY3c1SEJNSFFRaytrYjgx?=
 =?utf-8?B?MDFuNk1TL3pnMU4yTjRDWFI0MnNqWXk1SWI1Zk1hTkNFMnJDOXFUQW9HTXc4?=
 =?utf-8?B?YWxWRGdhSjhXeDMveURXNi9rU0JjTm5ZcXR1OXEyLzc1RVVscCtBai9ZWkY2?=
 =?utf-8?B?K2tPQUw4OEt1bGJDSVJxdGsvN2tJdWE5NmR3TW9XMkcwQnJPQWM0elQybE0w?=
 =?utf-8?B?M3RsNVhIYVVYWVl6OEdSWTZ1ZXoyYXNzakhCbXZqLzV6Q2J2VWY3LzloZmpD?=
 =?utf-8?B?aFIzaDB1L0N4TGtoZ2VyMWVubWlVWHZlMnFTNWU5K2U1NXRpSGw5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d477dc-be5c-43b9-6b20-08de6d1efa63
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 05:48:15.2286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjBKnkMCeK+bcBCzARKE9B1zOe+BmZE33ipNOI6J00LAHb91Ttlxmlfj4V+TP+vc3TH/SKJhevVyQpjDjDMygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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

Please see feedback  below.

Also please check formatting. 

Please add test description .


Other things looks good to me

Thanks, Vitaly


On 2026-02-11 06:39, Yogesh Mohan Marimuthu wrote:

> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 184 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 184 insertions(+)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index e57eb7969..0ef940bbe 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -5,6 +5,7 @@
>   * Copyright 2023 Advanced Micro Devices, Inc.
>   */
>  
> +#include <pthread.h>
>  #include "lib/amdgpu/amd_memory.h"
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
> @@ -13,6 +14,7 @@
>  #include "lib/amdgpu/amd_gfx.h"
>  #include "lib/amdgpu/shaders/amd_shaders.h"
>  #include "lib/amdgpu/compute_utils/amd_dispatch.h"
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
>  
>  #define BUFFER_SIZE (8 * 1024)
>  
> @@ -662,6 +664,172 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle, bool user_queue)
>  	free(ring_context);
>  }
>  
> +static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
> +			    uint64_t timeout_ns, uint64_t check_interval_ns)
> +{
> +	struct timespec start, now, sleep_time;
> +	uint64_t elapsed_ns;
> +
> +	if (!ptr)
> +		return -EINVAL;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start);
> +
> +	if (check_interval_ns > 0) {
> +		sleep_time.tv_sec = check_interval_ns / 1000000000ULL;
> +		sleep_time.tv_nsec = check_interval_ns % 1000000000ULL;
> +	}
> +
> +	while (1) {
> +		/* Check current value */
> +		if (*ptr == expected)
> +			return 0;
> +
> +		/* Check timeout if specified */
> +		if (timeout_ns > 0) {
> +			clock_gettime(CLOCK_MONOTONIC, &now);
> +			elapsed_ns = (now.tv_sec - start.tv_sec) * 1000000000ULL +
> +				(now.tv_nsec - start.tv_nsec);
> +
> +			if (elapsed_ns >= timeout_ns)
> +				return -ETIMEDOUT;
> +		}
> +
> +		/* Sleep if interval specified, otherwise tight loop */
> +		if (check_interval_ns > 0)
> +			nanosleep(&sleep_time, NULL);
> +		else
> +			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
> +	}
> +}
> +
> +static void* amdgpu_fwm_test_thread(void *data)
> +{
> +	struct amdgpu_ring_context *ring_context = data;
> +	uint64_t *job_start_write_data_ptr = (uint64_t*)ring_context->bo3_cpu;
> +	uint64_t *fwm_fence_ptr = (uint64_t*)ring_context->bo3_cpu + 1;
> +	int *ret = calloc(1, sizeof(int));
> +
> +	/* Poll to confirm if job has started. This is done to have low timeout for fences
> +	 * wrongly satsified check.
> +	 */
> +	*ret = wait_for_value64((uint64_t*)job_start_write_data_ptr, 0x1, 2 * 1000000, 1000);
> +	if (*ret)
> +		return ret;
> +
> +	/* Poll if job completed without fence satisfied */
> +	*ret = wait_for_value64((uint64_t*)ring_context->bo_cpu, 0xdeadbeef, 100 * 1000, 2000);
> +	if (*ret == 0) {
> +		*ret = -EINVAL;
> +		return ret;
> +	}
> +
> +	for (unsigned i = 0; i < 32; i++)
> +		fwm_fence_ptr[i] = i + 1;
> +
> +	*ret = 0;
> +	return ret;
> +}
> +
> +static void amdgpu_fwm_test(amdgpu_device_handle device_handle, unsigned ip_type)
> +{
> +	struct amdgpu_ring_context *ring_context;
> +	struct amdgpu_cmd_base *cmd_base = get_cmd_base();
> +	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, ip_type);
> +	int r;
> +	pthread_t fwm_test_thread;
> +	int *thread_ret;
> +
> +	ring_context = calloc(1, sizeof(struct amdgpu_ring_context));
> +	igt_assert(ring_context);
> +	if (ip_block->funcs->family_id == FAMILY_GFX1150)
> +		ring_context->max_num_fences_fwm = 4;
> +	else
> +		ring_context->max_num_fences_fwm = 32;
> +
> +	ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
> +
> +	/* Allocate bo for dma */
> +	ring_context->write_length = 1024;
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle , ring_context->write_length, 4096,
> +					 AMDGPU_GEM_DOMAIN_GTT, AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +					 AMDGPU_VM_MTYPE_UC, &ring_context->bo,
> +					 (void **)&ring_context->bo_cpu, &ring_context->bo_mc,
> +					 &ring_context->va_handle,
> +					 ring_context->timeline_syncobj_handle,
> +					 ++ring_context->point, true);
> +	igt_assert_eq(r, 0);
> +	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
> +
> +	/* Allocate bo2 for ib */
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, 8192, 4096, AMDGPU_GEM_DOMAIN_GTT,
> +					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
> +					 &ring_context->bo2, (void **)&ring_context->bo2_cpu,
> +					 &ring_context->bo_mc2, &ring_context->va_handle2,
> +					 ring_context->timeline_syncobj_handle,
> +					 ++ring_context->point, true);
> +	igt_assert_eq(r, 0);
> +	memset((void *)ring_context->bo2_cpu, 0, 8192);
> +
> +	/* Allocate bo3 for fence wait packet fences */
> +	r = amdgpu_bo_alloc_and_map_sync(device_handle, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT,
> +					 AMDGPU_GEM_CREATE_CPU_GTT_USWC, AMDGPU_VM_MTYPE_UC,
> +					 &ring_context->bo3, (void **)&ring_context->bo3_cpu,
> +					 &ring_context->bo_mc3, &ring_context->va_handle3,
> +					 ring_context->timeline_syncobj_handle,
> +					 ++ring_context->point, true);
> +	igt_assert_eq(r, 0);
> +	memset((void *)ring_context->bo3_cpu, 0, 4096);
> +
> +	/* wait for gtt mapping to complete */
> +	r = amdgpu_timeline_syncobj_wait(device_handle, ring_context->timeline_syncobj_handle,
> +					 ring_context->point);
> +	igt_assert_eq(r, 0);
> +
> +	/* assign cmd buffer for ring context */
> +	cmd_base->attach_buf(cmd_base, (void *)ring_context->bo2_cpu, 8192);
> +
> +	ring_context->job_start_write_data_va_addr = ring_context->bo_mc3;
> +	ring_context->job_start_write_data_val = 0x1;
> +	ring_context->num_fences = 32;
> +	ring_context->fence_info = alloca(sizeof(struct drm_amdgpu_userq_fence_info) * 32);
Please avoid local declarations of 'i' 
> +	for (unsigned i = 0; i < 32; i++) {
> +		ring_context->fence_info[i].va = ring_context->bo_mc3 + 8 + (i * 8);
> +		ring_context->fence_info[i].value = i + 1;
> +	}
> +
> +	cmd_base->emit(cmd_base, PACKET3(PACKET3_WRITE_DATA, 3));
> +	cmd_base->emit(cmd_base, WRITE_DATA_DST_SEL(5) | WR_CONFIRM |
> +		       WRITE_DATA_CACHE_POLICY(3));
Please use upper_32_bits lower_32_bits
> +	cmd_base->emit(cmd_base, 0xfffffffc & ring_context->bo_mc);
> +	cmd_base->emit(cmd_base, (0xffffffff00000000 & ring_context->bo_mc) >> 32);
> +	cmd_base->emit(cmd_base, 0xdeadbeef);
> +
> +	/* satisfy fence wait multi packet fences in separate thread for checking if fences
> +	 * gets satisifed incorrectly.
> +	 */
> +	pthread_create(&fwm_test_thread, NULL, amdgpu_fwm_test_thread, ring_context);
> +
> +	ring_context->pm4_dw = cmd_base->cdw;
> +	ip_block->funcs->userq_submit(device_handle, ring_context, ip_block->type,
> +				      ring_context->bo_mc2);
> +
> +	pthread_join(fwm_test_thread, (void **)&thread_ret);
> +	igt_assert_eq(*thread_ret, 0);
> +	igt_assert_eq_u32(*ring_context->bo_cpu, 0xdeadbeef);
> +
> +	free(thread_ret);
> +	ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
> +	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
> +				 ring_context->bo_mc, ring_context->write_length);
> +	amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2,
> +				 ring_context->bo_mc2, 8192);
> +	amdgpu_bo_unmap_and_free(ring_context->bo3, ring_context->va_handle3,
> +				 ring_context->bo_mc3, 4096);
> +	free_cmd_base(cmd_base);
> +	free(ring_context);
> +}
> +
>  int igt_main()
>  {
>  	amdgpu_device_handle device;
> @@ -811,6 +979,22 @@ int igt_main()
>  		}
>  	}
>  
> +	igt_describe("Check-GFX-CS-FENCE_WAIT_MULTI-packet");
> +	igt_subtest_with_dynamic("cs-gfx-fwm-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("cs-gfx-fwm-umq")
> +				amdgpu_fwm_test(device, AMDGPU_HW_IP_GFX);
> +		}
> +	}
> +
> +	igt_describe("Check-COMPUTE-CS-FENCE_WAIT_MULTI-packet");
> +	igt_subtest_with_dynamic("cs-compute-fwm-UMQ") {
> +		if (enable_test && userq_arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("cs-compute-fwm-umq")
> +				amdgpu_fwm_test(device, AMDGPU_HW_IP_COMPUTE);
> +		}
> +	}
> +
>  	igt_fixture() {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
