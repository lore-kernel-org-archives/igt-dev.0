Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEBDCCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 21:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9579C10E140;
	Mon,  3 Nov 2025 21:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hknURIAj";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4437510E140
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 21:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiY5uKQ6WZohQ8YLM8RhAY+kSoJCFz9IcIxzKlwhmJT9t9HNtgfqGBvtURougFJQ5p+n2qynBOq3cytO/+zV196tACqm2qGzmRWN5snplJCMJD15NllAPZP/gKK0zWQL+iYN2qrLOevQnyLH0uAb8ldlfme04p39vju0X9K6q/UvETCGQnFvi0TPQFm3Up2YZPFlb5/jY+2KVfXxevixtP9JTC8LEl9g40+isdozNnWWconu0xMxGpWNX6R41rBpNShvGSIyJ92q6e+ZxjZ2QJuwSkc6TNc8EC09EX5aHol9l5ZuELTGDSJAN5EnXMZlQkD3c5LpGc8ITb93pRvgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iwq5Ja09MLvXxMWlgS3AQKtq4rSlewfDRd4s9yjrF9M=;
 b=BxOCrLxKx4kQkqUD2LUeS4R7R2iSrWcFoJ37s3j5NWHn22mo6DRS129wt8xEL5ouMGS6g85bYJ20D8RKAudFXV3HGDzlWm4bYBZ2YTy06sJO65JCq43JrUXi3GOWV0Kwn8TzC1XUBFggx3gtOgy22iUhCgx6aTk0CsJZeKjuzUQbBjswSsLk4MUQELNKJrGUQIm+k3XBV2gZ/ziXdgx0la0pBuj4ejSazx2svwNbB9Lu+ZdHY5y/OzdiDpr4NLoEyzO7IiKq6Zc2RLvsStl2wShCtYgx5LvNJTF6CuUA2yjQ8z/1jJxKxOwTBUcdHNjbylywji5rLGuuW8ehI/J08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iwq5Ja09MLvXxMWlgS3AQKtq4rSlewfDRd4s9yjrF9M=;
 b=hknURIAjhikgmjihXOyIPTHzk7KhAPptfYwBJnE+xVOwCsjCipR0cM0JHB2Cm+TMFtjNg/TLwE9wvqULZl3yhrbdJdxhT9uAFD+CkXEPD7ZHRs2DytppJlpTh9mUB9slisFph+x6CbzmAHKmJR6V9DGmIgOV1b41rl8d0AKGAH8=
Received: from BYAPR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:74::15)
 by LV0PR12MB999069.namprd12.prod.outlook.com (2603:10b6:408:32a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:58:02 +0000
Received: from SJ5PEPF000001D0.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::e0) by BYAPR05CA0038.outlook.office365.com
 (2603:10b6:a03:74::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 21:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D0.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 21:58:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 3 Nov
 2025 13:58:01 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Nov
 2025 15:58:01 -0600
Received: from [10.4.13.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 13:58:01 -0800
Message-ID: <4ad03b16-c2de-4308-bc09-ad661961f3f6@amd.com>
Date: Mon, 3 Nov 2025 16:58:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/32] tests/kms_properties: Add colorop properties
 test
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
 <20251030042801.2315866-7-alex.hung@amd.com>
 <5372a9d7-b9d1-43bd-973a-ad431e97d87e@amd.com>
 <372691b0-c30c-47f9-86c1-29e75968320d@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <372691b0-c30c-47f9-86c1-29e75968320d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D0:EE_|LV0PR12MB999069:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dcf336d-7651-404e-0f4e-08de1b240f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|42112799006|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEl5bitLMkZld0l3K3JtY3c3bDJJQmZmQWpjL0pzNUUwWGRPY3pIWlYwZzV0?=
 =?utf-8?B?SDBhUFBmTm1RT3FQNjlwcEtQeXVMV21Nak1Ra2ZYMEExTXE3T1BLZ2t5bmpm?=
 =?utf-8?B?b2FXNUlvZEtjU3AwcXFUTDdyeDZnZnA3RGxUMEpKZFR4VVEvU1Q3RDlXZXQy?=
 =?utf-8?B?UkhiSEJJQ3NzL1REYmpQaWtXNGtTOU94SlhKOEloQzN1L1RNeHN5MTRIT1FE?=
 =?utf-8?B?QWVTQVpvU0lGZTdsdEF0QnhyMVBwcGFmb3RyU2xJS2RlcXNDYkhFcGo4UW4r?=
 =?utf-8?B?cGFucWxWRjJhbHZ6Qk5NNHl1MHpSV3gzWS9XQnNORFFBcFZzK3pTdng1bEdY?=
 =?utf-8?B?Z2thK0FnVGpFV1ZnQzhSNkw0STFxWERQZFhqM3ZlOGJmaVhxMk1Ud3Qzcnp2?=
 =?utf-8?B?NllnSjVzVXB2VEJxZWovY0lNdGU5cHlmd0ZpU3N6YTRkdTNJSVJHK2FYV2wy?=
 =?utf-8?B?YUJZdGFrSVg5M1JuWmFCekwvNTVqUVA0OVhIYkRRNEEzY0VtMVBITHFwMmZC?=
 =?utf-8?B?VHVLSm9WWlZvbXFRMG81M2RhYUZzU2c0d3JncFFvdTBZaUkvdSs3SXYvZjB5?=
 =?utf-8?B?dndzLzVCcm5IWnlvSjBobFp0Z1d1OEJyR0tqWjRrVDVZYlRtZkxJQUVsdVlJ?=
 =?utf-8?B?blo2Q3NjSVBJQ3BnRFU5NUpsMk9lYUJCcHZ2Y2tBcnJ1Uk1RL1lVc3VPaCtn?=
 =?utf-8?B?NnhxWEFTK2pZT3VJdXZ4c3RPMnVJdHEycXBrZmhBSng5bEpEZys3ZnJxL3lB?=
 =?utf-8?B?SFRLczhDQ0dmcHFtNlVDUHkwbFFybWNmaTNUck9rbW9ITERvdmUreVRDSGQw?=
 =?utf-8?B?WSswZ1Jucmc5WjBnN2x6M0VNZHdlWm1sQjdlMmRnYittY3BlRnZJbWZuVUc5?=
 =?utf-8?B?bm5NY1JTOGsxcVNGTlMrNEtURmEwWkNSQzJGaGYyK3pINnBsRFN6V2F1ZzRa?=
 =?utf-8?B?TUhoZDZQWUFVVzhydlM0ajgzblcrSFlTVkpiTzZPcjA4Ym44dENiL1JnSkhn?=
 =?utf-8?B?SzlOY3pvbWRoY0s5MHUzSXNnY2dRbXYwQ0Z5ZUtTTGJONGFBMkMybityQ1FL?=
 =?utf-8?B?NWNTRllvVVEwcExHRWdHMzVPS0tHb3ZGbENJN0w5ZVdCNnh3QmJsQ1Y4Z2du?=
 =?utf-8?B?K1hzUXZ4UVdlQ3RNSlJsdWMrVTgxcWRPRzVJQWlWM29Zdk5UTFBreGZNNURX?=
 =?utf-8?B?TnVGd2lERUJJWWpDcW81MTdEU2FJdFR4Uko3VlBmZzY5WGFEVU90QXJUdEsr?=
 =?utf-8?B?YVgxWmdzK3daaHpqYUMyWENyck5DRkNpdmNUL2lrdk1DUVFCakw2QzFEWHpS?=
 =?utf-8?B?NVpLdWVHQUcwWm9pR1ZUZWpEU0g4cGVsclVBLzNnNWlUUk9DSS9YRFlScFd2?=
 =?utf-8?B?cTFFOFh0MXZsdGRNbkdmaGJUNGE0ZFRWNkh0eFFibExBaWhRTlRidWZVLzhz?=
 =?utf-8?B?N0o5c2tRUjBzMmRjK0xNQXVTMnB0RGhlZWNkeWQ4Z3NqVERrOHZDVW00cmpM?=
 =?utf-8?B?QnJsbmIwU0ZJS0dST2kzZWhHLzEvd1JQRldOeFlVamo3Z3pueWhlQ0pyOW1L?=
 =?utf-8?B?cUlLZ0UxR2dGTHFwcTUxckthZWdUc1ZyYWJZREkvUlcwUVlGcUVrOTh2WmZm?=
 =?utf-8?B?MHIwelVoN01MU3ZiRStiSU1nd3d2cUVGZDh2cGN5MWxrdXZWMEFhTjVua2tm?=
 =?utf-8?B?ck9yVDhLQ0d5VkJvR2prYnRIN3VjbFVpdnFDWDZMdjdoUU5USUdlV3NMeFRl?=
 =?utf-8?B?M0xSSDBvK2hiVjFyOFcxMnk1cXpUcm1TMEcwRTl4UUdxSVk3QTBxd1ZJYjU2?=
 =?utf-8?B?UHV5ZGFzM2xxWkpZWWhHUjdteTZHSmpBWVJBVFlUM0Zkams5alEzRUExbGhF?=
 =?utf-8?B?ck50eDVOTSs3YUMyZTRpYTJWMTRld1FoQmw4M3kybzhHaWlYN3FnaFQvQTBF?=
 =?utf-8?B?ZXhjSVpkUkY0M1lVdHBnQkxheGNBUitIdWZZc21Udll0RnhOWHlTZkxVMmgr?=
 =?utf-8?B?a3N0SnYwbXE0TFUxZm9VdmRJSzJxUit5bFA2azA1MFFHUU5EV2VqYW9JRGFn?=
 =?utf-8?B?R25pTUI4d3hBYmswaS96MWVHZDVMaGFvbXhwR0ZOTU9vMndaOTlOMlZ6eGJ5?=
 =?utf-8?Q?pxt4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(42112799006)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:58:02.1119 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dcf336d-7651-404e-0f4e-08de1b240f41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999069
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



On 2025-11-03 16:47, Alex Hung wrote:
> 
> 
> On 11/3/25 14:28, Leo Li wrote:
>>>   static void plane_properties(igt_display_t *display, bool atomic)
>>>   {
>>>       igt_output_t *output;
>>> @@ -853,6 +920,10 @@ igt_main
>>>             "Tests connector properties with legacy commit" },
>>>           { "connector-properties-atomic", connector_properties, true,
>>>             "Tests connector properties with atomic commit" },
>>> +        { "colorop-properties-legacy", colorop_properties, false,
>>> +          "Tests colorop properties with legacy commit" },
>> If colorop_properties() skips on !is_atomic, do we need to define a legacy subtest?
> 
> Hi Leo,
> 
> Do you mean removing the atomic for colorop since colorop doesn't support legacy?

Hi Alex, I meant to ask if the "colorop-properties-legacy" subtest was added intentionally?

I ask because the colorop_properties() test func has this line, which seems to make the legacy subtest redundant since they'll all skip:

    igt_skip_on(!display->is_atomic);

- Leo
