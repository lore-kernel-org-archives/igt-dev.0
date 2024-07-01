Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A96EC3065A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 19:47:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6B110E0A2;
	Mon,  1 Jul 2024 19:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwTGaUwh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08FF10E056
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 19:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719863275; x=1751399275;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E/ctcee3kMIIRDgYgwMTQxiJ/sP/asaeLd6biXHZSg4=;
 b=CwTGaUwhYxTymZx67ssmOGX2L98zxZsvJC5XXFwvDF0u4lhpeP20+zu0
 DbTTkDyyXhovCFc+RoAeVQB2eWNVW08oYAqJD02LsHiqchrskc6xaduIJ
 TJkWYrjVxhivr2JdhtmEUtNmSeQ/8NPT/ZYUtIoiJZfoA76AbE3ATqr+p
 0RZcEDFw7obYiJW+mbntXqss5dcwXg1uYDbp/SqHj5RZ7gaE39TmkfsAx
 hZbnaA+GNoR6vgS2+dtdvk9Ktsu1Yus7dircnXQZBhFLG3FPat3r+Z65b
 bnBh+1UMoWBEzrNmMr+P7sGoC68Q/zq6cFNtXKHWkuyQoVIQRU7aLfIij A==;
X-CSE-ConnectionGUID: 5BUnX+VmReyhavllfSy7oQ==
X-CSE-MsgGUID: BCNxmiqOT4yId8hcS2LTMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="28410034"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="28410034"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 12:47:55 -0700
X-CSE-ConnectionGUID: m7yXNIdFR/Gre+/7WNWM8A==
X-CSE-MsgGUID: Yk62hwnkQ6i9IPDFLB39Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="50845174"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 12:47:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:47:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:47:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 12:47:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 12:47:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrhS3G7gT1mQKLa+jmMEptcUMwlYSulmjyLVxuhj+kHl2AmhXbwpyUhevgrWjVZO7l1Rs6mx+KFtRYryQ0IacjRYaYj5X8z41E7oSoEsGIfVy6uO+ibQZ/n0wAG6P8bC0Mw4g3TbQ3u/uHAX0eNi79yqR3agE6Tf5ReeGpBfHKTaXCJLz/QeTbivP/fFwqNxHfrFaJG8VQ02rsFU9UatX5RQPM3RqW/eTHVc8/Me2LxYy3/eSSqz8jjU46BL0w1f87LujldXrYZIxJt2iQbKAob6gRVkokJ+3VRRkOHe6XTm4Jc/0Ca+uv712qCtz6HLXfUyrbSHB7kiKbhvdt92Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLEBTS+1ZkfLYAj42VNnKLY4vYwzRBrUU035lF6VuHo=;
 b=LBuOmW4Hz6iklI/FhIkjby0zPUly8zorcTFAZjqwnzDP3DZgeOJYZvT+cqmmJ9vQ5alSoMnJU3mTlr6iIM4genPliRO//GT5AUm93hj0jYNNVpEIyzF9HzdbozdTJBjkobiN1UNLuvwP43A8qmI2OX/GqjwpiSb4pDKdD+I1a8GTy11vj4jO6a6d5JE7hM2A1vwpIxm1QPGQorpBeA8nv+g0meL4mmmum/iLkSHRKhKVyjHWM0hltymA4gz+AHo81kW9Z/EwbX/3NhUFQfe7Sw/pTusFC/Jw8OxbEqS3Lm92/iJQ7S/GsW7UNkKKMUgFmF/qnPhW/SI44Psq6BWvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS0PR11MB7960.namprd11.prod.outlook.com (2603:10b6:8:fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 1 Jul
 2024 19:47:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 19:47:51 +0000
Date: Mon, 1 Jul 2024 12:47:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 02/14] tests/intel/xe_oa: Add first tests
Message-ID: <ZoMH4REHm7g336aE@orsosgc001>
References: <20240701025309.2416653-1-ashutosh.dixit@intel.com>
 <20240701025309.2416653-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240701025309.2416653-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0384.namprd04.prod.outlook.com
 (2603:10b6:303:81::29) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS0PR11MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 97be6042-b785-498f-9f52-08dc9a06b11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWJEMkR6RnoyZ0xORkhQL1RMeGZNYm9aQis4SkczOHI4cVVGZXZHVjlQVG1V?=
 =?utf-8?B?dDRyMzRKV09GSGVhdzlsMU5pRHNXVGYwb0FaMVBobStEa1lqZWV5b2d3cHRv?=
 =?utf-8?B?MTBzT1A1Z3dRTTdUV3JIL25TbTR4bXB1aGVpS250Zk1McEo2cjBwSUxFS09k?=
 =?utf-8?B?bmNKWThwY1BUYWVMMXcwQ01vOUtwdUVrNy9VNHIwbkZkbjFDYkFiSnNQQjRs?=
 =?utf-8?B?dy9QVTJORk1zc0QvclVMYmdnUzhKR0VhNkpxZmNUd1lxS2g2dG5JQjlHTm4z?=
 =?utf-8?B?R1pidzhvY29WUERGVWk0RWlNdWd4Y0QzZFZ5OXp2NzRuTlVMRDFSZjQ2VEJt?=
 =?utf-8?B?NzVMdUNHTHVKcTFnVGdwdkVxNHZHaE9RcndydzRpbmZRekxIMXdINHRicENm?=
 =?utf-8?B?MlhseFJDNjV0THVhY2dDRGl1MHNoL3owV1ZhckEvZXVqSnQyL3JhUGNIK0xO?=
 =?utf-8?B?NnF4NElKQ0dkenFzTGVSam44TVpsdFhxOXUwaTA5SXBvM3ZHellCV2hiN1E2?=
 =?utf-8?B?anBZNThTdUFuZ1puMUl3RUdoQ25UQ3AwNU5hLzZCbWxGanhYejFnQk9FTWdG?=
 =?utf-8?B?ZlNQK2tuQlFYZ3QzaTFXaGU0NGl5bUZMQ1dLSnZkNzBONDRoOXliYVN2cHpl?=
 =?utf-8?B?dnF2aThmOWpKLzNRdktmWHkxTlNWNUhCd2x4RjBoL2UwZlN1N3laRzBmVEpT?=
 =?utf-8?B?cXY5aklqSGR4VkxsU29GNjhKREtpSHBkS1VweTVzOWdnSzlEejdKZDNwYkJw?=
 =?utf-8?B?NWcrVHlNUkxYaDl3M0QxOHZNYkQ2TFpnQ1JKMUFsUTVGL2xGbTNlQ2lVd0x2?=
 =?utf-8?B?cTRlUGxhZnk2ek0yc2xwcW0zQmxHamJ3YmgyMW1tWkJLTmZNencwYm02VStY?=
 =?utf-8?B?RVJwN3RRUmM4RmZ2SWd1TTVXV295b1JTaTJmckxtOTlZKzVNSVZZY0xTRlBK?=
 =?utf-8?B?NXdhTC84d1Y2Y1ZoSUdpOFpHK2NndTN5V0hEMkpGMzJtbUNSRC8zOER6d1BB?=
 =?utf-8?B?NzJ1RUxBeUJjZjFuSmJDcmN2cWFrYUdzZnhQL1ZodGtmS3FRaHN6K2ZzZFVE?=
 =?utf-8?B?R3lXZ0tCWmRocTBzeEJYSkF4Q1ZOdkVPL3FFYUd5YWlFVUJnbVNGcnV2bzE3?=
 =?utf-8?B?UVFnTFRHUkh2bzFVM3F3eGo2Ymg4eG9CUGZKaDVlR1p1THJRYmVvNTVBTmxi?=
 =?utf-8?B?Tzcyc1UrN1U4NnZrZkNaUk1jaS90VUFUWlpNZjFRbXlPYmttMDVCbUZjOFNF?=
 =?utf-8?B?SEk4NGZERENMRUtyMm1IUGNzV1hBTTg5WmIzMGZNYWhURkx1MzE2dVdrTUFn?=
 =?utf-8?B?L1JWZWQwc2FFamV0TU5zQ2JmdndlN28rK0Q2QjlQRW8xaGx3MWNqR3dHb092?=
 =?utf-8?B?SzNSeHlKbGZzM2hQQ0RVb2d2Vmt2RlgzQTJXTjA1SFpFSlVHSTNLeU94R0FG?=
 =?utf-8?B?QVpBMDZWTHVCZTNMd0VVYklLbS9Ca2k5SktYYnpXdWFJYTVPUERJMmZxMGRM?=
 =?utf-8?B?dzREMHY5dzcyRU1JYmxIUEcwWWlDQ044TjNQRHovSFpPL3g3andPbGFiTEVs?=
 =?utf-8?B?OVBFRXQ2VWRQUEFJYWxYM3gwZTdGNEdEMmtTUFlDWHY4N1JncGlGendvdGFH?=
 =?utf-8?B?U0hJc0pXVXpPUzdGY1pzSlBFQkE3V2RiQk1YWWdSc3RtUzRudWxDcVpKNk1Z?=
 =?utf-8?B?VUg4UUpLcCszcDg0cjEyRDZyUnQ5TVk4cHNMMFpEcWhzVm9LcGlnekpyMEw5?=
 =?utf-8?B?TmN6emx6bUJ4Yk1UdUVBNFgwcWRFTkoxbmJ4a0V3YzhCRTI3aFZKbkhDZjFO?=
 =?utf-8?B?Y0VmZ3FnbXZldzdQTXFZdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkhxMXRlTUg3TDdyOWZLRnFCUjJZZ3FocEptNzlNZnZpSkd2ZkpETDFvdTBJ?=
 =?utf-8?B?eWpOY1lkdGlyMGRMYlRMTlVvSjdnbEJZa0NmNFJ1QlNvSlE5VmdkMWR1aHhH?=
 =?utf-8?B?bWJUaEdVUTVwb0czaGJUSk1xQUpVQS9DQzhmSnhONUJlQ2toSG1wSjIxTTBi?=
 =?utf-8?B?c3M1TGNYRzNxMENHK2oxQkZ1UjVRcG1KdXJObzR5WnRuelZwdjQyaEl1MUJx?=
 =?utf-8?B?bmVBRVRwcU1pNmg2RmRlNnhTWUpnV0dBOTFUcFVURE1OZWRnWm02REVOVTRF?=
 =?utf-8?B?b1JINHVlMmdaQzNDajl4UnR6QUhzellrWjVqRGErbFpLeTVieGo2bSthUUNR?=
 =?utf-8?B?ODEwUTk4ZDJMa0x5eUdyMUpsb0ZHRnE3NHBuVnh3Vk9mK0ZQQzFPNFJDaVE5?=
 =?utf-8?B?V0luWGorUUtMbWZ0SkhpaDhrY1NUV2F0V3pVa2M5NU5ib0JDWEpvd1o0WWli?=
 =?utf-8?B?SWVwNi8vLzI2N2pnUU5pMHJ5UmU2V1BtaGRuL2pUWTZaV1hqVnBKMjlKU0FE?=
 =?utf-8?B?NE9EalNjNXBnclpqeFJtK3JqMklkWExuVHdMR1F3cFQ0Um9EOE9IOWxTRW1z?=
 =?utf-8?B?M1dIN0Q5MXoxSC8xY1BlbHJUck1zVDBmY2dQOUUxR0N4dHVmRmRVZGpyMVBw?=
 =?utf-8?B?M1VmL28rNGQ5K2MxYUpYZW9RUHJlRnZrYnNuc09ySXhlNXJHU0FXM3JaMDlH?=
 =?utf-8?B?dU9iNWVwblNKckw2cWJDWGU1VmprcjExWDFTYk5rdjNCclFpOFFJS2ZkMXg5?=
 =?utf-8?B?NXBkV1ZaWVV3dXU4ajUzRnlTT0E1aGQ3VHRTQzhtaWhiQkhxczY0SEN2Tlcx?=
 =?utf-8?B?Z2xXbk1nTlNGKzZHNHBManNnRzJYSWJ4UU5aa3JPMW0yL1c1Y1g0Wk94b2dw?=
 =?utf-8?B?ZWpaZ0RWVEhJOFRDSzViTFZReXdCaTNNZW45VUxIRW5DZ0orVmpjU0EzWEpm?=
 =?utf-8?B?WHNNMUlEdXpHQ3Q0Qk4zb09zZExjRWxXcGZFQkFaZWVZMEZuM3EyQVErN0VU?=
 =?utf-8?B?V2tnUWNGZ2NXZDkwcjRCMFRKL3p5ajViNTEwVGdHTlpnQ0VwMy9OS294dVJl?=
 =?utf-8?B?TkJMT1FUaytvSzBMaTF5LzhlK3BDTXlSL0E3bDU3dVpRb0NJTmF1SUlyaTFP?=
 =?utf-8?B?dHJGaXJRY0xIL0R5RmJFR1FwQXZOQ1pTaGtwMkg1U2hDRUVHTytMa2RjQ2Y0?=
 =?utf-8?B?WVV1cllCaG5Xa1ZSamQzbFRhVThsRStDSXl2czZTVGFNKzdvdHc0YzkyODZs?=
 =?utf-8?B?dzhvdkV2K1JuY0NPOVJVSG5kTEIrZC95bU5nY2JHRmY3ckNHVExhQm16cU1F?=
 =?utf-8?B?U0ZTbERuQ0YwVURwNmhSNWpaUG4vWCtkTFVPcWEvOVpYTjVBb0JrMlVXdzZ4?=
 =?utf-8?B?OGJIemQzWk1lTzBoQXovcTdQYzZPMDR2ZVd3ZGtMSEJHVGRqcEZqMHlrYXE4?=
 =?utf-8?B?ek5TSGN4SjAvdVY2NSs0eXFCWTJZOVlzNHQxbnlQL1ZmbFh6Ujh6eTN4MGlT?=
 =?utf-8?B?OXF6K3FaTkhsM0ZhdFNDNUprTjdNNXpEOUlLZ3RUdlowbzdCNGg1YVVxMkFl?=
 =?utf-8?B?cWlTWnBWUVZhc1lzUjRUYTZYQlpCbnduZG53MEdPVS9NTWR0Q09GeERoMUhr?=
 =?utf-8?B?Sjk4NVZHVlZXVjlLOVhSVW5QakZZdjNPd3dJQUNGeWtoKzlBUWdYYWtrbVdm?=
 =?utf-8?B?MzlzY0c1WTRlYTZPTSs1Rng0OGh5Q296aTlMM3ZwZXlWVkZ4c2dEcUNqVTVT?=
 =?utf-8?B?VEZDbndES0xkaUZSRGd0Q2VRc2ZtYTFRbEhlcWloNEtLOExuRnBjTGJNd3ox?=
 =?utf-8?B?Qm14Z0FPM1ZEUGRoLzZCcGxBai9OSlNPU2dxSXFZa01uaDJaNk5rMHlROHlv?=
 =?utf-8?B?eWRuMTZRREVucmNtUklKQSs4NFZvb0R5K1piRlZySTRsU3lCTHB3T2dkM2hm?=
 =?utf-8?B?bW9xTktlUFRQQ1ptejVxOVNsUmFMTXluSGxWbENsTW5mL2c4em94cWpxUFJS?=
 =?utf-8?B?cElTVDBIeEZKbE9zY083UzVZbWZpayt4SHU0WVd5Wi9DSjMyd1RMU01Fcjk1?=
 =?utf-8?B?TjVwWEplVG5jMktrZWRURWhhQW1rS2NPZ1Q2MVVQMXNFanMzMk1CS0x3c2wx?=
 =?utf-8?B?a2J5bndNZTI1ZjJ0WDZyY1pSQUw5cXZNUFRMZ2prYnNUcE4xK3pVQytuT1ZR?=
 =?utf-8?Q?c0Z+xAlD+ZHg8JRGDwsjLn4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97be6042-b785-498f-9f52-08dc9a06b11c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 19:47:51.3898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: To+lzZ6J+j9UBoJh1bCWWxnOjUmPib/olFeQbFX3+rRaczriOx1VVegxB7MEzPFc1/PbJxhd1FZoFIiYDbp6QrWMJtOplOXanxseceohjSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7960
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

On Sun, Jun 30, 2024 at 07:52:57PM -0700, Ashutosh Dixit wrote:
>Add "xe-ref-count" and "sysctl-defaults" subtests.
>
>v2: Set INTEL_XE_DEVICE_MAX_SUBSLICES to 64 (value on PVC)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> lib/xe/xe_oa.h      |   2 +-
> tests/intel/xe_oa.c | 805 ++++++++++++++++++++++++++++++++++++++++++++
> tests/meson.build   |   2 +
> 3 files changed, 808 insertions(+), 1 deletion(-)
> create mode 100644 tests/intel/xe_oa.c
>
>diff --git a/lib/xe/xe_oa.h b/lib/xe/xe_oa.h
>index f6f2768b00..27ebb4b217 100644
>--- a/lib/xe/xe_oa.h
>+++ b/lib/xe/xe_oa.h
>@@ -19,7 +19,7 @@ extern "C" {
> #define _DIV_ROUND_UP(a, b)  (((a) + (b) - 1) / (b))
>
> #define INTEL_XE_DEVICE_MAX_SLICES           (8)
>-#define INTEL_XE_DEVICE_MAX_SUBSLICES        (32)
>+#define INTEL_XE_DEVICE_MAX_SUBSLICES        (64) /* Maximum on XE_PVC */
> #define INTEL_XE_DEVICE_MAX_EUS_PER_SUBSLICE (16) /* Maximum on gfx12 */
>
> enum intel_xe_oa_format_name {
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>new file mode 100644
>index 0000000000..2b5044b116
>--- /dev/null
>+++ b/tests/intel/xe_oa.c
>@@ -0,0 +1,805 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2024 Intel Corporation
>+ */
>+
>+#include <stdlib.h>
>+#include <stdio.h>
>+#include <string.h>
>+#include <fcntl.h>
>+#include <inttypes.h>
>+#include <errno.h>
>+#include <signal.h>
>+#include <sys/stat.h>
>+#include <sys/time.h>
>+#include <sys/times.h>
>+#include <sys/types.h>
>+#include <dirent.h>
>+#include <time.h>
>+#include <poll.h>
>+#include <math.h>
>+
>+#include "drm.h"
>+#include "igt.h"
>+#include "igt_device.h"
>+#include "igt_sysfs.h"
>+#include "xe/xe_ioctl.h"
>+#include "xe/xe_query.h"
>+#include "xe/xe_oa.h"
>+
>+/**
>+ * TEST: perf
>+ * Description: Test the Xe OA metrics streaming interface
>+ * Category: Core
>+ * Mega feature: Performance interface
>+ * Sub-category: Performance tests
>+ * Functionality: oa
>+ * Feature: xe streaming interface, oa
>+ * Test category: Perf
>+ */
>+
>+#define OA_MI_REPORT_PERF_COUNT		((0x28 << 23) | (4 - 2))
>+
>+#define OAREPORT_REASON_MASK           0x3f
>+#define OAREPORT_REASON_SHIFT          19
>+#define OAREPORT_REASON_TIMER          (1<<0)
>+#define OAREPORT_REASON_INTERNAL       (3<<1)
>+#define OAREPORT_REASON_CTX_SWITCH     (1<<3)
>+#define OAREPORT_REASON_GO             (1<<4)
>+#define OAREPORT_REASON_CLK_RATIO      (1<<5)
>+
>+#define PIPE_CONTROL_GLOBAL_SNAPSHOT_COUNT_RESET	(1 << 19)
>+#define PIPE_CONTROL_SYNC_GFDT	  (1 << 17)
>+#define PIPE_CONTROL_NO_WRITE	   (0 << 14)
>+#define PIPE_CONTROL_WRITE_IMMEDIATE    (1 << 14)
>+#define PIPE_CONTROL_WRITE_DEPTH_COUNT  (2 << 14)
>+#define PIPE_CONTROL_RENDER_TARGET_FLUSH (1 << 12)
>+#define PIPE_CONTROL_INSTRUCTION_INVALIDATE (1 << 11)
>+#define PIPE_CONTROL_ISP_DIS	    (1 << 9)
>+#define PIPE_CONTROL_INTERRUPT_ENABLE   (1 << 8)
>+/* GT */
>+#define PIPE_CONTROL_DATA_CACHE_INVALIDATE      (1 << 5)
>+#define PIPE_CONTROL_PPGTT_WRITE	(0 << 2)
>+#define PIPE_CONTROL_GLOBAL_GTT_WRITE   (1 << 2)
>+
>+#define MAX_OA_BUF_SIZE (16 * 1024 * 1024)
>+#define OA_BUFFER_SIZE MAX_OA_BUF_SIZE
>+
>+#define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
>+/*
>+ * Engine specific registers defined as offsets from engine->mmio_base. For
>+ * these registers, OR bit[0] with 1 so we can add the mmio_base when running
>+ * engine specific test.
>+ */
>+#define MMIO_BASE_OFFSET 0x1
>+
>+#define OAG_OASTATUS (0xdafc)
>+#define OAG_PERF_COUNTER_B(idx) (0xDA94 + 4 * (idx))
>+#define OAG_OATAILPTR (0xdb04)
>+#define OAG_OATAILPTR_MASK 0xffffffc0
>+#define OAG_OABUFFER (0xdb08)
>+
>+#define XE_OA_MAX_SET_PROPERTIES 16
>+
>+#define ADD_PROPS(_head, _tail, _key, _value)	\
>+	do { \
>+		igt_assert((_tail - _head) < (XE_OA_MAX_SET_PROPERTIES * 2)); \
>+		*_tail++ = DRM_XE_OA_PROPERTY_##_key; \
>+		*_tail++ = _value; \
>+	} while (0)
>+
>+struct accumulator {
>+#define MAX_RAW_OA_COUNTERS 62
>+	enum intel_xe_oa_format_name format;
>+
>+	uint64_t deltas[MAX_RAW_OA_COUNTERS];
>+};
>+
>+/* OA unit types */
>+enum {
>+	OAG,
>+	OAR,
>+	OAM,
>+
>+	MAX_OA_TYPE,
>+};
>+
>+struct oa_format {
>+	const char *name;
>+	size_t size;
>+	int a40_high_off; /* bytes */
>+	int a40_low_off;
>+	int n_a40;
>+	int a64_off;
>+	int n_a64;
>+	int a_off;
>+	int n_a;
>+	int first_a;
>+	int first_a40;
>+	int b_off;
>+	int n_b;
>+	int c_off;
>+	int n_c;
>+	int oa_type; /* of enum intel_xe_oa_format_name */
>+	bool report_hdr_64bit;
>+	int counter_select;
>+	int counter_size;
>+	int bc_report;
>+};
>+
>+static struct oa_format gen12_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OA_FORMAT_A32u40_A4u32_B8_C8] = {
>+		"A32u40_A4u32_B8_C8", .size = 256,
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 32,
>+		.a_off = 144, .n_a = 4, .first_a = 32,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAG,
>+		.counter_select = 5,
>+	},
>+};
>+
>+static struct oa_format dg2_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8] = {
>+		"A32u40_A4u32_B8_C8", .size = 256,
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 32,
>+		.a_off = 144, .n_a = 4, .first_a = 32,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAR,
>+		.counter_select = 5,
>+	},
>+	/* This format has A36 and A37 interleaved with high bytes of some A
>+	 * counters, so we will accumulate only subset of counters.
>+	 */
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8] = {
>+		"A24u40_A14u32_B8_C8", .size = 256,
>+		/* u40: A4 - A23 */
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 20, .first_a40 = 4,
>+		/* u32: A0 - A3 */
>+		.a_off = 16, .n_a = 4,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAG,
>+		.counter_select = 5,
>+	},
>+	/* This format has 24 u64 counters ranging from A0 - A35. Until we come
>+	 * up with a better mechanism to define missing counters, we will use a
>+	 * subset of counters that are indexed by one-increments - A28 - A35.
>+	 */
>+	[XE_OAC_FORMAT_A24u64_B8_C8] = {
>+		"OAC_A24u64_B8_C8", .size = 320,
>+		.a64_off = 160, .n_a64 = 8,
>+		.b_off = 224, .n_b = 8,
>+		.c_off = 256, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1, },
>+};
>+
>+static struct oa_format mtl_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8] = {
>+		"A32u40_A4u32_B8_C8", .size = 256,
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 32,
>+		.a_off = 144, .n_a = 4, .first_a = 32,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAR,
>+		.counter_select = 5,
>+	},
>+	/* This format has A36 and A37 interleaved with high bytes of some A
>+	 * counters, so we will accumulate only subset of counters.
>+	 */
>+	[XE_OA_FORMAT_A24u40_A14u32_B8_C8] = {
>+		"A24u40_A14u32_B8_C8", .size = 256,
>+		/* u40: A4 - A23 */
>+		.a40_high_off = 160, .a40_low_off = 16, .n_a40 = 20, .first_a40 = 4,
>+		/* u32: A0 - A3 */
>+		.a_off = 16, .n_a = 4,
>+		.b_off = 192, .n_b = 8,
>+		.c_off = 224, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAG,
>+		.counter_select = 5,
>+	},
>+
>+	/* Treat MPEC countes as A counters for now */
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8] = {
>+		"MPEC8u64_B8_C8", .size = 192,
>+		.a64_off = 32, .n_a64 = 8,
>+		.b_off = 96, .n_b = 8,
>+		.c_off = 128, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+	},
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8] = {
>+		"MPEC8u32_B8_C8", .size = 128,
>+		.a_off = 32, .n_a = 8,
>+		.b_off = 64, .n_b = 8,
>+		.c_off = 96, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAM_MPEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 2,
>+	},
>+	/* This format has 24 u64 counters ranging from A0 - A35. Until we come
>+	 * up with a better mechanism to define missing counters, we will use a
>+	 * subset of counters that are indexed by one-increments - A28 - A35.
>+	 */
>+	[XE_OAC_FORMAT_A24u64_B8_C8] = {
>+		"OAC_A24u64_B8_C8", .size = 320,
>+		.a64_off = 160, .n_a64 = 8,
>+		.b_off = 224, .n_b = 8,
>+		.c_off = 256, .n_c = 8, .oa_type = DRM_XE_OA_FMT_TYPE_OAC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1, },
>+};
>+
>+static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
>+	[XE_OA_FORMAT_PEC64u64] = {
>+		"PEC64u64", .size = 576,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC64u64_B8_C8] = {
>+		"PEC64u64_B8_C8", .size = 640,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+		.counter_size = 1,
>+		.bc_report = 1 },
>+	[XE_OA_FORMAT_PEC64u32] = {
>+		"PEC64u32", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 1,
>+		.counter_size = 0,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u64_G1] = {
>+		"PEC32u64_G1", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 5,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u32_G1] = {
>+		"PEC32u32_G1", .size = 192,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 5,
>+		.counter_size = 0,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u64_G2] = {
>+		"PEC32u64_G2", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 6,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC32u32_G2] = {
>+		"PEC32u64_G2", .size = 192,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 6,
>+		.counter_size = 0,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC36u64_G1_32_G2_4] = {
>+		"PEC36u64_G1_32_G2_4", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 3,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+	[XE_OA_FORMAT_PEC36u64_G1_4_G2_32] = {
>+		"PEC36u64_G1_4_G2_32_G2", .size = 320,
>+		.oa_type = DRM_XE_OA_FMT_TYPE_PEC,
>+		.report_hdr_64bit = true,
>+		.counter_select = 4,
>+		.counter_size = 1,
>+		.bc_report = 0 },
>+};

I think we should do away with the per platform arrays and instead do 
something similar to what the KMD does - have a platform mask or 
something because really the same format does not have a new definition 
for another platform. It should just indicate what platforms the format 
is supported on. Maybe please create an issue to track this and we can 
look at it later sometime.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

