Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F03C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 04:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528F210E027;
	Mon, 29 Jun 2026 04:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjPTjPV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809EC10E027
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 04:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782708450; x=1814244450;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XvUnQLQwPDtFmOgs6GoJFj1nO0PkR1WSG9E5ABiVfTg=;
 b=SjPTjPV0x1kVw5rUPRrWKLhkvlkLT8Rct2owXWTCOrhIYlsUfl6iyM2t
 ry9dClhtIB+jJWKOu2pnXHDU160eHtPqJv/9Wajl9UtY5vGDI20NiY4uC
 zuB//74LMwBQmnox0+eqckiagfJlVIWq8JQhdCd1NHNkcoMGIiqoqXW3x
 F7wcm28Jem7BSKrCCcofrj0GNAcdJQhaZZddo7htFl73FT6mLtavqtXrO
 uubEFgoWk7uFFfwx84B/BRbBHroJzRlzXEqAtyMVc1s1SvtfEJ5qlh2E/
 FslwOLCOzTZu1UEHdBq10oiUcBirX/CQiY9lrAvGadqYJKS0y5/7o/fmL w==;
X-CSE-ConnectionGUID: GQecdjA9SaSZErIbIRbvZg==
X-CSE-MsgGUID: ga4ytQXIQtq0hzaTLDDerg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83443733"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="83443733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2026 21:47:30 -0700
X-CSE-ConnectionGUID: XlR29sR0RMKm4YXM6+xuMA==
X-CSE-MsgGUID: Q2I7Ewj/StOvwxgpbdb9wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="275074857"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2026 21:47:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 28 Jun 2026 21:47:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 28 Jun 2026 21:47:29 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 28 Jun 2026 21:47:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kWt4HixuMSmiNYbeyjCbfTltcGH00uNlW/KKrGMTDGFTy8teWujOMNZOlzbJ9wSsvugjd6pj3HHNe4+/UBg7myy9LQQ7yDq+WNbTYbZ+OE1lV3JsIwpXgMZ7JkA0uoZQkv8+XkGJc3s0svpT2TyoQ563TEy7Deuey/SOKFZdE9rEqWZ+QdHgZf+ZM53kOsn+YNRWiLwKlFwPtyHoEPlrFnR9fh3TUO2m5vDKxCOVJXnTAZwHVErtFFSvtsZWuvuIWXJIsD4X+8uSqKl9MVKVcpzORIaplVy4J5ehgr5Cn6sH6Ncy/PJXYUMh12G9QT1r0pdefk1/DqwJ0VFR5fBxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfuWtz0OcRQoQvcIhlh+yJcL0K731evk9qVAm5k2mqE=;
 b=Pmmg2zCwKRKEgW4heu7w/vX3heEM90lh1QlkXQ/19ahUeC/b9al+TrbEoNEBeuGFwdLdasC/oYqhUt4HzGQKLadEIUPuYjNELXo83Q34Rzoyy20grLOmwiP7PuY1/RY0myySmq/HsIEoEocZ8gI3X8kgaFCCfIBBtw9ndu7ypr6TfyW7W97bdYdsAP93QkZe3gfSI/XXsPVt+hqsLIS/Tovud2iIDFKhEKheGN8XimSYgOPdacEz1fbrRTYxpYdcW1/MRXpAXMMAYdUYi+IMBby9VA6vZaxMoBQzMiGOOzyg3wMSbepvEFW0H+lU7//95nTpcZP0TV3tgX/ypbF2UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB4856.namprd11.prod.outlook.com (2603:10b6:510:32::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Mon, 29 Jun
 2026 04:47:27 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0159.015; Mon, 29 Jun 2026
 04:47:27 +0000
Message-ID: <e7a35511-9efd-4d16-acc1-4a516b005459@intel.com>
Date: Mon, 29 Jun 2026 10:17:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Include
 additional chamelium tests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <sameer.lattannavar@intel.com>
References: <20260623124913.3003450-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260623124913.3003450-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0127.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c97c907-a0b9-4498-c7bd-08ded599853b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|42112799006|11063799006|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: u93tYljIx7XTN9OLFgxQrjVu+m34/kLuDcG9/JVcXm6L+HbKW+RuqlzknvwqmkFkHNxdJ0IIO7pIuegQXp8t2DVPyRn+Qq2zvlqITbb/y9LQSDDNVy8Iy3JUE6cFnbGqcH1V+pEgypUhgrlOq9MTtcO2jpiSkO9acP8OiGN7V5lPSbvbxazlHxoXBSTp/CAmTVzPyhOCGxj/b88sgreHyi95xHBO5JL0JbS429dtZ7AFSfKQuLPbGGm4oWYBqaFJG5Q03TwrTRK8j9rK/g4luk2RA26xalsIInEZf01JBzds5Aa/aTz6BmzOuP7lBxMaHVWzf0gEwSAWTjq2Jgu0KgZ4sudr1NMHPzscx7IAZWOTG6FXAh+/j73Ld1oKw6LrHJnqY9+eMy3tVnS9BZTJR+1k7rbBQXhZr20cJtzYdN0btW8S5n7krbhwy7SbDiuPInCZK4nz+h3hByUfzDiMUzn4oKOZgQnlNtIjN2dicu1czgfA0jpPjcwqq+NyZgrTK19P+akvRqPaIcXNIr1rgvT/WTzrZQS7Z2WoCVVrH3ecKkQXoMtgPJsZc/6rt3wJCN1+1D7RGmbDEACSu1HvPj7RIKTrBJe8A/TRYOsjGNxVhgPwjF+rS0u5nPUV/cWIS+JJv1maj4HQoJiCU0ukXybNL2J6MtvF1umTRpyrXWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(42112799006)(11063799006)(22082099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStIMTdBVFdXbWc1anNWU2paMXFiVkNpRGloZFY1cGhFSDM1U0dnaHFUQVJE?=
 =?utf-8?B?RjVQdlN2Uk03dmNXU3BYL0tPN0d0bEhNY1ZnQVZ6aDQ5TzNlWGJZWUxHMm5X?=
 =?utf-8?B?WVV0cnhBUXZjRlJiYmovaGo1bWlHUWZMZUpHNVFWaE9zT3pSclJ1dlhpMllz?=
 =?utf-8?B?cjdLNWJpQ2MvdzFXS3lHRy8zN3VXbXU3UEpybEJ0VW16NGhuRFhEOTB6MGo2?=
 =?utf-8?B?dm8za0VtNUtLUVcyZUMrYXJJdjhxTGtzdW5pczIyVlZld1hCU2ZNM2JENnp2?=
 =?utf-8?B?TGhzQTY3WVJtSWgxT0RTZW1JOFk5WWJQTDhtZmZJRkgxU2g3Y0paTTRFOGtk?=
 =?utf-8?B?bEl6NnNleTV6T1dvdzl2ZnZIOFlYbGl0Uno3MzdiTWNCZlJjWjhQYnN2R0RT?=
 =?utf-8?B?bWxQQ3BTYUFvSTRjekVzRG83c1pmT2hCUHA5cmRWcktKRExaTWF6MVNPWHk2?=
 =?utf-8?B?aldkZ0NwYjZUZ2ZCQys0S0FPT2tMZ1JiMEtBSytqclVQNDVMYUt1YVc1NERP?=
 =?utf-8?B?ZVNZZHRONW9pNUY0NHZNL0hoUFpUcTR6WHk0L29iY2RXZEt2OWNmRmdHbjJQ?=
 =?utf-8?B?dlppNUVnYlNBRk80NUJxMzFDMEZoT2NyaGZwN09ReHlVOXRBUGtpR0djelNZ?=
 =?utf-8?B?SFJrbkdhSUg3ZzErRnBjT0R5RE5ib1pBT0IvTkZYZlozMjVxc0cyQTZ4K1E5?=
 =?utf-8?B?ZTRuOTVVNUcyWkNkd1N1eEFkTXR1K2xpY1VEbVMvU0pLZ3lXbnBKTXZCbS90?=
 =?utf-8?B?VE82bXdVWVVPVExyYnFWMmd4MGxaS0h1TVZBTko2eWpEaUZobitHTlRRQzdC?=
 =?utf-8?B?aGRDa3QvMlBydHhQU3FHZVVXZlgwNFJORTRGWDRuTDZvVzE0MjRFWFQyaEEx?=
 =?utf-8?B?ajlRVUtUTVpWc2lsQjVhZ2MvcUY3N2t1cm84eTVYOHVEOHBMb3V6ZTVRUkgx?=
 =?utf-8?B?Mlc3b0ZDNlMySHhObnA0WUdIQXNnNGhrd2xIOUdzaVBjZkU2VGw2eGt0N3Bz?=
 =?utf-8?B?WnNpMS83NXhlZXFGL25CSWl2b2NqZ1I5R0V1WWQvWkJMUk93QW5BU1pyT1Rm?=
 =?utf-8?B?Q2cvRU5KWE92a1BzOWRNVnBzckdnUXNWQzlTNE9oWWNRUHZjcGNXL21Qa25C?=
 =?utf-8?B?NG1CMU9vN1R3RjBJdG54QlJaeE5NeUxTVHk0WENJRlptc2tGQmQrVmltYW9o?=
 =?utf-8?B?dFlyTHNUcitKQ0w4a0wzZXNUeW9WL2V3MEJmaHQvWTkwbHlqNUxKQXNjQ096?=
 =?utf-8?B?d2lNeG1rRzVPcTdubHVOc2ZYdlN1MVNaYTMvTWpHK1VZcGNNK3drZ0VGSmZJ?=
 =?utf-8?B?SWxXQmVRQmpDSnhyNTE1eE9kaUdwTThUM0N5Mnp2RTB3S2FobXJWQjliT3R6?=
 =?utf-8?B?dUlsMVVHVWJuMXhOeGRub1I2TzlNaHEweFIrd2FsUFhGWVF1d1RNZ1Rncnln?=
 =?utf-8?B?SXpycGZHUklpbVNiM291QlBsSUNwdmY4Wnh0eVBMSi9nZkQwOU9tMXlnQzQz?=
 =?utf-8?B?UklidllFa0Zpa25UL0JqMHQ2T2VqcDkzb2RxamhTMmJFZEFhMmZDTEpRYkN3?=
 =?utf-8?B?WmRnSG9mMG10cWg4Ujlsc09lVnlUYys5QTMyM1NuQ1U5OXFtY01WWFBHeTM0?=
 =?utf-8?B?ckI2Mlphb1ZpUHBtUWd0d3o5R3NtcGtCbklhN0g0cEgxVzBXZDk4a0YvUWpi?=
 =?utf-8?B?RnJOSGloTDZwZ0NRenh6OGpPRmt0MEYvYWEwc1JLdk9NeENUdzd1RmxCT29H?=
 =?utf-8?B?N2QxZjErTnR3MmpNanhZM1V1QWs2d05OREYrdDJvM1hIUlBEMkZTcTdUL3lk?=
 =?utf-8?B?VjRjci9kQ2xuTTlMV1ZiNGxaTU5MYm5yTllxK1NrZ1g5bHBEQWpzd3o3dFlv?=
 =?utf-8?B?K2k3MGRjeHFyLzZhdnZFKzEyb0FqYjZRTDdoMTZFRFRqQTIzeGZVbWdVOXNB?=
 =?utf-8?B?K3ZodWllMHdTT2ZObytoMy94aWlHYkJtbVR5cWRqVnRZSXZSVXdLbm5CdXJM?=
 =?utf-8?B?enpBS2dONTJhRGNobmVaV1RSeWEvN3JOdHlKbmpUSlFxdEpDbVBjb2pPaDZU?=
 =?utf-8?B?amhNSzNMQUMzdkJ3alkzcTlMbWcvMUVaTXhyM0hFd01WYVI5Y3JWY0xUQzBv?=
 =?utf-8?B?cHh1aXZ3MHo0OWlWRC90Y2pOd0wydVRoVEcxQmFVUklyQkpLck1SS1RQdnVQ?=
 =?utf-8?B?SkY3VXQxbDJzakxTbDBzelMwRTlwWjI4cG83TFBVdVRieFMvR2hEZFZxRVll?=
 =?utf-8?B?cjVUa1kyL3VKYTJKOWVnejFnaldTdTFuQlF0U0c0UVdvODRMTFplcGdadUpp?=
 =?utf-8?B?SzR3eUs1cFo5ZUcrYlNOSEZqNW9ZSVUzUXc1V1N6cEtkR1hxQW5HUT09?=
X-Exchange-RoutingPolicyChecked: AfjK2RTidRPX9+IUlra1zyzNwXDlqAOOI9f7T75XhXtcRJptPd1wlXnaovVSChXloGz7KnKbnoO1/V44tFhsUQuC3Bdbh3vzi3g5Ps0opljrQh5jDTJc7MZK1g21yhpjYxU2HXnX1CDj2FvC8mWHusUeWE5uuzkAHy4bTyXa7mwJgr2TaBDK7b/BqimJQpRo8F7fnjT1qG1G6obD0lW64sOj7sUWSBy1/ZDkJqE0q3v/LtB7hPAGWHDX9Hcc6DoSVPvh9NNKB6DWAGOF6WbMXjUqhpZrOPUsTvDxL8rDnLtOKLXWEwjGIRxtuQGjvHf6WXu2s1WAFnAg9slihHLIqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c97c907-a0b9-4498-c7bd-08ded599853b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 04:47:27.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zo4nUwUN8ksrEFV6OTEkY1/byts9AtWzR24SKzCcND/2lWMXtoOTQzBhCw8yXOepcR32mesDS3x+u79dDQmsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4856
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

Hi Pranay,

Nit: Please make the subject and commit message more specific to avoid 
duplicate commit descriptions in the future.

Also please check if these tests also need to be updated in any platform 
blocklists before merging.

With these updates, patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 6/23/2026 6:19 PM, Pranay Samala wrote:
> Include additional chamelium tests
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> index d627ad414..070e878d3 100644
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -14,6 +14,15 @@ igt@kms_chamelium_color@ctm-negative
>   igt@kms_chamelium_color@ctm-red-to-blue
>   igt@kms_chamelium_color@degamma
>   igt@kms_chamelium_color@gamma
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d
> +igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4
> +igt@kms_chamelium_color_pipeline@plane-lut3d-green-only
>   igt@kms_chamelium_edid@dp-edid-read
>   igt@kms_chamelium_edid@dp-edid-resolution-list
>   igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
