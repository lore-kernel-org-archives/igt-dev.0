Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1212EC9830E
	for <igt-dev@archiver.kernel.org>; Fri, 25 Sep 2026 23:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0910E086;
	Fri, 25 Sep 2026 23:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D971jSiU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9EF10E086
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2026 23:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790379847; x=1821915847;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i3g5uiEbJvHcOW3gDPl3f4Wz94jLviiIbjGQSMsQAis=;
 b=D971jSiUMTRquLOIuPmc9vwrvFuOGnNdTaJnOuLKTynqfeN7+BahIo74
 xQSxIpiQX5/BCOEH4ERvl7lBIXDneKe6RHCgT5L5PniQ9bn/Y1oEAZ5MQ
 vUPlb1mIjSK5QYyC+q7NQwztNXz2axwnGid7xG3lv0YXd54+wVLbO214F
 kXiBUxvGZ4YLjZFyLEyfyFf96SxQd5vFabIdofurFmPxzU3tyPpp3HLtU
 KvkN42FcBxouhYgwJq6auU1YVy4PJ/9E7e4nsojV40QkDKmRiBDJwMvXq
 WNnYHTPAttiytIQMXENHzNFuu+WSrtan5rMa4PBwxja96jk86aHW144zh Q==;
X-CSE-ConnectionGUID: urU3UbH+TTeiUHxbHhVjQw==
X-CSE-MsgGUID: VB/eVcS7RdWFh1YdPMI5Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="91034332"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="91034332"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:44:06 -0700
X-CSE-ConnectionGUID: bkQZTlCyT16vCRUC8/5AyQ==
X-CSE-MsgGUID: jey+Fls6QGewlZQTNRHQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="277814281"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 16:44:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:44:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 16:44:04 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 16:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbF3ybRrBWPED/A76l2gVyd4rUaKU8pgRY/ql2T8iy/sfSDP03M1fGeIcxK8IEcZor7Eup0SNJI+SqRCFfuJUOWX5tf1Iiv8Zhp6K8+yWnDt6mWU5LaBR5eppEvRyqrLBDH+wmVg8F3SBCWVUrDL4MQPTmDCj3udvsCf0JapqnL4knHwvGR/DoD1NMo+o9J1bMl3eELNeysrqLcjo0d9e88GAAk2EvbYMS7a4uui5/Frkvkj24656Fv2FnMMweXnZehYym3BVY6iv3G2UARft5vphCBOtFdOR9Dx0Ptq/oKjLJM2oMN1modgoU1D612tPdrkp8WmMeQ8YMcK0nU6jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=de9jUxsVJyrjW7YzaYRhnLCwbEmcsXfUTZQT7PSW8Yc=;
 b=uPDDzq5zlp8LeDg+6W1APrPsuB7xkXoKn6T2NCXKLhm3Zj3S+OpmV9AJDPoG6lC7VwbOPBZ/OFfTLKkveMVpCnUogeu4YOfWp61fUJ9laIsk7ng2Va0ps+G1c197yZCBI+FsSC4tLdMgiZ8bX910S7Y1yn2gsFnJOIoIkbd6ycVognerf8hDqAQXU9qfvVsgjNgfJe0GjQqYNZnQsECSyFWvUBk0V3CGbX8faeHueDUdkljYnoxNo+ew0Xq/T7O5ug1Hsqum717ECpsYosW+DRnGZG3X19Nip6q0aG7YzwzGkX0FH0Nkt68PoNekWDINcaZaJEingUfFk4i4w1M26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Fri, 25 Sep
 2026 23:43:57 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%3]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 23:43:57 +0000
Message-ID: <fc078346-08d5-427d-9450-62ab293221ef@intel.com>
Date: Fri, 25 Sep 2026 16:43:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v13 2/4] lib/intel_device_info: make device info
 cache process-wide
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <kamil.konieczny@linux.intel.com>, <stuart.summers@intel.com>
References: <20260924035545.710985-1-x.wang@intel.com>
 <20260924035545.710985-3-x.wang@intel.com>
 <h7okgr6ybc2qayx2srdopir4prtg6r6sbm6hrlszn5soyex3r7@2sx63agh4e5p>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <h7okgr6ybc2qayx2srdopir4prtg6r6sbm6hrlszn5soyex3r7@2sx63agh4e5p>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::14) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA1PR11MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d1dcc9-e9ed-4a05-a93c-08df1b5edda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|42112799006|366016|376014|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 22SLcgv5C0jLxdgXc6wGGazPsUG1fzTwlr5rZy80tne/lhAsqFAR5wwrHDaVus0tf/TLkp/1oiBjyrPXmooWiicc80zNPtWSPVejc09jdybL6CYrx/oFk8AOgzfitbs2SWAhTr4s52V+tOVGpvrfyf8Dq8ZvluuoXwqa4Ewk4ZDtZSSGxD4+Y58MpVh7z3tQ7wlN9IR7dk9dwNeSYm23f6idCR70MIYnomz0ElchaY049sUoK29xaIbkw1uUUWuvq8BzT1tIdZQtJw0YYipHPXqdb/e0JCKNVpXHiysD6U2sMec0Z9Cs0HpacJd1o/nAtVRy8dKN5+Y3qLGq+P28WwR+uthXidLQqz01lMtJm4yGKxQ731pVC99vIZiCJb2ho3nIS2fepBULD3S10d3Shy7EqRVg0yryYwiY82mwoPLsbS71sOwPQcb2t1jvcej0nC9b9jYcC0PMN/S7YQkaV6oH1H2k5/Lavkhhug2+XbWKB4WdCHqUhxOpOskg4xCw9MTXSF74xOtCRGUhQqzMgSugiWBqkYb0seHEBXtj1aWK+FFPW0OZOILU+MY6zpIQct5NCux0hSC+yG0PV9wceFBJ4yhnHSwBHBMry6qn1yx4MOt7w50zIETsnvZdYBEC3fDlsXieif6IUx4CPBC73vI2KRoBKNwbX+gISkl1DTc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(42112799006)(366016)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXV6ZjBUR1hjbmJlY0hQbU01eUU2SnBtd0RlbVM1NmluQ1c4Rmp3eDZrdm9i?=
 =?utf-8?B?UkpsNXlCaXd6QTRQcThUR2dHRVczZjlsczlVYkNLUVZaQzNXUGdOZmtHQk9r?=
 =?utf-8?B?U0g5VXNuMHIwSEN5eWJINHJvOW8vUnc5Z3dkYWprUnQrZWdNTjhjSXN1ZEI3?=
 =?utf-8?B?bnlGeEk5SGRBbmFpRHIxQXdvZlpCMFQ2ZXhqNW9PM2dOTWx2UUNSOWtYdFZi?=
 =?utf-8?B?aWFjZEhmTmFPOG4zZENCTWkzN0pHZEdsT3hLdlJ3c3VvRlpWK1RaVUtDUG51?=
 =?utf-8?B?Qk4yUnlKbmRNdHh4RE1mcStBRlRjMU9haEdGRkRqOUdYM0c3SERHNi9yZW1p?=
 =?utf-8?B?bXNpMlVjNWtyenZvR1l1Ry9haW4xZTBxVGZlejREMlVLS01OYStPeC9qaUN0?=
 =?utf-8?B?ZFBMd1ZKVzI0cDNmOVd6WDRVMThham5SMkVWVFZVeW8xclRxMjIyUDV6blV2?=
 =?utf-8?B?a09MbUxvZHpZUFZxVEREQUJ0U2hqV0hjelNTeUZlYVgzbWpoaHJpZFBSaDc4?=
 =?utf-8?B?RW1rNm5lQS9wN3JtUC9qOGV3bXJoaHZRYWE3clNUcFZwdml2VFRLajE4Rm44?=
 =?utf-8?B?UWY5UTJ1OXNJUkJDd0QyNlJOUlcyZEN5dDVmVEw3NThaZWF5RDlGZWZGNjE3?=
 =?utf-8?B?VkE3Kzg3SDhHOXFjR2xEa0IyZG93ek01SWRVblVhKytWNDFoc0VmUjFCbVV0?=
 =?utf-8?B?S2IyZnNOQ0ExMi9jM3Z0ZlhLU01rc3pMN0NHM0dsT29na1FjV0o5MERoaE5o?=
 =?utf-8?B?d2FuWlJmSmR3bldwQ3A2U2dVVFJzSlVDK1dPWlRSMGN3aXhXbDlicEo3REg4?=
 =?utf-8?B?TzQwRVNHTGM5d25aTng2d0laS1UwcVZRMnFuSzBySXF0b2d0VG1XaXlSY2kw?=
 =?utf-8?B?TURtNnoyRURySDNQdmd2UmpWNnYyU0lJMUhTb0VKTmdHbnJLZUd3KzFPeVpQ?=
 =?utf-8?B?SnNocmN1WUZINXVaLzdUeGVXcTg4QzBKemkwRGptRG1UeVZwdUFockpHcWdr?=
 =?utf-8?B?am5NVmN5eUhXL0NydHdQSW41bjZTL1RJL1FkR2FUSmgrL3lrMUNRYVZpZGtu?=
 =?utf-8?B?bW02Tnhmazl1TGwvZ0t5MVk0cW84cXJFRW5nZzFGUm16VWMzd05CdnA3R2dj?=
 =?utf-8?B?OUlWc1hVOFBqYTExTmpHMFdqTzFGWlJNUitINUwyQ3d5N1NiRjk3S0o4STdh?=
 =?utf-8?B?dGtLbWhPR0JTTUh2b2NmMzNzM1dLb3dRempRMDJESGhUVzA1Ukd6L0xQMzN2?=
 =?utf-8?B?Z25Wc1Z3QW0xc3Q5UnFxZWgvZ2xPVnVoN3p2c1dCc0duNCt4d2padkErbGxC?=
 =?utf-8?B?c3ovRmY3Q21IZ0FKNHRNSDhMZXQydTNWSzBFQ3VyNy9vajBSN0xFLzBwUUVs?=
 =?utf-8?B?VEJNR1JpZ1Z1Z1lwaXRJbWJFcDdZcHdTMTVLR2l0ZVg4NkZEK3BkV25JdGMw?=
 =?utf-8?B?ZjFvL0JYOGYyL1FUSVpjTDVJWG5ZdUxFaWh3S0I3cFI4VkNKbzh1bHJjK1J5?=
 =?utf-8?B?VVpqZXlzeXVtNTZtb3hWOE04NFR0ZUJiYnJyMDd1UFZTYmgxdDYxY29hRzNx?=
 =?utf-8?B?M2x1SzlkMDY2UU9kTGQ3MkgrUFFUOEczOHcrbzRqc0hDaTFveVJOcXpETFlo?=
 =?utf-8?B?OVMrbU9HdlJWYXhCaG43T3JtVDNsNVptcUN5bllyL01WbE03SzkzTitYVnh0?=
 =?utf-8?B?OExnK3BjQUdleWdFVDQ5WEVpTUFTekZYaEdaSGdBbFF6WmcwaEttTlRaMlF4?=
 =?utf-8?B?TjVON29lOHR6OWxmOEgzMUFBMWl6bnpTR2l5TXhGTnNWVTdDT1FlR1BOemJB?=
 =?utf-8?B?ekswSEcwRkxXbWJ3WnduUjlTbjNpS3p0UEREVHZhUUZYdUdJV2M1WHpEN2Nn?=
 =?utf-8?B?dlFacXI1TEtPZEErbUs0dDd6d1RkME5KSVBxeVVJMWJuTVh1T1JXQXBrR3FW?=
 =?utf-8?B?SmMrYmQ5Z3lacXB3T0ZtYnl1emplN3hXZ2dnRTdWSW13Uis2aC9Gd2hNeXlJ?=
 =?utf-8?B?OFBTM3plV2RyazJITERnanIvS1JmVWtGN2VkUEtWOFZ2WnI5QWdvYXYwQTZW?=
 =?utf-8?B?Q2Nvdjd6bTlaVm1mV2kzR0k0bmJydHJZZDUvdGYxRHlxcUEyY1czdjErV1NS?=
 =?utf-8?B?MFRveFRzb2tIVVEwaHY1U1F5cFBaVk5ZbjRkWSttY1lBUzVSRUhlVFZ2dFF5?=
 =?utf-8?B?cjJmYUJ2amhEbEVpOXUrQnpsaG9wQ0FTbUJBZlk1a0RVR0JWY1F1WEhGU0I4?=
 =?utf-8?B?V2lIOHhMYzZQYWxkd0wveERRRjFJYTM4NElFOWtUNm5XMVRqWC9Va2trUEV6?=
 =?utf-8?Q?5xOAwpcmJRbJ++cULK?=
X-Exchange-RoutingPolicyChecked: pxWmbGm3OouhUqxCuCn9J3m3TSpXy5vNUN8kFUTX9o3I0rfIzZ7pGGkJdBqZcsn7cigmhLWjBSO5n3L5U7zQLaIhpVitp/Qi/UEy6SMtG2Nh19NvjqAv9/ZZP+d+uXoRdmSL4gqvTO3QHHRDsiXXlbKI2vBudt3tPS6GNz9hxplbUjPvEIhFjiZKs9rnBZVzRamAZaVzUoasnf5nPjIFiCsHFPa7cFxM5OsAGaXOOM3jKSPnu6YTyNNWnvX/5UTmONPJgedLq4dp6aaL/ftlg1HDfupKo0RKnL01NC7InsS2d+Jl0DZ9PJKUzGzC9oMrEauC+/eHxYjIXlHiKqgx1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d1dcc9-e9ed-4a05-a93c-08df1b5edda3
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 23:43:57.2499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSwIsq6A2FL8AZBzIp6ImrEuLxCZWDBOpXJDJemJ23Z8wOp0kLcICFHbp+IlsTJmLVN9RpR33CaXRE6/xDXdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6370
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



On 9/24/2026 23:22, Zbigniew Kempczyński wrote:
> On Wed, Sep 23, 2026 at 08:55:38PM -0700, Xin Wang wrote:
>> intel_get_device_info() caches the last looked-up entry in per-thread
>> variables that point into the static, read-only PCI-ID table. Such a
>> cache cannot carry data that is updated at runtime, e.g. the graphics
>> IP version reported by GMD_ID on Xe platforms.
>>
>> Replace it with a process-wide cache keyed by devid which holds a
>> mutable copy of the matching static table entry. The cache is protected
>> by a statically initialized mutex, the map is created lazily on the
>> first lookup so it does not depend on constructor ordering, and it is
>> torn down via igt_destructor. If a cache entry cannot be allocated,
>> fall back to the static table entry.
> Generally series looks correct, but I got few nits. Returning static
> entry is incorrect, especially when patch 4/4 drops rel field.
>
>> Also link igt_map.c into libigt_chipset to provide the map implementation.
>>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
>> ---
>>   lib/intel_device_info.c | 106 ++++++++++++++++++++++++++++++++++------
>>   lib/meson.build         |   1 +
>>   2 files changed, 92 insertions(+), 15 deletions(-)
>>
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index ae316bfcab..a7ba40ed2b 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -1,8 +1,11 @@
>>   #include "intel_chipset.h"
>>   #include "pciids.h"
>>   #include "i915_pciids_local.h"
>> +#include "igt_core.h"
>> +#include "igt_map.h"
>>   
>>   #include <ctype.h>
>> +#include <pthread.h>
>>   #include <strings.h> /* ffs() */
>>   
>>   static const struct intel_device_info intel_generic_info = {
>> @@ -716,6 +719,59 @@ static const struct pci_id_match intel_device_match[] = {
>>   
>>   #undef INTEL_PCI_ID_INIT
>>   
>> +/*
>> + * Process-wide cache of per-devid copies of the static PCI-ID table entries.
>> + * Entries can be updated at runtime, e.g. by xe_device_get() with the graphics
>> + * IP version reported by GMD_ID. The cache is keyed by PCI device ID, so all
>> + * devices sharing a device ID share one entry.
>> + *
>> + * The map is created lazily on first lookup, so lookups do not depend on
>> + * constructor ordering.
>> + */
>> +static struct {
>> +	pthread_mutex_t mutex;
>> +	struct igt_map *map;
>> +} devinfo_cache = {
>> +	.mutex = PTHREAD_MUTEX_INITIALIZER,
>> +};
>> +
>> +static void free_device_info(struct igt_map_entry *entry)
>> +{
>> +	free(entry->data);
>> +	free((void *)entry->key);
>> +}
>> +
>> +igt_destructor
>> +{
>> +	pthread_mutex_lock(&devinfo_cache.mutex);
>> +	igt_map_destroy(devinfo_cache.map, free_device_info);
>> +	devinfo_cache.map = NULL;
>> +	pthread_mutex_unlock(&devinfo_cache.mutex);
>> +}
> Imo this destructor path is not necessary here. There's no other
> cleanups than memory release what will happen during process exit
> anyway.
Hi Zbigniew,

Thank you for the review.

On the destructor: I understand that the OS reclaims this memory at
process exit. I still prefer explicit teardown here: this library
allocates the cache map, keys, and device-info copies, and the
destructor releases them when the library is finalized. This keeps
allocation and cleanup in the same library.

While running Xe tests under Valgrind, I noticed similar process-lifetime
allocations in other IGT libraries. I plan to examine those separately;
they are outside the scope of this series.

>> +
>> +/* Caller must hold devinfo_cache.mutex. */
>> +static struct intel_device_info *devinfo_cache_search(uint16_t devid)
>> +{
>> +	uint32_t key = devid;
>> +
>> +	if (!devinfo_cache.map)
>> +		return NULL;
>> +
>> +	return igt_map_search(devinfo_cache.map, &key);
>> +}
>> +
>> +static const struct intel_device_info *devinfo_table_lookup(uint16_t devid)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
>> +		if (devid == intel_device_match[i].device_id)
>> +			break;
>> +	}
>> +
>> +	return (const struct intel_device_info *)intel_device_match[i].match_data;
>> +}
>> +
>>   /**
>>    * intel_get_device_info:
>>    * @devid: pci device id
>> @@ -727,24 +783,44 @@ static const struct pci_id_match intel_device_match[] = {
>>    */
>>   const struct intel_device_info *intel_get_device_info(uint16_t devid)
>>   {
>> -	static __thread const struct intel_device_info *cache = &intel_generic_info;
>> -	static __thread uint16_t cached_devid;
>> -	int i;
>> -
>> -	if (cached_devid == devid)
>> -		goto out;
>> -
>> -	/* XXX Presort table and bsearch! */
>> -	for (i = 0; intel_device_match[i].device_id != PCI_MATCH_ANY; i++) {
>> -		if (devid == intel_device_match[i].device_id)
>> -			break;
>> +	const struct intel_device_info *table_info;
>> +	struct intel_device_info *info, *new_info;
>> +	uint32_t *new_key;
>> +
>> +	pthread_mutex_lock(&devinfo_cache.mutex);
>> +	info = devinfo_cache_search(devid);
>> +	pthread_mutex_unlock(&devinfo_cache.mutex);
>> +	if (info)
>> +		return info;
>> +
>> +	table_info = devinfo_table_lookup(devid);
>> +
>> +	new_key = malloc(sizeof(*new_key));
>> +	new_info = malloc(sizeof(*new_info));
> This part should report allocation failure, otherwise we use static
> entry and we even don't know about it. And with 4/4 patch it is useless
> anyway.

On the allocation-failure path: agreed. Returning the static entry can
silently report an incorrect graphics_rel after patch 4, and without a
cache entry the runtime GMD_ID version cannot be stored. I've updated
the local patch to report malloc, map creation, and insertion failures
to stderr and exit with failure. The mutex is released before reporting
an insertion failure. I'll include this change in the next revision.

Thanks
Xin
> --
> Zbigniew
>
>> +	if (new_key && new_info) {
>> +		*new_key = devid;
>> +		*new_info = *table_info;
>> +
>> +		pthread_mutex_lock(&devinfo_cache.mutex);
>> +		if (!devinfo_cache.map)
>> +			devinfo_cache.map = igt_map_create(igt_map_hash_32,
>> +							   igt_map_equal_32);
>> +		/* Another thread may have inserted while we were allocating. */
>> +		info = devinfo_cache_search(devid);
>> +		if (!info && devinfo_cache.map &&
>> +		    igt_map_insert(devinfo_cache.map, new_key, new_info)) {
>> +			info = new_info;
>> +			new_key = NULL;
>> +			new_info = NULL;
>> +		}
>> +		pthread_mutex_unlock(&devinfo_cache.mutex);
>>   	}
>>   
>> -	cached_devid = devid;
>> -	cache = (void *)intel_device_match[i].match_data;
>> +	free(new_info);
>> +	free(new_key);
>>   
>> -out:
>> -	return cache;
>> +	/* Without a cache entry, fall back to the static table entry. */
>> +	return info ?: table_info;
>>   }
>>   
>>   static bool char_eq(char c1, char c2)
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 2ac6327587..7d1502ef48 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -397,6 +397,7 @@ igt_deps = [ lib_igt ] + lib_deps
>>   lin_igt_chipset_build = static_library('igt_chipset',
>>                                          ['intel_chipset.c',
>>   					'intel_device_info.c',
>> +					'igt_map.c',
>>   					'intel_cmds_info.c'],
>>                                          include_directories : inc)
>>   
>> -- 
>> 2.43.0
>>

