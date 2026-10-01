Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9E6CA5FA5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9449110E20F;
	Thu,  1 Oct 2026 07:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngDIGQna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6363A10E074
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790841346; x=1822377346;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D7Yc0YtAljVJgdp58Ri4kBhGMwOC90clMQtDzrUdpiw=;
 b=ngDIGQna1PaVLPL84Gn+SRDUuwY8pkZ34X1NjRKMqa5h8CnlQaA3QTpU
 9A17/VccugcMdWKaFtYk0hL/iBP9+E0ryZ6jppUHAIXuDj7Ckj+9PSv8z
 pmw/1ZyFMf9R1SFnSdgb+dHN6HrGLTD6bdWzejF5HDDL1Q/t1xd5sS7/N
 /HDftF1Hb9voQPaGQ4EWa+YotYJnp0jKaCFeCkT7SGnX8kEZixq03AffK
 Ejv1TswLniUAC4v3HHjd410fpqWD/BYV6oJ7pP4hW8ri6Mr5YxzKvUi0d
 smK6YDIssJ6FNo+Metq1J7C8/pw/khA5L+0LRg3RALsDJMrJPN+ZT8FqW Q==;
X-CSE-ConnectionGUID: EeypOjPyT3a4wsnREos0vg==
X-CSE-MsgGUID: WAIagUpZR6KC1BZubho2+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="107972920"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="107972920"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:55:46 -0700
X-CSE-ConnectionGUID: v+FZarIJRBKEo1xmAA4+Yg==
X-CSE-MsgGUID: /6I5uXPCTUSz3NUotxv2yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="280681994"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:55:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:55:45 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 00:55:45 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:55:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZSdjxiBsmYcLT+I8HQi9jK59Wu3FqX7CUqZL3pdJJ8SNXATyIc2R9hEY+cn40RFRiFVjxldNGaaKqJHw3L9p8SjLennNODjRwrxLep7v6sEqQdgaTCm2KkNV+XkAsr5hGZlRvEtUBfQaDrQaUhTqawubebvzlAHYHtyGzLZc18va2DFcLE5BOPP9Ok/m9y6ymj+7WGeB5mgoawF9fAkKF7/3epN3bKVyRrm06rjCwmnW02uX+dZ3El9K6gqxjy2ZYMVKWzT79eZFa7s+2qqXP+XR6i65C3qVoqfiyMbA9cYu0NgDD8EveYfshmIg+loeLAUvWdwP47mLm8VdWU/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f56cx3YQYwIh9dh5aOLJ7TTxjTj7G1Q7SaHXPJFieBc=;
 b=dbW4g8sB4rntZTgBitM9qDKdEfjbcDJyftr1/IJEUO2EqZwh+VSCV5FF760wRvcji3W1vFM44CfFnQMU0uBTi0Ih2VVwdgYEWkr7ByQtLHIvidDyqhpdWaRewzRsLj9gCDzJ58+RbURlgpmR6kS1t5tAVXwO2Ki5RFBF+yVdPOxP4suPq3o2j98IYJlPdnYO9yolHcdZSh0LdQkfsDkFHRCKZBc0KuB0QQFbuKzphH7MU3iwJqHH3TEgjNCnD5TEuhnqm5tFt3hk0BHV6IB8rFA60gG/ufC7EBcSjI2enL7yDa04kZ/lVneQBnGxjax2qbVS9ToEHegtyJnMefpdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Thu, 1 Oct 2026 07:55:42 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 07:55:35 +0000
Message-ID: <9559fce5-4262-48d4-829b-3b2908f74315@intel.com>
Date: Thu, 1 Oct 2026 13:25:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/10] tests/intel/xe_err_injection: add CRI GPU
 requirement check
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-11-ravi.kishore.koppuravuri@intel.com>
 <7e5c94e4-6d7f-46ce-9665-c7788b50f58b@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <7e5c94e4-6d7f-46ce-9665-c7788b50f58b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::17) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: 46142771-074a-4afc-c043-08df1f916024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: X5/tuqQ0UPgDvtfQYRdul6J+tKs8VAY3t9WotqgOHcDQSxBM+ZQWkt1iII5YRdYiKZgMPzaOHvQ3E320Fl/pZg/+nv2bQxQM+h0xhnBXqJ3jlbnald3nqUH3VeYkkn2pwspOcii/9yb2A3oVPdfkXEu9v8MhUXxWnwh2TW8+s/eOypSxjdq/JoDYM0Zo4hG4AHpheRI27bGCeVBeasx76Qfc1W0tEf2oNAYSQALY1xPsD5dTnk8WWxPQ7HoKZM3p8nhUaisdKlEmY7o+JdH0I4aDRXB+xal6K+o5JjtxwRoKuuN35V7hrmbwhzExT/nyI7uZekF5bQir9hsO5PJAIGSoWRit4Y8tVL28LcatKPLdFH+5LQ2NGjpXz/OsFC4dunNzQ9aNCRqNMCC8z4nYeFrDzzCAjgMwU4zWQKimUZJpTEkZu7oGuisGWkyBO5SCtkPoh0qMy8eGGtfHPKXb+rBq5U4fnzCddKh8DiUjW+LV+f3BvmY8EdSwbwiYBmSfnsBe07yuqYXVzBAkYGsWKECGngTzmBVdPABQTgutyEuIgrG94jgY+Qesh//BzBzdn8ZG5Mz5XlOuAbnEDJ4znpN1p7Zbfg+zYSz5YEIZbMBhcjn+pINWyp05FssZmsGF69fnmtigIwLm7QKKkUf5W0khidymdRNH0hdStGr7XOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZlQk8vaEtMTE9VdFZrYSttY1YzMmJTVkhDWHBwTFNRMERBaWpyNHBWdHk1?=
 =?utf-8?B?Q1JhRFB1bnBGT1E0SzA0U1VMdGcxSzhKM3ErZ204MUVtMkMwUUhFdTVYUWhh?=
 =?utf-8?B?S0doYW80Y21wbHJTMkhIclBIUkxKNUlXUE1OVk9oNXVCdUduOFdKdDNmRUVC?=
 =?utf-8?B?M2FSKzRITklZOUdaZmU2MHJwRzhSdEZIUzhvTjN5RXpiMllxbDlyMDVyVlcx?=
 =?utf-8?B?bUk5QVBBU3lQTkFkQlpPaXVDeFNmQmVla1RqWThhMVU0QVVodEZCTXdLMFJo?=
 =?utf-8?B?NDFPQlFadEVjeWZ1RFdPMWNRREdraVFLbFIxclE0aCtid2hRdmk4MHZLcUl3?=
 =?utf-8?B?YUJocGQxK3RPZlkrKzQzOElsSEhwdGRId2hCNkkrWFFKNnZ1alE0Nk5oNzZE?=
 =?utf-8?B?c1pjSkFpQlZPOFphWXdheWFUY2I3WGx6RlpXank5ZWJFSDV2UmQ0WWNVVlZV?=
 =?utf-8?B?bEtYdG1pdWxURTloa2VkcTF6aTc3UVJicS9MT3padU9nOFlyTEsxL3dOdE5S?=
 =?utf-8?B?OGtUam9QaHJDMTRucjF4c21aanlKZkQxL3BUSXdtalZ4aHFGOGpZVVFkMVZ3?=
 =?utf-8?B?OUZraHdvbXJjZjMxQi9UZjJ1UWZ5SlRsa3NnU0xkTm8yM2MxeTdvaU5TdDhv?=
 =?utf-8?B?VjNwSjZLMUtBa0VFUVErMlFpbzM1SFVQWGZ3THp3NDFYZG90MWJkV1ppYVV5?=
 =?utf-8?B?L09OOERvMVFiNU15em9haWFkenlmWUJnOW5pekF2eCswcHY0YndaRWhQWnRm?=
 =?utf-8?B?Zy8vMDNvU2tIQ0hhcGRGNzJHQUo5M1NiUXdlVkNWNzdDZS9aaEFaSWRTNVpR?=
 =?utf-8?B?R1ROYzlJNmFjd3Y0OE16dnNRS01hVlZmR0grazBtcmZ2SkFHOWtvV2VmVkpL?=
 =?utf-8?B?MU9CczcyR08rR3YrRVNocW1KYVhMSDZKeFU2NVBqWWxveDBGbDZ5MFRnZUUr?=
 =?utf-8?B?T1pYckhFN1ZYdVVXcHZ6eFhzTmRGdExTUEczRXVLemZiYWNoQUhyc1hRTTN5?=
 =?utf-8?B?SndBMFY1SEVQWXQxOUVoUDBVTzJmeTR4NWlidXZrTlhSVGFUWkxPWkFxTDlF?=
 =?utf-8?B?aWRrYUxyTGFEblBQWlVuNDVERmlJbGNlbU5YendZVlh2bEIrMThHU3prVWtq?=
 =?utf-8?B?N0NZeURFYVJlZXZFbnJGUzRNdWoxSFRxRE1SUUtzQ2EzY2kwNmloMWxkSVQz?=
 =?utf-8?B?OEllZGNvK3ZpMy9Jc3dNR3p6UU0vdjRvSEZJN2pMUVB5T0NmazhyV01JTm1Z?=
 =?utf-8?B?N0VOMmxvZ2IwUGRpMHdvY29PaS9PckpNb3ZqZHpRQ25OcHFDTGJvRVFWNVQ4?=
 =?utf-8?B?OWU5VzNqejZOVGM2ajZ4ZkJUNFdtUkF3eVluaVdDVTZmY3ROMnhyaWg0NVRy?=
 =?utf-8?B?em9IeGJlTTBPM3BRc0FMNzNQNzhxMVk4eGFvbUQ1ZmxjbTlQbENIOEFxYWpq?=
 =?utf-8?B?LzBNNmpNWjRNQVdrQ0xYZkI5MENvc1h3dW9INUQ4bzcxUGdjNE1wMVFhcmF2?=
 =?utf-8?B?dFQvVWR3alVMcnlUSmI5aUlpM0h1cFNacnpRVmo2RkxQMzdEN1FkN0RiNUlY?=
 =?utf-8?B?M1pTZHh4VHhaMFZkYXNwK2ZKMlhMOVlyL3gwTDg4Sy8zTllkTWNUbDRjaFhU?=
 =?utf-8?B?RWNwdkJ5bWorZmFKRmNaUzJaMGIzZjBpbG5EbVRHZm1Xd0NPVmF1d0ZDSTI2?=
 =?utf-8?B?QVRKNFUwRTBlS3dGSVU4TU9wa21sZ3o0YndwTmRTSnc4WVhjNGw0NVZrMDVa?=
 =?utf-8?B?WnFxOXNudk1UN0dYdU1RNDFTcGJFR2tlR0prRDc0RHQ4anAxeFc3SEptWFM3?=
 =?utf-8?B?T205SXNkYi93Wmd5NVVHaFljV3lQeGhwMHpLTUpaemdNRkVSeTYrSEFwblY0?=
 =?utf-8?B?Z1FOVk0renl3cWtvbzFSUXUwM3crRnc1WUpFUXhydDZvWFhtcjBITHZJMVNo?=
 =?utf-8?B?Q2pjeXJ2UVRPZHp6R2VpNE1PZGRpQ0tKYlpTMitTNWp4VGg2VVVzZjVzYVJ3?=
 =?utf-8?B?N1Y3V09EQTR6c2hGcTh6ZTRBZDVqd2d2Q3VtV3NpSTEzRUI1T1NRNGIwaGVs?=
 =?utf-8?B?bmlkem9QblNqaUtranQwRDQ0MjRTdGtmWnBLRjF6clBSTEx0b1h1djJ5cHZm?=
 =?utf-8?B?N016MThya25lWis0S3daaHRFSmdQTWkzaXdSVzk5WkRLRHZlV2pqZGdUcWsv?=
 =?utf-8?B?WkJmT0tDWE93Z2M4c3NiSkY4ZktNZk9STXdPT0JZbzBKS1RuN1huSm1Lb1ZK?=
 =?utf-8?B?Vmd2VnVPam1PYnBoa25YRlZCblNPSjBTcTIyZGZ4bXdBSE5mNWFMUE1uMVNY?=
 =?utf-8?B?bXhIVFNaQ2h3a0tXam5iZmNpQ253RzdHZHNkZDFRNzdVbndDUmJPR2lvYy9G?=
 =?utf-8?Q?xzjl1nXzZMPjme/BBGzTM0pPIAzNYMAgUzOMq?=
X-Exchange-RoutingPolicyChecked: VvXprsC2eBPh2oQ5AyLvkkOYNKdvSOfwIFbMCSuvpbVwP5JKb+esZtaVkz8ALmTbffpQPCRRiz2vCiKm9baUQ1ldBPPXehruwHfrq/q07c+GrS06fAiX3igz+leq7+nFXgglVR+aaPria0AeCzWPyeu6OUa1kL/ednkZ7C739ic2JSQV2JbVFMJ+sKgEwXhan1srxZzjPyDswMKHuRUzB/x2wxIevlg4IuBoES63ukOuxKAwTeVtEm2vnLIl8ByQ2wogJxciBidhfIeSrx8PMRtpxOFOqhE5caG7PiK6dlV1+pM/+McrAxdFSvcoXZpkbdiE3gV64ux4G8dHH7slzQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46142771-074a-4afc-c043-08df1f916024
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:55:35.6957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC+Iumy2rCZcR4gIRKZXuDiHkkxxGSNsWYLbUaDQtkx52CjhbGZ3vLCc03hJPuYlP2TFDonFfND5bqi0DEe6z3ZHpeY1MpxryvTLD8PRrvutv2MH4YjlqpboTBcm+HVs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
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


On 10-09-2026 11:49, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Add support to verify the CRI GPU and skips test gracefully
>> on non-cri platforms
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   tests/intel/xe_err_injection.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/tests/intel/xe_err_injection.c 
>> b/tests/intel/xe_err_injection.c
>> index cdf15f70b..5492c0b9a 100644
>> --- a/tests/intel/xe_err_injection.c
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -20,6 +20,7 @@
>>     #include "igt.h"
>>   #include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_chipset.h"
>>   #include "lib/intel_reg.h"
>>   #include "lib/intel_compute.h"
>>   @@ -569,6 +570,14 @@ static void 
>> test_l2_bank_single_corr_err_injection(struct xe_mmio *mmio, int fd)
>>       CLEANUP_ON_ERROR(ctx, fw_handle);
>>   }
>>   +static void igt_require_cri(int fd)
>
> igt_require_cri() is a static local helper, so please drop the igt_ 
> prefix and use a plain local name.
>
> Thanks,
> Soham

Renamed the helper without using igt string in the name.

Thanks,

Ravi Kishore K.

>> +{
>> +    uint16_t dev_id = xe_dev_id(fd);
>> +
>> +    igt_require_f(IS_CRESCENTISLAND(dev_id),
>> +              "This test requires CRI GPU, but found device ID 
>> 0x%04x\n", dev_id);
>> +}
>> +
>>   static void inject_error(const char *injection, struct xe_mmio 
>> *mmio, int fd)
>>   {
>>       igt_info("Starting Error Injection test: %s\n", injection);
>> @@ -600,6 +609,11 @@ int igt_main()
>>       igt_fixture() {
>>           fd = drm_open_driver(DRIVER_XE);
>>           igt_require(igt_debugfs_exists(fd, "forcewake_all", 
>> O_RDONLY));
>> +        igt_require_cri(fd);
>> +        /*
>> +         * TODO: Add firmware query for error injection support.
>> +         * Should check: EOM (End of Manufacturing) status and error 
>> injection jumper state.
>> +         */
>>           xe_mmio_access_init(fd, &mmio);
>>           igt_require(xe_mmio_is_initialized(&mmio));
>>       }
