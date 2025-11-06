Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB7ACCF9F8
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 10:05:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5097110E872;
	Thu,  6 Nov 2025 10:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBK+KB/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19F310E86D;
 Thu,  6 Nov 2025 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762423531; x=1793959531;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=Ik7PUy2KAJh2iWb8VLlQhW+Sgx6jthwTIK6oOsrxE+M=;
 b=MBK+KB/WfQwr3oTNZrnd/V3P/+4Ki5C+VpIpWH7GW5+8LzaPDLBOqO+B
 CmeQ998JczETY7m2c3iZMqb7dCe15YQNrJ6erYcdZOY0EsCk/dTuWbSO2
 gvpMpw5VlwZ1y2YAto7rtMc52BI2zpfjlG8hGklBwLyhTpg/LL0hJy70y
 pm3WDdtXyG+YLTV/W4yKbM5niOphodYuHaAdlHklZH2WpiYDlqCQubvsd
 6WqChZPrK0M2Op7SW/66fnz2ZeHvYGlC2dT6SkcDcB8g8lOIVWqZYiZpV
 9qDyBxPsTZRKSA0H8ntkRs8FfkvZfHMIrFa6fR11fW9u5gc3ghoNqTFL7 Q==;
X-CSE-ConnectionGUID: h65uSUT3Q1azbKXXSFalgA==
X-CSE-MsgGUID: E8BrlsYbSU6ZOvbDnWQx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64463532"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="64463532"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:05:30 -0800
X-CSE-ConnectionGUID: rN4WzV51TpqEGSjrQ8eHkA==
X-CSE-MsgGUID: BvNcI0C5R9CkNg0r8Lw6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
 d="scan'208,217";a="187006719"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 02:05:30 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:05:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 02:05:30 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 02:05:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HibbGJpb69ZN+8PVPjslVV6herA1A/B0TLcJnjEdKFEZjZdzY0LWXMM+zX9c1JNeMTxzpPlaQX020nIjZH2h4eYTsK1SNYqBIghZhfjGMry9S+gQnMBSVZ0Xcp6kc3xZ6jK85GraGlhVNrSEK9aa4o6pdnzPn4S73PXgudtRX2qa6y2/jefm7Snrn9i0HTNA7IlgSZJBMPozC1FRSUhJrKi5edjiglNJtDuPLyc0CdA0WcfVDpw8jVStUiJBSNQeaDGI+X/UqD8H7fEcxfPEn0fvDvqN7RnbjZsIoApEnuC3lWIjYao3QiynF/yfY4C1Mv1iydzLR0XHO2lLjdEjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TDihFX/MraQbxMNJJag/bl4kIkgi1gR8gYHkkI41A8=;
 b=G0HV//a6ctutfOz+XEA+xffGlp/M5gMf0kjAr0bkyYPcbHZQ2WDZlGSnMTtySh9QWBBbKqVyuFb6DL3qRhZozXyTmxt8OpYLktNcva+06DOaqWzSTatM8OZzN0Hwto2WxFMhXN90PPFqiMH1N7DcJ2OyokWoorukSQwOhYyETNQyQjLaH2EX/nBEdhnrrrOdvs4HKCnWfWw8N9ez9EG0eBpLymMFpfx/jSk7wLlDXEnvgeJzvB1aofhhDjsNRhC+EYOHklQgRElMlC5NGIoLjLplRIgbHBuvlekjJiuMYojsV3sgzFx/iyfeXECk2RYOu6t5sGiNvBCHghb/4uGnaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SJ0PR11MB5136.namprd11.prod.outlook.com (2603:10b6:a03:2d1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 10:05:28 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 10:05:27 +0000
Content-Type: multipart/alternative;
 boundary="------------zXCmbq8vR3DhDhezQJbh0FAJ"
Message-ID: <8d93b054-418c-4503-b361-059f9d1324c1@intel.com>
Date: Thu, 6 Nov 2025 15:35:21 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fsurvivability=3A_Add_xe=5Fsurvivability_test_=28rev12=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20251104095221.694286-4-sk.anirban@intel.com>
 <176231443150.18967.10993927745487233097@10055242dc62>
Content-Language: en-US
CC: <kamil.konieczny@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 <I915-ci-infra@lists.freedesktop.org>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <176231443150.18967.10993927745487233097@10055242dc62>
X-ClientProxiedBy: MA5P287CA0137.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::13) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SJ0PR11MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: a0ac5d9c-6af7-41e2-1bd5-08de1d1c0269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFZ4K3g0WFFaam1ud1hsN0YwQ2NzVUMrdWw0M2ZjQTVhTytCRHNmWmc0VkI0?=
 =?utf-8?B?Ukc3RDdKZk9yKzVpVGVDR2Q3K0FGL3hYNGxMUHdySVYyTVRWOVVNRjg1Rm1y?=
 =?utf-8?B?SjhGTWg3ZllUNk1RYUJKcWVJUmtMVzlQVXFteXBsaFdqNHhsMnRuVXgrT0o5?=
 =?utf-8?B?N0VoODlFUzdWL1d3amZsRG14T3JzVW4ydFFTSHo2QnVTcTB4bFRxdUpyN25n?=
 =?utf-8?B?YjlBMklxZFVIcytONStld0dVVnVZcWNvMDJybWRGdkxRYzVUdXJ4aGpIc2Uw?=
 =?utf-8?B?ZVE3MnhJZXgrVlllOUdNYWU1bTVCNEczSWRkckNNZFlGanZMUjZtVFNZekJT?=
 =?utf-8?B?SmRZSHJUcC9LeWh2WGZPTENFYjhqQ2FrNHd2UldVN1ZIL0tZb2NnellzZkNu?=
 =?utf-8?B?enhEN2VYVDJkaDFRWi9UUEFDY0k2ZFRINlNaeW0zbTdYc0Q5cndzVlpFZGwz?=
 =?utf-8?B?Q2dwd0JzbXh6QmZkT3E5ZVN5U0dHSlQ4bm1rNnlzdU5PdjVKYVFYSjhkaEd1?=
 =?utf-8?B?OEFLb1F3Skw3NUx6U2FRN3pqbDFhRHZ2Sm1HN1RZeFZVK3duNlJVMUtQbC9F?=
 =?utf-8?B?NWt6Vk9NTWIxUTdvTURWTVo4d3dqMUFOV04yekIvREIzZGVkSWlBMTg5U2c1?=
 =?utf-8?B?ODRwaVFySGRNR281RXMzdmVDNFdhSlFMb3Y1OEhmZnI0dm9WWWRkYU1wYmhv?=
 =?utf-8?B?UXJXR0orM1JPR25NWXlyWEJWTUtBay9IQm1QRThkV3RmczFPSTdYYUs1TjdD?=
 =?utf-8?B?ZndTUzhjTmNIUkUxQ2E0cnBGWDZxQkJKSUZJcXVyNVU2Qk9PK1RzbXlOdTM4?=
 =?utf-8?B?Z05lTTFXWXA3aVE5Tnl5WFB3MHp3djloL3I5UXZaemY1S1F3b0d5czVXNzdH?=
 =?utf-8?B?akdZWkhORjYrRjFMTWk5MzVtVFlZeHk4QVNUYjdWbGNKZGxZdjlnQnF2NVpi?=
 =?utf-8?B?OG41SDk4MERuanNzYWdvZHdVL1BpNXFocEFxZitGRkdOdmQ4UnB5eEdSSW1C?=
 =?utf-8?B?Q0tHUXVJNU1oOE9TS1F1dHBNTlR4QlJFVDJBb1l4S3dSQnhQSFUzNnV0QmU4?=
 =?utf-8?B?YnRNRlpJcjExSng4ZXRMMTVzZy9nR3VJbjZMaitiRWpvUEtZTVZsVytBUExs?=
 =?utf-8?B?MVRNZEpmSjIyM3k2Yzl6aGxhRTFVaEZDM2NnUlI5aXcvNkZDdVRVclUrZlV0?=
 =?utf-8?B?NVBTeHBYbi96czl3UnV5Z0NVQVVacDBvWjVYT0ZJSk94aWxETTlGTWd1dUFt?=
 =?utf-8?B?c1R1dmgyZFdxeXNYbzk2TlFrS25vOVd2MkVaVEI4aGhBUnh6a25BVlhFK3py?=
 =?utf-8?B?aWI2S1ZibHVWRldNY0xIQlVjZFhlMUlIbmJXRWRIc0dGTUxqMG0rbDRqTXh3?=
 =?utf-8?B?bWprZ3RRdThmRTh2RTlyS0djbklQNUoyejlrWDhUT3hqVi9UWExzRmZ5bFhi?=
 =?utf-8?B?U0xBMmFuWXpsaFo1TFRFTk5IR1h2eVFHRWMrVlVya1hOR3NrbVBoNVl2M2Vv?=
 =?utf-8?B?aEF3RnA1dGE5N1hua21ZbkdZcDE2VnF1TFNNakU2bVViSXN5SisxRDV6S3BN?=
 =?utf-8?B?Y1hrbWZSdFFPTHNxUUFyU3hQYkxqOXNyRXA0OGtZRlJkR2NZdGl0ekpuSkFK?=
 =?utf-8?B?WUlsRGN5ZWRMUjl5dnFOazNqaFV5RDdDOGdmRFdVTnN2MTBsMnJrdFZTYTlj?=
 =?utf-8?B?TC91VzhCZklNdUhKR254eXljOVRSMVZwMkN5ekQyS2hyaVphUUE2aHI3dE01?=
 =?utf-8?B?K1lkcE85WHlkNlNXNS9ENEJ6WFA1dGZ4S3NPbVBnSEl6Sk9DZEdFdW5VU1lz?=
 =?utf-8?B?VUhkN2V1ajBVOHR5cTFZbzlQdEJ4KzkwTGs3V1ExOEpnSkt6TDlpK0oweWdZ?=
 =?utf-8?B?NEVWRG51SG8wcTMvK1FNOFFySy9JeWVSR2VjS0pwQlJTdmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3lSV0podnVkQTBQYWRBamdnRHFSV1VQUDZ6MnR1YmJESno2ZjlVL0ZoL0FW?=
 =?utf-8?B?WVFJcFpOK1dDTllkN3JIMFZTckwzLzJuNS9QWk43dFhIYmlHOG9vcUxZaUk2?=
 =?utf-8?B?S013RHY3S2hmMXhwNnJrb0YyWjFOZit2eVVpZkpESnFMVXJuTm1HMDZTV1dq?=
 =?utf-8?B?SUZPVnRyb1RQbmt5Rks2UUNIK1RibVZzeWZ4RnBmNithN3oxY0xMWXdlR1Qv?=
 =?utf-8?B?MlhNYlJHc054NmxZN3puclhvbWViOHpNSElDVTE1dkxCOEphVklPL3c4bjYr?=
 =?utf-8?B?WVBTVEIzSXgrbXhLV0h2UmZvLzFvbU03eUV0WVNwbXRpUXBBazJXSUU0M2VK?=
 =?utf-8?B?L1VOMkQwQUFiTGdCKzJiYTZHSEJLUUpPMExMZC9vU1FkQkZjNngxTU5PdHRV?=
 =?utf-8?B?MGM2NkZRb2dMeW1XY1pYaEhxZjcwaHRLTGZzYkp1MnQzZkIvUU5ieEhCVFJj?=
 =?utf-8?B?bVpRbnZWTDNwZFZYWU4zWDF1THpiODkya2FyQndoVUlET3V1V1NrQm1zUElG?=
 =?utf-8?B?L2txYmo2WXJObjJOTTg1N1ZXR2tXaW45QVJINDVSNnZ3ZW5hbDgrYXdzVDJm?=
 =?utf-8?B?QlB5V3BDK1NjSHRjb0pGQXN6dE85RHlWN1JPR3lQc1JFcVozNjc3NVpYVWds?=
 =?utf-8?B?Ull1MjVYanpoQktTQ3VhUVFVYUdNY0pQeWxyZ3cwUTB6WWdYQjZBb2k3MllL?=
 =?utf-8?B?ckIrTW5NTUgrckI2NzlyZ0FzMFVldHVTbS9neWloQyt6dzZpdjM3V0FERm9O?=
 =?utf-8?B?L2tGWDE5ZXlTZGVLTy9pS1VRMERtUHJVNFNSLy8wbFZOWXFFWm5KNHc2a2pl?=
 =?utf-8?B?MVdjTjFlM0dvZEJFRENkZ0FjVGo0dFE2eWZEMDVTM3p1U1ZIZ2VtQ1dRMVhW?=
 =?utf-8?B?VmZIeENITy9MY2FZcE5kVmFiMDg4azhwSHdSOHpMQURMdERaZUVIeW0xNlkw?=
 =?utf-8?B?VFkwQjlySGpuMDV3WXZjNzVWOWxrZGlRSXV3L3hUeDVQdG9BNDNDL3N2bkJu?=
 =?utf-8?B?N1lFVEcyUDdTMXRUelhudVEyV3h4YTZNMGplOU11akpGR0o0Q1FWdUFaUDZG?=
 =?utf-8?B?YVNNbVpPdlhUWUljOC9nZDg5RnkxbE0vTDcreVdTRHRjOTNmeTFtVmVlZFBz?=
 =?utf-8?B?NUFINVlzUnZYc1FvT0FHemZYY0djRzYvcGZ5eTlJWEpNY0JZWWtZbzUrdlJk?=
 =?utf-8?B?czVRRkt2Rm1keFZFTjJrVjJxeE1PUnpDNG5Qc3hnLzNCeVF0L2lQUXE3azlQ?=
 =?utf-8?B?Q1Fua1lFNDg0L3RLSG1BYW41cXBrU24xdXU2azJRTFpIM05NcnVYY2RicXp4?=
 =?utf-8?B?L2h6RWVGQmQzblZDZG9sSzRTd3ZpTHpTZEV0bW4yK291MkhjRVFxMXk2bjFR?=
 =?utf-8?B?cFBzWHo5TGZtYzEzc0IzRlY1TStwTUF2aTRGTWJBYS9YUlpsbGVYNTRvOVdN?=
 =?utf-8?B?eVlpVzEzd25sZ0pLOUxLa3I3MWhZbnZuRDdaekJKUGhkQ0M2YjNiU21udFF0?=
 =?utf-8?B?OVRsOWJLU3FFdk9sNWorQ2FBMmFkZUxHU0dwbVEySkU5bGhXQ0xSeVFSeVow?=
 =?utf-8?B?RXJmQjFKQzlzWTlyZW1vMXUzdDEya2RJNWtyVW1KQ0gxdGRUWDJuRHhFZnNl?=
 =?utf-8?B?SWwwY3dVNUpqaHBwK0lOYnhwME9kYXZ5WUxwdWh0aGNnZlJkZXJ5U1gxN3Rp?=
 =?utf-8?B?Ry9NZE9iT0JweWhucDJDRExHSVdqa3JHNVZqWmVNaFhvKzN3Q0hvZGZ0dlln?=
 =?utf-8?B?Y09zcFBsaXhwYW1MSU1TRmk0aWlKWkhwRm83aTEraWJrYUJ4bzgzWkU4OXlk?=
 =?utf-8?B?U0ZFTmNwb3FRQUZ0ZjhRUm1hQzN5SHduZnFZUk83YzVSVnNGSEkwTDhMenRR?=
 =?utf-8?B?WE83L2NBa3d6ZUZML1FWdHBoSUsrMUN2SE83eEpTWEJCWW9RcEVtQnlGVkNp?=
 =?utf-8?B?RTY2TXM2QkxYNUNNa3BqYm9OV2xsZlVKdHpUR3VxMHp0Q1NTRDlrajBHUjEz?=
 =?utf-8?B?MnYreVd0R3FEd0pBRE9wOE4wVFE3cHhvZGJFOFY1ZUpXZFlVWEI4bFVKbGNw?=
 =?utf-8?B?OVRxMlFMS1NvcnQ1dzBGSnVvNzk2LzArNE54K3gvSHRUSVNQa21FTDBjV0k5?=
 =?utf-8?Q?+6f+xNAwMxkS1UP8wroFkxNA9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ac5d9c-6af7-41e2-1bd5-08de1d1c0269
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:05:27.6947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KZmCgWe2q9nBEj5/6UWzOS+jRNDt3FuBQPKuSBfQkbsQB5M5+JgFxQU4hu0WqLlUV1qRV4s/L2CTknoO8oaJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5136
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

--------------zXCmbq8vR3DhDhezQJbh0FAJ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
These reported failures are not related to my changes.
Please do re-report.

Thanks,
Anirban

On 05-11-2025 09:17, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_survivability: Add xe_survivability test 
> (rev12)
> *URL:* 	https://patchwork.freedesktop.org/series/154342/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html
>
>
>   CI Bug Log - changes from XEIGT_8607_FULL -> XEIGTPW_13987_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13987_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13987_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 3)
>
> Missing (1): shard-adlp
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13987_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaler:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaler.html>
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         +1 other test fail
>  *
>
>     igt@xe_survivability@i2c-functionality (NEW):
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-dg2-466/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-lnl-8/igt@xe_survivability@i2c-functionality.html>
>         +1 other test skip
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8607_FULL and 
> XEIGTPW_13987_FULL:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@xe_survivability@i2c-functionality:
>
>       o Statuses : 1 pass(s) 2 skip(s)
>       o Exec time: [0.0, 0.02] s
>  *
>
>     igt@xe_survivability@runtime-survivability:
>
>       o Statuses : 1 pass(s) 2 skip(s)
>       o Exec time: [0.0, 2.32] s
>
>
>     Known issues
>

--------------zXCmbq8vR3DhDhezQJbh0FAJ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi,<br>
    These reported failures are not related to my changes.<br>
    Please do re-report.<br>
    <br>
    Thanks,<br>
    Anirban<br>
    <br>
    <div class="moz-cite-prefix">On 05-11-2025 09:17, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176231443150.18967.10993927745487233097@10055242dc62">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/xe_survivability: Add xe_survivability test
              (rev12)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/154342/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/154342/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8607_FULL -&gt;
        XEIGTPW_13987_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13987_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13987_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 3)</h2>
      <p>Missing (1): shard-adlp </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13987_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaler.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8607/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@i2c-functionality (NEW):</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-dg2-466/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13987/shard-lnl-8/igt@xe_survivability@i2c-functionality.html" moz-do-not-send="true">SKIP</a> +1 other test skip</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8607_FULL and
        XEIGTPW_13987_FULL:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@xe_survivability@i2c-functionality:</p>
          <ul>
            <li>Statuses : 1 pass(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 0.02] s</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_survivability@runtime-survivability:</p>
          <ul>
            <li>Statuses : 1 pass(s) 2 skip(s)</li>
            <li>Exec time: [0.0, 2.32] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
    <br>
  </body>
</html>

--------------zXCmbq8vR3DhDhezQJbh0FAJ--
