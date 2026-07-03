Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8A0C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 21:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF5D10F93D;
	Fri,  3 Jul 2026 21:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmzQn7eU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BB610F935
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783112949; x=1814648949;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AGiDIQWzkYC2lnaKmGkiy2N6R3MtEJpRhS5ufZ2h5JM=;
 b=BmzQn7eUim2n0P3ezdnMKHAOBIp1U8NOf3qkNpW2dxunv0EpamuPlM9f
 HDRatkTk+6v0cQQ3OQVHRn9pxXRTBgkS8RgESoYkrkh22dabYzjrj9ha2
 3JI5thGycyA2Y6MvtVw6oYvQbXGn4/assNp7BYmT+PvrDZq9wslW7jE33
 bZWXnSdbWrxEzA6jZ/tgKUxXPkViVjjaG8Cm7qdpr7gmU42nzZ9TLe8xQ
 6wK62BFwa+yasPvDnNOue98vjMNr0/85YprfUPOPxQH5ymElCG70YAAoI
 pZGVIS/n4KHZ3dMfVmcn1IcGm4MJPuhBmPE3AwwtFw0ZeJbzEgqSrEVuY w==;
X-CSE-ConnectionGUID: jgzAk/05R8qwb81u5XAtMw==
X-CSE-MsgGUID: CNx9CGtdSz24bCMCI6JvPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94508218"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="94508218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:09:09 -0700
X-CSE-ConnectionGUID: FEipiJ75SAOQmreXPzbHXQ==
X-CSE-MsgGUID: em3uQgwUS1G/pKi6+pUfSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="255104821"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 14:09:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:09:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 14:09:08 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 14:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC0uA046oU15FE38LsvtU1shsgrwKgnX+82EpIpX3MhyLH0MBlLh29Fzb9l9bPWwITpWt2ar5mD+Eaf5TYqvwGgvSpMHd1lqfpnh0ykA+pnbRmonp1ScaW78F8A0NXeEdmv4rLL0ACkB6keHLjxePRT/OZnnOuIaOUs80DgF6Lkyp1qxHqUU5+kN7JK5l1jZIbEnBK7iZTfCCi6EyGY4sDlvTzQiQm/ISQzkTBtan9tcY2dpIPSbCAZEZbGBR+hqq15/nFlOVd2+3cFsPehoxRsTHujaL7wj2HEVVJkaesbb/WLWP+5aXntPmW849X+B+9yl/FbmtTKBKGEz+P3zvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcVvCK6Orc7uznau33MmUAQVRxc1ORcLDTTv9+lJ7FA=;
 b=W6VbuJ5IJsIOKizMlvjir3bPT48qTlX87BihZhXZ2XBAanmBB/VzZLT8rLQFHPEbI5shASaXuxe8GPB2/hrDWuatuWDEcOmIR4cxL7iMiE9f2xPCaCn8pk4zMvH8fGeFqoFlLi6Om06WhaXBlXvrYIFMbwNYG7gDMBYhXwdKVhzIsaBtKKUZMnqj8Rd7OpTIiJTrKJU0s1jfQdWXqYvPqJsMJ8LAJW4dMm4eF4kkijINBmplvnNF96a7Tvlaqr1MOoRXhikbUlaRIJktWzw0+7UU9ioRcmX4a8yzGTW/OFG+vgl3BGqPzg7kfLdBd+jUZo+vgeb2jldli7NASUO/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 21:09:02 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%6]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 21:09:02 +0000
Date: Fri, 3 Jul 2026 23:08:56 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.karas@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v2 27/31] tools/intel_watermark: link with minimal
 sub-libraries
Message-ID: <c2kwvwvx2jahimqgxrhuyewmn4ocvvhqd73m7imvvvfzlxbmtj@qqeordngxlrs>
References: <cover.1783088106.git.sebastian.brzezinka@intel.com>
 <63d5efb4d9df4f13e3c49c5cb395c94a57a8407e.1783088106.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <63d5efb4d9df4f13e3c49c5cb395c94a57a8407e.1783088106.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZPR01CA0210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::24) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ab2e5d-2dbb-4d73-10a1-08ded9474eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003|27256017;
X-Microsoft-Antispam-Message-Info: HqjTAXX3ggaPZvl950bN2Zbycuwrk19SZS6ooFOVVGoxkgGr6qi/jcRgkGB/3iavMf+AXM7xXGKT6939RCwoITY0BmGSruzpa+ZWDZGSSPyFgV0AZ1Q1PKaclDQL1IIlF0hNKs/jpO33hqf/f+Dg4rCQHPSqR/P9b73j3ZLOpBqkoqyw5hPFj/yxmnQFJ3WexWhl62z0ShA4043oEh+uQ9QnouaVtybBCL2pB524hVfm3tnGXTHJCWYyif4YUJmQbmOAIdYKuOIG3cTqGCPAmulmVU9TfdSVrcamrJ82MKSP5QQMKZBGullFG2K0pkNPt4jX/rHpMGRclOT2LEArGM7I6P3hOuzPX2iTnrgZhkJQW2jH60NSXoEUsz/y5s0xK6EcgpT1DsO1bB5wYNqYv312H8VV+n5j1cIfpAba0g7wYt7iiwcoqvzR659BgIAEOrAFFTpJLQqI6E/uNCrj5IaOKpymwnMyCcWTo6HsxRLuGM1TTGpDoJVGt5zKtKrirYkyF6uGCpTk20qbc2FKUkRaIpW7/XVy0H86aDakRivGvq+50e89djMeb9VayxFwxPdfPZyc40F8rvKKxU4Ph2qjq5Q16qL56PWtPGEuuXNuOtlg/yz0IttrGy8PGGf0gTnewMoI7O/GDk2Lbfv78T1+SlB1xei+ALZX38WMCipSVrxNl3fkxG+vRx8YhbZSLZL7wyQ68dkrwfbRBB4Xhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVYvTGJsMEY3alZZN3UxTHFBUDNYdkxyMjhwOEIwZnF4T09GWWtUVXRZMHpM?=
 =?utf-8?B?bmlHZFRPZy9XRk8rUFdUNm9iZy8reVJmMzZIMzM1eGRMYnF3VnJsQko2NElV?=
 =?utf-8?B?bGRWY1B2dVBNRUpuWGZCRDdEaGg1TDdKdHNYVjBxeWFHR0FxUHlSV0pMZ1Rq?=
 =?utf-8?B?bXpBVHFieFVUcmxGdzNqREwvVHpGK0w0djl6b0NDQzlDdk43R2NYSG5qQ0ZL?=
 =?utf-8?B?Snoyd1FrM21ibkNsZ0Vid3JJc0lIK3pyTTJEQTAxdHllTHlhWWFOMWUwVFIr?=
 =?utf-8?B?M2doQWtqMSszTUxOVUZzYnJzYiszcEJIbk4ydUhhU1RYUzc3SWdwQVltRFho?=
 =?utf-8?B?ZThjUkY2UU93a0YzdXNyZVZSY3pNL2oySnJ5Vm1ENU9FdGZ0REt0dnZHdU9K?=
 =?utf-8?B?blEvOXBBdEtzdWp0STVQUHRkM2h3V2xrYlc1U1Y0Wml0NEVIRUY3KzB4VnJw?=
 =?utf-8?B?YStNZ1FwY0ZsNlUwWHVLT2pUTzdad2lzUU1qTldmaTQxUlZWT0p1bWVnbWQ0?=
 =?utf-8?B?WVkyeGVrSkRpTHFPTHY2OFlSTmRTWUNwL0lwR0lUeG1Zdi9qY08zUktqalBC?=
 =?utf-8?B?ZmVZZzRkL0xGcHRWQi9TaFcvV1lPakl2U1VUdHVhNzFHK3pkOWFLdEcrT2da?=
 =?utf-8?B?elNOeHBCZ1k0c3lScm9yOVBGZjdKN2ZVU0wrVFIvdC8xUEhtdy96WW1KWXc3?=
 =?utf-8?B?bkpzQ0ZPQXVkYnZPTkVrQ2VaQlRSdEZ2TnBLWHlmcHJYTkRBaFBsa05Vdngy?=
 =?utf-8?B?VVZQNXcrTGNTcE41Uys3bkRxZ0hOc2NhcXJZTzVCTXJiM1JXUVhieXBkTURP?=
 =?utf-8?B?SG1salRtTXpQZGVWdzZaQjR5aTk2SVE3MFpJMUZ2Z0tUZFJySTd3OUFDaUF6?=
 =?utf-8?B?TFZZQTIycEtmUk0rRElwRW05cldUdVF3K0VKTFIzWmo4N2h5bUdGcGhjNCtH?=
 =?utf-8?B?MEpnOUdKdG9wQ3FMN3JBUGJEaGV1WUFpMFRhandabklvZGFDdTNUNWxtRGpi?=
 =?utf-8?B?dElzZ3dpOE1qM294S3F5UzU4Z0gwZWdMRFFubWN3elQyQkw4SjdqczhXQ0xl?=
 =?utf-8?B?eGs0dmsvNkt0K0JrUHUxUjI0SmJvVldHakt5ZzJuTmdqV29RVXRFNldaRXJz?=
 =?utf-8?B?c2ZRaGtOb0JvTUUrQm1BQ2NrMXpGcTM0aFlDaHVqVmdGa2RudWVQRWF1MzY3?=
 =?utf-8?B?UDdpYWNmeEZScWhXZk9LbHpsYTZ4K21JeHNyZ21LbXVaQldTb0h4ek9makpr?=
 =?utf-8?B?TGhYTWtUQ1VzL2JWWDBaWmM5Zm9JY1FoWjR1THlweGRoOWJ1aU5VcVFTbFlq?=
 =?utf-8?B?OTZJdEYwWDV0UzZabSt6TlB4ZE5YaFZ3UEZ4cEZOZ3pkazZmdW5IbUFZT2Ji?=
 =?utf-8?B?Rk5rMVc2SWlxbnMyNWJXb0lYbENtK3RNZkhzR1RESHJPL25VQWNYR2pNbDlU?=
 =?utf-8?B?eUpVSzdyVHBRT0hUWklRVFF6ZjlBUHl2cWc1ek9JVXMzWUVGSVF0M2V5cThr?=
 =?utf-8?B?Z1hzbWRRRERkL3doRmUvRWEzV3NhblEwZ1MvcWFGcGhKdTZVblU2ZDZ1VDJB?=
 =?utf-8?B?aWtmUlVmWlY4NGo1ZG1FblZBdlA1enRPZVNrYXRFZDlVRHExdm5xOXRZbnND?=
 =?utf-8?B?bmFlcVpUQURCZkZFR1JrSCtPNzZOREJjV3RoSUYxRDltYWRSalNmQ25OVFl3?=
 =?utf-8?B?Wjc0UmhEVnNQQ3VpcXFoMkRBQXM3OG41OHNEbXFTbGhCcE1pQ0k4SHVNMmRB?=
 =?utf-8?B?TVRvZEpqMWJnUVJmVnBGZTBsMkRBbXk1d1BnNi9JRTdvaGFRb011VktJZlRv?=
 =?utf-8?B?bjhFV2U0TU8vZnMvV2FwTEdvL2YyVUtUaUNFclBXblNXSWY0TjNhUG83aW9P?=
 =?utf-8?B?dWdHUXRaL0ZhNkNENDhwZ3NQY2E3NWMvMGIrRnZPcWNzeWpISEY5VEN3TGRr?=
 =?utf-8?B?akp2b2hNdUNJZlVXQ3V1Vzk0TWRqbkpFWXdTanozRWVJRjF5NFFXajRWQ2lB?=
 =?utf-8?B?VXA5bVA2cUo3K3ZtcE1QZnlGOUhreE5lU2RDYnNaMWs5TVdYY094VDFNZmFq?=
 =?utf-8?B?UE5vU28rS2FPY3dYSXg4eUpYNVRrK0U3S1dYVXpDZWMrc25xVDBaZVVMVnU5?=
 =?utf-8?B?c2RxMWJyMTRjTnpkUG9WbGl4MmJ4dk90YjdBWEwxRUh5RWVHTDhRaU5hS1Fq?=
 =?utf-8?B?b1BEL2ZhOXhXYlF3eEVKRXlUSjNCS3MvTlRRdmJyNU5taDE0Zlg1MGs3bFc1?=
 =?utf-8?B?VW1Ia0lnWVVlMHVGRXVKcVR5ZlBFTXZvN3VtdGgwbzZWWFBPL28rM3dyS3FP?=
 =?utf-8?B?UXFPRm1jZnB6bm0rQ0hVaUVVUkxLbGs5NkViWlpFdVF4a1RlNFhMYURULzhL?=
 =?utf-8?Q?IxrxZ4Kei1uVi1qIiXVLv6FsF1cmmnKarasoKchB+fips?=
X-MS-Exchange-AntiSpam-MessageData-1: qskZPLJienPtDUQ9j7qFe6JIaI/OuqpDHK8=
X-Exchange-RoutingPolicyChecked: lhJBAstZnUIOJ654PhA9g9WqE9xqKzqe5LbuMI955vfVzlXVNlVq+K468KRec4jkjJtrbZ+9wUOz1D9/VD2u4hDMaYYj+y3prDqI23QFCKqet5bDKAcJHkeiICEI1Cenct98qG31TnUTCJNARIDi/FCX7tv+nsJIxtAzDfuSbCRYdGsJ1eqKbQa4+Y9Ns/bXFmJC9Ifzpc9wUptRxCVVymEAdycKaUVnm1TTq6YxjZtXzZ0OxVzRRtmUcO8zex0lyRl3Q8rlVvrweaj44keeOh434c/9mxFNcFQrgg7BErRk8gUGH+9mMO8quOztDU/4oh1GZjtotXk2wfpTyxmBNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ab2e5d-2dbb-4d73-10a1-08ded9474eaa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:09:01.9766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx1pmiskOebLeK8Gc9MegUi0ORkx65LyzFdpJ5yNEglycEsxgJaIDejb2Zbub8cJLPMVFvW+iO7g70D0vFp3TBhsJT+rrJNTt5WYDkrifgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
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

On 2026-07-03 at 16:29:01 GMT, Sebastian Brzezinka wrote:
> intel_watermark only needs the register/MMIO helper subset, not the full
> libigt.so stack.
> 
> Switch to linking against lib_igt_reg_tools.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   5  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tools/meson.build | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 1a4e14ed3..0cc62b54d 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -26,7 +26,6 @@ tools_progs = [
>  	'intel_reg_checker',
>  	'intel_residency',
>  	'intel_tiling_detect',
> -	'intel_watermark',
>  	'intel_gem_info',
>  	'intel_gvtg_test',
>  	'dpcd_reg',
> @@ -124,6 +123,11 @@ executable('intel_panel_fitter', 'intel_panel_fitter.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_watermark', 'intel_watermark.c',
> +	   dependencies : [lib_igt_reg_tools, pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 

Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

Thanks
Krzysztof

> 2.53.0
> 
