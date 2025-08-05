Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D4C87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 00:54:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090410E054;
	Tue,  5 Aug 2025 00:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d63rX3JR";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6909E10E054
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 00:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru+9NrYwIDuEpvCpafeGqXscDIWlg9at1aS63KVZo3IgQJU43+xwwKKw6ep2UA+/2oHLSjMotXYUNhxtJRdBfGmZIHtBWyHzPj3jzGdAVwXBeu2EyhWE5Dkx1q1Og4cR+OoR67yg8PxkBseqHfVRNtZi9zOo7G55/2DiR4cbc79V49sJffhfA6GF+mL6edvoVIISIC3pm/hJehs4W/tKJOX58vEMPK3opN4AJpziF2PQlOt+VCztentLkgheSwN9mM4yKhapZwXbA8xGVeG2sNMJ6dj9qL+5oWoGFtchfoMSjaFbXoc5JU2+LwHvk3blq609UJ7r1Q3I9PoekYilhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwD8zMppP4NEoUW9gB46VX3iZ3A8nRwh/FGagJVYWn0=;
 b=b5Lw45VeJ6+953qNS53vQs5B1OEvSAclg/kqEA9NrV5yS0srBWziRficGh/ZNouot00n0oJmaLUkpqwhDC/3hy1uGp26oJ+ZCV6ceeXrffQdJIByJt3CllDrZpYFCfwSQJ5wex3qkXhqr9orvMf7t9LNCJ+Lygl3no+CU6dfDhfInb0mEizhTwe4fR7GzksHaWZCF1iMvtAGyZcvQHF5PGiiug814chGiiib+HcS4A1wmFibVSzErDHLGCaxthlgoZj88g2vKZ9gSwIpaMIRgkGqkH4yBUFqUdygmQPfyuUdMfchvr1sCbNNu1bSK4DD/PkAxUIgsSlcN4v7Q47dCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwD8zMppP4NEoUW9gB46VX3iZ3A8nRwh/FGagJVYWn0=;
 b=d63rX3JRa+4xMgKAxIq5LZlzGmHZqYISKf5bJuXezLpcsHztLFGRcerVKHS8yCVCpd95+FKYK+6UEUDUByOnLKXLs0/++qLDTMs4EXheLPQYhveJvydcBOIPBe+7LCAsxdal+F9WXR2Kuv5a0za1u9SjF3iBNJA4H2u8OHHVODI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH3PR12MB8934.namprd12.prod.outlook.com (2603:10b6:610:17a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 00:54:32 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 00:54:31 +0000
Message-ID: <734e8d0a-25af-4dae-9c44-781fcf2befec@amd.com>
Date: Mon, 4 Aug 2025 20:54:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/4] gitlab-ci: Rename blocklist verify script
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Michal Czaplinski <michal.czaplinski@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Rob Clark
 <rob.clark@oss.qualcomm.com>, Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250728173152.220113-1-kamil.konieczny@linux.intel.com>
 <20250728173152.220113-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250728173152.220113-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0247.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::29) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH3PR12MB8934:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e66a110-62a7-4f31-0400-08ddd3baa309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUt0Y3QzRlA3WWNxY251aytxN2pZdmMxcVQ4OExMMng3KytydWtBN0lFcTdV?=
 =?utf-8?B?cFVkelZ6dGltdVRLZVl5T0YzU1NvaEM5aFoySzYyTUdzRWV2T3BSMm5XOTBZ?=
 =?utf-8?B?Ym1aZk00d1hKcnVKc2RtN3F6aU10emlxWm93SGoxLytWdEJzcGxDM3ZKWXI3?=
 =?utf-8?B?V0xJblozSFFNcTl3LzdjRWhMSUhtdkxBM2RtRXdvOGMwUENPbUl6S1VxcEJF?=
 =?utf-8?B?bUVBM0VwTFA5amxJWkpIV0xjcDM1bFFwWnlTSC9VOG5VYk9uNWdXYUd0TGda?=
 =?utf-8?B?Z2xGK2pURlJrUk93TjR4b212NHBleTlkcFl1NklPSGN5dEdPa1JTRExLdTdW?=
 =?utf-8?B?Y1Q0eHZVdUtrTks2TG10QkszSDduVkRvUnBMSWt1dkdTYkU0T0liTythSzFX?=
 =?utf-8?B?QXczTGlRV2RJZEZWZFpka0FtZUFjZ2krb24yTW9YZ0RHZGp4aTNya2JBRWxm?=
 =?utf-8?B?NGkvbFoxcWJlTFFTVTBDS2JzdnVPeFZhQTlwTFc4T3JlQnV0QW9SOXN2UXRE?=
 =?utf-8?B?Q2dEQnlaWktFckUybTB1NWZWRDM0bk5JV2VtVUdXdDFRTFNtSnk5V3VVZHZp?=
 =?utf-8?B?SWZxejRYb0ZvRElYRiszZldZOERjWUtTdHI3SzFOc0czckU1TlBUL3dLUzdD?=
 =?utf-8?B?eHBWbXRKaTlBYkFtQ2pFd1BVVi9xbUM0MDFKbXBML3RuR2o3dTRHMUpZUys0?=
 =?utf-8?B?ZlQ3TFdTdHhVN25LWDJqUFgyUGpvL3YyUUh1bExSczBCZ3p2RkVaNE9hNlFO?=
 =?utf-8?B?ZTZ0NUJRMVlRZEhoampWWEpiT0o3c2hwMGIwVFo0OC94ais3N3VPbEw3WXRz?=
 =?utf-8?B?YW9hWmZQZHNvMFc4YWVUWjJiTkNhb2dNN1FkUTQrUGpzYm9NM1hZM1Z4VlpQ?=
 =?utf-8?B?cEtJeVllOVJqMmphR2RlWGNucnZ1Q1hGZEdSelh5ZjFMQVpPeEt2ZEZqZHRn?=
 =?utf-8?B?dE5kN1ZGVTUvS3NvVVEzMkVMUTIwU3M1SnZJSWJvVzNmOEx1WWJZSEdFMzlE?=
 =?utf-8?B?VHd5a3JUeDRUUVk2S2x6aW9zeEt0bnBLL2kvMzVvWEdrU2k5bERRNDRGdW9X?=
 =?utf-8?B?VXNkTnF6YW8yTmZESU4xMzZkd2NvbHBTUEVndWZLeFZQOXdCWDZSNXdESDZD?=
 =?utf-8?B?NGc5WlZLY3hkTllRUjhWNzVyWVB1NUp5WFRRYUg4djBXcDNCVzhxQXF0Nmdk?=
 =?utf-8?B?amtPcVJ2UStTMEZPWFZPeitBcDIyTm04QS9UQjlaZStaL3NRUU8veGtHbEFM?=
 =?utf-8?B?MStQVEtmbzhnNUltS3pLWW5ad3Vpc3V3eVo2aGxLaU4ydVpvUi9TV2pBWkNp?=
 =?utf-8?B?d3RuUGFndTNXTEJNRE5NTzc1QTJ4ZE1lOUpyaFhPd3FRVE9ubVdpRnJ2RWNI?=
 =?utf-8?B?S2F1V2FJeDVLM082am9MbllWbUFxODJaTDFvQ05NTG1aWEZ5V1dCOEhCWkNt?=
 =?utf-8?B?TEs5YzNOendkYnlzNVZHYzdpV3RGTTlUS1llUzJjaHptU0Z4RlFZdklsemMr?=
 =?utf-8?B?QWtJdENJWTQrVkNJUlgwMzFEbUMyTDh2TGxoMVZ5Wit1aW5RWnJ2TjFYeW9V?=
 =?utf-8?B?VjdCVW5wbnA5QSsvb29hMlhrTk43bnZCSE5XSHlZRnlYOVpSMi9rM3BaYVFu?=
 =?utf-8?B?MW5JeEFXMUpRMk1hQ2RRREFGRnFyNTlvcGhzSm9TVC9LanNDMElyZ2ZLUXJr?=
 =?utf-8?B?STFNbG53YUV0UWZnU1crWFNKeVpnWHBCMnZzbzJ6Rm80b1p6YWJDdWFORnpK?=
 =?utf-8?B?b2I0bXhydUlSNWFHbHF3aGNpcDdETE5vQTYxZWhWTDN4ZktFVG5QUFJCUWdR?=
 =?utf-8?B?NGxmMk5zSFNuWEpLczA1ZGIzSW9uVmZ6cHZFcUZtT2tRQkdOUkhIejlTYlZG?=
 =?utf-8?B?OVdaM3dXd0R2MHhMTUFFcjZTdGt0OXdsSjM3WnRhUDEyaVNWSVM0eUV2SDNG?=
 =?utf-8?Q?qb+VnOhxR8w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJwYWpRYW9vK1Z1U2oxcUw3Si9CRlRSWUtSL0d3WTJOUlM0ZHZ4TDFmSWxH?=
 =?utf-8?B?MGFBaHFLREhhNWJ0YUJ2czdHM1RDM2pqV1lLS1I3MStiMExDUFl0RXc4c2ox?=
 =?utf-8?B?MTQ4ajl4QVRxUjFjYjlZK3BOYmlDVTZRMjdySmM3THNKS2FsM1Zqano4WnM2?=
 =?utf-8?B?S0xMejA3OEREZ2t5ZHc0MEU5em1kWm5EL2FEWjI4Q2NuTFltUHNuNmcxMU5Q?=
 =?utf-8?B?MUdNallIS0tuL3FVcVU5VFFuSHFiS2VxSk1jTmR1WTVxMitUcHdLZm52dmJK?=
 =?utf-8?B?cTN1bUJ6VkZOS1JXRldCWkE3ZnhWT2FwSG1mSFdjUUtmS1dyckY2cmorWGti?=
 =?utf-8?B?U3dsUDBSNXJoVzUzZTNwMm1FRWYydW8wY1FPQ1F6RWFRTk5vdW8vOHpJcExK?=
 =?utf-8?B?SWtDV3A0Ny9SMnB3eGVRekw2SzdKZU50U2lnQ3ZUZm42M1FmN3RMUmhmQXVz?=
 =?utf-8?B?SUk5R1FjNDdpVG5lZGVVWDhDdzBoU3NiaUJGQ1dHdGJUdUhvTytwWklGTHVh?=
 =?utf-8?B?Nm0rMzB5YjRYczNja2VKZWd1aUJodFBhbnBpaW1rbVNvUlNTTWxDVjk3azd5?=
 =?utf-8?B?RWdaWWUyVjd2V29jWWxwbW9QS3VSemlRSlZTM3o0UkZMOGhRK0thU3kwZzJZ?=
 =?utf-8?B?NHpweEV4aU1PaXk4MkVCdGZuK3g3YmhFRXk0Q0ltNjA3MTdUejd3T1d0emc4?=
 =?utf-8?B?YlJKaWR3Znp6RjJleEwzdS83b2RDN1hiVlJ0dUZjVnA5dE5yOUVuQ0FodUta?=
 =?utf-8?B?dm9XeFQxYTRqbmxnU21SM0tCcVNTckNFUXZuQW5PL2IxallwUUJkeFpnL3Iw?=
 =?utf-8?B?ZUVwZTNPaXBsZFhJbEtxZ2FVajNYcEgrRzNWQ1ZsekVrMktLdXhMcWpNWjZ4?=
 =?utf-8?B?eGV6aWw5bjJYZFdwVjNiMHZhWmlqVklXc3VGcnJ5RTZsdUFkeUFRYlNIbkM2?=
 =?utf-8?B?ak42eldiejU1SFdWZHU3c25ZRVI2S3c5YzcrSHdsNjhUS2F0QktuVWN3V1FM?=
 =?utf-8?B?TTVEekQ4eElMLzkvRGNrV0pSL2ZoUjd0cjBwUnBMbE1KalM1eE1KZUlLOGQ4?=
 =?utf-8?B?cFRoLzQ5K1RGZGs2a0VJY0NRazBvSCthNXlJcDR0WFZ3Q3JyNFkzUGxLcWNw?=
 =?utf-8?B?L2Z6UWtOYVhhTGM5Y1Z2b21GSlNhbyt0amdkT3RWcnpFN3EvMGh4YWFybVR5?=
 =?utf-8?B?MDBoSjVlS3pGbmxYSnVaRS8wWEJRMjNZdXNFaFhnNEdMVFNkemlHTk5CZjNp?=
 =?utf-8?B?U3ppOGZhK3V5Mmt1cnF2c3VpVzZmc0Jyb2RWRndBMCthUUdkbkY2VVFseCtO?=
 =?utf-8?B?aXlyOEtZMHRibkxFSnUrbytYMm1ZbU9rQ2FnOEJUNVkwNGhNbCtManhpdTFI?=
 =?utf-8?B?dHM3WEk5bzVZWUY5MzR0RkNqM2ppNVFlb2o5ZlpHUlJXaVdqdmFORnZ3Tzhw?=
 =?utf-8?B?R2RiQncvOFdWM0tGR0VXNjJ3dzdBeHFsN3lXemJkMnltSWtSRDZDY2NURHdP?=
 =?utf-8?B?SnpFUDlZcy9VcDVtWWdDVWJ5MFp4R0NiTW5uempaMDZIY2txR0VQd28rNkVL?=
 =?utf-8?B?ZTVtVFowWjVaS1dGT2o1TFZQQm0vTUFiTW5sMWF2dmZOKzJ4czJZNGNQQ2NU?=
 =?utf-8?B?ZEhQdmtQditlUHBUbkI3dUNHamczMnVjczl4dDFYRG9INEJmUWxKeUlGemFK?=
 =?utf-8?B?Y1h3WWtOZ0xJSFRPeDBPdmxMUG5EQkZLWXcyaWlmUzZsMlloWGhLRkVjK201?=
 =?utf-8?B?ZnA5Z21keHdJdWt4bzc0SVYwK0hVWDFOUHNxWGVMamZiSjgvcjl5V2szdWxQ?=
 =?utf-8?B?K0ticEhkeFVicXNPRDdpdkltNVd4RDQ3SEJQemVKVDBhN091L25FeG1CaEFz?=
 =?utf-8?B?d1hGVEh2bnJjclo2N085QWxCcUJ3WDIwdGFiZWxQMDdlWTg2Q1ZpZGlYdkxB?=
 =?utf-8?B?SVVmZ095Si84VkM1cEMzVEUxTzE5cHlVRG9ta3JIRHorditmQitmdXF1TzFB?=
 =?utf-8?B?c1VWdk1aUnloK1lEY1BCTFljZFhwN1l5TEJQZkFGTzY1aEZFejFDaGJFdVgr?=
 =?utf-8?B?c1lMd1NPWGhFQjZiZGhXNGZ0cjFlckpDUFEyaFIzVktscnc3RFl1ZlhjNlpS?=
 =?utf-8?Q?YobN2VgHTy69HptWSj/MFpHpa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e66a110-62a7-4f31-0400-08ddd3baa309
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 00:54:31.2401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8A/YLmpS41yFOu8v3r6aOEX6FC0/O1jRHepryMU0Uq3Cit4BL+y4F7QHtdQiorRLbQ/DDRjZnc4pR4SY0691Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8934
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

Thanks, Vitaly

On 2025-07-28 13:31, Kamil Konieczny wrote:
> Rename verify script and also pipeline which uses it.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Michal Czaplinski <michal.czaplinski@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Rob Clark <rob.clark@oss.qualcomm.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  .gitlab-ci.yml                                       | 4 ++--
>  scripts/{verify-blacklist.sh => verify-blocklist.sh} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename scripts/{verify-blacklist.sh => verify-blocklist.sh} (100%)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 8098f2b70..fb5713fba 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -227,11 +227,11 @@ test:list-undocumented-tests:
>      paths:
>        - undocumented_tests.txt
>  
> -test:verify-blacklists:
> +test:verify-blocklists:
>    dependencies:
>      - build:tests-fedora
>    stage: test
> -  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
> +  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blocklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
>  
>  ################### DEPLOY #########################
>  
> diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blocklist.sh
> similarity index 100%
> rename from scripts/verify-blacklist.sh
> rename to scripts/verify-blocklist.sh
