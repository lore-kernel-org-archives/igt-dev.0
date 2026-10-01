Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13A1CA5FA5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 04:33:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABDE10E058;
	Thu,  1 Oct 2026 04:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zkpv24WZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC8310E058
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 04:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790829146; x=1822365146;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jm2mKZjhQgJ/gem99qAMJBHqvhcH/u8td3mEBa2NUgY=;
 b=Zkpv24WZ8pdXVo0Xs2ZwZ6jSzG6vDdC45ohc53K+egb51MuCc4gAqS3L
 ehVVRydgJGJP+ZDQmDMlncGTAnSQnK6KkASOZx1BJsmhWsyuLC7Id6jTv
 xPJOKF59XMKlf4IXNlYns5iUVJzJSWFvuMqAZW0KW7oDCEDOwdqBbsvJf
 62BwJc6IaTsQ2h4m9wfmWUjVgF5yXYWE2D7jz1R28CqBMep3R3NWZbV/J
 BQ02fisPQst90OjsfFvk6T/o0i8Z1DuF/SvogB0LO5qdV5VyTSn2nBMoB
 G0onoohldqThC/6ojoGMpNT6BWzcbl8QDEvNAkkwXaNk49l2gQeAmKHUz A==;
X-CSE-ConnectionGUID: g3xBycf3RXuDfxpoRE4vaQ==
X-CSE-MsgGUID: 2zASVBr7Ta+vTcynC2R9Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90711764"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="90711764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 21:32:25 -0700
X-CSE-ConnectionGUID: CsS1jKZ3SGW6kNlJspvHgw==
X-CSE-MsgGUID: vKe/b1ixQ7iSS+HwxopYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="274507963"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 21:32:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 21:32:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 21:32:24 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.39)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 21:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBQLm/t1+jOFSUbSW6DPkvzyYsPppDZQBRbDa0GgroaaCoKPQeO+/6u0Joa17z6ik2/paG7pI9CIYkKE5T4/fXdKGq7vh0QljIYWi15niI4NYQyYxA9XYvVLBoIDfQtgPm2X5t34HcdW9g+4yrmMfJ/IGWViZoW1D7zvr1eau4E7FBfVYmspa+BIaXR5kpzGEsB77JUcUvqQFKalrj9B2t7w+VoC4tbPIwb2tF5G3LyySOhccADcc+qaWS9OpDmbWB6rhO6HhchhjbXcgn26sOmFUoFGMdnzKMunQA/Rb3cvKnmIhLK0IFdiR8rpl1YVvEaMlRW5r2gVZjPpypfwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URjJR8ZgIoJNPIHVHicom27xXOzb04IBSeAzoHfPhuo=;
 b=ay/fMDeUlaHREmE+FW0FFBPJxEVkhvhh7A1C/Vscs5YySoYPxSyJI2S4nIYi8qioJVBnl/PGu5LFlsiK5iK3ZcoFZRtoeBKOXA2ZcITOpSykWHJjROUFbgXbULqU0IgMpBADCMacHLs/Fo5Upr8EkhzRma/d24eQ9gpDCI7lQ9Mil/CiGDrC3SyWapvBIuFUS+fQ5aCi/C0F9gbb5+/jDp4jfnZJSm6VVxPlmqCmZePHCWScJ4ohqGbPmDzVJ+p0HE2qIi4qMKOhadj1uf4HRR4k6WLBm6NwQWja92w/6JM+0gfQIxZWg9XOiPJ0RYvWMsIZiLiV5XhMVMWOyHNYuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8)
 by SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Thu, 1 Oct
 2026 04:32:16 +0000
Received: from SA1PR11MB5803.namprd11.prod.outlook.com
 ([fe80::ddb:eca0:d411:c638]) by SA1PR11MB5803.namprd11.prod.outlook.com
 ([fe80::ddb:eca0:d411:c638%5]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 04:32:16 +0000
Message-ID: <bcc06ad3-1470-4e5f-ba7e-d84495502b48@intel.com>
Date: Thu, 1 Oct 2026 10:02:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/intel/xe_ras: Add test for GPU health
 indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260915133234.2105121-2-soham.purkait@intel.com>
 <d8bf0a2d-c814-4642-a232-b39bdf9b9b8a@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <d8bf0a2d-c814-4642-a232-b39bdf9b9b8a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::12) To SA1PR11MB5803.namprd11.prod.outlook.com
 (2603:10b6:806:23e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5803:EE_|SJ2PR11MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: a0950ef2-d9cd-4cd2-e039-08df1f74f818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|11063799006|6133799003|10067099003|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: TwoDOwy3yHxmiE62Eq8KBxwIhFA1qXPT7UyVlLWqgQb59yFk2bCBziYqeuf8KFdSEIKQ9Nan7d5F9LiSzEw9bpGaKY0e87nqcME4s0uyDRMZk7Xc1kgjsYHExbMc2g4metm2QMiKI6JOsQCLaBmWOAnJQncn90HBuGxnNrOgTZKWeydAUn/OycoesGt3Zt41OdeIszYVEC5eEwMU3UWJXhpi62FJfNYa8MQxQj7YEunu8YAErO57xQ7IqCXREt1FU8CdhvmcPzxLRT4iEplVqaQRI9RL6V+3XkBiiS0+1bAaB2BxqL7iov/2ZrsoD3PkS+Rllgp0MEtGCDoLme2r/B1WQzxodkD5sGEcrsF6DMR+Rjcs5DEfT0nkc0vmTRy/+Uv9PraEBc2ogakn++AW0iYt1ydbsts3uurdmgFN6aq/fwCEga5DJMM7XosTuy+in7briZIemRPqGb0V/dYzT8sZ5MqGB4z1Y38HBc5mTy01lGkCC3EYCgg9qfN1F/ovI8BBOlcHAaFWG89Z8IvAc6waKb+/sTX3R/jK8HO3DgNMgD+yb3KO3itRihpHbyuwovr9/7cSnav3oM7OQQEJxz8Pe+z6gIV6QVnyLyZ5jxDSNJY3WX0mYlt0Zke8PtBI6V3S/wgjvl7XHytL/iBb7cw7dNHeZnO/uh34Qs4hkNQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5803.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(6133799003)(10067099003)(4143699003)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eitzZWU5dEFDMkxZYnp4NlJRYUFOblhJNmY5K0xpeTl1azhyL2QvUkE3ZS9v?=
 =?utf-8?B?TW10OG93MXVYUnpDZEgyaEk0dUhwUzdqZE1yTFdKbFF1ZWVnZ21HYWRyZjE1?=
 =?utf-8?B?UGZCM0h6UG1DSnU2ZjBQU1lFM3dXa2pOZmRYclh2UnpuUTBpRDlvYWZkakFi?=
 =?utf-8?B?VTFQNEwrd2MzRWlKbzFJVGNndFNWcG1jRmhtNEpIU1dZQUw0NGdFVkNpalA0?=
 =?utf-8?B?OVJZaTNaR0VsdVFkN0NQQnh2TFhEUVVMcTJtbTFNNU1lWGcxQmRYL3R0RlEr?=
 =?utf-8?B?cnBTbGVjMi9XcGVXTklKZ24zUFhaZU1Ga1h1eXlHcUxxb0RzU2VtNUxGUC8v?=
 =?utf-8?B?UDVURlF3VXNpVnVIZ1J3eCsreUNWUVFENkl4eERWRnNtVFZHZ2dDRExaZGF4?=
 =?utf-8?B?enNGcVIrVkZjVXI2SFdKeGZsOVRhOHFCNE1qVGFpdml3WEs2d3YveFYxMmxs?=
 =?utf-8?B?dURPNUtYdmtSRWFickhUNFE0L2pQandHTUJLbkZkb0o4d3kxdXJxMVBFYTNU?=
 =?utf-8?B?bFl3ejY3amcvNDg3eWd2bzJxMjg5WVJzWUJLOHBOVDc2QWdyNEtON2U2c2Ju?=
 =?utf-8?B?WEJES01FWmE4b0FjMUZpMmtQZmNQY204c1J3NWxvQUZQTVRzTFdNRll2RkRm?=
 =?utf-8?B?Qlpkc1hoUHNKdlVrdmo0VThkOVc4ZVI1YlJLOWtFaFoxbUdJenFsVEhUSlhq?=
 =?utf-8?B?cTJTM3NyaXdIZE02eWdOaW03STQ0Ty9GTWpPTVNEc1pxcXYvWnVjbjAxdWNZ?=
 =?utf-8?B?WU5oWGpQTG5EY3ZudXBaQkd2S1NFd1B1SjAvc0V6NEMyOHg0QTlVbHZaSmFH?=
 =?utf-8?B?dDlYdGsrTjUrTGhwSm1LdzRVQUtQZGhhTzgyZWZaTFZIK0VTZ1R3cEVRcUt0?=
 =?utf-8?B?UlpacExOOVRVWVR2WnpSUDZCdldETThRL2hoNnM1ZUZDd0hNVG80Tm54MDB6?=
 =?utf-8?B?bUwzaHcxZ0pJNUJsZ3dJNHZLak1XMGc4bXROV0JMZGV3aFM1eXhHQ1VGN2FP?=
 =?utf-8?B?TnRrUmFOemVPMXJWNkFMS1hWTDBJVVRTd0UrUUFDN1JPSEVxN1ZaUVBGaGUx?=
 =?utf-8?B?RlptdWdBVHEzUGQzbkJwRFJxRzBkNzdoT1IrZmZzYkxsM3Z2UUtRTjhnRTQ0?=
 =?utf-8?B?cGx3MUxTVWN2Q0lrZ0hxR3VtSUMvY2ZBSm5RUjJnZmtoeVJubS9sRFJCekxT?=
 =?utf-8?B?SFpNVFA5RTBTK1lJY01FREREVXJyUW56Z0N3WlBXenpCNnFoSlVJVk5HZmhv?=
 =?utf-8?B?bEhZejZraGdJZTZzZXMwWnlOQkZUbXJtd1ZLRFpHNlMxbUZldXUybjR3QVRL?=
 =?utf-8?B?Qm5XNXBhUGtVdWZkTHhIQXUyU3ZyY3I1RDhxV1VKbE9Xa0VoTVNNb0ptVzJN?=
 =?utf-8?B?WGJ3S3c3NVhmb0pFSXJEY215YnlZQzJoOEVjNHZKbVdySVl4NDBsM0I3VVAr?=
 =?utf-8?B?bTJqanlzdU1qL2JGbkUxMXRvRkFuejl4R2tQTHF0aXpWTCtoekYvekNmTm40?=
 =?utf-8?B?ZEZpOU1iU1ZlV2wzblhIRnFEcVRLRnVnUm9nVUZDSXdNMGFZK2hYVkxxVzFt?=
 =?utf-8?B?YUxBVzJyTFVUTHg4VWY3aHRLWmVNaGJQRUwvalIvSGI5YkgrYk10NkRIaS8w?=
 =?utf-8?B?bVJuYUhOTzNpOXkrRTRUWXdXTXFobHh5ZUxWeEUwTDNOMlBWZDRQa0lRd0Zy?=
 =?utf-8?B?eHRxdmFnVWRhM1Y0OGlVUnRyQ1Y5TTRMTnNtTzR6OFJreHB6bXNxaTE0ZUJZ?=
 =?utf-8?B?b3NSbFo3WUVBazY5Ni8xZzk1WjV0d2l5UzcrakZxSU1MVG1Zc2ZPOVREaVZt?=
 =?utf-8?B?dkxXUHBhTnpFNVhyenkxZ3paZEtTamdmcm44M0k2YlpjYWxGZVpJMytQNFMy?=
 =?utf-8?B?cmVhbU9ONk5aNi9pVEExdERpenRDc2JDcG1qQ0JtVW5Pc1lTM1h6eEhVNDl5?=
 =?utf-8?B?VEhubUVGY2lOckZkUjhEc0VRWmdwU3YrdXFXOTZIMDVxL1dxNGNDUUE3T1pF?=
 =?utf-8?B?Rjd3L1JtUlJnaXdMSnV0RGRQUTJPZE1YMmlrcEp6enRWbVRTWnBGTWxSRnhN?=
 =?utf-8?B?VjJuemk4amo1Uyt0OU5aZmZtcHAwRFMwWTlNVFRTakwraWlwejA3bGVFZGkw?=
 =?utf-8?B?dlVsVTdYTk50am5wZ0s2VlpEQ2VZVmc2ZlhXWnBwWXNUMkdIRGVQYWR4N2lw?=
 =?utf-8?B?ZjF0M09FT2o3bmk3R0lpd21VSk5sY0dWbjNqVE1EMUM5WmhGcnFsUWFOZGtG?=
 =?utf-8?B?Wi9RVFAyZzlYUFNsSGRRQ2p5YUxubEc5WXAxQk9VWEtKekdoRFNMRzFseHZE?=
 =?utf-8?B?QlJXb0RjTDdFZm1ENjFmcU9SbTZqVFpjcTFpQndmbjRJNVBtWm5yR1MrbFc1?=
 =?utf-8?Q?Ocll9GgT2n1jjQDU=3D?=
X-Exchange-RoutingPolicyChecked: PT9BbqG0i0A1l3J9mmeqkCX4bEz2wP/uTZDWmlgqoQKDzaxVqznuwazNnoeNpW5Yd0pm5x6qxOpQR1CKPp0QJFVQfj8hjTKfgnfMjAGWH7WkLrtUUQ5EifCbacxUuNBu23p9kBqILWFXoL5Dw/tJWcR4QM7hUlEMysKlIwaEgY79ykNqjlJmf0ELgYhoMZbXKsZRaU6IBhbXioRm1R/cpg6HHzCIK/0fCzotQublli/x2MJz24M11bYzjGFKo/S4yMxCtVZGKuSfB3nYbo2q4vQ1fBUX18NdBH8EB78crwX0kqEPkGisK21X3g1ubIcNrQg5AbGOUZmjOdt+UUIVyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0950ef2-d9cd-4cd2-e039-08df1f74f818
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5803.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 04:32:15.3348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDrwcwg1Yb3/eFY9F0ZPgX78R0GSFimd817qdQpFlGK8hOfO/Jm2z6BDSOMwHNb0e5p2u3sk1R0h6wC0Soyn8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8424
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


On 30-09-2026 10:21, Tauro, Riana wrote:
>
> On 15-09-2026 19:02, Soham Purkait wrote:
>> Add a new Xe RAS test exercising the gpu_health sysfs attribute
>> exposed by the Xe driver on platforms that provide the system
>> controller. The attribute reports and allows updating the GPU
>> health state.
>>
>> The gpu-health subtest validates each valid state by writing it
>> and reading the value back, and checks that invalid writes are
>> rejected with -EINVAL, guarding against regressions in the
>> implementation.
>>
>> v1:
>>   - Add platform-conditional skip and exit handler. (Anirban)
>>
>> v2:
>>   - Add dynamic subtests for each case. (Riana)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_ras.c | 146 +++++++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build    |   1 +
>>   2 files changed, 147 insertions(+)
>>   create mode 100644 tests/intel/xe_ras.c
>>
>> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
>> new file mode 100644
>> index 000000000..91233e72f
>> --- /dev/null
>> +++ b/tests/intel/xe_ras.c
>> @@ -0,0 +1,146 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <errno.h>
>> +#include <string.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "igt_sysfs.h"
>> +
>> +/**
>> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) 
>> functionality
>> + * Category: Core
>> + * Mega feature: RAS
>> + * Sub-category: RAS tests
>> + * Functionality: ras
>> + * Test category: Functional tests
>> + *
>> + * SUBTEST: gpu-health
>> + * Description: Verify the gpu_health sysfs attribute accepts each 
>> valid
>> + *        state (ok/warning/critical) and rejects invalid writes
>> + *        with -EINVAL.
> Provide a brief description. Don't we need description for each subtest.
>
> ++Karthik for Category check
>
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
>> +
>> +#define GPU_HEALTH_ATTR    "device/gpu_health"
>> +
>> +static const char * const gpu_health_states[] = {
>> +    "ok",
>> +    "warning",
>> +    "critical",
>> +    "bogus",
> invalid?
>> +};
>> +
>> +#define GPU_HEALTH_VALID_STATE_COUNT (ARRAY_SIZE(gpu_health_states) 
>> - 1)
>> +
>> +static struct {
>> +    int sys_fd;
>> +    char *orig_health;
>> +} gpu_health_ctx = { .sys_fd = -1 };
>> +
>> +static void restore_gpu_health(int sig)
>> +{
>> +    if (gpu_health_ctx.sys_fd < 0)
>> +        return;
>> +
>> +    if (gpu_health_ctx.orig_health)
>> +        igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, 
>> gpu_health_ctx.orig_health);
>> +    close(gpu_health_ctx.sys_fd);
>> +    gpu_health_ctx.sys_fd = -1;
>> +    if (sig)
>> +        return;
> Why?

Is free() or igt_info() safe to call when fatal signal is being invoked?
Seems like these are not async-signal-safe.

Thanks,
Soham
>> +    igt_info("Restored initial gpu_health to '%s'\n", 
>> gpu_health_ctx.orig_health);
>> +    free(gpu_health_ctx.orig_health);
>> +    gpu_health_ctx.orig_health = NULL;
>> +}
>> +
>> +static bool valid_gpu_health(const char *s)
>> +{
>> +    int i;
>> +
>> +    if (!s)
>> +        return false;
>> +
>> +    for (i = 0; i < GPU_HEALTH_VALID_STATE_COUNT; i++)
>> +        if (!strcmp(s, gpu_health_states[i]))
>> +            return true;
>> +
>> +    return false;
>> +}
>> +
>> +static void setup_gpu_health(int xe)
>> +{
>> +    gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
>> +    igt_assert(gpu_health_ctx.sys_fd >= 0);
>> +
>> +    igt_skip_on_f(!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, 
>> GPU_HEALTH_ATTR),
>> +              "gpu_health sysfs attribute not exposed by driver\n");
>> +
>> +    gpu_health_ctx.orig_health = 
>> igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +    igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
>> +             "Unexpected initial gpu_health value: '%s'\n",
>> +             gpu_health_ctx.orig_health);
>> +    igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
>> +}
>> +
>> +static void test_gpu_health_state(const char *state)
>> +{
>> +    char *health;
>> +    int ret;
>> +
>> +    if (!valid_gpu_health(state)) {
>> +        ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR,
>> +                      state, strlen(state));
>> +        igt_assert_f(ret == -EINVAL,
>> +                 "Write of invalid value to %s returned %d, expected 
>> -EINVAL\n",
>> +                 GPU_HEALTH_ATTR, ret);
>> +        return;
>> +    }
>> +
>> +    igt_info("Setting gpu_health to '%s'\n", state);
>> +
>> +    igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, 
>> GPU_HEALTH_ATTR, state),
>> +             "Failed to write '%s' to %s\n",
>> +             state, GPU_HEALTH_ATTR);
>> +
>> +    health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
>> +    igt_assert(health);
>> +    igt_assert_f(!strcmp(health, state),
>> +             "gpu_health readback mismatch: wrote '%s', read '%s'\n",
>> +             state, health);
>> +    igt_info("Verified gpu_health state readback for '%s' 
>> successfully\n",
>> +         state);
>> +    free(health);
>> +}
>> +
>> +int igt_main()
>> +{
>> +    int xe;
>> +    int state;
>> +
>> +    igt_fixture() {
>> +        xe = drm_open_driver(DRIVER_XE);
>> +        igt_install_exit_handler(restore_gpu_health);
> This should be inside igt_subtest
>> +    }
>> +
>> +    igt_subtest_with_dynamic("gpu-health") {
>> +        setup_gpu_health(xe);
>> +
>> +        for (state = 0; state < ARRAY_SIZE(gpu_health_states); 
>> state++) {
>> +            igt_dynamic_f("%s",
>> + valid_gpu_health(gpu_health_states[state]) ?
>> +                      gpu_health_states[state] : "invalid-input") {
>
> Why do we need valid check here?. This is anyway done in test_gpu_health
>
> Thanks
> Riana
>
>> + test_gpu_health_state(gpu_health_states[state]);
>> +            }
>> +        }
>> +
>> +        restore_gpu_health(0);
>> +    }
>> +
>> +    igt_fixture()
>> +        drm_close_driver(xe);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 1ac89bab7..3c2d4fdda 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -333,6 +333,7 @@ intel_xe_progs = [
>>       'xe_prime_self_import',
>>       'xe_pxp',
>>       'xe_query',
>> +    'xe_ras',
>>       'xe_render_copy',
>>       'xe_vm',
>>       'xe_userptr_pressure',
