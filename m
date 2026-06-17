Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45426CD98E4
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 11:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEF610EFB3;
	Wed, 17 Jun 2026 11:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OdaaRVhG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E8210EFB3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 11:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781694768; x=1813230768;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KR6nUTzze4yRU1ph/qc7MNfCKdY2NOkPvo5aJpI5ppc=;
 b=OdaaRVhG0pm3weOtfaS7a2o6YiUTJ+YsuE5wS9r0A8hfCl8rdPvLhYQn
 3yUAWBb16487SKigFHsXNm4i2MXviLD3lmg3aVDLVzM8n4yYsRlsEbRRz
 WZ72jhbuGLXBUtgTFLHG6Jwpf+V4WicZ+1ko1hywqHO03GG31LO5MlwGW
 9wu90oxrRT2rRuJ/yG9F4FGmYGFiet2dJkTicfvjJ4hvOmKzlQbN5ubyF
 vI+GrMyOrCAenq2fR+CXHTsoc4JPkYEcIRTEtFeVHfm8m71iK67losjdc
 WAwMHI+hBBYYiieSQ4SmzLZccDgF+e8hDtt9CKzTZ3o0mKtUSs5quV29b Q==;
X-CSE-ConnectionGUID: X49acT15TzGOgYHaYgTdfw==
X-CSE-MsgGUID: Qqar9iVNTk2PMzpV+57wsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92836094"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="92836094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:12:47 -0700
X-CSE-ConnectionGUID: VnwaLxQzQ9y0I4w+seQjXg==
X-CSE-MsgGUID: /wWXRrbDRFS1kz3MN8psog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="252340811"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:12:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 04:12:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 17 Jun 2026 04:12:45 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 17 Jun 2026 04:12:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujxR2iF/dDTlyagad8gqZz/yBHeAMx0MoR2Mm7U7eSu/M+0ydLSC5QMk/Lw9AWF8dZ1oLKKBLwBxbkilzVTzkaSASuDW1NSrU8D0AwWtG33EsWT2tDBl+2hbxxXz49E5uP6UgYJh3EpeWlVOWiyU4vhW6bzst7y3Mpbs3h4wL8sDMDHR15sE4ObsTmECqkuQai9mFWEA7ubRdSaL2ac+ybKhmHCQnFhAGR+yNZYy17EuL7e6cXoeys4IUfROrYFpg62MpNhYxVWj4rP9MFT5Hgrsq4x4p+x3WJ7/McJntRoibpapGJLiIUk1VWHwSELy8+k+w+9jYdd9AfnRGPhE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1R7G6bTZI0b7SmgBc+epe4ksIje6eUikHTUbB2opeA=;
 b=P8GhM1bVs79u8uVvIBqdRUeWgrtsDJ+SvBz/PQG/wdpk0H9f0mVMtdos5hgB0ZF6C5PRcpmUfDTV/LPSmBIURK8NZ68tRyD68g75bY5J7ghhF+7W++BElm9Dc1ZZkQpVSWutiuWjVd/e/UnRC86u0QLLuOmK4keZ1uU3E/Ik1nbcHXlJMr70wGnXqlmKhpuu+KfJqai2joXa6bm6NU6wAKh3udzN1yvz278hHkoSdr0N8U9VDF7N4/HKfndenIlHydLTQE+v+BIqx0CSJS6F50anIdf4YW94mc9TUnbe1k3bVRwmpS5j1imf2grlT4RKaR45HKFKdX3vR+jAAVa6iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DM4PR11MB8090.namprd11.prod.outlook.com (2603:10b6:8:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 11:12:43 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 11:12:43 +0000
Message-ID: <a1dc6e99-ec80-4537-91ec-00e7376f624b@intel.com>
Date: Wed, 17 Jun 2026 16:42:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/2] Revert "tests/kms_hdr: Move capability
 checks inside dynamic subtests"
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260611064213.1300403-1-pranay.samala@intel.com>
 <20260611064213.1300403-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260611064213.1300403-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0101.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::15) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DM4PR11MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a2a929-e3cc-4301-0f7f-08decc6159fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|4143699003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 2EYBJp5zqblHKtjoJxGk4dPMwehJNlNRSZbQF7mqrWtETXeqY93QnDjU8DrWHmKmMmecQimBBC+BoPjXWE+vmp79diR+s8tzu1qQfWii55pOABrepuM04A/hN4qh64XR5Za0uLkCQ5akTlh33yFqQF/CuTx/s+k0PInjuB2oG6IkTfAEQy8ao81R/W5iX4diHWBSMz+HMcUVCwNcLj3X2livkFzeRA34vgfiQl9rHctzrFlJ4AIIFMEJQWv0ry+TU7RWuaHFM+mXXiuV52sj9cHSVTyj8YHaVzcQw6aU2gc7813BFiXUG17p8XjL0/mANQtPpdE9P0YNNOteYkEKRFTlPe3Mb8i8Ruh2OIUCMv9cltenCBYz9fiajrRVGA2B19uusGuvL56hDVuvEQzw7x9YZtQnH2hFXXIv8UMbPSYT2AAnePQ2TcZ+Gghm/aC9SUp0JRdJS21PQD6suK8qjM/Moik2w09xtEBV68IIys91Gil8mq4MhmHDCL0LmIe78WiePY/zrSbbfBwQXqB1kgdgiSQOsyRdnSgO0szJvMtuWXzfPfz5U36MlRwl2vJZA8iTvB4xNEeays5B0oiZHyyP8RqDpFU+18on3vnZAxVK6/2YFLjBFYM/z7omxtRK7s+dYqCqiVMW+0iaF8OVuJFbki2i+2WGCC9a7Ny8EzRR5wKhO7uHGtFBJ4Nf14GF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(3023799007)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEYrUUU4ejN0dmdlQmc1OGNkSHM3dk4weHhyTjNaQnJoR0lHNGJRU3NhdTZ6?=
 =?utf-8?B?TFVjWENUandMTTlRTVBoNmtFU1J2SG5KbnhPWVROV2FMczFkNnFYVnZlQXM2?=
 =?utf-8?B?YU9jZ25IWDY3Vmc3aCtiNTkyTFVaL2drc2FsV2lQRmMveVB0b2xqRWdIUmg4?=
 =?utf-8?B?OWlTUFNBRy9tNWJ3UUtLWWdyeWpvSXp1Ry9HMzVEeTNsMElLU0FoZ2hZL24w?=
 =?utf-8?B?R25nd1kwWkd6UjRXUEVmWEovT20wYTB6TTNOeUVsTDZWWE1JVmNaR21BZUJ4?=
 =?utf-8?B?d2ExMEM2dHZsM1F6M1h6KzJrdlpTb2U2c2IrRG9vdzJaYm9IYjZWckpkZEUy?=
 =?utf-8?B?aU5FOElXcFl1UUdVZEZQRzhBZkZSRmNWRlVlNkdIZGw2NzBQQktJR2RpZlN0?=
 =?utf-8?B?anRmdHZuZWVKOWU5WXYxNHQvZFVqK3VXbGFhV0U5UDRIZzFWbU11OVV5WTEv?=
 =?utf-8?B?V1JCak40Ynd0TjJ1WUxWYWlMQzdUajI3Y2hkTXZ0OHppbS9uaWZDZTZwdVdI?=
 =?utf-8?B?WXcyOE5IdHVpbmMzby9vR2ZQWnpEOEJ0eWxoMkpCNUF1dzBMdWNiTCtJQ2RF?=
 =?utf-8?B?TnYwZ1h6QmZzd2ZmR2RVUjlzVHlQZFR1eCt1MXJEbXd4ZzRSK051SjRHUnlk?=
 =?utf-8?B?SE9MN0dTYVpxaW9FeEc4UlpHV1lXVHhCUElEekIwRUx1ZlRTSzcxeGpYN1lW?=
 =?utf-8?B?ZlNtcVBYZE8vQ3ZuYWloRVYrbEN3YnduS25yRUYwRzd3VCtUUVMxWStuaWVF?=
 =?utf-8?B?UnhkSUhHWi90VXA2ZmJTZk01NmlzV2R1K0FTZm1XNU8ySUlaYmtvZ1Fvb3Ey?=
 =?utf-8?B?KzBhTng4RGxPYVF4d3dzSGxIWVpBaTFQSUFaMmRxSjNRMGJLNzA3dGdlaGVq?=
 =?utf-8?B?d3Y3MENpY0pLa3o5NiszVGR5VUlTY1lneTlJYXA3U3JGL3l6R2Nkd0cyc283?=
 =?utf-8?B?Q1NqdVRGYU5FenE0TWZFWkZDYnNPU1pibjJqQ3c5c0xTckJvR01OSGhVdyti?=
 =?utf-8?B?UEtET2lqc2VsUkhNSmduWC81UGRhY0pyOG5mSDZQWVJDOXRDU3FkM3NtVEc1?=
 =?utf-8?B?d0Z4M0lNcXNnYmZrZEFQdzRFOHVUdzBGSTlrWGF4SHo2YnBFaWRMeFpaZWpE?=
 =?utf-8?B?QlNIeGczY1pmNkRJMFJGTUMxVjVuaENpYmxzVm1ycVdhN2Fma2E5RzlYR0hL?=
 =?utf-8?B?V1NNMko1bGtMaWw4a254eUp6S0diSmczQ1pnVjRLbEVSMVJEbE1HSFJ1S2Fr?=
 =?utf-8?B?MzcyUW1tcEVrY1JTMHkzZzVjdDZ0VTh2NjhEbTRabzh0RlJFcVRMTmJ5WkNu?=
 =?utf-8?B?MjdoZUhtVXpKdW5kRmpheHdFb2ptZHpPQWJOQUY4Nnk3VVdpYWh4KzU5d2p5?=
 =?utf-8?B?MEVyWks4ZDZac2doVWZUQUIyYzhyQjBFTFRFYXQyRG5CUXhqYjFURzAvN0Rs?=
 =?utf-8?B?LzhnN0JNdldkR0l5alA0UFpsM3I5TGxEKzdaWGFuUjQ4NDB4ZTVJZ1hLZDhP?=
 =?utf-8?B?cklMOUpaK1BrcHJtbzBBeTlERmtmQzNhWXhtc0tWL2d3Q29aZ1lBanMySkpr?=
 =?utf-8?B?R3VDQm1wd0gzTGx6M3lJNXpzb2lvK2RGeGZHN3h6ZDZhNy9qQVR2MmhjSVJP?=
 =?utf-8?B?ZDJ0eVJaaW1HZDJjWmhtbUdVSWJ0R0lxOGJITmp1dU83WkNFUTd5MkljeHNF?=
 =?utf-8?B?WjhGSm9uQVZHY20wWHZSOE1xcGQ0T0c0VXB6MjRSU0o3aHdGMTRzQmpEOHN2?=
 =?utf-8?B?OVhwZGNjb2NwSzVxRHVWalZLTUVFbWd4SHY1NFZ1RWRKRVBtVFFDM01Xajd4?=
 =?utf-8?B?T2o5aTJ2anpMbnBMNmZ1L0VRcE8rRXFEcGVvRHAvT1RRTGlmdjBadjNFY3Iw?=
 =?utf-8?B?dzNiR3RZcHlsKzZoTGx1QUlxeDlHTDA2UkoxQngwbWh0YnVQYzV5SXdFbDNz?=
 =?utf-8?B?REJnYXcvWXNTenFrMmVuYnk5NmM4M2JRM24vSWUvNllka21TcmhjYkhsWEVD?=
 =?utf-8?B?Y3hVRnE5TjlzQmJqbjl1TzFnd0EybzQydzFaMnhVNDZMNUROVFJ1QzMzK1hC?=
 =?utf-8?B?YlJzRmVWQklRUXUvMm9oTE5td2lNaHpnOWFiQzFLYlplQ2NGRll0VWJOUUlL?=
 =?utf-8?B?ZklaMVlPMlRoY2VRNnpEYW1BREhCZ29mNHlqdmlqN25OTS93Z1dDNGUwRWpl?=
 =?utf-8?B?YzIxTXFMeDJRcWFIRkJvY01UZlFpNkUwOC81OXNGbVVnamdYMFpkakhTNFd5?=
 =?utf-8?B?QVpQelVOSmwxZStrb1pPYjFmMzRqM1dnTFkzRVpRU3dxUFFxazAvNCtlUTVH?=
 =?utf-8?B?Q3ZGU0Y0MG9ucS9IMnNYQTh4a1ZkZGw0QTJPOGxKVXNWT3dMMzROUT09?=
X-Exchange-RoutingPolicyChecked: lh+xkAi5xlNUqv7fJyPHdrCoNsmj+kUOUSM13wZZwgdE2YYE5EeBvuM+bCq9HQpz4NpTUbHvVSJ+V+KBh/qPotTw3Cp5Ywt4mBChUH0eD/HwYdKmT6fZS1WZVlNqWJ5CxT3Ddj9leUcBggm17RgTe2ECJJFiawYGO+MbKKpqyV8P2nrx5fJvS0YjJ9j8YeRMr1ODIrnVBah32FJ52Z4LoO5hwCIR6caSCbFwDfhxFcQ0Co40zeEIIlJ3DUWKeB69w4zK2AZqI2gv1m+xYyarXSTa3qy+hOgpFfM7Msib3skAEcI+HS+umRsheKxUWpRoHo/T6ZLcNruxJ6Z8szResQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a2a929-e3cc-4301-0f7f-08decc6159fd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 11:12:42.9338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8u11OhCEbuoZiEJxVlEK11A7Pr3fUF/KWaTQyGvwMDUnMJPYNZw/jXuzSQtFkbnFTrWMdzLtV7AKzGVOiVMVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8090
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

Hi Pranay

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 11-06-2026 12:12 pm, Pranay Samala wrote:
> This reverts commit d9667a6fd6468adcdb5542d741ac423339a20556.
>
> The previous change moved output capability checks inside dynamic
> subtests to avoid losing valid results when a later output failed a
> check. However, the real issue is in the helper behavior rather
> than the kms_hdr test flow itself.
>
> Move the checks back outside the dynamic subtests and restore the
> previous behavior. The issue will instead be handled at the
> helper/API level by updating igt_get_output_max_bpc() to return
> status, allowing callers to handle read/parse failures explicitly
> without changing the existing kms_hdr control flow.
>
> v2:
> - Update commit message (Karthik)
>
> v3:
> - Add the missing changes merged recently (Swati)
>
> v5:
> - Ensure remaining formats tested that might succeed (Swati)
> - Update if condition for clarity (Swati)
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_hdr.c | 175 +++++++++++++++++++++++++++---------------------
>   1 file changed, 99 insertions(+), 76 deletions(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index affd38887..c334c907a 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -255,6 +255,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		if (!has_max_bpc(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output,
>   					    crtc);
> @@ -266,29 +277,24 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>   			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
>   				prepare_test(data, output, crtc);
>   
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
> +
>   				data->mode = igt_output_get_mode(output);
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
>   				igt_dynamic_f("pipe-%s-%s-%s",
>   					      igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> -
> +					      igt_format_str(hdr_test_formats[i]))
>   					test_bpc_switch_on_output(data, crtc, output,
>   								  hdr_test_formats[i], flags);
> -				}
>   
>   				test_fini(data);
>   			}
> @@ -530,6 +536,40 @@ static void test_hdr(data_t *data, uint32_t flags)
>   	for_each_connected_output(display, output) {
>   		igt_crtc_t *crtc;
>   
> +		/* To test HDR, 10 bpc is required, so we need to
> +		 * set MAX_BPC property to 10bpc prior to setting
> +		 * HDR metadata property. Therefore, checking.
> +		 */
> +		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
> +			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		/* For negative test, panel should be non-hdr. */
> +		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run negative test on HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (!(flags & TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
> +			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (igt_get_output_max_bpc(output) < 10) {
> +			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
> +			continue;
> +		}
> +
> +		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
> +			igt_info("%s: Can't run brightness test on non-internal panel.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
>   		for_each_crtc(display, crtc) {
>   			igt_output_set_crtc(output, crtc);
>   			if (!intel_pipe_output_combo_valid(display)) {
> @@ -545,73 +585,56 @@ static void test_hdr(data_t *data, uint32_t flags)
>   				data->w = data->mode->hdisplay;
>   				data->h = data->mode->vdisplay;
>   
> -				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
> -					      igt_format_str(hdr_test_formats[i])) {
> -					igt_require_f(has_max_bpc(output) &&
> -						      igt_output_supports_hdr(output),
> -						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
> -						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_INVALID_HDR)
> -						igt_require_f(!igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run negative test on "
> -							      "HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					if (!(flags & TEST_INVALID_HDR))
> -						igt_require_f(igt_is_panel_hdr(data->fd, output),
> -							      "%s: Can't run HDR tests on "
> -							      "non-HDR panel.\n",
> -							      igt_output_name(output));
> -
> -					igt_require_f(igt_get_output_max_bpc(output) >= 10,
> -						      "%s: Doesn't support 10 bpc.\n",
> -						      igt_output_name(output));
> -
> -					if (flags & TEST_BRIGHTNESS)
> -						igt_require_f(output_is_internal_panel(output),
> -							      "%s: Can't run brightness test on "
> -							      "non-internal panel.\n",
> -							      igt_output_name(output));
> -
> -					/* Signal HDR requirement via metadata.
> -					 * A framebuffer must be present for the driver to accept
> -					 * a metadata commit. Use TEST_ONLY so hardware state is
> -					 * unchanged.
> -					 */
> -					igt_create_fb(data->fd,
> -						      data->w, data->h,
> -						      hdr_test_formats[i],
> -						      DRM_FORMAT_MOD_LINEAR,
> -						      &data->afb);
> -					igt_plane_set_fb(data->primary, &data->afb);
> -					igt_plane_set_size(data->primary, data->w, data->h);
> -					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> -					igt_hdr_fill_st2084(&hdr);
> -					igt_hdr_set_metadata(data->output, &hdr);
> -					igt_require_f(!igt_display_try_commit_atomic(display,
> -										     DRM_MODE_ATOMIC_TEST_ONLY |
> -										     DRM_MODE_ATOMIC_ALLOW_MODESET,
> -										     NULL),
> -						      "%s: Couldn't set HDR metadata\n",
> -						      igt_output_name(output));
> -
> -					/* Reset IGT display state; hardware was not changed. */
> +				/* Signal HDR requirement via metadata.
> +				 * A framebuffer must be present for the driver to accept
> +				 * a metadata commit. Use TEST_ONLY so hardware state is
> +				 * unchanged.
> +				 */
> +				igt_create_fb(data->fd,
> +					      data->w, data->h,
> +					      hdr_test_formats[i],
> +					      DRM_FORMAT_MOD_LINEAR,
> +					      &data->afb);
> +				igt_plane_set_fb(data->primary, &data->afb);
> +				igt_plane_set_size(data->primary, data->w, data->h);
> +				igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
> +				igt_hdr_fill_st2084(&hdr);
> +				igt_hdr_set_metadata(data->output, &hdr);
> +				if (igt_display_try_commit_atomic(display,
> +								  DRM_MODE_ATOMIC_TEST_ONLY |
> +								  DRM_MODE_ATOMIC_ALLOW_MODESET,
> +								  NULL)) {
> +					igt_info("%s: Couldn't set HDR metadata\n",
> +						 igt_output_name(output));
>   					igt_hdr_set_metadata(data->output, NULL);
>   					igt_plane_set_fb(data->primary, NULL);
>   					igt_remove_fb(data->fd, &data->afb);
> +					test_fini(data);
> +					continue;
> +				}
> +
> +				/* Reset IGT display state; hardware was not changed. */
> +				igt_hdr_set_metadata(data->output, NULL);
> +				igt_plane_set_fb(data->primary, NULL);
> +				igt_remove_fb(data->fd, &data->afb);
>   
> -					igt_require_f(!is_intel_device(data->fd) ||
> -						      igt_max_bpc_constraint(display, crtc, output, 10),
> -						      "%s: No suitable mode found to use 10 bpc.\n",
> -						      igt_output_name(output));
> +				if (is_intel_device(data->fd) &&
> +				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
> +					igt_info("%s: No suitable mode found to use 10 bpc.\n",
> +						 igt_output_name(output));
> +
> +					test_fini(data);
> +					break;
> +				}
>   
> -					if (igt_is_dsc_enabled(data->fd, output->name))
> -						flags |= TEST_NEEDS_DSC;
> -					else
> -						flags &= ~TEST_NEEDS_DSC;
> +				if (igt_is_dsc_enabled(data->fd, output->name))
> +					flags |= TEST_NEEDS_DSC;
> +				else
> +					flags &= ~TEST_NEEDS_DSC;
>   
> +				igt_dynamic_f("pipe-%s-%s-%s",
> +					      igt_crtc_name(crtc), output->name,
> +					      igt_format_str(hdr_test_formats[i])) {
>   					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
>   						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   						test_static_toggle(data,
