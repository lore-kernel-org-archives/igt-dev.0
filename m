Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B3AC79F89
	for <igt-dev@archiver.kernel.org>; Mon,  7 Sep 2026 10:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAF310E20C;
	Mon,  7 Sep 2026 10:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqB1tfJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8276A10E0D2
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Sep 2026 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788777072; x=1820313072;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=SxzlzCKDvgw8VcEtYQedQMKj94qM/CPndaTJCOcyq4E=;
 b=TqB1tfJ7WYs5YQ0rTG6tWZ5H0KIZKmYMR1Zid4FuqQXFA0NBLfHz4T9G
 ctHXNphYKNm83eQZ0MC1ICnhZpigK67tuRiwsi4oR2V/f068fCZqAsSEI
 MeJGlMc/eoMomGr8+6zO3Yrz+pFn5P9vMgMJzvLlU8RaeEuQuqhEFW6Js
 LN5JKVmcYlfX5016yBnHzSgS3jdVTQYe6Ls/38A81SPb2vvPpjo/dBt0Z
 ILPcXepENuUW4MhsUW6jv++kqgUBEF0C3/OJZN94oNicLB68m0YmHzhWq
 OM4k0aZJMh5CfS1OZRQ6ti/L0SSsXLiC1LcvZr4ZSOv2IaU+g/JV/VUs/ w==;
X-CSE-ConnectionGUID: igHwujSrSsu411M7I8jksw==
X-CSE-MsgGUID: JJuXIOV9QQyJ/E2nb2OVxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="91688816"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208,217";a="91688816"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:31:12 -0700
X-CSE-ConnectionGUID: 1bXRS++/TSuHUEryUn3TZA==
X-CSE-MsgGUID: gPh7N/IWQfiU16q3bepkBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
 d="scan'208,217";a="268098986"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 03:31:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 03:31:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 03:31:11 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 03:31:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnYrQX3Ihy3iU/B2RyZtbUp34yuZWHLaXDYdItgv+mOkKn/qApkBORlMUkCVHuDF74j6Qf/rS/ldDFdTor5G2dudjZH5uydxlTPkqCKjls6EA8kqFhBQlomz7qYfjLCQY0QZ0I3o67FwEjWNmAbrSMZQeHNbbYAReTNoPJJybzBkE9la8RT0m+hHjvOY+3gV4xG3jEFa4Jl8ecEE8V+GA3sjAI8oBjvwXLh3Db6sKAX2D4HX5IagP+ZhAMn5qgVxHLJyjUUdZGtslPp4gFhICQyr19BjuOU+ieRr64kMzYEYT7KJDrnTTzQyWfKka1WOudqwvkbGj+yTIH48XDCxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0XyzY2j1Sesi00N8GQlJ7vSHUSCQQmZxRkOu/Bto08=;
 b=X6o3jlsmspsr1poHWVPdAiUu0antXqJgSkWCvAVGvNpqyOyPIp8bwVDIw/1RiKXywFuQDoCPEstPI92uMnlUXrvHSlg5t6QlirAnwr9uBrLR/5E1/I9liW2bTZ+v9qyVuX+VtiKi4I1eaA4YkET9lE589RppbZ4jXAUvXvLFbz/h9/3b2bKiLBi1Zn98x3oo3lKWEWM45VM3E5PsvD6dazidl6QS8XGy+shyUu/uISQW8XoG2VuoJOwUHcAGXG5MdHOvlcYnyBEFsMZrKJDBQB9YzVXbLLpo+rggU4ANv3U9CrIRAJBFm0ErL0+YZuXbSUbCsrWvv8lYe94/2+rIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:30:48 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:30:48 +0000
Content-Type: multipart/alternative;
 boundary="------------Nv2cftLGPENdyXOtz2O4yOSB"
Message-ID: <5e565343-8871-4006-b0b8-a490f2912b29@intel.com>
Date: Mon, 7 Sep 2026 16:00:41 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?=3A_Avoid_stale_errno?=
To: <igt-dev@lists.freedesktop.org>
References: <20260904100042.583658-2-sk.anirban@intel.com>
 <178855720059.125641.3087920712210357187@61270ab9df2a>
Content-Language: en-US
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <178855720059.125641.3087920712210357187@61270ab9df2a>
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|PH3PPF957B3B2A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8c6e03-069b-4259-ec59-08df0ccb153f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|13003099007|10067099003|4143699003|56012099006|5023799004|11063799006|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: D5P0i2+UpMwUnRG5H+ukUBFgAyKBxx1+Bcxiywto8+ufyfXh6TX2U0vfNKODxuFZT+dimSDXEvTrTuVgJChY6Co0/nl5ftaRppJfMGMN3HQrL8rxFcrSxg6OobNFP6h4GpcWwHYgdv21osYluKqK7rFa3ed4u6rx5VUam3h7dI+ipMR44mjhMwvo1fYyb0zF8Pye6MyOyUjUaqmqaFQp/35ms3IbTl/FLF+bDnZXNiTI/LayoO2hU0dq58PrbLgr8Y5E2npk5Y7haPwYcqBQkifctQWfcE4vfdnzNYrKA0i6AOEwAJ5O208RHoyzUDULRivAKSFH/+0RasaARMrxWFEhDtkAoxlbutS+z3/OuYWnr1U/LJLSCFs14f/VfDYrl1CV9k6uhzILnInibCwSJ64Rf7QW5DGGE48/Fg331c/GBVviRNfE+J1V8DuOGxVXX22Ql9jEWL9MP2IRtBjlleHeZM9FWW4YhBk6sbdg+Me1eZU3SPHlrTAqdPfWB6yRNiwFNwhhnkk0Y+q7TpfSCt1OcWPPhPEYPjzhB8wZohrGL+HyaB+9tQSULlqUW+Vdjd4aL1KyzhYoT73jrQjxKk+o6a83tGvcn2G6OlreiUAwe4D16n2LsDuhzixoAC+R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(13003099007)(10067099003)(4143699003)(56012099006)(5023799004)(11063799006)(8096899003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFZBRGs4eGpjUThla1B2NVMwSTI3Z0tZZ3Z5VVpOSUZRRDBua3EwYXdicmFz?=
 =?utf-8?B?M0ZFeEtkNEt4SkxYaVhzRERuSTJXYnl3TTM1ajQyMHc1L1pxZUQybzlOOHN3?=
 =?utf-8?B?bjBnQmZFaUhrRDhQMVQwQnoxb1VsZXdqb25LYUx4dzI1MEU5ZEhkcVRvc2R5?=
 =?utf-8?B?K2NwM1BaTEpDd1FzS05HYm5xSTF2ejNId21DbGVqVzF2VWR5QiswTGdYZWR1?=
 =?utf-8?B?MVFEWW0xRTZ2ZjlaV3U5ejcxbkZheU10Zk0wL1cvRlZuWlU1UEdQcFIyak9w?=
 =?utf-8?B?UVB6UTFFeFgwVmgvZ1ZlN0tTSFJUd25Dbk5NcWIxaTVwMXA3YUx5bnh3d1hu?=
 =?utf-8?B?UWlQWEd5UlhEM2l0UWxjSlh5d29qWjRkMlRVMW8waGJTdm9OdUpqVUh5U1kv?=
 =?utf-8?B?WGxNTVJaSzVrU0o4SlBQTFNSZVo1L2R0bTBWUWxTUkpwajdsK0NmeXRheGpm?=
 =?utf-8?B?SWt0SFpPWHFFakFrUlBSV1U5YUxXRVFTRlJVK0JONElHMUxiSWpOZjVUUjBH?=
 =?utf-8?B?TlRCdnA4cDE5QUV4K0dPSzlDamZ1Q2N3OVhUcVFneFU1aGJ6NysrQUl5MXgw?=
 =?utf-8?B?UkhCeDlQUU9vdWRucVpiLy9LVEtnNUVKNmo0a3NDRWNUaS9lbmwzY2x2TEtk?=
 =?utf-8?B?cDIyUVdOK3NhMEdXRmlrNmR5VGJOZTRldTh0Mmx1ZGRiL2tRZVRBU0R2eXUx?=
 =?utf-8?B?czRZQTYwdDZwZzEzVlVRTC9vemtGOHhGR2wzYm1IWTBuU0pEWmJ1UWNWRU1j?=
 =?utf-8?B?S003Vmw1NnNJOGJTcHBsMmZUdGpKeDZ0RzBTclRrbmhPYm9NZ1FmYzZVWFBP?=
 =?utf-8?B?V21KeEViNHBrdVZ6Mm13Qkg0VFBsQUE4dzhpNUN3Z0hpZmVrbnljV2JwTk4r?=
 =?utf-8?B?NGtWeTAxN1JaQVBNSlRaUkl5ZStlSkwxT0NGc1pnUVdqY3N6c3NWQTdDMVd1?=
 =?utf-8?B?TzRGZ0cxTHNmOHZaNWdQaFlzNkdQZHlNc253Vk1rOE90ZnhMRk1OeXhKbG1R?=
 =?utf-8?B?OUZCSjVsbytrYkJ4cGJPK0t2UGczWXJZREhvWVFUTDBMTjkySmdzQnhGUi9V?=
 =?utf-8?B?a1drcThXZ2luRFZ0UnpUdkJ1a0gzUGhqMFd5emp3UzJKTkJmY1ZYQUt5bDFR?=
 =?utf-8?B?b245T1phOVgramYzQThGdGh3UkR0TVRmMWpSUS9UQTRtcGRIVXlKQ1JuM0JD?=
 =?utf-8?B?NTd2UXEyaklXRG5PaURQUHlEYTFFU1NqV3k4NjAvMURyOE9vcjZZYWJ3OXY4?=
 =?utf-8?B?RUdKdFlyVXhsN2hyd1dEM1p6OVNHZDl0S3ZtMGRCK2RWamtVbzBsRGoxZDJB?=
 =?utf-8?B?djRhUVYvMW5BeFNwYjFPZHV5anFORDRhWEY4bzZkVVVwTDIwbktvVTJEb3NM?=
 =?utf-8?B?b2F3bW5sai83b3pCc2FRQ0Z4bEZaQ1pUcmY5eXhTdFQ5UVdiUDUrUk1MdVNS?=
 =?utf-8?B?ckd3czV6SUh2c01RTU1sZkRaU3lBRkhBSmluZ2NVbFFyL0ttR1c2Q0pzMWkw?=
 =?utf-8?B?aldoaWs4ZUdlbXRhWlBEYk1Dcngrblk4ZEo0b1N4Rk96LzV6T1FJL2ltQ2Vk?=
 =?utf-8?B?Y0h1R2xCSlRaSXBSb3diWXJKQnZZbkZMZ0lFVDMrNytEcFhRR09zWEo0d1M3?=
 =?utf-8?B?WXVjRk9VMVQ4V1o0YS92QkJhOFVQRGwwQVNhSDlndFhrK0pVM3JXUjJ4OWE2?=
 =?utf-8?B?ZHpWUGRlTkVRVkwveEhsVFYvTjZCbnFHY2NQRFNSdEdVQlh4ZlN2WThiMUZS?=
 =?utf-8?B?Rk5Xd1dibkdJdkVnbGpiSUMvRnRLRktHT2w5WVp6UW81RDJSSmN1ZmFqRGVz?=
 =?utf-8?B?MFk1aVVLaUtyckpjVDlRUHV4eVozcU50WHlISjNxSTk1ZldMOW9GZXJqWXdy?=
 =?utf-8?B?ZXFQRzhaR2F6empkMXpXcElkaVhoUzd3S0dFdHRhYy9vZGJLMUJuQytRWjZV?=
 =?utf-8?B?TnJRa24vdnpCOEFkNnlHdmptOFh4YlhTZCsyM0QrUXpBQ3BsWlFYUVhWY0ZM?=
 =?utf-8?B?TUVmeHdCdFFOM2pOTHpJYUVXaER0YXIxVzVCOHR4RjlKMHRmclZRcWlFQ1JH?=
 =?utf-8?B?YlhKdXNlSjJzVXFySEtQeGpYR240U3ZPblFIVTF3aE8vWXcvVjJwZHJEbXdn?=
 =?utf-8?B?UVR5c0N3UjJjRmtKOWFsRXhJU0FwUEZoY1VmSndrdjZVNzROUlVLaHJpa2pJ?=
 =?utf-8?B?Mmpub25PVUFIQkNnLzhsYnlmcnVXem04UVhNVnZ3MFpsakFMd1U3cEZPRlE1?=
 =?utf-8?B?VlJmUDlSbHAyclJHOWJwbkpCWDYyMUxoT3JIVXFsNHJoY29YQWxwTUtyTXVD?=
 =?utf-8?B?MjlobThhZkNJU2UyRS8rQnJBWWRIalQxWGZXY3pjcXlKeSs0c3ZQUT09?=
X-Exchange-RoutingPolicyChecked: gpAucu+WblmrBiIjvphLcuxe05JFGctUK/QQZslBQhv4zLrRoj7pxSlDGX+OmQt7Iho7jTFV6B4fEIh64spIwVhi7oNcvPdXClOnIerPyWGHslGKWqlWK7xFgcnrBNiI7rr7W/tIgya9EDEweLqJPOmpyhv5jrY3ySMjoMYHU7wYg2dFVUaBumhi0tRfXJh45nyndCpu4H/DGS17bU4755F3kmlInWat5J8nh37MSdjNufJLB1r3jk+ulMGJZTMgtJWjbdk2BzS7mx4lDTDQDkxODLkMhdfcsCgkbcAl9N2A287HcSrsclv/a4auG34s9zFUf7Aviz08CExnP5t0mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8c6e03-069b-4259-ec59-08df0ccb153f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:30:48.6326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HtaN1+2qob1w6rBlgqfKelF21GCPVt/EjTP7MHErCGO0keWDXGpqIg43X7U89Nx7r973jFktJTmVZGK0vEpOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
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

--------------Nv2cftLGPENdyXOtz2O4yOSB
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi
These failures are not related to my changes, please re-report.

Thanks,
Anirban

On 05-09-2026 02:56 am, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel: Avoid stale errno
> *URL:* 	https://patchwork.freedesktop.org/series/173370/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/index.html
>
>
>   CI Bug Log - changes from XEIGT_9084_FULL -> XEIGTPW_15789_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15789_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15789_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15789_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>  *
>
>     igt@kms_fb_coherency@memset-crc:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/shard-lnl-3/igt@kms_fb_coherency@memset-crc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/shard-lnl-6/igt@kms_fb_coherency@memset-crc.html>
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many-vram:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html>
>         +1 other test abort
>
>
>     New tests
>
> New tests have been introduced between XEIGT_9084_FULL and 
> XEIGTPW_15789_FULL:
>
>
>       New IGT tests (1)
>
>   * igt@kms_flip@basic-flip-vs-dpms@d-dp2:
>       o Statuses : 1 pass(s)
>       o Exec time: [0.75] s
>
>
>     Known issues
>
--------------Nv2cftLGPENdyXOtz2O4yOSB
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi<br>
      These failures are not related to my changes, please re-report.</p>
    <p>Thanks,<br>
      Anirban<br>
      <br>
    </p>
    <div class="moz-cite-prefix">On 05-09-2026 02:56 am, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178855720059.125641.3087920712210357187@61270ab9df2a">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel: Avoid stale errno</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/173370/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/173370/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_9084_FULL -&gt;
        XEIGTPW_15789_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_15789_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15789_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_15789_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fb_coherency@memset-crc:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/shard-lnl-3/igt@kms_fb_coherency@memset-crc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/shard-lnl-6/igt@kms_fb_coherency@memset-crc.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9084/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15789/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_9084_FULL and
        XEIGTPW_15789_FULL:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@kms_flip@basic-flip-vs-dpms@d-dp2:
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.75] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------Nv2cftLGPENdyXOtz2O4yOSB--
