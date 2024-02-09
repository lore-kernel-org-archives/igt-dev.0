Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4035C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 16:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E6A10F780;
	Fri,  9 Feb 2024 16:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Sg8QvED";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CFB10F782
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 16:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkR+mhh4FmS9h9CRLiC1HYGfB+W+J3B0uFNHUeoCVz4KGZJo5TxIPTMA5XPGA1jZHUxgAc6iHMmIaR1SW75z/gUxDP3Nr4R+0iiF7iyZb6sREAkIKZU9R6GRGDMFdK7Iz0PozWymoKy6Snhp58MARLDDJW6tirYwy4QTuBgNDLwh22ffU5jwJUVp6kRwaJBLh8SEde8RoQcYsuti4K2exgYjoZZdE3zXmMrb45wakFECStib7VIJvg04BzBQ6SvhSBaKWXkUt/8hZpeUsrKhsPnMuqow5p1Cd9e45rRuZcEgk6ADHtmrdcwqQnn6x+h+UENGVK1Ngpf/0CkelTqqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+5vqQNLYtgvaWl0VqrM3FDUeiopB1xIomLLzbjT4YY=;
 b=UVgT+xu2OApnckVGc6sq1ml/XcburmX+nplAs8h3dFpURc+gLAnkwUF5fOh7egtDQnqbxV9Zoy+iIoAfyYuW/HQNVCKDG7GOIsFbx6P3WTWEZ6pjK9oG3TeS1EOITVgpdob1vSanQjUhB9r0yfuixmWE7SZfd+iWqyyL/Z4AvbGKli6L2SznBb5wHb7mNsis+W3IW/NH4oylvWp2cXRVYR2+7IjufosZfkB/zPf5utmjue9cBDbpix84oXMvXNkdh9JYbiNboEH1uSiUznBL8HxYyERuqVVeKWI0Vu37VOTbApms5x/olRg+TzzXtGjq+UfNur/dUz7QktTUFvOj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+5vqQNLYtgvaWl0VqrM3FDUeiopB1xIomLLzbjT4YY=;
 b=1Sg8QvEDB6PuMR/GkAW7NK5jSnroG6vUYYsryVDxiT+S4lzx2/Ys/BC3Up629Ber6/bFK4hXBIXQUuz7SBlJSGZU6zN3EFO4FomZi7x03SpU/+V/tatNj2oJPS3Vhj9CWmEIaziZxKnvLR6hI4JyWSVOlTZNcWN212LVXkqOeZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.12; Fri, 9 Feb
 2024 16:51:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3f6b:792d:4233:f994%6]) with mapi id 15.20.7270.016; Fri, 9 Feb 2024
 16:51:03 +0000
Message-ID: <b71f731f-f1e0-4562-bb22-571f5e5f7883@amd.com>
Date: Fri, 9 Feb 2024 11:50:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [igt-dev] [RFC PATCH v3 00/12] IGT tests for the KMS Color
 Pipeline API
Content-Language: en-US
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, =?UTF-8?Q?Jonas_=C3=85dahl?=
 <jadahl@redhat.com>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Aleix Pol <aleixpol@kde.org>, Alexander Goins <agoins@nvidia.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Hector Martin <marcan@marcan.st>,
 Xaver Hugl <xaver.hugl@gmail.com>, Sima <daniel@ffwll.ch>,
 Joshua Ashton <joshua@froggi.es>, uma.shankar@intel.com
References: <20231108164006.106967-1-harry.wentland@amd.com>
 <840d81e2-cdf9-4701-afed-b7f5b34b5d38@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <840d81e2-cdf9-4701-afed-b7f5b34b5d38@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0495.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN0PR12MB6294:EE_
X-MS-Office365-Filtering-Correlation-Id: 7873e0f6-6066-4dfe-6a65-08dc298f4cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FRQI6owuZDHGuCEbCcVrsgSM/+qS6LnC43KibwBZ8C/zBoPUQLOoiFDu86BR/Du9FRfxNSaVNVQkiM1eQfmxAcmI7Xs/MRNwOY0XIfOObU4PGfcQEeVhSRq5PUR71MrjMTzPfEPZV+jDznSvWx6g8wbtITqcUVDeYDuViwQ52wuOiTT5RNJE8OudNgieN1YrVdZeqwuBRdqCy+ZtWp5V6AUv2mV/Knj6fSrceN/T41CFPnVjDW9ggmW05vMbOBMsrv4KOxfWYLmA2P9tEc4QqRwB5shDPQ8leahCeP8JOOFFSV/ubc5p+P9YByDihmum5U2bYj41wwLUupXAp1Ic/fD4lGLVjDYC8rG6VXqOV2DhEm3rAbxmTqvF9QKDb65y0r0IZbpQcvsSMLQCztJ5IQYcQi5ZgfuKME9R3TyVfzR23RE+eC0bHzWPgluMsPb8aArtH2wGomm6t6R2uPBQMOiZStAtPMTCkeNagS5+5O8vGS/ljbgjF6XF9C2PtfAdX68nueyXU7jbnO7Zhbn+5/Ocr5eUZ/F1cp1ar3ViD18h94UFW5rJNzysDw2oguO966KfQJDkvXKNO8zMEQfyaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(31686004)(36756003)(478600001)(6486002)(966005)(41300700001)(86362001)(31696002)(7416002)(44832011)(38100700002)(316002)(2906002)(5660300002)(54906003)(66946007)(2616005)(66476007)(4326008)(66556008)(8936002)(8676002)(53546011)(26005)(6512007)(66574015)(83380400001)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVVBdk5NV29NalI1YllYbzFsdDhLQ01UQjIxQ21DQ2h0ZHNIZWczS0g4ZTIv?=
 =?utf-8?B?S1JQYlpFYXJHZFUybVBxZ1E4NlRscFp2TVJVbVMvbnJibVpHSzcxaWEzQS9H?=
 =?utf-8?B?U3MwZmN4eFlRbFpjQXVvU003aDFITFJiN2s5dUpENVJDc2pSRFNaWmVSQU9I?=
 =?utf-8?B?anozSEFlRVV5UjhoUGd3SG1BR1N2dVFMVDJ1Qi83UnVkMlRNZzFiL3M5R3Z5?=
 =?utf-8?B?ZmhwaDA2TW5ZVzNaOFJ6RUdMaUZ1dTlJYTRsRVpoUDE1Wk13VFFqa1JPOHNQ?=
 =?utf-8?B?eVgxcWxrTkg4R0JhTHpRL3dOSWdBSnJXakthdllPN09yditRSUdFTW1GQ3lP?=
 =?utf-8?B?N25PMGtPeEIxRFQwZXBzM1Y4UllNVmpLUXprSWhaY0pkL1ptaGJkTzF1OUpQ?=
 =?utf-8?B?UDIyM21uVmRMTDJ0NkNFVnBhOXRzRXNSdlUzdnZRQ2ZVT09nRm4ybWNaRXBH?=
 =?utf-8?B?ckxiaGN3MzgwOGZSaWp0Z29FQllCUFZ6bW45aS8wZG9MVzVHbzFQK1FNZmtL?=
 =?utf-8?B?aGR6WFY3QWtndTc2a1QvR3hiYXhBSEN6THBwd1hiSnpCV1dDRkYwUXNpUUov?=
 =?utf-8?B?Z2ZzWWdBelg4dVV2REd6SzZmSlNsdmpreG54RWtWM1R3eXB1NEpLZ0VhRVRj?=
 =?utf-8?B?TWk0WlVPMWRNZ01nR0hKdDR1eXRVekZMQmJaUmlvUGV4UjN2UWdHdVlGU0hy?=
 =?utf-8?B?K21xOHJqS3hUTEk0WGZ1R2R6dStXYjJnOUE0NGpLNjZtdXNJVXBQc0dWcHhU?=
 =?utf-8?B?MVBGZ0FBak1YQ1ZQelJBYkFIOWdZYzM0RlplV0pUdy93YkpqTk90SGowcFFu?=
 =?utf-8?B?bWVKNldQOHhiYnN4UU5xQlNIVldaRm9EY0h2THJqTGNlWmh2dUFCZHFTcnkz?=
 =?utf-8?B?VHl1QUZmN1RPbnJ0Qm5nNzJGVC8vZkRIc0xzc3BmeXEzbk1RMWdxL1ZHVlAy?=
 =?utf-8?B?b3VmYmh6cU5MenNsNS91c3MrYWRNUFNTVkl4SENZT1dPbmlYNDhrNkJkN2Rx?=
 =?utf-8?B?MG8xRWJYbVhwVGV3bjErK1ppL0lYTEx1ZFNUaEtxVzlHTGt2WjdyOVA5SzFZ?=
 =?utf-8?B?UGFPQzFxZTZaNVpwOGRUVUdFc2VIZHJpWWRhb2hDMVh3MllwRnR0N0F0MkQ5?=
 =?utf-8?B?YlJ4Q2NvMHd4WVp5WDRmaGtWTjFGOVlqNUpqcWczQStUckMzeDFRa2VhcTFX?=
 =?utf-8?B?NUhlaGdYTGFXcXVVTjJMUG9vK0FMd1pSRi9WSGlwcjlKYm4zY0l2bStaTFY0?=
 =?utf-8?B?MjFXcFV0VEVRQ3pRcjRzMzl1K2sxWVpScXhCZUFOcVlrL3RjNWg0S29YdnA0?=
 =?utf-8?B?WkJrWnBoTCsvWEdZTTNmTjNBMmdiNFcwd1NRMmxramk1ZENuZmtzN09laFN6?=
 =?utf-8?B?RkV3WUJyai8vam5wUVpETm5xUlpqMlJBZnNsVWh2V1Y5TVR5UHVCSFVadmYw?=
 =?utf-8?B?Mndmdm9remdNRHNMYWY3OGFubjhzaEZuZ2JaWkJta2pITXFSNXFjZWlTWWUy?=
 =?utf-8?B?S0NxcnY0cnBZcnRYaVN3YXhPVVVuT3ZkVEpUaThWM0lTK2hjUEZDVld6VmxV?=
 =?utf-8?B?RFNnNUVIUm9UYXdrOHBMTkxGOGJseTdZQXhQRysyOFllSTlJY2VZbHZYYXhJ?=
 =?utf-8?B?bGxueUpYYS9OdFlBSnF0UTI1cENwYlkzVm5JMDdVRHFzYVdpUUhROTF6M2Jy?=
 =?utf-8?B?NWQ5OWFkUVlqY21jNExna1NxN2YvWjdMVGlmeDBuYy8vSkVnUU5FUFFSSWsv?=
 =?utf-8?B?dDUya0JKTkFCQzNoSENCOUwrU3oyZ1ZvWTF2anZ2RExVWXZDR0xzWGc1cjVt?=
 =?utf-8?B?OTQzYkQ1Y0lPK05vNlZCTzIxRXBoVnhCRGpTcGpna1NUZGJ3NGMrZm92V0FG?=
 =?utf-8?B?Sjg2ODN4RGJaN21uWE5rWDN6WTJyWmNMeEJBZmpwUDFZVDN1clJLOFZCRGpy?=
 =?utf-8?B?YitDNUhZR3ZMU1dScmdrZE9peGZOMlFZTGhBbU55aFdMRWErNFlJS3dtdEZo?=
 =?utf-8?B?U0xOcXUwQ1NjZ1JPekRTOENGZ2c5QjZqYkxNZVNzdmcvczZDMWtxZXNIZnIw?=
 =?utf-8?B?N1ZTRGVuWUJhODBUbXIzRHh2eGRXYUUwZWdETnRLR2x1NnlkOFltK1BVY0lW?=
 =?utf-8?Q?EAgmp4qrP2rJofBBdO7V9P1WB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7873e0f6-6066-4dfe-6a65-08dc298f4cdf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 16:51:03.4045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lZNj8yTCBQu2z1MYBsqVK360z+zpAe6GVjvVMO2nvfjI0pEVGJj3wZX4yXNeiH9KUUvo5hnoiLmXXUtTsso+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294
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



On 2024-02-09 11:32, Modem, Bhanuprakash wrote:
> Hello Harry,
> 
> On 08-11-2023 10:09 pm, Harry Wentland wrote:
>> This series introduces support for
>> * drm_colorop DRM objects
>> * COLOR_PIPELINE plane property
>>
>> Kernel changes:
>> https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5
>>
>> It also adds a new kms_colorop test case that tests the color pipeline
>> API. The tests are designed to be easily extensible with a "transform"
>> and "compare" function pointer for each test. The "transform" function
>> performs the transformations under test via SW routines. The "compare"
>> function compares the DRM/KMS result (via a writeback connector) with
>> the result derived via the SW "transform".
>>
>> There are three tests for LUTs:
>>   - plane-srgb_eotf: pre-blending sRGB EOTF
>>   - plane-srgb_inv_eotf: pre-blending sRGB Inverse EOTF
>>   - plane-srgb_eotf-srgb_inv_eotf: pre-blending sRGB EOTF,
>>     followed by its inverse
> 
> We made few changes in kms_color & other places to support Intel plane color pipeline includes Custom 1D LUT (gamma & degamma) and CTM 3x3.
> 
> Hope you are fine if I float my changes along with your patches as a new rev of this series (This series also needs a rebase). So that it would be easy to review all IGT changes present in single series.
> 
> Basic changes are available at try-bot (still need some cleanup): [1]
> Please let me know if you wanna suggest another way.
> 

Sounds good to me.

I will probably send a v4 of my set with some enablement in
amdgpu in a week or two. If you're sending yours as a v4 I'll
pull your changes into my series and send it as v5 later.

Our (still somewhat WIP) work can be found at:

kernel:
https://gitlab.freedesktop.org/hwentland/linux/-/tree/amd-color-pipeline?ref_type=heads

IGT:
https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/amd-color-pipeline?ref_type=heads

The kernel is based on a drm-next from a month or so (6.7 rc5) since
the 6.8 rebase introduced some issues on my laptop that I haven't
looked at more closely yet.

The IGT is rebased on a fairly recent IGT master.

Harry

> [1]: https://patchwork.freedesktop.org/series/128168/
> 
> - Bhanu
> 
>>
>> And a number of tests for matrices.
>>
>> v3:
>>   - Remove need for IOCTLs and libdrm changes
>>   - Test colorop properties with both atomic and legacy code paths
>>   - move enum drm_colorop_type to drm_mode.h
>>   - Add descriptions for public functions in lib (Kamil)
>>   - Use SPDX style license identifier (Kamil)
>>   - Replace Skia license comment with copyright note in file header
>>   - Fix kms_colorop subtests if applicable color pipeline not found
>>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>>
>> Harry Wentland (12):
>>    lib/drmtest: Add is_vkms_device()
>>    lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>    include/drm-uapi: Add COLOROP object
>>    lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
>>    tests/kms_properties: Add colorop properties test
>>    igt/color: Add SW color transform functionality
>>    lib/igt_fb: Add copy_fb function
>>    tests/kms_colorop: Add kms_colorop tests
>>    drm-uapi: Add 3x4 CTM
>>    lib/igt_kms: Add support for DATA colorop property
>>    lib/igt_color: Add support for 3x4 matrices
>>    tests/kms_colorop: Add 3x4 CTM tests
>>
>>   include/drm-uapi/drm.h      |  15 +
>>   include/drm-uapi/drm_mode.h |  22 ++
>>   lib/drmtest.c               |   5 +
>>   lib/drmtest.h               |   1 +
>>   lib/igt_color.c             | 344 +++++++++++++++++++++++
>>   lib/igt_color.h             | 114 ++++++++
>>   lib/igt_fb.c                |  40 ++-
>>   lib/igt_fb.h                |   3 +
>>   lib/igt_kms.c               | 306 +++++++++++++++++++-
>>   lib/igt_kms.h               |  94 +++++++
>>   lib/meson.build             |   1 +
>>   tests/kms_colorop.c         | 539 ++++++++++++++++++++++++++++++++++++
>>   tests/kms_colorop.h         | 124 +++++++++
>>   tests/kms_properties.c      |  76 +++++
>>   tests/meson.build           |   1 +
>>   15 files changed, 1676 insertions(+), 9 deletions(-)
>>   create mode 100644 lib/igt_color.c
>>   create mode 100644 lib/igt_color.h
>>   create mode 100644 tests/kms_colorop.c
>>   create mode 100644 tests/kms_colorop.h
>>
>> -- 
>> 2.42.0
>>

