Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0901EC36008
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 06:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D09910E1A8;
	Mon, 24 Mar 2025 06:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCyqbaDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1274810E1A8
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 06:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742798642; x=1774334642;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qjF2YI7qPQ5YbYM98lajb3KbDGlI6XN9qK0iBvRA6u0=;
 b=kCyqbaDtM/Aifoi3aXrnJxc8qHDuH/ICuTuSDDAkHOhy+4/TW1r00GG8
 MeiAcpzof45V8VrJ0Z7Y2FUYymmYT+8jxe1wkjAwjQxUHfjs8ygahq3HX
 C2HbSS+G29lTWAwVSUyVKgHxCPkpva5M7HetoeezDTSIR3NSmA+KWpF0R
 pBiNWbm5ZTrEmueXtxaEPcl5b9xhd7PwAFrqZxisgsafNZf3aJ9HBnuFg
 BnP1z9pCu/PUYgKWeR5km8+WQwdAH6VP64l/ssCLwvOkbo3mr6mh3+E5N
 F3LtaWtDlVj0flLgYy3Id8HsJzbn9nRK2Dw8Y86e25qo0l27tQlEY1hvG A==;
X-CSE-ConnectionGUID: gB4ri7YQSVGtEEhBm3/vmQ==
X-CSE-MsgGUID: 8T+Z9aiuTIKbHDVCeVcNwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="61379066"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="61379066"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 23:44:01 -0700
X-CSE-ConnectionGUID: TO2kwk6mTbOJ4bqNQPZopA==
X-CSE-MsgGUID: pWQgFIIwTXKYOnB9tVGqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="124908021"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2025 23:44:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 23 Mar 2025 23:44:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 23 Mar 2025 23:44:00 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Mar 2025 23:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWrbqcgQxcrV4D/gObTkAPU6eDzUMCvlYJrMsfTlDS/sCiu1pr+kD1yAC06cFX1VaTy6Dq1nRcrDSRM+1e9Q/Bp+Zq2i0ksyFhpIkmrqrZJbynKjImhGoBkDov3B/9DXxIIq+tWRbuKrzUxMyM8bl06N7EIm9Ji/rRfFpxhlMU1PDHffz/z9TutmjIyetNT+VrPg8XX60XkfS1Cxrc8a32RRJtbvUsWWZCQglbVbSY64KH1vE3wBlEyJwxPk4ncQnHmV1HCRn+tjTkHguYnQJ0nZiLzgx8iOIawulp0Dpm7onkMrqOioafCfN8uFUcvCfDwZtQEvereu86KSRLoVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsSxTUrEyEmZVYczZnaY2DpYZCpm2OWyiEWYOFkdQqk=;
 b=mhPQWwPxsF1C69XePz9/TmYD0ll0H3hBH/09JOfPyYLq0WvE1cmhQ43+0fosAcvfJhWZ2AiUP1aF6aSXtsi+elxMZt/yWOI9BsYSUqrqe5dPLDvFIu4l6HnKBYyBRqkkdXGNcyYy9mYF2bn6sFo2SaQNHnNOzC0cIzUmF3MiJgjbnqzGjhJJlWn+blzoYBejROjN4H/OAQ6tIp5j8s6ukIaoLm1TIStTLCWZM7GTRlAVQDanXPiYIBMjEJmDyUPvKSAJDahWyUN4tWEIw8og6NzLW0Ga7XOHWRtaxYJ8jPEGLKSxq38ufDTfLnGEMULyZkcBX7tICsPj4mQ/kwmGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SN7PR11MB6728.namprd11.prod.outlook.com (2603:10b6:806:264::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Mon, 24 Mar
 2025 06:43:52 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 06:43:52 +0000
Message-ID: <a8612cc1-bf58-471e-ac7f-f175c8bf23d7@intel.com>
Date: Mon, 24 Mar 2025 12:13:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH <i-g-t> v1 1/2] Add support for xe in runtime pm
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <vinay.belgaumkar@intel.com>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>
References: <20250317082823.1631744-1-soham.purkait@intel.com>
 <20250317082823.1631744-2-soham.purkait@intel.com>
 <20250318154618.miv5mukkp2svfnwz@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20250318154618.miv5mukkp2svfnwz@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SN7PR11MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b18e085-7068-4e03-a7f8-08dd6a9f3d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTk4ZHcrRytxV1VjMWRSZjltcmlOTHhvMVFaQmhUS0hLU2RhWjJKblRoTlNN?=
 =?utf-8?B?dkFEeWQxYk5teFZkMXN6Y1ZKWG9FUzVZYzJ0SWhlb0xLYzF1N1VNU3NHUHlJ?=
 =?utf-8?B?eURFdmw0a1hkOUpPamE1WHdBNE91bEZUendTTzhGYkNQcVdsaTh5V3ZDTFNS?=
 =?utf-8?B?aSs4Mmg2MDVHaU9hRE8xbElVdVBhSlNRWG9uVCsrMzdDVHhaL1piaEtvekNV?=
 =?utf-8?B?cTFnRU93RFVCT2JqdC9ETHA3TXAwakp4bFdRR0hMUkNvbXdYZExVUTJudjVP?=
 =?utf-8?B?YmxyUE82MFlNbW1QU096YVdZY2g5UGJqRVNUQkNLT2pheFNianRyU1lNZjBO?=
 =?utf-8?B?WlFYbVhLcEtVWWJRY2xOMjRyZ3FYKzlOTll6NSt0YXprNlllNlRmSWJxdTI3?=
 =?utf-8?B?WFJtazY1YlJVeTdkUE1lK1duRno0RW00WHFYLzVFKzNEVldkbEVGdGVIMUk5?=
 =?utf-8?B?eFRCOCtqWVRkMDZuN0UrS20yUmNzTVVYa1pjU041TzdnUUtDcFVMSi9qV3ZE?=
 =?utf-8?B?ckREWllTQUM2RjZDall0TTJDSitiaXdZSzBSNEQvblNYR2VvbW84eUV2N3F5?=
 =?utf-8?B?WFhHRmhmWkUrVmNyK21tSTRIT0lkRjkxcjhPYjhHRnk3YlJmZVRzVWNkWG93?=
 =?utf-8?B?U2xEaG1VcW11d3ZVanY5NXBWODUrZXN4SDhPNUMzRThBaGNYL2dwZlpIWkVw?=
 =?utf-8?B?RzNDSGZuMmJ1c2RPR0VSZUpZUXE2YUlXclI1NFRBRVBncVhJaHFpR1ZNOHU4?=
 =?utf-8?B?YTZFY255YnRHK2dVUVpWdkw3dmoxbkduTXNCc3RxNk1ObE5oQTFNRTltWnM3?=
 =?utf-8?B?UTcvM2MwNW1BMHl2amtCZ3FwdkhRcjJYSlg0MThueDJIRlQ2ekpRVkNwT24x?=
 =?utf-8?B?YVZieTk0V3VML3djQmZsK3R0dncwMTlZK21SYk9iRFpNRm5HSmRVQVFoUU5M?=
 =?utf-8?B?eGQ5VmtGNXhzYkRMNXhxNloyM3E0SjVIcU1LNERBb245S0d4cWRLU1FCc3B4?=
 =?utf-8?B?ZFZpakVraVUxem9wc25WSi9ib1RIL3FCYjdkakN3aVovUmQ4ZjZBRnRaeHRV?=
 =?utf-8?B?M0p0elJudU9sYk5YYWJGc3VJMXcvdUhXdUZoWXV6czAvVDlyQldMMGlhZG9N?=
 =?utf-8?B?bW16RlpEN0VKYnlVd2lOS3hDL2xpc25jS1loMjJNeGlpVWpNVi83Q3k5REwr?=
 =?utf-8?B?aDM4ZFcxRTlyUlZsMTZnZUNWUjBvMnhUZjZHTmg1Yk9LN013TVN1aGx3dVlJ?=
 =?utf-8?B?MW1zanV0Vm9EbmR2ZFJJb1lhc0ViTVNTbW05TnZIVGZIeit6MkI3cjR5bjB6?=
 =?utf-8?B?VGwyajI5ZGZncUJhbHJaU3BMdnJ5cFM1RzB2NjI4c2h1WFRZR1ZpZW1PYUEy?=
 =?utf-8?B?MDYxSExzS3h0RTg5OUV5WStrOVBNUUVJWitVbUM4Y3JlYnhaSm1OZXdYUUF2?=
 =?utf-8?B?Ni9ZQUw3a0l5RExXRmVMaWdhYWhpNk8wTDc3YnV5bjdVb0t5L2c0cWMvTzN6?=
 =?utf-8?B?akRlWEU3cjAxeDFqMnpKTm5sU3pmRGNHbmNGMWx5WXpwd0RDb2U0ckt2amU5?=
 =?utf-8?B?eWRiV3FNUXBjdW02eFhjVGwrOWxjYjduOXF1aXZxZEtoQllPb1piUEZ6TTY1?=
 =?utf-8?B?M2o1S01kaTkzWmFyZlU4eXY2WEpKWCt1MXozVVBLc1g4Q2NGbDhrK3Ivbmsv?=
 =?utf-8?B?Q1Zma1MxaEE1K0FubnlrRWRPOXNKWVljNEcrdHV2MllPbHljbkgwemlnWk5a?=
 =?utf-8?B?dmpjSGRpMVAyYjBMRStJcEJnczArZXEvMmZFOW03eERnU2RZYTgvU1N5b20z?=
 =?utf-8?B?K3VZWjNuREN3aXJsSGVqTVUwVkh1NHNUcVZnSHUxVkNYbk9SRURKTWJLL1BH?=
 =?utf-8?Q?UmNFgzrQYbDLt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTd4ZEhSdXJ0MFRpalN3VkpHVU9KNWRaWmlNb2ZpN3B4SVFnb2FGTG96a2hE?=
 =?utf-8?B?bGc5Y2dXaHFpS1MweWJpSndpYjFlN2IyTGtnVmFMbld1SHhEV1l1Z3RPQXBz?=
 =?utf-8?B?U1ZBVXBYTEpwZWN0NnhucHhGU3FMUzYrR0haUzd5UFV1aTZSZGtZY2RHZlhl?=
 =?utf-8?B?VTVJUFNoaWt1Nm9TazRtRnJoTmt6UGdrUFB6eUxhM3I4TndDMHdSSkk1c0hx?=
 =?utf-8?B?bW1tejQ5S0E1MGdwcy9JUGRjcVJRT1dVbHV4cEo5cW1pbnMyUWptQmpBM1ZX?=
 =?utf-8?B?cEZCOXBEcHNYek81d3d5WjlPa0lBQXV0aVY2OVkwMlhGQTYwby95T0F0cGRl?=
 =?utf-8?B?OWg3RUdXS1RlNWI5MEV5ZHQvUS8wdmNuR3l1elY2QTFEdFRXeHQxRit6OVkr?=
 =?utf-8?B?V1FsTVFUbUw4MW1mRkp2V09FbUJUZGRWeUllaFVZQW5oNld2WjBDemJvNkFL?=
 =?utf-8?B?VmNhMFQ0YktyVXRFYS9XaG40ME81bHFWaGlvWURIcFcxRmI1ekRCeCtDc1BV?=
 =?utf-8?B?aFdnZkJRTndpUHlOaEtkVk51Qm5YSk9SYm12NElOVzBKZ2hzSkRiOWFlT09B?=
 =?utf-8?B?c1VCamVVdTlJU0hwSVd2L0RKVUdiaG9PL1kwSlByR0N1QUR3T0FKM1RqQnpI?=
 =?utf-8?B?R0Y1dWphblZKc2dTbGpvYlRIZnVJK1RKV3JlY3FVZG9pd2xwNnhsd2lvemtK?=
 =?utf-8?B?MFZ4M2pKVHJpS2tTWkhTL0VBd2RHZ3R5MjR6ai9HSXRPSndnVmJqbUxsTCts?=
 =?utf-8?B?S3BLMHFJNU5NMFpqRTBnR0lzS0NzRkd4b3VqcGlpMnJWakIxdGVnTFJRMTJu?=
 =?utf-8?B?ZndHV0xlK1FxcVd6TEhtUDVNNjgySUJubi9lazdxYTlzUVVvNXdDU0Rzc1Qx?=
 =?utf-8?B?VW1aTXlGaVZlSjgxTXpDUkNTL0Q1Y0NsRUY5cFJYeXptMU1nemFIYXloRzB3?=
 =?utf-8?B?SGNBejBzVFFNZ3IwaGU3cElsY2JocFExc1I0NTM0aThObXN2M21Ia25UMnph?=
 =?utf-8?B?MEkrTDcwbnJnQ0lDQUR6cXc5N0xaS1JWWlZ5TWVxcnFOL1VidkhSWnJqNmxi?=
 =?utf-8?B?YkJWVis0MGFPYkc1ajFRbTVva0N0QkQvS012WittS3l0d21jazA4S0p1MG54?=
 =?utf-8?B?TjJUcUJkQU15Y0hnUWh4YlRoMGV3RjBTYzNsVmNjcXdYMUFkdjNyMlR1elox?=
 =?utf-8?B?UkFEd29SQnBRQlRITW8rUWFaeFh3dEhOeVV3V2dpaVhMRFEyWXdvdFZOM2lv?=
 =?utf-8?B?aGZCRk5tQVBaMHJIaSs0ZU1LNHNMeWZxUzd0ZlNPYXhpbEpsSy9PK1FUM1Ni?=
 =?utf-8?B?TjBzRVlpZ0N2czNDNjVvbXVreFB4Z1Zxd2N4Zkd5VXJWenBsMkN2SE9WR0J3?=
 =?utf-8?B?R1R5QXJlNGhJVDBqenE1SG1ZS1dUTmFEUlorRDI0emdIa2J3VzI1c2cvemVH?=
 =?utf-8?B?Ly9BdWpOU3o5dEhZMUNxNDhyTVM4b25tdHRERnFZYlBHaTRVQWhoV3JsRmQ3?=
 =?utf-8?B?VHVkMjlwcTg3OHZCQVV1K1JrY1lQWjE5d2NPNThkanRaVXlOeWZrbHIrMDRG?=
 =?utf-8?B?M0FjY3dsRkNLN3VjMXlpUkxYWEd1N25TQUdMejJna3FuNzNLNjZJaWd3RDVF?=
 =?utf-8?B?Y214WVBEMTRPVERJSS9QeDBQWTE1eEdaZmUzaWd3c2MwNHJONmEvbmFwaXR6?=
 =?utf-8?B?T0N2R1BsT3NWbHZyOTBqeXcxeEVhMjVDOUxwUnlHd2ZCUVZza1huUUt6WWgz?=
 =?utf-8?B?d2JRcWtvUFJmTXRvM2dmWHlZN0toQU1TekpuZGtxT2FjcG9nWHJtZDAwcTBF?=
 =?utf-8?B?ZmNQaG9XcDZBN24veXM2Um5oNU02K0g3N2dIRUZDOFNKV2tDZVoraThzdGZO?=
 =?utf-8?B?YXVkS2ZicUlyNVNoNTZ1MWRGVWtmRFNOdE16YXRHSjRUWncyam5OTHhJK3l6?=
 =?utf-8?B?cG01VGJzdUErNExNUk43ZEgzRmtvNlVZdDV1a3NWbkRjUStNR25TSXNZWEFY?=
 =?utf-8?B?VHdKQnlybzhKSnF0ZmEvYTdESno2VmZuNnh1NUllaU1UTDlVeldNK1VOTnhM?=
 =?utf-8?B?aWVQOXlZaEVTVk9zUHBNNEMwVTV1S2xtaDdSRzdjRTY0Qk5US0tjdDdmeUY0?=
 =?utf-8?B?eW1pYUlRbTEvdzJoRVZMUUtRZjdtWFFCQU8rYmloNGt5bnB6djVvRkRTQXor?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b18e085-7068-4e03-a7f8-08dd6a9f3d97
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:43:52.5892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46vWZDHtarILezF7O0BbP3qvnx3RpH4mhhKgk1oQy4XHW6oxDQi6n5BgWLjtou9w5DUNxIjSetGRxDiMAfgIRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6728
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

Hi Kamil,

On 18-03-2025 21:16, Kamil Konieczny wrote:
> Hi Soham,
> On 2025-03-17 at 13:58:22 +0530, Soham Purkait wrote:
>> Add support for runtime power management
>> for Xe driver along with existing i915
>> support
>>
>> v1 :  Updated references from "i915" to
>>        "generic GPU driver" to include support
>>        for the xe driver, ensuring clarity and
>>        consistency
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/intel_pm_rpm.c | 28 ++++++++++++++++------------
>>   1 file changed, 16 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
>> index 08c25ca8a..8c4778e4f 100644
>> --- a/tools/intel_pm_rpm.c
>> +++ b/tools/intel_pm_rpm.c
>> @@ -35,7 +35,7 @@
>>   #include "igt_pm.h"
>>   
>>   #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
>> -#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
>> +#define SET_AUTOSUSPEND_DELAY (1 << 1)
>>   
>>   typedef struct {
>>   	int drm_fd;
>> @@ -47,8 +47,8 @@ typedef struct {
>>   const char *help_str =
>>   	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
>>   	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
>> -	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
>> -	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
>> +	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set GPU driver's"
>> +	"  autosuspend delay. Use --setup-d3cold=auto-delay as optional argument.\n"
>>   	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
>>   static struct option long_options[] = {
>>   	{"disable-display-wait", 0, 0, 'd'},
>> @@ -80,14 +80,14 @@ static void disable_all_displays(data_t *data)
>>   static void
>>   setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
>>   {
>> -	struct pci_device *root, *i915;
>> +	struct pci_device *root, *gpu_device;
>>   
>>   	root = igt_device_get_pci_root_port(data->drm_fd);
>>   	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
>>   		igt_pm_enable_pci_card_runtime_pm(root, NULL);
>> -	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
>> -		i915 = igt_device_get_pci_device(data->drm_fd);
>> -		igt_pm_enable_pci_card_runtime_pm(root, i915);
>> +	} else if (setup_d3cold == SET_AUTOSUSPEND_DELAY) {
>> +		gpu_device = igt_device_get_pci_device(data->drm_fd);
>> +		igt_pm_enable_pci_card_runtime_pm(root, gpu_device);
>>   	}
>>   
>>   	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
>> @@ -151,7 +151,8 @@ int main(int argc, char *argv[])
>>   			goto exit;
>>   		}
>>   	} else {
>> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
>> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
>> +		    !igt_device_find_first_xe_discrete_card(&card)) {
>>   			igt_warn("No discrete gpu found\n");
>>   			ret = EXIT_FAILURE;
>>   			goto exit;
>> @@ -169,8 +170,8 @@ int main(int argc, char *argv[])
>>   			break;
>>   		case 's':
>>   			if (optarg) {
>> -				if (!strcmp(optarg, "i915-auto-delay")) {
>> -					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
>> +				if (!strcmp(optarg, "auto-delay")) {
>> +					setup_d3cold = SET_AUTOSUSPEND_DELAY;
>>   				} else	{
>>   					usage(argv[0]);
>>   					ret = EXIT_SUCCESS;
>> @@ -203,7 +204,7 @@ int main(int argc, char *argv[])
>>   		kmstest_set_vt_graphics_mode();
>>   		igt_display_require(&data.display, data.drm_fd);
>>   
>> -		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
>> +		/* GPU driver disables RPM in case DMC is not loaded on kms supported cards */
>>   		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
>>   			igt_warn("dmc fw is not loaded, no runtime pm\n");
>>   			ret = EXIT_FAILURE;
>> @@ -215,7 +216,10 @@ int main(int argc, char *argv[])
>>   		igt_setup_runtime_pm(data.drm_fd);
>>   		disable_all_displays(&data);
>>   		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
>> -			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
>> +			if (!strcmp("i915", card.driver))
>> +				__igt_debugfs_dump(data.drm_fd,
>> +						   "i915_runtime_pm_status",
>> +						   IGT_LOG_INFO);
> Dump this also fo xe driver.
What is the equivalent file name for Xe as "i915_runtime_pm_status" for 
i915 ?
Thanks,
Soham
>
> Regards,
> Kamil
>
>>   			ret = EXIT_FAILURE;
>>   			goto exit;
>>   		}
>> -- 
>> 2.34.1
>>
