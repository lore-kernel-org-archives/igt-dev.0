Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1C6C28B30
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 00:28:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DDA310E07E;
	Tue, 18 Mar 2025 00:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aVReykwa";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F41B10E07E
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 00:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lht0r7v7gdVSPd0fSgd8rckbVmucjEjkLXNI8Dpg6x3Wp+k4eD47TgMDMedDDbN6DQmcecLl6yMatEVqtDJrryYxCJRNnaRhkG1rPJTc0FU7lP/Pro5HKNjqF3XWblSeHMx9dGxz1FgO1jHDGt8hIZyrPGVUbQy3giR7nFM3AX7L6GIQpjOukP03XQnTpLT0tQz2ZRl8DLNRKBQ1ioLZe6Lhs4SJqHbK5KE82FlO0bhsuVq5Eh+FHIm+iGMBbnnBlQY7J4DBFYzhBaTQ0GBU/F448GWzp+QpvnPPbe+JUWS1iMbxeSc4mUk6efZaBaUl1yGg48lKtFxmaEqsAmiAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6QPuZStK4BfFDVW/+nrIMGf0fduDiYT53MEKC0yuPE=;
 b=iafeIK12ddbkBQrnPbjoua6avaDMXEXi+VrT/yuO9jRkByUjZeFT7LAvOb+bEJb4CfyJFoH9Guw3C7PJKZyaY7nsq5frebFuKKMgKsDxyPm7Hbxq7gDg+PJHUOkahCa87wgG/0V6FFfqf5xh3bGiWL1bpe+Hvge3WRxWPM5ZynkP1EX2ObOkoxZvnbKYBB7CWVQXuoIqaMjWrgQuczj0gX7Ttazpn+P1n1fBurvhhp2z6aPus5vqalfP9QeaAYRqimYqfXR7ttWeeX1DT+nODEBwRjrQWPdiePugyD3qKus6Ci89l95D/xhtojYZ+Hl8ly1cLrVN+8+jHmS2PChHXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6QPuZStK4BfFDVW/+nrIMGf0fduDiYT53MEKC0yuPE=;
 b=aVReykwatrzjymBgd6mrWEqnS7V1Xll4/n9VR+zA1xZQeuLtuWey3RAVOAL2GFZQwd9saMERfPyKSoDWn6KrGoZrmtzqBSItsL9xoJ7UFvhgO6nog+X5rSLXqRiIURS887/mMa9RwduYL/uj8meph+W3ctgKQBG+yL48DwfwLiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 00:28:17 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 00:28:16 +0000
Content-Type: multipart/alternative;
 boundary="------------1Vt1Bvmy5PK0htC0EH81Hw3s"
Message-ID: <08653e8f-838a-4d12-b8f7-fa69c9da1f3f@amd.com>
Date: Mon, 17 Mar 2025 20:28:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 i-g-t 3/3] scripts/run-tests.sh: Add support to
 kmemleak and igt_facts
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <20250307093426.90479-4-peter.senna@linux.intel.com>
 <0ed20d8c-532f-43f2-ac16-82866b641670@amd.com>
 <58d922a6-d24e-4b2c-a3da-1de97e2b065c@linux.intel.com>
 <7992ba86-f665-469b-907b-89f1057a7238@amd.com>
 <80b7d4e8-2c1e-4b9c-b662-974cc3926a14@amd.com>
 <9a6a7e82-32a3-4960-ad5e-c70c6f5d81e8@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <9a6a7e82-32a3-4960-ad5e-c70c6f5d81e8@linux.intel.com>
X-ClientProxiedBy: YQBPR0101CA0174.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::17) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: b975e05c-3827-4675-19ce-08dd65b3c675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGRVcUhUMVFzUzkxVmhodTc5Zmx4RGpBTjc3MDhsMldsVkl5Z1lucUpKaHBm?=
 =?utf-8?B?cUlJSm9naXAwbGFqdUgzdnMzemlLSVp5VEtDWlVqaURGNzArNWsybWNkV0Ur?=
 =?utf-8?B?NEVsZC9JaXFQMTEzbG0wSDNwZnVmbnhsbnFhS3UwNk5XMnZnbWRrUE9mOVRK?=
 =?utf-8?B?cGViczFhV0FLYlluUVQwOUZBS3puY0d6NjFtRVRoU1lqNFJjaGVOUTJmV1NI?=
 =?utf-8?B?bkVzZTQwYkp2OHF0OGUyWWZsNWZ2clJTR1pHZjErNHkvcEhmdy82VEFvdFlF?=
 =?utf-8?B?TjV4emxqOTJQZWJvY0RBWFY3aDFHK0FBTGl1MWRjL2F0a2xXS3EvWW4yclEw?=
 =?utf-8?B?SEd5M00yektmR1dBNUlPY3J0WnBndGhJQkVYNGIvdUdZd00xbTFPbi9SVzZH?=
 =?utf-8?B?UXl5VVJHWXVtTDh6aHpPa0UzZ2JGZHJFZllScWtsaDkreFFRczhIRmNuVFU0?=
 =?utf-8?B?QlZmSzU5eEtUaGVUT1VrTmNueU1ReTU2aWhEN3drV1RKRkFTU3hBR0R5VUcx?=
 =?utf-8?B?amR5WGJYaHJqSEgxWU5Jc1doUTNNbmxnTFBrMUs3TTE5c2RVVUhmaUdWQnY4?=
 =?utf-8?B?NStIT1d1V0R4OVorY0V4bzdSclpCYjRRdDY2Z1dXVlRZV1BYZGJQK3JtOFhx?=
 =?utf-8?B?cEd1MkNJc3I4NVpPWnBsaHFnc1NWeTRGNnVlaHExMFkzMExGaHpnRjB5ZWZM?=
 =?utf-8?B?bjlzTCtUSEtCZndYcXVTNHBxQWpnQ0tEbktNWlY3WnA5VUdheThLN1dkWXd3?=
 =?utf-8?B?R1pwMjJqM1pkOFo3SDdVb1NsQldrekFWWHRyekpaM3hOMGozQ2o0cHRCVjQ4?=
 =?utf-8?B?TGRWUFJnR0gramp3ZDVFZ1plQ25rRmNLdGUwZ21LSHpScHBRL1RJV2cxYkYx?=
 =?utf-8?B?dGxYcEl0VjVYTlZjZnh2Z2lwWEtmdFJFMFZIdFhIaHkzTmxzQUcxV3ZUbHBW?=
 =?utf-8?B?SjdtY3loVmEwUmZQbUZpeUdpYkRjbWtucDgrdWRvWGlRRTdZWkxuVHg2d1hN?=
 =?utf-8?B?NDlxTFBMUHVCdktEQTVneEhxT3o4ZGtHSnpLUHljdm5tVTZZSzdiQXZPMXd4?=
 =?utf-8?B?N0lNTlhnWDBKeGt5U1hiNEFxRzJXOVYxR1hxc0dLaUJsN2EyeUp6WG91anRZ?=
 =?utf-8?B?OU1RR2krQ1c1anhsWU44K2pnUzhEZFJRaEFNcTRmUkpqS0JBMmNxUmpESUhT?=
 =?utf-8?B?V29vZ2JHQ0JEVkdiZ0FTUE1hcThkcy9OWWU5MHdySUNVaFJvZ1Y0NlNvSTF0?=
 =?utf-8?B?OTFFMU5FQUNCK2ZMVlkxWmtyNkFCckViZ0lMakZKTDlUUmxOWVVZb0F0RThR?=
 =?utf-8?B?OEYxOVJwbi9kU0R0Um1JT1RiaU4zZGZCWnorTFkvZjdjK0JKOGtBRGI5eHV5?=
 =?utf-8?B?SE1UVlRPUW5GaklRVFQ0MU9iWGFONnpLdkF3Tlk3dzBNSi95eXJYR0NMRmxz?=
 =?utf-8?B?TVAvcUNQMFFJYk9iL3JvYlZFT1hvY0pOaThyRTJoUkZEU0hOSnFjSlJWa09X?=
 =?utf-8?B?cC83VE5ONkVoWlZEMTBlaUlhZHQreHBINlV6UDNQL2wwdTIyVC9PSUxUWFRy?=
 =?utf-8?B?eTNDYjdOUGZVNmM5ck50d3ozTGtmUDIvZGp1T0lIbml2VmdVYjRPeFJSZHpQ?=
 =?utf-8?B?R3p4YWVWNXZLZEk5Z2lxNnE0Q3BnN21UUlFTOE5rZ3JxbHZSV2t1aXl5eGll?=
 =?utf-8?B?SjNHMG5BblFXVTM1S0lJYU9oQ0RtZXNjUGtMc0VqbVBWVENEUTZjQjBrbENR?=
 =?utf-8?B?SVh5NGFGUG0wOTRUeXA5MG5VbjlGMjY1a2ZuVHU1bWV6VDdrT1NvQ2NIdlZO?=
 =?utf-8?B?MXBmbkUvZnZDQkRTRXA3YzhjK29ieHptcTQzbE95N0szQldNQ1UvbnYrSGZC?=
 =?utf-8?Q?S2dC4VxFAfd6P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emVVUTlBYno3UTc5dDUwYlB2VE5FRW91Wk9SQnF6blZkQTk5ZmlQMnN1OHQ2?=
 =?utf-8?B?RjNScXAvREtxbVlMdGtaa2VVR0wzdzZENWZ3aUo4blFRcDdJUmxLYlRTSzVP?=
 =?utf-8?B?TWhqbDV0R2VQNGMwWWpwMG5FUjdUTEdFV2dMVEFRNTh1aDQxRmp6ZTIycXlt?=
 =?utf-8?B?cWEzYVJObWQzSFZaaFVZa3JubWNKWHBZMjVBVml2MGtUSGlGL1BKUDE2R2hP?=
 =?utf-8?B?RSttOXZYRXp2amc5cE5WemJ1MENCOTZDcGt5V3JlbHIyU2pQWTFRZm05QnVj?=
 =?utf-8?B?c0Z2NkxYS1o4YWtKQUNzN29mSVdxdUk2RmhSaForcFhaeUFDN0hHZzhXTnl4?=
 =?utf-8?B?c2JmQVVmcVdSNWVBOW1Ba0dJWVY2eFE2aFIyUGM4QlpYb3Z1QzVpTS9TMEE4?=
 =?utf-8?B?WkFVMERUNGo4Z3VWMkwxcHZ3bEZLTVV2Y3o3UjNzZSt0TGNNT3ArWGVwRzQ1?=
 =?utf-8?B?SEl5Qm80NjdPajVjdXN3anBuYjNDVXgrSXFMSGFDTjJ0Q0paR2djeC82djJs?=
 =?utf-8?B?dU50UkNESCszTkpvdFFoWnozQlcrclJPWUw2SmhwTis5NjhhS1QyL0F2cXVX?=
 =?utf-8?B?Rk5iY0l3T1Z1dUdQQ1BVRzFLV0k2L1E4UGpRTU9YZW1XU2VGRnpFMnVWM1Fj?=
 =?utf-8?B?WGtPTWVGQ0o4MjlWcVBlUlZUelJxV0k4enJJa1hIODdIc1ZQWXRiTmozWm1o?=
 =?utf-8?B?OFR6MXlqNjVPUVhsSGpCYWo4TGgrZGJ3aUVhTWk0aEtkREkrWWROeU5Oa01q?=
 =?utf-8?B?TjAwcHg2bjhxOE5KbU9ER3lYRysza3hVUWUzRTFHY0VvbHd0VzNTZkpYSUo2?=
 =?utf-8?B?ZmJyeG5CZXkxL1JCZ0tjajVtR1didFV5Tko1a0NycUM2aTBKM2dkblBXN09K?=
 =?utf-8?B?RkhQUFJZVnVFOUtpOFd3Yzl2N0dtbTdHK0orQnExYkQ2eU5renBOMGNTU2xo?=
 =?utf-8?B?NDZySUlXRDlJYmdqbWlBQ0cyWUxlR0VMMkVYblUyKzRSUGNoMVNHNXJoZ0x4?=
 =?utf-8?B?RVZZbDVpbFFoSjRsRkZCSmsrNnUvSkdlUnhPQ2pSVHovWmdhWVVxQUkwTllO?=
 =?utf-8?B?RnJ3bHJJV3MxOEJpOHFEVmlhVUtmRjRRS1Jqb1lzS3RQdGcvSFZlRTNwRW5I?=
 =?utf-8?B?OXprMlNmblphTUF4ZUtWa1dBcnl5bmtzUVgvS0lzVkVxMFMrNTc2TDJwSEIv?=
 =?utf-8?B?SnZnUUJSUHpxTDhZYk05S3BTZXMzYUs5aHJieW1zUUZtbXAvTkJ0REQxbFFm?=
 =?utf-8?B?alBYeStKSkp2aDhwVXlzQzZGWmdLSXFqUU5oZUUyWExRVTNHMEVlV011NVM3?=
 =?utf-8?B?eDBsRG9oYyt3Q09xR012WExqcHZFZGM2QXNudzZBQXN1d3lCckZxUUs1aTBM?=
 =?utf-8?B?MnFkbVQ1dUkzbDlsT2w2UzFCT3J3ZERwMmZEMEErWDRTRWVlclhEbWNDb05k?=
 =?utf-8?B?cVZqQS90QjNrcldlZ0xtSDl0QjV1YTExUFJoam54UlJOWlJhR0xSb0dTaThY?=
 =?utf-8?B?SVpLSnNqdktVVUNsV2dLQXVCS0RDaE9halZrMDNpVVorL2JRNG5vakJLMC9W?=
 =?utf-8?B?YVYrV0xGZmExQlg1NVRUbG1EZWFGcDIxQ21KRlMwdGN3T3hDOE5BWU9ldFls?=
 =?utf-8?B?RmRIVEJlVUNJRlRXYXBBNTQzT05xMUFXc2FLT05Icm1UNVBKUXY5d0lwZGNU?=
 =?utf-8?B?UXpwZGxYTlgzQjJaMnVHY0RJNGhOeVFlUThzdGd0K3pwYWFzWE9VUHcxbTFZ?=
 =?utf-8?B?cjZ4aS9iMlFMUXg0NlZWRXRoMElYdlBRTkwzWDdiMVV0a2taVi9QdW5UV2tN?=
 =?utf-8?B?bzFUS2N1UEI2bE9VQXh4MHhxUHRlbzVGTFF3TEEyUEhrT3Vha09haDlRK1FG?=
 =?utf-8?B?bzJqd3dWV1hPa2V5ZzE5TXUzK2JNL3gyVVI2czg4M1Y0TGVwYVFZcFB6K1Nj?=
 =?utf-8?B?RXdOd01peVU5cExHbkwrbHdhclZLcHhRN3ZJM0dVNFJzS1JZdzI3SXplYUZ5?=
 =?utf-8?B?NmZFcGtqUlh2SVNFa3dGUERXbXBxOHd6ajRLcEJ1NEF5WVN0QnFNTXoyTk44?=
 =?utf-8?B?L1daSm5nQ0g5MTVJalI0Z3VNd0VtdllkYmROTVpxVThGVEZnUU9IbmhZUjl0?=
 =?utf-8?Q?Q4efbVYn8WVIZCrZE1acgGsQv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b975e05c-3827-4675-19ce-08dd65b3c675
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 00:28:16.2989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUOq8DXZ76y0OnRXTqnSNPm7PufuvLSZ/Lzpp029m2Tz3wwP5jdcwgpjOLY8DABhlN7kbl4oNWGzRtfd4JA8tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867
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

--------------1Vt1Bvmy5PK0htC0EH81Hw3s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Peter,

Thanks for sharing your thoughts. Once we identify the memory leak, I'll share the details with you and Kamil, and we can discuss how to proceed further. Please keep us updated on any findings on your side. We’re running weekly tests with the |-keach| parameter, so it’s applied to every test.

Best regards,

Vitaly

On 2025-03-17 04:43, Peter Senna Tschudin wrote:
> Hi Vitaly,
>
> On 12.03.2025 23:35, vitaly prosyak wrote:
>> Hi Peter,
>>
>> We ran the updated igt-runner in our CI with your merged patches, and the memleak feature is working (using the -keach command). However, we noticed what seems to be false positives related to the ACPI driver. The stack is provided below.
> Thank you for testing and reporting back! I've noticed false
> positives as well. In my case the likelihood of false
> positives seems to be related to hardware and test list.
>
>> I haven’t had a chance to investigate this further, but I think it would be a good idea to share our findings upstream for memleaks found outside of the AMDGPU or i915 drivers.
> I haven't considered this idea before: reporting other leaks upstream.
> You are correct, reporting these leaks is probably a good idea. I'm
> unsure on how to proceed here because I see two issues:
>  - manual reporting does not scale in the context of our automated
>    tests
>  - upstream response to the reports
>
> We want kmemleak results to improve our upstream code, but I do not
> know if these reports will be welcome everywhere. For projects that
> do not have the manpower to fix the issues, we may simply increase
> noise.
>
> What do you suggest?
>
> Thank you, and have a great week,
>
> Peter
>
>> Here the stack:
>>
>> comm "swapper/0", pid 1, jiffies 4294672730
>>
>>  hex dump (first 32 bytes):
>>
>>    00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00  ................
>>
>>    f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00  .|..............
>>
>>  backtrace (crc 2df71a7e):
>>
>>    [<ffffffff824cd71b>] kmemleak_alloc+0x4b/0x80
>>
>>    [<ffffffff814e169b>] kmem_cache_alloc_noprof+0x2ab/0x370
>>
>>    [<ffffffff81c2f4dc>] acpi_ps_alloc_op+0xdc/0xf0
>>
>>    [<ffffffff81c2d650>] acpi_ps_create_op+0x1c0/0x400
>>
>>    [<ffffffff81c2c8dc>] acpi_ps_parse_loop+0x16c/0xa60
>>
>>    [<ffffffff81c2e94f>] acpi_ps_parse_aml+0x22f/0x5f0
>>
>>    [<ffffffff81c2fa82>] acpi_ps_execute_method+0x152/0x380
>>
>>    [<ffffffff81c233ed>] acpi_ns_evaluate+0x31d/0x5e0
>>
>>    [<ffffffff81c2a606>] acpi_evaluate_object+0x206/0x490
>>
>>    [<ffffffff81bf1202>] __acpi_power_off.isra.0+0x22/0x70
>>
>>    [<ffffffff81bf275b>] acpi_turn_off_unused_power_resources+0xbb/0xf0
>>
>>    [<ffffffff83867799>] acpi_scan_init+0x119/0x290
>>
>>    [<ffffffff8386711a>] acpi_init+0x23a/0x590
>>
>>    [<ffffffff81002c71>] do_one_initcall+0x61/0x3d0
>>
>>    [<ffffffff837dce32>] kernel_init_freeable+0x3e2/0x680
>>
>>    [<ffffffff824ca53b>] kernel_init+0x1b/0x170unreferenced object 0xffff888102a2ed18 (size 80):
>>
>>  comm "swapper/0", pid 1, jiffies 4294672730
>>
>>  hex dump (first 32 bytes):
>>
>>    38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00  8.........-.....
>>
>>    f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff  .|......X.......
>>
>> Thanks, Vitaly
>>
>>
>> On 2025-03-10 16:05, vitaly prosyak wrote:
>>> Hi Peter and Kamil,
>>>
>>> We'll run the tests and I'll follow up on this thread.
>>>
>>> Really appreciate you merging this—thank you!
>>>
>>> Best,
>>> Vitaly
>>>
>>> On 2025-03-10 03:07, Peter Senna Tschudin wrote:
>>>> Hi Vitaly,
>>>>
>>>> On 10.03.2025 04:07, vitaly prosyak wrote:
>>>>> Hi Peter,
>>>>>
>>>>> Version 8 of your three patches looks good to me. However, I haven't tested them locally.
>>>>> Let me know if you’d like us to run them locally ( not CI)
>>>> I ran local tests before sending the patches, so I’m confident there are no major issues.
>>>> That said, if you’re able to test them locally as well, it would help confirm that
>>>> everything is working as expected. I’d appreciate it if you could run the tests.
>>>>
>>>>> Thanks for the improvements!
>>>> Thank you for reviewing the patches!
>>>>
>>>> Peter
>>>>
>>>> [...]
--------------1Vt1Bvmy5PK0htC0EH81Hw3s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p data-start="50" data-end="59">Hi Peter,</p>
    <p data-start="61" data-end="354">Thanks for sharing your thoughts.
      Once we identify the memory leak, I'll share the details with you
      and Kamil, and we can discuss how to proceed further. Please keep
      us updated on any findings on your side. We’re running weekly
      tests with the <code data-start="304" data-end="312">-keach</code>
      parameter, so it’s applied to every test.</p>
    <p data-start="356" data-end="383">Best regards,</p>
    <p data-start="356" data-end="383">Vitaly<br>
    </p>
    <p></p>
    <div class="moz-cite-prefix">On 2025-03-17 04:43, Peter Senna
      Tschudin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9a6a7e82-32a3-4960-ad5e-c70c6f5d81e8@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Vitaly,

On 12.03.2025 23:35, vitaly prosyak wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Peter,

We ran the updated igt-runner in our CI with your merged patches, and the memleak feature is working (using the -keach command). However, we noticed what seems to be false positives related to the ACPI driver. The stack is provided below.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thank you for testing and reporting back! I've noticed false
positives as well. In my case the likelihood of false
positives seems to be related to hardware and test list.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I haven’t had a chance to investigate this further, but I think it would be a good idea to share our findings upstream for memleaks found outside of the AMDGPU or i915 drivers.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I haven't considered this idea before: reporting other leaks upstream.
You are correct, reporting these leaks is probably a good idea. I'm
unsure on how to proceed here because I see two issues:
 - manual reporting does not scale in the context of our automated
   tests
 - upstream response to the reports

We want kmemleak results to improve our upstream code, but I do not
know if these reports will be welcome everywhere. For projects that
do not have the manpower to fix the issues, we may simply increase
noise.

What do you suggest?

Thank you, and have a great week,

Peter

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Here the stack:

comm &quot;swapper/0&quot;, pid 1, jiffies 4294672730

&nbsp;hex dump (first 32 bytes):

&nbsp;&nbsp; 00 00 00 00 00 00 00 00 0d 01 a2 00 00 00 00 00&nbsp; ................

&nbsp;&nbsp; f0 7c 03 00 00 c9 ff ff 00 00 00 00 00 00 00 00&nbsp; .|..............

&nbsp;backtrace (crc 2df71a7e):

&nbsp;&nbsp; [&lt;ffffffff824cd71b&gt;] kmemleak_alloc+0x4b/0x80

&nbsp;&nbsp; [&lt;ffffffff814e169b&gt;] kmem_cache_alloc_noprof+0x2ab/0x370

&nbsp;&nbsp; [&lt;ffffffff81c2f4dc&gt;] acpi_ps_alloc_op+0xdc/0xf0

&nbsp;&nbsp; [&lt;ffffffff81c2d650&gt;] acpi_ps_create_op+0x1c0/0x400

&nbsp;&nbsp; [&lt;ffffffff81c2c8dc&gt;] acpi_ps_parse_loop+0x16c/0xa60

&nbsp;&nbsp; [&lt;ffffffff81c2e94f&gt;] acpi_ps_parse_aml+0x22f/0x5f0

&nbsp;&nbsp; [&lt;ffffffff81c2fa82&gt;] acpi_ps_execute_method+0x152/0x380

&nbsp;&nbsp; [&lt;ffffffff81c233ed&gt;] acpi_ns_evaluate+0x31d/0x5e0

&nbsp;&nbsp; [&lt;ffffffff81c2a606&gt;] acpi_evaluate_object+0x206/0x490

&nbsp;&nbsp; [&lt;ffffffff81bf1202&gt;] __acpi_power_off.isra.0+0x22/0x70

&nbsp;&nbsp; [&lt;ffffffff81bf275b&gt;] acpi_turn_off_unused_power_resources+0xbb/0xf0

&nbsp;&nbsp; [&lt;ffffffff83867799&gt;] acpi_scan_init+0x119/0x290

&nbsp;&nbsp; [&lt;ffffffff8386711a&gt;] acpi_init+0x23a/0x590

&nbsp;&nbsp; [&lt;ffffffff81002c71&gt;] do_one_initcall+0x61/0x3d0

&nbsp;&nbsp; [&lt;ffffffff837dce32&gt;] kernel_init_freeable+0x3e2/0x680

&nbsp;&nbsp; [&lt;ffffffff824ca53b&gt;] kernel_init+0x1b/0x170unreferenced object 0xffff888102a2ed18 (size 80):

&nbsp;comm &quot;swapper/0&quot;, pid 1, jiffies 4294672730

&nbsp;hex dump (first 32 bytes):

&nbsp;&nbsp; 38 e6 a2 02 81 88 ff ff 0d 11 2d 00 00 00 00 00&nbsp; 8.........-.....

&nbsp;&nbsp; f2 7c 03 00 00 c9 ff ff 58 ea a2 02 81 88 ff ff&nbsp; .|......X.......

Thanks, Vitaly


On 2025-03-10 16:05, vitaly prosyak wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Peter and Kamil,

We'll run the tests and I'll follow up on this thread.

Really appreciate you merging this—thank you!

Best,
Vitaly

On 2025-03-10 03:07, Peter Senna Tschudin wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi Vitaly,

On 10.03.2025 04:07, vitaly prosyak wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hi Peter,

Version 8 of your three patches looks good to me. However, I haven't tested them locally.
Let me know if you’d like us to run them locally ( not CI)
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">I ran local tests before sending the patches, so I’m confident there are no major issues.
That said, if you’re able to test them locally as well, it would help confirm that
everything is working as expected. I’d appreciate it if you could run the tests.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Thanks for the improvements!
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Thank you for reviewing the patches!

Peter

[...]
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1Vt1Bvmy5PK0htC0EH81Hw3s--
