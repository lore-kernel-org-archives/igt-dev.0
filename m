Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC20BC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 12:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C91D10E1A9;
	Tue, 11 Feb 2025 12:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6NRAJI2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B0E10E1A9
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 12:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739277664; x=1770813664;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=paLAGemVJSxUan0fw/m0iKsPqiSD0SWki/juMCcJu2c=;
 b=Q6NRAJI2xuLT9u7UrETw7jjP9mkrE8kPS9gpUzbI/s67QP4iFU2RtP5Q
 bbeRgiicLXBumz369YlOtJ2BelFhpgupQFvbzzASwmVQzkF3lNFwsbDqb
 n6FcXTy/YKhcsKyvHB2lmFgwHZXywjSEqxSw0I485opOiPDWV+sib43IA
 ugDbMD+BRZUv8qnOil4T8DE322DyQD7fs7sHwP44NZh6L/Jl0VwL5FlcV
 tvQfijGQBkYC2wm2dA4mKhNTaMsdNdkFeFu0tJDTsRwwiU3fKPu7dZOgm
 aYW1HN9R103CEtzv3kkXZwmmYp+qsGl1ATsiMaEYCB6+IxMDiIIbWmpLg w==;
X-CSE-ConnectionGUID: ClFk6nTYR9yS781PQxFQIw==
X-CSE-MsgGUID: ixIvD4QWQ3OpmkoK5dxagw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50528880"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="50528880"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:40:49 -0800
X-CSE-ConnectionGUID: uNCtuuIkRWirfVyPuw3Kwg==
X-CSE-MsgGUID: dr2vnYpKRp+qY28F4iGS6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="117584744"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 04:40:48 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 04:40:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 04:40:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 04:40:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6onRkP/ipFiHTi33oJCDtHCRk9FSnHbIq69nsJLwGgaxJLyibLSY2N9ESd8A7qx6wM0PNsjdJUKES2TqIXB6sJYRBxIMg/WRA+htIxfXojUC/CFzYGTr/wDv2l9m+Ppv1vDRwNcHKYOdu/DJcoXC1PQ+A1uR9zdGR5j/okF4HUjLdY1kQMViearzZEfOiJt3+sDkck3KRgaRKQEINhTumMvETl8PoHQoMMtMGxwMqc3VhzFtTNOVP0YQo3owFTplLNHHVGzQz/EVY92pRAReSxU1NIMCl2OI0NR6LcNTZdJFNyxxGJDaJGgpr3qerLosGkEFC6kDcPSxJq+DaKfhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr4nbmQcPDYNSPfjhyl2G8a3+n+JoMjGz8/2yz3jd5M=;
 b=eNhH3i7hywQkOqaKNWSDR104UCtrfm+/E7YZtwcE1e3NCi7TGml+q8NfaLEM1kPk/cOVC+zfJ7uY6VwqU3p/dP7y1OG5umIpfwJSUy/syOxfYa/A2KadLVIHR7qZIQH3zy354vy7D7r8dNTpxmOJDC0Q59RFoPgMsn07bD+WmxDgqUHs7DZU0jOgMDN5Mxb35a71fFYUeg6lAyRTFVW200XuUVkhQJA7XB67KvYkcC96xmbinxNer2/E322mi/t70WtFRDJY6toTXGexdoijGmcIZ5VhAv1b2ranmdHMNDF+XkoDafRjpBG+jb0P5sGARBChAHcJBDtVG4ZUQoyIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Tue, 11 Feb 2025 12:39:59 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 12:39:59 +0000
Message-ID: <51987229-29db-43aa-a41f-3ef0869a2d2e@intel.com>
Date: Tue, 11 Feb 2025 18:09:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,4/5] tests/intel/kms_dp_linktraining: add tests for
 UHBR/NON-UHBR over SST/MST
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250203081241.659139-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250203081241.659139-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::15) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DM3PR11MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 81050e8b-6421-4186-5e6c-08dd4a993222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K21yeldIZjF1N3BvcEtqekpBYmtsWHZlakgvdEN5aFkvbG96OWN2S0c4bHc3?=
 =?utf-8?B?UW5XYytwMUZPUGF6Y0Q2akUzUHdhNXA0OUJhc2dNSXpDZ0dYV2RhRmtPbXlM?=
 =?utf-8?B?T0U1cWF1MWxBVWtHTDVUNVl5cmpEbTZtWUJ4bFNGUkJEUkN1NFlzbjNpMk1F?=
 =?utf-8?B?blk1dlJIREtrQldqRjJzMnZwTGpxVGF2ZjZPVUgySFpPSE4xWXkrbWlKM2Rz?=
 =?utf-8?B?RUF2UWZPVFRhTTZwdmNQVXFJTEhGTVFDVEE3MEVwUW4zc3RVdzF1b3NmblI1?=
 =?utf-8?B?a0lzVEdleEI4eFY4MS9qV0laeTJ0WEh2N1RKVzdSdGFYSVZjRFBiRGNpbkcv?=
 =?utf-8?B?QzRndEZMNnc2ZTZoWWVhT1lDcFE2VmpYc1ZraktvOHVOS3NTdU44OXV4NnRt?=
 =?utf-8?B?QWQyVVlja3M4a3ZJL1RNMzY1S1MyaUFHRjRyWWdTZS9wbDdWQm45b1VXV2xF?=
 =?utf-8?B?M25jc3hvYmxteXBEb2dxekRqSXhXbkp3TlZxQ2hleXhuYmN6dGdNV1liaDVH?=
 =?utf-8?B?VlBlY1BDM1BWNDVIVy8wNGhGRzBwdjNHYy9pc0hWRzFKSGJ5dzhYcjFjRy9F?=
 =?utf-8?B?ZEtWVE5ldlZQUGNMMDlLNUVkYmVUNFdMZHNLdFU5S2xzRVlPWGE5OFpWMGdp?=
 =?utf-8?B?ckdvU3RTYkc4R1ZZamU3SDYyK3ZVdkcvdGJWTVF0eXJ2djRaT3p5U0laWk92?=
 =?utf-8?B?dXBLN0lJVDBnZFdzcko2Z1RjdW5VTk5meitSZ3RTekdTOXNwMHRGbmNYczRm?=
 =?utf-8?B?T3ZUL0pvRUxRMmE4a2Y2TG5UZGxyZU1VblhobEx6REZrNEV5bituVk1wd2RP?=
 =?utf-8?B?eFIwaVJpbjBBRzlLcnNRZTRkMTFWcDlSYjJjV0t3OUFycEZEbTZTTkphYTRU?=
 =?utf-8?B?SXpEdTdzaDBkZUZMakpFRVN3Z3Vid0toM2VYSmNzWkNkZkdHNXBacW01WjVa?=
 =?utf-8?B?VjBYNGF5bCsrMnFyWVAyT1JiSGdKcUdnaSsyc3FCeG1qZmFIdElZVjl3aGo1?=
 =?utf-8?B?NW5oV3VWOVpEZk8rUmNsK0VzbE56c3RYTnN4bzRLaEg3UnVmWmxUeEdCMlVK?=
 =?utf-8?B?dVcrMnVDUWZjdEh1NG1QNmpUTjJudHdDdTM2blJCazNSNmNIT29TWUc5UWxt?=
 =?utf-8?B?Vjc0WnRmRDBteUJTbWtYdmU5a3c3MFhaWk5GUjQxbTUwZU9qSW1NVmFyWmgx?=
 =?utf-8?B?ejEvUjl6UWcrdDNybDh5WTJ6SVZmVE53Z1lVdmRXOVBHU3ZNZFY3Z0JkNHRF?=
 =?utf-8?B?N3AwMEYvMGJEQWdVRWdrdTJuK1VMK3V3WmU3S3VyQlV6OENoK2FGMFhIS0dq?=
 =?utf-8?B?dDAvKy9YeTdJMVZwSE9iR0J3QzNydkcwWWRDMGc1VFF0MVZPRVJWa3RhZmVB?=
 =?utf-8?B?V0p6S29GcmkzZWcybThHeDVDVUgyM09HMk1kY085Z294MUJhRkxoSXdpN252?=
 =?utf-8?B?V1U4d1ZoYUovbXhoSWtXTVVzc1N4Um1EaVpjZDlUUThGc29McDdPV3ZDMC8z?=
 =?utf-8?B?Kzl6di85b010UStYTU4vdC9JRWs4SEVZcyt6aVdzcDVrbjMrNy9vMUpjd0Nv?=
 =?utf-8?B?VGNHSzlsa05FSzArWXVYemYzSC93cnN1T2VXczM3b012LzZUdXRYYmNxVzRa?=
 =?utf-8?B?SnU3VHRjT3VuVzR4MDhvRVprVjc1VGNxT2xqbXJQOTl5WmZGSDc2Q2srSDZY?=
 =?utf-8?B?YWUzMm83TE1PN0thWEtWN21hY0czQTd4WFdOOFo2VnBxL0JQUStsMGUwY3BV?=
 =?utf-8?B?TDJxN0tPb3BBOUMyR1l2T2d6UjhrKzUybVc2TTVrUEVZQzRuYTNQKzBRRGFl?=
 =?utf-8?B?ejBQKytJY25JS3NJTXZSN0RRTEZ1a2RXekhjRGJCd2RNaERlQ3B1bURMMFVl?=
 =?utf-8?Q?7zgl2iuGfLRZw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1ZYMlNxRmlHQVpFZkp2cHg4TWkzNHd4OUNxeUxUbFZKTmNRY2R5ODlsYWVj?=
 =?utf-8?B?eHY2eVFmOGJlWW5Rc0doZjE0WjB3L0huNEpXdHFSUnk3NXlSUmVkbnFValJk?=
 =?utf-8?B?Y3BKSStlRTR4Y2ZNdXA2dlpCNUYwaUlvN09ybnF4MkpRVHY3ZkVONXNoVmFT?=
 =?utf-8?B?ejloOFBNQnlrdkM3enZ0YXFZazVqWTM2THlheDNncUowTmRnREdPOU1Qa0FS?=
 =?utf-8?B?MHRqNkprdjR5emRlTWFLMHdEbTJSVWV5OVIwbm1POUlrU01jRGJ4Y0p0VGVs?=
 =?utf-8?B?OHdacmZUODVsWEhJVTRlSDdZSlVnT3JUT0xnbzRUMHVIZis5NWhmcU9ydTFU?=
 =?utf-8?B?ei9HdkEwY1ZyS1F4ODd5N0JaejhQbXdEdjhyMkNaRFJvZjR0b2FXRmI3R1hH?=
 =?utf-8?B?M2NWSkMxTTJmODI3amVEbjlHbGxJM3hGaFVyQU8va21MUzQ4UEVvTWREOGxy?=
 =?utf-8?B?YjJLS1liUXN3WkF1RTUwcXRvcWIyN0thK2tjTmpmNGJVSmkrTXZHM21IKy9X?=
 =?utf-8?B?NmgzYTBVQkpld1g5WTFRZXZhc2d5VXoyVXFLWldaVlg2Q2tNc0tJOHhzUW9v?=
 =?utf-8?B?V2pOc2ZGLzEyZVF5Yk5DYkd6UGloNnAvSFd1SEpqcXo0dWhkK1h2S1J3SFcx?=
 =?utf-8?B?TEZSUzczY2d0dUEvc3V6NzRNamdVNXZ0TlQ4QzVSZEVHeHB1aytDenVsRU03?=
 =?utf-8?B?bWVycVlCcE50VHRKc0ljbDhmYTA0RXZaK0NYVnNwVTBZSjUxeERlMlVzWTY5?=
 =?utf-8?B?ZkwzZnNCRTlnSDBtcGNCNWhsVU8wMmR3VnczZVIzU0piWFBYa3RrdE9ldVlR?=
 =?utf-8?B?WldrMXVaU3l3Z0VrcXVFcytVNHE0RE9Xc1Y5Tks3OTlmeXRQb004YjJ6bmg4?=
 =?utf-8?B?MU5HdlpSa2tOMk1Ud09YS0RTWVk1QXcxSkJBUUYvb2pRemxQeXQxS0dYUVFi?=
 =?utf-8?B?Qmp3ZFIwOWRLUXJhYngyR0lFMkNtckRkakV0L2R4UllGajFCYklsRnV3ZC9k?=
 =?utf-8?B?OFBsTmh1N2Z4WXhJRDhnK1VYSWZWd05ZTVQ5QklYQnlxcHB6RG95RG03ajha?=
 =?utf-8?B?b3FVSDVrQVZrUVRmRVFqeFpNUjNLOTZjZXJnU3lIMXU5eFQ1djAxVVBtNnZ0?=
 =?utf-8?B?T0pLMzBCSVJDU3dZanZwQ0ttZ0RtQ3VDMDJlVUFYQ2M2R2hreVhwRlVIV3Vz?=
 =?utf-8?B?Zk9sKzllaVoxV1pFbnhnbWxpemR2a1NvZ3l0Ym1NRkpVdGZwR3NFVmN5ZU9H?=
 =?utf-8?B?ckkxUGJPVExrdDA0ekFDd2RBY0lMZ3dyR29NZU40VlpOOEl0aElUUHkyZmZE?=
 =?utf-8?B?M1JGUStDaE9QYWltbjZoM1E5a3VtOThkM2xKTEhSSFcwVW9YRHE3ZTI5ZHJl?=
 =?utf-8?B?c2VJK0VKUzduNVF5WXJ4c3h3WGppN0pqQnBsbjB0MnFHNmt6YlFqc3BpVUVx?=
 =?utf-8?B?QWJzanFlU2h5NjNYdmoxa29rTmZteEZTNTZlQTZUVHhDa1E1Z3RoREptdzRV?=
 =?utf-8?B?ekpveTkxbE9yeDUxSTJWVndCY3dNYnU0azFjekJjQ0lvdW1hWnhaTEpZWlB6?=
 =?utf-8?B?MHVtL2xjamg1YkI4WUE3RFQxSGFuVDdTSkNpOXpoU2xqUWFVcnpqd1Jta0NZ?=
 =?utf-8?B?R01mS082SDNDeTlsZmNyQ1E3cW5MTUdCanRSVjAvUGJjYmxLTmgrbGxXNWV3?=
 =?utf-8?B?OGhKbU1Tck1McUl5bG5rZjRTYkZFZjg3N3BPU3lwY0pMeVg4L2pLU05laWtv?=
 =?utf-8?B?Wk1QYXVLdndjbllwZ3VLL2JtM1cyUUNrdkF0R1RVdFUyWkY5QlgxUStObzBE?=
 =?utf-8?B?eEwyeGEwM3N5eWs5ZTZQWDVFV0NrR3JuM3BuUENuZEVKRzI3aldvUGpsNTBQ?=
 =?utf-8?B?WmxxdnZZNTM3OVc3a1pnVE9iNDZUMmtwOERLRDZiZ3A1VS9mZ1J6QWJNQklH?=
 =?utf-8?B?ZW1xSXNNc0xxSUxacUVnNlNSYm9Vejd2SjRqR1RZbllaNS8xUmRyMFBYZC9D?=
 =?utf-8?B?OE45Y3dzR0hjbjI0T0dFWGxRNFhwSE1hcUNOVmdhRkhSZlJIOFFFM0x0NjBZ?=
 =?utf-8?B?RU9OT1pUVHYxSEI5UFlJemZhTnlXY3VIV2FlUFZSRkJMZjA5VWhST1NiZDFy?=
 =?utf-8?B?QzkyS2tkdnVTR2NxYW5kQ0FlRTNQT1hTcWY5Y2FpMTZaV2pjZFFzZmczaXJU?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81050e8b-6421-4186-5e6c-08dd4a993222
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 12:39:59.2355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCgwXVH3bL8tDt2zfTB8w4jAfQHzJJpEsch0TrYzfNhUHcHfkePQfjTR+uJ0UvNGEWC1Fo3Jw1dUFvnGTkywQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
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

On 03-02-2025 13:42, Kunal Joshi wrote:
> Add new test subtests kms_dp_linktraining
> to validate both UHBR and non-UHBR link rates over SST
> and MST configurations.
> Add four new subtests (uhbr-sst, uhbr-mst, non-uhbr-sst, non-uhbr-mst)
> to check if the link rates match the expected UHBR or NON-UHBR capability
> and whether the outputs are MST or SST.
>
> v2: Add definition for UHBR_LINK_RATE
> v3: Add failure criteria (Jani Nikula)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---

Test cases looks good.
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>   tests/intel/kms_dp_linktraining.c | 372 ++++++++++++++++++++++++++++++
>   tests/meson.build                 |   4 +
>   2 files changed, 376 insertions(+)
>   create mode 100644 tests/intel/kms_dp_linktraining.c
>
> diff --git a/tests/intel/kms_dp_linktraining.c b/tests/intel/kms_dp_linktraining.c
> new file mode 100644
> index 000000000..6cedc47db
> --- /dev/null
> +++ b/tests/intel/kms_dp_linktraining.c
> @@ -0,0 +1,372 @@
> +// SPDX-License-Identifier: MIT
> +/**
> + * TEST: kms dp linktraining
> + * Category: Display
> + * Description: Test to validate link training on SST/MST with UHBR/NON_UHBR rates
> + * Driver requirement: i915, xe
> + * Functionality: linktraining
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +/**
> + * SUBTEST: uhbr-sst
> + * Description: Test we can drive UHBR rates over SST.
> + * Functionality: feature_discovery, uhbr, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: uhbr-mst
> + * Description: Test we can drive UHBR rates over MST.
> + * Functionality: feature_discovery, uhbr, mst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-sst
> + * Description: Test we can drive non-UHBR rates over SST.
> + * Functionality: feature_discovery, sst
> + * Test category: functionality test
> + *
> + * SUBTEST: non-uhbr-mst
> + * Description: Test we can drive non-UHBR rates over MST.
> + * Functionality: feature_discovery, mst
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include "intel/kms_joiner_helper.h"
> +#include "intel/kms_mst_helper.h"
> +
> +/*
> + * DP Spec defines 10, 13.5, and 20 Gbps as UHBR.
> + * Anything below that is considered NON-UHBR.
> + */
> +#define UHBR_LINK_RATE	1000000
> +#define RETRAIN_COUNT	1
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +} data_t;
> +
> +/*
> + * check_condition_with_timeout - Polls check_fn until it returns 0
> + * or until 'timeout' seconds elapse.
> + */
> +static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
> +		int (*check_fn)(int, igt_output_t *),
> +		double interval, double timeout)
> +{
> +	struct timespec start_time, current_time;
> +	double elapsed_time;
> +	int ret;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start_time);
> +
> +	while (true) {
> +		ret = check_fn(drm_fd, output);
> +		if (ret == 0)
> +			return 0;
> +
> +		clock_gettime(CLOCK_MONOTONIC, &current_time);
> +		elapsed_time = (current_time.tv_sec - start_time.tv_sec) +
> +			(current_time.tv_nsec - start_time.tv_nsec) / 1e9;
> +		if (elapsed_time >= timeout)
> +			return -1;
> +
> +		usleep((useconds_t)(interval * 1e6));
> +	}
> +}
> +
> +/*
> + * assert_link_status_good - Verifies link-status == GOOD
> + * for either a single SST output or all MST outputs in the topology.
> + */
> +static void assert_link_status_good(data_t *data, bool mst)
> +{
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	uint32_t link_status_prop_id;
> +	uint64_t link_status_value;
> +	drmModePropertyPtr link_status_prop;
> +	int count = 0;
> +	int i;
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
> +					&data->display, data->output,
> +					outputs, &count),
> +				"Unable to find MST outputs\n");
> +
> +		for (i = 0; i < count; i++) {
> +			kmstest_get_property(data->drm_fd,
> +					outputs[i]->config.connector->connector_id,
> +					DRM_MODE_OBJECT_CONNECTOR,
> +					"link-status",
> +					&link_status_prop_id,
> +					&link_status_value,
> +					&link_status_prop);
> +
> +			igt_assert_eq(link_status_value,
> +					DRM_MODE_LINK_STATUS_GOOD);
> +		}
> +	} else {
> +		kmstest_get_property(data->drm_fd,
> +				data->output->config.connector->connector_id,
> +				DRM_MODE_OBJECT_CONNECTOR,
> +				"link-status",
> +				&link_status_prop_id,
> +				&link_status_value,
> +				&link_status_prop);
> +
> +		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_GOOD);
> +	}
> +}
> +
> +/*
> + * setup_planes_fbs - Create solid-color FBs and attach them to the primary plane.
> + */
> +static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
> +		int count, drmModeModeInfo *modes[],
> +		struct igt_fb fbs[], struct igt_plane *planes[])
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++) {
> +		modes[i] = igt_output_get_mode(outs[i]);
> +		igt_info("Mode %dx%d@%d on output %s\n",
> +				modes[i]->hdisplay, modes[i]->vdisplay,
> +				modes[i]->vrefresh, igt_output_name(outs[i]));
> +
> +		planes[i] = igt_output_get_plane_type(outs[i],
> +				DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_create_color_fb(data->drm_fd, modes[i]->hdisplay,
> +				modes[i]->vdisplay,
> +				DRM_FORMAT_XRGB8888,
> +				DRM_FORMAT_MOD_LINEAR,
> +				0.0, 1.0, 0.0, &fbs[i]);
> +
> +		igt_plane_set_fb(planes[i], &fbs[i]);
> +	}
> +}
> +
> +/*
> + * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, overrides
> + * output modes to fit bandwidth.
> + */
> +static bool fit_modes_in_bw(data_t *data)
> +{
> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(&data->display,
> +			DRM_MODE_ATOMIC_TEST_ONLY |
> +			DRM_MODE_ATOMIC_ALLOW_MODESET,
> +			NULL);
> +	if (ret != 0) {
> +		bool found;
> +
> +		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> +		igt_require_f(found, "No valid mode combo found for modeset\n");
> +	}
> +
> +	return true;
> +}
> +
> +static void do_modeset(data_t *data, bool mst)
> +{
> +	uint32_t master_pipes_mask = 0;
> +	uint32_t valid_pipes_mask = 0;
> +	uint32_t used_pipes_mask = 0;
> +	igt_output_t *outs[IGT_MAX_PIPES];
> +	drmModeModeInfo *modes[IGT_MAX_PIPES];
> +	struct igt_fb fbs[IGT_MAX_PIPES];
> +	struct igt_plane *planes[IGT_MAX_PIPES];
> +	int n_pipes = 0;
> +	int out_count = 0;
> +	int i;
> +
> +	for_each_pipe(&data->display, i) {
> +		valid_pipes_mask |= BIT(i);
> +		n_pipes++;
> +	}
> +
> +	if (mst) {
> +		igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd,
> +					&data->display,
> +					data->output, outs,
> +					&out_count),
> +				"Unable to find MST outputs\n");
> +	} else {
> +		outs[0] = data->output;
> +		out_count = 1;
> +	}
> +
> +	igt_assert_f(out_count > 0, "Require at least one output\n");
> +
> +	igt_set_all_master_pipes_for_platform(&data->display, &master_pipes_mask);
> +
> +	igt_assert_f(igt_assign_pipes_for_outputs(data->drm_fd,
> +				outs,
> +				out_count,
> +				n_pipes,
> +				&used_pipes_mask,
> +				master_pipes_mask,
> +				valid_pipes_mask),
> +			"Unable to assign pipes for outputs\n");
> +
> +	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
> +	fit_modes_in_bw(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +/*
> + * run_link_rate_test - Main link training routine. Expects the MST vs. SST check
> + * to be done beforehand. Returns true if tested at the correct rate.
> + */
> +static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
> +{
> +	int max_link_rate;
> +	int max_lane_count;
> +	int current_link_rate;
> +	bool is_uhbr_output;
> +	char rate_str[32];
> +	char lane_str[32];
> +
> +	igt_display_reset(&data->display);
> +	igt_reset_link_params(data->drm_fd, data->output);
> +
> +	/* Retrain at default/driver parameters */
> +	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
> +	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
> +		      igt_get_dp_pending_retrain, 1.0, 20.0), 0);
> +	assert_link_status_good(data, mst);
> +	do_modeset(data, mst);
> +
> +	/* FIXME : Driver may lie max link rate or max lane count */
> +	/* Read max_link_rate and max_lane_count */
> +	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
> +	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
> +
> +	/* Check sink supports uhbr or not */
> +	is_uhbr_output = (max_link_rate >= UHBR_LINK_RATE);
> +	if ((uhbr && !is_uhbr_output) || (!uhbr && is_uhbr_output)) {
> +		igt_info("Test expects %s, but output %s is %s.\n",
> +			 uhbr ? "UHBR" : "NON-UHBR",
> +			 data->output->name,
> +			 is_uhbr_output ? "UHBR" : "NON-UHBR");
> +		igt_info("----------------------------------------------------\n");
> +		return false;
> +	}
> +
> +	snprintf(rate_str, sizeof(rate_str), "%d", max_link_rate);
> +	snprintf(lane_str, sizeof(lane_str), "%d", max_lane_count);
> +	igt_info("Max link rate for %s is %s, lane count = %d\n",
> +		 data->output->name, rate_str, max_lane_count);
> +
> +	/* Force retrain at max link params */
> +	igt_set_link_params(data->drm_fd, data->output, rate_str, lane_str);
> +	igt_force_link_retrain(data->drm_fd, data->output, RETRAIN_COUNT);
> +	igt_assert_eq(check_condition_with_timeout(data->drm_fd, data->output,
> +		      igt_get_dp_pending_retrain, 1.0, 20.0), 0);
> +	assert_link_status_good(data, mst);
> +
> +	current_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
> +	igt_info("Current link rate is %d\n", current_link_rate);
> +	igt_assert_f(current_link_rate == max_link_rate,
> +		     "Link training did not succeed at max link rate.\n");
> +	igt_assert_f(is_uhbr_output ?
> +		     current_link_rate >= UHBR_LINK_RATE :
> +		     current_link_rate < UHBR_LINK_RATE,
> +		     is_uhbr_output ? "Link training didn't happen at uhbr rates" :
> +		     "Link training didn't happen at non-uhbr rates");
> +	igt_info("----------------------------------------------------\n");
> +	return true;
> +}
> +
> +/*
> + * test_link_rate - Iterates over connected DP outputs. Checks MST vs. SST
> + * early, then calls run_link_rate_test(). Returns true if it ran on at
> + * least one matching output.
> + */
> +static bool test_link_rate(data_t *data, bool mst, bool uhbr)
> +{
> +	bool ran_any_output = false, is_mst = false;
> +	igt_output_t *tmp_output;
> +
> +	igt_skip_on_f(!is_intel_device(data->drm_fd),
> +			"Test supported only on Intel platforms.\n");
> +
> +	for_each_connected_output(&data->display, tmp_output) {
> +		if (tmp_output->config.connector->connector_type !=
> +		    DRM_MODE_CONNECTOR_DisplayPort) {
> +			igt_info("Skipping non-DisplayPort output %s\n",
> +					tmp_output->name);
> +			igt_info("----------------------------------------------------\n");
> +			continue;
> +		}
> +
> +		/* Early skip if MST vs. SST does not match. */
> +		is_mst = igt_check_output_is_dp_mst(tmp_output);
> +		if (mst && !is_mst) {
> +			igt_info("Skipping %s: MST requested but it's SST.\n",
> +					tmp_output->name);
> +			igt_info("----------------------------------------------------\n");
> +			continue;
> +		} else if (!mst && is_mst) {
> +			igt_info("Skipping %s: SST requested but it's MST.\n",
> +					tmp_output->name);
> +			igt_info("----------------------------------------------------\n");
> +			continue;
> +		}
> +		data->output = tmp_output;
> +		igt_info("Running link training test for %s\n",
> +			 data->output->name);
> +		ran_any_output = ran_any_output | run_link_rate_test(data, mst, uhbr);
> +	}
> +	return ran_any_output;
> +}
> +
> +IGT_TEST_DESCRIPTION("Test to validate link training on SST/MST with "
> +		"UHBR/NON_UHBR rates");
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Test we can drive UHBR rates over SST");
> +	igt_subtest("uhbr-sst") {
> +		igt_require_f(test_link_rate(&data, false, true),
> +			      "Didn't find any SST output with UHBR rates.\n");
> +	}
> +
> +	igt_describe("Test we can drive UHBR rates over MST");
> +	igt_subtest("uhbr-mst") {
> +		igt_require_f(test_link_rate(&data, true, true),
> +			      "Didn't find any MST output with UHBR rates.\n");
> +	}
> +
> +	igt_describe("Test we can drive NON-UHBR rates over SST");
> +	igt_subtest("non-uhbr-sst") {
> +		igt_require_f(test_link_rate(&data, false, false),
> +			      "Didn't find any SST output with NON-UHBR rates.\n");
> +	}
> +
> +	igt_describe("Test we can drive NON-UHBR rates over MST");
> +	igt_subtest("non-uhbr-mst") {
> +		igt_require_f(test_link_rate(&data, true, false),
> +			      "Didn't find any MST output with NON-UHBR rates.\n");
> +	}
> +
> +	igt_fixture {
> +		igt_reset_connectors();
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index b9dd162cc..926c5825f 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -246,6 +246,7 @@ intel_kms_progs = [
>   	'kms_ccs',
>   	'kms_cdclk',
>   	'kms_dirtyfb',
> +	'kms_dp_linktraining',
>           'kms_dp_linktrain_fallback',
>   	'kms_draw_crc',
>   	'kms_dsc',
> @@ -367,6 +368,9 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_dp_linktraining': [
> +		join_paths ('intel', 'kms_joiner_helper.c'),
> +		join_paths ('intel', 'kms_mst_helper.c') ],
>           'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
