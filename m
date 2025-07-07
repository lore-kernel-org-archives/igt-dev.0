Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB116C71130
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 22:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A1910E033;
	Mon,  7 Jul 2025 22:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CdYCSEBn";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDC010E033
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 22:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPcYv6IBrvevuZxisM74OgauBPsg8lz8v8Sq1qnZDRQXMhU6J9/H8d+OWvwzymFLgwV7QKdlXpdpWL5cZC8oJS8X0HL/3HWFqhQhsJ31iRKEM/LJEbiIUD0v/8sP5xlfhKsQS5y09LbNlZr9k3tUMATyclGdxGMxxq/JSTSth8aliviVPIpR9HxTzEu/gxB2ZlDXtz49eOgAOVfiiz9nxWvrA9wdDgyA+GsBwb8WAoEAJ8jAQkKQsfqoEYgxQJC+QvmRp3AQSNTt32pfbRxHVcZDMjpEIhqLVT/GUWr6VJ/VDfZGC2SMAdU92Z9JIuyV8PlXReAjSjXemdP3PsT3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eqgn/6pD4Cx5agrvzzG0xthKOKguxZPpk9NvAfijYug=;
 b=B3ik6JOXz19Xxjexik6oXRw44xzMfYV5GwRdUOFckZvz+jy3ZFh2/ijmgdbYf/hDCDL/AxZV5EWEMv4NtSKIYENjRXUn/5ikauOlCAa6p949lQC/1XkV5VIpt+hIAtOLjJ9dOg7Fg2JbM8KNivcpn0R7YsdCBFtFA7UHFPpBoUtpiqq/RqJ4igFzVEQcckqRRpklKh223aS4b5xfNlXHmAIe00T2/QVBN3UVx6+yyFiQALTVDldtJzVwVOBoTEMV88q3qKOwPS4sCCLqszEXs81UUDq7vu6iw6rbCk9of9pdxhJPgZ/8n/YWyJdbBh7o3yXUHIaLjq69wLu7fGyUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eqgn/6pD4Cx5agrvzzG0xthKOKguxZPpk9NvAfijYug=;
 b=CdYCSEBnifX8gGAwfy9imRqAzw3J2tynNfGY+Ud5NpPPl3W663h1tOzQsRdz4qFhGRAM3J/H4s5I1CLzv+ipUOvGHcgAx/RW7jrKt7lJ/nX+saO94Kiety+4VPe6SEuMSVSL3g2g8s07FzKk4xSLtRE1/iQxElm9vvc3/tUhs8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Mon, 7 Jul
 2025 22:43:48 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 22:43:48 +0000
Message-ID: <f5184d85-3981-457a-8fda-d8daa60e5462@amd.com>
Date: Mon, 7 Jul 2025 18:43:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/amdgpu: Add test for GPUVM, LDS, and Scratch
 Aperture Sizes
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 David Yat Sin <David.YatSin@amd.com>
References: <20250707070923.4045891-1-srinivasan.shanmugam@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250707070923.4045891-1-srinivasan.shanmugam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0484.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::7) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|MN2PR12MB4237:EE_
X-MS-Office365-Filtering-Correlation-Id: 26424f6d-54b0-4d64-07f2-08ddbda7bcb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHhBVmM4eldGcGxTMC9xcTh1QVJ4L0hBZFRWZzFzaERtL0R6T1BMZFZkbkUz?=
 =?utf-8?B?MVpqdHhNZG5KaVpJR2hCelpPQllhQlphK2RCZzF2WkZocFk5MEdsWkpjbXo2?=
 =?utf-8?B?LzcvckU4TjM2dnBNWFdESHA1MEh3TFJDcDlER2tpbzlteURtVTM1WDBmdTZa?=
 =?utf-8?B?R25OVWNXenQvWENEM3pEczRpWnp2ZnQxRUE5R2N2M3hSUWhITjloMG02SVZF?=
 =?utf-8?B?c1JHbXFhb0RXOUduMXBKSUxGVEh2b0dXcktEa3B2a1d6OE1ieXV4UTUrR3ZN?=
 =?utf-8?B?ZVYraVRSNjRLMXE1UUFtZDQrdUJiUTk0N2ZHb0xPOU5sU1hRYXowNFkwNG5s?=
 =?utf-8?B?M1BLeEt2VDE2cStlY2FaNnNiRWxhUm1kVVNXTVJRWWdnMkxGN2tvLy8zOFEv?=
 =?utf-8?B?Q0FjYm9kZzRqSTdibmw4SDBidFFuWHFFTTRmSTJpaWRuSkE4NDFoNlc4a3I5?=
 =?utf-8?B?NGIyaDU3N3dTbTUzQ2s5bmMvNTlxb0xhMzRqMnlRVmJhV2Iyclh4bDVxb3lM?=
 =?utf-8?B?YWpCc1J5VXk3NDhNQ2pUUnZYZlh1MzhDYWU0R2tNV0w5MUMyUTZrbVJlenVP?=
 =?utf-8?B?NUUzNzdZVGVZRnJ1S2plQ2RYUXo2QW1zQytyZ3JLdE1JTXBDUUo0TlFxZlF2?=
 =?utf-8?B?VTBTZEJvK1RSVXREZStZazVDeXNjeUMxbzI4cUNFRk5VZExxMmZlMjNkejRq?=
 =?utf-8?B?YVlYQlkrTXoyQk9ETFJuaDAwNTc5M1poUldDY1BTaFBidkc1V0RMQ2cyKzRn?=
 =?utf-8?B?ZHQ0VmpuNCt4R05hUWdtYThrSm5UK3Nwbit1MFRUU1FsTnBjSW52Ukk0cUlZ?=
 =?utf-8?B?RWVtWnIxNzVIWDg2WklUSUU3elhncmRyU3pPUkJWZkU1YmpsNHgyOXdkWks1?=
 =?utf-8?B?OS82b1ZYVVZJV3h2QVJpRC8zV2diN3FrN0JDbVpqZlRicmpNVWwrRjFCVUR0?=
 =?utf-8?B?bkRyT1FZbU9LUmJ0bVBZanM3dzAxOHE4UHFRWGdiWkl2VWVNREpwZVAxb3hq?=
 =?utf-8?B?MWp1MGRBMVdDWTZENzFVV2tyT0tRTHNLUzh0cDYwbFdISGg4ZHZ6cndZdFdC?=
 =?utf-8?B?Tys5M3phclJXQTJxSmtaYWVzSXBVVGgvVm1DdDFmUDZhYjJRdTVYS2FYUVVK?=
 =?utf-8?B?RWxqRmJiazZObzJ5M3ArL2MyUVJBNml5UTRobFcrQUhaUy85MGk4VlltUDgw?=
 =?utf-8?B?am5lREcvRWRla1M0aExtdEIwTmJ3Z29aRSswTUF5WU5hRXp0TTNWeHo2SHlN?=
 =?utf-8?B?bW5ueUxuUUdBZDRPUzUydmlHLzI0c1A3bnpSVXAvdTIzSy9md0FZZ1BBYlRC?=
 =?utf-8?B?VWlhMjdSQUJmYnprSTRJWjEycDduTS9LMmg1bythYnpTbUE2bzhCRm5CM0Zw?=
 =?utf-8?B?YStTdXJXRkFSLzI1UU43UVkwOTFad01reklyeWU0VzdNWWR3czNDVFZ0R3ZC?=
 =?utf-8?B?TlFPdlRQOElnVTNMRSthMllQY3lPcTUvL3Z1b2YyYUJKS3NNU05vVzhLZlFH?=
 =?utf-8?B?d3JsK2FURW1NY3JuSE5MbXFncE9Pek9TREJrMGJubzk5SWV0YXVJeXlRRS93?=
 =?utf-8?B?WlBGYnRWMWIvalM5QjV6N0RxMXJQeHFIRG5pWGFlNk5obVAyZUFJU3F5Y3pI?=
 =?utf-8?B?c3VOM043Nlo0TjNTdmU4NEJhajR1aWgvekczQjduc05VdDlsUG5ZdkJLZCsz?=
 =?utf-8?B?QlhZT1F1Ri8vQkc4RmoxV1ZIY2huR1B2ODNpc0hmVFNlSGpUWkFndFB6OHpB?=
 =?utf-8?B?dmZTZHN5NUlJVzI3bXNPbWkxdEVmZ1FLNHNmUzJLYlE5N0ZhdTV0NFlnaHNG?=
 =?utf-8?B?VTRXcHpqTDlrSDl2aWRIVWZtTlBzbWJCYW9BeXdKWUNGL1d5R1Y3VTZkNUtT?=
 =?utf-8?B?bHBMMk1NWklJNTF3NXc4bUUxZmNUQUFKR056NS9TRmZyWEF2bEJqNVBTOUZV?=
 =?utf-8?Q?CqdmfcD4MiA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3JBY3hTNzdsTklpMWNtbnZEb1YyL1ZOVnJjbWl0TVptbVRnN0oxdHJLM2Fn?=
 =?utf-8?B?MlREQ2Z6ZzJnWTVHcUFRLzJEaEY2a0t5SXFjZE5QclVTdGNZOExCbW9GcStx?=
 =?utf-8?B?blBpb1AxeUhWRmNzNTU1RCt5aUFoVkNUQ2JmSXZTZG5JTGc1bFNOVnNTbk16?=
 =?utf-8?B?NHJZdzdZK3Z3Rk5PODRmSDA4U2ZuaG5lQUh5OUlFQ1lNUHA2MVRQODFMZ1k1?=
 =?utf-8?B?aUMvUzZWWmVkUDJNRXZvVldobm9NL3hmMTJxSlVTR2V2MXREVDJQWG5VMmJU?=
 =?utf-8?B?UEY2WFVZRndKZFhzWHBoUFhsUHVtUWtad1pBL2ZUV1J3VVNlQVlQdjgwdmVS?=
 =?utf-8?B?SmlLUmNlVVJNbnBuVWc2UWxZN3BQbEVGbDBCOFdBam5SdTRqOXJOOEZ0TFNn?=
 =?utf-8?B?dGU4ZGt1eGJwUDE4djBySVI3bGNvZDV5bHZsQktlTjhaZllsSkR6MDB1dTNJ?=
 =?utf-8?B?bmdyL1hoeXBKM0ZPZnpSa0pORXZLQ3h2VktIZGk3RXd4TTJYYVp0aUxCdlMx?=
 =?utf-8?B?MzhTcFpya3orWW5PZ2lKYlV0Q1NmTy9TTTdSU3JBOWlDNkdPWjZ3TStLa2V1?=
 =?utf-8?B?RkFRZnc5TjdQSHRwbmw0bkMzRS9JMERpckhhb0dDZTMzbHNsZTlGZFQyZHhY?=
 =?utf-8?B?OFdoZ1ZZSklpc0VQYkxpNlo4YUkrcEZoQTJyNTlRdzF4Z0VVNk1DVU10SnpI?=
 =?utf-8?B?WlFQRGx6QWtNT3RRSHlBNUxmaTkzcG9qY2lIVUZFOTIwN255OS9KSjh5SWVr?=
 =?utf-8?B?UzZrL1JOcmZjeEVFUUIrbEplbFNBZ2FSRzlsM0I0dUJCUmpQWWhUL2tUVDc2?=
 =?utf-8?B?ZXRoOEVzbmZTditkdWg0bW1hRlhKYVQvbVd4cDN3KytFUDY2RlplNFhiaTFB?=
 =?utf-8?B?WEFWcUVzUzlqUFhOZldrd1BRNm5VRWJ4QUt6alp0OGN6cDljeGJKWTNnNkJD?=
 =?utf-8?B?aERNWlFKM2s0dGxOczl0MlpXVXljN1pBYWNoL09EbFBWdjgwMU40SjFhc0Vx?=
 =?utf-8?B?b1IzLytpT253MVM5T0hQV2N5cENWSGdrNDgyOERLT0RIQmM3d0pZeXZIK2ZJ?=
 =?utf-8?B?S1NKMHRoUXNZOURhdmkwVXJJVWIzQ3dxdnN6MGdkOHF1NHlFcHlBTG9LSlFI?=
 =?utf-8?B?VlI2RzFzdi9aM3MybDUyMnNrc2thdzNYVTNvSVFLWlIxYTNqSGU1TFVqaTMw?=
 =?utf-8?B?bTZnVUtpejMrWjJ6U1FaTStQQjhWa2l5TTlZVEc0cXRyM2hYeUd6cmdkNzRF?=
 =?utf-8?B?NUQzRGtpV2d6TXUveVBPKzh6YjFoSEkyZFhtcUZ3MUhSUzV6MThpZFNSMmYz?=
 =?utf-8?B?dFNyQk05OWdSc205eFNQVGdqYk1xRUFkbTAwTnl5eEM0Y0FsdlJqUHZLVUU1?=
 =?utf-8?B?alNwdUx4NCt2RUovWDlwVHFWd2V5SWMybFFNNitSQm54Z1AxY1FkaHVhYXEz?=
 =?utf-8?B?akVQNExzMkNDd0R5TWtzdm16cHdQd0dEMUZ2bDFzQVpUK21UNzBHdDdtRDhT?=
 =?utf-8?B?ZzVpZVVHL3MyMTlRNE4vZW1NSFdaZnd6NUJLYlRMVUVsd2lHY2o3ZkduRlVj?=
 =?utf-8?B?a2dLcU9ueUtVMnpNRFB4b0RKQnY5K2RoRGw4MUVSbkw1dlVaS2pDRVVEMWl4?=
 =?utf-8?B?Skt5SU9vT1BtWjJlNG5NRnRtb3NUTmJ5YlRBeVJrMGtJR200dHE0VDJ6UHFu?=
 =?utf-8?B?Kzh5cVVoblMrdmV1Ty9Jb3hmUC9pejQzQytnRzMrb0R6ZldSa3pvS1dmaGUr?=
 =?utf-8?B?QXEzZTVYeUJwdjVYVTJKY003dGlRSGF4Q2JubGNtU0hGVnZ6Zko4eVBkelJD?=
 =?utf-8?B?VFlSYVBIeHBvb3JySmEyenVtY0t5L3JtZkoyRldyN05HTG9vVTBkdVcxYUxJ?=
 =?utf-8?B?QVpNWmg0KzMrL1lvbC8yV3hzdGdRbVJJRnRIMmt3Sy9JekRORjVtM1N5S2kw?=
 =?utf-8?B?Qy9Rd2ZLQm5QRmpPREgvYUl3bm1OaC9IYW8xWmxMS0NIYWh5Tjlwd0ZpdVBP?=
 =?utf-8?B?R2FpYU9nSUs1a2RBaVN5ejhtTmlHSzlVVS9lalFFNExpMW1LZ2dXZERxMTN2?=
 =?utf-8?B?TnprTVgyTndYVktWWFpnK0JWM28wTVpEMVZqZ051dzQweFRmaUdVdHZsOW1G?=
 =?utf-8?Q?aCqHtCcOe8aH/A6rwkL6RUeD0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26424f6d-54b0-4d64-07f2-08ddbda7bcb9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 22:43:48.2812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4GXQ45zWcnPFdwZJFbsixBxDtQQ83YSi7+5BOOK/zfAvE1QCDp+hP4IIXqJTjcSDRDxgVF/+/8PKW1VnYV2iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
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

Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>


On 2025-07-07 03:09, Srinivasan Shanmugam wrote:
> This patch adds a new IGT subtest "amdgpu-vm-aperture-sizes-test" that
> queries the AMDGPU_INFO_DEV_INFO ioctl to validate GPU virtual memory
> (GPUVM) aperture sizes, including LDS and scratch base and limit
> addresses.
>
> The test prints the LDS and scratch aperture sizes in bytes, gigabytes,
> and terabytes, and asserts that the sizes match expected values (e.g.,
> 4GB).
>
> It also prints and validates the GPUVM virtual address ranges, including
> low and high virtual address ranges, and calculates the total GPUVM
> size.
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: David Yat Sin <David.YatSin@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  tests/amdgpu/amd_vm.c | 90 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>
> diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
> index 9cd56e2b5..1c5212463 100644
> --- a/tests/amdgpu/amd_vm.c
> +++ b/tests/amdgpu/amd_vm.c
> @@ -13,6 +13,9 @@
>  #include "lib/amdgpu/amd_cp_dma.h"
>  #include "lib/amdgpu/amd_memory.h"
>  
> +#define BYTES_IN_GB (1024ULL * 1024ULL * 1024ULL)
> +#define BYTES_IN_TB (1024ULL * BYTES_IN_GB)
> +
>  static bool
>  is_vm_tests_enable(uint32_t family_id)
>  {
> @@ -197,6 +200,88 @@ amdgpu_vm_mapping_test(amdgpu_device_handle device_handle)
>  	amdgpu_bo_free(buf);
>  }
>  
> +static void
> +amdgpu_vm_aperture_sizes_test(amdgpu_device_handle device_handle)
> +{
> +	struct drm_amdgpu_info_device dev_info = {0};
> +	int r;
> +	u64 lds_size, scratch_size;
> +	u64 low_range, high_range, total_gpuvm_size;
> +
> +	r = amdgpu_query_info(device_handle, AMDGPU_INFO_DEV_INFO,
> +			      sizeof(dev_info), &dev_info);
> +	igt_assert_eq(r, 0);
> +
> +	lds_size = dev_info.lds_limit - dev_info.lds_base + 1;
> +
> +	igt_info("LDS Base: 0x%llx\n", (unsigned long long)dev_info.lds_base);
> +	igt_info("LDS Limit: 0x%llx\n", (unsigned long long)dev_info.lds_limit);
> +	igt_info("LDS aperture size: %llu bytes\n", (unsigned long long)lds_size);
> +	igt_info("LDS aperture size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
> +		 (unsigned long long)lds_size,
> +		 (unsigned long long)(lds_size / BYTES_IN_GB),
> +		 (unsigned long long)(lds_size / BYTES_IN_TB));
> +
> +	scratch_size = dev_info.scratch_limit - dev_info.scratch_base + 1;
> +
> +	igt_info("Scratch Base: 0x%llx\n", (unsigned long long)dev_info.scratch_base);
> +	igt_info("Scratch Limit: 0x%llx\n", (unsigned long long)dev_info.scratch_limit);
> +	igt_info("Scratch aperture size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
> +		 (unsigned long long)scratch_size,
> +		 (unsigned long long)(scratch_size / BYTES_IN_GB),
> +		 (unsigned long long)(scratch_size / BYTES_IN_TB));
> +
> +	/* Validate that limits are greater than bases */
> +	igt_assert(dev_info.lds_limit > dev_info.lds_base);
> +	igt_assert(dev_info.scratch_limit > dev_info.scratch_base);
> +
> +	/* Validate size is expected (e.g., 4GB) */
> +	igt_assert_eq_u64(dev_info.lds_limit - dev_info.lds_base + 1, 0x100000000ULL);
> +	igt_assert_eq_u64(dev_info.scratch_limit - dev_info.scratch_base + 1, 0x100000000ULL);
> +
> +	/* Print and validate GPUVM virtual address ranges */
> +	igt_info("GPUVM virtual_address_offset: 0x%llx\n",
> +		 (unsigned long long)dev_info.virtual_address_offset);
> +	igt_info("GPUVM virtual_address_max: 0x%llx\n",
> +		 (unsigned long long)dev_info.virtual_address_max);
> +	igt_info("GPUVM high_va_offset: 0x%llx\n",
> +		 (unsigned long long)dev_info.high_va_offset);
> +	igt_info("GPUVM high_va_max: 0x%llx\n",
> +		 (unsigned long long)dev_info.high_va_max);
> +
> +	igt_assert(dev_info.virtual_address_max > dev_info.virtual_address_offset);
> +
> +	if (dev_info.high_va_offset)
> +		igt_assert(dev_info.high_va_max > dev_info.high_va_offset);
> +
> +	low_range = dev_info.virtual_address_max - dev_info.virtual_address_offset;
> +	igt_info("GPUVM low range size: 0x%llx\n", (unsigned long long)low_range);
> +	igt_info("GPUVM low range size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
> +		 (unsigned long long)low_range,
> +		 (unsigned long long)(low_range / BYTES_IN_GB),
> +		 (unsigned long long)(low_range / BYTES_IN_TB));
> +
> +	high_range = dev_info.high_va_max > dev_info.high_va_offset ?
> +			      dev_info.high_va_max - dev_info.high_va_offset : 0;
> +	igt_info("GPUVM high range size: 0x%llx\n", (unsigned long long)high_range);
> +	igt_info("GPUVM high range size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
> +		 (unsigned long long)high_range,
> +		 (unsigned long long)(high_range / BYTES_IN_GB),
> +		 (unsigned long long)(high_range / BYTES_IN_TB));
> +
> +	/* Calculate and print total GPUVM size */
> +	total_gpuvm_size = low_range + high_range;
> +	igt_info("Total GPUVM size: %llu bytes, approx. %llu GB, approx. %llu TB\n",
> +		 (unsigned long long)total_gpuvm_size,
> +		 (unsigned long long)(total_gpuvm_size / BYTES_IN_GB),
> +		 (unsigned long long)(total_gpuvm_size / BYTES_IN_TB));
> +
> +	/* Size checks (adjust thresholds as appropriate) */
> +	igt_assert(low_range > (1ULL << 30));  // at least 1GB low range
> +	if (high_range)
> +		igt_assert(high_range > (1ULL << 30));  // at least 1GB high range if present
> +}
> +
>  igt_main
>  {
>  	amdgpu_device_handle device;
> @@ -230,6 +315,11 @@ igt_main
>  	igt_subtest("amdgpu-vm-mapping-test")
>  	amdgpu_vm_mapping_test(device);
>  
> +	/* Subtest for GPUVM, scratch, and LDS aperture sizes */
> +	igt_describe("Validate GPUVM, scratch, and LDS aperture sizes from amdgpu_info ioctl");
> +	igt_subtest("amdgpu-vm-aperture-sizes-test")
> +		amdgpu_vm_aperture_sizes_test(device);
> +
>  	igt_fixture {
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
