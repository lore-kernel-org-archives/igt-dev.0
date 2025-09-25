Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFADCAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 17:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB2510E99A;
	Thu, 25 Sep 2025 17:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C7gtL84G";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204310E99A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 17:58:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7gp5Ldb7ny8ZaN7WhOrB4eNUkZc69UNn1RmhwRjqavpCzQw7fiHE22TxfCL2mvFxmgh1DjFMxN7YchQhV2fmNIhz3AES7hnUAL8gLpcuKYikpyaMd9wJfnLns7iqrhICEyXTQHr4I6w0348OMzj7cGpb7Lh0rxCZMjDCDHRAs6IlJZpePG6g/uedo1NOLEd9phdHTKmtqBVHvK6aGW+GqL2vEWZoxe26P5PzSkcOABab5TWsDc3koBvuyLjVprQsqWgXQqUjlspiOocur3VkYQWPpmAxuIo1XOKdIS3vQ348Gw7+8skOQ61ePZ/4USdm2k1BgiSaRN+DPyDbqamBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekTCpibTC38pNehIFr2AX0b9Vx6Nz0g4KPt52pycz7A=;
 b=t3jtysreMKXcAf1yDf/1xaBG4t/6LIHdrsBkHtXQZOzo4GEtAaMsTkP7pJ6yU0cIGnoGnA12k/7DklwWuU49uWxsb69IICaM/XyXcoSXHgjNDXuM9S6Qyidmqjkrs1Fs6aOg/kvJBFd6DFrJtbyKB6iTBjSTbYW3VlyjbwtpmPI0K/QhcyEtnQcGbiMo6hWKU+J3+YJbB/OlXFj/WxznXgHZT2XGGEMGOw1y1yxZG7iPcag7xaVgqVks64/1/ZIMJMFdGUQOyZpaYG6XlNBt3zHja0fc97EpzL8B3BRxjTq37LtdWst/z8eqP9gWsv97MgMIHKfPabj2/1vNd0g4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekTCpibTC38pNehIFr2AX0b9Vx6Nz0g4KPt52pycz7A=;
 b=C7gtL84GBniHKYV1+QtXgpZZKwvZuqjXs++6bTQf8IgAknv0i3oNgc834CCea/IZ2sXqGnARbmKV1bvtrZQbtBW0BLyXUaILts+rmWlIHnytJhf8pXwvYZdg7pILqdJPgKUs/mUxyvouVblRxRWe26+4yvt1SbEtb3R811qrNsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 17:58:39 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 17:58:39 +0000
Message-ID: <3812db92-d714-45b1-9f27-96d7dfbc3732@amd.com>
Date: Thu, 25 Sep 2025 13:58:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu: fix vcn encode test on VCN5
To: Yinjie Yao <yinjie.yao@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250925170405.145614-1-yinjie.yao@amd.com>
 <20250925170405.145614-2-yinjie.yao@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250925170405.145614-2-yinjie.yao@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0181.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::11) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 13da8d21-b032-4a12-ecae-08ddfc5d27f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWhja0wycE13SXFmVW40RkNjM01Ndm1QTGdOSU5tbVVYenpqV0pHRUVseWlD?=
 =?utf-8?B?SGxkdURsbDdTekdxZnFHTGJTR0dBOHhOZkV4VUhzY1liVXFlNk8wc00vRlVT?=
 =?utf-8?B?ZEdKU1RydEFRTGd0ZkxUcmUzRWVZODFVaTFCcDNXZHpXTFVOUDlGN1YyRkRy?=
 =?utf-8?B?NkNqb2hMVENlaE9HMjIxZEdaMUF0a3loSXdibjhLcTVjV094SnFwd09rOVg2?=
 =?utf-8?B?WDdMeUpEYklOZFFwaVVreGIxM2ZqOS9NaW5kVzVUOHMxd24yMGpBY21KUkto?=
 =?utf-8?B?MzUzSmlTdTQrUzdIcjFnbHR1aWNmWTgycE5MZm1ZVnQvU3dSSEZjckd5bFYy?=
 =?utf-8?B?azZJb3ZqYU50UlJLbjAvTWpCNnRvY1FQMndtRDQvSVpRN29nMUFxZmREZnhE?=
 =?utf-8?B?NVUwVFIvSnVYVmRYMk90REFGQW56UFdmSDZudFpFbk5DK2l0Q2YvUU9odE43?=
 =?utf-8?B?L1VOaU90d1ErUjBPcjFuMjdQS3kzTm5UQnhwMndoQUZIVXJRSG91RkNOWUhH?=
 =?utf-8?B?cTBaNEFJNWNHYWw1NzBiWEUxQlNldDBFMS80VUg5VUxlSjZoM1MzMGlRZXlB?=
 =?utf-8?B?TE5mSllVNjhYaEQ1eHlxd1piYWdQV0JLd1JmdnVPVXNXS0pXaVFtdFQrbVow?=
 =?utf-8?B?bnVKd0ZobitNM1ZEMHJ1bFI4V0xzU0pndzFVQ2hSU20xQ29FTTY2MW1yL2x6?=
 =?utf-8?B?aWpTNk1mejVEcGJ1RWZxVW1OK2Nuc245ZnExNnk3OWJsZFYySmJPQk5pZkNl?=
 =?utf-8?B?aWNVVDRvUzNVdDY3bEpPNmthc29IZS9Cb3M1VXJ1U1dpMFNSU3RHTkJXSDRh?=
 =?utf-8?B?Z05RZmJKRkVMNVhXMmtwRkM5cDJJck9kZmF4YXZtYWhWUjcyUi8vM2tNdXNI?=
 =?utf-8?B?U215bWdselFWd1o4RU8yQXRwdjA1anF0NWNvN0QxSVc0N0p6NzAxcmZVZko1?=
 =?utf-8?B?VTBaWUJGQVNTYzd4dnBLTTJjcEJEazlBazErV2ptU3hQY0RVUnRydG50aVI5?=
 =?utf-8?B?M0RwRk85Sk1rRE9HdWlQVW9wUWlUM3dXYjMxdjMzQXZUR0hNb014SG4rZFRi?=
 =?utf-8?B?U2pDVUZzM1lMV3MxTXh1UnV1Z2tzWXZpNzltK0FZNEpRZ29iZkI2Smt6UUNQ?=
 =?utf-8?B?SjY2cE5Pcy85WURlNndCd21ZN0xXanJPMVFYOVZIUXFSd1ZyUkZMd3ZXK2E4?=
 =?utf-8?B?cDkzOFd1Ym1RcmVhWGpHM3Y1M05iU2dwd01sMFhXRE5tMmVvV0g0dUdMSUJu?=
 =?utf-8?B?TWtuZEEvNmpPdnhPUFV3L29vSDNFR3ltblRYZjcyNDlydTVTK0JxUDk0ZjFG?=
 =?utf-8?B?emdaMVl0L1Z0Y2kzK0pJNVFCT2I2TFBUNU5tYVJVU2pvbm5wVk9hVGxTQklq?=
 =?utf-8?B?MVdhVnZUclhOZ0ViSEVBZlA0aEd1ZnNUK29IOXZoU3BDV2hiNFlQWnQ4MVNR?=
 =?utf-8?B?WFVkN0NWSTRTdlRVNGRLbENBUXM5T3ZpMmQvdTkvT2VxMUxSbFhZWjY1RXpY?=
 =?utf-8?B?eUdjZllNeDd0ZE9DNit2N082cGhCNnFmb1duRzhkcnM2NWc4WVFVM09Oc0dx?=
 =?utf-8?B?c1I2Wmt2ZlZqOVVTZ3VEdEZqZ1o1ZjhoNmdKV29VL1g4R3BoQUxESitrRktC?=
 =?utf-8?B?WUFPaytKWnhueFFEcnAvKzJWMmRoOUdEaUdjODhhRWx5T05uUEhvRTh0RFlL?=
 =?utf-8?B?RVRmS0ZwVlRzNVNuYWVDbkxLdTF4MmdtTWppNmtMdUEvWWd6V0cxY1lySmxp?=
 =?utf-8?B?MXgrTi9seGVjaVkySld4cmU4QTI1NlV5dHptM1hKbmdyTU4wMlJ3SWJGQ0Vu?=
 =?utf-8?B?NnovS2F5TjRpWEtma1UzNWNDSHA0OWUyTS91RVNBL25GVHJaK0FSckdLT2E2?=
 =?utf-8?B?NGY3cHh4YTU5N2ZaNlRGbVIrRjBoNzRoRUJtV0VxUXhhZXFxdHZsZHNFaVdT?=
 =?utf-8?Q?xtNTd3kJm00=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTZsaStNbDRhbnllVG8vUnpwYmU3cVhYU0FTYXMyR2hrVVhWZ1c1SkxIcEJ0?=
 =?utf-8?B?R0RkcnVidzRrMlJ3VTV4V0FhaDZjK2Nia0FzRGtrZGFsWDczZGRZd1VNNStw?=
 =?utf-8?B?bllQM0xNZVZTb1hHL0hzNWRUNHJieWNVOVl1ZnhtRytlb09iejB2dHJzRTJR?=
 =?utf-8?B?YmdQQ3lSVGlYYXNGRWJxMWlVa0Y0aDJCN2tnaUlKMkZ6SGZMbTVQN0ZNR3Zl?=
 =?utf-8?B?M3RvZnlYK0ZKa1pqc1RQdUcxZlAxcjNGcENvWElkZ2lqa05GRlZKN0FUY3V2?=
 =?utf-8?B?WUVUL0x1em1nd2FOQk10eDMwci9sL0dVZ3JVdDVZUFlZcmlOaXJuVDErenFi?=
 =?utf-8?B?ejQ3cWFOVWJGK2R0TE1KbFZKSG01aTZpSG1kRlFrVjlDc1RjR2tBOG9BOVBq?=
 =?utf-8?B?aE0yVVRHMmZVUGEwV3ovZFlBUzZqeW5KVjRTR0tvcHpxMmpKUUM4eURweTdW?=
 =?utf-8?B?M3FubEZPb01ObVBCRkRhY1dyanFFRFdkeDRBTmJVcEEyNkpkUmkvTExidFFT?=
 =?utf-8?B?cmdEQVVTQnJ3YWNINFJMNDREVFQ4MnZoUWM0aDBxUHJ1dE1rMGNBRUdCVW4v?=
 =?utf-8?B?d0ZyK2FwNHJSZ1ZaZCsvcFRwRGw4UlcrcHRhUnJHQ0QrUkZuN1I2M1lvU1JO?=
 =?utf-8?B?L2tZYkMwR0NWOGFpNFlFVmZ1WkwwZWlLWm9nVlJad3duUVlTVzRoNVBKUEcz?=
 =?utf-8?B?S1I3YXNOanAyT1VDajFYV0xZck4xRUN1NG10dkVxS0JnYzUrczFEeHorNS9B?=
 =?utf-8?B?cDZRSXZBUHVldkN0VGxPWXNuNEVjcExSVzNNVWIvVjZwdjFHVUlvUzFTSXZl?=
 =?utf-8?B?MU1VSU1ubEx3ZS9VQ1BHNlRSVzkreTVjeTVxMHR6VGtyNzJHTERiSzJ1VWFM?=
 =?utf-8?B?WFZpOERsN3hDdE1TTittTEFSMmYvKzJRbE9pcWk1cFBnTGlPWUg1d2lBODYz?=
 =?utf-8?B?aTFXMmVTY0ZTdmc1T2JwZzBNYjg0RVREU2R1NW9nQXlOSFNmaHRtVm9SSXNh?=
 =?utf-8?B?dUZjQUxxNHQ4YW53TXlJeGZtS05aeUUrVnQ5V1pLUGhDKzQ1dWRrUTdrWTM0?=
 =?utf-8?B?aG8xR09BZTR0U0pvL1pzTU8rMG1pOUo5TEVSNllqNW9Bbzg3QkFwdFd6NXZP?=
 =?utf-8?B?ZExKYm9HZS9RN2ZKVkpFYTRZRXNVWTJMRWZUT2Q1NnY4amVlMzV1b1FDOHpw?=
 =?utf-8?B?c3I4UHNYalJnS0hpczVVOWVqMmJGSDZvU1dBZU1oOFpjWktYd2tFVmhTWmhr?=
 =?utf-8?B?T1BRUUVxYzZtR2RlY0ZIcC84WEFUa00wazNYVUh4N3pkbW9xd0ZDcHcydjQw?=
 =?utf-8?B?VEpaTFpkUzJtYlNUZFlBZDY3c0g1QnBlbDVtL3VUY0xLZnVNbGhvVS85amZB?=
 =?utf-8?B?SkYza1JsQVVLa3VpZVFBb2huVm5nU2N1L2xnZGYvUFEwTkNIUkkrQ2lNRXcw?=
 =?utf-8?B?Ly9od2Zhb2VHdVkzTmdPaDNxVkFUTWsrbCtvbUpaSC8yTGF1MitnNXpHMTdL?=
 =?utf-8?B?dDBzc0UycUFSRGVTVkFsc1BVY3JCNHZmM3NheGRLVUcrcVhxSDg5SlZoRjJj?=
 =?utf-8?B?Y3d0WHQyNTVUVWFTZ3RIRVovM084TG5kdm1FMS9FUm9MRFl1VWswR1dPZ3la?=
 =?utf-8?B?RjVNQXljRHlTMnphVThTVlNNd0x2T1JRSythOEQvdENOTmtQd3lvbkFCdUxm?=
 =?utf-8?B?WHNlMDNIbFNYbmFCa0UvQnZaWlVFMDliTi9pY1dURndFallpSHA4MmZqQmZB?=
 =?utf-8?B?MEtBN2g4WGZHVC83OUoxNFRBNUZqeHpwYnUzcG5UNUJvaExQSzBQYmNseFRD?=
 =?utf-8?B?QUdnUWtOTHhicHBsem1MRGFoSkxLSzJ2VjlwelFoa0NsdWp1UmRtazgyczNN?=
 =?utf-8?B?bzI5Nmw0ditqNk1uZGtKYzJ3dnNKUVAwZFRwRzYyYjROR1hrdXF1WkdtSnRJ?=
 =?utf-8?B?QnYrK0poa3VaTlI4R0VBZ0dDbllvZjQwVU9mSzhldzhMRzJYRy9MR01vVmNh?=
 =?utf-8?B?b2tMZmRnTE5iTVQ3SUhHUnJ4clVPM0lQam5PRStsMGxMMG02NzRmR21kQTZT?=
 =?utf-8?B?c1NSYXpIS2xNR3JZazB4TURQVFlsOW41aHBHalJLNlQrNEFldlJWcWFRZFNE?=
 =?utf-8?Q?qDKrqK+FrIvPVDmeKGldQIFF/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13da8d21-b032-4a12-ecae-08ddfc5d27f0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 17:58:39.0835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLRn3DnoA50gi4Ji8gMJYFTMyPh7VV/XiyuZA9xGL+1feixmcdYs5L0JbbXPYGI0fgqYl8Li2YviJ9Acq1tAAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584
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

Hi Yinjie,

Thanks for sending these patches. The commit message could benefit from a bit more detail about what’s being changed and why. Based on the diff, here’s what the patch is doing:
Removes the temporary workaround that skipped VCN tests on GFX12 (RX9000). With this change, VCN tests will now run on that family. Please split this into a separate patch — you can use git reset to help with that.

Updates the IB (Indirect Buffer) programming for VCN5:
Adds support for new fields such as transform_8x8_mode_flag.
Introduces a new meta_buf buffer for VCN5, allocated, mapped/unmapped, and added to the resource list.
Updates the encoding path to handle VCN5-specific picture and reference list programming, including input picture structure, reference picture lists, and reconstructed picture handling.
Adds new commands for ENCODE_CONTEXT_BUFFER_OVERRIDE and META_DATA sections, which are required in VCN5.

Maintains backward compatibility with earlier VCN versions (<5) by guarding the new logic with if (shared_context->vcn_ip_version_major >= 5) and leaving the legacy paths unchanged.
In short, this patch enables proper VCN5 IB programming in IGT tests, replacing the previous skip with full support. It aligns the test code with the requirements of newer hardware while keeping existing ASICs working as before.
I’d also suggest updating the commit message to reflect these details — this will make it clearer for reviewers and for anyone later bisecting why the skip was removed and what was added for VCN5.

A couple of coding style / robustness suggestions:
Please replace raw 64-bit address handling with the standard helpers everywhere:
        
from
context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
context->ib_cpu[len++] = v_context->cpb_buf.addr;
to  
context->ib_cpu[len++] = upper_32_bits(v_context->cpb_buf.addr);
context->ib_cpu[len++] = lower_32_bits(v_context->cpb_buf.addr);
instead of directly shifting and writing the address. This improves readability and consistency and started to do this everywhere in new code.

For calls like:
r = amdgpu_bo_cpu_map(meta_buf.handle, (void **)&meta_buf.ptr);
memset(meta_buf.ptr, 0, 1024);
please check the return code, for example:

igt_assert_eq(r, 0);
This ensures that a failed map is properly logged as a test failure instead of leading to a segmentation fault on the next line.

Please do for all the lines that you have added.
Other than these points, your changes look good to me.


Thanks,  Vitaly

On 2025-09-25 13:03, Yinjie Yao wrote:
> Update ib interfaces for VCN5
> Remove previous workaround to skip VCN tests on GFX12 family
>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
> ---
>  lib/amdgpu/amd_vcn_shared.c |   7 ---
>  tests/amdgpu/amd_vcn.c      | 111 ++++++++++++++++++++++++++++++------
>  2 files changed, 93 insertions(+), 25 deletions(-)
>
> diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
> index 32766c0b4..bcc0971a3 100644
> --- a/lib/amdgpu/amd_vcn_shared.c
> +++ b/lib/amdgpu/amd_vcn_shared.c
> @@ -59,13 +59,6 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
>  		context->vcn_reg_index = 2;
>  	}
>
> -	/* Skip VCN tests on Radeon RX9000  (GFX12, family_id = 152) */
> -	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
> -		igt_info("Skipping VCN tests on GFX12 RX9000 (family_id = 152)\n");
> -		return false;
> -	}
> -
> -
>  	return true;
>  }
>
> diff --git a/tests/amdgpu/amd_vcn.c b/tests/amdgpu/amd_vcn.c
> index 03c864c0e..20a642f45 100644
> --- a/tests/amdgpu/amd_vcn.c
> +++ b/tests/amdgpu/amd_vcn.c
> @@ -316,6 +316,8 @@ amdgpu_cs_vcn_enc_create(amdgpu_device_handle device_handle,
>  	context->ib_cpu[len++] = 0;	/* constrained intra pred flag */
>  	context->ib_cpu[len++] = 0;	/* cabac enable */
>  	context->ib_cpu[len++] = 0;	/* cabac init idc */
> +	if (shared_context->vcn_ip_version_major >= 5)
> +		context->ib_cpu[len++] = 0;	/* transform_8x8_mode_flag */
>  	context->ib_cpu[len++] = 1;	/* half pel enabled */
>  	context->ib_cpu[len++] = 1;	/* quarter pel enabled */
>  	context->ib_cpu[len++] = 100;	/* BASELINE profile */
> @@ -777,9 +779,9 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  			struct mmd_context *context, struct vcn_context *v_context,
>  			int frame_type)
>  {
> -	struct amdgpu_mmd_bo bs_buf, fb_buf, input_buf;
> +	struct amdgpu_mmd_bo bs_buf, fb_buf, input_buf, meta_buf;
>  	int len, r, i;
> -	unsigned	int width = 160, height = 128, buf_size;
> +	unsigned	int width = 160, height = 128, buf_size, luma_size;
>  	uint32_t *p_task_size = NULL;
>  	uint32_t task_offset = 0, st_offset;
>  	uint32_t *st_size = NULL;
> @@ -794,16 +796,19 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  	}
>  	v_context->gSliceType = frame_type;
>  	buf_size = ALIGN(width, 256) * ALIGN(height, 32) * 3 / 2;
> +	luma_size = ALIGN(width, 256) * ALIGN(height, 32);
>
>  	context->num_resources = 0;
>  	alloc_resource(device_handle, &bs_buf, 4096, AMDGPU_GEM_DOMAIN_GTT);
>  	alloc_resource(device_handle, &fb_buf, 4096, AMDGPU_GEM_DOMAIN_GTT);
>  	alloc_resource(device_handle, &input_buf, buf_size, AMDGPU_GEM_DOMAIN_GTT);
> +	alloc_resource(device_handle, &meta_buf, 1024, AMDGPU_GEM_DOMAIN_GTT);
>  	context->resources[context->num_resources++] = v_context->enc_buf.handle;
>  	context->resources[context->num_resources++] = v_context->cpb_buf.handle;
>  	context->resources[context->num_resources++] = bs_buf.handle;
>  	context->resources[context->num_resources++] = fb_buf.handle;
>  	context->resources[context->num_resources++] = input_buf.handle;
> +	context->resources[context->num_resources++] = meta_buf.handle;
>  	context->resources[context->num_resources++] = context->ib_handle;
>
>
> @@ -815,6 +820,10 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  	memset(fb_buf.ptr, 0, 4096);
>  	r = amdgpu_bo_cpu_unmap(fb_buf.handle);
>
> +	r = amdgpu_bo_cpu_map(meta_buf.handle, (void **)&meta_buf.ptr);
> +	memset(meta_buf.ptr, 0, 1024);
> +	r = amdgpu_bo_cpu_unmap(meta_buf.handle);
> +
>  	r = amdgpu_bo_cpu_map(input_buf.handle, (void **)&input_buf.ptr);
>  	igt_assert_eq(r, 0);
>
> @@ -922,12 +931,13 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  	context->ib_cpu[len++] = 0x0001f000;
>  	context->ib_cpu[len++] = input_buf.addr >> 32;
>  	context->ib_cpu[len++] = input_buf.addr;
> -	context->ib_cpu[len++] = (input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32)) >> 32;
> -	context->ib_cpu[len++] = input_buf.addr + ALIGN(width, 256) * ALIGN(height, 32);
> +	context->ib_cpu[len++] = (input_buf.addr + luma_size) >> 32;
> +	context->ib_cpu[len++] = input_buf.addr + luma_size;
>  	context->ib_cpu[len++] = 0x00000100;
>  	context->ib_cpu[len++] = 0x00000080;
>  	context->ib_cpu[len++] = 0x00000000;
> -	context->ib_cpu[len++] = 0xffffffff;
> +	if (shared_context->vcn_ip_version_major < 5)
> +		context->ib_cpu[len++] = 0xffffffff;
>  	context->ib_cpu[len++] = 0x00000000;
>  	*st_size = (len - st_offset) * 4;
>
> @@ -940,7 +950,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  		context->ib_cpu[len++] = 0x00000000;
>  		context->ib_cpu[len++] = 0x00000000;
>  		context->ib_cpu[len++] = 0xffffffff;
> -	} else {
> +	} else if (shared_context->vcn_ip_version_major < 5) {
>  		context->ib_cpu[len++] = 0x00000000;
>  		context->ib_cpu[len++] = 0x00000000;
>  		context->ib_cpu[len++] = 0x00000000;
> @@ -959,6 +969,23 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  		context->ib_cpu[len++] = 0x00000000;
>  		context->ib_cpu[len++] = 0x00000000;
>  		context->ib_cpu[len++] = 0x00000001;
> +	} else {
> +		context->ib_cpu[len++] = 0x00000000;	/* input_picture_structure */
> +		context->ib_cpu[len++] = 0x00000000;	/* input_pic_order_cnt */
> +		context->ib_cpu[len++] = 0x00000001;	/* is_reference */
> +		context->ib_cpu[len++] = 0x00000000;	/* is_long_term */
> +		context->ib_cpu[len++] = 0x00000000;	/* interlaced_mode */
> +		context->ib_cpu[len++] = 0xffffffff;
> +		for (i = 1; i < 32; i++)
> +			context->ib_cpu[len++] = 0x00000000;	/* ref_list0 */
> +		context->ib_cpu[len++] = 0x00000000;	/* num_ref_idx_l0_active */
> +		for (i = 0; i < 32; i++)
> +			context->ib_cpu[len++] = 0x00000000;	/* ref_list1 */
> +		context->ib_cpu[len++] = 0x00000000;	/* num_ref_idx_l1_active */
> +		context->ib_cpu[len++] = 0x00000000;	/* lsm_reference_pictures[0].list */
> +		context->ib_cpu[len++] = 0xffffffff;	/* lsm_reference_pictures[0].list_index */
> +		context->ib_cpu[len++] = 0x00000000;	/* lsm_reference_pictures[1].list */
> +		context->ib_cpu[len++] = 0xffffffff;	/* lsm_reference_pictures[1].list_index */
>  	}
>  	*st_size = (len - st_offset) * 4;
>
> @@ -971,20 +998,66 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  		context->ib_cpu[len++] = 0x00000011;	/* ENCODE_CONTEXT_BUFFER  other vcn*/
>  	context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
>  	context->ib_cpu[len++] = v_context->cpb_buf.addr;
> -	context->ib_cpu[len++] = 0x00000000;	/* swizzle mode */
> -	context->ib_cpu[len++] = 0x00000100;	/* luma pitch */
> -	context->ib_cpu[len++] = 0x00000100;	/* chroma pitch */
> -	context->ib_cpu[len++] = 0x00000002; /* no reconstructed picture */
> -	context->ib_cpu[len++] = 0x00000000;	/* reconstructed pic 1 luma offset */
> -	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32);	/* pic1 chroma offset */
> -	if (shared_context->vcn_ip_version_major == 4)
> -		amdgpu_cs_vcn_ib_zero_count(context, &len, 2);
> -	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 3 / 2;	/* pic2 luma offset */
> -	context->ib_cpu[len++] = ALIGN(width, 256) * ALIGN(height, 32) * 5 / 2;	/* pic2 chroma offset */
> -
> -	amdgpu_cs_vcn_ib_zero_count(context, &len, 280);
> +	if (shared_context->vcn_ip_version_major < 5) {
> +		context->ib_cpu[len++] = 0x00000000;	/* swizzle mode */
> +		context->ib_cpu[len++] = 0x00000100;	/* luma pitch */
> +		context->ib_cpu[len++] = 0x00000100;	/* chroma pitch */
> +		context->ib_cpu[len++] = 0x00000002;	/* no reconstructed picture */
> +		context->ib_cpu[len++] = 0x00000000;	/* reconstructed pic 1 luma offset */
> +		context->ib_cpu[len++] = luma_size;	/* pic1 chroma offset */
> +		if (shared_context->vcn_ip_version_major == 4)
> +			amdgpu_cs_vcn_ib_zero_count(context, &len, 2);
> +		context->ib_cpu[len++] = luma_size * 3 / 2;	/* pic2 luma offset */
> +		context->ib_cpu[len++] = luma_size * 5 / 2;	/* pic2 chroma offset */
> +
> +		amdgpu_cs_vcn_ib_zero_count(context, &len, 280);
> +	} else {	/* VCN5 */
> +		context->ib_cpu[len++] = 0x00000002;	/* num_reconstructed_pictures */
> +		for (i = 0; i < 2; i++) {
> +			context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
> +			context->ib_cpu[len++] = v_context->cpb_buf.addr;
> +			context->ib_cpu[len++] = 0x00000100;	/* rec luma pitch */
> +			context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
> +			context->ib_cpu[len++] = v_context->cpb_buf.addr;
> +			context->ib_cpu[len++] = 0x00000100;	/* rec chroma pitch */
> +			context->ib_cpu[len++] = v_context->cpb_buf.addr >> 32;
> +			context->ib_cpu[len++] = v_context->cpb_buf.addr;
> +			context->ib_cpu[len++] = 0x00000000;	/* chroma v pitch */
> +			context->ib_cpu[len++] = 0x00000001;	/* swizzle mode*/
> +			context->ib_cpu[len++] = meta_buf.addr >> 32;
> +			context->ib_cpu[len++] = meta_buf.addr;
> +			context->ib_cpu[len++] = 0xffffffff;	/* h264 colloc buffer offset */
> +			context->ib_cpu[len++] = 0x00000000;
> +			context->ib_cpu[len++] = 0x00000000;	/* meta_data_offset */
> +		}
> +		amdgpu_cs_vcn_ib_zero_count(context, &len, 15 * (32 + 34) + 6);
> +	}
>  	*st_size = (len - st_offset) * 4;
>
> +	if (shared_context->vcn_ip_version_major >= 5) {
> +		/* encode context overrider */
> +		st_offset = len;
> +		st_size = &context->ib_cpu[len++];	/* size */
> +		context->ib_cpu[len++] = 0x0000001d;	/* ENCODE_CONTEXT_BUFFER_OVERRIDE */
> +		context->ib_cpu[len++] = 0;	/* luma offset */
> +		context->ib_cpu[len++] = luma_size;	/* chroma offset */
> +		context->ib_cpu[len++] = 0;	/* chroma v offset */
> +		context->ib_cpu[len++] = luma_size * 3 / 2;	/* luma offset */
> +		context->ib_cpu[len++] = luma_size * 5 / 2;	/* chroma offset */
> +		context->ib_cpu[len++] = 0;	/* chroma v offset */
> +		amdgpu_cs_vcn_ib_zero_count(context, &len, (34 + 32) * 3);
> +		*st_size = (len - st_offset) * 4;
> +
> +		/* meta_data */
> +		st_offset = len;
> +		st_size = &context->ib_cpu[len++];	/* size */
> +		context->ib_cpu[len++] = 0x0000001c;	/* META_DATA */
> +		context->ib_cpu[len++] = meta_buf.addr >> 32;
> +		context->ib_cpu[len++] = meta_buf.addr;
> +		context->ib_cpu[len++] = 0x00000000;
> +		*st_size = (len - st_offset) * 4;
> +	}
> +
>  	/* bitstream buffer */
>  	st_offset = len;
>  	st_size = &context->ib_cpu[len++];	/* size */
> @@ -1049,6 +1122,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  		context->ib_cpu[len++] = 0x00000000;	/* RENCODE_COLOR_BIT_DEPTH_8_BIT */
>  		*st_size = (len - st_offset) * 4;
>  	}
> +
>  	/* op_speed */
>  	st_offset = len;
>  	st_size = &context->ib_cpu[len++];
> @@ -1075,6 +1149,7 @@ amdgpu_cs_vcn_enc_encode_frame(amdgpu_device_handle device_handle,
>  	free_resource(&fb_buf);
>  	free_resource(&bs_buf);
>  	free_resource(&input_buf);
> +	free_resource(&meta_buf);
>  }
>
>  static void
> --
> 2.43.0
>
