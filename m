Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFBACD3427
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 04:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8173710E24D;
	Thu,  7 May 2026 04:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i8xCHdjZ";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F47810E24D
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 04:08:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/Oo7YSMZbaTBDpSwUW/oIFi3j3SuAzlodkGK8VEAUElUNE9V8ZEm1snT4yscy+Rz9J18dt/Sgn2CTaMHWWqhXD30e2EIzDJ4xV+1axRGXVZtTcAtbQc6/jZ1XYrndrPn61Mc8XCPDWXza4Zf8ogB9EXi6Q6pQUw4JbsVKBllL1ZEg1NOOfAKpEecr77SAuSWjM0q/yZZts/0fAZR/uuEAAyQRjgvnRwqXJ4pHhKV6Bzp3RmhktwGDDEpzHnFqzh3PXkCbQ0BNMN8mZdSAmIril8a03XaLDhxpZRLOSHKlU0NgrLiQMBxWl8XI1idjVeyOfaOKKphibXIGLOtvLqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3hOiRONqibSrLruos8DtszYwse9v3C5FrrBgrCSSSM=;
 b=LzBbgW0Z+i34mzGeERFi77SoyeZ9qfWNej9rS59hr1Zmp9b/e+Zj/0sTpb7N6B1UYoAf/4+pKeioIEd6Bk2a9KKLzxNt666P2Nws4W5QgMtSCm6/1ELYAJf8ftQuEYHUmDb0JAaqWpBroJYmgRAUzu5Rt2s/MJ9JT9J/2vKBs5OuBXdRLjv8vajBzkQTxs39Jcj7b22skqtLKLyUgqH/DvjoHMhUBQPBOn5OXRiQnBjxY1hBA49oYPBPLCzPh6BRr+egLQ+a7I09zlu6fA//8dTPuwg6fZYH+E1ZQ6LBZfUldzU7o1oT1BJG+p39/uV4j5BSs8XBXL2/BTnZGlY+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3hOiRONqibSrLruos8DtszYwse9v3C5FrrBgrCSSSM=;
 b=i8xCHdjZk98yMMztwB/5E7etXAjbIalOy0bwrieo0LLV4iR3ixyGsHByZmSHiDK5qdhSBlRdInoBoJJvOqSF90LPywQPNlRJrRpmZ20zeIOtUY5DcsIXA33dEiwdFM991+6ONkc3qWY2Kt+nf37bVpt6Pqc9LGu7RaxpvLoCaoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 04:08:21 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%5]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 04:08:21 +0000
Message-ID: <a243c8c9-7681-4633-a25a-2b01fa33a53a@amd.com>
Date: Thu, 7 May 2026 00:08:18 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: vitaly prosyak <vprosyak@amd.com>
Subject: RE: [igt-dev] [PATCH] tests/amdgpu: Add KFD IOCTL fuzzing test -
 Apologies for build failures
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 831dcd3a-f436-425a-9a86-08deabee46d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 8PMVIRsmRrqNouiRcoMUonwjh91xKcIxUXxejEkqCbMecaDT/DS1zodkNpX9hyiLMUxcZ1plHKk9BWeYCDd+U2mSKDT7qmKXxXOIdUeZg51k0eLi5o4f8vXTc8XkKS6Ue53G6jQwqSQvETM73yyXJtKM+gks/gbdLSdZRx4AahdNH0/4guhBOEw1ALpiZ2v4MbRAlO0rciliVk3JPYTR+zQ6WIZzMqNCT9pPtZZ7u2yierLKsVLCDSYxLHA3cCBW8aKK/z4OwN7pa6cYhJueN2yQ8VgcIP+qBZ/AQCS4iBQ5z4oVdsc7Syty2MeLFdSEI4VNmZENPMixLvJAo6Mm7PdylpDZ6nUqcNr0uqbZceiWVgAL6IbjthU0Z9+CHfP459uMQr/elLbSPiAVLl71unfQC0FmjMRzUM+5ZLRgFSuUWDBhpna7HRjCic2dCFzswPMHWJfMrPkdEN0DjKizbhcn1HWm7pI675ZrXQ7xu1MvbEIFDetOTTC9iHaBCdwLW4N9MnjO0adHgp2+9tleOSH5xR5AdGDvWOZua4O9Vj/yDiIXqzbbV73qsoq5bcWq6ttHA3KzHwN6xxL2riRLm36LciOi++BK6SOjMJ09xy2VMv0x8Xw+UBS0RxP0+BLZvkl/ioF7IiAz4eMJEVLOio2DBkIvGA9iBc8zN0B41wZ0EpJoJ2Lxd8j2pGSwWO0g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1lCZGwrWTdpd3M5MEI4WDk4S3NjS2UwNkFDMXNHckV1Snd3MUVXRmlTK1No?=
 =?utf-8?B?Ky9ubDZxWGNXSEdtVmxDZmVvRDg2RUZVZ1pwdUJkZGtSVUpORUMxbklHLzJW?=
 =?utf-8?B?Y3JZMm5IQS9UVHBzeUtQTnA5eERJd1lma1lBWlpEYUhaZm9KU2lCZDg3SFNj?=
 =?utf-8?B?c01FWTJNMGlwK0FIZEFpbW85ZDVCY3o2T0wvMFZzQ2E5eERyQ1Qrd1dKRWJt?=
 =?utf-8?B?M2x6eTJSY3JqY3pHNUl4YU9NR2t1SThhaXF5MFJDQmZUV09HSW44Zy80MG5N?=
 =?utf-8?B?RjNNL2V0Tm5VK2E1NWJOSm9lbVNSNjMycHc2YnU1c2RJQ1Z5VUcyTTFIM1ND?=
 =?utf-8?B?cmVRUlREb3VTYkJaTDRHMEEzYnNUMGpxWllEMERoZzkvdmptKzhxWnVtY3d1?=
 =?utf-8?B?M0MxVjllOTYrYlZSOVo4N1IyaW1OSnRsamUwNXBuelNnMW1HeWIrM012Ti96?=
 =?utf-8?B?ZjlKWVZ3eENWaVE3RUpUY2RTd2x3eXBIVzlnR1ZJTXpqcE8xVFUyUlUrY2lG?=
 =?utf-8?B?dU9LUmZDMlg2dW9YZG5raDYvZEN5TmRrK0dwWlJBbC91YXdiOTFncS9FN2U1?=
 =?utf-8?B?a050b2xmSkd4SG4zZTdXd0hIR1l4RUd5cVhndnJ0cjc3cGxvcm5HSGc2Mmd5?=
 =?utf-8?B?bjVTTWx3SkVYMU1JYzJVUkhTUWs4ZkRmWVpodUJGc0puSHViWjNzSXZMcitK?=
 =?utf-8?B?T2swR0s2ZW5mM1M1SnU5T1Y0aG4vNzFjMVB0WjNpdHkrRUlFc1JSUlNYUHZP?=
 =?utf-8?B?QW83bGcveWxCUytzUjl5bVM4MkNkU2oxMTQ4UWVUbE1Ib0FSaWF0ampmNFRv?=
 =?utf-8?B?czc0eDVHc0FEaEhUME9JUCsveFNOM2lpaDI4MjFGa0ZkZUc3SHJ3U284KzRk?=
 =?utf-8?B?ZWtYNm85bUozQ2VUMlZnQ0F6TkRhTjVGcEJ6Nng2TmppUStSM3ZuN0FJWDY4?=
 =?utf-8?B?TzRHOCtNTCtOK0pTMXphbm56SE9URWlXNDVvQW1XT2tCdWVJbzBhYndzTzY0?=
 =?utf-8?B?TjVhaEtEODhBZm1NWnp2TXVHY3AxT3R1OHhjQUVrMmx3UDVSUVhwc3lUSElG?=
 =?utf-8?B?NVRuUTJ6VnIvWnEwZXVISGJRN3N3YmttbDFJTG8wWlNGWmlDRlVPYnRXU3Ur?=
 =?utf-8?B?N0hkdXR2allDTWIwKzJJNktua2lQanN1N0FsZko0QnJWVXdNV0JyYmVld3ox?=
 =?utf-8?B?bDFNR2NIODUydkZvTzl5L1BlMUJOdjRxajlFSDM5RURCRSs5Nm03ejg1RE9p?=
 =?utf-8?B?UkF2L1lMUTZUb1hlRmdNaUE3UjhjeUMxcEg3ZTNRVytTKzVYajE2b0FXTFpH?=
 =?utf-8?B?YWtIQnFVVlJubENPUjRpMm5wVXRVZnlISGtEWHlBTGYrem5RbXpVR1Q2U1BW?=
 =?utf-8?B?Mkd6dkw4Z3dYV09BWFdqOGlXNFlnSjZqNVdZMmNzNS9kTUFtZklEdlI3NXNj?=
 =?utf-8?B?M0pSWkdCRktaNVgrZ2p2VWNCa0thNzk3SzFXQ3pESURMT2VHeVhNeWVRYmp3?=
 =?utf-8?B?aXZpTVhDODQrL3lhQk9KS1p6Uk55WkhuMG9zMFVwTW9RWG9MZFA1QnpNRTFV?=
 =?utf-8?B?ZU1iWjkrL1Zwbmp5b3F1VmdSOE0yN0NOcnpJdHlsZmdzS3AweUhOdWxaSWFz?=
 =?utf-8?B?VDhJRWRKY1NlVlQxbTVVaDlOb0hremlWS0ljRHdjeTdjNlhQZU45RzJzcmt6?=
 =?utf-8?B?bkx3aDdMbmFTd2phK0ZYWithOHZIWUltTURMUGY3Nyt1QkVrcmdGK25ZUDZQ?=
 =?utf-8?B?ZEV1YW0xQWt3YzJWRFlNRVlDNjh3WHByd3c3Y29BaXpnams2c0hsQVUwL0Fo?=
 =?utf-8?B?UlQ2MGhHU0lGL3hQcFV1eTFZRmh1bXl5SitBaDBlTWR1dEtHUVZYSk9UWDBG?=
 =?utf-8?B?T0FxRVJCd043RXF2K0hKcjR2ZCtWdFZLeGMvUy9rVzBKbFpMM3c4dDRaZUxv?=
 =?utf-8?B?ZDFNU2ZMTis4cTJJcGV6TnhZblpQSTFzR2lYTGpmdGdxdzR0ZGxKQzlEejMr?=
 =?utf-8?B?VFNOU1pGdjM0R01TZ2d0UHBqZ1o3WnoxWUtPeExad3JESzlZMlFMZC9ZaDNn?=
 =?utf-8?B?b3JnQ2dJeWZFRlhxak9ibFMwYU5XVVp5dS8xK0JIZHpmcENCVlNzNFZSa29R?=
 =?utf-8?B?eGZybXFPSldvOFRqSytNQmk3YjYvbHBrQVpqbkg1TElLOFk3d3JKOWtZcUkz?=
 =?utf-8?B?Z0JDSEVOcUFWNlV5VWQ4TzVnbEtETTdZVVdkQnFwMXIwbk4wb0JETnpjM3Vs?=
 =?utf-8?B?QXZuNjhBdGJ3UTNWZ0MydUY2d05uVVNpNjVYd0FaTmNEd2lZQmFrM3AzK3Qx?=
 =?utf-8?B?UXQ1bHgvSUloS2VRN3BSclU0MXJ6R3hsNXBFNWo0YmVDSk05Y1FyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831dcd3a-f436-425a-9a86-08deabee46d6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 04:08:21.4985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSIVwZjhDQz3r7qNwsJF0S51cSWtkrHty/s6sOi2jF8u2k3oOQ6S0j+AyVyNSjOv8LT29/2wfCZU8Sq4kqL5Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591
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

Hi Kamil,

I apologize for the build failures in my recent amd_fuzzing_kfd patch series and the need for 3 additional fixup patches to address ARM cross-compilation issues.

The failures were due to:
1. Missing drm/drm.h include dependency on some systems
2. Incomplete KFD IOCTL struct definitions on ARM (forward declarations only)
3. KFD being x86/x86_64 specific (AMD GPUs not supported on ARM)

I've now submitted fixes that:
- Add proper header dependencies and guards
- Restrict KFD tests to x86/x86_64 architectures only in meson.build
- Follow the same pattern as amd_kfd_dmabuf_unload.c

I'm curious - is there a way to see build failure results from patchwork.freedesktop.org before patches are merged? I couldn't find build status information on the patchwork interface, but I'd like to catch these issues earlier in the future. If you could point me to where CI build results are posted, I would greatly appreciate it.

Sorry again for the extra churn, and thank you for maintaining IGT!

Best regards,
Vitaly 

