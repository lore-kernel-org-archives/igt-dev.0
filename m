Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBE3D2447F
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 06:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615B110EA3E;
	Fri, 11 Oct 2024 06:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axBPdQqL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CA210EA3E
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728628124; x=1760164124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aS+DLj4EF3MHAXe8xAM0U6GzetLuBT0ofTvd7nTp5K0=;
 b=axBPdQqLfv1Aln/6Zmr/fl6pTCPbLxQ4jzWqg2Zv1YWK4cZRJ8MaoTMk
 uaf+5a38gyBW3YoUJLWLfQJpuYvscC7HQtoWKgeH0BV+/vbB5vt6UREIX
 kmqOeiTUehk+OTDiwI7wctvTOZxvgY0/+cUstoImGDp2kAbKTgxPCno9V
 irZijlgioYQUp5VjXSZthGacI/sbgEILydpOcnxcv7RKEwcdL8DtEbuVL
 fX4EFM8Zg4WgqBphqKvtUyY+V7sCOtaubg+H7b2kymIUJnBHEqOElxTAC
 WAF7XHcz5mEV0hPLsHXEU4i0P+sqLQEISIQAw9NU1UpPbhTDOOk2fff7S g==;
X-CSE-ConnectionGUID: 37Jc/mm5SC+AqJ5ti1Ag7A==
X-CSE-MsgGUID: TEVJU8ztTROi7wS046na0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="27891348"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="27891348"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:28:41 -0700
X-CSE-ConnectionGUID: XBIvbcmwQhWHzz04EheQRQ==
X-CSE-MsgGUID: 3RvxBTzkQAKj67Azju7eow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77296758"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 23:28:42 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 23:28:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 23:28:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 23:28:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 23:28:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqdnWYJ75bchvN82xp33lmtQnJwR/yW5FHWvl/bBIxuz3nKsvUHFICU2GHdB5ar4r3g8YGKR8oa66TDoH85pRL+eYxyIm7yE8JaBGTjnB5uJ5TAmN4DOfTLNuNEkrF2f9I4AOpCvSgoZ17RqQV0uiboBEBrw0XyWG16gOzfnzY3Oyw4s1WeY2j2NGw2MAuoh9oWJePvkte2WkqNjvo42p6zSF32oMW1aNBFUeBYLr1T5LDfFFYQ2ovGq5myG6VD77w27rrvsCjSJD4zA8BHh7fieKBCFVu6lMVOl6EbpznwJpcjmMgSiqb+uxLW8B6hA6vNW5CHBoEI4kO3lDm+0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJQ36e0rJdD2KcwMfbntBzDD9KasIOMetgKSwYFLZfQ=;
 b=jcyFT+qplYVk9np0t4uZh5LxPvz9ZstJbEWTnZ8k6MChcRoCn69xKxG2tqy+t5K0i0CoSyypIaPTeF+lud2OTri3mHgKcfEjzwIEOy792SzD1EB2Bq/vJSUag44byHgYmwSWZbYkq1WOPts8N9usSPzbAkIBpT2qUcKTR1bVbZVfALqsFH636YB6XyxHSCRPEvtqbi5GDHCo8Rjrqj1v+HKtfzr+JAVaaYcvtFc2SwRyWd+oU+ttCqGKXKRjh4IWJpl+Kku6DnuPtC27LDIwUrd/Xn5+jnj7FyfVC6Fnw5X+rcdBIrtQcHOfAhq7hMT120TZpz1abKNGdZ/vAWuvxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.18; Fri, 11 Oct 2024 06:28:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8048.018; Fri, 11 Oct 2024
 06:28:33 +0000
Message-ID: <c76ed38a-b905-4c21-ae31-0c21b5ca6d53@intel.com>
Date: Fri, 11 Oct 2024 11:58:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2,1/2] tests/xe: Add tests to validate GT coarse power
 gating status and toggle coarse power gating states
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>
CC: <vinay.belgaumkar@intel.com>
References: <20241010065312.1988533-1-sk.anirban@intel.com>
 <20241010065312.1988533-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241010065312.1988533-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::21) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e155f7b-fc7f-42f8-89c3-08dce9bdedfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkoxc1lNck9UT2dyZlZIL0MvNGRINHZqVHlxYTR0NjE0MU1tNjlVU3plTG5J?=
 =?utf-8?B?dUlzWWxIK01lQlBmVTFRY0x3RUNQVVlQRzVsZUpqQWdXVjJLbk1ZL1QzMUZx?=
 =?utf-8?B?eU0zamw4U1BrbUhmS29GM3Y3SkVaNnR5S0hCcjRweWNPd0hTSVo0YjlUV09n?=
 =?utf-8?B?OUppN24xZVArdjF3TWIxM3pmUHFCeVRlMnRHeUdOcEdYb2hLYmdpZ1hOTlZu?=
 =?utf-8?B?akE0RnRVd3VPaFpSU1lPK1hneEE2cTFkVzNpMzUwakRmai9KcmRYbmkxVHdz?=
 =?utf-8?B?cHhZZFNSclptZ2VGdXZvc25EV3k5OWNLNWl4SVNreFh6WEtRUGJMYjhyelA0?=
 =?utf-8?B?QzR1V1BWdzNqN0RBSmQ5L1NLRHhoVVF6ZFBqMld4VFJaN1I2ZnJrMmJRWUhi?=
 =?utf-8?B?SFNEZkU2aG5ER3dZSVlXQVJuRjkrN3JndGVrVDVHRGdxeG9DenhmRElrWDF0?=
 =?utf-8?B?WExIekpMVWkzWkFJRHB1VlBVdEJnWFM2VGtVbWJ6QkdKRkNBaFFqdm1CRU1x?=
 =?utf-8?B?ZFF4NW1HYy9tcU1PQWVnekNmRlJiOER3UWhKZzFpQ2o1VUUxU09uVkZiVk5B?=
 =?utf-8?B?M0NwOTVKeHNpN0hRNE91aEphcjY5eHF3RnpQejU2ZGxJSEhNWHFEbFpPdzZs?=
 =?utf-8?B?M2hmZUZ6UnNoQ0FJWGh6R0loUENaNkltV3A4UmMwRGErRy9POEJPR0dqYWFF?=
 =?utf-8?B?eFZVdkxlcEtHZ1NrYyt6RWYyWkk2Mzg3UzY2OWJsRitwSitxTjNYNnlUaThq?=
 =?utf-8?B?dWpnVUN2SVAzek02U2dCSGFHTk0vb2N3aEJ1Tmk1UnczU1J1Y09oczNOSWhK?=
 =?utf-8?B?WlhaUkt2d2V3VmdZalNwb3NmczZuVG1ZQWpadXk3SjM1NmNLY0dEbkgvRXl4?=
 =?utf-8?B?NG8yZjFDZ2JnRVhZclZHTGRJSDNHN2RGdW5ZUGp0ZHBscCt1WFB3bTc5ZmNE?=
 =?utf-8?B?d0x0WWprSGJtbHdWL1V5Ri81c2Fjd2I5OXRzby95d29LczJyUHNvcGpBNm5k?=
 =?utf-8?B?b2dBVXZHU01idE5PY1dYeW9lUkVtWldhcjc3dEVuNjJWMUZBdC9ja09mcHZJ?=
 =?utf-8?B?SWFLd1phbkc3dGJKaUduNHBoMCs2VDRHMm5ndExOSHl2YVlTUnFza2lrK0Fj?=
 =?utf-8?B?Z05hWUVoUUVOYjlQU1pUK0NMbTYzZ3pOVDNPMjF5QW54RGMyWThzYXpmdEtl?=
 =?utf-8?B?RDQ3UXZkTzRYR0FIVFJxSWhFVjIrRG5aMVFkOG8rbWR4MXkyT2ZMb0ZhSlho?=
 =?utf-8?B?blhkQnUwZDR0UDYrTURTbWRBcU9iQmlnd0tTME1EMkpNQVBKU1ZLVGpTbE9C?=
 =?utf-8?B?SitsWmxJU0pvTjZKYjZEWmkxeVZYbHh5S1hBc2lmRXhZOHBYOEo2a2E1Znoy?=
 =?utf-8?B?RitsYkFwRkpQYm9aelRMTDJGa1g5TUN4Sm5iU2pQRHMwWTRYN2hVVG93VlFN?=
 =?utf-8?B?d1puODBDVnRRcFZjSDg4RTJ1cXFZeWU1ZUFrU0hwdWNCWkl0cVU1SWNPUnAr?=
 =?utf-8?B?TGRCelhEWTlEL0gvcjRLK2R6UHJYUFF6a3RqYjEvUEFGRi8vS1NLbjNVYldG?=
 =?utf-8?B?Tk9TOUFnTElTTEsyZ1R2SE00cmhxUWwxQXZjMzRSWDIwemM0cjZEcWdkWFpB?=
 =?utf-8?B?OWM5SXJBSkIvTFVNNEpIZnpwT1BiNmlPTExoRCt5b0x5czdjcnZKaTViUXUw?=
 =?utf-8?B?TFRGZTY1RDVCUGtSVGhUWmJKS1pabC8wRXpFN2dnOGR5WjJ4Q0FSUzhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWFHSy9HSm5qU0hJM0U2RlBRREV4c3JEdTJ2ajVsdU9aQW9NQWhUSjRvMjlp?=
 =?utf-8?B?SHRDeHp0STVjRW1LaStIZkl3YmdkME1xQnVFMU1NQnF6VTVRQldTNDdWc3Fa?=
 =?utf-8?B?ZWs2bmx0QnNpaFlGTGdMTDJFV0dYUDZQU1JNQXNXMnYvYjR5eTBWclZQZFhv?=
 =?utf-8?B?T0dZQkxvYTNOeTZhSzg1Ym40SHVDM0JpckkvY3dxaEtBVmZSdDREUElTS2lG?=
 =?utf-8?B?Q3F2Y2FxWUtQUXlDY2c5S1B2YUs1VkpRa2ZueWJxVkVLWFlFanUwL2hZdkE1?=
 =?utf-8?B?dXVRMkVPSHhvUXdXdGFWK054ZVRrVUJZN1MrUWxJeXJkcm1NSlA1WVUyMzE2?=
 =?utf-8?B?S2ZZa2haV2hkbXlycXVpLzBhbFl1ZE5KRzFRRzF4aXpQR0lINGNudVV3eXVH?=
 =?utf-8?B?S0cwMWI4bklmY2hRZDh5ZEFlVGlWZXZQSXRFbGp6OFVRbTZzTjZyRzAveFh4?=
 =?utf-8?B?N3RINkd0TUE1ci9XaG8yNHFYWGJDMW1TN0xacFhoQm5aWUZzVm1UTjdvZGJE?=
 =?utf-8?B?b2FkVS8rVFRxaU9PMmVKSlIyTW9DYmp2ODhLME5tYytBc2J5Mi9YQnQ0TS84?=
 =?utf-8?B?eWp4bWprNmNPSGx1aDZtZlFGcGZkTTBLd05lRlplTDZCM1VhZmhza29tUm5M?=
 =?utf-8?B?a2doNkN6YXRybHBiR2VuZnBEb2htRnRPTXlaVDdGTG5CYUkvbFdFUGhhcmlm?=
 =?utf-8?B?cTN4RDB2SHhzeU56clJtTUM1K21tZFNJdTlzRU16VHgzaGlvcVlsdnI3RDdM?=
 =?utf-8?B?ZElHemJxWnltQm9ONjY2WFhNUitCSTl0SEhIb3RLWkdjcklwMTZPY2w1ZkJL?=
 =?utf-8?B?Y2l2dzVPZjNWTXNVTUs2bzlscUlwVkZMVHkyUkxGM1VoSE04NWtzM2YrNndk?=
 =?utf-8?B?dTZQd0ZINUdsSjdRT2NJNnRxcmovVCtrVWxXM05URmNJeHRRVGxGMnluSTZX?=
 =?utf-8?B?YmFjQVZDZy9lRThVVXhhL3ovME9DcVlVbFhZMThXd3VhdlNSQk1FbTJuSzZW?=
 =?utf-8?B?M29EaFBkVGZPcVZLOW5QUURoODNLcFFwQ2NmVVZlNkFEaG1wQ3FvWUNGK253?=
 =?utf-8?B?ZkxWYXJYbXQxTDZ1WHBDOGxML3llK1ppcWxNcWJTZGFOSnA3dmRldW1EWk1W?=
 =?utf-8?B?OVJwNjVwMFJLaUxWSTQ5cU5BallzcExzQmE0UzB3RnVDRWVzTGdPa09Fbjc1?=
 =?utf-8?B?YmhNK1NKVGVVQlBXalNhMXVLOHc0SFZ0MXBjL1JhWVZSTXlWbHMvc3ZxWXZ1?=
 =?utf-8?B?NTFxQXk4OVJyek91TTNmRFVzTnFPb2lsb29kcDhSVG9GcnExZnpoQTVPUFJH?=
 =?utf-8?B?WkpFTUZVejBvYXUwM0NSU0krSHBOQXVoNmRXVlFLUHZwRmlJTlBHdDVVVUVM?=
 =?utf-8?B?T2RwT0dYcWJqN09JWXZOSWE4dllQL3JrSE5DaVBkYjJyTTZyQlNiZ2xDamVs?=
 =?utf-8?B?U2J4L3hHQTJ1ckpDMFFLS29aOU1SeHNsbDZaSVhBWHZJMS8ybmtzWmlRL3h6?=
 =?utf-8?B?Ykk0RlRFYSt1VkxRNmk5N0VnVlo0bGNHc3ZCQWE0bFRVaWsrYXZ0K2Q0bENk?=
 =?utf-8?B?M2R4MlhiaGwzUDZocnVZMCtibGJGTjRhY2tmeXowWjBjTFUrWlFjbnJ0VWFW?=
 =?utf-8?B?ZDl1SUZOVjdYMWlpQ2RxQkhCTU1Wd2xWcjhHbHZMMWlPQWgyS0VlKzBBdHFK?=
 =?utf-8?B?cGxJWTdyeERXOEpKemYwL0djSG4vWFFSRXNhbGxkOCtsdzBGNkNQUFJXd09Q?=
 =?utf-8?B?OHZRWUdXeis4YVpjQVlMMmdJbVBtdUtRYytlQXFpRmxXZFNoNUJCS2YvOE1s?=
 =?utf-8?B?SGJwek9RQ3NUcUFtMzV1MmNER3hiakFGcFY3Vi9UZFcyU0hWWWE5WEdGeGla?=
 =?utf-8?B?dDJ0QnR5OXlmMTJuNmtpWTU4WThtK21tbHA5M2orbWNkRXZKMWxlejNmN0lk?=
 =?utf-8?B?SnEvRHYxcTdzalVTM0x2aFB1QWdNMTNVNk9ERkcvVlJlY0xwM1l6YlJhT2k3?=
 =?utf-8?B?b2FrZGttS0VEZHZQU3hGWjJzY0tJckx0MXVwcXJzNHVNRHFwVkpLbUsxRTM4?=
 =?utf-8?B?SjQwcWZjc0ljL0tSbzlSTWtOS0NvTHJjNVRJM3IzS2dOSndNRFI0OGZQQmlj?=
 =?utf-8?Q?r2D+ZN8IdTaaNEIQDDB7MdBdz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e155f7b-fc7f-42f8-89c3-08dce9bdedfc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 06:28:33.3922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVqekAvzejeFm5w7LsMusBKgWZ7ms/79fvSg5RZxGpeg2MUI1qO86vq6rfaEIexpLPCv6k6eIxxFXJRXIHpm6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
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



On 10/10/2024 12:23 PM, sk.anirban@intel.com wrote:
> From: Sk Anirban <sk.anirban@intel.com>
> 
> Implement test test-cpg-basic to validate coarse power gating status
> using a suspend cycle.
name has been changed

after S3 cycle

> Add test toggle-gt-cpg to check if GT coarse power gating is up when
> forcewake is acquired and down when released.
> 
> v2: Address cosmetic review comments (Riana)
>      Fix suspend state (Riana)
>      Add exit handler for this test toggle_gt_cpg (Riana)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 98 +++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 772fe9b57..54a8c62f7 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -63,6 +63,12 @@ enum test_type {
>    * SUBTEST: toggle-gt-c6
>    * Description: toggles GT C states by acquiring/releasing forcewake,
>    *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
> + *
> + * SUBTEST: cpg-basic
> + * Description: Validate GT coarse power gating status with a suspend cycle.
> + *
> + * SUBTEST: toggle-gt-cpg
> + * Description: Toggle GT coarse power gating states by acquiring/releasing forcewake.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -317,6 +323,87 @@ static void toggle_gt_c6(int fd, int n)
>   			     "Power consumed in GT C6 should be lower than GT C0\n");
>   }
>   
> +#define RENDER_POWER_GATING "Render Power Gating Enabled: "
> +#define MEDIA_POWER_GATING "Media Power Gating Enabled: "
> +#define POWER_GATE_STATUS "Power Gate Status: "
defines are not necessary. you are using the string only in one 
function. Keep it local
> +
> +static void powergate_info(int fd, int gt)
> +{
> +	int dir;
> +	char *str;
> +	char *render_substr;
> +	char *media_substr;
use inverted xmas tree order. Define all char* in one line
> +
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	str = igt_sysfs_get(dir, "powergate_info");
use igt_debugfs_read or __igt_debugfs_read

> +	igt_assert_f(str, "Failed to read sysfs attribute\n"
> +	render_substr = strstr(str, RENDER_POWER_GATING);
> +	if (render_substr) {
unnecesaary parenthesis
> +		igt_assert_f(strncmp(render_substr + strlen(RENDER_POWER_GATING), "yes", 3) == 0,
> +			     "Render Power Gating should be enabled");
> +	}
> +
> +	media_substr = strstr(str, MEDIA_POWER_GATING);
> +	if (media_substr) {
same as above
> +		igt_assert_f(strncmp(media_substr + strlen(MEDIA_POWER_GATING), "yes", 3) == 0,
> +			     "Media Power Gating should be enabled");
> +	}
> +
assert at last to avoid any open dirs.

render_substr = strstr(str, RENDER_POWER_GATING);
media_substr = strstr(str, MEDIA_POWER_GATING);

free(str);
close(dir);

as assert doesn't require any directories to be open for this test

> +	free(str);
> +	close(dir);
> +}
> +
> +
> +static void powergate_status(int fd, int gt, const char *expected_status)
> +{
> +	int dir;
> +	char *str;
> +	char *status_substr;
> +
use inverted xmas tree order. Define all char* in one line
> +	dir = igt_debugfs_gt_dir(fd, gt);
> +	igt_assert(dir >= 0);
> +
> +	str = igt_sysfs_get(dir, "powergate_info");
same as above
> +	igt_assert_f(str, "Failed to read sysfs attribute\n");
> +	status_substr = strstr(str, POWER_GATE_STATUS);
> +	while (status_substr) {
> +		igt_assert_f((strncmp(status_substr + strlen(POWER_GATE_STATUS), expected_status,
> +		strlen(expected_status)) == 0), "Power Gate Status Should be %s\n %s\n",
> +		expected_status, str);
match the parenthesis
> +
> +		status_substr = strstr(status_substr + strlen(POWER_GATE_STATUS),
> +		POWER_GATE_STATUS);
> +	}
> +	close(dir);
> +}
> +
> +static void cpg_basic(int fd, int gt)
> +{
> +	powergate_info(fd, gt);
powergate_info doesn't seem right.
check_powergate_status / cpg_enabled?
> +	igt_system_suspend_autoresume(SUSPEND_STATE_S3, SUSPEND_TEST_NONE);
> +	powergate_info(fd, gt);
> +}
> +
> +static void toggle_gt_cpg(int fd)
> +{
> +	int gt;
> +
> +	xe_for_each_gt(fd, gt)
> +		powergate_info(fd, gt);
> +
> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> +	igt_assert_lte(0, fw_handle);
reorder powergate info below under this for_each_gt

Thanks,
Riana
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "up");
> +
> +	close(fw_handle);
> +	sleep(1);
> +	xe_for_each_gt(fd, gt)
> +		powergate_status(fd, gt, "down");
> +}
> +
>   igt_main
>   {
>   	uint32_t d3cold_allowed;
> @@ -380,6 +467,17 @@ igt_main
>   		toggle_gt_c6(fd, NUM_REPS);
>   	}
>   
> +	igt_describe("Validate Coarse power gating status during suspend cycle");
> +	igt_subtest("cpg-basic")
> +		xe_for_each_gt(fd, gt)
> +			cpg_basic(fd, gt);
> +
> +	igt_describe("Toggle GT coarse power gating states by managing forcewake");
> +	igt_subtest("toggle-gt-cpg") {
> +		igt_install_exit_handler(close_fw_handle);
> +		toggle_gt_cpg(fd);
> +	}
> +
>   	igt_fixture {
>   		close(fd);
>   	}
