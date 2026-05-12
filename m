Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1CFCD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7910E02C;
	Tue, 12 May 2026 06:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="At6Ge+CS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AB410E56C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 06:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778566750; x=1810102750;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jO1n2CRCX2aAu/LTuN6eQBSoC8wxlaKlfPfE2d0MKvY=;
 b=At6Ge+CS/M5hHgi0v5g81h8nbvQi1RNSVelCVzR3pv8txUVjOh2CkIEW
 cPcyYJxWwafiHOorb5RaH5EL2XwcSyjTDKfvl56qoYM4xIZ+AWH2YQThG
 4Z9Km1L+I0y9D0zeR7302KeIUCeyxfAsSdA96Tvt3lbPAddEXtu2d/LgV
 lHZPeRitMei0H19kcaPjy5/nwK3A9VQeiZ9LbkPD6yc5Bi1BqjlYphnYN
 cBdweyZ5QOuSWBA6I9Dt1OTAm/pm4tXSQIv3I80t0XzU9Dg2QgqBS147V
 KQ0k8S3dxxYgd6yKaLziDdZtm7ydtNfStADsYOIqBbLWPd2jpiCl0n9zM Q==;
X-CSE-ConnectionGUID: hRVKEHtuR3OiK0jt7/u3ug==
X-CSE-MsgGUID: RLL3c6zRSO+QGfULPr+UoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83082780"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208,217";a="83082780"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:19:10 -0700
X-CSE-ConnectionGUID: Yrkua0P7Sn+FRrOFp4pV+g==
X-CSE-MsgGUID: 5xf+gm3YRTeAX3kWGytFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
 d="scan'208,217";a="275792942"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:19:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:19:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 23:19:08 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 23:19:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhTD751HX+1Kh/HiOC9j9vqBUX98ZVjCk5Vt19CJVP11RFMTOrNVmqI3N4UMJmp7/04ibCcQIB/LcSCNVSIFn5R+Nz7uYsB45oDSwm64Wp2n/paDeC4spPPToxnK5HX2EzKMx9udnlX9CDtOfHIIsExG0rOwtTopTopnkEueCywU51YAk828IYEIq3JZgIVJv20ihQSf+kN2Lk1wAJ5LwPIziCz8hMGhRSUjADVA6pUR4lZvVu1zp9pO91EzpOjSiazbGJMOo0WSiLnpQoELg8uSHUc5Mk+Qc3WJB396YJAL4FcOfrJ3ZVa5nCwVh3VLkAkNoObnd/+oqjEdZXU2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZ44yVUNOX0+DU4EdARo2djSGe54fyygaNxHIGK27JI=;
 b=d1SDQ6Co6O00uwzmPHgAgShT0rWx8aoxe+htgdlc7kqOx2+2CYLxe7jJOqN9lSQmk6Zzkb6/77XL9OGofwu/zEv+uhxH6IKxO+Mkos8PYGgOViN57AQqe+tgnQRJglNTUBZyzZAFBxejydQ37+GhpY+JvYa0GHB2GHqWmfbUrwItLVI1AUEVaUkdxMjNBilfVrPqc/PwqGuLe/xHZPD0xlXiTlcifK7/HVRMxeoboRps+PffSVO1GzYLU5kI5evE5Mw2aEEla2BtdtE+EDiygxlDFvJwN2oQEEcfQD2Ug2lVwTpIjpyWbN5pDFB9UHKU+OOEijmGB6v86D4e9wEcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DM4PR11MB5264.namprd11.prod.outlook.com (2603:10b6:5:38b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:19:05 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 06:19:05 +0000
Content-Type: multipart/alternative;
 boundary="------------mXDqmDY0FofSU2cWPVJyUGlb"
Message-ID: <5baa7def-9da6-40f3-bdcd-02edde736112@intel.com>
Date: Tue, 12 May 2026 11:48:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/7] tests/intel/kms_pm_dc: Enable DC3CO test for
 PSR2/PR modes
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <mohammed.thasleem@intel.com>
References: <20260511171820.461666-1-jeevan.b@intel.com>
 <20260511171820.461666-4-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260511171820.461666-4-jeevan.b@intel.com>
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DM4PR11MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 640cec17-61b6-4cc8-76f8-08deafee5e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|3023799003|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: B9M5HryTPAkv8xxs6IyBFqCC/fEFLCSuIwx4NOKsPjIzjzeMidHHBVlULycfYK0VTcWgrIvugL1U96oBDZIuRJ5h8luBgXAb+057a6ZuTO2FuETLI4fQkrPeowHtxhyE+bmQpPl3jMdABvYpN9/ItJ99cF7E4dpK31MHSB/ObIOK6iYU3uQV4JPzqmAjIfyL8nzVfYoRJDPievDGTsvlhKwa34oCp5QnAlISS3+Fqo4lcO+NJtpDOAgxNf4CwKw+lCp1oIXV3dm+QDjD1XHIJqU5uFAiaimOTfZzUDFAXCSaxuY5y8fPzfC4mIhFUNNZ0hVnK+jhAfvxflAMeO0aDNr33FlXoTZ17JFSCOYxNk0xbhcOWh3erdJONYPkBa4g+nIWKbaJ8cPoc6aUoXPzjMXrGIriF32TeeeCd6MqSqfETjGA7SiuwsULuAwSD1WyrNgRFHSLEsV2yEEskrLirbnr4QUdjljSjFMTYaiDQebepwG9oyd7/hop9AzMynFrcZKzH9D+uUQkDq3t9mJqTV4jOXT2gCogecXVTqYJebrwdIBA+rgK2IGtz8BokLeZWWx0nL3DAxpwXAArbW68J+EuJqHB2pLMhtbkwj+kZDx0NuN8D0aFwDKYDkdnnBRsTn8dm4N9USUQNJhOErUfGLOO7omQGj5XPFST3Pm1G83dz94u9+wtBuzRtGIzFV8D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(3023799003)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1NydDRPTzJ0Ym1KaForc2ZuaXg3djFHc1dlM204MEFqaHY0aWpjZ1BkUVZT?=
 =?utf-8?B?ZTUwcit2TXZNS3NqaVljQmJ5YnlaODYwTzIrZFE3RDVmc0VZaU5wQTlYRE81?=
 =?utf-8?B?U25oWlllS2RBVGs2VGJUTDFZM2pnSlFlVE1nK0lVcVhiR2JBOWY2eTN3Vi9y?=
 =?utf-8?B?RXdFOGttQTBPWVNZakU4T0hjdHhrbnprbTJSY0dNTjJIazZVQ2prbzBFcDBD?=
 =?utf-8?B?L24vbWQrTkZ1SEpkTTZrVUd0T2puVnJ5Vnc4SnNxQktKVzZQekNiY21DaTM2?=
 =?utf-8?B?RDJJWklGVnpZT21rUjZlS1dFL2dBWjV2TmdZNlJWTk95ek5lZXp6VkZxV1Ew?=
 =?utf-8?B?UE5qYWYxUmJUbGxEYkNieE5iOFlyQjllUDZnVFliNS91QTErOHlWMlBFbng3?=
 =?utf-8?B?elRpSmZuZFlBbFRuM1pXY05kRWtLNGRFc2IyRHdoR0xid2x4R3cyb2dKNWNu?=
 =?utf-8?B?Qk8vUVFKU2h1L3pwWExMWWsvQmJhczh6TlB6Y0ZJQmFYUjBNVHNmWEpVNmJp?=
 =?utf-8?B?blVab0NXODFVaEhWRGJOS1d2WkRFSVFlcHM5T3QrMWttVUhqdWNSeHpGWTFU?=
 =?utf-8?B?RnYvN01sZXUvaTh1YVJGVlYvdmlzTVJGRGlhKy9XektyQkdLdHNvU1I3TWRR?=
 =?utf-8?B?VEpVQTBRRVRtdE92SElhc1JYUDBKM2pHT0tYTEhLNDU2bDJJaHJOcTlMRDlK?=
 =?utf-8?B?eUEyZE80Q1BDZ1VkaW01VG5JbklKQ3NkVmNkQTMyMi9aWUlpNlBHdmdkditF?=
 =?utf-8?B?VTJ6V21IOVdjdzNuMzRkTE9VUWlKaER3OE01WE5vaS92V3VuTVR4ODI5Lzhw?=
 =?utf-8?B?QU1BVGdReTJkSHBPbGpINWRMVGRtSTQ0UHh3SjJ6WEZVTEQzRG54aHlmMVZ1?=
 =?utf-8?B?bmNaazEwdXRVWVJwS1dzUnJ4TkQwMTM2eXh2WEthWlZuZTdOQjRFQTlqTDE0?=
 =?utf-8?B?YzdQWGMwaTcyQ3kzM1I4QWJyWlVFMzVnK3VVdEhhQ0QwS3pYRDI1aHprdGJy?=
 =?utf-8?B?M0lFaHNRbXBqZGUwdkUyeUc0VmRpekZqY1c0WDI1TnFVRVlVR2tmRG5MMnR2?=
 =?utf-8?B?cm0xb0EvUXNod00wdDFqRXl4aGRLWnBVVm51ZFVyck5EbzN2NVV0SFJPLzFF?=
 =?utf-8?B?YkZnUUlJeE5NbitJZjhjZ002a1VPNWhEUmNTL09yVlBFMHI4SWd4MGpCS25o?=
 =?utf-8?B?Wlo1S1FEZEQ1RzZET1dWaSthdGZzUS8zZlNGREdVYSsxYmFWZUQwV0dGWVIy?=
 =?utf-8?B?emRYYjR2cHdTNWhadkl0UCtrditTUmNObkVPKzJRV2JoZHlBbTRHMUJCOHQy?=
 =?utf-8?B?WlJSNFhGSHUvSkh0bmJDTndDSFNHcmpiLzdtMTlVaXl0NUMvV2h5blNVajcr?=
 =?utf-8?B?T2hYQ3MwbjY4YUNPZXlpblZNQXExOEJqM3BSNFhlUmhHUlZ5SXlweEpHV2Nt?=
 =?utf-8?B?MGl3S3E4WFozZ0EzSTRNNS9YR3RzSDVxT0NCZXJsSlBQck9HOVRCMnVmSWJW?=
 =?utf-8?B?MDMzR1dLeTc5YUtCTHpaYTlsaURqdS9pQVFUd0laeFJ5NEZvd2hyNXZOOGdj?=
 =?utf-8?B?M2J6anAvRW1zaHRZS0pDNU1EblBKWDM0QzBMUWE1RmdSSGJTaDhkalBQaGpO?=
 =?utf-8?B?VkI4MmtGbUprSTJVSlBTQXBVakFIUWVjbEhkSUY4K005bkwvVlJOMUVrUkYy?=
 =?utf-8?B?eFRORjU4RlhxbkphRmVnRnpLSjdveEo4SkpjdXFDSmZlZTcwUElsdWlmL05D?=
 =?utf-8?B?QmZPQ2ptdWxKdGhHa1FwMmptbm1BQjg2bEdGU2VUYWhhcjRNM3Z3MXh0Z1BQ?=
 =?utf-8?B?azZjSUNYUGIvSEZFc1VoblMydUR5cFFTRHdlNFh2c1JvQ3dIRkpsT3NQRUZB?=
 =?utf-8?B?V0ZXdnU2cFAwUXQrTzF4Y3dKK01YdWNicS9DOHphSU5RM0ZGanJOM28wNDhy?=
 =?utf-8?B?QkVZWmFoZFZTWm9rWjI2OEI0TVdTc3Q3OGVNcUlSWHUxYWgwdVpxVmpIdWhT?=
 =?utf-8?B?NWJqUk5kbGVURlpzWktUVndHMFdrRU43a2VUc2g4dDdPZ3FxQlZpcWlnc2VH?=
 =?utf-8?B?ZkZVNVhkdjF2Y0d1ekFrK2phNlR3dXhTd2NnL2h3K0EwRjE0MXVMOFUvUjc3?=
 =?utf-8?B?SmlDd3BWRDBPeVZCUXRMSDBYcUtiV0pUQkZhWU5NcXlCV3dVYndaZlBkUEJP?=
 =?utf-8?B?emE5SEl3dUhRQ3F6dGRjTXl6K0U1SURmK1BPM0Z4aHRRUjlaSWppclErcG1C?=
 =?utf-8?B?dU1EaEcxaTJNZnVNNkxNanJncHdpSVZoRzRrb1lYS3NSODVtZkgvNmxFQ3pj?=
 =?utf-8?B?M29mM3VFUXpmYXNURXQ4MU5EdEZ6VTdoUCsyZ2EvMTYrYUFhbE54ajVVV09a?=
 =?utf-8?Q?Q9L32quJxFUF3d1M=3D?=
X-Exchange-RoutingPolicyChecked: vXUEhACY6Jn3nvRTl9dQKQR0+6k5VbCczja76PiYIfaCx2j6OT5qndxSCnunex43V+IffnRXInmpr5xyLNJtTONC1Y/2OruY2f7ka8b/Bec6wCrdnyYxvEV8rXv94QYjFhGajrp+tdYyxPT/nmWP9lMgGNSKkyxIygaaPguyM5YXf8OxSB8wHtkTd8wvYrHtEXxwozZsUNEC9qwM1RdOTwFDkXn+75wBYtEid4wlcJwA1J1NtR3Y5d8FUewT3UBPM3wXnlZCm8dUGmQUHj2kQmv6VxbZOY3jPkTArkxDdPJ9VscMv1nefY9sAx/PmQRFV13KPr6tR+YLynxrzPl19Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 640cec17-61b6-4cc8-76f8-08deafee5e73
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:19:05.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2nF+W4iQWvtIFK1l2LQsW0YaBxf6oK4nrivQR7SKuUXAZbQJ3kZFjJ2AjjdyjAVWlIPX9259Hm+lPIz8T5u/IqQ+8mSkUe5ohuetlxD5io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5264
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

--------------mXDqmDY0FofSU2cWPVJyUGlb
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jeevan,

On 5/11/2026 10:48 PM, Jeevan B wrote:
> Enable DC3CO with PSR2/PR mode on TGL and for platforms with
> display version greater than 35.

This test is also applicable to display version 35, so the commit 
message should be updated accordingly to reflect that support accurately.

like, Enable DC3CO with PSR2/PR mode on TGL and for platforms with 
display version 35 or newer.

>
> v2: Fix debug, remove trailing dash and merge mode and char to
>      single strcut array.
> v3: Minor cosmetic changes.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> Reviewed-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 50 ++++++++++++++++++++++++++++++++---------
>   1 file changed, 39 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 27fa5dc39..83652e9f8 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -110,6 +110,11 @@ typedef struct {
>   	bool runtime_suspend_disabled;
>   } data_t;
>   
> +struct dc3co_test_mode {
> +	enum psr_mode mode;
> +	const char *name;
> +};
> +
>   static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
>   
>   static void set_output_on_pipe_b(data_t *data)
> @@ -319,18 +324,20 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>   	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
>   }
>   
> -static void setup_dc3co(data_t *data)
> +static void setup_dc3co(data_t *data, enum psr_mode mode)

This function doesn’t introduce any DC3CO-related updates. It only 
adjusts PSR enable handling. Given that, renaming the function from 
|setup_dc3co()| to |setup_psr()| would better reflect its actual purpose.

Also, since the required PSR mode is already stored earlier during the 
dynamic subtest, passing |enum psr_mode mode| to this function isn’t 
necessary. The function can directly use |data->op_psr_mode|.

So the final function can be: static void setup_dc3co(data_t *data)

>   {
> +	data->op_psr_mode = mode;
>   	psr_enable(data->drm_fd, data->debugfs_fd, data->op_psr_mode, data->output);
> -	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, data->output),
> -		      "PSR2 is not enabled\n");
> +	igt_require_f(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL),
Instead of passing |NULL| to |psr_wait_entry()|, it would be better to 
continue using |data->output to | avoid losing output-specific context 
during the PSR entry check.
> +		      "%s is not enabled\n",
> +		      mode == PSR_MODE_2 ? "PSR2" : "Panel Replay");
>   }
>   
> -static void test_dc3co_vpb_simulation(data_t *data)
> +static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
>   {
>   	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
>   	setup_output(data);
> -	setup_dc3co(data);
> +	setup_dc3co(data, mode);
>   	setup_videoplayback(data);
>   	check_dc3co_with_videoplayback_like_load(data);
>   	cleanup_dc3co_fbs(data);
> @@ -658,12 +665,33 @@ int igt_main()
>   	}
>   
>   	igt_describe("In this test we make sure that system enters DC3CO "
> -		     "when PSR2 is active and system is in SLEEP state");
> -	igt_subtest("dc3co-vpb-simulation") {
> -		data.op_psr_mode = PSR_MODE_2;
> -		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> -					     data.op_psr_mode, NULL));
> -		test_dc3co_vpb_simulation(&data);
> +			"when PSR2 or PR is active and system is in SLEEP state");
> +	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
> +		static const struct dc3co_test_mode dc3co_modes[] = {
> +			{ PSR_MODE_2, "psr2" },
> +			{ PR_MODE,    "pr"   },
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(dc3co_modes); i++) {
> +			enum psr_mode mode = dc3co_modes[i].mode;
A new enum isn’t required here. The PSR mode can be stored directly in 
|data->op_psr_mode.|
> +			const char *name = dc3co_modes[i].name;
> +
> +			igt_dynamic_f("%s", name) {
> +				igt_require(psr_sink_support(data.drm_fd,
> +							     data.debugfs_fd,
> +							     mode, NULL));
> +
> +				if (mode == PSR_MODE_2)
> +					igt_require_f(IS_TIGERLAKE(data.devid) ||
> +						      intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with PSR2\n");
> +				else
> +					igt_require_f(intel_display_ver(data.devid) >= 35,
> +						      "Platform does not support DC3CO with Panel Replay\n");
> +
> +				test_dc3co_vpb_simulation(&data, mode);
> +			}
> +		}
>   	}
>   
>   	igt_describe("This test validates display engine entry to DC5 state "
Thanks,
--------------mXDqmDY0FofSU2cWPVJyUGlb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,</p>
    <div class="moz-cite-prefix">On 5/11/2026 10:48 PM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260511171820.461666-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Enable DC3CO with PSR2/PR mode on TGL and for platforms with
display version greater than 35.</pre>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>This test is also applicable to display version 35, so the
      commit message should be updated accordingly to reflect that
      support accurately.</p>
    <p>like,&nbsp; &nbsp;<span style="white-space: pre-wrap">Enable DC3CO with PSR2/PR mode on TGL and for platforms with </span><span style="white-space: pre-wrap">display version </span>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>35 or newer.</p>
    <blockquote type="cite" cite="mid:20260511171820.461666-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">

v2: Fix debug, remove trailing dash and merge mode and char to
    single strcut array.
v3: Minor cosmetic changes.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
Reviewed-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
---
 tests/intel/kms_pm_dc.c | 50 ++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 27fa5dc39..83652e9f8 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -110,6 +110,11 @@ typedef struct {
 	bool runtime_suspend_disabled;
 } data_t;
 
+struct dc3co_test_mode {
+	enum psr_mode mode;
+	const char *name;
+};
+
 static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count);
 
 static void set_output_on_pipe_b(data_t *data)
@@ -319,18 +324,20 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
-static void setup_dc3co(data_t *data)
+static void setup_dc3co(data_t *data, enum psr_mode mode)</pre>
    </blockquote>
    <p>This function&nbsp;
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
} </style>doesn’t introduce any DC3CO-related updates. It only adjusts
      PSR enable handling. Given that, renaming the function from <code>setup_dc3co()</code>
      to <code>setup_psr()</code> would better reflect its actual
      purpose.
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <p>Also, since the required PSR mode is already stored earlier
      during the dynamic subtest, passing <code>enum psr_mode mode</code>
      to this function isn’t necessary. The function can directly use <code>data-&gt;op_psr_mode</code>.&nbsp;
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5; </style></p>
    <p>So the final function can be:&nbsp;<span style="white-space: pre-wrap">static void setup_dc3co(data_t *data)</span></p>
    <blockquote type="cite" cite="mid:20260511171820.461666-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
 {
+	data-&gt;op_psr_mode = mode;
 	psr_enable(data-&gt;drm_fd, data-&gt;debugfs_fd, data-&gt;op_psr_mode, data-&gt;output);
-	igt_require_f(psr_wait_entry(data-&gt;debugfs_fd, data-&gt;op_psr_mode, data-&gt;output),
-		      &quot;PSR2 is not enabled\n&quot;);
+	igt_require_f(psr_wait_entry(data-&gt;debugfs_fd, data-&gt;op_psr_mode, NULL),</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>Instead of passing <code>NULL</code> to <code>psr_wait_entry()</code>,
    it would be better to continue using <code>data-&gt;output to&nbsp;</code>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>avoid losing output-specific context during the PSR entry
    check.
    <blockquote type="cite" cite="mid:20260511171820.461666-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		      &quot;%s is not enabled\n&quot;,
+		      mode == PSR_MODE_2 ? &quot;PSR2&quot; : &quot;Panel Replay&quot;);
 }
 
-static void test_dc3co_vpb_simulation(data_t *data)
+static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
 {
 	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
+	setup_dc3co(data, mode);
 	setup_videoplayback(data);
 	check_dc3co_with_videoplayback_like_load(data);
 	cleanup_dc3co_fbs(data);
@@ -658,12 +665,33 @@ int igt_main()
 	}
 
 	igt_describe(&quot;In this test we make sure that system enters DC3CO &quot;
-		     &quot;when PSR2 is active and system is in SLEEP state&quot;);
-	igt_subtest(&quot;dc3co-vpb-simulation&quot;) {
-		data.op_psr_mode = PSR_MODE_2;
-		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
-					     data.op_psr_mode, NULL));
-		test_dc3co_vpb_simulation(&amp;data);
+			&quot;when PSR2 or PR is active and system is in SLEEP state&quot;);
+	igt_subtest_with_dynamic(&quot;dc3co-vpb-simulation&quot;) {
+		static const struct dc3co_test_mode dc3co_modes[] = {
+			{ PSR_MODE_2, &quot;psr2&quot; },
+			{ PR_MODE,    &quot;pr&quot;   },
+		};
+
+		for (int i = 0; i &lt; ARRAY_SIZE(dc3co_modes); i++) {
+			enum psr_mode mode = dc3co_modes[i].mode;</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">A
      new enum isn’t required here. The PSR mode can be stored directly
      in <code>data-&gt;op_psr_mode.</code></div>
    <blockquote type="cite" cite="mid:20260511171820.461666-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			const char *name = dc3co_modes[i].name;
+
+			igt_dynamic_f(&quot;%s&quot;, name) {
+				igt_require(psr_sink_support(data.drm_fd,
+							     data.debugfs_fd,
+							     mode, NULL));
+
+				if (mode == PSR_MODE_2)
+					igt_require_f(IS_TIGERLAKE(data.devid) ||
+						      intel_display_ver(data.devid) &gt;= 35,
+						      &quot;Platform does not support DC3CO with PSR2\n&quot;);
+				else
+					igt_require_f(intel_display_ver(data.devid) &gt;= 35,
+						      &quot;Platform does not support DC3CO with Panel Replay\n&quot;);
+
+				test_dc3co_vpb_simulation(&amp;data, mode);
+			}
+		}
 	}
 
 	igt_describe(&quot;This test validates display engine entry to DC5 state &quot;</pre>
    </blockquote>
    Thanks,
    <blockquote type="cite" cite="mid:20260511171820.461666-4-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------mXDqmDY0FofSU2cWPVJyUGlb--
