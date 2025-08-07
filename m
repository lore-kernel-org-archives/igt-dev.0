Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8468DC87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 06:15:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B98A10E7D2;
	Thu,  7 Aug 2025 06:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FX9vWg0q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C71810E7D2
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754547309; x=1786083309;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hgN05MZDl+BHQ867irvZf3uhGD1A+BJOgoqCq5VcCr0=;
 b=FX9vWg0qAUKypS59YtmOFRMtPRUQBFRPZPcp6x9kRY0c3cHlFjwgIlH0
 Cy6MKt4lbfTJ4QEt5w7UMJWr4B01cTpc5v7B9pRFIF5pt6T9ssUgnYTrG
 k3atNayfU87WMlrLcOeQN/BId2XV1YDc+DZnc6hgo8paK8KshUh8xItUm
 1gkljcPRYPa5+zdO+p1pGCjPFP5jtCGaW/cky80ZzTj1w8+RjKQxZKVCM
 iRLMNNUxhC3hfoYClCFee3Q0kBMKZPNZSgDI+rJOcSyNV2BP8xN7MR/GM
 wFoT8UGR2Je9b7CGSaRiHSMFDNNansW+8I2jWtbK37o2Y4Doa2Odsh8e8 w==;
X-CSE-ConnectionGUID: B7LnMap+S9yadqYan0s0AA==
X-CSE-MsgGUID: oqZeXwIyRjO/pKXwvTUVzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56583112"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="56583112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 23:15:09 -0700
X-CSE-ConnectionGUID: qr1Krz+aQbqb0cY9gF2wkA==
X-CSE-MsgGUID: LrnUTrl6TmyQnKShefeBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="169167632"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 23:15:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 23:15:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 23:15:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 23:15:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SO/YtWmtpad28KVOJg5OXtt3kNHbV6b18dZEI3tVlWF66E/TeLP5xdtBOB46FcZRn+uvKgwI4FtJVDs+RfNE1TIXhEdWugBu6K5oBosZh8vdQt7UDj9YUlqqLX38d8bbz7SyO7+Mygiqt8mikbXd1BVvUeDCvilDWarzhtsvfbeBEJ71cMw5+1+BhPQEkURxtOHFJFnGqIZ2zn1CHwGK2gRN0jKqm/90KLVOKuXxyh8WOynI6RS/wlWakUDgGTQN9wVSKQwMO/3z3ghwVif7jPxI8jZ0KhKnSV4qGGZUAdqPdHV8L8D6mNoBNZTxDcYrR8aPjSSZvfMd/mVHpS4Bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kL2MOBoohidH3LfnyCwKnZzIz5Z+LJzQ5/0HE8jLEw=;
 b=DnorgdQUKCsCcO6957cXAEgqIqzxcguKz4elAYR8sGRZi6eStZAteWUyXYVpT+kJFQaETzXRs7O1KyCWez/ceJ5EqPQ3xt8hzcBUTUhgVLeXz7zJngUWjKlPqNFpfY5NsJvKs6iFL9701u52A5Y0pLFkrU/blQP0hb+uNrsSsh+ypV2TRLiiUWcNXbs6nVlNZe9ibryqBZKi4Gg07L87zoTmPEUE6C4/3mY7cqFqrdMgFhh5tsH+1LghYp+OUiwjnYlmsP8GbPubZLDws7EIoVaYmcKCW5lJEPrnW/6Icjzk5dYyQbJr0F4oNhEqdZtyGeLJhROPX7IU5qsy1DCQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by IA0PR11MB7936.namprd11.prod.outlook.com (2603:10b6:208:3dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 06:15:00 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.020; Thu, 7 Aug 2025
 06:15:00 +0000
Message-ID: <7f82f0f9-3d5d-4c29-a440-b1fb91365114@intel.com>
Date: Wed, 6 Aug 2025 23:14:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Break early if the
 test is done
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250804191531.1393272-2-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250804191531.1393272-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::30) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|IA0PR11MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 823db4dd-d8d9-45a6-38af-08ddd579bd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG9IYnVjemxpbFVzUmdGY3Zsb1kzZ0h0dHd2WXo3Mnd4YkJhYmVFWitaMmFs?=
 =?utf-8?B?M0lRcmVTd1Z2NTRGS056b2lqZXdXWWtHZElsaVM4MTZQQ203SkU2Vk11Um1p?=
 =?utf-8?B?blYxOUJ2Q2lUQ3JCYWQvMnB2U09sVmxMd1VWMlBjSTBMSzZwYVA4SWVzUzBk?=
 =?utf-8?B?aC81S0RaeUwrRU4rZzNmNEcrckxyZExscnAyaHRkdVJ1TlYzY1k4NTdzWXk5?=
 =?utf-8?B?eTZRdTVCRXpITzVSa2Z2T24reHEzdVdWUDhzV2NQNXIzNUYvK3Fzc3NPLzJj?=
 =?utf-8?B?WUdRUExJUjRuS2tZK3hxZmNwZXI2UTltZlZkQnZBTDFaaXZYSFhPUlEzQVpP?=
 =?utf-8?B?ZzFNTXVWUXpUM2hqT3AwOFpCTlM4ZlRyVmsrSzZ5ZTM4UWc3LzIvOTZDdnlG?=
 =?utf-8?B?WVN0RFBNaktEWlNvV0pzQjdyakFxTU1ZTHp6eERXVHFEOHlaK0MzZSs4UFNZ?=
 =?utf-8?B?MXA1VE8wcFJsODYxeEZsZUhzTmdIRVhaeERhUTJiZWNCdGtkUURFZmhCbDkx?=
 =?utf-8?B?L0YwalRydHpyVUNSeDFyUi90cDd4WmxHL0ZLdWM0THlDUURTbzZVdnM3K3hu?=
 =?utf-8?B?eG50TDh1S2pKcm5tNDlKWmg4MDFhelhjYXN2K1dnVUVLNWNVYlhJdFpUSXZl?=
 =?utf-8?B?LzZxMVNqQ1NpTmx0bTJtTnlBUnJNZTVpS1c2ZjJaV29xNEVMOHpyN2xhdUpr?=
 =?utf-8?B?YkFYUGRsa0lSZ0FWdTMrZlF6M0x0UGNrWWZWV2ZTTlQ1bkhlamsrRkVyc0Jh?=
 =?utf-8?B?WkpRMXdQZzkwbVgvWDJkdnZPUUlPckZidDFnZjM0bzRGOTVaZ2RUY1VFcUM3?=
 =?utf-8?B?R3VNa001by9zUVdDYUZxb3FrZTA2WmtReHY4cUVINFAwb1orVzVEZFZOcXJI?=
 =?utf-8?B?V2lxdU0wV2Z5OUpmZ0hTbFpGd1YrYTZwTCtlUUFQK096TWdmVXUzTStxWXVO?=
 =?utf-8?B?c2lKTWtNZXZ3OGFiVmxEWGVWSEFJc3JHVkhhUGNOWDVxRnUwQi9ka1NiQjVL?=
 =?utf-8?B?NEVXdnRaNXlWNkhMWG9Pb3MzcEFvTjQ2QlJuWGhLODZ0RlF5cDJZeFpCRDdO?=
 =?utf-8?B?N1QvTUd5VHd6aXJxdzVycU5wQUUwU0pwYURXK2xJT0VzSmIzamh6OGNkbDRh?=
 =?utf-8?B?d29Tcys3cjBWWGFpTXlRSEM5aENQejgrenRzNjd6dnRxZE9JZ1EvQ2V1U3V3?=
 =?utf-8?B?M3N5QjZ3cHA1MEc1RjMzY1htVGJFTHZCV3d1MGhYTnRFSXB2MkNwOGNmZVRN?=
 =?utf-8?B?ZXNQWGRZcy9aNmZZN3BaUnRBMGUvdkMvWmxNZWtHU0hRZENLMkEwNTFqOC80?=
 =?utf-8?B?dWhpVWs1NFFPUFFteTlPVm5xY0dhQzNuVzFBOGNidy9vWFNSYVpRdHhSakVG?=
 =?utf-8?B?VEtWdTFXbDJJeGtRQVZ6MHNaZG85eVhaWEp6VjlNa3BuSlpsa0dNOE01ZWpM?=
 =?utf-8?B?WjJ6U004STdzbldvZ0RmTkFLemhMU0k2VEc1clVuMDJIRVFFNGFlSlV2WG9T?=
 =?utf-8?B?eWI0WFFicm1WRDJGVXZlUEtlTmNEcXQrVGpPbmdqaVdMckdScUtvL0JZWjNT?=
 =?utf-8?B?U0V2b2NNKzZWaGkzb2dOQ1Q4UkszbmFNWlE3VXdBZDAyZnlsYzA0QmpHdDZa?=
 =?utf-8?B?dW43VzhIbk5OYS9SUlhGcVJGNGxTUXdHU09lUlpPN1lSLzRSUzNVMjk4b3ph?=
 =?utf-8?B?R2U1ZzQxTGNubThDQTgxWkdJdlIzOW9WM2Rwc29yS2xlV09ySWtveXV0T1Jm?=
 =?utf-8?B?Qmt3ZmhhL1VNT0FCM3h6Y21ONzNBblF2NHltdWRXRGtIY0dweW9RK3JCTmZO?=
 =?utf-8?B?dUNDSndlbmloTzZyRTc0bHMxUGNnWlRiSTlTS3ltdUpDOGlBMWxwYml5ckIw?=
 =?utf-8?B?NFVNUEdxTjlPM01GUUNpUkdnVDNaNEJqa0xtWUlyejJVK3R0NDJsYndyWTc3?=
 =?utf-8?Q?D2gmfjq/Ao8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZneitwSDJIdDlrL0UybEd2anc4QThwaVJsbG9WVVpPV3dSdkR1QmJLUXBN?=
 =?utf-8?B?a2t1a2FZSVNNYVduSG1CS2R4d1Z6TEFCS29Hc1lHYVlOcjc1cWtoZHFKTmV5?=
 =?utf-8?B?bHpLT09UWUFMSmRZZEZkcHpPaWtkVEZ0WWJOd1ptTVljL3BpUGY0U2ttU2Zu?=
 =?utf-8?B?NzR2V2RQdTNrOGVxSStLSG1Qc1NsSlBKaXVVaHZMUVBRVW4zS1ErYjU0V1Bu?=
 =?utf-8?B?OEYyT09hNU94MWJUcVdNNHhtbVFXUmpNaEhJc09OYmhwckxmWG1veVR3ZlI4?=
 =?utf-8?B?TzBSWFdkdkFXYjE5QlhvN2x3OGx1dDRwU1hNcGZjdnpLaURQcW1ZQmJrWXFR?=
 =?utf-8?B?OVpzM0RLL2hNQXc0UGlYRDBlQi9naURMUUp3b2RTWUJwTklQYTltV0lHK2l2?=
 =?utf-8?B?Y2xzeGIwQkhrVHRCdDlkdzBrZmkrTXdnaG9zRDFqWExVRWdOODM0VHZjbWQ4?=
 =?utf-8?B?UUdvNjBUczR5cVF0WW05OWVUTW1KSG83eWx0TG5VeVc0M3BxQ21RVE9MWnlp?=
 =?utf-8?B?OUMxTGpIelRaQVZ6MmNMNDNDa0JyTGlNNDd2UUpIRkNtVU4wakxoWDV5U0ls?=
 =?utf-8?B?VkovbU5qazN4SXZKNjdYZWtwSWV6bTRReUtTS1gySzZBUzB3VWplSGY1d1BK?=
 =?utf-8?B?YXo3WDdnZUdrMngwNWtiY1VPaTBjb1I4OWR4UnNadDhveDFhYlZjbm5Lc1I1?=
 =?utf-8?B?NmUybXRLLzgvWWQ4RUxGT2NnMmpHRjZvWDE5bXpxVW9IL3JoMjljVENSRS9l?=
 =?utf-8?B?L3BiZjdWVytvWFZCeUtiNjk0WmUwdmJQY0JFV2xLRHl6WlRYbVk3NFRaVUJ0?=
 =?utf-8?B?STVscVR0VHlQYjhoTVNjNndEZVlVZ210dExjNjBVeVNPWjQ3QWNYR3ZxcjNR?=
 =?utf-8?B?MHVJZ08zV05OOHkwc21hVW4rWlZsQzVtNWFUaDZ3eUx5U2pPUGZyZ0tzQVZD?=
 =?utf-8?B?QlhOb0JZa0ZiRUNHUGl5S2ovdkJoN010b0ZDUDlBaDZYNGt2ZklyaG93ZVFu?=
 =?utf-8?B?dlg0YXQyUHRmOU1vUDRPQ0tFMG1QMHU4UEs5V2IwU1dDdkxnTzZSZzdqNzdL?=
 =?utf-8?B?dDFidVNCc2E5OWJSa0Vqd2V5WFB2Vk5Zb0FBV3pJUGwzdFBOa2NmNUNaMWV6?=
 =?utf-8?B?ckc1WWJVSExROXFhMi9MWUJXNHEvTHBDekZLbHNLekhuWlZER3VrRTlSUFdL?=
 =?utf-8?B?VXkwK0p5Y3FpTjhadTRKZDh2VHdyeVhERkJzYzFTbGFKWTFvb1lqazB6ZUND?=
 =?utf-8?B?WGI2eHcxWm5lUzlqTVVWVWEwaW9hTnlSMmZiT3JzVjRtNUVoYnhTeVVMU2F4?=
 =?utf-8?B?WjdPcXljUXdrd0M0ejI1bXZEQndaWXZTeU91UUgzUUtkYXBJMzlYczBGNmNq?=
 =?utf-8?B?TFNlQ3BDcWVCc0RoN1RFUEJCSk9sZ0tyNzQ2SGNFaWZQUjlVbEFvVWIvMUls?=
 =?utf-8?B?Tm0xYTJaSUdiekxBSDFPWlpTSUo1ZHBkNkI5Y0g0NWV2NStSNXNxT2RhOEMx?=
 =?utf-8?B?aHJRWkhZVzdaOXFtaUJMVDVpSnNwcHE0UGlvM0Erc1hIcmFFNkU1dHBiSEZh?=
 =?utf-8?B?cXFVejZlelFMVHdHVXFFbTVXd3lMMDVlUytRcE1sZkN2ZkwzS1Y1Mm82cVZV?=
 =?utf-8?B?Tm5hdEIyNzR5R2hQVjZDSGdDTEswTjlpWGdSYWg2SDNwV1V3TDhMVnhWYkJj?=
 =?utf-8?B?aW9uQkwwWkkwbkIrbTNSelVhSWNhYUQ0ZmZ0WHZrazdPUjNNRno4R1JqZS94?=
 =?utf-8?B?Y2djRE1FdFRPUUJyN2lSNDA1OGFLSU9NaDEyYXRZMFJnNTZ2SmhoY2o1eVJK?=
 =?utf-8?B?d1RObDZqMEI1RHZsMkVrNS94KzVTckh3cTRXeUQ0OU1PWllmVzQ2NXhzVWly?=
 =?utf-8?B?eGdUSlZOa0xpelg0SUJUQkc1UUFmWFpPalJ4WFJjaS9ZM083WmR6Um1uUnZN?=
 =?utf-8?B?aW1wVUVBY3hwUGJMRkxiTis2anQ2VFhDWjRnZ3VEZERYbDB0c0NSWEtMYzhL?=
 =?utf-8?B?ME9Od09ESGdWeHV1Y2lNRU42T2ppRFZMR2xwVmVjTHYrRU4wMW9tZVoxdVZX?=
 =?utf-8?B?UjJKUUM0bERiTERNOFYvMXJXQWE1VzhyWUlrMjBGbHIralJ2dEgwUkovTE5U?=
 =?utf-8?B?SWZSdEdoVTVQdUJsT3RGdzBhMlFteHVKTnFEN1plZFFVQktDd2lUdm4zcmpI?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 823db4dd-d8d9-45a6-38af-08ddd579bd16
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 06:15:00.0733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCtEVKiO5KGPCa/1rnSvHPV0/YtYuunx5f3PV7mUUXHZRlnX2ElZPwCvi7B0k94pk6vNPyeKFMWAT9uVlGn9/zSBqJo4TIw4pG60Nb1asZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7936
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

On 8/4/2025 12:15 PM, Daniele Ceraolo Spurio wrote:
> For the GuC communication injections, the test is currently looping for
> an hardcoded 100 times. In the current driver we call the 2 GuC
> communication functions way less than 100 times each (in one run I've
> counted less than 40 for one and less than 10 for the other), so for
> the majority of the iterations the test is just reloading the driver
> without any injection occurring.
>
> To avoid wasting so much time, we can just break early if we've reached
> the point where no more injections are occurring. If we use a positive
> value for the "times" parameter in the injection framework, the value
> will be decremented every time an injection occur in the given
> iteration, so we can break once we detect that the value is unchanged.
>
> While at it, add an assert to alert us if the number of calls to the
> function increases above our current maximum number of loops, so we know
> that the test needs to be updated.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 37 +++++++++++++++++++++++++++++---
>   1 file changed, 34 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 8245c558c..00d045cd8 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -27,7 +27,8 @@
>   #define INJECT_ERRNO	-ENOMEM
>   #define BO_ADDR		0x1a0000
>   #define BO_SIZE		(1024*1024)
> -#define INJECT_ITERATIONS	100
> +#define MAX_INJECT_ITERATIONS	100
> +#define MAX_INJECTIONS_PER_ITER	100
>   
>   int32_t inject_iters_raw;
>   struct fault_injection_params {
> @@ -194,6 +195,19 @@ static void cleanup_injection_fault(int sig)
>   	injection_list_clear();
>   }
>   
> +static int get_remaining_injection_count(void)
> +{
> +	int dir, val;
> +
> +	dir = fail_function_open();
> +	igt_assert_lte(0, dir);
> +
> +	val = igt_sysfs_get_s32(dir, "times");
> +
> +	close(dir);
> +	return val;
> +}
> +
>   static void set_retval(const char function_name[], long long retval)
>   {
>   	char path[96];
> @@ -288,14 +302,31 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
>   	*/
>   	iter = inject_iters_raw;
>   	iter_start = iter ? : 0;
> -	iter_end = iter ? iter + 1 : INJECT_ITERATIONS;
> +	iter_end = iter ? iter + 1 : MAX_INJECT_ITERATIONS;
>   	igt_debug("Injecting error for %d - %d iterations\n", iter_start, iter_end);
>   	for (int i = iter_start; i < iter_end; i++) {
>   		fault_params->space = i;
> +		fault_params->times = MAX_INJECTIONS_PER_ITER;
>   		setup_injection_fault(fault_params);
>   		inject_fault_probe(fd, pci_slot, function_name);
>   		igt_kmod_unbind("xe", pci_slot);
> +
> +		/*
> +		 * if no injection occurred we've tested all the injection
> +		 * points for this function and can therefore stop iterating.
> +		 */
> +		if (get_remaining_injection_count() == MAX_INJECTIONS_PER_ITER)
> +			break;
What about the case where remaining comes back as zero? That would mean 
that there were more than MAX_INJECTIONS_PER_ITER in the current pass so 
we not testing every failure point we otherwise would have. Or are we 
not worried about that?

Basically, we are testing a rolling window of function instance (i) -> 
(i + MAX_INJECTIONS_PER_ITER) where i varies from 0 -> 
MAX_INJECT_ITERATIONS. If both limits are greater than the actual 
instance count, then that becomes simply (i) -> (end) but if the per 
iteration count is less then it is a rolling sub window.

If the intent is to always test from (i) to (end), then there should be 
an assert that remaining does not come back as zero. Or better, the two 
defines should just be a single define called 'MAX_INSTANCE_COUNT' or 
some such. Because the number of iterations and number of injections per 
iteration are really just 'how many times is this function called'. The 
iteration aspect is simply the test mechanism rather than the test 
purpose. The test really being "cause a failure of every call of 
function X from the first to the last".

On the other hand, if we think there is value in testing the rolling 
window case - transient fsilures rather than permanent failures. Then 
the MAX_PER_ITER should be a lot smaller (e.g. 10 or even 1), to ensure 
it does not hit every instance.


Broader question beyond this patch - is the plan to enable iterative 
testing of other functions? It seems odd to test every possible failure 
point of the GuC send/recv functions but only ever test the first 
instance of every other injection point. Seems like everything should do 
the looping.

John.


>   	}
> +
> +	/*
> +	 * In the unlikely case where we haven't covered all the injection
> +	 * points for the function (because there are more of them than
> +	 * MAX_INJECT_ITERATIONS) fail the test so that we know we need to do an
> +	 * update and/or split it in two parts.
> +	 */
> +	igt_assert_f(inject_iters_raw || iter != MAX_INJECT_ITERATIONS,
> +		     "Loop exited without covering all injection points!\n");
>   }
>   
>   /**
> @@ -486,7 +517,7 @@ static int opt_handler(int opt, int opt_index, void *data)
>   	case 'I':
>   		/* Update to 0 if not exported / -ve value */
>   		in_param = atoi(optarg);
> -		if (!in_param || in_param <= 0 || in_param > INJECT_ITERATIONS)
> +		if (!in_param || in_param <= 0 || in_param > MAX_INJECT_ITERATIONS)
>   			inject_iters_raw = 0;
>   		else
>   			inject_iters_raw = in_param;

