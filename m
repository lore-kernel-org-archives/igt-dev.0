Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEBECCFA18
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 04:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5980A10E319;
	Tue, 11 Nov 2025 04:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SCsZ3v3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4310E319
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 04:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762835930; x=1794371930;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wsB/iuyJd1kQ9RMk0OKNYcO2+ovjCDG9HSgFi1Nnrr0=;
 b=SCsZ3v3YWUE3NoR+mpjBBB9mgvXE+R8jfAs5dU7PYroXCUEuLCvTlGg4
 i4lSc0ZT2r9FlIIl6ppV9erdnKTF/aF8CfLfcBKM6ArzPeLMEJTNfpyde
 AwrrG2MS/JtFJfltdNzBPVrsFapEqmVF3VZm4oX3Ztn6lmiYQ8EECyret
 NS8GAP0AxQtuYM3m829k3xSid02JZsyIyqbCJb20xIioM5Tek3Un1t1iQ
 FaLlwsIQSQsnjDsrdBH6ofUUJ12qgFb1/WhSHiTH8+biKNDVEKwOHBKKP
 6KfwShtOu9L1b5d50XDKbp2gXVcqmSX3l/EoFxYX03yx5fLuV/Js3XgSF Q==;
X-CSE-ConnectionGUID: 63Kjm0O1QCeNxe12CnMsyw==
X-CSE-MsgGUID: luPOr8ABQDGauOFPf7XYHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76346665"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="76346665"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 20:38:50 -0800
X-CSE-ConnectionGUID: RA/DaFtNQXmzU/Ff4gZB0A==
X-CSE-MsgGUID: YYdLR+vFRQKMuCsyk46sQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="188700672"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 20:38:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 20:38:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 20:38:49 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 20:38:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOGg+7ASqT7KCeFSVBuovc7aze44zu9oS+F0A1iBaL97JjO4FSExw24qKfdZdITJ04XCepxA6pAKnfoQ27Z7bkneBEvaYXUXAm9zPPBUurqBxWWSMWo0Xzfr90wTtVXv5sl+Pw4h98Y/+J8ZrEkwR85xn1baYkt8/s2ePeXZabB0f6YsK4ZrEIRmo3Jwx+iMvoLnqe7ULr/OHE1GQ1zzYWUwCivHSsAJPWXteo4yhxAgJXgLRZOP+xWz7KzG8m+5aK7Gdu7bGu7qAcxfO2Kh+yXbu/DwFqC93RK077I5bVJy11woE4RKmSchkCnbKEZ0z+Tqh8F4zYwRVA6wJ3taGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+stOO5JSrs/RgbB40XTj4zy/9jJmoXAtoph8cF6pCv8=;
 b=yn8Tor40Pi0DV0TI0u8yXwm4FpYgN+EVaiRyztEj/+LhWIwtFoEAPKZHTBo1x6aBmMP4f55cLtoch9ctABcxYHDyA40TCKDF8kiFeXW3uWSIGX7l0dRRjznIJBCmIRsJWd01EwoZuzROT+9/PLuQ9kIB0QxxNEKnFO21hVxrnDurRf1t7yrfodIg14aAfn+H9TGLr2K/2wKJrMUjScmzc2xMmUGP4ZQc+cHpudOuAxS2vaUVsv32YV2RQbWu8HmvqdBkEOfGqGAQKiHgzQeGAi53V9iUSlE9GnmKjK58EEfILAN5StwI+xnNUtQEJaI0U5R+F1DJFlv20Z8+71XEQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH3PPF6CF64E2E6.namprd11.prod.outlook.com (2603:10b6:518:1::d2b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 04:38:46 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 04:38:46 +0000
Message-ID: <fc6e1ecf-cc4a-48ca-9b53-94ddf3d65de8@intel.com>
Date: Tue, 11 Nov 2025 10:08:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_joiner: Cleanup igt_require checks
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251111041505.2438654-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251111041505.2438654-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH3PPF6CF64E2E6:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c13ac3-45e0-49ea-414d-08de20dc33ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVJ5YjFiSkRoS1cxQlh5eHIxYzNZWWhsZWRVZS8wTGJOcnE0bVArT24wQkt2?=
 =?utf-8?B?UVBmZk40enFkemZiM0Y4V3RlTnczYjBoWHFhS1hhM1U2dTNGdnhFTXhHM0px?=
 =?utf-8?B?MkJMRFNnbEdMRjY4dDBHdkwzU3BqdlFmOG01bjNSMHJPalJZRFJLcXYzRjlo?=
 =?utf-8?B?R2ZWNEcySmtVOEtCcDdqRVBDTVFGMWhrVzJiOW81UWFqRWllbDRHMUlGeEg4?=
 =?utf-8?B?RFJtN3QxWVVmZWFGOVRnRjBseGhISUJOc25qZVlkVEorc0I1YUNXa213MzZx?=
 =?utf-8?B?aWFHa1g5clc3NVRsVXRVaHRwellrcDdTSzhVcWxVY1RKL0pwWXh3NVlNUWwx?=
 =?utf-8?B?RHNUdXg3Y202RXViR3I0eWxrTytBMXh3TnVwLzYzNXUwNWh5RFAyZkxLdkpx?=
 =?utf-8?B?b09ERVdyVy9uVTJka0poeWRvUndqa2tzS2RQbmJ1UUJMc3J3UWUxZnlodVpE?=
 =?utf-8?B?aDVoQjdaQ0ZERjIzSktCa1RlNDNyRHh1MVFxMmhFWjYzT2tDUkFZOEFLMmtY?=
 =?utf-8?B?RW0vcmlzbkJWaUpQb0VPUkhRNTF4L1JYdkhLa2JnM3dhOFB5NUZMNk5COVYy?=
 =?utf-8?B?QTYwN25XQWkrQTh5dE1MNnQ3dmRCU3lUSVBFNmN6ZWEzZGdhUC9YdEhLUnlF?=
 =?utf-8?B?QmNsZXVKNjJVRGV5d3J1NW40M25iM1psTkZCUktHa3lWTkQrSldwdUdWYmor?=
 =?utf-8?B?d2RDV2xTN2hNRnA1ajNQOWhYWlMyOVovaE9Cd3NxK0RqeE5QOVozYjdiZjdp?=
 =?utf-8?B?SWUyZjdZeG9xRmRUWHR5VXg3ODRBRWNXU3QrNTZhTWs5eEZlTlEwSi92dGp6?=
 =?utf-8?B?eThTT3JNQUU2Wng5bDl6ZVFibGRqZzJ6ZUQ3RHNRbHdQR085L3pPM2huaW1i?=
 =?utf-8?B?TUVyM21iYVcxNlZYVG9mcGtTd0NzcGVGT1JLbkhRR1hBdDN5YXJhaVg1SHVL?=
 =?utf-8?B?UlcxR0VXTUU4U3hYV1REbWFJR3RJT0RBdS9va0hUQXJzdjRsSnpwbnlkc2VI?=
 =?utf-8?B?R0liVm5zNE9mcUFncmtDM3F0U05ZV09Gck15OGJ5QWUzc3VidTc1S09YWGhS?=
 =?utf-8?B?WG4ybUEzdkJrRWFieUpIQ04raFZ4OE1GVkhkME5ZL1lGZFMzcE5mUXMveCsz?=
 =?utf-8?B?UEk0dVp0UlZJUHFKMkFEYkx5NWFHREx1Z3JDTWVsRGNWRDRoa0thUHN6QXkv?=
 =?utf-8?B?MHg0WGdRd1BPdDlnU0srYVZhYVpZZXZ3RkhrZ1ZiSEg4WVRnS3JSbXRSYzBv?=
 =?utf-8?B?SE1kZmdDNTUzRjJwTU1NQzh3TmVadDZXcytFUUo1dU9ud2ozSVBwdkdKeWhy?=
 =?utf-8?B?aVAyZkt2R1FnYTlhaGVFTFdGd0psZytOdHVleHRqdXR1Q252RGRHcEZZWW5p?=
 =?utf-8?B?eDNWZmNockU3OTdDRkdKNnZsNThjU2tiT2lFbStsMFd0RVk4V1Z6VDNPQzNL?=
 =?utf-8?B?cE8xS21rWkRlQzV0ZkZzRUEwUVBCM0RLd2N3WWwxWW1RTlVxc2IzZXJLcUtl?=
 =?utf-8?B?Q0pLTGZNUFNDUVMvOEFneFdoMk9kWkRrRDVNQXF2MjVQL3A5aHBWeVUzb0ZB?=
 =?utf-8?B?Q1NQUXJEcFZHWXBrcWdZZE85RW5tdkhGcktPbENyMytCOURsQUcxMnJiY2tP?=
 =?utf-8?B?OVNha1RZYTdVZ3ZQTUVSUU51dXd4TE0zUFZQdWtLK2hnem5nNldCbTI0K0hr?=
 =?utf-8?B?TmFPRkRGVkFhTmFhR21FbUxjM1NvRjlXd1g1OFZtbUI3Vit6WGF5WWdRRmoy?=
 =?utf-8?B?RDYvYllrUjNwbXpzUUZaZ3c1KzhQNmFWczdsajVzaUVaZ1l0WVNnaVJ5ajIr?=
 =?utf-8?B?eEZRaHpKbDh5OVBuSEk5YjRXN0E1M1lNMEdGT2FTOG54ejBaK1hXbm9Kejhn?=
 =?utf-8?B?c2ZVWFNNU29LcWhaWitVbEVKa1JBY2R0SSs0UTZpdjJLRVVkZFZmNlh3TGVT?=
 =?utf-8?Q?kjjJMelOuGSxZNjd/k62pazlgNPMKcAD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm45ZVlzWlZCM2k3UG80ays4VVFoeTdySGtTV2lRbHFzM3Y5M3RhYjBGSXp3?=
 =?utf-8?B?OEVHMkI0Mjl5RHVMNk9Jd3dMMGo0UHUwZnllbUczSkNlWlhWdjdwODdhMjRL?=
 =?utf-8?B?WE5yVG5NVUFUc0FRdDVaRVZHMTlNZk5FdWdyOStES0JybjRNWXhoaG1NdVJO?=
 =?utf-8?B?bDVaVktsOFcxb3lGTmZ6WFdxZDJLNTVBV0V2RjlLeC9QdGJiVHBmL2NibCt4?=
 =?utf-8?B?aFB0R2QvNlZPaWsyVE8wNnhiQ1ZSbndOZnFVM2ZSeExkUm9rcG5hNlNJOTcy?=
 =?utf-8?B?RjFPdEUrTndUNWtsM3FPODJiS2djYWcydlRlNENwYndZaEdBS21WVkRWcVhV?=
 =?utf-8?B?bXpxaWZEa0VWOWNzT1dUSjZ2Q2dQelNIdnRIclZsMHdQN00wa0pxeS9xbU92?=
 =?utf-8?B?SlZSZWFNOUdLNHhCZmpHWHhiaHBuVG1NUGxCT2V5WmYwWkNaQmZaU3lHcGFR?=
 =?utf-8?B?Z2E3YUsvN1pScnNUTWRGN1o4Q0hhZ29EaE10WnE4OUErd1gvWjM1ZWY1QnRp?=
 =?utf-8?B?c0plaGZOY1F3OC9Pc2IvVjZUUGsyV3FDUnJxSkZENDYvcGI0QUQydDQ2ZndJ?=
 =?utf-8?B?MlBPZ2VsN1lTclZBWndzWnN2TTUxaEo5TE5DUk1NRkpqN2hpLzNQeldGa3Vx?=
 =?utf-8?B?Ly9PSThPOWQ4Zng1Tys3VStnTG13bU5hTzRsRTNmdmZ1enFldDQxRWZ6ZVVa?=
 =?utf-8?B?bTNXYUloaXdYRjUvQitKUUhOTVcyR05ROEs2OTdpYTRTVUQ2Z1RWOVRuZ04v?=
 =?utf-8?B?dUdKWTV6SEdHaVdSZ1BubmdRbklOL2tEdnJ2YUNYWFh5MEpZK2E5ekNjSkE4?=
 =?utf-8?B?VEM1MzBrZVBTMW9Tbk5RNEkwc3JudzF6dENoaGlUMVFRRTMxbm56L2ZlcGVX?=
 =?utf-8?B?UFRnV05RSVpoSlQwT1B3R2tMWEdGY2xRNGg4c3hQWHpRQ3F3dVBpUjQzVjR6?=
 =?utf-8?B?RDNzWnJNMHhEcFpKV2VtN1MwbHEvVmgvTmYyQmdBZ09GWVFaRFB6Z1hWTVJD?=
 =?utf-8?B?TWJqdmNsNkVKL0NlRU9iMGc0UVVIQXB1cGdZUElEZ1dMM1EzYmJSSGE4di9X?=
 =?utf-8?B?R0Y3NlFWTTZOT1lGLy94enpUSWUwZE9hU1ptUmpENmZQRUpQYjZNdWJWMmFn?=
 =?utf-8?B?cnN1VDQ0R1lTd1g3UWw4SVFRWnRoS1JBbHUrVzU5NHIra3ZoZ1U1SnFoNER5?=
 =?utf-8?B?TzZxZzZ5WUJoalJoRWkvR1luUm9ZaXlQSnNuYlpRUzR6RFJtVzNVaDVKUDVT?=
 =?utf-8?B?NmZqUTNUMkI1Mm54WWd3S0MrQ0QzWmFUQVJxS1lXb2R4V1ppY1dKT3pYbTdi?=
 =?utf-8?B?d3l1cHBObGtLUkdlMS9NTGFkQ25RMkh1ZGt4cnQzYjl2dzZzZWlEY3VtMFBY?=
 =?utf-8?B?Z0xSZzNzRmpXZ1E5M0w3NHNoeVRYYlQwbGZZNENPNndRRXJqZ0ZscmFkTGJ6?=
 =?utf-8?B?SDZtYzBvR1hhK0ZMc3k3cHpQWWF5SVY4VEU1a0hTSmpGcDhwbG1JU2NnMVg4?=
 =?utf-8?B?amlISjQ0NmpMZjMvM1ZzNFIxNHpUcEY2RktDektQYkk1Y3UyQzUvMXorZElj?=
 =?utf-8?B?aUpFTUZUWnpVYnphQkNGMnNYc2Zsa293UTh0TjJvN3hPLzVaenhHL3NZRnR1?=
 =?utf-8?B?U3h2aVZBRy82NmxOK3A5WXltc3BtMGZzamxYNmk5R2o1TXdnVTdaR2xKSFcz?=
 =?utf-8?B?Y3Z3VHovb2pCOFFvOVdMdGJTeWdpS3h1NFBFZytLaDRBSUdXWmlVQlJXN3N3?=
 =?utf-8?B?Wnk0UFJnc3ZOajNpSzd5ME9JOHhBT1M4c0c3RTNXUmZNY0t4V2EyYUxFMyty?=
 =?utf-8?B?eDZFc1B4U3M4dndUVUZCaXlydnFKMFNpVUhpUWR1L2dHei9uUkJYcEJqM3kw?=
 =?utf-8?B?aURFbTR2aC8zRXg0QW5MNUtNNlordUUrWGZQU0FJcHVkeUFrTjg4aXNOcm5J?=
 =?utf-8?B?VkZkL3VOeDE1aEZHemZUcWdjWmdCVm5YT0pZZWs2U3pneFVHZ0lvTGVmUDcz?=
 =?utf-8?B?bHZ1djRIeFc4VUtFRHdzbFk4VG5mb1RUa00vT1dlYm9OZGdnUXdUK2w4eUJS?=
 =?utf-8?B?dXJEOEhQRGtyOVZ4cFFKS1A2dmNSZHhYcjlWbEZyc3JudnpaaVlUWkUyTFJC?=
 =?utf-8?B?WDBKd3kvZTh4WjRYZWtaZkVHQW5hcTNnOUdicVhpMHc1Rzgzbk56RHZpR0w4?=
 =?utf-8?Q?Z73WaXJDz6muEHDGUEctfLE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c13ac3-45e0-49ea-414d-08de20dc33ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 04:38:46.6320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZvpjjOm/+FSmTRKamsjC3Cku41ZmKdixNtWqtFXNtov8xekAPwHBNm21T7IGaXXf0Kcm8MwWOixArYEaD51dkM1wTiRPMjL5Ge97vhA3ZuyxzZITOMIXZHvVHn2axQi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF6CF64E2E6
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

Hi Karthik,

On 11-11-2025 09:45, Karthik B S wrote:
> Both the main and invalid subtests of each category require the same
> igt_require checks. Add these into subtests groups.
> 
> Also, the variable names used in igt_require checks are self
> explanatory, so remove the duplicate print messages.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 225 +++++++++++++++++++--------------------
>   1 file changed, 108 insertions(+), 117 deletions(-)
> 
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index d1ddbeb60..654ff8bed 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -626,160 +626,151 @@ igt_main
>   		}
>   	}
>   
> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic-big-joiner") {
> -			igt_require_f(data.big_joiner_output_count > 0,
> -				      "No bigjoiner output found\n");
> -			igt_require_f(data.n_pipes > 1,
> -				      "Minimum 2 pipes required\n");
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(data.big_joiner_output_count > 0);
> +			igt_require(data.n_pipes > 1);
> +		}
> +
> +		igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +		igt_subtest_with_dynamic("basic-big-joiner") {
>   			igt_dynamic_f("single-joiner")
>   				test_single_joiner(&data, data.big_joiner_output_count, false);
>   			if (data.big_joiner_output_count > 1)
>   				igt_dynamic_f("multi-joiner")
>   					test_multi_joiner(&data, data.big_joiner_output_count, false);
> -	}
> -
> -	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic-ultra-joiner") {
> -			igt_require_f(data.ultra_joiner_output_count > 0,
> -				      "No ultrajoiner output found\n");
> -			igt_require_f(data.n_pipes > 3,
> -				      "Minimum 4 pipes required\n");
> -			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false, false);
> -	}
> -
> -	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> -		     "when the pipe is active with a big joiner modeset");
> -	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
> -		if (data.big_joiner_output_count >= 1)
> -			igt_dynamic_f("big_joiner_on_last_pipe")
> -				test_joiner_on_last_pipe(&data, false);
> -		if (data.big_joiner_output_count > 1)
> -			igt_dynamic_f("invalid_combinations")
> -				test_invalid_modeset_two_joiner(&data, false, false);
> -		if (data.mixed_output_count)
> -			igt_dynamic_f("mixed_output")
> -				test_invalid_modeset_two_joiner(&data, true, false);
> -	}
> +		}
>   
> -	igt_describe("Verify if the modeset on the other pipes are rejected "
> -		     "when the pipe A is active with a ultra joiner modeset");
> -	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
> -
> -		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> -			test_ultra_joiner(&data, true, false, false);
> -		if (data.non_ultra_joiner_output_count > 0) {
> -			igt_dynamic_f("2x")
> -				test_ultra_joiner(&data, false, true, false);
> +		igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> +			     "when the pipe is active with a big joiner modeset");
> +		igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> +			if (data.big_joiner_output_count >= 1)
> +				igt_dynamic_f("big_joiner_on_last_pipe")
> +					test_joiner_on_last_pipe(&data, false);
> +			if (data.big_joiner_output_count > 1)
> +				igt_dynamic_f("invalid_combinations")
> +					test_invalid_modeset_two_joiner(&data, false, false);
> +			if (data.mixed_output_count)
> +				igt_dynamic_f("mixed_output")
> +					test_invalid_modeset_two_joiner(&data, true, false);
>   		}
>   	}
>   
> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "No non big joiner output found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum 2 pipes required\n");
> -		igt_dynamic_f("single") {
> -			enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -			test_single_joiner(&data, data.non_big_joiner_output_count, true);
> -			igt_reset_connectors();
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(data.non_big_joiner_output_count > 0);
> +			igt_require(data.n_pipes > 1);
>   		}
> -		if (data.non_big_joiner_output_count > 1) {
> -			igt_dynamic_f("multi") {
> +
> +		igt_describe("Verify the basic modeset on big joiner mode on all pipes");

Please update the description to modeset on force big joiner> +	 
igt_subtest_with_dynamic("basic-force-big-joiner") {
> +			igt_dynamic_f("single") {
>   				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> +				test_single_joiner(&data, data.non_big_joiner_output_count, true);
>   				igt_reset_connectors();
>   			}
> -		}
> -	}
>   
> -	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum of 2 pipes are required\n");
> -		if (data.non_big_joiner_output_count >= 1) {
> -			igt_dynamic_f("big_joiner_on_last_pipe") {
> -				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -				test_joiner_on_last_pipe(&data, true);
> -				igt_reset_connectors();
> +			if (data.non_big_joiner_output_count > 1) {
> +				igt_dynamic_f("multi") {
> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +					test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> +					igt_reset_connectors();
> +				}
>   			}
>   		}
> -		if (data.non_big_joiner_output_count > 1) {
> -			igt_dynamic_f("invalid_combinations") {
> -				enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> -				test_invalid_modeset_two_joiner(&data, false, true);
> -				igt_reset_connectors();
> +
> +		igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> +			if (data.non_big_joiner_output_count >= 1) {
> +				igt_dynamic_f("big_joiner_on_last_pipe") {
> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +					test_joiner_on_last_pipe(&data, true);
> +					igt_reset_connectors();
> +				}
> +			}
> +
> +			if (data.non_big_joiner_output_count > 1) {
> +				igt_dynamic_f("invalid_combinations") {
> +					enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> +					test_invalid_modeset_two_joiner(&data, false, true);
> +					igt_reset_connectors();
> +				}
>   			}
>   		}
>   	}
>   
> -	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "No non ultra joiner output found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum 4 pipes required\n");
> -		igt_dynamic_f("single") {
> -			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -			test_ultra_joiner(&data, false, false, true);
> -			igt_reset_connectors();
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(data.ultra_joiner_output_count > 0);
> +			igt_require(data.n_pipes > 3);
>   		}
> -	}
>   
> -	igt_describe("Verify modeset switch between ultra joiner and big joiner");
> -	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.ultra_joiner_output_count > 0 ||
> -			      data.non_ultra_joiner_output_count > 0,
> -				  "No ultra joiner or force ultra joiner output found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum 4 pipes required\n");
> +		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +		igt_subtest_with_dynamic("basic-ultra-joiner") {
> +			igt_dynamic_f("single-joiner")
> +				test_ultra_joiner(&data, false, false, false);
> +		}
>   
> -		for_each_connected_output(&data.display, output) {
> -			switch_modeset_ultra_joiner_big_joiner(&data, output);
> +		igt_describe("Verify if the modeset on the other pipes are rejected "
> +			     "when the pipe A is active with a ultra joiner modeset");
> +		igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> +			igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> +				test_ultra_joiner(&data, true, false, false);
> +			if (data.non_ultra_joiner_output_count > 0) {
> +				igt_dynamic_f("2x")
> +					test_ultra_joiner(&data, false, true, false);
> +			}
>   		}
>   	}
>   
> -	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "Non ultra joiner output not found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum of 3 pipes are required\n");
> -
> -		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> -			enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -			test_ultra_joiner(&data, true, false, true);
> -			igt_reset_connectors();
> +	igt_subtest_group {
> +		igt_fixture {
> +			igt_require(ultra_joiner_supported);
> +			igt_require(data.non_ultra_joiner_output_count > 0);
> +			igt_require(data.n_pipes > 3);
>   		}
>   
> -		if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
> -			igt_dynamic_f("2x") {
> +		igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");

Same here, Please update the description to modeset on force big joiner

With this,
LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> 
+		igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> +			igt_dynamic_f("single") {
>   				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> -				test_ultra_joiner(&data, false, true, true);
> +				test_ultra_joiner(&data, false, false, true);
>   				igt_reset_connectors();
>   			}
>   		}
> +
> +		igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> +			igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
> +				enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +				test_ultra_joiner(&data, true, false, true);
> +				igt_reset_connectors();
> +			}
> +
> +			if (data.non_ultra_joiner_output_count >= 1 && data.output_count > 1) {
> +				igt_dynamic_f("2x") {
> +					enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
> +					test_ultra_joiner(&data, false, true, true);
> +					igt_reset_connectors();
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_describe("Verify modeset switch between ultra joiner and big joiner");
> +	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> +		igt_require(ultra_joiner_supported);
> +		igt_require(data.ultra_joiner_output_count > 0 ||
> +			    data.non_ultra_joiner_output_count > 0);
> +		igt_require(data.n_pipes > 3);
> +
> +		for_each_connected_output(&data.display, output)
> +			switch_modeset_ultra_joiner_big_joiner(&data, output);
>   	}
>   
>   	igt_describe("Verify the basic modeset on the maximum non-joiner mode across "
>   		     "all pipes");
>   	igt_subtest_with_dynamic("basic-max-non-joiner") {
> -		igt_require_f(data.n_pipes >= 1,
> -			      "At least one pipe is required.\n");
> -		igt_require_f(data.non_joiner_output_count  > 0,
> -			      "No suitable non-joiner mode found\n");
> +		igt_require(data.n_pipes >= 1);
> +		igt_require(data.non_joiner_output_count  > 0);
>   			test_basic_max_non_joiner(&data);
>   	}
>   

