Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BB3C5DF6D
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 04:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6ED10E0BC;
	Wed, 19 Aug 2026 04:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ThaowHp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E9D10E0B8
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 04:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787113920; x=1818649920;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ex65+ZP3dUe7z+ICfQMj3anNUiFrVYac/S1abcnK+g4=;
 b=ThaowHp4DqA/TZOhSQKOWu2qw54WlNnO4HEiud25WUnQ1sKH3T1cvee8
 xen8je2aSC/Ab8ZTdJ4do8EwB4a61275mH7mUaojmFUd8BtUx8gEIinyw
 yIZt/2FIyaJgx9duG00t483SQhB6GmeJTjQ0Xn0p8Cmq3aku80wYy9/nd
 hEDFJ0pJghJBh9KtBbwpv1RQEVESibNQcPsLvuy2MEUhR3B95BxtE7Xnm
 c1hyGphh5OhRn0EbamCrX3LwazRJ+d41iMEHh2biQcu9oHv9+TVrrOEMH
 21h3Vlc/v7DxoCyZNBd7dRzR3mFTe5w9cmv9zhq+pHuONeo9n9JiZ3uj7 w==;
X-CSE-ConnectionGUID: UAvITmlzTZyoYntOju/eSg==
X-CSE-MsgGUID: j4U8xKEsTUWorKWOJsIPWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87632747"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87632747"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 21:31:59 -0700
X-CSE-ConnectionGUID: ykGg37sRTcmTwQDpkdlPaA==
X-CSE-MsgGUID: mw1kmtMvSYSLL5d9po8qhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="259234029"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 21:31:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 21:31:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 21:31:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 21:31:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+22QhTmgALraxt+ZANtEUMexYHjqAyZ3NQDKYgi/S8t3CfPQnvHxs4bqkj3PDKPpGueVpL0q99h39fhzx6KGr3ta+Xp/bg7+h1xeBQOkxhOY+LOEi5eihZaBPuPN8dR0vDolG5wd+mSn5/2YX84gcenTVhX2eebg6yvss5JqZne4yvlpaTiX6L5s0WIBFwJQ050i7geIX/cW8/NcHWyUjWGwMB5QqJxPojJaHmIHsi4UvJmeHX5E5YS0pqKFTAtbRHGqXJCqP9U6xlO0+G3BZnfAdT94gRErlt6MNAgaCeOmlSOrDEFjjHbV2OuBQi52+6Gz31KXhsMWvha5IRc6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Kct0JTRZpf0gBTSKUoIgyoK6tuYXsfSAOS/wafXCjo=;
 b=J3yekeivX7DZeCr2FMqecJiLX7lPCxluDDM5xl7g8f1puVkP2wqZFgF+MCKmKYubptSPO2o66m/tTr8cG9hxvZ0x8f0BRwY6dYMfP4NT+9LX8npZfepd3bpfrrpfjHh4Q49geif6FvD1yGrG1fW4Ltyv30a6XDsRQu7qwNNnyzehiCba0z+ZAbTRJWUqe+jAP2Qbyagryzjwxc+WX+JhVeKAPYp8K6SI/CEotl/rHRCTKeuC8dMHLwDjNgDafA95Kf/lCI2i3kZSjb4Yp2uB5GIVoQoE/zQd8/RMAUjDxeMsx+VnM6zLQYOU2QUeM+2hHoC6uvGerKOynrTZR2i3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 04:31:46 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 04:31:45 +0000
Message-ID: <d8094289-edee-487e-bfa2-401ce46e99e9@intel.com>
Date: Wed, 19 Aug 2026 10:01:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/intel_hwmon: Warn on zero-valued
 numeric attributes
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260805135842.34736-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260805135842.34736-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0360.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::11) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA0PR11MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 54b88cd0-cc88-43e5-d721-08defdaac6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7tzVqcu9Rrz3xkLLbjjOGc8I0QBzDEAe7ZP+A4QD17MFjR5FUHVPcJAAMQ/zQvhuxxIg5k9ukpsAXtMnq6OHgB06b8H4NQnYK1nLRCJK1fJcw6B17oV1qrLEAA4FK+gMPdyuymqRcolJW4/pt5ycXpkuI5Z+UwM4wAgxGgp/EKxLBQKzPwTO6Hihyn+Vyz1QeifAeYEYIm4kQHhZUyI/g/4iz4aZEYe0s2/ZmCmvzEcr0zcneLx8DsuqDzKVNpXf2uD0Ii215YrqdXwhHxA5lSTTg3GPlxelhjAzK0fnJpaEV1grUjNgGK655Y19vSOCSGYMEdUI4xOzw1n0RT4mQpRSaaY6j9FsfV+L1LMyLQjAZ/RN4Enz63vlDDKyJhvhaZvmssq383WSiofod95tKlO9GxjBwix4v5zwuSPxUNTmFPbenFhWqWb6nQVjb/bOpvIcoNkvn64VEBm50TTxII9BeQTEEYfGjDzUKxNK1+hsSo2w5fCSXX2gsigy2zjrU+okWoP5gtQbcA/M7vvSuZqf3c+6hEb4oO9eXCuk89D9iFG6heigv7pbs3yrt0BfpilJqJ1m+S1yvUH0dge0yoZvh8Jo6SaXNDExki6nWuJBGCQE4am1D55MsojfzfFDiHGht+dGaajwZuKwq+ZhZtrb69NhSeFjEicik45xbPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhLT1RiNDhidUxMNGtiNzJ3M29VbWx5dUNYMjVmcTZyQVBHdGxTZ2xMdzdP?=
 =?utf-8?B?bGxCZUdqdTNHZ0xpQmJ4WTE5MVgwakx2ajJlL0NEVUtxcnFnK1o4bVFsUExU?=
 =?utf-8?B?TFpqbHpLcjNZcklyK0lQZ2xNdmFSeUlXYnlHaUVYSmVLRG03ejFHTzYveWNr?=
 =?utf-8?B?WVVwNUhwTTBuUSttb3N3Tm1BTS9tVURvVDJIc21uSlZ6TTZGVzVqZWgyQjR0?=
 =?utf-8?B?UjROWUI3UHBuWGIvcjRrMk9JaE94L2F6MWNtZGRiMS9EWmk1Mmk0NFVxVE9S?=
 =?utf-8?B?YyszQ0hITGt6MnZYS0dSU3Z6Znk0VzZYeUFRekdWNUVsczFhdzE3UzZDV096?=
 =?utf-8?B?c3VFV053V0JjV0xkRTdEREZxVzk4QVhyaXNKMHRDZnM3UTVjeW8xMEkvdjNS?=
 =?utf-8?B?R3hEV0tWSmZmY1dQZ3B2NVFuT1RkcVA4TnE3cTB1WlhyRDF2bVI4WmdrM1FG?=
 =?utf-8?B?SmViZWpMTHkveDVzTUd0R3QrVVlEK3JSZ25abStaeXFHRDdnVEwydytnZmNX?=
 =?utf-8?B?cHB4UzRXdDJLeGhZSnRuSXgxcTdLSjRac3NuZ2JGQ3VPN3hhVHNXbnBlazVW?=
 =?utf-8?B?NEpRclFVQUhzdDAySHM0UnhnU016QjBoZ05pODU2bUd5elFtcXhXNmgrMVFj?=
 =?utf-8?B?VHZ6bkswNnNMeDRTSHhVRCt1NnlpdDJTTlVFR0FHNFQyR1o3OUZHRXNZSHg3?=
 =?utf-8?B?aG54N3JGcFdlbFpzZm5SL2FHYmJQQ3BINFBvVExiVkN5UVZnZ3RUN2RXTlBF?=
 =?utf-8?B?UjhDcjRudzF5TlVxT0wvYnVOWmVHODF2dlo1MWNrT3EwS3FsNWNuMWF3QjFT?=
 =?utf-8?B?K09EU3FPakpjYWMvaU5BRGdVNjM4c0QrUlFxUDc1RlJ4ZjVQdEZ4NmltdFVH?=
 =?utf-8?B?WDlXTi9peW54Vmx2ejlWSGRKSG5tSlE4UmZvRWxYdzg0UVkwYk4wc21NZGx0?=
 =?utf-8?B?UTlPNlFYM2p6R2daRElyMERUWkpMV1RtWVpzczNSVzNDbUNBSWxZYVBLRzZu?=
 =?utf-8?B?SjZHZWY1bDJ5SERnRDRod05UWlhmSjVCcnRscXpCUzV4NU1Zam0raWpPaVhR?=
 =?utf-8?B?aml3R29aK0dJa1RYWlZ4ejZ0L0tFRmlsNTB2WWxPTHRoWEQ3UytleEd1NEs1?=
 =?utf-8?B?eHFjaHlydFk1Y3oyZ1JoN0lNY2txVW5Gb1NmQjV4bUk4TVYvS0RITWxmdGsy?=
 =?utf-8?B?clVCcE56TzFzRUFVdG1QY1dYSUk0NUw0aDU5U3NyRDN2Nk1JQ0t6c3JsR1Nx?=
 =?utf-8?B?ekxJcGJPSmVtdDF2NHk2a21VRXorODhWT1ZLTEluOHpJNCtDN1pOT0xnMHVE?=
 =?utf-8?B?VDlHcGp4QUY3Z29LMTdqSi9pWHlucUd2SFNvMzA2YzEvRkhBZjMvWkdwZ3JX?=
 =?utf-8?B?aXFCMWI3OHM2M3RvcnlUSlQ5Zkltai9sQlU0elN6T0Q5NWlXUVlJZUtDKzFC?=
 =?utf-8?B?RjNldTFEWlEwQWw0RGZTQUJzdVFCUVNtRy9LQTNTUjlvbnl2MzBKMjNibzds?=
 =?utf-8?B?bWQ5TE5ncXhoWFg3Tzdqd1l6NVQ2TXNub1VXYzQrRWxGdEtURUlLVlBRa0ox?=
 =?utf-8?B?bVB5OEdPZFRiTVhIM1dCWW1BbjR5MFlxS2t2TWFiUTNwV3BObFB0L1VtYUox?=
 =?utf-8?B?SFZocTFoSXVaaFY0R2IzZTkvNG9MQ0VmQW9ReVpWd2gwR1pHelhoS1BycEpq?=
 =?utf-8?B?U0xsRERucmtid1hGNThoaTZaUVNIWGcxd0toVy9zQndHMXF1dDRrc2tGRGk2?=
 =?utf-8?B?M1hteFFNSTFnZkNEd1JKdnRYYUptMG0yYXVHYjBBZmZxZndId1pXM2RFN3Fy?=
 =?utf-8?B?MjFESm9tY0xJMkVXT3N6YkxLWlVlMURoTzRaSlE3Myt5K0RTc20zWUY5eVJN?=
 =?utf-8?B?aHZkc1dHZEdpeGlTUm5TYk0vc041dU5JZzZkcnhpNDlETDAzT3Z4aDNUZjVn?=
 =?utf-8?B?Q1c4ak5Nd1BrakFzTFYydlRjWjRHMUVQRTJoZUxiajJwK055OU9GUnpkTVhw?=
 =?utf-8?B?MnVaTm1RSzU4alRzWUg3ODh5cXhkb3EyZkhWQjlkdFNCNU9KaFJPcjV6Y1BI?=
 =?utf-8?B?NjlYVFE0NUtzOW1LejJ3WHdvZ1FWd3M0RG1VNlFtc09ENi9KY3RneVJsOEVk?=
 =?utf-8?B?VERFbld1RU1aT2lGK0pHaUczOENFRVhaTU5aWGpHLzJSV1dnYzhoWG5jYVhG?=
 =?utf-8?B?NWlFZDl5a3RvZlZ1L3hOaWFoVUJEZzF0cUFJaWY2a1Y1a25BY1BMQThVUVd6?=
 =?utf-8?B?QkpIbkhMYU9nNWdBV3AvSnUrWXdzU21FcmVoVU5NZS9QVTE5V3U4V2h2enBx?=
 =?utf-8?B?YnZYOWZ0QW12enVFZlJ2cm1vMmk2dytmMTZEWWx0UEQ2bmdick42dz09?=
X-Exchange-RoutingPolicyChecked: dB32/R+4gO04kOdzGEAFLeECSowfilMCJ/NYJtn0VTsu7aZtsgfqv24fASplhXWKI5x5Ixg/NAXwIYFyLyGh3N26FJjPtXpg4qeli5Nex1aJ49v1uT2BVzoRUbQTWtJ+qAuXc+gP5wb1EexFbJi4NmPhEJ//UM30A62QLP44vYYoKM0FmD9BNDaW4ES6VDFKm9MS9C5LQaub98mmZbMpNipZqmmKs/x11TGIfut6FQqejALU6TtQOH7AI5VjfWHZn47rx0GagQbKcWfJDSZURzFflsyZyABHQ90jjWZM1aHrwRFi2x5BHEimIWDoYSEpXGeHk0LjUMQSFlD8UinAFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b88cd0-cc88-43e5-d721-08defdaac6b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 04:31:45.8240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V2h8XxP7wVhlUr5uKYXYO0rNH00w5eD9THvsO5CgmBOXCsb599Yn9ffZUBHi8E1wdoVNnytNrkCvKRya5JAKVA==
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

Hi Karthik,

On 05-08-2026 19:28, Karthik Poosa wrote:
> Add a check for numeric hwmon attribute values and emit a warning when a
> valid numeric attribute reports 0.
> This acts as a sanity check for valid telemetry data reported via hwmon.
>
> Exclude *_label attributes from this validation to avoid false warnings on
> non-numeric label entries.
>
> Also include the necessary headers required for numeric parsing helpers.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: GitHub-Copilot:GPT-5.3-Codex
> ---
>   tests/intel/intel_hwmon.c | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index f185c1ca3..6fe57a334 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -4,6 +4,8 @@
>    */
>   
>   #include <dirent.h>
> +#include <errno.h>
> +#include <stdlib.h>
>   #include <sys/stat.h>
>   #include "igt.h"
>   #include "igt_hwmon.h"
> @@ -26,6 +28,31 @@
>   
>   IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>   
> +static bool value_is_numeric_zero(const char *val)
> +{
> +	char *end;
> +	long long num;
> +
> +	errno = 0;
> +	num = strtoll(val, &end, 10);
> +	if (errno || *val == '\0' || *end != '\0')
> +		return false;
> +
> +	return num == 0;
> +}
> +
> +static bool is_hmwon_label(const char *name)
> +{
> +	const char *suffix = "_label";
> +	size_t name_len = strlen(name);
> +	size_t suffix_len = strlen(suffix);
> +
> +	if (name_len < suffix_len)
> +		return false;
> +
> +	return !strcmp(name + name_len - suffix_len, suffix);
> +}
> +
>   static void check_if_temp_valid(int hwm, char *sysfs_name)
>   {
>   	int32_t cur_temp = 0, limit = 0;
> @@ -64,9 +91,11 @@ static void hwmon_read(int hwm)
>   		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
>   		igt_debug("'%s': %s\n", de->d_name, val);
>   
> +		if (!is_hmwon_label(de->d_name) && value_is_numeric_zero(val))

Typo : is_hmwon_label -> is_hwmon_label ?

Thanks,
Soham

> +			igt_warn("hwmon sysfs entry '%s' has zero value\n", de->d_name);
> +
>   		if (!strncmp(de->d_name, "temp", 4))
>   			check_if_temp_valid(hwm, de->d_name);
> -
>   	}
>   	closedir(dir);
>   }
