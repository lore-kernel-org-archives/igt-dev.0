Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCF6D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCE510E1B0;
	Tue, 20 Jan 2026 04:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bXHcxQ2F";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E2C10E1B0
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:19:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJdAsZjHW5ont1oBtQunONqdsv5pnLjTZnDl9LwYxakTJ1oJ9qiaSzcDUzqcJJcD+g+EAFO75n+2SgLyuUmkyKHcCxiS6nTTnjS/TwK+hynR55QKLjogRbB4W1PpsMOxmwuq/HUHhkx7alNn39sn8x5digfn5SQmJtJ8Wq16XjpSFChKWVsKRvFPK4uDkNDPd97oaQjMXiUzL7Dt06tWNsyHEkcAHISgvIu56VvVvQt2MU7hYEYGJpPsdemIUdAU7fXctsLYD+r7eDmxa/EuvRkc/YEk9lokrLBHb4JUJrNlGuqUQHL1nzdwpUW0CVVKZ78xl2QC2knNOn6Ag+Sm0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN0QGFNcdxPRSRQp9wB6cXeeq8birCFACVaj6dbC9Gw=;
 b=xP6iZSsLD/e8Fd9wp7rohobbGVNcf0SnPpNZt36b/ZSRXwzrw2Tb1OOul/ECPGxrO4Dbf4O+lk7F24yWfckVyEr61KUwPWmfLC21JDpiW8Gl1UGnTsQeq73oHVjKe7ZO2tti23h02NmT2UIr1khHZacScuLCOOaZ1QSpmfuPBQ9MzbN4gqMKBWuRBPYMCqEZHqGkqltripNLgYCVYID3f7nvg71sOEdFXenrpyLRE3QMxl3ETB372LP4gPJoS1QsQ4YE7p1JiI0RUajFUnfnYbc7IAFuyyQORk3JNegpaj0/bgtqqwdalz0Of3rhgE8wMqHGMyzJqboZwM40cfj/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN0QGFNcdxPRSRQp9wB6cXeeq8birCFACVaj6dbC9Gw=;
 b=bXHcxQ2FVDIwcfCSPXdNSB2Q+j1ooF6na3nKC3OUyKYBHWRkgsCchhWgUURyUMTCbqpcgANn7AK+KfkH5kNp17J2woeuQ8YKaPww9BEJb083inu4LM62OSJJTLbDAVaVUxtOSE8m9kDMfkxUv/6fst0U0vcTaOzRNj11sUZauVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB5960.namprd12.prod.outlook.com (2603:10b6:8:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:19:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 04:19:00 +0000
Message-ID: <f75586e9-66d5-4da8-ad73-265840227100@amd.com>
Date: Mon, 19 Jan 2026 21:18:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] lib/igt_color: Improvement fb compare time
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
References: <20260119224237.561000-1-alex.hung@amd.com>
 <20260119224237.561000-2-alex.hung@amd.com>
 <DM3PPF208195D8D7D8631102233D5BF06B4E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <DM3PPF208195D8D7D8631102233D5BF06B4E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:303:8c::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2d3b44-d044-47de-ac85-08de57db09be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2J0ejlrK0h3RjNLeDNLck1PRklsV1NDNFFady95NUlSMDU2VEF1RCt4NXNS?=
 =?utf-8?B?NStSWENyNEhKWk5VUUl1UjhTQUJWL3VCQlczQ3E4Rkp4LzdsZUZReVMxUEdY?=
 =?utf-8?B?Rm5wdytFTEZVSUhvaXg4d0pHQ1lLSjVTSS9yek5TeTF4VGFPclNVclh1MnpO?=
 =?utf-8?B?OVozdUdDc0ppMTJSWWVKbGx5UjlDTnkzdldYQ3hJQ2VLZEZ4c0swUkZHbTJG?=
 =?utf-8?B?YXJranVhZlVZamQ0akdpSkhzNXBQd3JlM2JhcjB2ZERDWWlvVFZLQXpOSXRX?=
 =?utf-8?B?bUgrUFZNeWxaWDdTaDQreHp3RTJxY0VHMkk0UzYrcTZVLzVqRjAyMnlpbkVx?=
 =?utf-8?B?S1pidnZGbmplOVhmb1FlNlpNYVdzYllmek5GQWFmZ0NRM0p0QzFLbjlCcVEv?=
 =?utf-8?B?eXFrak1PZkJ0VWVsa2QxV1FISFoxbERETDlLSVc5WGxYNHhKallyYWxlMUk4?=
 =?utf-8?B?QUZZMmJFZ09HRndQMXhlZ0hic2JCdE5mdlBxL2tZR1RjU3R4dExPVHhPbFVp?=
 =?utf-8?B?ZmxpQzV2bm5tMjBhbGFBT0ZXVVpLSUJ3RzJKVHhwTEs0TXlxTVVucDBWVVM0?=
 =?utf-8?B?QjF1bnU1bTY5S3I0U0xwRVQzYXFnUGJLRzF5RkoxRVdTNHJWWEV0SmxSVnpa?=
 =?utf-8?B?WTlabktvWjB4QXAxUXhFR1dWdHgvRHpwVUNPbEtBOUZiNEJmMDBlT2ZaRjgv?=
 =?utf-8?B?TzZraU10TUlSakRCQmczT3NGcGdGdEtrY2lURXZpTzNYNVZtejZFLzFrZFRF?=
 =?utf-8?B?RlJ4Q3dOc25KMjkvakxFOWxJSXErTWE0bi9QZTVSMHVwd3N3N0ZPT0x0czFp?=
 =?utf-8?B?RUdTT0Z4VjNzRjJldS9tWG5mQWlsZTVMZitYQ1krRmg2SC9zL2hMaEtwRWFC?=
 =?utf-8?B?TFBXQXhIS0tIM1g2QXovWkt4aUErOFNMSG1lb3lKNzNaNXlybFM5TUxFaWIy?=
 =?utf-8?B?bGRIWGhhY1FvOU9hdWR2dXlOd3VGekhZeEZRWUhSb2h2Rzdjckh6ZGVmeGk0?=
 =?utf-8?B?WUtrdHBrY3VvYVZMRjJjWXV2YU5xbSt1MlN6Vis1aXYyclk4UGUzckg2UG4r?=
 =?utf-8?B?dTBwbzN3WERCa3NRU1BoQU1heVRwaE1oVGlzTlA1VDFxdWJtYjFOc1VJN1Ur?=
 =?utf-8?B?TFJ2ZVJwUnZ4Z2wrcWxLWUxKTzJ2VUVabUVaUVdmc01Fdk9kYTJaUUo1UFg5?=
 =?utf-8?B?bW1zU0FmeHFubkU1Q2J0RzB5UjNXcW5vcTRkczl3UkZqL3k5TUpKbmxVTjkz?=
 =?utf-8?B?UlFSTHJwUVplQk5nSzZNejNNTXZ4cmZyM1hJOWJyV3Faczk0b04xK2xIVDBk?=
 =?utf-8?B?OEJwbnlUWGRKUTBObTFEcUZDYWhlMEJHMWg4aXNjdWJvU3ZoVzdFOUhRRHda?=
 =?utf-8?B?TW1rQ21rUzNYeWR1YzNDM092SWY0L0lhQUl4S3liVHU4UDRrczVieUlrVXpy?=
 =?utf-8?B?dGxSc1NPaUN5cWFQTUp4RlNmOWFJOFdPRU5yZHBXZ3I1RStSOVhDdjhWdUd3?=
 =?utf-8?B?aFp4bmdqS3RFTnZUVTF0L1d1dmpMZVZXZytSUjVqRVV6SzViV3hSQUVtTDM2?=
 =?utf-8?B?U2VSRHRwZWw1aXJVQ3FheXRpL2RsUG8zVG5zRDU2RFNmS3J3TUQ0Y0IvYU9X?=
 =?utf-8?B?Qzl1bFFQN3FvbnBEbi8rYVg4eXZrVmtBNjB0WktreFJYQU8rSTZKS3JOWDFL?=
 =?utf-8?B?bWlobWp5bjlmOWlyZ1VWSWR1encrMXk1Sm1WNDZVWGJRbmVJR05jRkJjbm9B?=
 =?utf-8?B?eTBUbzdvekM2SGx6eHRHYzZhTFo4UUNETmsreVZDVDJoSE5pNGtlaldPMkli?=
 =?utf-8?B?bWtNVzQrbTdUQmpMN0Vmdjc3WUFWdDkwVUh4NGE0N0piWmU3UXlNcTJaQndv?=
 =?utf-8?B?M0lwLy9QaG55KzRRVWZCV1dVelFIcW5HSitwZmhmbjBTdE5xWStlVkVzeFZF?=
 =?utf-8?B?OUFmUm9xQ3JJR2hGM1RWRmx2NWZMMzg5RU5kNkQxakJYZmZuUjMweklFVDdn?=
 =?utf-8?B?ejlvN3pRUjBNbElhZGlRejFrdU95dnBuZEdtZkFnbm91elJyTnl2SEJlY1Zw?=
 =?utf-8?B?dE1ySnV6UzRJN0VaSk8ycms3TFhIaXhzR1Z1ejlFU3UxZE44R1l6VGRpOXJh?=
 =?utf-8?Q?h340=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pvVy84TlNuekQrV1BONlNUNkZHc3huMHhBVm9WVnlJVlZNZ3V4dGhhbzMx?=
 =?utf-8?B?RFAvK2t5bWFjVU5DZjRRZ0VWUGNkWFNLVWRtek5yNWkxOUNPeFRpRFVOa0xU?=
 =?utf-8?B?RTdzU0NsbHdSc2JhU0dmV2p3UU9uNEwwUkNqV3lmZTN6TW5zU2c3M0pmWW1v?=
 =?utf-8?B?ZkpjaGxPdGlyeGZIRlFmc0NsQzlqUW5KYmVUbTlnNTFZRDcyZW91WEtFWXFo?=
 =?utf-8?B?TXNEQSt0ZzRaS3FqRzhTQ3lSR21UdktZSnJXSEMwOU40SnpPdzdLbHhJcktm?=
 =?utf-8?B?RXFWK2dySVcyeFp3OElwZ29ZM3NhV296OEJYRDRCTWFhSkgvZDVwbU9QZjRu?=
 =?utf-8?B?cUVPRWtlN1N3NUF6TjBUODFxakJuL0NCMFo4ZDFNbVJnMGhYNms2Y1AvTWxx?=
 =?utf-8?B?ZE9qSWk2U2pjS2FyeUhIdE4zUkxqb1Q3OE9GRjVyYTROaFdPbFBXdEZKS3RG?=
 =?utf-8?B?RjFtOU80ZndaTGtPSHBRZmZXVTZBN2RJYUtyd1NNODhUWTBUZ1RCK3ErUVpi?=
 =?utf-8?B?T1JhaGpZZFNiQVpEUDRBV2hjWkZXOEtxME9mMTFZaFpUUUp2MVVGNWd6MUg3?=
 =?utf-8?B?ZGQwVTlXcHhWdVUrNFQwcDBzY29IaWhPalpQVm5hMTJxTC9SSmZacGRZSE04?=
 =?utf-8?B?cklUYzVrdnB0NWNGSUNtL3hhcmFHYzU0cTFEVXRpTWY4NDFxNDVIT3VYOVdx?=
 =?utf-8?B?WDVBK0dxTnV6cHRBRTVSa2xHM0hLWnp3eWE3M25GT0ljaVMrSnNkN0dES2U5?=
 =?utf-8?B?dFR2VVdtazVFZmkraVNKV2NJbUlLWlN5TXd1Tmd6QUJLekx4cDJ5a09SNkJX?=
 =?utf-8?B?NXM5a2J1bzFQVERwWmFMRmZ2djBFNWkyV2hjMTMvRXVvZ0VNalQxUjI4WElN?=
 =?utf-8?B?NUI3YWs0TTkvUEdkakFIOHFWTjdBbS9Ea1pBYk13dFozMTQxZWNSdkFEaVBI?=
 =?utf-8?B?K29EWkZ1STBDUHVRSUtEVG1tQXZZREpaS3BSNkZIMFVyQldOZnk5eGhFZkpn?=
 =?utf-8?B?RCtTSVEzaEx2QTd4WjNzYzNWWlJFUEwyNTkyTWpFYUdWalZvUWR6YXlTZWli?=
 =?utf-8?B?cGtQekx3Z3oybHZCUW10enpDQ0ZOK3Z5bEMwek9UOUN4M0p5M0x4Vm1LeWYv?=
 =?utf-8?B?enJ5cEt5bzVra0dmY2xBMC9VdmNGTGlVVi85aVk5aElOR25UMDRHNmxjbGRG?=
 =?utf-8?B?UnFvUE9BcnNSdE9CVGczVy9ld3ZnWWl1SVNSdmtWei9zeHd2a0JWVjZjUk8v?=
 =?utf-8?B?aFF6WWZzT2p2NDZadm5KT2M1MElpUGMyZk5KUmhrUnVkc0ZsVjl3UXpnVDda?=
 =?utf-8?B?bGVLTWc0OE1ocUFMVGpESHYybkJxaTRiVU8vekdlcmw3NjlxaVZDUHJsditT?=
 =?utf-8?B?Ui9QM3lyTXBDTk9SMjBmdjdQSE1lNFR3S3FiRVlUYmhXREc4U0FFWXhnak5a?=
 =?utf-8?B?WGRYZkpNOFQ2Tm82VVJJUXg2ZDFyNWVqUDQ2RnFUMUw2ZkJXOHUyNnNpcmhH?=
 =?utf-8?B?R2ZCSjVVQWNybDhrdTRpdHhESmdITFp1bW4yQk4vb1dGUFNyOEpSbEZ6dzlm?=
 =?utf-8?B?YjJ3VEUwT2lYQ0J1WUxscGp0dkZwRnRXMk5LajQ1ODAyOS9HOHlSeDRMTy9W?=
 =?utf-8?B?R2xqVnI1eVJKN3VmdTZ1ZnRPemtneDJMVlBrSEF0bkxKUE5FTXI2QzRzTDFx?=
 =?utf-8?B?VExoTVlxRHlmOVg1b0hVSHBHakltNlh6MnJUZm5tM2VkWml2TW14SUNHYkV6?=
 =?utf-8?B?WlV2M1BQdmNyYThMUWN5VmpUSWcvM0Y5Vlp1OVBqbk1LZTRQbjIydlR6Tm0y?=
 =?utf-8?B?OWdnVWdieFlWSHRMWkZoQllzSVo2SUdRa3RibHpjOUhOTytoRzBVRkFEbUJ5?=
 =?utf-8?B?WGIvU1lYNThBRk9LRWVlMllGOEo0SGsyaDVJODFzUDBMeUxsa3BDVTdnbEhh?=
 =?utf-8?B?SDNES1BQQjFEeUJTU0c4aSsrWFdHdDJaaC9sWis5bGJnS3ZsQXFCZXZrcjBR?=
 =?utf-8?B?cytmaTBpYzZadW45emE3UXFEV2VURzhxOHlUbEUyRWgzUmJXaDRNM2FoV1N3?=
 =?utf-8?B?R3JvdGN1eVpKb3lveUpxbjJaOWI0Q0NHc2VReUdFOXkrMTZjQWVDVVV6SFly?=
 =?utf-8?B?WEpQWkZ3dlJJZFRzMk1oNUMzcEUrZDk5NWhCUmt5dUpNWCtLN2U2RHZsVncy?=
 =?utf-8?B?RDJiUi9KZ0NHb0ZodlBObVlGMVZWRFpsUTRxQ1A1TDNlOGIySS9HaFVHbWxq?=
 =?utf-8?B?V0h5THd6dFJCbjhoak1aMXJtYmM3ckxsa3JaenJIOUd0QmZ6Sk9SaTBRNnoy?=
 =?utf-8?B?ZnF3VHRqNURwVHlIaER6SkI1RUJNcXVQdXA3clY5NmZYVzZkWGxHQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2d3b44-d044-47de-ac85-08de57db09be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:19:00.7551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbkMwAj3CIKAIVSMRTuT056H8ICaOKK51J1GlvX3Scdm3XmIcGUw50T3FjB+Ie6ODsKfWzy355AhF8aE4gYssA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5960
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



On 1/19/26 20:04, Kandpal, Suraj wrote:
>> Subject: [PATCH 2/2] lib/igt_color: Improvement fb compare time
>>
> 
> Subject needs to be "Improve fb compare time"

Thanks. Let me fix this.

> 
>> Copy the memory to a cached buffer first to avoid slow memory accesses on
>> dGPU.
>>
>> This cuts kms_colorop execution time on dGPU from 1 min to 17 seconds.
>>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> ---
>>   lib/igt_color.c | 33 ++++++++++++++++++++++++++-------
>>   1 file changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/lib/igt_color.c b/lib/igt_color.c index 4d94421ba..8b2564d40 100644
>> --- a/lib/igt_color.c
>> +++ b/lib/igt_color.c
>> @@ -575,15 +575,30 @@ bool igt_cmp_fb_component(uint16_t comp1,
>> uint16_t comp2, uint8_t up, uint8_t do  bool igt_cmp_fb_pixels(igt_fb_t *fb1,
>> igt_fb_t *fb2, uint8_t up, uint8_t down)  {
>>   	uint32_t *ptr1, *ptr2;
>> +	uint32_t *map1, *map2;
>>   	uint32_t pixel1, pixel2, i, j;
>> -	bool matched = true;
>> +	uint32_t *cached_p1 = NULL, *cached_p2 = NULL;
>> +	bool result = true;
>>
>> -	ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
>> -	ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
>> +	map1 = ptr1 = igt_fb_map_buffer(fb1->fd, fb1);
>> +	map2 = ptr2 = igt_fb_map_buffer(fb2->fd, fb2);
>>
>>   	igt_assert(fb1->drm_format == fb2->drm_format);
>>   	igt_assert(fb1->size == fb2->size);
>>
>> +	/* Copy WC memory to cached buffer for faster reads.
>> +	 * Reading from WC memory is extremely slow so this is important
>> +	 * on dGPUs where framebuffer mappings are typically Write-
>> Combining.
>> +	 */
> 
> Nit: Its better if we follow the following convention for multiline comment
> 
> /*
>   * blurb
>   * blurb
>   */

Let me fix this too.

> 
> Regards,
> Suraj Kandpal
> 
>> +	cached_p1 = malloc(fb1->size);
>> +	cached_p2 = malloc(fb2->size);
>> +	if (cached_p1 && cached_p2) {
>> +		memcpy(cached_p1, ptr1, fb1->size);
>> +		memcpy(cached_p2, ptr2, fb2->size);
>> +		ptr1 = cached_p1;
>> +		ptr2 = cached_p2;
>> +	}
>> +
>>   	for (i = 0; i < fb1->size / sizeof(uint32_t); i++) {
>>   		uint16_t mask = 0xff;
>>   		uint16_t shift = 8;
>> @@ -614,15 +629,19 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2,
>> uint8_t up, uint8_t down)
>>   			if (!igt_cmp_fb_component(comp1, comp2, up,
>> down)) {
>>   				igt_info("i %d j %d shift %d mask %x comp1 %x
>> comp2 %x, pixel1 %x pixel2 %x\n",
>>   					 i, j, shift, mask, comp1, comp2, pixel1,
>> pixel2);
>> -				return false;
>> +				result = false;
>> +				goto cleanup;
>>   			}
>>   		}
>>   	}
>>
>> -	igt_fb_unmap_buffer(fb1, ptr1);
>> -	igt_fb_unmap_buffer(fb2, ptr2);
>> +	igt_fb_unmap_buffer(fb1, map1);
>> +	igt_fb_unmap_buffer(fb2, map2);
>>
>> -	return matched;
>> +cleanup:
>> +	free(cached_p1);
>> +	free(cached_p2);
>> +	return result;
>>   }
>>
>>   void igt_dump_fb(igt_display_t *display, igt_fb_t *fb,
>> --
>> 2.43.0
> 

