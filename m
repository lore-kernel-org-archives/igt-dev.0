Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D344D43FEA
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 08:01:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055B410E26E;
	Mon, 18 Nov 2024 08:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksTj516b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B47010E26E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731916903; x=1763452903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7sTR4Fo1GxFPCYlEqd4Q+TkhZsL+LrlpvtjqRtdSRR0=;
 b=ksTj516boacqB+RiUrA37vzcke2jN3hnAoAzrfv8DaVEPMFKJdxja/d6
 y4gqWcYvv8D/BUxHqFdivAHvrZlIPiTgAtk6bpMu0h0FypmkxhxW/HbVN
 iVm0jmR5ViOuqOU165Jso5JU9BdzYAGK6dkCiuo7LDlVVTftYnVKWHBeH
 n4CLIucW04WkAd+5+yDaHJtG7Br2KYSGPFuiMPdJz5kMrLQj1/hXAmvie
 OiLQ+L9/E27ubQF2+fsoGnjaMugCFBsVrDCm8Atv1MHhdslMVBu4bfy5f
 FtoX+P5/vEO0ZziN+O2di6h7/h6FrtaV7unRbudw2cDtHlHpkQTKogJXT w==;
X-CSE-ConnectionGUID: jkXMhXBDTnqLLbkXwddQoQ==
X-CSE-MsgGUID: Tynp5wumScu5OqhdipMxGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35528815"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="35528815"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:01:42 -0800
X-CSE-ConnectionGUID: NI7oVSPQTSGXirnG8Fo5CQ==
X-CSE-MsgGUID: 9Onbb6wEQim36NQEd/NKPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="120091551"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Nov 2024 00:01:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 18 Nov 2024 00:01:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 18 Nov 2024 00:01:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 18 Nov 2024 00:01:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoDMMrO8RPodrCzFMQ647yLb082chW5SPQsixdOcPGZv3rcWn/ZWDNT9EUDBJMDrnop5uvdTe2e2ZvE/XmuU8riJujPyuNgFZjBfwi21UT0MQmWyi5LoFX036Lt/P8PGDu0sU9Gs4HypWbFQTC3B2mMxwPCri+uRYGSf4hbcErblPoqNXEAX9uX4N8Uv7C+UTDrYc/LQ4ZkjfCf3ShFBADRunawBEiWIM4bTkjJnxdHidUtFxwT2fFqg1uHmjp8xs5eIj1bP2vguez1km8vGWqCzPDrlw7FjHTbsHRVM/7MAaWdsZ+IxdMehcN0mzJ+oR5F4WtB14EKxr3IQ4nCNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG0iZVzfXHwKnS9v9mrL9WOz/qXcvOPtAvQ0f0MDv+A=;
 b=vnH49Wp6q0J5ooxNSvmrk0AtcXthfDdSCMRMVn/KpRzjsh8sJf9qfFr7vmHVsNj+WpuVw/5cnSrbzZP6DFICUsrOpcxPVQZtBW/f9Ji2VajuOP4ScGZ7pbnUwwOF/FHGKDjdvojoRc9Tmy/pPAxddj67UNTDBgBfLROFEuFYkOOADVMTrNtoE+/VomB5ucGKxuItS0I6Vm/wXSt5fUpy/xqXCT+E2+WJJnQmQR7JDUZ9HUzCyv1tTkafpXqNNN1J44+kV+oZhAwjXwWjFmKtlakR0Nuv/0hvXYp07xMP9AefbCDF229rIlR9Rebq5srDhmpIZbYQdtdX0mjNBwjiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA3PR11MB7526.namprd11.prod.outlook.com (2603:10b6:806:31c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Mon, 18 Nov
 2024 08:01:39 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 08:01:39 +0000
Message-ID: <edc62da3-6ef7-4c45-ab88-a23bfe1b0896@intel.com>
Date: Mon, 18 Nov 2024 13:31:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/i915/kms_flip_tiling: Fix pageflip
 timeout for low vrefresh modes
To: <imre.deak@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20241022155311.2797257-1-imre.deak@intel.com>
 <20241022155311.2797257-4-imre.deak@intel.com>
 <ee9c4c59-3807-4712-bed8-30f09859a2ac@intel.com>
 <ZzeAtMTrx_24vFur@ideak-desk.fi.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <ZzeAtMTrx_24vFur@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA3PR11MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 82e7dcc2-c79c-4e80-ab4f-08dd07a73b5a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2RzL2tpeitpcFg0aXNZUjA1QXZ3bzVvd2ozdkk4bkpYcHIwRmNHZzN5dmRa?=
 =?utf-8?B?SVhndlNoTmpsc0JOcE9abTdtaU5WSE9vcGpHaEE5c05WM0JBcmtENWg2M2JS?=
 =?utf-8?B?andxcXBERXZkQ21aVThFVzZnekk4M1FoL2Mvdm5rTEc3YWM5WXliR1VZK1hU?=
 =?utf-8?B?NEd5MkVobGU1Z24waDQ0QWJSSDRHUmVqcWRaQzJPNTJycmU2cVRWZ1N4UmQ4?=
 =?utf-8?B?emZkYU5hZzZaUXNaY09lcVZydkZFVFNOMWkvc29lZDhMTFpURnVpZzU2cUFW?=
 =?utf-8?B?YTNFdWYxNnh6K3RtQmFuSmJwVDB4dmN0cWMzWWhCOTlBK0hPaGhhUWs5N1dQ?=
 =?utf-8?B?REkzRVZvUW10a1hRUjN2ZGVKbW1WS3BucjFwUUd4QjAvVDZZSWxKRVp3cGNR?=
 =?utf-8?B?aG9UVlhoN0hNRDZMRG1oK1hlRjN4RkNoWU5EamE5NkNRLzBRZGpJRzA3SXpk?=
 =?utf-8?B?U1p4S2F4ck1WdFltaTdhb29WUVFSMjdDVHJqYThMbkhiZFFpRnkwUk1KMXIr?=
 =?utf-8?B?T3pNdXIrRTZ1WmtwbU1hSE8wSmpUd04wTnkvb3J5ZnRxV25sM2pXSGsrMkxJ?=
 =?utf-8?B?YXV2NWRIb3ZqUGdBMjkyaTIvN2QwTThCYThHTVZFT25nRHBzRVp0YXRLcm1Z?=
 =?utf-8?B?NGQvRWdQM05JMnBSRnVoSndYdkF5bWo3OVJsUSs1YlBMZ2N4QmhYN1VEN015?=
 =?utf-8?B?ckEyUndLZjRsc3JmMDZyY2pzbGU3d1lyTFdrWnk4cWlPbU9pWW9aZDdETENy?=
 =?utf-8?B?MG50YTJUeVJSc3BpSEJNU05mZkNkdDBBUDNpOU1yMUJrb3Yrc2hvUERNbFNo?=
 =?utf-8?B?Tk5YWnY1Q1FHYTZER3VFTGtHdG5CZjVOYThiNk4wOUVRY3l2dHdWNkJ0Y0Vv?=
 =?utf-8?B?NU8ydkNPZWJYcFM0ZHUvNXpPZ0xRV1hEUXl0Y0JMK2g0ZVV5NCtlYWlhK0xu?=
 =?utf-8?B?TzVOdDBENmlMMnlWdHI2czRmVkwrU05QT0dxVVd4RXNwSVV4b085Y05WZ25y?=
 =?utf-8?B?dzFzZzFtZDJTbXNuR0pJbFg4UGMrcFBJNU9ZL3RGczRzZk9ycHN3VHBYbC9a?=
 =?utf-8?B?TVVVWTdRblQvL1FKdXJEdUcvc2d2RUVzblhneUlWOWh1QzBSSWZaVTBseUg5?=
 =?utf-8?B?T0FPNnlZa0d5Ym5xR1dZY0dRK3QyOEFrZzRQVFR2VkJVOEpOQldLKzlSdkhK?=
 =?utf-8?B?MWNYOXBlZis0L0NzVjNic0VweGY1NnJiclB2dmxOUi9PS1ZXZzdvQUQ3MVFP?=
 =?utf-8?B?R0Nlb2lXU2NJMHRQeVl5bkZTUlVWU1RwSXRjTmladjl0UDBYZnM3bG1FTkNR?=
 =?utf-8?B?VHBEaUZnTWUzNG5SUjFBeFNjb1JmcEtjaFovR0RNaGs3em5DWGFiV3UwSGlS?=
 =?utf-8?B?YXlqY1pHT1VvSG1LYzRqenVROVRrWHBhUis3MS9aNjM4Z01aUEI5OXRheFM0?=
 =?utf-8?B?bjZOU3pHd0pXaFc2MmlHY1UzMGFDY0I1SWlUVmJNL2ZJMzhaeWVmTnVTdmJC?=
 =?utf-8?B?cHJJSlNHSnpaMDMyZTBhQi9tSW4yRFFLSmJjbzF3bkRDVTcrQU1ycEFsamQz?=
 =?utf-8?B?MkNhZyttaDlRenU2S24yNEMvaE9BOU5Ca2lhZjI2T0pCQVZBNG5nd3AvRFJi?=
 =?utf-8?B?M1FqckJ2THQxUmRxL0tQdnV2VWdhMWd3ekhqY2FoK0JlMTY0ZU8wbmQ3alFC?=
 =?utf-8?B?dmhjSVNsN1BObTRCeDhXVzVDUjAzMmlNWnloQ0d6RFZmOXR2YmM0ZjFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkN5aFhKaGp4Y3JhRktzanM0N2JZMEdlU3ErVWViSmtyWFhVdGsvdC9LdWZ4?=
 =?utf-8?B?UEVROWtlbkltSlhKb2FNK0dBVGVYMHhWYko5Nk1SVVVvZFZGMXFybnVtV3l6?=
 =?utf-8?B?em51UW4zWVhKYTI1ako0emlzN2xLQ1dJQ3lMTjkxcWFLZHRHWFFjUjJtMmp4?=
 =?utf-8?B?TEJ1OGhnek9HVFRoSG9VQXphN0Z2MlNnTG8zaGVUOTdqWU96ZkRHN3JvSGhB?=
 =?utf-8?B?aFA3K2dFak1EcG50YlU1QWtmNDNOd3NXd2lvSmxGY3V5RSswQ2REZUUzUDh3?=
 =?utf-8?B?eldyRTE4am94aUJGNzg2SU03aHhUUkNsYjNvMjdUaS9QT1dzMnJiN2JFeHg2?=
 =?utf-8?B?VmVCazZSeERYSm1QTTFKZ25nS2wraHd4dXhXblhQMmVXMDFFY0pZMCtOa09p?=
 =?utf-8?B?R1RGRnBXYk1mZ3ZobW5Dc2NlM2tmN0ZUT1B0MXNoaEZKV2taZ2N4SjMzV3U2?=
 =?utf-8?B?V0QzaEozV29Ma2FidVJFU0tuTTlzbXQrVzBFWTcyWm9JYlBrTk50dEQ1ZzJa?=
 =?utf-8?B?K1BGZERiSHZlMUk3OUhhbmN5bWtkZ2tmTGJTM2t1dDZ4ZFhJZ08xaTFrcUZK?=
 =?utf-8?B?TWdCMFBpeWNwQkN5bG1yR3lBc2FUN0h5M0dNSE9YT0haejh5ejJZWDkvSmlM?=
 =?utf-8?B?Yzk0Y0ljek4zOEFnMU9JNHRZbGJwTlNGNWZmQzlwTzR2QWUybTBNVkRjQjAv?=
 =?utf-8?B?NHo3YVpGU0MxUlJNMWIvMXdqUjFxcWRjM1pEbk1qcVV5MHZaclhzUDZOYjdq?=
 =?utf-8?B?blU3WXhaYVRRTXZRVGJYcVFnRk9xK3lkZ3pRYlNuaExEZHFUUHV4cVNDMzZJ?=
 =?utf-8?B?ZmhhRG5oOW9MRmQ1Y3pYNWNpcGU3QnNMNnJ2RmxuZEVlS05VNXB4a2ExM0lO?=
 =?utf-8?B?Tzd4L1k2dzN1SzEzQ3JHNEJlaXRSTlJneTdsZmUyQnY4R2FRR2JBeCtkUnB5?=
 =?utf-8?B?NTlxNStYSVZqTGpoVkQ3dDEyMGpxYzZHWmpINHYvZDZBVGk5bVZuRmwwN0dU?=
 =?utf-8?B?TVQ3RWxQeXlDVGZxQVh3NWFERStMaVhrOXdycS93ZnVuQ1kxa3BmMzB3R1ZP?=
 =?utf-8?B?YzArSEtSUlFzVmdLd0poZ0pBbW9nam82c0lGWEJlcWs3QnNVTHZlaVlPczEr?=
 =?utf-8?B?d3ppYTBEQWdudzU3V0I4bExSS0FMWjk0OXp6ckZEZnBRWnE5NGhQTWl5d28y?=
 =?utf-8?B?dUlYTVJReTRHekN3TTZyZDZ6dlc1M0tjZHBwdmNBeHNkNVhkbHp6V2drUGdT?=
 =?utf-8?B?NXBRaGhIVE1sUlVVOHNRTXJsc0J2d3U3NUNWRkNJbG1sL2JnY0tJWWJNOGxW?=
 =?utf-8?B?UnBXamRja0tENXE2VklBajEzOWw5Sk56RXlCREZpYnRaWXhtZUdLTUFnVXFn?=
 =?utf-8?B?aS83dnJ6WGpuRmdIdXdpSUZjYW1nMHlSVVE3dUI2UFQ3dGQzVHZWaFBzY2Nw?=
 =?utf-8?B?dTFSKzRRU0hYYUEzd2JGQWRpVXgyNVVVZlFHd0svemtiV2hqUmEwd09KWE1B?=
 =?utf-8?B?dTVocEZPdkxlWC9Mcm5EUXlhbXpyL0dsQnU1K0FQZlhPSUcwUDIybFB4R2VO?=
 =?utf-8?B?cHYxaUZtbVFGZkJvMXJqNHk4YTZzaldSdkpwQjhnNUtLc3B6V3JONnB6N2hN?=
 =?utf-8?B?OHdlR3hESGk3NjFVeE8vWDB5c29hckxUTlVxcDN3aUw1SlM2NFpKUnhvMkhr?=
 =?utf-8?B?T0MxbUhGaGdoak80WDFmOWxHOEtOcDVLbThFYm52VGtBU1JaNlZUZlVVQkhG?=
 =?utf-8?B?WnBHbmhtVDVteTM5bG9sdUM1YjdXdXBLMy83cTMrMXhCTm9jcFJpMzJ3bDNh?=
 =?utf-8?B?eEFXQjczTW1tRE1mZG5kQUo2WlNxM0xzZDBVOFBWZm5oV1BwbGJES0E5U2J3?=
 =?utf-8?B?UHJHWEFRM1lmREJVWlpidWVZYWdubHlYWmozbk1ZRENyRnVTOVF6RzNONlVr?=
 =?utf-8?B?TGg2VzFOSnYzQVNoUllaWmtGUGxFMG5BOXpRZVVpbFU3Q2xKbC9jVFhoYk5X?=
 =?utf-8?B?Wng5TFAyZHp1Q291K3VVWDBsdzkwZmFKd3B5S3VxZzlacFBKSWlaS2JKVjIw?=
 =?utf-8?B?Y2lybCtoa2tSUXFKWk52S3V2a0Q3NGJCQ3ZZb0NNM2laVGcxblBYZnBQU2dB?=
 =?utf-8?B?dC8wQ01HSjVzbXRmMEZtU0w1MTBUUGUzamgxMnN4NFdYL2syVmhhaDJIRWdI?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e7dcc2-c79c-4e80-ab4f-08dd07a73b5a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 08:01:39.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2atwqBrF1IDK82H9wOl/yqghvtVb4UP37glxC3GeCpM9E06QzSrAK1tXco1U3LhA7QQAupnpH3+e74EwWTvHTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7526
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

Imre, Can you check if your patch is fixing following gitlab issue

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1491

This is MST config re-lnl-4 with 4K@30 mode

https://intel-gfx-ci.01.org/tree/intel-xe/xe-2244-5b1f614ccf1008e7aee531bf76bb639802e0df88/re-lnl-4/igt@kms_flip_tiling@flip-change-tiling.html

If so, add closes tag.

Anyways, patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-11-2024 10:41 pm, Imre Deak wrote:

> On Fri, Nov 15, 2024 at 05:14:22PM +0530, Sharma, Swati2 wrote:
>> Hi Imre,
>>
>> Do we have some gitlab issue associated with this fix?
> Not sure if there is, the problem needs a mode with a vrefresh rate <
> 60Hz (to be added to CI for an MST config at least).
>
>> On 22-10-2024 09:23 pm, Imre Deak wrote:
>>> The current fixed 50 ms timeout for pageflip completion is not long
>>> enough for low vrefresh modes. In general the timeout should account for
>>> one frame for the flip itself + one frame for vblank waiting due to FBC
>>> invalidation + a fixed amount for scheduling overhead delivering the
>>> completion event to userspace. For the usual 60Hz modes the 50 ms
>>> timeout worked ok based on the above (2 * 17 ms + 16 ms), but didn't
>>> work for 30 Hz modes (the minimum timeout for those being ~67 ms).
>>>
>>> Based on the above use a timeout length of 2 * mode specific frame
>>> time + 20 ms fixed scheduling delay.
>>>
>>> Testcase: igt@kms_flip_tiling
>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>>> ---
>>>    tests/intel/kms_flip_tiling.c | 14 +++++++++++++-
>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
>>> index 3bf02564e..e937c2171 100644
>>> --- a/tests/intel/kms_flip_tiling.c
>>> +++ b/tests/intel/kms_flip_tiling.c
>>> @@ -86,6 +86,18 @@ static int try_commit(igt_display_t *display)
>>>    				       COMMIT_ATOMIC : COMMIT_LEGACY);
>>>    }
>>> +static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
>>> +{
>>> +	uint64_t timeout_ns;
>>> +
>>> +	/* 1 frame for flip + 1 frame for vblank wait due to FBC. */
>>> +	timeout_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh) * 2;
>>> +	/* 20 msec scheduling overhead. */
>>> +	timeout_ns += 20000000;
>>> +
>>> +	return DIV_ROUND_UP(timeout_ns, 1000);
>>> +}
>>> +
>>>    static void
>>>    test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
>>>    {
>>> @@ -137,7 +149,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
>>>    	igt_require(ret == 0);
>>>    	data->flipevent_in_queue = true;
>>> -	kmstest_wait_for_pageflip(data->drm_fd);
>>> +	kmstest_wait_for_pageflip_timeout(data->drm_fd, pageflip_timeout_us(mode));
>>>    	data->flipevent_in_queue = false;
>>>    	/* Get a crc and compare with the reference. */
