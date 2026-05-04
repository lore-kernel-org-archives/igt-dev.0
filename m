Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217CFFF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 03:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B9710E35D;
	Mon,  4 May 2026 03:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHRRZQhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9474A10E35D
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 03:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777864924; x=1809400924;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HdDWR6D/h5J2BBfAV806D3knsREiXUK2a4TmtJKvRSA=;
 b=hHRRZQhHoE27y/qZGKI9JGLknUdDCx2Rogn0xFt671g8fBlZU+KRWRor
 8hZ4lQr/AmC4fqW8M8hQpdz+qwR4Klmh8qXu7W5oxLdbEc9dLfQUktl1o
 EJoc+Gzj0ySe3rKX/ay5qqjQ3EYlQ3mOU4tBGYSu8Migs6mtizMPzNLt4
 OzPgITcpIOopVGOhwoZkBIpVJ9C9vRJyS9cj73ShxnCB/vzyhuyWAbIx7
 c0d72cSJ/syb29ZS+SRQoZWXObiN52NeDq15Sa9eLHN6cy7dGPhPvuku8
 8KXdCDJ/4gvW0tt3NPxyKyAKnHYUpNhRYKrNNDc1mp3Om6Zj0oVnpRctl g==;
X-CSE-ConnectionGUID: 6d683IGJReWBfmJWCSDP9g==
X-CSE-MsgGUID: 2KtQOL8eTYSLC4uPQ3WSzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96148542"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="96148542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 20:22:04 -0700
X-CSE-ConnectionGUID: At8mjKOmRwmCK7avajiDNQ==
X-CSE-MsgGUID: rfMmuPGrS3S5zLNmxlJiRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; d="scan'208";a="235462504"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2026 20:22:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 20:22:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 3 May 2026 20:22:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 3 May 2026 20:22:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bq+a6OcIZZ3iw1Uh17BwIUGPHyMoRld6OlTG6Rig08LWu9BWl+rjELuJDMFhoyBjRgRuexyENOgrRYfHRja6W5ot96VsCiVKJRu3EImLRCzm4YM/7On03BL3xnnBhCBsy5+PFjkOgq0c+MLRBfF5pCVB5Arkql4e9Vnb/mY45ND71943vfwQt7iKLJPtnpfYOimKJBjofOW6PXTvWsP/LbFolXT5OmFvgVhStBQNDvgjvTt2fb0Bs5+nmQDj7WoGfvXxuH5XpLXRCsoJJGIxZ8R08rLSerjn41jftrDuZkZ/MeQWIUxUxgm/XvbgG8DAroN84IDYsLXYDmw6XkmNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRqrqZVfWK+8rYM3fbCm3Kd9zXGvPDh77zh6s7/eKZQ=;
 b=IaxklTCOa9z8AWybYbUIbtZrijLUtprDYhEGhtlc+XG+DLDFFg8d0MnU4AMONVxR5Lc8eM0SewwlHJfdP7H0m4Sa58eMUO9x0omV28R2LEIRaXuhHovAgfIrfzlnJwtXkYMgfLblUv16ahFLKRWxFGf7LjPw7Z6tzpbQ9DYMouvf+SByzp80FvS4/cmoQTHWMZHeRksChtvjq74catwwGrw7izn6lIudmX8FAMgRmDByCTps3/UzClwp32gfbe3Xz5h5OoA3c3e8I/JtMyrrwCG5R5p3Tt2xVRansIZNR311wXAk1FsENtntan1sAZxPqpP/4HCilTWtlJR63Mj0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 03:22:01 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 03:22:00 +0000
Message-ID: <b5a72bb1-f0f8-4407-a9c9-a5b9c13ebe2e@intel.com>
Date: Mon, 4 May 2026 08:51:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] tests/intel/xe_madvise: Add atomic-device
 subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20260423063904.3944005-1-varun.gupta@intel.com>
 <20260423063904.3944005-3-varun.gupta@intel.com>
 <2f50c46d-32b8-4f07-bc53-1598ba43ec46@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <2f50c46d-32b8-4f07-bc53-1598ba43ec46@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|SN7PR11MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: e614451b-bc27-4e3a-7493-08dea98c4e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Z3BIOrDxYxqBdidFvBPXhpT7kaRPWNq9RV72JRumJdDIw0JcUlVYIRuPz7bkvuplAb9wUzWuYf12p/T9VBJECOgyIq1vD2K7473HHab10hBMAghgW6u9uVQRxs8kRq/PsWzs6dIMVWMqlFem5anrbsd3XscEJmHhiu7sZpa8Osux5zdiv+YMPVkJqnDKu6IvQuNPfUvq2j25TloJPMrNJAkiLXgoRIbVYLXItDdv2JVwf/makk7KYpVapVFgcjKKD4mLTb3CbCn/IvEoajkLFvXzpmTXfZeyb/sja6LDj0ON5biFraz7ELDy4dAZBbHW1r3VR6HiRhSPFEAHpUhF5qrCVLau1ebU7hqclqLhJLC5eBBuAVTu4YzopKLk3DK9wFPhtjREI8bWRTEPgL0OsWdm2DaT+O5wJHylSlssfAvjtT//lSMovdtEe63a5dcRngzKjeF/uudf8zyVzH0y9yhfpCgSbdRt1QfqQxf9SS9TmQwO2ND/4T+qeLAXm3NldTn5y7VTTOE2zNrwKMAUuBLeHrHDpZPQ08lo5fbQeZcMN8Z2DBI8Dd9WtrkcmkMjat9urPi51SdS9utLr6icdHhcVndhBscplF12nuZbPnz0ls/OU6TQMU7XExymvS8JpS7V7tXPZL4XXkuId3WCB21Ls1VNr2nUGx+v7jYUgfbcz8KTmmaRHLRcj74NzbBg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2o2WnNZbC9VV0pJdjM2eHo5V0hGeDE3WStCeTQvbXRlSjYzMHdJT0pCZFFS?=
 =?utf-8?B?TERRQk9ZbzZhbldyNHo4Y2FlZzNrY0x1QWx5V0ZFaE8xWG4zNTFrNWpOQVRn?=
 =?utf-8?B?ZjF3aDhGQTcyWFVXM05Zeko1NVNXRkw4SjFnNUJJZnZjUDAxNnVORlFjTi84?=
 =?utf-8?B?S1pwSzRaeVhZcHpsdFRWRTIvV3hQaGtsSkVEU2ZOZHRwYmN3WG12b3gzWkF2?=
 =?utf-8?B?dUtZekxWV2tvMWRqSlBBVVE1SmtVVk1kcEN2eVNiQ2tnWTk5OTZrR2hTRXpE?=
 =?utf-8?B?dFluM1lFbkF5YTEramN4OU5qckpwcDA1MXV5bG05WUJzRm4wRVEvQlhhbm53?=
 =?utf-8?B?Z3pISXpPbmZvZDg3ZnZVNzF4RTdYajdLYy9abk5UWjkvK252T2FyUXpIMUhU?=
 =?utf-8?B?OEd4VGl2eU45dER5M1B1dWlmejFUMTJsSUxmeDcyV2g5NlEzQitHRFo3b1Bm?=
 =?utf-8?B?Y1I3YVJZdzJPMWYvN0xTSkt1MnA0ZVdLek9RQkQ5VllSbXdHaVFjVjl1c1Fz?=
 =?utf-8?B?cjhVQmV1TDFlemJtSWs3UWYwOXBBNW43b1ZoRnFwYUNSZStWRTkwV0lpS3ZV?=
 =?utf-8?B?eGx3bFpoM3hlM1kxQWdQWnlzbm1FbHdFUVlrTklqWVpaMG55KzV1MlNKQzZM?=
 =?utf-8?B?NEtVajN1UUZqVGZpRFZoaFMxRU5kcjNURkVzV2ZyRmhIUStINjZocXJOVVNF?=
 =?utf-8?B?Q3E4UE5Hcmk4UVNKNDlOc0ppb0F1TEs2NjdlQzNFOERUV21tNkdjUDZvV2V2?=
 =?utf-8?B?eUg1dWErR2Z2NjBQTEI3T1RlMW1jY2tKbEh3UGpnS0RqSG5sQzB4cnRRVUl0?=
 =?utf-8?B?cHNQRmZna0N5NU5COGxpdlBNSno2cVFhMFhLeU5FUWg5cnJ1RTB3MS9IemJ6?=
 =?utf-8?B?ZVd2N2FMdjBHeUNnVFhzM0RBNXgrNUpIRUFQUk1tVjNQMlhzcW9PaGVqNndY?=
 =?utf-8?B?MU8wUlNVMThaTFE2a0dsQlNvMEZOREpXNTJVYm9lcGRsd0ZJZkorUkk3TGpk?=
 =?utf-8?B?TjIvV3A4ZEw4RXRBeFFFTi9Fclc0VTMxYStGdlFLMmY0cENOeHdubjNNRlB2?=
 =?utf-8?B?cmVHQjg2a0h0SG5FL3V3bElRN2dTRXAvTEFnQnpFRzVJWFQxTFpDdzY3M0Fs?=
 =?utf-8?B?YjVnVS9sTVRLWE5VUnRSaUpvQmcvZ25QRjJaSjB4ckF3VGVTTDN5R0t0UlZS?=
 =?utf-8?B?aDVnZnJaTTU5NTd6dTdXeURjcllocTNmL0p4ZmZLYyt2dEFOcTBFOXE1Vmsr?=
 =?utf-8?B?Z0dzSzg0ZWZla3N4blRNekx0REtBQUVtc0JabDI0TitzdXM0YjFaZlZMK2F4?=
 =?utf-8?B?cXc2Qnp6MEpnSUlUNS9HWlltVlkwd3R4Ri92SWZlaDc1QnM5UFk1MlVvbFor?=
 =?utf-8?B?K0ZZa08xbThUQ1ppbzBMVHZNNWl6VzVacHc5d1V6cGVaSk1Qa3pIdDRyUmlS?=
 =?utf-8?B?dms5SHVEMVRaVEtMMDFBWkhNMVJuUFhwcXBOWFVMZWpEYmhFT1lCWFlyNjl2?=
 =?utf-8?B?N2FMZys5YjIwYzVEaUFoQXVhMnB3a3AwRmRYcWJXWmlocURvME4zR3ZMZGN0?=
 =?utf-8?B?bzZSTkRtMC9pbmVITXRSWnp1QkNVRWorRk5rK1R0c0ZCUFVXdTREWFRXTXBR?=
 =?utf-8?B?Szd4Z3VnYzRzaDdBSGZrZ2lBT3BEUXJkRmZqdDlwYms3TkUyckxuejVCRVV1?=
 =?utf-8?B?ZXdGdFMvVGNETThld1pGeUc5YzE2U0lDU2M3Zk1pYWk3YmpTdTBVTFUyTWRX?=
 =?utf-8?B?Qm1jTVZjMG9KREZrc2hFMTFLcHJnS1ZEaENub0w5NDB3Y1BOSkdpN2NmVmtR?=
 =?utf-8?B?ajkzQTdDdFZIS2RsOFlINUhVZjYvMVlJOEc1ZElBdGhadmhnZUJXSmJCSWZw?=
 =?utf-8?B?ZEo4SG1uMFpOL21KUmUrazJ3MCtZQVBiUGpicHBaT2M5TkpwOUdZUTR0bWpK?=
 =?utf-8?B?TFdKVm9sVG1Gb0xKZGxTWUNLZzJkSVRrbCtma1M5RXlPd2NRMG81VUVoS01a?=
 =?utf-8?B?QW0xb0JrQ0J6bmh6aTJ4YWt0QzRKdU1xSFBKZWlpWkVvQk1VWis1RGI1R0pC?=
 =?utf-8?B?Q0laZVpiVW1wMkl5cVRWSlJnaUZPaS84TFIwM1djQzR3clFhT1k4RVllRUx2?=
 =?utf-8?B?Q1BoRmFEWUpzNlRWS3JFNURiNWl6ZVJkNzNZVzM5UDk4Q2tMWXFCcEd5L2dj?=
 =?utf-8?B?WHJGaXgrNnRwc05UWHJsUWl6bTh0Y3NXTnM1MkUzem5pYzY3bmcycnZOK290?=
 =?utf-8?B?SUJ4SDZCM1MvVEtpSk1YMmZ0Rks4RTJjTTMxenhBQzRieUFaN2FsdlJ6ejUr?=
 =?utf-8?B?eTN2WTVYcmJLYmVxbGRtek1iNVhuMU11RGpCUVg0cUJyeElBUlVsdz09?=
X-Exchange-RoutingPolicyChecked: SDsZK9tJhPVY7KsutcvisLvRLzDiOudFqWCSGqnz0u0BoAIS03dvFdSmklObT1Ay0lolvNKurkfOESTTa+nAdVWpobwl2j7NepInpCRKQ9R3GXiXsoecd5rCjKQygnVr1VaFXUK0/sBCTPQspYj+Mw6Ooj/FUGB6M4OCs2fTudbuFXyMeZy1cy1g5Cz46PdqMN1bAdUbrQP9rX6FP6xh9B/GGE3zLJXgkqBno9OJm8y6lKmoxYSlEOzHpn74+bk/jAj9dVYBe1HucIRyiLls+4OuP379NrQr5rbiYbhgGJTHidR4/oZS6u+/vU4un2VqjfS30R5bgPtFe/mm43+HfA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e614451b-bc27-4e3a-7493-08dea98c4e0c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 03:22:00.7823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsF/NiLSF3i22fOTQHXPP9pA8QdrXNc4c3BlkuUYgUoqLAFUDWZqym7Q6VKjhMRpMgaLnWXGtGXQT6prc0Pgqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
X-OriginatorOrg: intel.com
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


On 29-Apr-26 2:41 PM, Sharma, Nishit wrote:
>
> On 4/23/2026 12:08 PM, Varun Gupta wrote:
>> Validate that madvise ATOMIC_DEVICE allows GPU MI_ATOMIC_INC on SVM
>> memory.  The test creates a fault-mode VM with CPU_ADDR_MIRROR binding
>> over heap memory allocated via aligned_alloc().  After setting
>> ATOMIC_DEVICE via DRM_XE_MEM_RANGE_ATTR_ATOMIC madvise, the GPU
>> executes MI_ATOMIC_INC through the page-fault handler which migrates
>> pages to VRAM for device atomics.
>>
>> Also adds the shared atomic test infrastructure: struct
>> atomic_data, atomic_build_batch() helper, timeout constants, and the
>> atomic subtest group gated on VRAM and fault-mode support.
>>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 110 ++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 109 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
>> index e79cafbff..1f4fb16b9 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -14,9 +14,11 @@
>>   #include "igt.h"
>>   #include "xe_drm.h"
>>   +#include "intel_gpu_commands.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>>   #include "xe/xe_ioctl.h"
>>   #include "xe/xe_query.h"
>> -#include "lib/igt_syncobj.h"
>>     /* Purgeable test constants */
>>   #define PURGEABLE_ADDR        0x1a0000
>> @@ -27,6 +29,11 @@
>>   #define PURGEABLE_TEST_PATTERN    0xc0ffee
>>   #define PURGEABLE_DEAD_PATTERN    0xdead
>>   +/* Atomic test constants */
>> +#define USER_FENCE_VALUE    0xdeadbeefdeadbeefull
>> +#define FIVE_SEC        (5LL * NSEC_PER_SEC)
>> +#define QUARTER_SEC        (NSEC_PER_SEC / 4)
>> +
>>   static bool xe_has_purgeable_support(int fd)
>>   {
>>       struct drm_xe_query_config *config = xe_config(fd);
>> @@ -768,6 +775,96 @@ out:
>>           igt_skip("Unable to induce purge on this platform/config");
>>   }
>>   +/*
>> + * Atomic madvise subtests — validate DRM_XE_MEM_RANGE_ATTR_ATOMIC
>> + * modes (DEVICE, GLOBAL, CPU) on fault-mode SVM VMAs.
>> + */
>> +
>> +struct atomic_data {
>> +    uint32_t batch[32];
>> +    uint64_t vm_sync;
>> +    uint64_t exec_sync;
>> +    uint32_t data;
>> +};
>> +
>> +static void atomic_build_batch(struct atomic_data *d, uint64_t 
>> gpu_addr)
>> +{
>> +    uint64_t data_offset = (char *)&d->data - (char *)d;
>> +    uint64_t sdi_addr = gpu_addr + data_offset;
>> +    int b = 0;
>> +
>> +    d->batch[b++] = MI_ATOMIC | MI_ATOMIC_INC;
>> +    d->batch[b++] = sdi_addr;
>> +    d->batch[b++] = sdi_addr >> 32;
>> +    d->batch[b++] = MI_BATCH_BUFFER_END;
>> +    igt_assert(b <= ARRAY_SIZE(d->batch));
>> +}
>> +
>> +/**
>> + * SUBTEST: atomic-device
>> + * Description: madvise atomic device supports only GPU atomic 
>> operations,
>> + *        test executes GPU MI_ATOMIC_INC on SVM memory via fault 
>> handler
>> + * Test category: functionality test
>> + */
>> +static void test_atomic_device(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>> +{
>> +    struct drm_xe_sync sync[1] = {
>> +        { .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +          .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +          .timeline_value = USER_FENCE_VALUE },
>> +    };
>> +    struct drm_xe_exec exec = {
>> +        .num_batch_buffer = 1,
>> +        .num_syncs = 1,
>> +        .syncs = to_user_pointer(sync),
>> +    };
>> +    struct atomic_data *data;
>> +    uint32_t vm, exec_queue;
>> +    uint64_t addr;
>> +    size_t bo_size;
>> +    int va_bits;
>> +
>> +    va_bits = xe_va_bits(fd);
>> +    vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +              DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +
>> +    bo_size = xe_bb_size(fd, sizeof(*data));
>> +    data = aligned_alloc(bo_size, bo_size);
>> +    igt_assert(data);
>> +    memset(data, 0, bo_size);
>> +
>> +    addr = to_user_pointer(data);
>> +
>> +    /* Bind entire VA space as CPU_ADDR_MIRROR */
>> +    sync[0].addr = to_user_pointer(&data->vm_sync);
>> +    __xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << va_bits,
>> +                DRM_XE_VM_BIND_OP_MAP,
>> +                DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
>> +                sync, 1, 0, 0);
> Cleanup/unmapping of VA for given VM should be done in last


Noted,will do in v2.

>> +    xe_wait_ufence(fd, &data->vm_sync, USER_FENCE_VALUE, 0, FIVE_SEC);
>> +    data->vm_sync = 0;
>> +
>> +    xe_vm_madvise(fd, vm, addr, bo_size, 0,
>> +              DRM_XE_MEM_RANGE_ATTR_ATOMIC, DRM_XE_ATOMIC_DEVICE, 0, 
>> 0);
>> +
>> +    atomic_build_batch(data, addr);
>> +
>> +    exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>> +    exec.exec_queue_id = exec_queue;
>> +    exec.address = addr + ((char *)&data->batch - (char *)data);
>> +
>> +    sync[0].addr = to_user_pointer(&data->exec_sync);
>> +    xe_exec(fd, &exec);
> As mentioned INC operation happens with GPU fault, we can check if GPU 
> PF generated before and after of execution


There is no point in asserting on PF value since it is not 100% reliable.
Saying that, we can add just a print but that might not be useful in 
this test case.
if you still insist i can add the print.

Thanks!

>> +    xe_wait_ufence(fd, &data->exec_sync, USER_FENCE_VALUE,
>> +               exec_queue, FIVE_SEC);
>> +
>> +    igt_assert_eq(data->data, 1);
>> +
>> +    xe_exec_queue_destroy(fd, exec_queue);
>> +    free(data);
>> +    xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -826,6 +923,17 @@ int igt_main()
>>               }
>>       }
>>   +    igt_subtest_group() {
>> +        igt_fixture() {
>> +            igt_require(xe_has_vram(fd));
>> +            igt_require(!xe_supports_faults(fd));
>> +        }
>> +
>> +        igt_subtest("atomic-device")
>> +            xe_for_each_engine(fd, hwe)
>> +                test_atomic_device(fd, hwe);
>> +    }
>> +
>>       igt_fixture() {
>>           xe_device_put(fd);
>>           drm_close_driver(fd);
