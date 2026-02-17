Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1DEE83848
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 04:46:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E0410E1BF;
	Tue, 17 Feb 2026 04:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UG0AlVPm";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012070.outbound.protection.outlook.com
 [40.107.200.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E2010E1BF
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 04:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXdd3vAotAN9PwU4IJu8vZ2qKV0AFSSpQVWnZQ9/V/b+YXP8Iwyt58GXmNlggu8zr37/CIg3skF1y9d18bG6yVmBPkVZkUDSQwpXc6/NMEg9Ail+zfSHiaUSmP+mo94xWs6/O4nqke2+fnrqKsj1rQ2eS80yRLTbGSVhXOfanEW+ebafYZJgxmyp16ezQ9L5fulIc9RUAdoIbZ+pgeyMkRnHTCdR6VuYgbOAaAHFrqfDuOau8gdcQ30dcoRfBLW69RWe1DB24NctABUg00mRkOFMR9I3x896Vw+6b1XJZ+ZegLc7RUyU/Cry054xSLQ0RfhExl3R26iDXyCaEE9eUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4z60AEY82Tu0kBOwRYX7fdxnp0ZgMmwa/o+s5LEAd8k=;
 b=Eal4mxDtl9HDcdwm7YqQA829Q01AjbPOxi0ow4EPNIMNBwC19ViTO08HVUEibrxp/ORdi18f1EPTPrc44tjA/fe/VSImrg8H0ODRNPOacWrGILGmsFNF9q5Towg1kNEMBFGf4KNB9XbEYh30smxNE1QvPK7MITfjtTIr4J9DvEidGxw0CeuuIffFTOdkosjkdBWZGvn7Ogw55uZUfAWGN7djP29tp5Z/eBUrEhCf2xZNC7FpKV9AFX19zRkyjr32hLFxXp06icvVyqkVPbuZQm8+Vm7guMbgqndgzTyEiDJYsreX+EuQHdE6oHycBjPaqdD0UxZwBSef/RWPXeh1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4z60AEY82Tu0kBOwRYX7fdxnp0ZgMmwa/o+s5LEAd8k=;
 b=UG0AlVPmCm8zNBB0I69UfM+/vR0eksWtg13U+HFGZ5qL34+RRAPaByFonq+UOkR6jk2vv33vkYprzo+vYud1MJhFbtQQGoxW/r2kXZjJHoo7XyiFeG7JDnmOTQptNt8VjziSPiQkyIXbKOl9k6mzIrcM6FZatNtjypljBrwZ5xg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 04:46:48 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::3129:67e7:f119:5593%5]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 04:46:47 +0000
Message-ID: <b0d2511d-a4d0-44d9-8af5-ccfc701a0794@amd.com>
Date: Mon, 16 Feb 2026 23:46:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/amdgpu: support FWM packet in user queue
To: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com
References: <20260216094506.36506-1-yogesh.mohanmarimuthu@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260216094506.36506-1-yogesh.mohanmarimuthu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::29) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 15df6811-3e3f-4dc9-54bb-08de6ddf8d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0hhZXhGaU1GM0xKYWJaNEd6Z2phaThuZ292clJuZWZpQ3RhbjR4VSsrd2g0?=
 =?utf-8?B?M256dUpyK2NIdWdwQmNPajRVR2dGbFBKdVh2THJMSFNDbldkb2pHRnV5WjI0?=
 =?utf-8?B?MERYM29tbmpTYkRxdDF6ei93c1FUQXZHcHMxY2hnYnYrMFI2Q1JBK0U1cnB6?=
 =?utf-8?B?MGpSaXlhRUw5YjZWV2ZCV0VpRGI3THQwa0RMYXhMcVF4b2JWRGtEU1FjK3lj?=
 =?utf-8?B?K1dsOThyVTlKamN1aXM3Q0haWTQ2dFNqTHNzRmhZSGpyRjZ2S0t2MnZjV1JZ?=
 =?utf-8?B?aldweEZGTEJGc05Xb0dlNUc1eWttTDJjampWbTBRdkxVQjJPZWNLUm9VMm50?=
 =?utf-8?B?bE51Q2hKT3FGTGw5ZnZ0eXFJeWoxT1pIT2NmT3ZBTWtiNUlyT0plcHFwWWhH?=
 =?utf-8?B?dzZBMFpRMWlYYW0vekg4M21XQzZjOUFHdkZtSzluR3FkYlBHMWYwN2MxdFY3?=
 =?utf-8?B?UEM3ZmJsM05WQ1BIOUFTR2FBRzM1cXMwNjdhSmd4czZ6a2lIbjhLUThRWmZN?=
 =?utf-8?B?Z1RkYTMya0x0cjBxWGJJN1RoaGFMa3hkMVNYbEN4VC85UHFnb2ZjVC9OTXBP?=
 =?utf-8?B?OFJyRGVjYWsxOTNKNHJHTkV4a1cxclB1Wnk5YWFGeDJzYk9PR1J6R0JqTGNP?=
 =?utf-8?B?emttYVVUcHA3RWgxNE1HM0pQVzFkMkZiRGk0Q2x2MFQwU2hDc2ZEUE1VdjdC?=
 =?utf-8?B?RXFuUGFXYVMxdU5BT3ZsZ1o5TXV0c21hcU9HekV4RUNMOExuNEJmOEsvMHV3?=
 =?utf-8?B?T0dLOEZIbUxiZDhRSVNzRHgrQ0VtVE9PQmo3L3BIeks5YkRLTnVKRHRSbFQ4?=
 =?utf-8?B?SFZBN3Z2ellJWVhOK00vZlZ1azRvK1VNbWZEZUN2QTlMZzZVY2o1UXdIRXVV?=
 =?utf-8?B?bzR3cFNFYklxQWRzOGtLVzMwcHhDcitYY0Q5L01SSXp0MVRibllmMXlMQkhR?=
 =?utf-8?B?WnJPMVg0TFUwNHM4THBpVDFUYXJDeXhOYXRqTThIaFYzNElINDNkcFlqUFFO?=
 =?utf-8?B?OWNTVHRHV3lDMWtuRXQyRE9Db1JXaGtMN2pWSDlwMmM1b3lWc2psY3Jvbnpz?=
 =?utf-8?B?djc1SHNrem5JYTJOdWFnMlBpUHdWZFMzWGV5cVVOZFIzWTZ1c2d4MUNDK241?=
 =?utf-8?B?NS91Y3cyS0J5bVFiV25pUnN3OXNZMW5rTjVra1N0aEIxR0RuVmY3RStHOCtq?=
 =?utf-8?B?bnJZMXJQN3lmL0FxY3ZwV1RISDVmRWpEUUh6TGJ3Wml6cUZIeTZFUnBtQ2RG?=
 =?utf-8?B?Rno5VUg1WVkvS2QvRGVkREZuUXRIM3B0OUNhUlpkNktyUk02Z2VIUGJuZ2RJ?=
 =?utf-8?B?TEwxSDdrc2I3cm5nZEE3REViSmFUTHZ5WTJiY0FaVWJXby8vMmZJL2hTTmMy?=
 =?utf-8?B?UDVpVndtNlpSS3pBTm03SzVNQkVnMzNBYllPRG13TXNkY2NwdEVJR2pIYlpm?=
 =?utf-8?B?Ti9TM2E1SnlhUTNpN2ZBTUlKb0U3anM0a01lNHdtOHRIVHVtaWNjcVNPVXEw?=
 =?utf-8?B?Yjh2c2VTZkY1MGtlTmJqL1NGVUh1Q0VPWVppKzZrQzdVUlpHRDc1RTliQ1Ft?=
 =?utf-8?B?am9QWlAvYVBobUtKVTlyQ0ZWZ1ZRQ2hHSHp6TWFvUDVJLzBEOTFWTkpTdjZr?=
 =?utf-8?B?N2lZNTJvRE5LSUN6NDczdVdEVFgydDNNcms3ZkV2Sm1JUTREYXFKQnlTa2Ry?=
 =?utf-8?B?N2NCSU5sY3N0Z0pkUmIrUHhXQjdiRUxqS2V2N0g0UVRWT3M1bmRiRm9JV1Bm?=
 =?utf-8?B?MisrR2ZvTnlld1ZOMjFoeHlPaVc5akZzQys2K0t3TkYrTGZlRmh5aE9mUFBx?=
 =?utf-8?B?ZXBrYjRRQ2YwWHBuMThXeDEya1M5bmJ3Q2NDY0VwZnByU2ZUcko0YTV2UTZu?=
 =?utf-8?B?eVpkU0I5cHBWWG1JYm10eXBTbis0N3NJYUdhSzU0ZWl1eFZlaXFnTzUyQlBj?=
 =?utf-8?B?Tm1tUWNEWDVGT2N6Y0s1cEwxNW9CRFVQbERkbGs1RHhaY1Nnd2tobmRTZVVs?=
 =?utf-8?B?Z1pXaGNobnFUcUVhQ2h5MnVYR0hkb1JWZGVIbWZEeThFbzRZQVJuKzJCUzRl?=
 =?utf-8?B?NU9HelF1TWx6cDdyNC81Q3gxOWVZbFZ6UmEyOHNhYVhvWkFlVUlIVHZhYW51?=
 =?utf-8?Q?uwd8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtGdnFKM1p0MUQwZGdlZDR4aVprMkVMeVBsemZJNTQxTkNNV0VLVndKb1FM?=
 =?utf-8?B?TUJqNko2WlR1UG00Wm5teCtCeDRLUWhsNS9KaGRNSjN1RkhXZ3I0ZCtlT2o5?=
 =?utf-8?B?TE5xUHVVWm1EZjZibmhUWXpRNVB2R2RNbGpZK2ZkTzdlZWM1TmM2TmFnZ1Ft?=
 =?utf-8?B?bGFxcjFyZW5INjJBS2hkOTJYY1JQSWVyU0dtWkJQTWFLWXdMakFlWmF6cVJM?=
 =?utf-8?B?VGFzUWlRRlpDbzhsNVdGbHlhUTBmaVlWUVQ1ejY3QS9oU0U5L3kxaWJBS3U3?=
 =?utf-8?B?anJvSU1HQ3RwL3NrS0kzbFc5enB6L1lOVHo4bnlZeEI2cnl1cG05bUFRT1Iw?=
 =?utf-8?B?SzNmWG1HdTd2eXh6UGdtMlpudkt4NHl3TE5ZRFRoUzRVajdWdDMyUFliUXJx?=
 =?utf-8?B?eThCVG5rWWxranlNSUNsTFhYQ2Z1V0Y1Ynp6bjVWeElWbytabnNBZlhCSjNJ?=
 =?utf-8?B?cGVCTFhlemp3SzhqdVJDYXBuRUlKUGF1Qkp2amJoVUdBWDNSWXh4ZVlySWF5?=
 =?utf-8?B?Vk9xamZhNHlxYW5EQnRjVVNEeTUrSXJyZ25zSk1zYzlLRFYvU0gzTHloQkhy?=
 =?utf-8?B?d2tUTjJTQ3VrWm5Ha01PbGlmQVF4TlZTY0xqNFdubVJvUW1hTGNpc0srSCtP?=
 =?utf-8?B?NG5DSU00NDhkTWFjbmpFZEwrRmJqVkllajFwVDBhUFpyd2ZZKytlQUJFdERi?=
 =?utf-8?B?TXJXb3lEMGxOK3cya0JRYk1SSDhaQUd5dE14cGdRNVZDUjZkVCtqdll2VHhL?=
 =?utf-8?B?RS94SzYwK1RCNFRiRFVrbmJyVGUvMmFSc1BGREZwTVd4cFNKZW1DTFV4UFMz?=
 =?utf-8?B?SzQxM1VqdUx2YXkrYlJ4b3VzMjVTVEhqUS9NakQwZmRnNUdPczVKK3FkZ3Fr?=
 =?utf-8?B?dGJFL25nQkVkT0szRmp4ZlNyZ3FyOTdoK0J2YjZhN0xqNzhCQVZaZ25vcEk3?=
 =?utf-8?B?ZWJUUGhnU1ZsVXdBY0JWL3ViVjBoOW1KMnFHSkt4akVhTDdPVFNiUDlEY3hR?=
 =?utf-8?B?cXMwL3NIU1ZvcUg4VFdRT3F6VWhMa0RPek53WXh2eHRaV2ROZW5SSmdjSWJ0?=
 =?utf-8?B?bU1tWDNVbDdzVERXYlFtakZSV0d0NzViM3pTNzhPWkhPVUFocW9teG1UVEkx?=
 =?utf-8?B?SkVjQkViK010OXpZZXNKb2ZqWnRnVTBDVFFNdEwzSkxnbXNwNE5GSWp2OUVl?=
 =?utf-8?B?UWk4Z2h5MVZNUXQ5UnpyV0JBeWFRdE81VFBmdVpuQjFSQzhXcmR1N2NESTVt?=
 =?utf-8?B?N2lKQ2w0RnZUVitaajdlRzhMNmlGWjRIRXRGd3htM1NKTmcyQkdOZU5wK1lP?=
 =?utf-8?B?dURZVDlRbGNUQlFBbUlMWVI3QjFXTjE2UXNzR2MwL3F2TFpycnJZdDN0bDNh?=
 =?utf-8?B?MXBPZTRzN2cybDlMamRkRkVzb1lLUDNlOGRPYTV3b28wdEtQUkFyNWRRc0V3?=
 =?utf-8?B?NHE1VXRJMk9ZT0VvVmNUVlRNNjlPZWVWcXNVeHFFZncxSXBEZ1NSenZpalFo?=
 =?utf-8?B?SE56M3J3T2dSWUUxYitxV2EwQTR3NzF0RU4zeDlzOXdRbDJpM2dxWE9kdS9t?=
 =?utf-8?B?Zy9QaXc4cWVDRzhXNGdNUDlLT0svdVZRR0R4VzVQR0R1eFlWSzA2YmJzUnJp?=
 =?utf-8?B?akVxNFdZMzU1SW9mS05uK24zVkIrYU9TR056Q1VhKytTeHgxZjN5aS81c3FN?=
 =?utf-8?B?WkFPK29tM0VVUENwYXllK0JuSm1TeVhWWlRYcDdiMnh2ZjhwRnpmS3RjSDc2?=
 =?utf-8?B?cm91ZEdtWGNabGU3TG54SHRYd3pjTDB3NVpQZmZLM3ZsbzBjWmNCTDFXVUF1?=
 =?utf-8?B?NWtJUGNBMlJNc2lHSFhzSnBMTXVJcFVrSjFQZGlCRjdiditDVFpDMm54N1o1?=
 =?utf-8?B?Yzl6MU5GTnRteHhWRjY0NDB6N3NzWEY0aFg2TlJEaFdadlZ6YXNLcXBnOTJu?=
 =?utf-8?B?dUtubmRHZEpPcGhVNmNZemk3YVNUVnhkVGRtTWJDNU9iRXF3YXVwdVZzakI4?=
 =?utf-8?B?UjVjRlFod3hhTTFKemtScVFHUkFVSUJXQkJ2SXpHQkF1eTJOTkp2MjQ4ZnRN?=
 =?utf-8?B?UlZUVUEreXFoUDJxbmFPYUh3Tkw0ckRENGNkdVh5dUQ4MHBmNXNmUkFmeU1k?=
 =?utf-8?B?UzNjVmticlFhN3dpNnJUcm90d0J0bnV3aUY0SWpoSVRzVi82ZVgzcG1iWTR0?=
 =?utf-8?B?S2Y5SlhpUEFWR20wSjErSDlwODQrbnArenJZQU1nTDNpTFVlZTFqaVlzVE5N?=
 =?utf-8?B?VWVWbG9ZbHhPRXFVQ2xNUWk0RkQwZHBWKzVBaWQ5SFdzN0VzQ0ttbFZJMkda?=
 =?utf-8?B?cE5OZHF2bnU0RHU3MHBCL3FaeHFiMW15TkdJUEZiMjFtMnpuSUMzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15df6811-3e3f-4dc9-54bb-08de6ddf8d4c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 04:46:47.3702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTr+wOqlG6B+x3iq1sp7Sx1Pi8uvDMLSBvsYgQKi12warsjOZ5JlaPMu+3ColXgeIQ4lXJG6nrz4u87ETE+00Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527
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

Please address the comment below from previous response

Thanks, Vitaly

On 2026-02-16 04:45, Yogesh Mohan Marimuthu wrote:
> Also add WRITE_DATA job start marker packet optionally. This can be used
> to know job has started and make FWM packet negative testing timeout to be
> shorter.
>
> v2: keep all variable definition in begining of the function.  (Vitaly)
>
> Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
> ---
>  lib/amdgpu/amd_PM4.h                |  6 +++++
>  lib/amdgpu/amd_command_submission.c |  5 +++++
>  lib/amdgpu/amd_ip_blocks.c          | 34 ++++++++++++++++++++++++++++-
>  lib/amdgpu/amd_ip_blocks.h          |  5 +++++
>  4 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
> index 8f59b4223..923826656 100644
> --- a/lib/amdgpu/amd_PM4.h
> +++ b/lib/amdgpu/amd_PM4.h
> @@ -224,4 +224,10 @@
>  #define	PACKET3_INCREMENT_CE_COUNTER		0x84
>  #define	PACKET3_WAIT_ON_CE_COUNTER		0x86
>  
> +#define	PACKET3_FENCE_WAIT_MULTI		0xD1
> +#define		FWM_ENGINE_SEL(x)		((x & 1) << 0)
> +#define		FWM_PREEMPTABLE(x)		((x & 1) << 1)
> +#define		FWM_CACHE_POLICY(x)		((x & 3) << 2)
> +#define		FWM_POLL_INTERVAL(x)		((x & 0xFFFF) << 16)
> +
>  #endif
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 52327c69e..399171b44 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -10,6 +10,7 @@
>  #include "lib/amdgpu/amd_sdma.h"
>  #include "lib/amdgpu/amd_PM4.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amdgpu_asic_addr.h"
>  #include "ioctl_wrappers.h"
>  
>  
> @@ -185,6 +186,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
>  		ring_context[ring_id].pm4_size = pm4_dw;
>  		ring_context[ring_id].res_cnt = 1;
>  		ring_context[ring_id].user_queue = user_queue;
> +		if (ip_block->funcs->family_id == FAMILY_GFX1150)
> +			ring_context[ring_id].max_num_fences_fwm = 4;
> +		else
> +			ring_context[ring_id].max_num_fences_fwm = 32;
>  		igt_assert(ring_context[ring_id].pm4);
>  
>  		/* Copy the previously queried HW IP info instead of querying again */
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 12f92a1d5..354847a1b 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -634,6 +634,9 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  	unsigned int nop_count;
>  	struct timespec ts;
>  	uint64_t current_ns;
> +	unsigned int i, j;
> +	uint64_t va, value;
> +	unsigned num_fences_in_iter;
>  
>  	clock_gettime(CLOCK_MONOTONIC, &ts);
>  	current_ns = (uint64_t)ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
> @@ -643,7 +646,7 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  		amdgpu_sdma_pkt_begin();
>  		/* For SDMA, we need to align the IB to 8 DW boundary */
>  		nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
> -		for (unsigned int i = 0; i < nop_count; i++)
> +		for (i = 0; i < nop_count; i++)
>  			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
>  		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
>  		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
> @@ -659,6 +662,35 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  		amdgpu_sdma_pkt_end();
>  	} else {
>  		amdgpu_pkt_begin();
> +
> +		if (ring_context->job_start_write_data_va_addr) {
> +			amdgpu_pkt_add_dw(PACKET3(PACKET3_WRITE_DATA, 4));
> +			amdgpu_pkt_add_dw(WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3));
> +			va = ring_context->job_start_write_data_va_addr;
> +			value = ring_context->job_start_write_data_val;
> +			amdgpu_pkt_add_dw(lower_32_bits(va));
> +			amdgpu_pkt_add_dw(upper_32_bits(va));
> +			amdgpu_pkt_add_dw(lower_32_bits(value));
> +			amdgpu_pkt_add_dw(upper_32_bits(value));
> +		}
> +
> +		if (ring_context->num_fences) {
> +			for (i = 0; i < ring_context->num_fences; i = i + ring_context->max_num_fences_fwm) {
> +				num_fences_in_iter = (i + ring_context->max_num_fences_fwm > ring_context->num_fences) ?
> +					ring_context->num_fences - i : ring_context->max_num_fences_fwm;
> +				amdgpu_pkt_add_dw(PACKET3(PACKET3_FENCE_WAIT_MULTI, num_fences_in_iter * 4));
> +				amdgpu_pkt_add_dw(FWM_ENGINE_SEL(1) | FWM_POLL_INTERVAL(4));
> +				for (j = 0; j < num_fences_in_iter; j++) {
> +					va = ring_context->fence_info[i + j].va;
> +					value = ring_context->fence_info[i + j].value;
> +					amdgpu_pkt_add_dw(lower_32_bits(va));
> +					amdgpu_pkt_add_dw(upper_32_bits(va));
> +					amdgpu_pkt_add_dw(lower_32_bits(value));
> +					amdgpu_pkt_add_dw(upper_32_bits(value));
> +				}
> +			}
> +		}
> +
>  		/* Prepare the Indirect IB to submit the IB to user queue */
>  		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
>  		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 424b3210a..17f94fd5b 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -279,6 +279,11 @@ struct amdgpu_ring_context {
>  	bool user_queue;
>  	uint64_t time_out;
>  	enum uq_submission_mode submit_mode;
> +	uint32_t max_num_fences_fwm;
> +	uint64_t num_fences;
> +	struct drm_amdgpu_userq_fence_info *fence_info;

Please remove these variables and keep the logic local to the function.

We should only add fields to this struct when it’s absolutely necessary. We can’t balloon the struct size just for internal/test-specific logic—this struct is used across all tests.

> +	uint64_t job_start_write_data_va_addr;
> +	uint64_t job_start_write_data_val;
>  
>  	struct drm_amdgpu_info_uq_fw_areas info;
>  };
