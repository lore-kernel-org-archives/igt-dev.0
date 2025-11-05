Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B73CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 21:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFB610E0F7;
	Wed,  5 Nov 2025 21:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kz92w2Y5";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010003.outbound.protection.outlook.com
 [40.93.198.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA0810E0F7
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 21:59:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbWAbj/Gk4vcubVkHA68DTmq5PJ7WHuj+mkWKHWGG+d8MAtGYpLlvMTZxc5h0UiurwhzFXPo01lasO5zALtAk+XcJAa6IAivmTnfrW+XfB+ikUND9vkJnC6YlF+sChZFrR+46KKDR+BsT5oRJA0j6USUu9lIyaiwfJKLxHJQ2XNhA+rbffDj2x/YtSTg/jdAMXvjSzyQ7FPA04WmD28hS5S3AavYwpM6COYQZhAEpTywk/ZHxpwGR72Y2bFNjEGRS1wjmlDhHaScAEft8pDrmHFSkR6lunJKK7Kx8EiYqm2RNHhzATQE8nfY5Hq1Hc0Fs7aD5Qun3CT6g9tOp5kKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWpyInsJotZ5keqNag3vfbZzOPw8kzfJZMIVK/UmmCs=;
 b=l01Q92NKSPbldlNqeL6cdx58rGmU4B4JFFPxNpjwhtEUYYfTXOgBuDFji/xhFeHuwRKm7SyPO+M8GhUzW/BrKQdXz8QelOJYpi0ioifViNlKKlJ6+FhUOyaWUQ7RdTuqH90z/YhvVXJoCY6IeyjOsbBu3VGR3XuI04dqivJmIUm9epvKbdCLgI5MAPHBMXry3P4QqQEUiKEAMPsvEnparzFFL4gbq0Lt+2i/ZtGDAgwzEzQx5IF6pxda1Jk7jValB6IyUoOSWdnN9C+wZJvVslynOeS1MSkKW0YAuJjVcKnv3Ydpj22RZJd/nSrhy8lhUKrdgf1APF4Nh9juuFfU5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWpyInsJotZ5keqNag3vfbZzOPw8kzfJZMIVK/UmmCs=;
 b=kz92w2Y5wuv8qmTprFtt3EGDg93j3ON/lz2ugPEltpN0wYSch77sMgTGfoEfK0SSbNQOGMoIk8DVTMFtjhEgQ4a8gQs8KE+tQV53COgmECe5nLvepmz/E+SAmWQjg4KZB//IJzh0qt1DEqWG2nyq+VCgksuamDECSOvG1hI1puY=
Received: from CH0PR04CA0110.namprd04.prod.outlook.com (2603:10b6:610:75::25)
 by DM4PR12MB7744.namprd12.prod.outlook.com (2603:10b6:8:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 21:59:33 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::e1) by CH0PR04CA0110.outlook.office365.com
 (2603:10b6:610:75::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Wed, 5
 Nov 2025 21:59:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 21:59:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 5 Nov
 2025 13:59:32 -0800
Received: from [10.254.40.35] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 5 Nov 2025 13:59:31 -0800
Message-ID: <0d59670a-3e2a-48a5-8981-7de838178dbb@amd.com>
Date: Wed, 5 Nov 2025 16:59:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 05/32] lib/igt_kms: Add COLOROP properties and helper
 functions
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-6-alex.hung@amd.com>
 <58e9bfad-b78b-4ea7-be37-f8ad158ce771@amd.com>
 <02074472-30b5-462e-b9f8-52450adacfdc@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <02074472-30b5-462e-b9f8-52450adacfdc@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|DM4PR12MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 5abce401-fc5e-44b4-499e-08de1cb69a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|42112799006|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UXViOFNicElKYjVuSG43TVFJZGN6dEd6R3dWeVRESGtyRlR4N0pGblFzMTJ5?=
 =?utf-8?B?dll0ZHJZQVFXZm1MbkNuOHNQaFJrNk1WL0lzSVJCcnpVN2JVQ1RudFFHdE1t?=
 =?utf-8?B?MFRHQzhQQXNrM3pwQnNvMkJLR2poVDVOM3ZwT3lzZmpVeEhvZ1p4K1B5Nkt1?=
 =?utf-8?B?VjF3cnI1SG1vSVRZZnl2dDJONGJ4dnF3Q0Q3MU14bngyTlRjRkVsNTVNS080?=
 =?utf-8?B?Q2cybzJ1K0s0UkJRMDJVUk5mQVJLSGNKcWVLZ2YwTVl5RGhZdldqcDhybzcr?=
 =?utf-8?B?OGJ6U1hrYzQ3OUZYV2ZrV1AvcG5UV05lUGZEWmRsblVtOW5QU3ZyUFAzZGFP?=
 =?utf-8?B?cUpBWDdFV0NHQXhKeUI4L1l0Mmp6S2FzaDE1OTBjRXlqaUtkRFI3VEg4SUtr?=
 =?utf-8?B?VW9vWGVTTDlmUzRDRkhPNjk1OEV2Y05CeGgrVzFVR1VKYzR1N3R1dnlOOVE2?=
 =?utf-8?B?V2VmNFlHOThGSFFhd1M1Uy9oMlRMR3ErOGdCKzBFZTlFdzdMZE1LeU1ZUWVZ?=
 =?utf-8?B?MzkzeldKdm54bXhRUlI5aWp3SU5yWkJvU3BDV2MzRWZMWHhPQ0VKMGg4VHVh?=
 =?utf-8?B?YlNHWnIxOFB3RElkZEY2b3MvTGU0ZmY2WTVJMXN4aFV6OGxwdTVxeDEwUkxM?=
 =?utf-8?B?YjAzSUgyM0J0c1l5TVN0Rm1yUjZSeXBvVFFDdzZ1WHcrTHBWTHBEMjlGMUN5?=
 =?utf-8?B?d2xMdmZZOUQrUmtSTFVuY1A3RDZtejJrUVpUOGVSM0ZoeURPUlBLdm5CeGZi?=
 =?utf-8?B?R3FjaUQyZlB0aGhZSi93YkhHbmRCQ3IwYVcxNm5JSExkOUoxZG1NL3F5QStF?=
 =?utf-8?B?aGZXdDMzdmZkeVN6UmtsSmhvRDVJMmt6d1ZLVjlkYSs2Y0ZBRnREbHA0aEZT?=
 =?utf-8?B?QVdpSzkvUDJjdXFlcTV1czVHdkZmNmpOQzUvY0ZkYko3VmhsR3I2VklaOGp5?=
 =?utf-8?B?b2ZIUlVUci9FQjBDUEhUbnZ3cUt1VGJFNmx0UFRBdXlSc1ZjSlk1RU1VRzJs?=
 =?utf-8?B?dWZnUkV2eSt4Rnp3ZUkyLzdTb21XRHRtdFNzWFFkNFhGMW9ZbDJhWTA3N3lh?=
 =?utf-8?B?YVEyejVXekxNeEJsNUlSdVR2eDlNQ1Y3U3VXdU9DS2lzalppcUV6aHg3OFVv?=
 =?utf-8?B?VlhmOTZyUDRSdnJ0OTkwWFJNalFDeWtiY2RoMHY4UVd4MGNjMzdWM3AyUmR1?=
 =?utf-8?B?VEN2NXQvS1FsY1hBRWFRd2V5MXcrYmpjQ3QyNlpqYWdXS3ZlQlNwWUFMNlBn?=
 =?utf-8?B?RHJ6V0M2ZEowd3Vibi9IUjFXZkRRTWRFYVFoVENZZmx2bm9vb29seDYxMkQ1?=
 =?utf-8?B?K2RYT3AyeXdHUVFuYzdhTVRDRTlKY3dNaVArbXh0b3FEV2h4Q3ZXdXpWeFVi?=
 =?utf-8?B?TnRCWlJRNkNXaGYwRVF0ekZ6bGY4Y1h5M2xWb0RDeG5QUmI1My9CR0RESWw0?=
 =?utf-8?B?Z2REQkpGRm16NkJMUXBmS0UvY0piUnRWWU16R0tlK1V2V2t4YUl3dkdEM3Ux?=
 =?utf-8?B?anJOV1J1VW9yNUJkRWU3ak1Wb3k2U2FHSFRVN0pmUEtwUWpDL2M2R0Q0YUNy?=
 =?utf-8?B?R0poejlLTDR2WGtVc2gycFhSb0dJZ25VM3VDOWJXemNmY1F5WkxSVC9WRDFa?=
 =?utf-8?B?ZmFVYzA3RzJlREMreVMzRnFjUnA4NktRcjMyL0poc3pRUDZqblByRFpmUXUy?=
 =?utf-8?B?QjZ2cFl4Q2NtUmxTWlB1TEVHR1BPR3RwVjF2QTV5VTMvSW95UmJJcEJCQVJO?=
 =?utf-8?B?SlJ4eXJQN1Z1aHI1TXpqb2ZRTktUaUk5NVpwOTFqMUV1OGVIdk5uOFpnMk10?=
 =?utf-8?B?aEpQNHFYNDBCbUg3WUdYZFhpWFVzOWtPN1Q5by9oUXJYL0U0eE5WRzVDd0xr?=
 =?utf-8?B?TTA2eE40aTZKOVF1Zk9LejMzZzZ1dFo0UWZybUlodEZQbUdoSG0reUhsVVAy?=
 =?utf-8?B?UVRPdXo5L2lHOWI4aFZncXdkOGJnRGFveWNvMUpCZVBhZFdhLzdrSmVvTGZ3?=
 =?utf-8?B?bjhMMFRTbFhsUlJ2dkFMdzVYVXFoVjVGWmhiRnlPY0pBRlFkWFlwUDJMeVMy?=
 =?utf-8?B?UEIzeHQzUVo3NEVxZTFQNDdZa092QzExOVI3amtyQVRNNlk5ZU8rVkVnWUlI?=
 =?utf-8?Q?zrKA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(42112799006)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 21:59:32.9591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5abce401-fc5e-44b4-499e-08de1cb69a3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7744
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



On 2025-11-03 17:04, Alex Hung wrote:
> 
> 
> On 11/3/25 14:22, Leo Li wrote:
>>> +static void
>>> +igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
>>> +               int num_props, const char * const prop_names[])
>>> +{
>>> +    drmModeObjectPropertiesPtr props;
>>> +    int i, j, fd;
>>> +
>>> +    fd = display->drm_fd;
>>> +
>>> +    props = drmModeObjectGetProperties(fd, colorop->id, DRM_MODE_OBJECT_COLOROP);
>>> +    igt_assert(props);
>>> +
>>> +    for (i = 0; i < props->count_props; i++) {
>>> +        drmModePropertyPtr prop =
>>> +            drmModeGetProperty(fd, props->props[i]);
>>> +
>>> +        for (j = 0; j < num_props; j++) {
>>> +            if (strcmp(prop->name, prop_names[j]) != 0)
>>> +                continue;
>>> +
>>> +            colorop->props[j] = props->props[i];
>> Should the values[] be read in as well?
> 
> Hi Leo,
> 
> the values[] is updated when igt_colorop_set_prop_value is called, and it doesn't need reading here.

Ack. I was wondering if we wanted to initialize values[] to the current DRM state, but I suppose that's not needed since the tests initialize everything to bypass anyways.
- Leo

