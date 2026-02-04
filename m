Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A50BE83EE4
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 07:24:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252B110E235;
	Wed,  4 Feb 2026 07:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyLkZuNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3913610E235
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 07:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770189860; x=1801725860;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5A2/4UPvwrz1j7FRkzda05YOU7ljqJU3z9Z4NXZr1tg=;
 b=cyLkZuNNy2CNXZRwGYeJHiNac44SEjhrGCZZxGii3nRs1SuK4jtCZV3H
 Mlj8khUe5qlsLgqHnboLN9Ul83/wa1t/mHEzfU0aj60THw0sq9DqV2Ge7
 ANSjl+CAypTmOa4MxRZmo84udadpVSBXSLaOCwj9yfeXsEffZwZhuTI2E
 L0zdgfhmIc1SA/tUnNhA/CrcpndV+I4gK4EI9fes0WQWdbl25CxQ6IT3e
 iQ80xZujYevEk3bhv42BCt1Yveh44cKkJSEVgeRwlZywr/Uf1zgTtpmuW
 +yWEgDb3vJy0MgrhFDFGnuWuCWB8thnQGS2B5pcN7FovZrzmY669uAV2Y w==;
X-CSE-ConnectionGUID: f2YZnkSlRoqZBKTKRuRuaQ==
X-CSE-MsgGUID: 65JOSb5FR2SbCm4J2fMrXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88946742"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="88946742"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 23:24:20 -0800
X-CSE-ConnectionGUID: OktLE5CURJCsssbysEOQsw==
X-CSE-MsgGUID: O1NVzMZMQoiEMSEDDVtNRw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 23:24:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 23:24:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 23:24:19 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 23:24:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCOvjjra1aYkWdGHcxNKsWKPQ23V94QlxXCCLOpBBScWjR8/NbXl7oXVEoTe8ZW0xcff3dA22jnxyW7zfYgbRmrXGh4m6SEpJwzp24FUQXm1NkdctMzhInunD8caZttiw0II4io+mzZY85j1kWJp6Ei+aqEaYisUKKkDB8HaquCIyd7N4IgwCxyiGBa9rwWK17ICGDmHJ6U92OctWMyvX1o8lVPJ1juB52i7El3zTq7lOOas6DHk+OCPyw8ddJk4N/ykHKLyKYLZnue4WXWRgJsHX7E8SbIurpCYMwFNVH6kg3zG0X755o3SuJRJl6HA5ycPMQ4lCRiLPJnDL2SzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtOyEvgOvWaO0PCLOXSW4ZmPqdbJR0UU+g/ZzeI54mE=;
 b=rruEBM75RALbv2TVArcSGNLiaioN4cJYUcJoL6l/HgdNJytkMIsmbQcDGpFJzjlnGsff6YLkFPqCk4hbu1JCqxnUWFqyy246LIDrACkUvENXC0/T8JswPp1t33MpIjTZcim/NwFE4t/zMacDLwVfmVPTyUK7/igw6KvavboKdvJz0XkFoLLKIsxxteN/596teOPLhS9dxPOe1J0Lx7TXFfMYEhJBbyMVy1B6T7cKOFQVgLhpQwVaZaChKpYxi0vuEWEu6q4F5Dyb2lwC2kM7eQafSLaFJcoqP1wVRaENwbM/XxUzSYWYtB0Ma5LdeeejPoBXHnsDO0Ve0TVUH8SxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA4PR11MB8964.namprd11.prod.outlook.com (2603:10b6:208:56f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 07:24:16 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 07:24:16 +0000
Message-ID: <9245994c-2674-480c-9dba-c5b7fa49a274@intel.com>
Date: Wed, 4 Feb 2026 12:54:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/3] intel-ci : Unblocklist HDCP type1 subtests
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260204064212.751758-1-karthik.b.s@intel.com>
 <20260204064212.751758-3-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260204064212.751758-3-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA4PR11MB8964:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e1e129-79b7-4060-6024-08de63be674e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2FWQkNkcHYxU0h5aks3RHRyTmt6Zk5IQVBtMm01SGFFMHorQW1BVG5uYlNj?=
 =?utf-8?B?aEUxSFd3dElvbHVOMEIxOXJvUzJPOGVRbFhYdURFZTBRdVg5ZkNtbGcySkwx?=
 =?utf-8?B?ejBsdHRibFhnYnZsazdmVTlRZVp1QzdrSXBYNFRDL0p2bW5oRGI5SzY3czIr?=
 =?utf-8?B?SEhVbm5KenVSTU8rTitFMlFtMStWVzlMVUxMSzQ1bVY3RHhyVE1EYmtVSnVI?=
 =?utf-8?B?M0VYWi8rL2wrSWRQMXYydzBYM3dBZFBqR3FlZGtaSENLRitHbEVRbThjZzlx?=
 =?utf-8?B?NmtiTFdVQWFsN3VQWWtLNWVwaXp2aXB4ZVkvbHZyMlMrc1EwcXFtdjhMckU1?=
 =?utf-8?B?L1dsYm4xTGNjcTY5eXdIVEYrMWVwSjZ0LzVwbDFzOWoySHh0ZTNsckt5WXlx?=
 =?utf-8?B?OEp1dVBUc0c0c0xaRXV5WTUvOGhpL2d2V055R0UzVGYzaGc3UUFzcDJjb1RL?=
 =?utf-8?B?VDlicjNvMnpaOGVSK051OTdFR2JZV0ZRYXFYakFzSDlpTzBTTFplSXlGeVhw?=
 =?utf-8?B?V2tiUnkyR1VOVHFpSklGWEkwL1JCcVRxWG1FWHdMcUNVaHFVWVQzbmszMzZ4?=
 =?utf-8?B?a25wc3g2N25vanYyV3QzSDVSNjRLc044V2YweGJXOHZVUmVMbmhnNFZUajdq?=
 =?utf-8?B?SkdHcDVQSmMrSnFJdnd6Vm5adnlNUnNHK0hZd0FkcjFZanMyRmFaUXp2S0pi?=
 =?utf-8?B?c01OSnZySm1MdWQxQzNrNWQyYkM0YThXQ1ZSRFVMMXk3U3M2dXNQNHVrVnJr?=
 =?utf-8?B?NkVPK0NLRTMycVpMb05JUittN3RTeXVHTTNwWldxeVJMNW1lMFV1NC90OVcw?=
 =?utf-8?B?NHY2aW5DeTBwQ2JJTjZhdDZWOWVDWGUzVVhMcUdmYkw3OVI0UkNZMWwrNVRu?=
 =?utf-8?B?Z2hWN3dIazhPczZ4UldZaWtiaFVjMWd1NkdGM2U5NFRsTWZNMkd5SlllOVZW?=
 =?utf-8?B?eFZRNnVkUzloU0pScVhUeWZRNEQwcExtZDJ4MmtJRU5lTFhxOE5MWDJab3RM?=
 =?utf-8?B?VExPOEZVSEhsMU9STzZzQUZKYkFibXRkS0NwcTZjdzBqWGpNUEJ6U2VCOWtE?=
 =?utf-8?B?ZWFMbXFrWTVPOVVMZEJ5TlptdjhyMlhJWlE3YkpveGtRTHZBdjlXOGFxbFB6?=
 =?utf-8?B?c3l3cG52NzNHR2RJYzlJRUc4dTQrZFBucWVaMGVIL2I0MCs3U2d4eEhQMDFX?=
 =?utf-8?B?RTl6aFpnMU1YSUVobi8xYmcvMTkvVDVqSFczRTZvdEtVd1I2dkJQeHBWWkxy?=
 =?utf-8?B?WVY2dDdtM3Y3WFFobUZDdjNVYzhmQ3hONVM5Y2w2c3RTUE0wY3RGaWRGU3hu?=
 =?utf-8?B?alNEWWxneDVibWpJTkNUd2czaHdKL3VIUFUwb3hFZUxCcmhZbndmWkMxQkht?=
 =?utf-8?B?QjkzOS9zNGhMNmVuejByTzcxdlpGdGV5WlJFU0hTcXR6RVptNDQ3bktwUlF4?=
 =?utf-8?B?QWhDY0FtTXpLUC9lOEMrcHZVVzVaek9wdDY0ZUpWQXFIYlNpdXVhZEFPRllZ?=
 =?utf-8?B?Q1p0Zi85S0N1MmQzMlQ0U1FobUdDUWt3VXc1OHQxWTZhOVBvUlJDeG1MK3R2?=
 =?utf-8?B?eVRiamZrd21PS3VjUFpqMFJoYWphUHYrcUJKVS9McngzVFh1L2RVM25oUDBn?=
 =?utf-8?B?RzIrbkJzWEVLL1VSSC9oY2l3MW0yNTYrME5rK01tNytiKzlEV0FyTkRBbkZp?=
 =?utf-8?B?dzJMYlBueXFrVk1GbmozRlMrdzhleS9Cay9ucDAzcUtISjJ4WjA2ZmpPTXNP?=
 =?utf-8?B?bkhDTUNJV1Z2K29YbmxBeFZ0dkljT1loSW13R3QzcjVVZklSTjZEd2hKelFP?=
 =?utf-8?B?dWVmNERsdVdVSllHeUZ0OWhLYVoybW1tbEtMQUkwdHVHblNDZllUaXhXcDI2?=
 =?utf-8?B?bjd5K3pobWNuaFl6QUt5RktmMnZDbk5YN0RsOGNLMFlKNEVReUVSejFITnE2?=
 =?utf-8?B?TWZDcTVBTEUxZTJnTjFHMUF1cXBNT3lHZFpkR0ZoN3grRk9VdDQvM09JMFpE?=
 =?utf-8?B?NEtZRDBVMEQrNVdMMjRiem9VamJvbG1vVXNUaVFpc3dnSk1VMjVOOVdKSDJl?=
 =?utf-8?B?NHBTYzhyclFLdkt6WnNXYVg0dko5dXdOdUpzSWwyV2hSM2lFakh1SlhHalZ3?=
 =?utf-8?Q?/RcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmdOQ0ZxRHhwblhSYlp5L1VzVHpObDVyQk1VQm0vVzcxS256eERMYjJFSmQ5?=
 =?utf-8?B?THppZFA1dVB5QTgzWW4wa0Y3K3dVOHJxbDlITnJvdHRQbDNJWkx3cXpNYnBT?=
 =?utf-8?B?clIra3VrWlJaQ1B5bmJ1MXYxdllUaDFlb2RMenJHbzJKR2JHSExOS0w5eDZh?=
 =?utf-8?B?VkJyWmxLelpnU2kxOFlQakdZb3J0Tm1Ebmp4WU5memo4ckg1SWhOSVNWdHhr?=
 =?utf-8?B?QXN5azVqRjZqeHgvcGxGemowQXRreE9xTG9wb08xNHE1ODY2SHRzdFBLQzV0?=
 =?utf-8?B?VlJaaXdRTWU1ME5VZWRQTmNhTmlWRllQNlcvMCtwNUZOK0xVVTdzNUdNekdO?=
 =?utf-8?B?aTBOc1QzT09RSVlsRnhSdUg4TE9uQ09GOXczR0VJeVQ4ZVFWR1Ivbm1Qck9T?=
 =?utf-8?B?TXJMc1FRWFA2WVhEd2JHNHNmTjhhOGVydURzL0R0WUpjZHdUdHFBeVFleVRp?=
 =?utf-8?B?WTJzbExzOEtsU3owWElPVUN6NWd6QWsyWXJCTWIzZW1reW8vWDI0eDlZUmRz?=
 =?utf-8?B?SmFtektpOE8zUndVV3VqaUhONGkyY1pqSEhFNWNoOFU2ajhPdmd3bjdCS2ZE?=
 =?utf-8?B?djVuT1V2YW5uNzkwSU8yT1ovM0ROTE4xU1FWSC9vMUUvb3lZZmJOakEvYTFJ?=
 =?utf-8?B?czhDUHMwaHAyMjR1YXJPZU9RWUxXT3pnSFBGSHpVRlJjQ3hmdGpyRERVampm?=
 =?utf-8?B?eUtWL1U2WGs1RFBTS2FtbkdOV2pVMUFiV3hYWjBlNXFQOGY4WUdMU1lOQlpT?=
 =?utf-8?B?dnFRUnJMVER3eWh0Qi9iMWwxckg3eHV5UWRMY05JTnI5aldCVmdxWFhZdlJi?=
 =?utf-8?B?QlF4UW5icC91R1U5alVpd0FndWF6bXoycmdHaEViZVc2bFk4RzVwT2gyUXJm?=
 =?utf-8?B?QWdQWWVwQXBXaW45S0NuTHBPa1RBWXlGK2h0TDRocjhnVjVMenJjbEdoWCtx?=
 =?utf-8?B?WS9lTm14LzZDQTYzcktydWhUWWJoTEtYcXdBV29pbHRCRVZ4RzE0TnJqbHBS?=
 =?utf-8?B?eFpNRk80a2pJVUxxRytNbEtQakFxWGFoYmZaK2Z3MWRQVk44QUV0Mnp0MVFJ?=
 =?utf-8?B?ZW1zeEVBVXhYaENMb1hDZXhiYTdnQWFDT2xQQ1ZaZytJVjFYUkU5M1J2UlFK?=
 =?utf-8?B?VDRDdkRNSlA2ZkxvaWROOTJ6YVQ5blRDSGNnQlFScnJCSGpTa1ZWTGl3TURX?=
 =?utf-8?B?YXZDUjNHOWNEUG1YMFEwWTlKckZTYlZTTWRPdXVUQ3g2WGM2TTR4MGpXbk5S?=
 =?utf-8?B?NEowN2VUMzRRek55Ti9ZZkIydUc0WitINlZhTnNjWFBqNEVEWlVvejQ0ZjZ6?=
 =?utf-8?B?RVYzYWw4ajRucE9DZ0hWcjlEMkZoTXVLSzgrbkVYcHJRbytIQitNM2ZXUTE3?=
 =?utf-8?B?Q1FtVnltbzdOYUgvZ2FhZ0cxa3FjNExDdGFobDQ3S2huTUNXT29wYUJXT2xP?=
 =?utf-8?B?NE5Nc29WVUs0NEhQRWJQZzEvSUpuYUxTUnlPTmMweGZDNWo5WCs1cVV2bU5q?=
 =?utf-8?B?YkMvdWQ3RTMyV09lM3E4emJZdVp5N00xOTBYL1BOVE82OE1JMHhwOEQxSkx6?=
 =?utf-8?B?QnR3TzJCV3BUU3A2UzJsR0hFU0M1NTZrL3lXczE5OWZnVElWTzRRZVRNeWs5?=
 =?utf-8?B?QjBORHZPVk5RMnE0MnUzL2dRRWZrQk14bXNDOTRGOENsbDFrRnJ1cFJldGd6?=
 =?utf-8?B?VFp6ZXFhdlpxU29nUk1kZG10ZFpvUDg1S2haai9FeXBBZEdMRVBHQWtaUTlx?=
 =?utf-8?B?N2l2YWtnTThlcFdtR1dLYW1waE5MQmluSERYd1FnclNMV1o4aktFZTBCTTNt?=
 =?utf-8?B?Y2tJcnNmWC8xZmwxNWQzQXByTG5MZDBLaWhRMWRZQW5kbTlyUGdDdzBqQmZy?=
 =?utf-8?B?MEZydmNib3A1N2RuNG9rd3huNVhhVStGcFJJc0pmZ0w1R3BGSkRFS2hIclRz?=
 =?utf-8?B?dkhkSElxV1NNY0JsR25Xbi9XTE5LL3h5R0tWemc4dysrRUNlUnNVbjc1cVdV?=
 =?utf-8?B?QTJXbDM2TnhiR2VRR1pVZHB2eVR2T0FUTzZIOTVoVytLMUR6Q3J6eDltbGlY?=
 =?utf-8?B?OFFIYmFrSGZsbFcxempGOVgzNFF1Q1RLUmEvZ0pFbHlyK2Q1Q1JqeUR2d3lj?=
 =?utf-8?B?RmNUQTRPdzcwZDA0bTgvKzRpbTFOWUl6cnMrbmZZQzRoR3R4Rlo3NDdZd0la?=
 =?utf-8?B?emJ0UFJOdUZra3FFNnQ4RFhTU2F2QWxQNkhLeS9mWExrVkNXWWxSancxUHZS?=
 =?utf-8?B?RDhDQVFrUHNJdFlkSGFockoyemxVTm5RNUorbm1KdUxlelBrR1dOWGdCQ0pR?=
 =?utf-8?B?OTd6c3BkdHJyVFVDVm85VUxSMVJUYzV4VjcyN3JYL2dmcjkrTTZuRDY2V1pM?=
 =?utf-8?Q?AupGs5HbJVWUzyjs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e1e129-79b7-4060-6024-08de63be674e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 07:24:16.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBBebak0pHjnXka9DTGZmTH+WBVw4NH22+poPRxWjM5tPTIeX9GHodTeMqNsbYA4shZi7Ltdi7GMKPWue+gQyg76kwJBlmJ1w5Wdr+j02TI9bxXYrF5Rlv8sVIBSzoNC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8964
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

LGTM,

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>


On 04-02-2026 12:12, Karthik B S wrote:
> Unblocklist kms_content_protection@.*type1 subtests as these configs are
> now enabled on CI.
> 
> Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index d92e9ef35..aaf7eb1ef 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -111,10 +111,6 @@ igt@kms_chamelium.*@.*(vga).*
>   ##############################################################################
>   igt@kms_tiled_display@.*
>   ##############################################################################
> -# Config not enabled on CI
> -##############################################################################
> -igt@kms_content_protection@.*(type1|type-1|type-change).*
> -##############################################################################
>   # Simulation specific test
>   ##############################################################################
>   igt@kms_simulation_hpd@sim-hpd

