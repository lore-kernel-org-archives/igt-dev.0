Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4BFD2502E
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 01:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EAF10E0A5;
	Mon, 12 Jan 2026 01:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vhHJwCJS";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011029.outbound.protection.outlook.com
 [40.93.194.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEA910E0A5
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 01:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK862IQOIr/xqYSLjDqxA52283CKKd5D9c9d1oeg9c0SU6xBqkJG/IGW4DtDmmw5bp1DrzOkV/ylYwC96nchdIat23t3AmhHbz2cSMd9L28uBdoCez4A7KsWnpJXzeaouWVcFQBUS4J+o3yQBGqHRnSvFM7aiB3KaRmng1TAwMz+S4HHGnVzpbgwHaTlCiO+Vl/JAUOggBHP7j2g7Mg4Tw5GZMDDn6E4nMktAEcOY+a9RmLZheJj2JmpjFC7rWjHQWVb2uDaOZ6bRw3rpj0jONkJKyB/i33TkXWfokePA8qnoC2xnzy47wXCHp/V7EUhCfJYl96oQGyk25Q+j82O/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGV0toMlDQDJhAv8poqzc9AEsSm5v3PbCawh5Uo+T6U=;
 b=Jk60pZDEUNNvD4XlqTsFyqj16cp3aUMtdNzlWA7Aey0X1m5iIE2W7QbNrLUePGXbiIXKmkjghujOLjbprt7uD+jDEcUSD2yRfgXUHzdppNmTRn8zyXqh/EqEw2E3ctnGkTU4YDAq8tlTiPob0LkxswtBKycIYGoh9sGIDohm7OQ7/FL2beqAkZ2ejcrcMIlY6987KPw52Gff/M0abolCw5x8ZRg6DCO3c0KXU2xn/C1hgsoDqegb8iFm/Mjk31LnzC90JzvUB921pYRU2YKcalDE5iAe7k/7Rm7mCNHbyuT+BU8BRpplhyFzH4Bb+HzJjWyPxLWAL/lUj9hyf66FBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGV0toMlDQDJhAv8poqzc9AEsSm5v3PbCawh5Uo+T6U=;
 b=vhHJwCJSwva4bDjnNOvhmvKudXam+bGEfWa7qeSRjEGXdBx/7PAd6alZL4TAHdy2Y5EsJRMsDdjPA0nMkanfDGdxSmPD5uczw83DgrdItqAPIsskIGfESzDBuqwD5c2DolDmp90Kw95aEk41FKPbMo6/R7nbkxSMOiNtTtLPp24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BN7PPF5D27497F1.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 01:12:33 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 01:12:32 +0000
Message-ID: <7b3d1b71-77e0-4c2b-a0f6-94751e2e5189@amd.com>
Date: Sun, 11 Jan 2026 20:12:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] lib/amdgpu: implement selective sync skipping
 for error injection tests
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20260108063451.4110907-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260108063451.4110907-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0407.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BN7PPF5D27497F1:EE_
X-MS-Office365-Filtering-Correlation-Id: 901c8bb6-f0d0-4b63-45b2-08de5177a9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWlTR1V1SWpwczBsSjFiWk9HaWN6eWlScHBkbTNrYnZpUDhLZ2VKVWJtS0gy?=
 =?utf-8?B?MnNZKzUzdFVraUJ3VWVtRHdQYWc1bW9zS1pTZ1hCdVBXV2JNKzR4ZHZRV1ox?=
 =?utf-8?B?VlE3S0t0QUxYeHJRQy9NazljaXBDYUpNZ3M2ZnZFVDJqa01KVXJsdHBiVUJq?=
 =?utf-8?B?SndieTg1dkNwOGduOFp0ajlLYTVZZHcyNlNTc3FudEZxcGtQVFh2aFBiRDBQ?=
 =?utf-8?B?ZFY0Mi8yQURKUE5Da0xPeUxCVHlmL21PWFVkSktiYUxmeGRyZGJGRzdodDBZ?=
 =?utf-8?B?Z1QvR0IzWkRNUVBXV3ZtSnZXSVpzcHZUai9oNzBMVGpWWXdZVVhjWmZsTEFO?=
 =?utf-8?B?YXFVb0Q5WkxWT3BUSlhWSVIvbmxOSmgzbTE3TlM0UkhzVGw0eDNpS3dKRHA3?=
 =?utf-8?B?RnN6Z21MNjNHUmw5LzRIS1VZNUtkS0hURHFVd0JkVU1NK0YzdmVBblNwV2Q2?=
 =?utf-8?B?QUJrd1l4NUhIdVVFR1ZSRFBFcDJFT0tsS0YyY1UrU0k2SVZ4cjhmUHdSdjJI?=
 =?utf-8?B?bnhzdnhRTkRXdzBWSk9LaXQ4d21VK3dyMFpMeUNxY1pPWklKQmRQUlN2ZmhH?=
 =?utf-8?B?WE9QOTRMT0psRWRjR243bWJaRFpmT0VXSlJzUkVyUXlkci9maXJkckIvVHF2?=
 =?utf-8?B?UUJFZVZxTC84d2RsMnRvRE9leXltWnFJTDZBRi9sSlljelFvQUZVTTBUdGRG?=
 =?utf-8?B?NGNmRlZ4ampueU5IZHc2RmFkSHFNWDZkT0d0aE41aEw5eDJNZjNuYlM2dFZh?=
 =?utf-8?B?T2t6bUc4cWVjODd0YnpaM2VPeGFKaDN5NmorazNRVy85MW9rWnlpNUxraGVY?=
 =?utf-8?B?U3RiR1VuVUM1eTFYTVdEaDdjb1ZKRUUyVU9YR09iemI0b09ZREF2cFEyd2lY?=
 =?utf-8?B?MmpZcDFPSlFjekg3dGxnMDRsc1Mvak81dEFMRDlMWUZOSTlFUllqek9hMkND?=
 =?utf-8?B?T0NhdmVMZUxINUQ4S2hnOFFaZ1NuUjJ0a3FUbzMvN0RMMTMwS2o2Q1J2a254?=
 =?utf-8?B?cUtObVBybk8rZjBINUZhSGp3RUZUdDJSZXE2Q0RKNTIvbjdENWxvcU9IRXhz?=
 =?utf-8?B?ZFd4MmU1MTlpZ1AxcXYxOXZnY3dvUzhneTE0SkVYb21ZakEyQjBmK29RS0w1?=
 =?utf-8?B?RFhwcC9LWDQwcjBZN0lEY3k0WXRHcXN4VCtjOU5wNmE5bWhob0xnREkyNUdq?=
 =?utf-8?B?Z3Yvd3FQR0t5MmpxZXJlSXlHZHJoaXZjajhRcVlPVHhKU0ovWDZNNGZpdFhU?=
 =?utf-8?B?eVpBdlhPRDRDTm1IL0drOFZOTEdYZzJscXR0Qk1LaWtGeVhXNThyTTlSem9a?=
 =?utf-8?B?TmxmYjVuWUlLelVSNTUwM2dqOHh5bXU5dFhqWE5jdEdveFpHWUROUVpSTnFz?=
 =?utf-8?B?a1lDWFVIZG5QQWZucFpCeTVVYXVEcVY3SHNVVEJ4ZmhLQlRLTUhBWW54MXJM?=
 =?utf-8?B?czhJRWhncVdFSHA1eDBBQ1R0NCthZXVjVDRBOE1Nc3lFZ3FOWW9ueFQ2ZFgy?=
 =?utf-8?B?c1dHU2Z5b0VIdFZNbHhhczZVa05Wc1M2cDF5RW10alp6amJJd01za29mZTMr?=
 =?utf-8?B?T0RJVzV0cHFIdnZGUUdWNTFTaytxVUpndUhCM2pkd3Rzc1ZsSitRUG5iYnlr?=
 =?utf-8?B?VWVybjhZYXpzUEFMT004T0sydFREN2VFazIxbndEMUI1WEFodjJOODRScWgz?=
 =?utf-8?B?L3ZIREtaelFRUlJCN3BEcVRQaGVBK0Evdy9odGZENWpIT21LenIrZ3VIWitL?=
 =?utf-8?B?VGdTUGd1YjVrR1FhczNqZWVaUXVvMXBMN0NaRWs1YU9EYU5aenNVOXlmR1g4?=
 =?utf-8?B?T21LQUpSSkJZUE12L3diNHlnQlhQbjR1dWxLSzR3N3VSMHVVZTFsNVJZMXcz?=
 =?utf-8?B?REhueUZOUm5JWjNtZEVPZis2S3JxbmsvL3gvdDlEWktOVG1OMmhRQm9NUlpj?=
 =?utf-8?Q?mZQPXrX88gr7IadOKpDMVW0KS+mHK3tz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1Q1enQ0K3JjVFg0ekVTTXhYa1hRbEhFRmY1eDV4NlNReU5NbXBlSEozY3dt?=
 =?utf-8?B?NC85dlJ5T05NZ1doNDBRRXpUYW1keitZK25JdkVnUmtWZXRXOWQrNXFqVkJw?=
 =?utf-8?B?S1ZCNktRNTUwMWt0WldJc3RXR2NaY3FWb2pUWHlBaUM3dFV3VWYrRXEyRkow?=
 =?utf-8?B?czZaRlNVRHpwMHlrZXlSRys4TjhRWXYzOUNheUZwUzhUYmtkNTZlMUVUV2ZC?=
 =?utf-8?B?ZnBGOGRZaitDSjVmM05FYjZkOWhuTDdjQi9xRmEyRzM5WERydUIwY2dNVit5?=
 =?utf-8?B?RU9wbEZSa0JtL2FQVGt3OWxNTzFkVnpsTTJkQXhJMWEwZnFoa2RvdXRvSG4r?=
 =?utf-8?B?S29ieUhnYXE5UHN5VGlyQWR2NW42N0dUVTRYVU1uMkJuNDVKaklzQm9MWU1q?=
 =?utf-8?B?MUpWY3FkWDhWSWk4bk81VmxVeUZtcE4zcDlBWks5RExCOCsydG5lNmZaYzh1?=
 =?utf-8?B?VVNMTXQySFBUREsrTnE2dGhTclh4VjYrOEZWVVBsUDRUQU10MlpFaE9KaXNx?=
 =?utf-8?B?RVR1b3Y2VGlmNHRsZEsrTnFDcTlLWjRPeTVXQ3B4M3MyNWR4aHdwTkhsQUs0?=
 =?utf-8?B?ZEhGQUh6LzNqY1FyYXZCb3I4VmJsakgyaTVSMHdtMWlybHpSYVFUMm1mZTRv?=
 =?utf-8?B?VnBXdFc0NW5QSVRhc3pXWnlSUHF4U3ZVZjRsZi9XR0lleTVJMmxWVnJzWkRq?=
 =?utf-8?B?eUp0Rk1wZjdVbWxyVXVyNzU5OVBxRWljQ1ZvcFpWUzV6UHJrZ1Nxa1k4RDht?=
 =?utf-8?B?Mnk2eElMREMwODl2dUFmbUZROG1GQTcrVEtuZ0doWERYeW8xbVN1QzFmSU43?=
 =?utf-8?B?QlhuWnVOeWs2NklKbzlMeDVxQ2NESUR2a1pjSVM3NjA4U1AzbEhjNW10S3NW?=
 =?utf-8?B?ZDhpZDl3aUxaejkyVGlFRWxHNW5YL3JLWHE0REl2YVZUdzM0UUxScWlVZFNn?=
 =?utf-8?B?OXpsSllhWTQyUm1zb0o0eW5xbldqaEoraWZlZnZXZHVJYUFtL2E5T2xFYnMr?=
 =?utf-8?B?ajE3VVM5blRIRHkyQkgzZjVleDI2ZC9sUlBJVVZoWWtYUjJBam9pT3lKZThT?=
 =?utf-8?B?enkrRDFrdy9CbWlmbWt4ajBWWUNJeXBLdi9GLzlVL00rWmlvZTU5Tkh2eTh2?=
 =?utf-8?B?bzEzcE4xMWlCNXFrVCtBUWVIUzNkQ1RrNmxDS0N6c0FRRVVXVEFoa1NBVC9o?=
 =?utf-8?B?SW10UEIrZldub1JMNXdoZlRiMDFBY0lQWS80QkNWYXJaMldnV3dIZ0Qzc1c4?=
 =?utf-8?B?WXRoSEZEWFExeG9nT0xYTFlCeldEU2RJRlRIbGtTQUdwbEZyMFZYRmtwYTBt?=
 =?utf-8?B?U0d0SkYyVkNGWVM0ZDNNNjJUVGQwQUFaT05xSUhvN1U5V2Ftc3JuM3hkMGVR?=
 =?utf-8?B?L2h4Z0dROVNLaHhrZVdieWZLL3IzRHJScjZxMlI2cjhiUnZka0JjczdlajN4?=
 =?utf-8?B?NmR5Z3FWZVpab1ZOYnhpOGhDWGc3VXpDZVlJWUhMb1VoYkdZKzJSMldnUWIy?=
 =?utf-8?B?OEtZZkpydmo3NEZSWFdDbmErdmx2TFZ0T244OENETGhRTVozVlhqWFZRazBN?=
 =?utf-8?B?eWJPZHpldERxd1o3dFBleHpRRGFzZGR0d1hYeTVpT1hiWTB3WG9xejFIVXly?=
 =?utf-8?B?Mk0vZ1o2MmpvNndMNUNHdjBHc293akFrbnNtb2JiWnc0U1FQYzk4Z1ZpOUph?=
 =?utf-8?B?ZEFqZlJRbWx5MEsxbzFNSnlxQ0pFNlIwQzRPQnZvclBqUkZMWVpia0ZRMHl4?=
 =?utf-8?B?S200OThOTVFPV1ZOS3Erc2JyTU91UDQvd1RzVEVOTDZrVjZmNmVnTGZOVmp6?=
 =?utf-8?B?T1dlUERhQUl1U21wT2lPdFNITWFRVVg1Q0RVc2srMXBJdFBIMlB5dCtWWU1j?=
 =?utf-8?B?R2toMTFYTnhhdENmQXMyZktRZHNmNDRPZzVQNTdzMTA5Z0tWa2p1Z00rSm1O?=
 =?utf-8?B?dXhzc05Od1lvdnRtTjgrcXYrZEcvVmY1cjd2ZzdseEtOY1dVUkI5VlR5cDRP?=
 =?utf-8?B?SnNKMnUyREJwY1VENzZXdXY3TzRMWFdTenkySTBiTlVXTHdDMy96TGhqRWRx?=
 =?utf-8?B?aHJhdk5jeWJoZUtSUkR1WlpNZlhxYy9iWkJsN1BWOE9aS3Y1MXpTa0VHT2xN?=
 =?utf-8?B?WmxzRFZ2N3RFZUxDalVWbXFBVHAxQ3E1M3YvQkJuS1ZlVFI5NzB0RDlmSy9m?=
 =?utf-8?B?NTQzME9mcnp6WmJxOVFxZUVycENENHNoTXp4eDhKT2J3ZFlCWGNDcjlNVElZ?=
 =?utf-8?B?c1pyczlHcDV4bVY5ZG5yOCt3a3E0R2FGa0h4M0JEMG5NanF2SkpteCtiby9k?=
 =?utf-8?B?Q21SOTdVRGtmamVwQW5HajI1Z253aUlrUmtxZmUrV2h6RjFLc2dXZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 901c8bb6-f0d0-4b63-45b2-08de5177a9ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 01:12:32.6654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PGDLKMKJBXVy5/TZPnYnF015x/vL8rcjO4F7qaFSHPf1mAHllziAyD0cjqBwz7yLuIk1jMdptnTQ6bz+TfsCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF5D27497F1
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

 Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2026-01-08 01:33, Jesse.Zhang wrote:
> Refactor user queue submission to handle error injection cases where
> GPU commands are intentionally invalid and would cause syncobj waits
> to hang indefinitely.
>
> Key changes:
> 1. Introduce `enum uq_submission_mode` with two modes:
>    - UQ_SUBMIT_NORMAL: Full synchronization (default)
>    - UQ_SUBMIT_NO_SYNC: Skip sync for error injection
>
> 2. Add helper functions:
>    - `wait_for_packet_consumption()`: Busy-waits with timeout for GPU
>      to process commands without synchronization
>    - `create_sync_signal()`: Extracts signal creation and wait logic
>      for normal submissions
>
> 3. Update `user_queue_submit()` to switch between modes:
>    - NO_SYNC mode: Waits for command consumption via rptr/wptr polling
>    - NORMAL mode: Creates sync signal and waits for completion
>
> 4. Modify `bad_access_helper()` to use UQ_SUBMIT_NO_SYNC mode for
>    error injection tests, replacing the hardcoded timeout value
>
> Benefits:
> - Prevents permanent hangs when submitting invalid commands in tests
> - Maintains full synchronization for normal operation
> - Provides timeout protection for error injection cases
> - Improves code organization with clear separation of concerns
> - Enables future expansion of submission modes
>
> The fix specifically addresses deadlock test scenarios where invalid
> GPU commands would cause `amdgpu_cs_syncobj_wait()` to block forever,
> preventing proper resource cleanup in `user_queue_destroy()`.
>
> v2: fix build warning
>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 20 ++++++--
>  lib/amdgpu/amd_deadlock_helpers.c   |  1 -
>  lib/amdgpu/amd_ip_blocks.c          | 72 +++++++++++++++++++++--------
>  lib/amdgpu/amd_ip_blocks.h          |  7 +++
>  4 files changed, 76 insertions(+), 24 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index fc5a0ed32..6129b7104 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -70,6 +70,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
>  	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
>  
>  	if (user_queue) {
> +		if (expect_failure)
> +			ring_context->submit_mode = UQ_SUBMIT_NO_SYNC;
> +		else
> +			ring_context->submit_mode = UQ_SUBMIT_NORMAL;
> +
>  		r = ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
>  		if (!expect_failure)
>  			igt_assert_eq(r, 0);
> @@ -180,7 +185,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
>  		ring_context[ring_id].pm4_size = pm4_dw;
>  		ring_context[ring_id].res_cnt = 1;
>  		ring_context[ring_id].user_queue = user_queue;
> -		ring_context[ring_id].time_out = 0;
> +		if (user_queue)
> +			ring_context[ring_id].time_out = INT64_MAX;
>  		igt_assert(ring_context[ring_id].pm4);
>  
>  		/* Copy the previously queried HW IP info instead of querying again */
> @@ -370,7 +376,8 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 1;
>  	ring_context->user_queue = user_queue;
> -	ring_context->time_out = 0;
> +	if (user_queue)
> +		ring_context->time_out = INT64_MAX;
>  	igt_assert(ring_context->pm4);
>  
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
> @@ -503,7 +510,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 1;
>  	ring_context->user_queue = user_queue;
> -	ring_context->time_out = 0;
> +	if (user_queue)
> +		ring_context->time_out = INT64_MAX;
>  	igt_assert(ring_context->pm4);
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
> @@ -604,7 +612,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 2;
>  	ring_context->user_queue = user_queue;
> -	ring_context->time_out = 0;
> +	if (user_queue)
> +		ring_context->time_out = INT64_MAX;
>  	igt_assert(ring_context->pm4);
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
> @@ -927,7 +936,8 @@ cmd_context_t* cmd_context_create(amdgpu_device_handle device,
>  	ctx->ring_ctx->ring_id = ring_id;
>  	ctx->ring_ctx->secure = false;
>  	ctx->ring_ctx->user_queue = user_queue;
> -	ctx->ring_ctx->time_out = 0;
> +	if (user_queue)
> +		ctx->ring_ctx->time_out = INT64_MAX;
>  
>  	if (user_queue) {
>  	/* Initialize user queue if requested */
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 5efb5e73d..01c0f9928 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -347,7 +347,6 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
>  	ring_context->res_cnt = 1;
>  	ring_context->ring_id = 0;
>  	ring_context->user_queue = user_queue;
> -	ring_context->time_out = 0x7ffff;
>  	igt_assert(ring_context->pm4);
>  	r = amdgpu_bo_alloc_and_map_sync(device_handle,
>  				    ring_context->write_length * sizeof(uint32_t),
> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
> index 73bdace5a..0a9487c95 100644
> --- a/lib/amdgpu/amd_ip_blocks.c
> +++ b/lib/amdgpu/amd_ip_blocks.c
> @@ -582,15 +582,55 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
>  	return r;
>  }
>  
> +static
> +int wait_for_packet_consumption(struct amdgpu_ring_context *ring_context)
> +{
> +	uint64_t count = 0;
> +
> +	while (*ring_context->rptr_cpu == *ring_context->wptr_cpu) {
> +		if (count > 2000) {
> +			igt_warn("Timeout waiting for bad packet consumption\n");
> +			return -ETIMEDOUT;
> +		}
> +		count++;
> +		usleep(1000);
> +	}
> +	return 0;
> +}
> +
> +static
> +int create_sync_signal(amdgpu_device_handle device,
> +                             struct amdgpu_ring_context *ring_context,
> +                             uint64_t timeout)
> +{
> +	uint32_t syncarray[1];
> +	struct drm_amdgpu_userq_signal signal_data;
> +	int r;
> +
> +	syncarray[0] = ring_context->timeline_syncobj_handle;
> +	signal_data.queue_id = ring_context->queue_id;
> +	signal_data.syncobj_handles = (uintptr_t)syncarray;
> +	signal_data.num_syncobj_handles = 1;
> +	signal_data.bo_read_handles = 0;
> +	signal_data.bo_write_handles = 0;
> +	signal_data.num_bo_read_handles = 0;
> +	signal_data.num_bo_write_handles = 0;
> +
> +	r = amdgpu_userq_signal(device, &signal_data);
> +	if (r)
> +		return r;
> +
> +	return amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle,
> +				  1, timeout, DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> +}
> +
>  static int
>  user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
>  			      unsigned int ip_type, uint64_t mc_address)
>  {
>  	int r;
>  	uint32_t control = ring_context->pm4_dw;
> -	uint32_t syncarray[1];
> -	struct drm_amdgpu_userq_signal signal_data;
> -	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
> +	uint64_t timeout = ring_context->time_out;
>  	unsigned int nop_count;
>  
>  	if (ip_type == AMD_IP_DMA) {
> @@ -640,21 +680,17 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
>  #endif
>  	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
>  
> -	/* Add a fence packet for signal */
> -	syncarray[0] = ring_context->timeline_syncobj_handle;
> -	signal_data.queue_id = ring_context->queue_id;
> -	signal_data.syncobj_handles = (uintptr_t)syncarray;
> -	signal_data.num_syncobj_handles = 1;
> -	signal_data.bo_read_handles = 0;
> -	signal_data.bo_write_handles = 0;
> -	signal_data.num_bo_read_handles = 0;
> -	signal_data.num_bo_write_handles = 0;
> -
> -	r = amdgpu_userq_signal(device, &signal_data);
> -	igt_assert_eq(r, 0);
> -
> -	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
> -				DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> +	switch (ring_context->submit_mode) {
> +	case UQ_SUBMIT_NO_SYNC:
> +		/* Error injection: wait for packet consumption without sync */
> +		r = wait_for_packet_consumption(ring_context);
> +		break;
> +	case UQ_SUBMIT_NORMAL:
> +	default:
> +		/* Standard submission with full synchronization */
> +		r = create_sync_signal(device, ring_context, timeout);
> +		break;
> +	}
>  	return r;
>  }
>  
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 51f492da2..8fd9fde9a 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -194,6 +194,12 @@ struct amdgpu_userq_bo {
>  	void *ptr;
>  };
>  
> +/* Submission modes for user queues */
> +enum uq_submission_mode {
> +	UQ_SUBMIT_NORMAL,        /* Full synchronization */
> +	UQ_SUBMIT_NO_SYNC,       /* Skip sync for error injection */
> +};
> +
>  #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
>  
>  /* set during execution */
> @@ -272,6 +278,7 @@ struct amdgpu_ring_context {
>  	uint64_t point;
>  	bool user_queue;
>  	uint64_t time_out;
> +	enum uq_submission_mode submit_mode;
>  
>  	struct drm_amdgpu_info_uq_fw_areas info;
>  };
