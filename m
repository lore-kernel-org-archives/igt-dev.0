Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B29AE6748D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 11:32:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC35110E276;
	Mon, 22 Dec 2025 11:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHNtamyW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC8010E276
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 11:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766403154; x=1797939154;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qlLoCkhzGeAIXopvqIGfGLlOMgFEJR6P08x5Z0P+CyA=;
 b=lHNtamyW5+zmzw1tlwr1qUNqLAW40pQYIdckXZkeDvXIX+VkLhxEJaTI
 FXtsLq1HM+jPin6qEo3Id4IJesIEO0jhaSAIF85QyemC738F1xMCG2Jdo
 0UlrB9xXqAfUMlpROf1ZkqkU2oJp2hBkgvOCDoTNZcN+y5Eud21qbWHhG
 OrGFc02Mfi0/gw3Y5+O9Ns69ehKMac0VI+cx2kqbfP8ruFdCBjVC4qtKv
 L11Bo/C8SNmILzd0e079L3T1hcVESQE5tKzfgS7HUasaBSa1OWFKPMyFV
 hHqW1Xuos99Afk0BgVKNnS8jqRAtxpxQdXTZz4vsraUW5NY++sZVrdifh Q==;
X-CSE-ConnectionGUID: mXiPSQ1DQWmHH2sIY6lmFg==
X-CSE-MsgGUID: 3G7XIfQbSfGkANyajex6Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="79619025"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="79619025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 03:32:33 -0800
X-CSE-ConnectionGUID: ujGPnnz1RzeKXfdxQCYaKQ==
X-CSE-MsgGUID: Qg5r1XJgRy+xGRCkp8wcBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="199259035"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 03:32:32 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 03:32:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 03:32:31 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 03:32:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmqMinQN4bEfrRN9ew+yxo/IcWMsDgHlaC5s7Vnl8iFBChr7b/pY1eYHEm+a8SztCvQ8Mj+d5ssFGyRUxpGYYTS/2klpm+cBeOmX69eSmJmD8wdwG1j0EOP40Fsa57RNUwflNBSxsgrz4Af5VdHTs5TeMfGVIvE49BB6zZHrm0uRaqhoZnFtM1t3g5lKz6nVXEBPPFFOfbbQJ08lz/8P7hAmluEqyrjx8ZEQz3ccHwypUAhcIh+TxcZGOYGbsFyu3eYLYh+aNqItMSUvAoREibPhh1MwCiWsltTZM6e304AAqM+i3Ep/RYiErmhcL2v4fKifL0Rsj0ZBIwqYtyU0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uWcpQpRc8Yi2OldGkHGsZgFO4F8YU/ubPECa8Q1m8E=;
 b=mWNQl5E1yPdlr21TEFig/9AGz59a0sLg+0e6Bwvmdn1FPnt5+NnXUfp6jCUb8qkGhBZoPJxnh25/mJZCOAjrrcIeMAyk4gJU6Z7TFcDfKInrV5C3dCr6TfDd8LPSeRT+M7TVT2l4tq2cv5PEDDD7La3ENK3d3qgfnDsI/eZICWGbWgKrVC93Ku2fbRQ0kwk4MQWYMKHB0a1Cw2EEUckTX1RrEDiNxzf573Xopop3q2D6QjDkhe23NYsgdLih3jj+GIeLciIcd0hNDE+ihwuObeVux1Bts/WGb8VSCwkBMVrkzOMTxwE0wMkvm+zdjAUqfl36fpxviedU4p8INyxbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 11:32:29 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 11:32:28 +0000
Message-ID: <cd9a2269-3549-464e-8975-4b85470aa01b@intel.com>
Date: Mon, 22 Dec 2025 17:02:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v4 2/4] tests/kms_joiner_helper: Add
 igt_is_joiner_supported_by_source()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-3-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250905210816.319104-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad3a6be-2e25-4b22-4253-08de414dc991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGFvMnpYc0xaM2N1Q2pXTllyN2t4alFSbk1zTm9kdzlUaHgreWQ4MmJuenA1?=
 =?utf-8?B?NDdRNlRUQXlnT3RIRnd4emN1Q0d6UVhNN1V3dVIwYUF4bUdZYWNUMUZlamh5?=
 =?utf-8?B?Z3k5emxDUHFDQzZTNGluck0vWTlkQkNBVnJyVmNCYVViR3JSaXJDSzBHUTgz?=
 =?utf-8?B?M0YzRkcrVUJUSWZrWkUwdThud1lSdWV6c2xURitHM3hkd1NxL1NIUmlGTHRP?=
 =?utf-8?B?cFMvQmsxYVdNQlp4MFBSSjI2ZXM1cGNCc0VKUjNwM2JpU2lWZTRpaHpDc2or?=
 =?utf-8?B?eFJtai8yOEJxaFBXb1ZONDcwckh6SDVkZXdDdExSZ2swV0NJL3pBQytKTmU3?=
 =?utf-8?B?aCthby90STYxZGRoUFZ0UlBQR1pUT2hyckhXMHJTNGNtRDFHdjFXaUJNMjAy?=
 =?utf-8?B?V3Rkd3RwcEJrMFpxRlBFRTMrNDc4VW5ULzRVTEdHZzR5ZlNLT0lZdzZ2blFM?=
 =?utf-8?B?RFo0eTBBYVRlZWo4NEZPc1l4VjRPdXdSd3pZM1ZURDdlQ2QzYUVwMmRNSkE1?=
 =?utf-8?B?VGxaOVpuR00vT2VockwwNlhPTitOSSs4ZVN0WG9yWlFIWnU0di8zd29PcllL?=
 =?utf-8?B?cTFmT2luVjBzNzdPdG40cGRWRnU1eENJRzdsM2VIU1VCdE9kazllcUdMTWZM?=
 =?utf-8?B?eUdGZnlpKzNUN0FSeXU5b2JlczZyR0pNeTdwY1FlWnp6ZVZDZXNwditMZjhI?=
 =?utf-8?B?RDRjV3BhdHEzSHhWOEpIbEc3QkJReDFoTUNtMllPb2pxNUg1VXhYMi9nRTJV?=
 =?utf-8?B?WmxRR25yMmRDR2lTOCs2T2ZRMVdNNnpnWE41SE5OejAzK2llOHVFd2JSclVM?=
 =?utf-8?B?Q2xRRkFOdjhQVEFSYVF1ZTRSN3ZFZXYrdzNYQ1FiZ0tlb2NkQURjUXRoc3VE?=
 =?utf-8?B?N0R2eUYxUnBVQ2FQQ1NtQm1uZVBWSWw5L0s0RjhveVBXY0gxZFBkWDRpN2Qv?=
 =?utf-8?B?L0s4bTQrcjdhVHdJaE1xcEtPQmlwU3ZDRjVQcTVSSjhzdXNoVXdEakJaZnhG?=
 =?utf-8?B?ekJBeTZYaWx5UTBKVUpiNm9WazdlRVpmcGNRdlpHb09OTHpkdmp6VG5KdnAr?=
 =?utf-8?B?b0ZobjFWZlo4TUFjRzMxb01SNWZOMWE3WGR5WmlmVmRYcXd3SWJnbUtkYzg3?=
 =?utf-8?B?bzhWRXdVa2lMVGZJYm9kWEFTNE1PRzlQM29UL2pRcEZIVkw0L2M2Tk5sLzlV?=
 =?utf-8?B?Uzh5LzluZmczckxsZXBsc0hMWW1GS2J2cFloQjBvYmNndUJMVDVqY2dndU9Y?=
 =?utf-8?B?OW1oUmR2eDFVeWlCQ3dIM3hxMDJ3bTM4aUtraHJDdlBMcmVOdkNWVlIyZWpJ?=
 =?utf-8?B?MlhHTnZSNmxhZm9ySEdsMXcrTmNkSE41MlZtL1h0MElacGZZSG05Qm11dzAy?=
 =?utf-8?B?RVZOaEw3WE5XN2ZUeGRRd2RvMHk1bGtlcy9TOEFXbGJOTXIvM3pWUkR1SkFw?=
 =?utf-8?B?U0NpZTJMZ3ZucURhWGJXcW1EV2ZzOVluOEJERU0ydGJsZ0FsTWNhQjRGTzE1?=
 =?utf-8?B?Qy9MRFBxY212Y0xTNlhVeFRCbHdFV3VHbHBJMjBuK2lYalM2UldSWDMrWkZp?=
 =?utf-8?B?dzVxUkZVRllKSHJaZStmVUxvL3lvb1BWQUZsaFF2WVlVS3UrVGkycHNGakU1?=
 =?utf-8?B?cGNaNGExR21INXM3cU01N1hMRldVUGlONjdxUDBBU0U3QU0zTmdvaURnbHdM?=
 =?utf-8?B?U0plK2NLWkgvTGJJWkN6cThneGw5eVRpRlVGbTVkVmhURnR1WFVDek04Q25L?=
 =?utf-8?B?QWZSWE41K2ozak9lTDd4aWxDRU85a2hUMUhrK2ZROXlWQWJwaURGd3lOUEcv?=
 =?utf-8?B?RnJTdENCWlpyMlVtaXhIQ2pxMnU5VDBjQllvR3J6U2x2ME9LUnRUYUhIa1VL?=
 =?utf-8?B?cHNTUURabDdDNDVRR1dmZmNoUVUxRURZL2krK25oZ2lDZGJ2VVZOdEdMcTZO?=
 =?utf-8?Q?zQFDZ1BNEVG4hVrGC5M0Jsxbw0jnZ72I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWNTUitVKzZFek00bmFlVThSVElNa1J2SEMxcmhLWVRuTlBEQWg5NkEyR3l5?=
 =?utf-8?B?R0JPdXBpK2NseTZTQTlwZTVSRHFwNmNGc0NQVHlwNEdGeUdEc2YreERGaXc2?=
 =?utf-8?B?Rk5Va0tPa1ZiSkZCTXlBczVyR2Q1eWxGMDR0TG1XaThMUmlpTW9Gc3hqdXls?=
 =?utf-8?B?Ty93T0crQklMbnM2RXlmUmJuVFhjUy9ZZUJEZ20vSlZJTktIaVpZdE1VQVVx?=
 =?utf-8?B?MjJjY3ovWDhGWjV3YWdPK1d3K1FHVUhVbnAxTFljV01zWjIwUWxPSC9yQnpB?=
 =?utf-8?B?WGpjNlRNQVNRMjQwaFMzWTBhaTM4NHZ5RFlDbUUyd2k3eVlxU001alNrdk5o?=
 =?utf-8?B?YzVlalZVeVo4akZmTmNCWnR4S3hjb1EyQmR1WGYyODNMaFd5WGhvT2NEQXFK?=
 =?utf-8?B?Rlg2ZmE5TVZJWWJMZHlZbWFtQjRuamxENzhSem9xSHFRaWpISjZZL2hKT2VJ?=
 =?utf-8?B?dGtIUjcyMmt6enlGditwSHgrakRlV3pocUVCb3huWElEdFZIMjZ0MjlBVWtu?=
 =?utf-8?B?clFWYVN2ZWd3YXIvTHVjd3M5aTA5SW1oOUJTZmFxYUZXaDlhMjg5WlpUQVZ0?=
 =?utf-8?B?UEZMK0JSMjZiaDVvUS83bElGM04vaTlmUWJjMW9Fb21mNzd6U2RZYnRGZkRB?=
 =?utf-8?B?LzhGMUhqSUhVTTNMTzIxdVdKS0duRVZ5aytZUXBnUGFtV2I2TVBBZVEwRlcy?=
 =?utf-8?B?eDc0ZkpJdFJaNXJReUt3YlZxTVNPQlhSekUvNCsvMGRhTlowQjVjS2tnd21z?=
 =?utf-8?B?WURmVjgwL3hUK2Z4emRpR3UzdjZUYWNodGR2c0k3UHZDOG90eU1VYlZqamYv?=
 =?utf-8?B?ZTNrOHdGUk82MXVoU0x3QkhndnE0RFgzeXYwbVlMbitieUc4VXFGY3ZWTXJC?=
 =?utf-8?B?UUVZN0pXMVEwK0s0d1FkWW9MTi9Wd1ZyRFRZd3A5enRxYlBDMWVieCt4SlVT?=
 =?utf-8?B?S0wrU3ZqL0FCM05zK3REeTNOK25raXoxRnllWWVwSHN4dnJjdEFpWDg2K29D?=
 =?utf-8?B?eVdPdGJBK2dKelB0a1ZjdlVVRTFaZXZWVU9kTmNONCtaaUtDSnBPQXB6YjdW?=
 =?utf-8?B?WXZYcEEyY0hmaXRNNTdVQzJ5cGY2Qm9rT3c1UTlzckdqVlZMWW10TmxzZDZX?=
 =?utf-8?B?a0VjTGNzS0VuYlYxNTA3SmIzclQyQXpNanJBNVJBVEpHRHQ2YmszOXhrZC9V?=
 =?utf-8?B?R1BpOGNxVlRDVTM0cFhJOUZxLzFLQkNzYXVNYXVheDlBYklSRnpFaExZdnh3?=
 =?utf-8?B?TDZLYk1GUEpabUZOR2JkT1oyVmp2ZTFoWFZOaU5uLy91S2R3QjJTUkJNZEtO?=
 =?utf-8?B?amJDVkFDUW5JUXRWU244RW1CM2FxTU1KbUdqT3NSemlBcWtxM2lWaUY3N00r?=
 =?utf-8?B?ZkZUb2FVUWlvTjBqUElabHBQS3BiQXRXL3E5Uzg1RVRod3U1eXFObmdOa0VQ?=
 =?utf-8?B?aVZLTmk4ei9RRTU5T0VkRkdIYVJzRjZsUWdjUUhxQjVUQ21YcW04UjlpZTFy?=
 =?utf-8?B?cE11S2RzdjM2NnRmVXpMZ2cxRnA1NytXZE1lQk4welFReU9Uc1NLQ2dYbDEy?=
 =?utf-8?B?V2ZIbFdvbjhHK2Zab2ordGZ1eEVHdXFxb3N2QUpaaVloZzZ3bkdldEhuS3Bn?=
 =?utf-8?B?SW1FdFp2dVJQK2lSNDl6YnZieGU4dENMelRtaUFKdmg0eG5zNytkdzR3RHVj?=
 =?utf-8?B?ZjhHWXFVbVR5ZXptZm8rMDY0bE1nMFNpVWdBbFZPNWhmcHJRSUExMy9EMFg5?=
 =?utf-8?B?eHp0NWtuUSt4c2taQ0U3c3U4MVN0Z3NlWk1OUWd2TjhFRjI3UC9ERjRHZlFT?=
 =?utf-8?B?dUlSaHlZa3ZoY2lMSE4xRGVxbjVRL0x3SHgyRXdnai9JcFZVVDB5QlhlL3p3?=
 =?utf-8?B?UlVaZXlsSWNuNllNM3F6L3VKNWllZk5jeE9ZWGRHWGdOaE9qM0RTRjBPUEd1?=
 =?utf-8?B?b3NYQjAwVWlpVHB2bEFydStFSlF1N1RJYVJ0QVBiM2xrNXN6SlR4aHV2djVR?=
 =?utf-8?B?ZkUxNHhGdDN1bSt5aG11VDEwbkdCTmwwcmduZ3Y1aWVSMlpVK2VJbmJJRFRY?=
 =?utf-8?B?VFYrZGpRQjc0anBXc2lwMHFiMW1kMG1EQlVXVTBFU0E2MGxtV2ZteEFJYms1?=
 =?utf-8?B?REMwdEd5NE02MEF5dGtPNTdOaXpUK1h6eWlYTUVTWVd1bjlPV3kxMmJXVk4w?=
 =?utf-8?B?MnNjMUE1WEl4VHNZVlF0bXRobWh4aERFL0tpZlBGcDlaN0ZFdnlxK1dPNDFE?=
 =?utf-8?B?Y0ZBYlBWWm9WYURnTUNWMDBvSDJiSE9neTRxYy9adTkzdDBzK0h4MFJpRE4v?=
 =?utf-8?B?eHpNVHdHQ1F1NFJDREtxdGFXMTFQVEcrTXB5dzRFajcxejIxYjZmMTZOdGsy?=
 =?utf-8?Q?J8WSBcDyrlTJbHsg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad3a6be-2e25-4b22-4253-08de414dc991
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 11:32:28.7516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8SkXsAOnwsMgbw0w4hS1eJmoToNWmeRhcbMHtn/9b+BwDy+lykJVD65QSm8hospw7xDWpMQd205LI3zMsvTO4lLPQciFHFLR++d68eCmPwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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


On 9/6/2025 2:38 AM, Swati Sharma wrote:
> Add func() returning true/false if platform supports big/ultra
> joiner and use corresponding func() in related binaries.
>
> v2: -Moved func() to joiner_helper (Jeevan)
>      -Use common func for ultra|big joiner (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_joiner.c        |  9 +++------
>   tests/intel/kms_joiner_helper.c | 33 +++++++++++++++++++++++++++++++++
>   tests/intel/kms_joiner_helper.h |  2 ++
>   3 files changed, 38 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index d1ddbeb60..e5cd33ef3 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -33,7 +33,6 @@
>    */
>   
>   #include "igt.h"
> -#include "xe/xe_query.h"
>   #include "kms_dsc_helper.c"
>   #include "kms_joiner_helper.h"
>   
> @@ -546,8 +545,8 @@ static void test_basic_max_non_joiner(data_t *data)
>   
>   igt_main
>   {
> -	bool ultra_joiner_supported, is_dgfx;
> -	int i, j, display_ver;
> +	bool ultra_joiner_supported;
> +	int i, j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
>   	data_t data;
> @@ -570,9 +569,7 @@ igt_main
>   		igt_require(data.display.is_atomic);
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
> -		is_dgfx = is_xe_device(data.drm_fd) ? xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
> -		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
> -		if (is_dgfx && display_ver == 14)
> +		if (igt_is_joiner_supported_by_source(data.drm_fd, JOINED_PIPES_ULTRA_JOINER))
>   			ultra_joiner_supported = true;
>   
>   		for_each_connected_output(&data.display, output) {
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index 17a22d34a..8f77ccde4 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -179,3 +179,36 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   	}
>   	return true;
>   }
> +
> +/**
> + * igt_is_joiner_supported_by_source:
> + * @drm_fd: drm file descriptor
> + * @type: joiner type
> + *
> + * Returns: True if (ultra|big)joiner is supported by platform, false otherwise
> + */
> +bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes type)

Perhaps joiner_type? or just joiner?


> +{
> +	int disp_ver;
> +	bool is_dgfx;
> +
> +	is_dgfx = is_xe_device(drm_fd) ? xe_has_vram(drm_fd) : gem_has_lmem(drm_fd);
> +	disp_ver = intel_display_ver(intel_get_drm_devid(drm_fd));
> +
> +	switch (type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		if (disp_ver < 12) {
> +			igt_info("Bigjoiner is not supported on D11 and older platforms.\n");
> +			return false;
> +		}
> +		return true;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		if (is_dgfx && disp_ver == 14) {

As also highlighted by Karthik, this needs to be corrected to:

if (!is_dgfx || disp_ver != 14)


Regards,

Ankit

> +			igt_info("Ultrajoiner is supported on dgfx with D14 only.\n");
> +			return false;
> +		}
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> index 8a6f8e5ad..5f55fe4be 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -7,6 +7,7 @@
>   #define KMS_JOINER_HELPER_H
>   
>   #include "igt_kms.h"
> +#include "xe/xe_query.h"
>   
>   void igt_set_all_master_pipes_for_platform(igt_display_t *display,
>   					   uint32_t *master_pipes);
> @@ -17,4 +18,5 @@ bool igt_assign_pipes_for_outputs(int drm_fd,
>   				  uint32_t *used_pipes_mask,
>   				  uint32_t master_pipes_mask,
>   				  uint32_t valid_pipes_mask);
> +bool igt_is_joiner_supported_by_source(int drm_fd, enum joined_pipes type);
>   #endif
