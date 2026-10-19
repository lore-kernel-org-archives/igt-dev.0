Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD1ECCF2D4
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 05:14:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A1B10E0E7;
	Mon, 19 Oct 2026 05:14:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F5A10E375
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 05:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792386798; x=1823922798;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P+Sw4Mj56Q1HQNDIC1EYamcvKFvcZx6onudNm1yqPmA=;
 b=lfN7s1N6e96Xpf24UWu/AqdDGpY3rh8mriWaU8txgi86MMl+xzc6Gyzk
 NrGsPRGn2bi4NIbhbEEzV3vchikbeTwofjAf5cQUjbElOGv0Tm3EhrFYX
 bD+lttOEWZgRIwrEgkFuSSdUWUrW5+tvl6vbXvYT8n2+q6hgwz6rDSDjb
 DHI/QZwdC7XfW5WarMhQcUmF1JVQPjL9eXZohgKJcPTHKRb96cDnlY0oC
 LM8gFbtakpDcFc7FrghbG0m4Jj+zeegD707m0HmNksqGExLFpBFyDF0+y
 XEQJBcBWVo0p3k+UIexoR20hAt1KgpH+akqSH5h3h4+vnV2oxhgE2z1j5 g==;
X-CSE-ConnectionGUID: MW1BjM2JQw2GVy2HLHok5g==
X-CSE-MsgGUID: noDgFIhoRPOa/bPm/XYvAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="966678"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="966678"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 22:13:15 -0700
X-CSE-ConnectionGUID: 7mPZU6d2SDaqHskiP3esXw==
X-CSE-MsgGUID: wlZi9st/Q+WHrnciCese5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4194258"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 22:13:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 22:13:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 18 Oct 2026 22:13:11 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 18 Oct 2026 22:13:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdFLn7ueOc2SN8Tmzf5Fum4KSw0UCZ5G8Bv3URZT95Wqml6UvNcsELST9M+iBmaCbAoKBnxdair46lrghwyofAhkqeMUBCvmHRnE+nuW7gGCXGagdxPZXAAWAvDnYWmNxxNR2NoB6JG+zTfPh0eNch4YYMgw/RBpx5HNOdP1sVUd9NsAQeaZnDm4xEDqslT2rmVAMiS3xEPkj8RcIRhB9o/dhczYtIGNJ2ToVy/zGj4XiAyz0l+RIwzZ69P6MusQX9yjrzzWLWNkac5LmD0HIHOarlRCqb5rYF20kzt6L5Vnt3hfMmtEsERPvAyTAz6TEWLriImci+s7yIggTMR+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF/vUItbqb23rvICmBOYxDsJklyRMPiad0BaTwCWXIA=;
 b=jDTASL0oo4bAi7fHqV/ymQKJinzb+I9u0NiOF2qFIeYhso+1jv9ws2sStPyAUeARYfVGVyeAQz+QYXirxJfZj2OK0SVrPKly2j7Oz9kyqP1CQb127nspOd/aS1HF4h4vp4Cn9tzDnUeRJSFNTfQ4RQNPeg2MFaOyNcDpd5mbfNNDeLa9i2bCCuhlvMhgjRv1DcADQbwilbbkCRTjFqqLTE1Q6ih2P+N2u9qpJWbFrwps8IfrUklYntECH22WAe62RhkUZc04/jgygJb/EE44uJT0K4qN5dqZoyTVD8OCvnaKqXQ4WpFDlqdcrGhOGXjdIce8aYwF0KF5h5UNmiw9yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 19 Oct
 2026 05:12:59 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 05:12:59 +0000
Message-ID: <5ece7ba9-15a6-4224-a6a2-2106a3ace031@intel.com>
Date: Mon, 19 Oct 2026 10:42:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/xe_oa: OAM has broken stream on Xe3+
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20261013044215.280639-1-shekhar.chauhan@intel.com>
 <atKRVBpFmlsPy7gV@soc-5CG1426VCC.clients.intel.com>
 <696e602b-d3bb-454e-9fbc-f1002abf83cd@intel.com>
Content-Language: en-US
In-Reply-To: <696e602b-d3bb-454e-9fbc-f1002abf83cd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::16) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b88dca-e0a9-4944-69ae-08df2d9fa4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|10067099003|11063799006|261009223027099003|4143699003;
X-Microsoft-Antispam-Message-Info: dxcSWfUwo+HRrSBZK43wQBWBGgLM6GdG35HEQ5bFJgNGSvmQ+mDRcl9C8ZeKNvy6hdFO8rf3XsxfWCVPMA1T7+YqAXIaGrjJHiFSjNUxNHGWMxKqoqLA414H97nxZGfbI5xxToezV8YyN+P9HQ/iWyFWYv4wvBuXMmxTxSqWaijf4n4Te7vVRYUUFIxzIJ+sTJzCT1/+nDjHeX0ZedY2m9WuZRl0SvRjx7mS/8IgAO00JUJL8/bIraNrcxP8vXsMDh1xV8SqSIfIoja4GuvAKywNAwk6c44IzVv0kpcH7aBHBdAhp2BkPChcupPZ1BO7h5GmNaOk5Cf+RMZs4EN81MEFydDmxemCS8lodT6cdvMlX8T//UQFi65Q1Id1sSuyuughZOsuqZw/ptjgK9mdppx8Y5GBxiRIeOr4K8i9WT/0UYEDQqs1WMxp8KyxXrVDZcJckqZ06cztGgYl5vWm+uK70nWW78RKQapQits1NI45QKttQo0FukHCRiLAHJXzYycKKu4es8187dk5uepbu+rpRVCUOlw6aHKrFCDJVKUV/VU7x0uaYjb/OgUMnC2KTFWSGZGzLIIdAuh9vacw65KW/BdrlSNZEm7BL40gKum4nH61/cvDcG4lqoverp8Uzlq5S5ytvGiAyASeuIkq/UzI3u0JzMCYOhtMiedQjLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006)(261009223027099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGU3M3QxZHdCVHNWSXdHaXFDVjBQTGRVbjU2eXNhRWFSbWFVdlY3cGt5S1hk?=
 =?utf-8?B?aGFUOWVwSld2bXNSMUJRc1pMVk5vei9VYldHajl0b25HUmJGV0ZTSC8wRXR5?=
 =?utf-8?B?TXFWZ05EbHN0OE9HMDQ4bVl6NWxJcEtUWXMzYzVWaWJ6UjBMeGZxSll2TElq?=
 =?utf-8?B?eENqZnlQNnhEdHlRQnloUmpmWHpjZFpkdzZGSjh4WTg0TE92c0xDdGwvUjhw?=
 =?utf-8?B?VnVlWHZmMDMxNjVjL2RDb3pBbWtRWHpLeENFT0NQaEpKMllkbzlpZis5SE5t?=
 =?utf-8?B?MzQ2c003RXpNUUFuRzBKMFBNdUN4S1l1a255TWJtSitnb2RzSmduVWV5UVA1?=
 =?utf-8?B?bjJMcnRkVnFCZ1E0V0ZQbFlZK0dXVzg2WlZlemJZSVNxU0hxRnlpZHRRWVFl?=
 =?utf-8?B?Vnpqc2F0aE1ZbzJCeUNvaGJQV0Q1ZGNSTml1WENBUDFZZHVHa2dCKy9ka0s5?=
 =?utf-8?B?UmdOUS9LQ0RxbXhqcGRKV05leGtaWUtib0JFV1h3NWV0eXNWQldSRHk1SHhq?=
 =?utf-8?B?QmE3c2U3MkZZNHJpQVNYcjR2eC9nZkxmQ3J2aTFrcnY1V2l6THNWcmprNURt?=
 =?utf-8?B?OCtYc3Y2cXVyNVBrVmxpUEpnZWRRNHRyc25KWFU4OW9iOW5YdFRHNzMyV1Y2?=
 =?utf-8?B?QVZjQzZrNDl6bDVnQ3paNDIvV3NUYTdHK2ZlK3pmWnh4T01sRW5iUDlTV3VE?=
 =?utf-8?B?NnhZMmc1QW9ITXNuZ0FIdURrcE9ld1BsVDdkaHhCbXlxYVF5bzNJTW5qeERU?=
 =?utf-8?B?dTVBN0JDNlN2eDNuMjBldnQ3bGRaK3dMY25XODRCcWFZZUJqU25jZzJ1YjFj?=
 =?utf-8?B?TkorbGN2VFR4Nm5OVmZpd0NnMEdGRkpiR0dEMVd6YVA3VkNsNmo2Z1BKaHJi?=
 =?utf-8?B?MHBESVdEZEcraUZyUGdsamdoWTMrQkd1YW95VjQwVlFsTGUwVGU1QlE1eVpz?=
 =?utf-8?B?ZGYxa0JRb25wMDBVYU9sVTBWWVV3Y24wc0twVUxGVHlNc2dTdVBWWk8xSUJR?=
 =?utf-8?B?WHNvVEZEbituWGtwTitRYUFTV2xaL0p6TGRvMVFkL0E2S1hoTWU5anJxd0lO?=
 =?utf-8?B?aE84R2hha2tHUkk4NG83ODJ0YmdDakNNNjgvai9xb1l3aU9Fbmc1MkU4M3lY?=
 =?utf-8?B?bjBmdlIwNWNWbzY4TG5NN3V2d1BJOGorWm9ub3FnQkpZbFowNTBJb3d6aHJo?=
 =?utf-8?B?eTVTbGpDVHNQS2xVUnoxelR1aFJzRDh2cGh1VWlKWGc3SWZCaUxCeU9XbWZD?=
 =?utf-8?B?KzV4NEdoSDZSam9uWVZNNjBmSXZDOWdEYnRKMm5SRFRhT0gzWWtaUDM0amJT?=
 =?utf-8?B?YVhiTFRCYWtDT1Bwc21uaWVQTHFLQnhZZ2g4anpEbTl6djB1TXhPVEJvYzhp?=
 =?utf-8?B?RE9RN2xBR0NJTUtMNTU4bnZuNWxFeHh0V2cwWDBvMEh2UjZZa3hOK0dWZkV2?=
 =?utf-8?B?bEVBVThGclhKcEwydnJJWXN4ZFRvMGtaRHZRTE5TVjhYSHIzYXJlaHM4ZnlE?=
 =?utf-8?B?UkNOSFlwUXdpQW1mOHByQStYSXdRc1JVUnErYkxVR2FNQWY2TmJiZktRNlpM?=
 =?utf-8?B?SWEvdzZtdGY3Rlhxc2NWSGVpSlBCYzFWaXZIOUgvOXg4cFV4WVdxU0FDTjhj?=
 =?utf-8?B?VFFwQ3dkUEVsWUNDOGlTOGxsR1VzYTJpVmhvV0tqckI4a25UOU9Da09Galk0?=
 =?utf-8?B?UmVPck1IMnh2cGhXa09DVnhZRVNnczRTWVY4Q0libk4vU1dJbEw4RHpnWFhr?=
 =?utf-8?B?aDY3dEhPNmNXY3dDNnV0clM5NzdiTTRRNllqL2RSRDJvaU44dCtsN3dyWXRu?=
 =?utf-8?B?bDFMSG9ES0VCcG9QYm9pNWZtcloxd280R0pJaTQ0ZlNkeUo3RlV4TFUzN3JK?=
 =?utf-8?B?azNBenpockV0NzdrOUxYYTV0dFRxanFoVjliMmIvVGxwemJlVmZNaU1sT2lC?=
 =?utf-8?B?Q0M2eFFYeTdRK0RZNy8xNkNEblVFdjU0aHJ4cTlVRlI5NGlsa2FOSmNsTlp2?=
 =?utf-8?B?KzFRdnpVRlU5WUdCTnpkd25JSThmTUVUSlFvWHM3UkNYcHVkeWV1REFaMWhX?=
 =?utf-8?B?VFFDaU84Wkp0cjIvcXREdUlDN0xHMktaVjRNWUtOTVh0bFU1dlFZMnZqWTdL?=
 =?utf-8?B?eU9McTl5Y2JRZml1TjQ2cFQxNjBFRXhSdDF0N25DZGpPYjR1dzFXcGNxYWZY?=
 =?utf-8?B?SEhQVThRYUNBS1hhbDJVNU1QT0FSdHNRVGJzWHUzWm1RempkSGpwN2NRWmRK?=
 =?utf-8?B?UDV5UGpGa3FtNm42T0VGdHZTQUluZ3RyWnJ0QXN3SnBzT0g5aXZUYkF3MHd3?=
 =?utf-8?B?L0xjV1RtUHpqbEdBcWthSjlPM0FGYTN2YkwwSmY1ZTJmQXZBUWtPZ2ZNQ3Bx?=
 =?utf-8?Q?eL6Rdub7HFyNI8iI=3D?=
X-Exchange-RoutingPolicyChecked: B6KtM8KggYPgcRwCCVSG8Z4mYuOx7KmpQ4ZXQOMfcbmdnYt6QDfThHzig+4kE1U65YRVprZGizajmNlGJbgpDF5u6grIYII3Sc9z3Kyk+CdSnp8NcbbbVsT9Ibji+qhm5UowLRHiuANgM103huKrQLepUMF3zMXMSiWgkJaR/EgQJO8b2HMtqKuuAtL2k0ogLlBjjSw3pXA2UPfbU5rJ/mnBZEcwvYwwaOWojQiL5fH1vuVFN98LYOfsMsZ/t6w+igRV5szCuZyHikBgOSM23uafMxMZiWlQ8unlxXfiBh9QB9h0GY60pFMNtcBQdNeNMtu89EpuNwIWcrH1IK3uMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b88dca-e0a9-4944-69ae-08df2d9fa4a2
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 05:12:59.6098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3i0Gfo6voF5ucoSnZLq70yh5Fd9TLjMS+m0xvWXw6QPqAFWJxD+dpefh7bD75VMlJ7WB5GLQBDawOkrz/6bGilm1KRKenJHfbesAkh1y+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7955
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


On 10/19/2026 10:33, Shekhar Chauhan wrote:
>
> On 10/17/2026 2:34, Umesh Nerlige Ramappa wrote:
>> On Tue, Oct 13, 2026 at 10:12:15AM +0530, Shekhar Chauhan wrote:
>>> Extend tail-address-wrap to all OA units and force the 192B format on
>>> Xe3+ OAM to properly test it since other formats on OAM don't use 192B
>>> on Xe3+ platforms.
>>>
>>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>> ---
>>> tests/intel/xe_oa.c | 31 +++++++++++++++++++++++++++++--
>>> 1 file changed, 29 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>>> index 9ebb18690..d6c3c4a6d 100644
>>> --- a/tests/intel/xe_oa.c
>>> +++ b/tests/intel/xe_oa.c
>>> @@ -4516,6 +4516,29 @@ static void 
>>> closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
>>>     try_invalid_access(vaddr);
>>> }
>>>
>>> +static bool oam_has_tail_address_wrap(const struct drm_xe_oa_unit 
>>> *oau)
>>> +{
>>> +    const struct drm_xe_gt *gt;
>>> +
>>> +    if ((oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM &&
>>> +         oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM_SAG) ||
>>> +        !(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID))
>>> +        return false;
>>> +
>>> +    gt = drm_xe_get_gt(xe_device_get(drm_fd), oau->gt_id);
>>> +
>>> +    return gt && gt->ip_ver_major >= 30;
>>> +}
>>> +
>>> +static int tail_address_wrap_format(const struct drm_xe_oa_unit *oau)
>>> +{
>>> +    /* Default OAM metric sets use a power-of-2 report size */
>>
>> I think the comment should instead be
>>
>>     /* Pick a non-power-of-2 OAM format to verify tail address wrap */
> Will take care of this.
>>
>>> +    if (oam_has_tail_address_wrap(oau))
>>> +        return XE_OAM_FORMAT_MPEC8u64_B8_C8;
>>> +
>>> +    return oa_unit_metric_set(oau)->perf_oa_format;
>>> +}
>>> +
>>> /**
>>>  * SUBTEST: tail-address-wrap
>>>  * Description: Test tail address wrap on odd format sizes. Ensure 
>>> that the
>>> @@ -4530,7 +4553,7 @@ test_tail_address_wrap(const struct 
>>> drm_xe_oa_unit *oau, size_t oa_buffer_size)
>>>     struct intel_xe_perf_metric_set *test_set = 
>>> oa_unit_metric_set(oau);
>>>     u64 exponent = max_oa_exponent_for_period_lte(20000);
>>>     u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
>>> -    u64 fmt = test_set->perf_oa_format;
>>> +    u64 fmt = tail_address_wrap_format(oau);
>>>     u64 properties[] = {
>>>         DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
>>>         DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>>> @@ -4879,6 +4902,10 @@ exit:
>>>     for_each_oa_unit(oau) \
>>>         igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], 
>>> oau->oa_unit_id)
>>>
>>> +#define __for_each_oa_unit_with_arg(oau, str) \
>>> +    for_each_oa_unit(oau) \
>>> +        igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], 
>>> oau->oa_unit_id, str)
>>> +
>>
>> Maybe I did not think this through when you asked me offline. I think 
>> we should still prevent the tail_address_wrap from running on 
>> platforms with OAMs that do not supports it. See LNL failure in CI. 
>> With this patch it runs the test on LNL OAM and then skips it because 
>> it chooses a power of 2 OAM format (so area_size is 0).
>>
>> Otherwise we have the SKIP noise in CI that will need occasional 
>> addressing. Now it flags it as NOTRUN -> SKIP. Thoughts?
>
> Okay, fair enough.  I'll address this in the v2.
>
> -shekhar

I've sent the patch, let's see how the CI behaves for this.

-shekhar

>
>>
>> i.e. __for_each_oa_unit_with_tail_address_wrap()
>> ...
>>
>> Thanks,
>> Umesh
>>
>>> static int opt_handler(int opt, int opt_index, void *data)
>>> {
>>>     uint32_t tmp;
>>> @@ -5146,7 +5173,7 @@ int igt_main_args("b:td", long_options, 
>>> help_str, opt_handler, NULL)
>>>         long k = random() % num_buf_sizes;
>>>
>>>         igt_require(oau0->capabilities & 
>>> DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
>>> -        __for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, 
>>> buf_sizes[k].name)
>>> +        __for_each_oa_unit_with_arg(oau, buf_sizes[k].name)
>>>             test_tail_address_wrap(oau, buf_sizes[k].size);
>>>     }
>>>
>>> -- 
>>> 2.53.0
>> _
>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

