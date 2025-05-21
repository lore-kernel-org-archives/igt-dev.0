Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346FBC54E71
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 13:57:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C0210EC73;
	Wed, 21 May 2025 13:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKG/RkW2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48CB1124BD
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 12:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747831465; x=1779367465;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qfvGJ/keClN7wjAY85NOtXeM0aNmlgnJyIt0b3LGRS4=;
 b=ZKG/RkW21+5DDSnf8GKWic0HMD73QjjGgsuXk6nagxA980BVok59xNmy
 6QBmPq7RS90lS2KwImy3N3yWLFcaVN4rpiqfFW45vV0OZqRXxjWvydzC2
 U4iaSsqRRGV40iwvR39IGfXdLNhhxIiyPO1go0chYTwnhM7ZiJdOOrcmr
 vGHCTWPO8fi/HlTvGzfpOYNt+w6mI9dcHgRMN1cJP2n0mzaZPGUUF61Yy
 ojYTQkuUOPIfCNye2aOERYCG1Bb/FxfBWbr86YbltlmWUf79bzIVGdGwd
 ywp4Tf3ejcEjgN3igO/3wuCkqhF06+bbWS3vcRoy1g7zsE5GgMwp5Wp6K A==;
X-CSE-ConnectionGUID: +OEuEVktQueHFQQ37f9n0A==
X-CSE-MsgGUID: U7oYtThOQiulMGAZ+U+38Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53471335"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53471335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:44:17 -0700
X-CSE-ConnectionGUID: aRsoHCknS0+GVecMh5s2+A==
X-CSE-MsgGUID: 2Ff2V8jMRISX8pbNoziMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139908088"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:44:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 05:44:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 05:44:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 05:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ib1oxDXkfI1vxqFuhMi5wWL22dU0Q0yG+ImCPiOibtsUBS/D8A0lotwXm6VCN1TE/7rXdfLwRqIFi0gtvDO/hnC7e3d2DPXEz/4lAcnspThzOhLazgBF4E4Fv+aPKYTO1lxZDnC7Hi13JzAs1WxLhUoWsHw390ufQtvqWfxiemUCxG5jOMI5Se2dzW/GY5H+jnfJs3UIHjV/iWSiNHTpgjD20KnU2Dpm/SaRQYgTXxR7KsnZN5IcoChVZzrl4TIYQG8hFDLJ0OfeazUY/fslryIfxmzoJ2rsSycXU4B7ZhSRoW0CpzLaoNEaNZVKEWgt6AE3wYw8T1Pp9qRpVb5fkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1W+L9a11pNfU9Q/ZFTBQPljqb1KirmYbuZ9k6UdhcKk=;
 b=zCm56b2DPMthGR8WIHGH49MMtxyiI1oUXAyhLBM/08nYcXhIQXaN1YdnFhkQOsLt8TWC2C325nLfa+0gTlsF1buw2D8HjnwQmed8G6r1laDsJPKJIRhrfwNwRdUJ9EpfRl4FGrHgtLsuwVOW3JXekdrNlvrt90soHCpOJE0ZDPl7MAN5Y1v6YbIVx2Nb8b7iV0WYJ//eTYZug3rwDxUN+KbNznqoVpmk6/Oe9jTn4v4Nmdw+azZRL9JBzo3+xW+yAmR97i0DYZaBhlLoR6huQOmnGlBmODyV9NQxWeY1vmORkUgynuR5lqDfi6Z2LgPQW/3NhmB0vHTW3Yz53jlNVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA4PR11MB9106.namprd11.prod.outlook.com (2603:10b6:208:55f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.34; Wed, 21 May
 2025 12:43:54 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 12:43:53 +0000
Message-ID: <b48c3a76-204b-4b64-a2a2-90e3d7624c16@intel.com>
Date: Wed, 21 May 2025 18:13:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
References: <20250521105308.4179637-1-santhosh.reddy.guddati@intel.com>
 <20250521105308.4179637-6-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB612965E12B4493B74F63F0D7B99EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SJ1PR11MB612965E12B4493B74F63F0D7B99EA@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::13) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|IA4PR11MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 40894de6-9274-4ee3-f550-08dd986524e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW5tWVdkYzJkTWVVbFpBM0VDUXl2TUp4akFqUWpxQ1BwSlBPZlBwaGRMUVdn?=
 =?utf-8?B?MzVURnp0TXhZSjhnQW9GV1hRQ3VzeC94R0dNZjFMN2M3VHZQNmp2V2l1UVU2?=
 =?utf-8?B?dWpNZVlrTUo2WW5yM3JvYzdJTkt3dmxyOFNQdUV4ZUpRdjNJRVBTdlgwQ3E3?=
 =?utf-8?B?akFlRnhzbFc5Um5DVlhyUjJrbkhyTnJ4NzEvUlJCMWtpRFJ1R0FWVHdRL1pw?=
 =?utf-8?B?dkJialR4d2RWZ3RTb2FXaWlDZ2ZhaUhBRFhzcHBDdktxL0lKa3dlWWhoaDZr?=
 =?utf-8?B?TE15ck5zK25UYm4xQUxmTTdhUzYrTnBOTnQ1TkZQZkk2ZGhxZ2ExZWhlcFpl?=
 =?utf-8?B?WjlDVzJRZUlKbFNONUZaT2pTaGZqV3EzRzlVV0tzSkJ3OXlybUl0YkIzUDFQ?=
 =?utf-8?B?bHNhVlFmMi9VNE56UlZTMlNpVlh0ZlBXdXh2VzgrZzJtU0pzZTFBa3VnSEVl?=
 =?utf-8?B?N0pWWmtiR3dHc0hGcjk0Qmo2TzUxSEYxaTlMVmZGVzlaS2MwRWlDSWZ2bURp?=
 =?utf-8?B?d3BadXNpQy8zTjNva0V5VWJBTGV6U2FKanVTZVZwSC9HR2VUNHM3Z3NYQnVQ?=
 =?utf-8?B?R290VHpoU05oYy9qUlYxQ0ovMmRlS1lKRXVBcS9od09sUWlLc3NsZTJYbkMw?=
 =?utf-8?B?MmQ0Z09uUHhlN25vSGlLSXNLR04yeVh5MWdQZzFBcVMwcTV4ZEV0VXNBU0Rz?=
 =?utf-8?B?ZWtDZ2Z5dzlseFFIUW43dXpWbis4RUZtKyszajBLM2QvQVpCcUx5RVJ3ZVlE?=
 =?utf-8?B?TElnNEVvbWVYRWd3TjA1VHZJaVRmQUNLcmIvRXZ6ME9hVzduNGlQa3ZBY0NU?=
 =?utf-8?B?R2dIWTU1bHNEUW9LN3h0elpFUGhPNytYdi90aWxoV3VQM0dmcFdGL29VYms0?=
 =?utf-8?B?SGd3UlpBYWdhZU4wd1Q3RjdTY01GV3phT2JpLy9sVko1REplbC9FQUM5dTNC?=
 =?utf-8?B?QkhWZlNtQmdaSDdHblM1Z1J6N0NmV29jSzR3L2NsVkVRNFRmUlZ6aFhtVVlp?=
 =?utf-8?B?ZnYveUJDRG5uWG54M0IyNlhvWEwrZWhjUnpsd0o1dUFXcFZhVHJzc1NCc1FH?=
 =?utf-8?B?a0J4cldZdGFVV3hVTFpRMlFCY1JvWXkrdFFDNFRhb1dMcC8vTXhEUldxWHhO?=
 =?utf-8?B?Z3NOZ00zN0hCbTVNUGdVNXMxdFo4MjFTMWR3c2NrSVZwMlYxQ001K0RpaENm?=
 =?utf-8?B?cFREdzBrZERISFBrTC9LVEE2MXB3aEdHUUJxSW80c0RsZG9TQUJDZ25kRU9l?=
 =?utf-8?B?SWpnZnphcnVwZFppdS9LRHlzNnlLaWJNK2NTN0JoR2lMOXlXbCsyVHh6eENR?=
 =?utf-8?B?aWRucE1uRFhyby9SMlUzU3JMQUwvUlF3djJBTzUzYU1QK0k0bXZKVkRCUGVn?=
 =?utf-8?B?WDBZWk1qMUhUek96QXM3Tk9EVnZ1N1FGYTFIRExXOWljdktMbXdjZHI2M1NL?=
 =?utf-8?B?TVVqaFBmQXE1T2U1VlR4Y0Vhc0YrN3FUSVQ5aHUvSnl0djJUd1krQmdNQkRO?=
 =?utf-8?B?SHB5bjNTV0publJGcjlwd0xjVG1jNTg3YlUydkZjV3BiZm9BMG0yMXJmanll?=
 =?utf-8?B?enBXS1l1YW5vRU42WEpiL1lnNC8rOFhvbDRSeUJOWlpndjAyTlo5dXBBSXd3?=
 =?utf-8?B?N2x1bHJIK3kvS0c5b0NkWHVhczluUnNVMDRTMFgvY0JUTkN0OVlUb0tBMnVt?=
 =?utf-8?B?YjdRMnp3czI0ZG1JdFNVQUlPQjF1N2Z6dFpSbEI3WVFGZTFVbGZpZnkxVlUw?=
 =?utf-8?B?cG44Nlhha1M1QmJrWCtxTTVpWDd4VVRnbUZGbGRyN2FhSmVpMTdTZkhQZUcw?=
 =?utf-8?Q?axEru3ALtIl7Ynu4hqlgA8j1GjXqJh+G+rY6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1JMSVFWeVAzekI4WFZuUzR1UE5BTGZQdkVEOElIdk1aYnorYTV1TUlpaG0r?=
 =?utf-8?B?S08rMnM5SzBXZGl1cGJFclNaUG5LcWxWazNWOGo1RWwrU3NPSWliamRxSVNC?=
 =?utf-8?B?aUFkZmc2RXl3WElMTkVEYXVURWZITjI4clhKOGs5cDBtVGhuODNxQmNYK3Fq?=
 =?utf-8?B?SWc4dTVVRURjTVJSN0pvSTZVTFpzaFB4aWd1RUYybmpxMW1QU1BFVE84UzNC?=
 =?utf-8?B?R0lZV1JLdGFRNFVrRFdjQW5tR2plOCtwZW9tQ2lwd1ByaUxXTFRQMHJMQytp?=
 =?utf-8?B?QXZKalJYMTU2a0NjMTR4dmhZbWFoNnNiaXM1YlZaOG0wWFBnL0dLWEZDMlln?=
 =?utf-8?B?QmtrTFptekthWVlsMTMwT0NlT0xmTjRnRSs2UzZ1UzdaUXJhWElTMzhSSmFy?=
 =?utf-8?B?Q1JNK2t0MzRUb3hpVE9TekgyUXpFZjZqTFJ2WmYxSzdlZllBcVU1M0lmNFpa?=
 =?utf-8?B?aFVXNThyZjJJQjRwc2VHOEMxUWVRc1RsbExZU2JSV05RRGNONFQwQzRTZWZ2?=
 =?utf-8?B?SFVCTmowMWsvWVlSTEl1VGFYNWN1ck9Bamx1UjFlaHNJNWt6RERhMk9XalF2?=
 =?utf-8?B?a2gxS0t3ODhKVWd3NWhkTldnd2orSmdkWXNxNGh6eFlzZzlVaFdodi9Jd0I3?=
 =?utf-8?B?QWhlaXNIZmtWNWErVVZtK0RxcW91SmhVaXFlc204MWZSV09DSysvb1RacWps?=
 =?utf-8?B?dTlRb0luZXVXN3RVelI1NHM2aldrS0l1NlNsODhSRkZYT2JNQXlrTko4aDUw?=
 =?utf-8?B?UEdHMEl5M2pmcXlGb1JiTkJ0cXBVRTN1YnJTYzU5ZU1SVnpQcElCS1JBK29r?=
 =?utf-8?B?WGpsZFJ4RU1DN2tUQWQwZUhycjNnN0w1NzVscjAvNjRpTngrUGFzMFBHREp4?=
 =?utf-8?B?cjhjamlBeGNVNmFnazJGdTdWTGxHMG92bElKd0ljU2VzZXVqbHFBSVNqc29B?=
 =?utf-8?B?aml4QTM2K0t3blphYlpYVUJYT3pwSkNIQXNhc3ZQSzZkV1c2OG80QTFrcEpm?=
 =?utf-8?B?R3RlOVYvUXMzZzFnOE5aZms5dU9VVXFiS3ZMQTdwSk8xdDIvejg0eHF4Q1N5?=
 =?utf-8?B?Y21MM2NidktOVi9nTXZhR212ODRzdjFPWG9tYnFWMGJVdTZlNnMyQ2k3RFNG?=
 =?utf-8?B?emtvWEdEVm5Dano0cnY1Y20waXR4Zk5lQVZHbmxpNUU5KzNXUGRqeUNwL2R2?=
 =?utf-8?B?M0t1eGEyY2NXeTJCR0V5TGpjc3NjTTlHY09NaEFRZTc2bCtjbFJVT2RWOXYx?=
 =?utf-8?B?Um51czFMZnhtdkoraTU4Mk1KY1c3NnA2QklYQ2pKV240L1p4MGxqV2NVZGtV?=
 =?utf-8?B?QmpibzFMYU9ERjJmUEJzQjgwOGxveUtZb01IZHdjWkJUVk1FMFhQM1FtaXBI?=
 =?utf-8?B?ZHRUTVB1M3NORnN5ZjZQZEtPa080T0VrSXFmcnc5eUxRVnBuakJiNTRXVTRJ?=
 =?utf-8?B?R2JCKy9pT2YwYnluRXU1SkFRZDVUZ3dVWHNmdWdYU0pJdDU4bEo2NzRReU9N?=
 =?utf-8?B?QVozbG9vWTBSSkoySWUyZ3ZMRS8zT2hENVRCY1ZGR2NLU0VFZHRRQ2NJQVRB?=
 =?utf-8?B?eXJWa0FNNE1RV1gydlRJanRzc21WZGt5VWxCNWFhbUJBT21YaXVNZmJkUG1l?=
 =?utf-8?B?VEo5M0tiZWp2OWVlZGJTT2FwU21iRXQvNHZ5c01NVmtlb09iUFl1dWQwVGF4?=
 =?utf-8?B?OVUyeXIzQ1B0T1p6V2ViMGxDeVY3Y1dPdWR0Vk41N2lFK3haS09OMFMxT3RM?=
 =?utf-8?B?ZUVRTk5ZUUVJdS9WNkYvUTc0TURjTzAxbUJ2ZCszNXdRTkpVTC95bytJY0hG?=
 =?utf-8?B?Q0dsMUlyY1BZTTN6VDcySm5RV29kWFI2bXNjVlYrekQ0aDBsRk9Cd3hEZlFF?=
 =?utf-8?B?SXdrUXE0aWY1TGx4YmhzZUN5QWs5WVUyK0dEMUJKK2RYeTArL3Fxck9lQlll?=
 =?utf-8?B?TjRoMFh6VTBMZEV3MER4WUJYNTJ6OEs5OCsyZEZ0MXR1WFJzN0RsSFVLbFM4?=
 =?utf-8?B?bENMRXZmSHJDVnovMHFnZlBpS0ZnUExRckRDb3l6SjhCVnJFM2wzaElGVkt6?=
 =?utf-8?B?ZWFYRGxhOU1RNjlhREMvRmUvVFVmVGhoTVFPTG43dnNiTWFWK2Vkdjg4Q29s?=
 =?utf-8?B?VDIzWUlBc3Q2VGtTQkZ2MEE3OWh4ZGpHT00xVTc1V0d4VnB2TEJxd3hmaUtU?=
 =?utf-8?Q?FMq6Zhtg2LmomwqGWeqaO0E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40894de6-9274-4ee3-f550-08dd986524e1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 12:43:53.8463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzE4O2lAasPUkxMubgSyRZNK85OUk8DbH8pIF8tFCJ9+TMUsTQOENCox+NNCGld1gSKjA7ciAmW4nhvgnQ3Qcmt+YYi8Plr6rF1Z1OqCiEQogkX7UJygrSS8HRIrZsJQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9106
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

Hi Chaitanya,

On 21-05-2025 17:45, Borah, Chaitanya Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Wednesday, May 21, 2025 4:23 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
>> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips with
>> Linear Modifier
>>
>> Skip linear modifier async flip subtests on intel platforms with display version
>> less than 12.
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> f824f60f9..66dbbd5ab 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -988,6 +988,9 @@ igt_main
>>   		igt_describe("Wait for page flip events in between successive
>> asynchronous "
>>   			     "flips with linear modifiers");
>>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
>> linear") {
>> +			if (is_intel_device(data.drm_fd) &&
>> +
>> intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 12)
>> +				igt_skip("Async Flips with linear is not
>> supported");
>>   			test_init_ops(&data);
>>   			data.linear_modifier = true;
>>   			run_test(&data, test_async_flip);
>> @@ -996,6 +999,9 @@ igt_main
>>   		igt_describe("Wait for page flip events in between successive
>> asynchronous "
>>   			     "flips using atomic path with linear modifiers");
>>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
>> linear-atomic") {
>> +			if (is_intel_device(data.drm_fd) &&
>> +
>> intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 12)
>> +				igt_skip("Async Flips with linear is not
>> supported");
> 
> Can't we use IN_FORMATS_ASYNC for this. Having this platform check defeats the purpose of the uapi.

The intent of this particular subtest is to test only the linear 
modifier and using IN_FORMAT_ASYNC , we have separate subtests to test 
the behaviour of tiled modifiers which were split in the below patch.

https://patchwork.freedesktop.org/patch/649872/?series=148182&rev=1
> 
> Regards
> 
> Chaitanya
> 
>>   			test_init_ops(&data);
>>   			data.linear_modifier = true;
>>   			run_test(&data, test_async_flip);
>> --
>> 2.34.1
> 

