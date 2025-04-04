Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331D3C3601A
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 06:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D799010E311;
	Fri,  4 Apr 2025 06:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvU51cXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8981510E311
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743747922; x=1775283922;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5ROJEOMcrBXCQCbTXAGKJZnUkwwUliGkSwuCboM/oTw=;
 b=nvU51cXRHfQJwa8YaIhkjE1vz7SpJ70xMuvRe/ncS7C1Fa9vPED9yJpO
 seV8uF25zewHk+TLcuX9aNQc/Nft9DCvSFf+SkgGOkYRdYS4vy4YG/0If
 lf6SwYAjzBDZywiQNBDd+Kfyi4X0McdAN+Rx/FLgHP/dKtdOlOie1mTib
 DZneVkE2qsctdfP91g4YK7gC0kmOvSCjjt4+Dh9xEuqiIjJba3aK11cwR
 HIQNUXQNOin3OgpP+SroBzrB2NTK1pQKCQ83tQ+q3v1G0//apcEBQGHrx
 4v0dgjNcdksvRCZys0Xvs9QeDH4cB5GJ+U1/+bch4edLJKFKa4pUc+smI w==;
X-CSE-ConnectionGUID: TOKRWACcSUm9Ui3LBUtUGQ==
X-CSE-MsgGUID: 3BZZnAotTB+m+vuLzIzxiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45070973"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45070973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 23:25:19 -0700
X-CSE-ConnectionGUID: CuKcct5LSP2F8Yi1rBKUOQ==
X-CSE-MsgGUID: jkL2A0IpRq2YmFbxRHmMoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132347092"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2025 23:25:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 3 Apr 2025 23:25:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 23:25:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 23:25:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4tUW7GdmE8sNE9/UU3aLCjgD6/aJdIj4ee/glLj//mClQU7rKU5LmBEmQD5GrurOxzxIGfsdz8p5em03jGAgCRta+SnsaGTQlToCksHYoKOKJEASZce0LNWfU+9XR+zC9+A9dOQT5VaXsMbAK99Z381+B3NGjfaGyjbycQxhSZM2idNL9kKUdtD+FftsrMptHMo4LHH/TfE/x5RVOYsppUSDFqbt88OrqPvPMXysdxUC2hv1azNiVZHKgZ9IFtMv60o/Wuot2AqpJebH1CUPUqq0PtRBW8EDqLLnzgu0XmsWEOaVLFqoHhklCDPUbQnH+xAQHFAtrRZnIAL8/23lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osqb5KtCzRDwbik9bHGwc0bowaxMcOjqB0T+1zq9DcE=;
 b=br7IEaoLS6KWKx0vLEtdoNq/9CgCCKtSR8peEHixxaj83p5XIuv1ciweWlCmwRvdXfEScyBLmSW9MVwSV4h0MozjqBnBWMPckIm0RkG9esh/RVSxSZAIOMg3LsAYJXIocewREuLLEXPYsUri/AdvuwPkFCVUXofgpFcIolVFpZsOa0TQlo8p709HBPAkxXqw5dWGEwA0WSjwGpfN959+as40QLiHlE0TdLM4+tTuxLxaJc3hroUdt8j1iinH2rVLz2EPEZOyChGmT54Xlnvnxp7+UGBKiee2lADGwNJeXk33zO8oGbtwcQiSTVYhVsQ5rWAjRjVJlliuhpmE922fcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH3PPF7708D4D9D.namprd11.prod.outlook.com (2603:10b6:518:1::d31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Fri, 4 Apr
 2025 06:25:16 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 06:25:15 +0000
Message-ID: <100211b9-9600-4a35-b1c4-3198cdc5e72e@intel.com>
Date: Fri, 4 Apr 2025 08:25:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v4,2/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>
References: <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
 <1b95cae9-33c2-47b5-b4e5-d9000543cd8c@intel.com>
 <LV3PR11MB86951576818F866D55D961D7F9A92@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <LV3PR11MB86951576818F866D55D961D7F9A92@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH3PPF7708D4D9D:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd64463-a383-40f2-c99e-08dd734176a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHZQSERBVjQ5RFJYeWFGQWNaUWw3WTJ1Y1U5dmpYdVZRTHowZlBzRHNibDJE?=
 =?utf-8?B?VzZGYjdvN1BtTlJNVjhDK2w4VW1CY0JBc04rVlpEUTFlT21aMTRHZmc1a2JL?=
 =?utf-8?B?ZmFMeG9qV3Zid2lQdkw2dTNPU3ZJNVBmNDhIK3h0MmlGOSt0YnMxTjQrbnRo?=
 =?utf-8?B?eml1dVFxOFMxUm9QdUlwZFFuczM2ang4QytuT0Q3eGNsbHZxQmQ4ZkZ3Ykxx?=
 =?utf-8?B?RXBrZVBuNjRkOEsvQ2NDQkJ5WDNqSjFPa3VhM3p4akh1REZvcWxUMVRlaVBW?=
 =?utf-8?B?Tmo5UnRGTjNyeFpuanpjaXdaNVRXcEYrS3RrRG9lZGVVRi93ZlZwTEpJeDdC?=
 =?utf-8?B?a3ZsR1REazc3RDloZTNKVTJWS2ZjZVc1ZDE1MEZaT3VLczlwaWJBVk91Ym5V?=
 =?utf-8?B?MDVJRCtkZnhmZlY3dGZGZ2tCNXN0aVBKRzZzbDUyOWZmTnh6cnRqcC84dnZT?=
 =?utf-8?B?MWxrTzdYUzAwSVZCZzFZdXBmK0ZCMXdTc0NaaXZYM2xTb2NlQmV0QWV5Y25t?=
 =?utf-8?B?NDdiY0laalliVTdaTmxxdXBjUDNsdEhaT0VmNGJuRCt2aWZjOHFsY1BVd0J4?=
 =?utf-8?B?Tlpac3R5NmtERmVuNGI0S0JEMGs5L2VKSFV5NFZyeU9wR2VOUFFUbWR2Nk5m?=
 =?utf-8?B?WU1PRFpwM28zQ3VBREIzWjJmVmhtbklJaDdiM1RlTjlINVN3ZTQ0QkJVa1Vv?=
 =?utf-8?B?WFV2TFY0TUhIWHdJaTA2MlRnT2QrQnRGL3hPdVJQNFA4dmhaV3h3aDRCRTB1?=
 =?utf-8?B?amZmeGUyUjlQYnBSMG9zRHJxK2xVZ2NYNG1ZbGJTeFZTcXJkczd2QWFRaEg5?=
 =?utf-8?B?eFAwOS9GWnVuQmg4UUk2aXliZVh6SGhGcGZ5TjF2bjJZMFlRRjFBN3V3em94?=
 =?utf-8?B?VHFNczBnWnhZWG1nK3U1ek5VRXl3bnlXTGJPQkovZmNsdlJ3eEZIQUJnZGJn?=
 =?utf-8?B?M2ZscktnUUxINWsyZmQyZEdFcWxsVGFZMWtrWWJkaFhTTnNvR1BhNGl6Mk1L?=
 =?utf-8?B?S3RuWFhOTU51M1l5cGI2WUYzTEo2Tk0rZFUrdW5CaUJkOHZNWTNxRUFlL2VY?=
 =?utf-8?B?RWxRb3pyRmlDVEVwaWVDSjdiVzlVZlpJclZtTXVnQ0p4SkdRUko5SkRZSWZh?=
 =?utf-8?B?cUdQV2VyZWFZUWthRjdsaXFJZElxRmswNzlIMFhRT0RGL0ZGUnRUNUVoY0hL?=
 =?utf-8?B?c2hiYk5rY3BVWU1rMkhpYks4dmdvbTBUMU5BdjJibGJLbXgrVDhuUVFxTEFi?=
 =?utf-8?B?cFVHdVQvNFBaREx0N3hCYnd6SG0vMXlRM2s0dVdOOUpSYnhIK1A1azFOMzJ3?=
 =?utf-8?B?aTMxTjREQnVCTzF6NCthRWZYSVgvTkp3emVFcUE4MGpxbUs2Uk5NanoraTl6?=
 =?utf-8?B?OUo2MUFoLzFIeC94MTV4V3FENUptcHBQd2N0R3NUd3llcHdmNVNvbS9RRXpw?=
 =?utf-8?B?bzAveklxdWs0MHR5cjJDckVlNVJzVTdXSmRnMXJvcFF3TE5sVmQ4M1pUN0d5?=
 =?utf-8?B?QXhFaE1OVW5HL2ExWEw5TGV6NHdOajNQek1CL0RScGs1TnVVM0JZODd6WlM2?=
 =?utf-8?B?ZDVpek1BNEcwMkVHSWhRQXVMYUNLZWpOYkp6cFNCU3lRcjJpaUtPSmZENlEy?=
 =?utf-8?B?VXZQM3V0UTdJRFJlRE13NTMzbWlEUTdrZzBnYU9tSEVEeEQzUnNyZU1xZnFH?=
 =?utf-8?B?UTE2OHVPaFVrR2tJQWg5cnJPNi9vZVZCMDk1em5JOEhDd1hBK212WDRxSS9z?=
 =?utf-8?B?Ry9EWmdabHB6Qm1GS0tpWlFNaGZmNTFCYkl5UUdKVlpWRk9GbTA0SHhKVDFz?=
 =?utf-8?B?eWFPTUdlVDJBUDhKcG1nbGhKWVcvelFFYkIvVUwveDNIN1BndkoxdGdMeXdD?=
 =?utf-8?Q?Bde0t0RDETi8J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGhWN2dvbnA0NkJNNHROZGNobHlxUWdFSkRGZlZMTVV0dWpKaVBVSTV4Vmdy?=
 =?utf-8?B?SnRvaHp5b2RKcjlTZHNCY2pqa0dsRy82QmpsY3hLQ296dy9JMTZuSXR4RlpD?=
 =?utf-8?B?dkN1YVZSL0Y1eVNDOEVTOGV5RzNmWVg2UnA1di90SE95SE0vdUc3TUo1cmNM?=
 =?utf-8?B?WnM0R3pSSVB6dzZLRis3Ni80akFpcHU5WjFVSENORmJscVBtcDNlUisxcFlh?=
 =?utf-8?B?RXY4VE1DR01YckhuMEVjRFlHdlRJSmV0K3EzY3NXWGswZlZsZllQbFJLeXp1?=
 =?utf-8?B?bkVYWGU2VGdBSlZGSlhqLzNsTHJSR3IvY20zZS9qYzVCOUFYWEpQVkxnMG9M?=
 =?utf-8?B?c0FwczFiR0FET2d4U1oyUUMzKzlwcnFQYURmSmx2VjVMME9FMG5mQ01XaEhG?=
 =?utf-8?B?OStkdGFjejloTEtBY0x2QW5ocGlJVkZCV2IzbGU3VWVjUjVvTDdSYjk4ZTZU?=
 =?utf-8?B?TDNTamxBaUNaZ0FWTGVoVjlpSE15UFp1eVJpakgzZHhkVXJpSndBR3VLSGoy?=
 =?utf-8?B?MGJIOVFiSVNyTGcvcE5HRm1mOXc2Z1hvNzBDRnIwbWF5ZC80eVAyL3A1TjNC?=
 =?utf-8?B?TnovYUtiaytmbittUjl3cmlUMTJDUUp4OTNhdXpxWmZ3eDc4UVJSTlRuSjRo?=
 =?utf-8?B?cENhT3dQdm9PSFQ1OGI3WWk5MlFMWjdpV0pmYlJTRnE4bEw2NjB1TUF3dWdk?=
 =?utf-8?B?ekdPTjB6UFRqWVRqVjZVSngxaFZuV3JWVGNPNlMra2ZIbE54V3lETzVEMGNa?=
 =?utf-8?B?NHdVRXhnVVRMSjJRYlNlTVltLzE3ckRhS05WSWl2b043ZHRHSksxMUhuQ0xO?=
 =?utf-8?B?VHFlbWZhV2t2MVVSc1hOemZmUlA2b2dPZDB0cC96c1dURzV4QnR2dTJjZ3Uy?=
 =?utf-8?B?dW5VMW9OWUVMZFRWT0hVajliQTFUUEFCY055cVFwK2gvMms4RnFNU20zYWFh?=
 =?utf-8?B?Si9uT1g4eXgvZ1NSUUVGSlZVQ1IxS3FUc255eE1RQnY0TDl6T1BSa2xINEsy?=
 =?utf-8?B?UHBtTjhjMXIxK01YV1F4dU9YZXBmVUZDclNuNWxuc0hBMU8vTllBN1VwbWR0?=
 =?utf-8?B?d2RwOVplajJhNW9OU0pnNHh4LzhONTlBTTBVVnpjbVp3cGxOVERhREFhTmZl?=
 =?utf-8?B?WGNheUwzZkRvN21JNzhvcnVBZmZ0MzJHT0I4cThNYzZBZGlNWVNjTWg0SGFm?=
 =?utf-8?B?UXpBdE1EellhVFlKaG9TT2RtK0NzNkRFUlIrYi9Pd1dYWjZLNGtuMndSdzRO?=
 =?utf-8?B?djRoNWVMdVVPTmtMK2JpcitzUGxvS3FZNFNjdGd1dGozWG5BWEZTSURDMkNO?=
 =?utf-8?B?Y0FPRURMc0dTVkc4ejFuSk1uV3l5ZU1FNjZxREEwNW4yKy9nQlVnVkNXaWor?=
 =?utf-8?B?ck1ISTNJRmtpL3F3bkRPaVcwaXpUN0ZmM1pwODQ4RWZObFdWOEZzU2ZvekdN?=
 =?utf-8?B?QkVLWExtcVVHL2FJakEvdG5IdkZhSGJST2d4di9ic2lsWTNISHpzL1Y4Zy9D?=
 =?utf-8?B?MEJYMytaaUJDa091YWo1RTdRUXJTU1B2R0RpWVZzajVZTkpRejZaUmNLdk5X?=
 =?utf-8?B?alEwQWsxajEwbHJPSlpycVFuZVJ5ZHV2ZEZqQWdLYzR2SEhmb1NTa0tmQlI5?=
 =?utf-8?B?RU1Fcis3bW1pRzAvL3NQaFYzVnppcC9IYnJMZDNLZmsvSFBSTWtLQllVdXFy?=
 =?utf-8?B?cTdZMXdtTUVsMVFjUFBGNVFRakhnSkI4WXhoeExZUjRUTzFVYnpoQVhjTDcy?=
 =?utf-8?B?TU9tN3lVV2JZYUJ0MmpQcjZKRnh4ZFhZSkJYOWR0SU5TZ0ZMYU1hOVZNdmlK?=
 =?utf-8?B?KzhwYjl2SUdQWmNPMXZVMnpyZTIyVVovM041a3lMTXVvUCt4R3pkWFpUV1lk?=
 =?utf-8?B?dGtZbjZvcmVkNTczb3JDdjl6d3dQTEluMkkxRnhpN0NjRWE1eUQzSjZWTE9S?=
 =?utf-8?B?NXRNRVFOSW5wallZK2ZZaE1lZXJkZ3FrbUpVMktWd2JhWlJ4d2d0dk91US83?=
 =?utf-8?B?UWFMSTVLeUozWXpiTk83MG05RWhBQXhML0pYckJIK2hrcjRFdjQvbjkrbkJK?=
 =?utf-8?B?cWxKOFVYKzVxTGsyY1dwb2xEWEk2d3RFRitFOWpZUGh2WEhXOFJzck1WWUlY?=
 =?utf-8?B?Mk9Ub3RyU3I1aHl6U1ZPR2lkeUcxazhjMTM3OE1SZmxaMWtxN0FFV1J6Si9r?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd64463-a383-40f2-c99e-08dd734176a1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 06:25:15.8800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EykA/A0GJ0zV0vSNjhz9ThGbwXCXygmQK1n7Oml37jeX818BrrR/CBa7znrgWxh0L0x6i0Xx7ILbwSqeItPyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7708D4D9D
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


On 4/4/2025 08:04, K V P, Satyanarayana wrote:
>> From: Laguna, Lukasz <lukasz.laguna@intel.com>
>> Sent: Thursday, April 3, 2025 7:05 PM
>> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Wajdeczko, Michal
>> <Michal.Wajdeczko@intel.com>; Dugast, Francois
>> <francois.dugast@intel.com>
>> Subject: Re: [i-g-t,v4,2/3] tests/intel/xe_fault_injection: Inject errors during
>> xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
>>
>>
>> On 3/28/2025 12:15, Satyanarayana K V P wrote:
>>> Use the kernel fault injection infrastructure to test error handling
>>> of xe during driver probe when executing xe_guc_ct_send_recv() /
>>> xe_guc_mmio_send_recv() so that more code paths are tested, such as
>>> error handling and unwinding.
>>>
>>> All xe_init() kind of functions are called just once during driver probe,
>>> so it is sufficient to fail first/all calls to them. Driver communicates
>>> with the GuC multiple times, and the real failure can happen at different
>>> call, hence the need to inject failure in GuC communication functions,
>>> like guc_mmio_send() or guc_ct_send(), but it can't be just first call or
>>> all calls, but we need to be able to select specific iteration to fail.
>>>
>>> To address this problem, the environmental variable
>> IGT_FAULT_INJECT_ITERATION
>>
>> I think it'd be better to use test parameter instead of environment
>> variable. Please check igt_main_args() and consider using it.
>>
> Hi Lukasz,
>   The intention of test is to inject error 0-100 iterations for guc_ct and guc_mmio functions.
> The environment variable is used to inject error at specific iteration in case we want to debug
> Issue in case of any failure. So, not used test parameter.

I got it, but still don't see why to use environment variable instead of 
test param.

- Lukasz

>
> -Satya.
>
>   
>>> is used. If the IGT_FAULT_INJECT_ITERATION is not exported, an error will
>>> be injected in every possible function call starting from first up to the
>>> max number of iteration defined by INJECT_ITERATIONS, currently
>> hardcoded
>>> as 100. Also, using IGT_FAULT_INJECT_ITERATION, an error can be injected
>> at
>>> specific function call.
>>>
>>> Error can be injected using:
>>> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
>>> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>    tests/intel/xe_fault_injection.c | 61
>> ++++++++++++++++++++++++++++++++
>>>    1 file changed, 61 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
>>> index 1325a1716..a49070b4d 100644
>>> --- a/tests/intel/xe_fault_injection.c
>>> +++ b/tests/intel/xe_fault_injection.c
>>> @@ -26,6 +26,7 @@
>>>    #define INJECT_ERRNO	-ENOMEM
>>>    #define BO_ADDR		0x1a0000
>>>    #define BO_SIZE		(1024*1024)
>>> +#define INJECT_ITERATIONS	100
>>>
>>>    enum injection_list_action {
>>>    	INJECTION_LIST_ADD,
>>> @@ -43,6 +44,24 @@ struct fault_injection_params {
>>>    	uint32_t space;
>>>    };
>>>
>>> +/**
>>> + *  Introduce a new environmental variable IGT_FAULT_INJECT_ITERATION
>>> + *  using which an error can be injected at specific function call.
>>> + *  When unset test will run for INJECT_ITERATIONS iterations.
>>> + *  When set to <=0 or malformed - same as unset.
>>> + *  When set to >0 it will run single n-th iteration only.
>>> + */
>>> +static int get_fault_inject_iter(void)
>>> +{
>>> +	const char *env = getenv("IGT_FAULT_INJECT_ITERATION");
>>> +
>>> +	/* Return 0 if not exported / -ve value */
>>> +	if (!env || atoi(env) <= 0)
>>> +		return 0;
>>> +
>>> +	return atoi(env);
>>> +}
>>> +
>>>    static int fail_function_open(void)
>>>    {
>>>    	int debugfs_fail_function_dir_fd;
>>> @@ -228,6 +247,34 @@ inject_fault_probe(int fd, char pci_slot[], const
>> char function_name[])
>>>    	injection_list_do(INJECTION_LIST_REMOVE, function_name);
>>>    }
>>>
>>> +/**
>>> + * SUBTEST: probe-fail-guc-%s
>>> + * Description: inject an error in the injectable function %arg[1] then
>> reprobe driver
>>> + * Functionality: fault
>>> + *
>>> + * arg[1]:
>>> + * @xe_guc_mmio_send_recv:     Inject an error when calling
>> xe_guc_mmio_send_recv
>>> + * @xe_guc_ct_send_recv:       Inject an error when calling
>> xe_guc_ct_send_recv
>>> + */
>>> +static void probe_fail_guc(int fd, char pci_slot[], const char
>> function_name[],
>>> +               struct fault_injection_params *fault_params)
>>> +{
>>> +	int iter_start = 0, iter_end = 0, iter = 0;
>>> +
>>> +	igt_assert(fault_params);
>>> +
>>> +	/* Get the iteration count from environment */
>>> +	iter = get_fault_inject_iter();
>>> +	iter_start = iter ? : 0;
>> Can't it be just iter_start = iter; ?
>>
>>> +	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
>>> +	for (int i = iter_start; i < iter_end; i++) {
>>> +		fault_params->space = i;
>>> +		setup_injection_fault(fault_params);
>>> +		inject_fault_probe(fd, pci_slot, function_name);
>>> +		igt_kmod_unbind("xe", pci_slot);
>>> +	}
>>> +}
>>> +
>>>    /**
>>>     * SUBTEST: exec-queue-create-fail-%s
>>>     * Description: inject an error in function %arg[1] used in exec queue create
>> IOCTL to make it fail
>>> @@ -406,6 +453,7 @@ igt_main
>>>    {
>>>    	int fd, sysfs;
>>>    	struct drm_xe_engine_class_instance *hwe;
>>> +	struct fault_injection_params fault_params;
>>>    	static uint32_t devid;
>>>    	char pci_slot[NAME_MAX];
>>>    	const struct section {
>>> @@ -463,6 +511,12 @@ igt_main
>>>    		{ }
>>>    	};
>>>
>>> +	const struct section guc_fail_functions[] = {
>>> +		{ "xe_guc_mmio_send_recv" },
>>> +		{ "xe_guc_ct_send_recv" },
>>> +		{ }
>>> +	};
>>> +
>>>    	igt_fixture {
>>>    		igt_require(fail_function_injection_enabled());
>>>    		fd = drm_open_driver(DRIVER_XE);
>>> @@ -505,6 +559,13 @@ igt_main
>>>    		igt_subtest_f("inject-fault-probe-function-%s", s->name)
>>>    			inject_fault_probe(fd, pci_slot, s->name);
>>>
>>> +   for (const struct section *s = guc_fail_functions; s->name; s++)
>>> +       igt_subtest_f("probe-fail-guc-%s", s->name) {
>>> +           memcpy(&fault_params, &default_fault_params,
>>> +                   sizeof(struct fault_injection_params));
>>> +           probe_fail_guc(fd, pci_slot, s->name, &fault_params);
>>> +       }
>>> +
>>>    	igt_fixture {
>>>    		close(sysfs);
>>>    		drm_close_driver(fd);
