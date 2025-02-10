Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E94FC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 09:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74E10E4E8;
	Mon, 10 Feb 2025 09:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJPD3mtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E24C10E4E8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739181407; x=1770717407;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NmtsLNnM0vw/1S2pwLrji9/EOIAC0AUAEYkU5y0ZUJg=;
 b=aJPD3mtTJ88x7G8wlaG3n0CZ45sXGwuFaYvIdQnHVV/Iq47MaNUDwIr4
 HKU1otviX2ynUh234bUcMmU63Q02ym/xDvVygVFfCOhtmYARGnKkbRuTM
 UXYvMQ4KyYOfWA2pCITkb3Y7v7dWfWnJVzewF2qiL0FcDuTnOvpnd4U0R
 1ZZChlbVjQ7DaeVB4lsJo5C7SAfoG2x8B9mJEAL9ztfHv8+l2YOg4FTu7
 m5wvt/oo9uwWqRcQ2LlBuLAcmhiVQg/Fy1Dowqhp1UAe6tzq3mjewB1Nn
 ULbHAmK6fmNM/c2tez+uS8Ti6Zjsc8Fuyoy+A5rGCok43lAxfmPmbR0lV Q==;
X-CSE-ConnectionGUID: 3PTEiUkHQ5S3pMIDvWOgIg==
X-CSE-MsgGUID: pOr6E/sYR/mvEkXUlgtfYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="40023174"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="40023174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 01:56:47 -0800
X-CSE-ConnectionGUID: SnLlxamFQCW0SdjKY9HsqQ==
X-CSE-MsgGUID: beMv/2dSRDe6DTO8I5jlmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135391695"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 01:56:47 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 01:56:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 01:56:46 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 01:56:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntPceUwTDg/vIk3seERaMkqy5v0w9b/820qFk4Us8VrlTPYlqFcKKe/ww8PHakcSkF3y+w/AKOshH7lOnKVZ8yz55xah75LungyeVIxuTx0xEfufYYO3bBbIhInU3t5NdI0Z9Rq/raZwUa/7juYrFeXhvu+nkxnxjuM6nzkuB8OF9TvtPQPuEQumvD/Lzloo7WSVL32XGDOcOiSEEpf716i3dVzUnY6p3qTwddUds5faQE1wco9ekoz9y8RaBpe5N4zjahJ+4oByfl54jZj/u4JE9tSI54KTPcao761nc4RhpstHjdxHOHOTSkVjvRpvfoCs/TwLUPEyPtGNxObZ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNhYZ5FWx8r+5i6MnqYSb+lq55+jBLcZRe1gbihOWk4=;
 b=HyH5LhClnDV20ae8652PMbX3QtQmH9CT/PapajNnQEZmHBuyqVXTnFnXnzp34kHEc7lHBcrAUWjOLUOCJw3aF1SWurUkQ2fDhr9ygT3K+LS2lF6BroKwFtYt8Qn/x/AMSCoWHozq5yC/9WULjtBJZHk3kEHuTXHE/KY1TLEbF5PebRDTLT1sMvlCR7UQs/sV2+XhsSJ22SkKD8JHLpMzzL6hKIIxe2bxnWVXjySej1ft6jnHU++iE+TUYruZYU8bchEkoE/G0OBVWhrUcewpqS7E5YrfxnrvTpGH24YtF+rwkMAs7gs3grRz4arOKLZYKhOY9zhcCrw4vHg+lXdNrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7841.namprd11.prod.outlook.com (2603:10b6:610:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 09:56:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 09:56:43 +0000
Message-ID: <72733aad-1980-4115-bbfb-77175f7687c4@intel.com>
Date: Mon, 10 Feb 2025 15:26:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/kms_dp_linktrain_fallback: add
 dsc-fallback test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250127062904.3420225-1-kunal1.joshi@intel.com>
 <20250127062904.3420225-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250127062904.3420225-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::29) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c5a514-b376-4f24-b0ca-08dd49b93928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0dhV1lvTE81d2dTNWx4Wk4xQ0U4VGZBc0QzeTJwbnNZSG5KMmNZMHdEKzBi?=
 =?utf-8?B?eDFhVzVOa0dCaW53SjlJNEUxeHlzSTdDS1lza2h0ZUVPUDlVb0wwZFdTTzJi?=
 =?utf-8?B?MkFOZnYyRWMzY21WbjZWR20ybDRJSk1VUndBdWY2RldtK1hrN2F4VUhzcm1w?=
 =?utf-8?B?Y3VVNk02ak9mcnpGQ09Cd1pJZ2xFQVQyQVNicVNnYk9HT3dmRjZQV2F0MTc0?=
 =?utf-8?B?cnptUCtIejkyM1F5bTAwcGJOdWM1bFZOcjFQcWU5bE5DbXR0SlJhVHRGcVNr?=
 =?utf-8?B?alI1S1ZtdmZSNXdGeVdpVHkxU2xwS0FPRTUyOWs0N2t4aGZmdStRZkJPeWZu?=
 =?utf-8?B?eGxqZnBIWkF6c1RydUc1QVdDOGxJa0xyNXA3TmNITXlTNlhHQlJZZ3FBczBm?=
 =?utf-8?B?aTNGRDBxZC84dGpPQm1tSnVhUm5RNkhjOGpGem8vZkhwL1MxT3BaN3FLSzlV?=
 =?utf-8?B?KzVyZ1dpWUNSSWVWTk83bUtINWd0eEVoVW50ek5sTk5TM2pzdHBLekwybTdr?=
 =?utf-8?B?azJFNFhOUlBjZ3RodFRBZUdoOW05bFAxdUR2VTQ4eGVxVFRtcGlEVmZ4ZzRC?=
 =?utf-8?B?Q2J5dHhBb2ZXdENnT0NDenFXaEE3Yms0NEJxcWZQaDZLN05NamU2Qm53NG0z?=
 =?utf-8?B?Ujl4THBtZHdIdFJ1Q1Vjb2FJeXQ4cDlXVmFwTUpLSmRucDl6K1A3M3l4Q0JF?=
 =?utf-8?B?N0JjRzZKakgyd0VWUUNGeG1tdlpGaHc2bnhYVGQ0bURqcW1vVWVYdy92d3Vw?=
 =?utf-8?B?cjVnUXhOMzdvZkxYR3ROaHFTeUhuS3RaaTh6Ym0rWWlOdWFWSlhNZXgyUDRk?=
 =?utf-8?B?cnFHMEpsTjJtWkdRVVdyKzcyMnRoWTg3OGRiTUwrVDB4a3BmbHc3dlhncmdM?=
 =?utf-8?B?SDFEelRYcXNscUNKbW04KzdRemxVcWN4QlgrWGMxNUpNYXI0M3dWZHIwTzJY?=
 =?utf-8?B?OTFjRnhrdmNSVU1vQ3M3ZDRGZHhmMnRvMzhoWEF2VzlFcktDR1dRbnFmMEpS?=
 =?utf-8?B?aDU5elJDUi9md0JyQ0NOdnBwVTFRVk53ZnZhU3NwNlRoNHdNU0ZCMS91MEFU?=
 =?utf-8?B?Z3U3RHhiVzJCd1B2T3hwelpIeFoxeUFkMFg4RjJiMHZjc0E1bWFiOVc1MU83?=
 =?utf-8?B?YjVMaXlYZ3Y5YkpHTHFpQXFjeXZ6L21qcHRCdCtMdzZ2aFVUODJsU0JjL1lW?=
 =?utf-8?B?VENRRjRwMlFtQWtXOUdXN1JNOUF2ajVDQ1JLM2lLTlJoRlFjNlJEK1VMejBJ?=
 =?utf-8?B?ZEdMWHBXR1cwaFF4RmM4dHVvdGhmQzlPU0xiRE9hSThHc1paUURtWUtyK21m?=
 =?utf-8?B?NlhWNnhLem9ndWlVdm5PUkhZRzVpeUtDZ1pCME9QMzMxbnZYWWM1YzRZN21E?=
 =?utf-8?B?ZjNSM1gwb3VScGNrZWNTWjhpOHhYNWxUYzNqR2FrTHpESzNOblZSSkFTdGha?=
 =?utf-8?B?RW5mOEhXSWJqaFZiZTNwT3pRRzcxZFBvdVR1dGt5bGQ2QW9qQXpNbkttdlRQ?=
 =?utf-8?B?NFFMV1BDWHpuYUhZSERnNFFHNWZTM2loVnR4MmsrbnlkVGZmMWxSd1dQcmZV?=
 =?utf-8?B?cG1sRTQ2L28vaHI2eXF3dTlneXpubERjbmNMNTVWRzUzSVNyN3ovRjJiN0lw?=
 =?utf-8?B?cmpDNXlud0RzT0ZKZjhiUlZEamhqZ0hvc3JtT1hjQzl6dTdzdFJIMlNoTUpj?=
 =?utf-8?B?UzhCektCaVBlbnVndEwyRzlmVG1EOXkrRlJxUVhOV0hNZnVNRlI2ZDZrVlhi?=
 =?utf-8?B?a3I5ZytqV0h6VlhXazRNdUk1UjQ3U1dxaGtFeUY1QWRkemNyZjNXUXhxYkRU?=
 =?utf-8?B?cUgwd3dlMHFJY094L0N1VjYzcTRjVGtyRWFFbjZ4YWw3c0pVMzNCTTdEQmE4?=
 =?utf-8?Q?nfg256eLWoroN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHpPYStkaEh5MDc0TWxNMUMvbWtVOU9jY0xlK3FsUGIwNEdFbDIwSjQ5Y2tt?=
 =?utf-8?B?M3ptWW1DVitsTDBpSDg4aE9MaEk4YmlOekNVRjFnMmpGaENIL1lkRnEyeUw3?=
 =?utf-8?B?T3ArcDFXemZwTmFQYmJiSTBTMGpSNm50ZHp6OTUrQ3lsU3BGRTZiU0V2NXhi?=
 =?utf-8?B?Z3lSckRBR2lmVFdpZUpWT0xodmtuUVhEZEZYOEgrTU5PZ0h5VitEMTNhdkY1?=
 =?utf-8?B?M3VJUGRmVm4rWlZxanU5TVFrMUxpY3RPbHU2RFVoSkp4ZU80eUNYaTJMa2cy?=
 =?utf-8?B?U3QrcWJrWElsMkVETEMzZGE4Z2lIckhDZW5KYXVrT1NOeG03ZEh1RVFmWng2?=
 =?utf-8?B?aGJoSkY3OUhPdXVUcmF2Rno0OWxCZ2thNExINXp6a1IzbTR5NjdlQVJpdmJS?=
 =?utf-8?B?N0k1RkpUTTZlaXBCYW9CamZ6WGwrM2V2SUdyTWJMVjcvVWRGNG9pbVBHSkVF?=
 =?utf-8?B?bzVrOFY4MFlmUjVkREVkUTlleU51bjBoa1VIQ0dOVkhmSlIxRnY2alRHT3dR?=
 =?utf-8?B?K3JiQlpxMzFybDhpS1QvWUREVWtvUmFOaDkvNFVNNXFkZnBmVzlvOC95ZURn?=
 =?utf-8?B?TEUwemxCZmk5emdtK3MzNHQxSWNyaWdVMnU5ZUF6QXBoZCtrdkprUGdaYTMz?=
 =?utf-8?B?UHlMbHJlYkExZzNjeFZxSWhHNThVMHdGSHdFTHpENUY2WDNRQTlPV0I5TmVD?=
 =?utf-8?B?L1ZNSENWRTAvUi9VS2RsZmJla1JYbi9sOGtWdnMxMm1FTzl6SWVvakxhWVMy?=
 =?utf-8?B?M0t5eStNRExvNGV1bjZLMXFoTFFpZlBSQ2RPelo3T1E1M0dRMUlhYlE0and1?=
 =?utf-8?B?VTZvN2JtOVRjdmpPdDBBck1YTUVPVEVpZitqemp4RkdudFR2Yndia3hqRHBU?=
 =?utf-8?B?d3dwSUliYi93akRoTVF6Z2Z3dlBmS3FsblNOZDNNeU85TzVFQStLK3dnWGJ1?=
 =?utf-8?B?RFVHZFdSU0VNQ0krU2dMelBlK0dxcCtudVM3Z1JKbC9YYmxNTDRRSlV0Z3ZV?=
 =?utf-8?B?TStmQ0N1Zmp0UHZ6WHh0TzFieUQwQ1dEOFFhU1lZQ2ZKVCtna0ovbTRlRk9t?=
 =?utf-8?B?MVYwWnBsVE8xMnZndFVrb2hjaDgyNVBpaEZMZWhyWWtmR3MyYUtodnYwQ3gw?=
 =?utf-8?B?T2xmcTRaMk5oeHhsYUxYVStsL2JVSHp3NEtmeU9ZeVpNbWlNWEFLSWFnMkI2?=
 =?utf-8?B?NklZVGxwYWwrZ25nSDgwbDBuMUkrVXl2Z09SakN4eWF2b1pBdFBYa2IxRTRO?=
 =?utf-8?B?SUo1SFdFelRZeTZJbUVCbmpFNStCTEN3ZUg5V0VVOWhvbHIyL3lySEwzNG5w?=
 =?utf-8?B?MllDMXhNdmlJd1pJYmhGQzYydjdVM0daNTZHOG1sZjdIVG96SVhXZ043dVJS?=
 =?utf-8?B?K0VBYk04eDdLTndJWjF0L3ZEL3N6SlF0UlhRQVVPcnhjWmZYZE52QkFTcktT?=
 =?utf-8?B?T3htbE1GQUtjaXBFZVBQcERyK3RyLyszZ1RZaHgrWUxRMVBvbFdMTnBESEU5?=
 =?utf-8?B?djRYOHI1U3NhWE5XMjRheWk1UHozZEF2dC9tQlR0alB4c0IyZU9POVNyOXhj?=
 =?utf-8?B?WHRmYlUyemdzSnpXYUpoTU1vZXVzbjRkWWdvamZLcTRoMlV3cEd4T0k1RllX?=
 =?utf-8?B?Mjkwa1hrRVZFZHdMSzJWVmFYTjlmOHA3MWxoMFg4eTMwL2s0dy94WHkva1Mv?=
 =?utf-8?B?bC9XSXNhbkVvWGh6NXhLOWFCb1g1bzQ5bkVjZUFxODNHbnNGc3NsazV3RnJX?=
 =?utf-8?B?amtIZjdSdElrMWZSTit1SjhTSEFRR1pPdzNTbm52THM5bmtMV0NiVWVKRTlR?=
 =?utf-8?B?MVNIOFBoZm1NWWIwbHpoUHYydW5hQm1ZY0pQV2dwR3IwL2tYYVg3YlBxNUFk?=
 =?utf-8?B?dHVpYXZDSWlCaWJjc3ZTUDJ5V2RsSkJiYS9JS09ETGFSdEEzdWM5d1dmci9R?=
 =?utf-8?B?czE4MTYyb3B3WG9MRktub2xNSkxQQXJvVUVXSCtER202VTd4VDBmbFNBa1Ix?=
 =?utf-8?B?MGN1N0V5TnFlT3lDWmw0Q1B5U0k0cE8vQ1pwUUZmUm1pLzVEV3pXK0U4QW5a?=
 =?utf-8?B?SC80UTYwS1c3SWdkTnQzNzJlSmlRc0xMdTVDb3NUdDlET09GTng4M2ErcW1D?=
 =?utf-8?B?SUg1Qi9GT1BtbERDMmR5YXBJY3Y1N2R3cTNCV0VnSjY4cTVsTW5KKzk4dFE2?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c5a514-b376-4f24-b0ca-08dd49b93928
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:56:43.6685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMPPF2TsygxgDTSAu8uZEVi502KhIh8y4WnJXpumySjjsbmoRCjpX7DiTs1IgykX3YgJcyCgB97amwBoBLrWrBD5zdBibdZIWu+dvdv2hbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
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


On 1/27/2025 11:59 AM, Kunal Joshi wrote:
> add new dsc-fallback test which finds a mode
> which can be driven without DSC at current link
> params and reduces link param till we have
> combination (link_rate, lane_count) which requires
> DSC to be enabled.
This does not specify what the test_dsc_fallback is validating or why a 
new test is required.

What perhaps should be mentioned is that we want to check whether DSC 
automatically kicks in while falling back to a lower rate/lane.

And then the above lines make sense.


>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 352 +++++++++++++++++++++---
>   tests/meson.build                       |   4 +-
>   2 files changed, 311 insertions(+), 45 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index b10946781..471381f1d 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -17,10 +17,14 @@
>   
>   #include "igt.h"
>   #include "kms_mst_helper.h"
> +#include "kms_dsc_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
>    * Description: Test fallback on DP connectors
> + *
> + * SUBTEST: dsc-fallback
> + * Description: Test we fallback to DSC when BW isn't sufficient
>    */
>   
>   #define RETRAIN_COUNT 1
> @@ -238,16 +242,124 @@ static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
>   	}
>   }
>   
> +/*
> + * Force a link training failure followed by link retrain, then
> + * block until the driver has no further pending retrain/failure.
> + * Returns false if we time out waiting.
> + */
> +static bool force_failure_and_wait(data_t *data,
> +				   igt_output_t *output,
> +				   int failure_type,
> +				   int retrain_count,
> +				   double interval,
> +				   double timeout)
> +{
> +	igt_force_lt_failure(data->drm_fd, output, failure_type);
> +	igt_force_link_retrain(data->drm_fd, output, retrain_count);
> +
> +	/* Wait until there's no pending retrain */
> +	if (check_condition_with_timeout(data->drm_fd, output,
> +					 igt_get_dp_pending_retrain,
> +					 interval, timeout)) {
> +		igt_info("Timed out waiting for pending retrain.\n");
> +		return false;
> +	}
> +
> +	/* Wait until there's no pending LT failures */
> +	if (check_condition_with_timeout(data->drm_fd, output,
> +					 igt_get_dp_pending_lt_failures,
> +					 interval, timeout)) {
> +		igt_info("Timed out waiting for pending LT failures.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * Waits for a hotplug event, then checks that the link-status is BAD.
> + * Returns false if the link-status isn't BAD or no hotplug arrives in time.
> + */
> +static bool wait_for_hotplug_and_check_bad(int drm_fd,
> +					   data_t *data,
> +					   igt_output_t *output,
> +					   struct udev_monitor *mon,
> +					   double hotplug_timeout)
> +{
> +	uint32_t link_status_prop_id;
> +	uint64_t link_status_value;
> +	drmModePropertyPtr link_status_prop;
> +
> +	if (!igt_hotplug_detected(mon, hotplug_timeout)) {
> +		igt_info("No hotplug event within %.2f seconds.\n", hotplug_timeout);
> +		return false;
> +	}
> +
> +	kmstest_get_property(drm_fd,
> +			     output->config.connector->connector_id,
> +			     DRM_MODE_OBJECT_CONNECTOR,
> +			     "link-status",
> +			     &link_status_prop_id, &link_status_value,
> +			     &link_status_prop);
> +
> +	if (link_status_value != DRM_MODE_LINK_STATUS_BAD) {
> +		igt_info("Expected link-status=BAD but got %" PRIu64 "\n",
> +			 link_status_value);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/*
> + * Sets link status=GOOD for the specified outputs, then calls
> + * validate_modeset_for_outputs() to re-commit. Returns false
> + * if the re-commit fails.
> + */
> +static bool fix_link_status_and_recommit(data_t *data,
> +					 igt_output_t *outputs[],
> +					 int *output_count,
> +					 drmModeModeInfo * modes[],
> +					 struct igt_fb fbs[],
> +					 struct igt_plane *primarys[])
> +{
> +	int i;
> +	igt_output_t *out;
> +
> +	/* Set link-status=GOOD on each tested output */
> +	for_each_connected_output(&data->display, out) {
> +		for (i = 0; i < *output_count; i++) {
> +			if (out->id == outputs[i]->id) {
> +				igt_output_set_prop_value(
> +					out, IGT_CONNECTOR_LINK_STATUS,
> +					DRM_MODE_LINK_STATUS_GOOD);
> +			}
> +		}
> +	}
> +
> +	if (!validate_modeset_for_outputs(data, outputs, output_count,
> +					  modes, fbs, primarys)) {
> +		igt_info("Modeset validation failed after forcing link-status=GOOD.\n");
> +		return false;
> +	}
> +
> +	if (igt_display_try_commit_atomic(&data->display,
> +					  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					  NULL) != 0) {
> +		igt_info("Commit failed after restoring link-status=GOOD.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static void test_fallback(data_t *data, bool is_mst)
>   {
>   	int output_count, retries;
>   	int max_link_rate, curr_link_rate, prev_link_rate;
>   	int max_lane_count, curr_lane_count, prev_lane_count;
>   	igt_output_t *outputs[IGT_MAX_PIPES];
> -	uint32_t link_status_prop_id;
> -	uint64_t link_status_value;
> -	drmModeModeInfo *modes[IGT_MAX_PIPES];
> -	drmModePropertyPtr link_status_prop;
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
>   	struct igt_fb fbs[IGT_MAX_PIPES];
>   	struct igt_plane *primarys[IGT_MAX_PIPES];
>   	struct udev_monitor *mon;
> @@ -256,71 +368,71 @@ static void test_fallback(data_t *data, bool is_mst)
>   
>   	igt_display_reset(&data->display);
>   	igt_reset_link_params(data->drm_fd, data->output);
> -	if (!setup_outputs(data, is_mst, outputs,
> -			   &output_count, modes, fbs,
> -			   primarys))
> +	igt_force_link_retrain(data->drm_fd, data->output, 1);

This is new. Not sure why this is required now in the test_fallback.



> +
> +	if (!setup_outputs(data, is_mst, outputs, &output_count,
> +			   modes, fbs, primarys))

Formatting or style change should not be fixed with functional change.

>   		return;
>   
>   	igt_info("Testing link training fallback on %s\n",
>   		 igt_output_name(data->output));
>   	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
>   	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
> +
>   	prev_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
>   	prev_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
>   
> -	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
> -						 data->output)) {
> +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {

This change is not required.


>   		igt_info("Current link rate: %d, Current lane count: %d\n",
> -			 prev_link_rate,
> -			 prev_lane_count);
> +			 prev_link_rate, prev_lane_count);
> +

These changes are not required.


>   		mon = igt_watch_uevents();
> -		igt_force_lt_failure(data->drm_fd, data->output,
> -				     LT_FAILURE_REDUCED_CAPS);
> -		igt_force_link_retrain(data->drm_fd, data->output,
> -				       RETRAIN_COUNT);
> -
> -		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> -							   data->output,
> -							   igt_get_dp_pending_retrain,
> -							   1.0, 20.0), 0);
> -		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> -							   data->output,
> -							   igt_get_dp_pending_lt_failures,
> -							   1.0, 20.0), 0);

This change should be a separate patch.

Basically one patch to introduce force_failure_and_wait and use it in 
this test.

Then add new dsc fallback test where this is re-used.


> +
> +		/* Force link failure, wait for retrain to clear */
> +		igt_assert_f(force_failure_and_wait(data, data->output,
> +						    LT_FAILURE_REDUCED_CAPS,
> +						    RETRAIN_COUNT,
> +						    1.0, 20.0),
> +			     "Link training failure steps timed out\n");
>   
>   		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
>   						     data->output)) {
>   			igt_reset_connectors();
> +			igt_flush_uevents(mon);
>   			return;
>   		}
>   
> -		igt_assert_f(igt_hotplug_detected(mon, 20),
> -			     "Didn't get hotplug for force link training failure\n");
> -
> -		kmstest_get_property(data->drm_fd,
> -				data->output->config.connector->connector_id,
> -				DRM_MODE_OBJECT_CONNECTOR, "link-status",
> -				&link_status_prop_id, &link_status_value,
> -				&link_status_prop);
> -		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
> +		/* Wait for hotplug + check link-status=BAD */
> +		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
> +							    data,
> +							    data->output,
> +							    mon,
> +							    20.0),
> +			     "Didn't get hotplug or link-status=BAD\n");
>   		igt_flush_uevents(mon);
> -		set_connector_link_status_good(data, outputs, &output_count);
> -		igt_assert_f(validate_modeset_for_outputs(data,
> +
> +		/* Set link-status=GOOD and re-commit */
> +		igt_assert_f(fix_link_status_and_recommit(data,
>   							  outputs,
>   							  &output_count,
>   							  modes,
>   							  fbs,
>   							  primarys),
>   			     "modeset failed\n");
> -		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
> -		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
> -		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
> +		/* Ensure link-status is GOOD again */
> +		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS],
> +			      DRM_MODE_LINK_STATUS_GOOD);
> +
> +		curr_link_rate = igt_get_current_link_rate(data->drm_fd,
> +							   data->output);
> +		curr_lane_count = igt_get_current_lane_count(data->drm_fd,
> +							     data->output);
>   
>   		igt_assert_f((curr_link_rate < prev_link_rate ||
> -			     curr_lane_count < prev_lane_count) ||
> -			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
> +			      curr_lane_count < prev_lane_count) ||
> +			     ((curr_link_rate == max_link_rate &&
> +			       curr_lane_count == max_lane_count) && --retries),
>   			     "Fallback unsuccessful\n");
>   
>   		prev_link_rate = curr_link_rate;
> @@ -328,7 +440,117 @@ static void test_fallback(data_t *data, bool is_mst)
>   	}
>   }
>   
> -static bool run_test(data_t *data)
> +static void test_dsc_sst_fallback(data_t *data)
> +{
> +	bool non_dsc_mode_found = false;
> +	bool dsc_fallback_successful = false;
> +	int ret;
> +	struct udev_monitor *mon;
> +	drmModeModeInfo *mode_to_check;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int output_count = 0;
> +
> +	igt_info("Checking DSC fallback on %s\n", igt_output_name(data->output));
> +	data->pipe = PIPE_A;
> +
> +        igt_display_reset(&data->display);
> +        igt_reset_link_params(data->drm_fd, data->output);
> +	igt_force_link_retrain(data->drm_fd, data->output, 1);
> +
> +	/* Find a mode that doesn't require DSC initially */
> +	for_each_connector_mode(data->output) {
> +		data->mode = &data->output->config.connector->modes[j__];
> +		igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
> +				    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +				    &data->fb);
> +		igt_output_override_mode(data->output, data->mode);
> +		igt_output_set_pipe(data->output, data->pipe);
> +		data->primary = igt_output_get_plane_type(data->output,
> +						DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(data->primary, &data->fb);
> +
> +		ret = igt_display_try_commit_atomic(&data->display,
> +						    DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						    NULL);
> +		if (ret != 0) {
> +			igt_info("Skipping mode %dx%d@%d on %s\n",
> +				 data->mode->hdisplay, data->mode->vdisplay,
> +				 data->mode->vrefresh,
> +				 igt_output_name(data->output));

IMO, this can be igt_debug. It might flood with lots of messages while 
iterating through the modes.

The new subtest looks fine to me.


Regards,

Ankit


> +			continue;
> +		}
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		if (!igt_is_dsc_enabled(data->drm_fd,
> +					data->output->name)) {
> +			drmModeModeInfo *non_dsc_mode
> +				= igt_output_get_mode(data->output);
> +			igt_info("Found mode %dx%d@%d %s that doesn't need DSC with link rate %d and lane count %d\n",
> +				 non_dsc_mode->hdisplay, non_dsc_mode->vdisplay,
> +				 non_dsc_mode->vrefresh, non_dsc_mode->name,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			non_dsc_mode_found = true;
> +			break;
> +		}
> +	}
> +	igt_require_f(non_dsc_mode_found,
> +		      "No non-DSC mode found on %s\n",
> +		      igt_output_name(data->output));
> +
> +
> +	/* Repeatedly force link failure until DSC is required (or link is disabled) */
> +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd, data->output)) {
> +		mon = igt_watch_uevents();
> +
> +		igt_assert_f(force_failure_and_wait(data, data->output,
> +						    LT_FAILURE_REDUCED_CAPS,
> +						    RETRAIN_COUNT, 1.0, 20.0),
> +			     "Forcing DSC fallback timed out\n");
> +
> +		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
> +						     data->output)) {
> +			igt_reset_connectors();
> +			igt_flush_uevents(mon);
> +			return;
> +		}
> +
> +		igt_assert_f(wait_for_hotplug_and_check_bad(data->drm_fd,
> +							    data,
> +							    data->output,
> +							    mon,
> +							    20.0),
> +			     "Didn't get hotplug or link-status=BAD for DSC\n");
> +		igt_flush_uevents(mon);
> +
> +		outputs[output_count++] = data->output;
> +		set_connector_link_status_good(data, outputs, &output_count);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		mode_to_check = igt_output_get_mode(data->output);
> +
> +		if (igt_is_dsc_enabled(data->drm_fd, data->output->name)) {
> +			igt_info("mode %dx%d@%d now requires DSC with link rate %d and lane count %d\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh,
> +				 igt_get_current_link_rate(data->drm_fd, data->output),
> +				 igt_get_current_lane_count(data->drm_fd, data->output));
> +			igt_info("DSC fallback successful on %s\n",
> +				 igt_output_name(data->output));
> +			dsc_fallback_successful = true;
> +			break;
> +		} else {
> +			igt_info("mode %dx%d@%d still doesn't require DSC\n",
> +				 mode_to_check->hdisplay, mode_to_check->vdisplay,
> +				 mode_to_check->vrefresh);
> +		}
> +	}
> +	igt_assert_f(dsc_fallback_successful, "DSC fallback unsuccessful\n");
> +}
> +
> +static bool run_lt_fallback_test(data_t *data)
>   {
>   	bool ran = false;
>   	igt_output_t *output;
> @@ -366,6 +588,43 @@ static bool run_test(data_t *data)
>   	return ran;
>   }
>   
> +static bool run_dsc_sst_fallaback_test(data_t *data)
> +{
> +	bool ran = false;
> +	igt_output_t *output;
> +
> +	if (!is_dsc_supported_by_source(data->drm_fd)) {
> +		igt_info("DSC not supported by source.\n");
> +		return ran;
> +	}
> +
> +	for_each_connected_output(&data->display, output) {
> +		data->output = output;
> +
> +		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
> +								 data->output)) {
> +			igt_info("Output %s doesn't support forcing link training.\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
> +			igt_info("Skipping output %s as it's not DP\n", output->name);
> +			continue;
> +		}
> +
> +		if (!is_dsc_supported_by_sink(data->drm_fd, data->output)) {
> +			igt_info("Skipping output %s as DSC not supported by sink\n",
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
> +		ran = true;
> +		test_dsc_sst_fallback(data);
> +	}
> +	return ran;
> +}
> +
>   igt_main
>   {
>   	data_t data = {};
> @@ -381,8 +640,13 @@ igt_main
>   	}
>   
>   	igt_subtest("dp-fallback") {
> -		igt_require_f(run_test(&data),
> -			      "Skipping test as no output found or none supports fallback\n");
> +		igt_require_f(run_lt_fallback_test(&data),
> +			      "Skipping test as no DP output found or none supports forcing link fail\n");
> +	}
> +
> +	igt_subtest("dsc-fallback") {
> +		igt_require_f(run_dsc_sst_fallaback_test(&data),
> +			      "Skipping test: DSC fallback conditions not met.\n");
>   	}
>   
>   	igt_fixture {
> diff --git a/tests/meson.build b/tests/meson.build
> index 2cbd21c2a..dd75976dd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,7 +367,9 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> -	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
> +	'kms_dp_linktrain_fallback': [
> +           join_paths ('intel', 'kms_mst_helper.c'),
> +           join_paths ('intel', 'kms_dsc_helper.c')],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
>   
