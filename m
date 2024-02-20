Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE290C48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 20:29:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5800710E0FF;
	Tue, 20 Feb 2024 20:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cQYCl/8d";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FBD10E0FF
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 20:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKMg2/jXLSYGh3a4b24xjfLVZBZaNc13uPpTlXBSxZO1RjDL60lhDyT69ji0krt77Q5l4hyXiiVg688p7Td6ASfVnvAokI8cLMM3CXUUhUKk5nbhYN4zA4bNnPp+DeN680P49hT/YBgFyzhfteIFZ55QGWZ6Qj0bwrA/PSCV5yQRVOGmrlWkbfnvuu49B8SNq4WH9BcuAZ2EFFYoeJ3VGKumvVKH9rqKZAIYwm2CcSYxQPkV93QH2uPVRkWD2876VcQrEtp5WItNd9RuAZ7yqb9gbD17JpQHkpU/1fNahmxP8piS1dE2wvynHn50bKv1EO/32LAO7pwyNRqxDNtuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOjyeF0r8vC5WUEhp05yMwznWlbbrJqC5wYhQI8R/Jg=;
 b=eLewF82awV08rRMMfDpztwL0qbGagJ+gEW3c/d28KfnApX1uGEmBwWaUThxqTvjuVQ1EJSpe0eE7+4DeOwV993ypnrOIFJxmQmAU6JqY2iMLVhWXx4NRw5UnBxhDOXUfD4kjniQYetcvOZxMNNoDPfHQwiwHyCHbu2BwXhvvqKQP4ULk25++T0PKjczg74XQ/BRxngm0IGA7yOa1UanXeG7o8wwt3+CVKyEUPpyBkmD5lh/O1DpXb+EPRNvf1tGdZneQe0+0I/fkyJl5HGMWWJ3Ee4jyyUQwrdtDADG3bn6CHaGmCdWpzRayWc1Un1Zw6gE3lJyOxDVq91omyMk2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOjyeF0r8vC5WUEhp05yMwznWlbbrJqC5wYhQI8R/Jg=;
 b=cQYCl/8dsyHqxlmaJucZasrDKoh7EF1RoASprK+TFeQ77ei13GUpXTcHjacoTm2seInq1ePioBFPeBQ+Fu9IwhAJsf84K8/GqB7A1Keu6I3tCksdTBWIcXhqlVWpfKoFRgAIDsPZiUqA9uO4fEPKeL81kvNLRcxV4kflDQsuS2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 20:28:59 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::6c3b:75a3:6af2:8bf4%5]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 20:28:59 +0000
Message-ID: <0877b15b-733a-4f3d-b5c5-2eec991006ff@amd.com>
Date: Tue, 20 Feb 2024 15:28:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 00/22] IGT tests for the KMS Color Pipeline API
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Uma Shankar <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Sasha McIntosh <sashamcintosh@google.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0301.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::10) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4918:EE_
X-MS-Office365-Filtering-Correlation-Id: afd953a0-08a9-42e2-bced-08dc32529182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fl5lyLTN8+G86DnBaCTGNAhR4/sG0oerYLVVL/tL4iEXGj/XW48E5iJDtLUpR0UzKCqZIdUmRjp+J+q2O48CRzvxabwSJr4UtUqUgqKDyiSfIbL6Y9rN5h5Tj0YVMdV5/KUnHo8GUQqtTSjrDxMWrCb5olgJUm5/5sMVxTZ7jHyI6IdiLNJDv8VuQyPB75RICbLuWtVSr91UzmBCrGOerK/cGeydgtZ0qDRDM6ZmZgOwGwjR+YuPjJaVVKvdKW75cmDQ5qQ+9HotjwkXabycLRxascWqIYKrFp3p0vRnlf50h2OQVBkeAvEks0hcoUeGbuE35m0Xd07mP5rIJ9ZHj0ynVGlfFUE3RY2R1ynJ6oK1osKEqk//sOg3kPYK1S0HBd5/tMs67GUaMXCd7HvRSeuAULLLpCPHdwLAfJO6N5aHRSqZMjvY4kOzms8niDcc9/23LJM+JhCjVKCG9U1HnjAEUC+5VxVUMHlLrIDNAPcVX1FmUegvu7tvpWJJKRJdQQJtMiuaDkVIpaZu1M8qFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21MRjJjbTlBQ0F1ZkhrV3NBTnBrd25Fd1B0QjNrS29RNjBxSXlURVJZR3da?=
 =?utf-8?B?OU5vNVc5V2gxNDhjWHpQVyt2clN5QWU2MExMVWRCVGcrdkVNQUIzUU43U1g2?=
 =?utf-8?B?dEhtNFNVS3hweTdodmpmZCtiZWhCUzJZNDBhckthdncyeWxmVnEyWlMvV1c3?=
 =?utf-8?B?TGxaNVdJNzI5Slc1ZjBtSVFwQU9KZ1NYZGJ3VzdkOUpuWjd5TWIvaVhNdjFD?=
 =?utf-8?B?c3R0Ukd3QVhaSHNRYS9SYmg5SHFpcUxIa3VuWmRUYXh6b2hCeFpqMFlJT3Yy?=
 =?utf-8?B?WTZIOVVvcnJESmh6S29wSVZQRlp1Rnl1eXFDcVdKdEhKU1ZZaTJnT2oyd0tx?=
 =?utf-8?B?VjNYRXptK1ZCSnNDUkZiZERWWHl1NUhudS95WG9tV0E1cjRjbWZ6MjlNTEZU?=
 =?utf-8?B?SGJpWnJxMEtqYk1aQ1pFT2g2ckpaWktSSi9wcG8ydWdCVWFDZW5VZWh6dC8z?=
 =?utf-8?B?cHUrY1YxOHdsTklnVHNtZU5hdlFlZ1FUWkREbW04RXdMdDF5dDkxc1MyeWlr?=
 =?utf-8?B?M1RSN1BQVXJQSk1kSWl4TytJV1lpSjBBOWJxNjVvVFRUdHdmajRwczNTNklK?=
 =?utf-8?B?cDdsWkk3Y2U5MXdadzIwY2pPWkFseDA1NDNBOGUwMzZCSFVvYVd2bmdKUFY0?=
 =?utf-8?B?d0c3QVN5ZHh2bUxncUJUMlI2SlVxby9ndVVRamM4SmpjS1MvRmZZaDBYT2hK?=
 =?utf-8?B?YlpjTGNwaHh1OWhxRlUrOEpOV2tFT1FhSnJXQVB0QVJ1RDNsU01tRzRxdHo5?=
 =?utf-8?B?ek9qNWtHQlJSTWxpVUN0ZVBBeGlUQ2txUXV2blBBbC9FU25VME5KYm9DcVpr?=
 =?utf-8?B?SU8xdlZld0VIbU5kS1lzMjFTRURlTkpLY2dGWE1hVXhBei93Ri9Mb3dVNk1C?=
 =?utf-8?B?aHdiY21qZ211Q2Z5aXRrclFkZ0Nyc29memVYZFcwb0xrNFRrMjNjMXNLUEhL?=
 =?utf-8?B?a1hmYjh0RVNSbEdWVmViWnQ2RHBIWjJ3NUl1L1hFUjQwWk9KUVF3WUlTSDZu?=
 =?utf-8?B?eHA2Q1VQTHNiRzVKYjZIYmE4VUJQdkwrVVoraGxnWkZHVnYwZmJXd2FyMEpv?=
 =?utf-8?B?bzdNMHZrZ2ZMU1JTVE5sWHEzampQdHZPL2Y3NWVoVncxV09TYjdLK1k4RE94?=
 =?utf-8?B?d21RZ21hS285SzBhMUV4L2I3elZQWUVaVEh3QUJRdmJWUEZ2Q2xZZXRnbks3?=
 =?utf-8?B?bHU2RVpXSytoOTZiODFVREh2a1pJNTl5S2JFbFVmQStVM2hWSVM3WG1rYXNl?=
 =?utf-8?B?amY4OUF0bnFLeTdONEsvN1hJZXY2bXlseE5WMXcwdnpjK0pQUjcrc3k2SjlD?=
 =?utf-8?B?YlFwSDcwNTIwa2grRkM5WHIvbDhvQ0RhUHA2WDFUOVFrNHU1Tktqb3pwTy94?=
 =?utf-8?B?SHFQd2FyUDV6U1ZtZk82VWU1VWJ6YnRXUjJWSW5aZ2FLWDgvUXV5RjdwNCtt?=
 =?utf-8?B?ZzFUSTF3RTA5eGJXQnhVekJ4SW0yWGxOZXVDSVhkUURVKzlnQU5lZWtENmJm?=
 =?utf-8?B?TzJYemNtc2F1MzJQMDB4ajdVanc4M2NzSEg2d0lxWkxsWlM2a0JIbzN2dE5k?=
 =?utf-8?B?UG1RZGlNZnFINnh2Y1JzUGFEM2NNQ21vVHZERTZjcFE4SFloM1d3REkrTG9C?=
 =?utf-8?B?dkwwUEVjZmlTd3UxZXAwcHJHdU4vL2IzakhiQkgvSUNEc0w3WHZ0OWlZcHVa?=
 =?utf-8?B?MEZFd0MxLy9jZUhBMzEwdi9adVRvYlJSUWQwODdQUTI0T1ZtbGZQMzJyN0lJ?=
 =?utf-8?B?TXpYbm15Y3VqMGVwemlTd2ZoWGhTYnJ4N2s1eEhxNkZKUDV4anJlVEYrQjVL?=
 =?utf-8?B?aThrR2drWWlpQUNNMWIrSitVSld0WTlOV0tYdCtCM1lndzg5RWdHalpZcUQz?=
 =?utf-8?B?ZjROMit0UmNpZjNEbUpRT3pRUlRFU3NNb3d1djUvR2MraUgrOHV2cXNZZ2Ux?=
 =?utf-8?B?ZU1ETmc3YzluYVVlVlFHQWJnWVdFa2NZbFFHNHlvM1pGWElOWmdoblJQMUZu?=
 =?utf-8?B?bGJ4SWxqWmNaZ0REQlBWWDVjSTN3SHZwYUJ0SmZOakErdmlsOGRoNmdJblg4?=
 =?utf-8?B?eWRIeW9CUEoweHZlK1ZCbUVhd0xKTVFiaG9rcFVSSmhIRi9uWE04ZXJNQXdo?=
 =?utf-8?Q?tKoO1O/BJY2K0LMVjlqVoQ4RG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd953a0-08a9-42e2-bced-08dc32529182
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 20:28:59.3930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBA1GnT85HVsRaWB9aQxhB7r8Ht2bxH31oRDPzgGPwg2MwQ8cDi3Eo/mCE7OhYZtGfA3jtMYvbUK9u1mjiAJ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4918
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



On 2024-02-14 01:39, Bhanuprakash Modem wrote:
> This series introduces support for
> * drm_colorop DRM objects
> * COLOR_PIPELINE plane property
> 
> Kernel changes:
> https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5
> 
> It also adds a new kms_colorop test case that tests the color pipeline
> API. The tests are designed to be easily extensible with a "transform"
> and "compare" function pointer for each test. The "transform" function
> performs the transformations under test via SW routines. The "compare"
> function compares the DRM/KMS result (via a writeback connector) with
> the result derived via the SW "transform".
> 
> There are three tests for LUTs:
>  - plane-srgb_eotf: pre-blending sRGB EOTF
>  - plane-srgb_inv_eotf: pre-blending sRGB Inverse EOTF
>  - plane-srgb_eotf-srgb_inv_eotf: pre-blending sRGB EOTF,
>    followed by its inverse
> 
> And a number of tests for matrices.
> 
> v3:
>  - Remove need for IOCTLs and libdrm changes
>  - Test colorop properties with both atomic and legacy code paths
>  - move enum drm_colorop_type to drm_mode.h
>  - Add descriptions for public functions in lib (Kamil)
>  - Use SPDX style license identifier (Kamil)
>  - Replace Skia license comment with copyright note in file header
>  - Fix kms_colorop subtests if applicable color pipeline not found
> 
> v4: (Bhanu)
>  - Though v3 required some cleanup, I am not touching it, instead fix any issue
>    as new patch (we may need to squash those patches)
>  - Rebase v3
>  - Move few helpers to common place (kms_color_helper) to reuse by multiple tests
>  - New helpers to cleanup the colorop props.
>  - Helpers to support custom 1D LUT & CTM 3x3
>  - New subtests to validate Intel plane color pipeline, please find the
>    KMD changes: https://patchwork.freedesktop.org/series/129812/
> 

Hmm, looks like we went in slightly different directions. We'll need
to figure out how we'll deal with the 1D_LUT type. For us it looks like
a copy of the current drm_crtc LUTs. We might want two different LUT
types, a generic one, and a PWL_LUT for what you and Uma are defining.

I'll send out my v5 as-is, without attempting to rebase on top of your
patches, since that will be a larger challenge than I though. Will look
at how to merge them afterwards.

Harry

> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> 
> Bhanuprakash Modem (10):
>   tests/kms_properties: Fix compilation errors
>   lib/igt_kms: Destroy colorops on exit
>   lib/colorops: Move few helpers to common place to reuse
>   drm-uapi: Add 3x3 CTM
>   drm-uapi: Add custom 1D LUT
>   lib/igt_color: Add support for 3x3 matrices
>   lib/colorops: Add support for Custom 1D LUT
>   lib/igt_kms: Increase the colorops count
>   tests/kms_color_helper: Add helpers to clear colorops data
>   tests/kms_color: Add plane color pipeline tests for Intel hardware
> 
> Harry Wentland (12):
>   lib/drmtest: Add is_vkms_device()
>   lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>   include/drm-uapi: Add COLOROP object
>   lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
>   tests/kms_properties: Add colorop properties test
>   igt/color: Add SW color transform functionality
>   lib/igt_fb: Add copy_fb function
>   tests/kms_colorop: Add kms_colorop tests
>   drm-uapi: Add 3x4 CTM
>   lib/igt_kms: Add support for DATA colorop property
>   lib/igt_color: Add support for 3x4 matrices
>   tests/kms_colorop: Add 3x4 CTM tests
> 
>  include/drm-uapi/drm.h      |  15 ++
>  include/drm-uapi/drm_mode.h |  52 +++++
>  lib/drmtest.c               |   5 +
>  lib/drmtest.h               |   1 +
>  lib/igt_color.c             | 361 +++++++++++++++++++++++++++++
>  lib/igt_color.h             |  81 +++++++
>  lib/igt_fb.c                |  40 +++-
>  lib/igt_fb.h                |   3 +
>  lib/igt_kms.c               | 312 ++++++++++++++++++++++++-
>  lib/igt_kms.h               |  97 +++++++-
>  lib/meson.build             |   1 +
>  tests/kms_color.c           | 273 +++++++++++++++++++++-
>  tests/kms_color_helper.c    | 313 ++++++++++++++++++++++++++
>  tests/kms_color_helper.h    |  91 ++++++++
>  tests/kms_colorop.c         | 438 ++++++++++++++++++++++++++++++++++++
>  tests/kms_properties.c      |  72 ++++++
>  tests/meson.build           |   2 +
>  17 files changed, 2140 insertions(+), 17 deletions(-)
>  create mode 100644 lib/igt_color.c
>  create mode 100644 lib/igt_color.h
>  create mode 100644 tests/kms_colorop.c
> 
> --
> 2.43.0
> 

