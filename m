Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94346CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 21:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D0810E7B4;
	Wed,  5 Nov 2025 21:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W6pDjGde";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7C10E7B4
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 21:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMYRlYpfxoBHD+U3NzTXHrP8NlVcQRZbqKmq5rjj7rKzNpqMVBcW1rizzPwYUms37LwDmQYQ8TH3KXgXHDpOtdKzthm+4Xrx99U91mnmmPCC9x6XOy6sZnA4b0U7XhYLpYBRB2N+u4yAu0lwfndJi/GHd6Inz0VTPerCdF54l0MFmJBN4or8yeFXgO4iBxwfVXOXF000crzMCjr0ItfyDmS4VFl4pNS2Q8Q2IyXc+n1RH1qxWEEPqE5OwITQQvg9wHwUr6/8tWvT9aYe4+5ppR/L3t/bOggg1EIkKGlNsbx/NW2ELRLBVOJ1Q8KLH5eo47Jhv0JxHVsaUAAa+vyGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6g9ITOLlF4MOjIAEMee39luPWsL+LD8leMDr1cq+Js=;
 b=CjANu4luSU/txPlmkOGOVL5eXjy0qqgIJ4kMpeab7FdiDyi74pZfExJwg0APoxTIdxMUsvxYFvYhVuYwKlinIm6Xy8YO3gvjB+MFGouD9dsljbiY8o2S0PEuJvSc67E65MkncmFTQNjbVYnUk2pgRu/mEySm5+EUilWugvo86OV3tgFs6ks800wlWKXgakcRfUCfEz758Vci7U0tWU3Wn0mRH/Kh2MmaQWJ91xvSG/b9mRqgHUwFq6/moGbE4hnJbxhGzGRrcgwvCtlqR2Gn0xJAjiDPP2v/LXt9CQPc877WJAMvcZa/JpPrUspCeD1y8bNXPwvrhUO7LqakrM1d4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6g9ITOLlF4MOjIAEMee39luPWsL+LD8leMDr1cq+Js=;
 b=W6pDjGdeWT+plKwcQrFy+REtNfNMWDc4obR23uUmNKSl9FIhPv216gA5ZGA6ZCOPxWCawyleeUFLIlcLNlkw/FvO7RcbSuVXjYwM9MNk/SvUpi6SGaqJ/ASQ/sKrAnJs57And8yV8Q9Jt3AJUnq1uxa6IUOjV5+tTHM8S9AYrL8=
Received: from BN9P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::8)
 by SN7PR12MB7276.namprd12.prod.outlook.com (2603:10b6:806:2af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 21:50:50 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:10c:cafe::64) by BN9P222CA0003.outlook.office365.com
 (2603:10b6:408:10c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Wed, 5
 Nov 2025 21:50:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 21:50:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 13:50:47 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 13:50:47 -0800
Received: from [10.254.40.35] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Nov 2025 13:50:46 -0800
Message-ID: <6fb1d8d0-4fa2-47c1-9f35-f759efd851d0@amd.com>
Date: Wed, 5 Nov 2025 16:50:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 29/32] tests/kms_colorop: Add a 3D LUT subtest
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-30-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20251030042801.2315866-30-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|SN7PR12MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d14f34-8350-43da-dc25-08de1cb5627e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|42112799006|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHQ0cmtaQ2Z3RWlaaFoxMU91Y3ZMSE9sTVNTRTJhR3BqZmtvWFBwTWQralRW?=
 =?utf-8?B?dGcwcnFLRDI3eFM1WGlSRStNeUdHUkltTVkzUHNjcTBScHFCS2tWamJrTDVz?=
 =?utf-8?B?cEcrRjZTMXZpaUkvUTQwT0lPWUJjVVoxeW1PQldrYXNiejZDemd1U1ZNUVF5?=
 =?utf-8?B?K3pybTFkSVkrZWx3TUY5d1BiY1dPRjlUdWFZMjVpQXVYSFJucDltVEN2bXE3?=
 =?utf-8?B?ZjFjaUpUSnVFMHhpalBmekoxQytJM0cvcWZzTTl6NEVwdjdkajR0TzZDelhN?=
 =?utf-8?B?R0N5b2NQdnNLSTFZS1FVSXVmK1o1RGFCQTR0SCtpSU9aN3ZEZ1U1aEZlYlV5?=
 =?utf-8?B?OENEdmJLeDFWaFRpOHhxa2dSbVZZQmtFWExoMXVmVnZaeHVjVDhPWDNJa0lq?=
 =?utf-8?B?OWN2M1dnbW5OcFVrMW1Ld3FiWFdBYmVBNG9jUWhRdDFyL0JBYVNOMTJZWDND?=
 =?utf-8?B?eFl3d1BJYk5oT2o0ZGJ5amFib3ViMFE1OTBWaHFPU1pvbUZSN2RvNmppK0xl?=
 =?utf-8?B?dWoyM3VXZVQveDBTNWVoYnJ2OHBNZU84UVVGWUxoSWVuVEl6S1RVVFU2QjJl?=
 =?utf-8?B?djE3TDFmbzFzaWo5a3pVQ0h2K0tyek9kRndJdDhoeE1GZEl6R2p0emRiSXlO?=
 =?utf-8?B?eFZkTG00LzFYbkNGQmZiNUo5OWdpRkpoUjlNL040UXoyNS9OYlkvYTY5azBN?=
 =?utf-8?B?SVhEMWVyWEJuVXNPczBNcWMzVlo5MnorVmI0d1R1MjJERUR5R1VwK0FJWi83?=
 =?utf-8?B?cExYd3FxNkhoaSttM3J5SVNESVdXQlVRT09FUlkvd0p6UnY1NlBESzgyTnZ5?=
 =?utf-8?B?WVVlNlZPSUVEejVlVGhvbWhuZ1J6TTVYbWhjcGorM0xTWXJhSVorK1FURFB2?=
 =?utf-8?B?U0tZSTRZRzB3L1JxS056RG51Rzl1b21jQnU2RytneUg4bWdXMEdockxhTEhP?=
 =?utf-8?B?dFpjbmVobFB3Vm16cERhNWI5RFNSTnowL0c0bG5VbWtFenhvV3FCR3FIM3lM?=
 =?utf-8?B?TXBTT1JFVXZ5cStuelpIczhZK1hLak1vZHI1UnM3WVlyQkh2ZjFCeGRDbHcr?=
 =?utf-8?B?SWdaMWdhWEIrTHdRRWozbFZwMlJjZ1JQSUVtUjlvMGduODNXc25uN1cxeHNM?=
 =?utf-8?B?T0JWdHlaMXBoS1ZGWVhtTUxjVENFWFhqa3BncllQUmkydzB3dTV0SVBqdzRs?=
 =?utf-8?B?ellFd2ZrODhBbUtpdEcxWU96UHlGN3lBS2tuemlJa3diTTRDMVFyVDV0WHIr?=
 =?utf-8?B?SUhnRC9oaFRSOEpicnZtNkRrMFEzUkUrcllSTnpPTmx4bEhjVk16YVNLVTgz?=
 =?utf-8?B?WCtKNWdZbDBTNUovK3NvSnNRcXVIb3dEaTZaS3greTRzUTdldkxVRDJ6cG53?=
 =?utf-8?B?a2w3MWFNK3F5YjFxdldBNXpZQzlVb3RnN0p6eWk3NlVlbUhDN0cyWDhuZHQr?=
 =?utf-8?B?bmhGOVV2THBtcWNLRE50NWFpU0YxVlI0WTQ5ajR6WUc4NlovaFdSUlk1c3pF?=
 =?utf-8?B?SU8vZ294TmhKVmtsSTEyeUtWUm9XZjNTZ0E5bEF3K044eHBZN2ZKSC8xTWVG?=
 =?utf-8?B?aWovNDY3aE9CZ1E4OU1ETzMzODBJQmZZYzFDSU5LVFhUcWFJLzUvQ1M3U1VU?=
 =?utf-8?B?Y0ZBYzBvK3BnVXdQNG5Rb0pwK3JxSGJ3bnRjdzNEeEF6MTZPL1Uvb2R1cTlh?=
 =?utf-8?B?dnAyUm5wYlFNZnZqWlVsenhzQTcwQnB0MjZWTmZSbGp3YkpPek9ubE0zdFpz?=
 =?utf-8?B?bmt0RmI1aHoxL2c4NzdwSkc3OWN4RUJuZUpFV2JUSDh1NlRlZzlDc0xoOTF6?=
 =?utf-8?B?a2RUOGdGWGV4UTBBT0dhTG5TQTRRL1hVVVhTaytacGpxSUl4QlhoODU1Wmk1?=
 =?utf-8?B?UjNUMjdMbmd0NGJ6N3FkZktIcmhpM1FqUFlDamxablVNR3hadWN5SXNTMHdi?=
 =?utf-8?B?eWRrRVJVcGowdXp5UFJuYkticHY0Si96TndjQTI5REU4RVVVQldPNWlGY1Zm?=
 =?utf-8?B?TkVBKzh5SlVHL2hnUkxVWktDMkZ0cFVtWjZxN084dXd6SHQ1Q1RCVXdwTUps?=
 =?utf-8?B?aUFSQlZmQldrbkJxbjQ5Ky9sUzFKZE1LNEcxU0cwZFpWT3F3aU9QMDk5Rmhl?=
 =?utf-8?Q?7e5s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(42112799006)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 21:50:49.9891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d14f34-8350-43da-dc25-08de1cb5627e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7276
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



On 2025-10-30 00:27, Alex Hung wrote:
>  	case KMS_COLOROP_LUT3D:
> + lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
> + interpolation = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_LUT3D_INTERPOLATION);
> +
> + /* Check driver's lut size, color depth and interpolation with kms_colorop */
> + igt_skip_on(colorop->lut3d_info.size != lut_size);
> + igt_skip_on(colorop->lut3d_info.interpolation != interpolation);

Do we currently not care about color depth?
I see the property enum IGT_COLOROP_COLOR_DEPTH was added, but not defined in kms_colorop_lut3d_info_t.
- Leo

> +
> + configure_3dlut(display, colorop, lut_size);
> + break;
>  	default:

