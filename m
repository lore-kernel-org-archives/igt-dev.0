Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AEFCD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F2E10E4E5;
	Thu, 21 May 2026 14:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PW6uRzgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75E210E4CD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779372691; x=1810908691;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PohR5XG9JVFe9Vugo7/AXtiDww0BuKkn6hy/CMNdFHk=;
 b=PW6uRzgw9d8iv7uH3tv1inEcSbtWM3poL/w6JlQwD8mqSV5i++ztAgKa
 va1lJ7zLdMZfVZwHZJwc6b70N6PNvzycJnnQhIeOt6GdUthxQOA0+95+Y
 E+9eF11yEJSdLust/CWyTw/0oL6snfYos/d6EXC7CxtABYjnJNJo3e35N
 iKxW+xLNIHPLoDlPeVf3xNYCX0UiUug40QaU1b1fIa24Jfxt8M/EfQ48l
 xVTG/71TRgp8VIyzm7QqGv740H9VJChvoqJYAr1GD9gzQPWiocwgJMq9F
 NzxTNOafToXHCaSu+Syzhmb08DkG2mCRvK5lsiyIacYDLzPGXUHAB4cMk g==;
X-CSE-ConnectionGUID: f1tMsDXmTRe8+9USYhwoig==
X-CSE-MsgGUID: 3p/qxjXxT8u5NLwlNIPpwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91398888"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="91398888"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:11:27 -0700
X-CSE-ConnectionGUID: PWXuNok5SCqDkQ8lJhxL3w==
X-CSE-MsgGUID: 1W04nhTrQhyULVmjCZkqdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="237511006"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:11:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:11:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 07:11:27 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 07:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bvun/O5xvyf0ahAYNiNI+QBjpzn/rQfrWjUe9hvnuxyvvgNvhlIfZvWBXarB6cI3bXk0YmsWeMozKaFtH4AFNgZeacqlRe8yQpvwzYnxl53PO/9s1q3S/H0ADs08EH1PjhCWH7X9037HEwQGjJahli5aT/6lomC2WJetbRxw7ZZO/xq82H+iRS0Qes9ga3QZ4cl6F/rXaP6dXhMQkkQYMMHyChx/Jc19pNOObe61WtH9A9CPGRpC49UVZukGzDczErUbe29IHJhDHWDXkLjFthu1sxhN9HKhbwWrB9XF/04NLaU+rt3Hc25Ffr6rN+vLMhcduV3nyzne9eZildcvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq9uhEnlIgAJNkvh06QtUffWpaR+tWNhLXukOQe4LXQ=;
 b=nyY9YWiqSxulSTDOuSNvCmqIaqYwd1RvmyfvpDJ7hUEqpzraTClXFCteYx6+UR6BBKZ9zKdst2tFB6+dFO/th4xOvScEprxDtw1qGZ8lkjTTG2x1FmDEwoGl09yweW7bLc7/ylRC0moK7d3BomP6dcDXSmvWLIbRdO3Sj+QBkPyHVNqblqhPKPkps5Z0Mrmq5oq61IGwfELb9leKboLb3CdpeQD+lLTd8J1E7BR2lPhHzgbWzXLVp1qPHxQX2GaBeCpnY5mS090kmPnU6gfVYWxdfUomo/S/5a06mAzCGtDTZsQWOkTml7fXPzlfylvLBeIyXQN24zsX39phYZzwPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Thu, 21 May
 2026 14:10:54 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 14:10:53 +0000
Date: Thu, 21 May 2026 16:10:46 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH i-g-t, v2] tests/intel/xe_exec_system_allocator: Test
 madvise(MADV_DONTNEED)
Message-ID: <ag8SZjYT8V1TFflF@fdugast-desk>
References: <20260521101938.139350-1-francois.dugast@intel.com>
 <kdtzxwzkca5sosldw6sktjprcmprkkqhdrk64pwmek77g5f6xx@vitujne2grzq>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kdtzxwzkca5sosldw6sktjprcmprkkqhdrk64pwmek77g5f6xx@vitujne2grzq>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR05CA0017.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::22) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN2PR11MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 939d9f9e-0c44-4585-3352-08deb742c51a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|4143699003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3vayHw32KpyHKW63lmZ4XlVren68ItbbnsCnFccS/QbUfYoHB/pvGY72rE9+2CkfKEDfxtCEIwle+9yM3hyMQfpLQkiYeCpCbEjdbvqmchExBOPVbD01qd3pvCZXJPRb+7xFhtRdeaJq3+A0e+a1JdfCKDgo3kcZS7+IdXdPNG2KQ02lg9WvyD9h+vl+LDh6crspnMo/c6nhMcFdsofvdPZcu3QyFVX9zWCKqRQhVN9Sv6iibdoTAwgIKlBtXgCuxxV+5bFUMSvrQ7l6EW/yzpfg/qxS4Vl3lWhYtT4u7hwOnD8yCkYUsyTazSQJX1Gg0eqLLPbyTqQHW508L6GXPVttl+hHOzhvZc3Z1T6guxNW9kFmrsg/YnZkuVFuyet6cB0aSYG2xEGFZKbIfRGlrRxE3yLiQeNiPLV1WEGShc2cok2f7LhEJUkGXvMcV34fjB6EKKoepcbriIwltUDSVJ8Z1JTHoQ4lKMYzAYWDyi76Zq6Ht57Pe6hfa3bCjnpg/+D8Ve9jR4mo47NQBiVZDHYdX4H8gZ+kO4IEsRNhXcRJgPIW6xnUXIR+rX9o/kDSTtlz4yv/+k7dGKiYbsTpANFh4SdkAvWZppXT/dpzvLXL4cQ58ZP919o+51Gs80HjZ+tsltTmy+jk4LSmqk2nzGftk1khOrWzi6oZiDgc4ttteAc6AF2mqlTjtGYTy3iy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4143699003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWtjUEtEc3dDVkQ0eXFFbHFHcmVVdVhzOEFCSm1JRWhaY1JXTEFibjFqWlR6?=
 =?utf-8?B?TVZGRHlWSmVMdzJHN1hSV0htVGc0Z3o2cWhRU1pVblBUZ1lvK2swdEs5ZTlO?=
 =?utf-8?B?K3BrbElCOG4vQWxTOXVFRkxwSVR6WERJNG16RG8vaWVSWTR5UXE2TEM5Ti9J?=
 =?utf-8?B?b2pSOU9FeUxMS0c5amlpaUNPMmFad1pBVXQ1bld3NEw3SkRhREU2dktLQXFR?=
 =?utf-8?B?TEc1Ni9kL3d0TDl2VmdqTWRBK1lhQlFtdHVIallUMmx3OWhwWWplQ2NpYVlL?=
 =?utf-8?B?RThOK2ZrUHpLSmNmYmw1b2M5UmY0RHNJdHlsSUNPSXR5a2Z5WWZ0bUJkcWR0?=
 =?utf-8?B?eUFMcURhZnBweWxScy85SWZjVHN1b2txL2kyOGhEOVU3ZWVUWmczSFo2WGVn?=
 =?utf-8?B?RmhqdDE3c29pblkwOXVXU0I1UjVjRGtKZFhFbDJTKzRFNDhJK2hNaTVqVE03?=
 =?utf-8?B?YzhDdUpnczJXU1JGMEI1S2J0YmxUWkpjeGREczR0WjM4WWppNncrRm02UEZB?=
 =?utf-8?B?RFU4VThoc3laNDIrQk1vdTdLWUVINmsvVHdMRHV0K3ZIR3VsZWg4NFJORTUy?=
 =?utf-8?B?T2dIK0pNUHN5U1lsWUM2clRlRGFXUENlWVViaSt0WnZHcUlNM3kvNEVXWE5l?=
 =?utf-8?B?M2w0a1BUVnRwTjc0dGthS1dwYkVWckRKekl3eERseVl6UmJ6MEhaaVorSy9i?=
 =?utf-8?B?bFpZcnMwM1hRbzFhdGdhMmFyeWZwNFBmakNCRVl3bWowWjJyYWRCekxheGlC?=
 =?utf-8?B?akJ6a3N5TjYveUxpeFhza25uODAxNG03ZHAyVkNTVURjNTRaVUR2NjY4Z1d0?=
 =?utf-8?B?ZjRjZVBpVCtWV0VNa0VNdy9LSnVXZVNhUllGN2tsZEswQXhtdjFyV0IvLzc1?=
 =?utf-8?B?WHRJcUV3SWpmS0QrK09GVzlORTVBMGxJRTJJR0h4Qk13aUp0VWsxMTYyK1Ru?=
 =?utf-8?B?K1A1VGRBbXRXdzJhTWVoMElYTXowdUdMUVJsdis5c2laQ29sSHhuSi9FZ3FY?=
 =?utf-8?B?T2RnRkIzQ0NFaG10WWxTNGJXdlJMcmtvWFdSNm9pb1pVL2E1WU12d2NLcnMr?=
 =?utf-8?B?ejVxdHFxbnUwUkFSNm5LdzdZQzBHemlrQ3l6ZktnNWVyVUpYWFZiOVl4TC9O?=
 =?utf-8?B?UmxqNW1WcXlvcEx1NG1tcXNZT3ZiVS9rN1dtK09MclBObkgzeEx4bVpOUWtC?=
 =?utf-8?B?L1cxU2NjN3lTU25ZUUFvVnRMMGtwQ3RXUkFRQzNFZThoa1lraXR2L2YvMVds?=
 =?utf-8?B?TUxMbXlRQjNSSVJ2bjI2bFdQdzdGQjdrVnNyS2dLWVZtZ2pGOE4rL2I0SnM2?=
 =?utf-8?B?VGxyVlgwLzdJZzN0QzFtdVBwVjA3NnhodW1XbEN2WFoxd2lYL1JJem53Zi9U?=
 =?utf-8?B?MTdObmZJOThYS1hSVmx5YTBycm5Wek1OSnEwckJHVFU1TFhGYTNoOGNOVjJ0?=
 =?utf-8?B?dFZ2L3ROZnRrUlMxQWNEaEhzZkNTL0sxOWk3ZWIyVVhnVlhPNVl4akQxaXdR?=
 =?utf-8?B?UWRGYjJGNUgvY3Z5Qk00d0d4ZENLOWRaSzBsc1BQL2NDWUh4NjIwSlZWNlpp?=
 =?utf-8?B?OFBqcnFnd1ROUG1OazFuWUhEdDg3WUZidjU1aFpkaGc5M1FoMk80OXNLb29u?=
 =?utf-8?B?S25xa3VacFhJeTRsZTVoNUxQUnNsNlB3TW90czdpUlZnMHdMd3ZEOHdCQlk0?=
 =?utf-8?B?WElLdTlQQ05wZmlWRG9HQ1czczdYWW5SZWFGUHVkOHBhUU5iWkp4WGt0ZHpZ?=
 =?utf-8?B?UURKQmJ2anQwNHFjR2tEWElJamN1VE9lVmlzZHhHbVFNNHljNThPcW51OEwz?=
 =?utf-8?B?WHI4WjBDKy9LYm5xRmNwS1pvYVNWc0VQQXpyQlBjd21YUWMyT1VDMWFsM0pP?=
 =?utf-8?B?Vm1iOGNZYXR0ajJUZ1Y1UzJadEY2cGN0ekIxK3NtTzljT1dSanJmS3AvK21C?=
 =?utf-8?B?MmNaMXNlSW0xS09ZQzhFeEhNaEhrdTJsVldmWjdyZFV2RmF4OFo2V2FhTnpu?=
 =?utf-8?B?RnFSUWdOV0taQ0diS1Y4ZVhWOVdtdDlCanVxY2pEalVwcHptTmRxZzZoZm12?=
 =?utf-8?B?N3ZCZmo1WEtVM2E2Zng4TDQ0M084MmFVUTl3ZE9BemJydVpia0JZdVNxckxx?=
 =?utf-8?B?STQzc0ZxWjMyMWxGU3B6cEpUbUFkb3Z1aFB0clpKSmpEdDlHZmtEQTBmenhh?=
 =?utf-8?B?YkppV2FvZ0hYZWFBMnNnRTR2ZGpURlFwOHFuVy9XVHFaaWVJTDExNEJ4bzRT?=
 =?utf-8?B?eENxSXl5ZktidzEveEFUUjFxMW5TYTBFWmwwYUUzQlVqQ1Nrem5DM1ZsQ3ha?=
 =?utf-8?B?T1lBZXRIMHBBWGJHWGZjT25tYy9aQVRDS2lLNjJVejJNV0hQbDV5UFNyclJT?=
 =?utf-8?Q?ETRyN8j7qc8vAKGY=3D?=
X-Exchange-RoutingPolicyChecked: jUjWNF/SPEnRE2ne9BIIQtlhUF+q/nHEvRDptkjfWAsSVQBtNNPWbNbiy1sDgTPbgmVdqfLO0ebJvPItGISXXcbCyBEtWGwo3Zo32/rh+R0GG61iE0afID7/z3EeNttiYtTTnNHed8gJmjrfCUub6iQKrz0jjYWy6WaE9FejRXi5XlTwNJFrKXQXDkYVXOECbfHS1pez+tswnJQmx+VP5wGumQ5jcBwg9PH3iOkqg+dz/d6WtnEZIyuMmfu3AqzCLZarJPbK/M9PUA2d1FhSnD8tKopjuCPAxucsCGFqlAI13aZIJDgZP/kAc0iI3zkFbrcZHF39nZR17hS86nsHQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 939d9f9e-0c44-4585-3352-08deb742c51a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:10:53.7579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RuD+UgmgR1jLBqENK7CgFGlMcw3/QLCXBIITaiL4aAQEGT7w9SWQsvHt+SItc5WONHIVYdF46vWMQoWKBIOooIHsHSfANfUH+ptgLzJb3dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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

On Thu, May 21, 2026 at 03:56:42PM +0200, Zbigniew Kempczyński wrote:
> On Thu, May 21, 2026 at 12:18:39PM +0200, Francois Dugast wrote:
> > Extend the compute test to make use of madvise(MADV_DONTNEED) on the
> > input array before reading from it on host, after running the compute
> > kernel. The GT stats are used to verify that no page migration happened
> > from device to host.
> > 
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > v2: Only skip results check when not needed (Zbigniew)
> > ---
> >  tests/intel/xe_exec_system_allocator.c | 53 +++++++++++++++++++++++++-
> >  1 file changed, 52 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> > index 0f1d6ee9c..21973e95d 100644
> > --- a/tests/intel/xe_exec_system_allocator.c
> > +++ b/tests/intel/xe_exec_system_allocator.c
> > @@ -2250,6 +2250,9 @@ struct xe_gt_stats_snapshot {
> >  	int svm_4K_pagefault_us;
> >  	int svm_64K_pagefault_us;
> >  	int svm_2M_pagefault_us;
> > +	int svm_4K_cpu_copy_kb;
> > +	int svm_64K_cpu_copy_kb;
> > +	int svm_2M_cpu_copy_kb;
> >  };
> >  
> >  static void read_gt_stats_snapshot(int fd,
> > @@ -2262,11 +2265,18 @@ static void read_gt_stats_snapshot(int fd,
> >  		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_pagefault_us");
> >  	snapshot->svm_2M_pagefault_us =
> >  		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_pagefault_us");
> > +	snapshot->svm_4K_cpu_copy_kb =
> > +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_4K_cpu_copy_kb");
> > +	snapshot->svm_64K_cpu_copy_kb =
> > +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_64K_cpu_copy_kb");
> > +	snapshot->svm_2M_cpu_copy_kb =
> > +		xe_gt_stats_get_count(fd, eci->gt_id, "svm_2M_cpu_copy_kb");
> >  }
> >  
> >  /* compute flags */
> >  #define TOUCH_ONCE		(0x1 << 0)
> >  #define ACCESS_DEVICE_HOST	(0x1 << 1)
> > +#define USE_MADV_DONTNEED	(0x1 << 2)
> >  
> >  /**
> >   * SUBTEST: compute
> > @@ -2285,6 +2295,18 @@ static void read_gt_stats_snapshot(int fd,
> >   * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> >   * Test category: performance test
> >   *
> > + * SUBTEST: eu-fault-4k-range-device-host-madvise-dontneed
> > + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-64k-range-device-host-madvise-dontneed
> > + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> > + * Test category: performance test
> > + *
> > + * SUBTEST: eu-fault-2m-range-device-host-madvise-dontneed
> > + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer for which madvise(MADV_DONTNEED) is used
> > + * Test category: performance test
> > + *
> >   * arg[1]:
> >   *
> >   * @once-device:				touch the buffer only once, from the device
> > @@ -2321,7 +2343,7 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> >  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> >  
> >  	env.loop_count = (flags & TOUCH_ONCE) ? 1 : env.array_size;
> > -	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST);
> > +	env.skip_results_check = !(flags & ACCESS_DEVICE_HOST) || (flags & MADV_DONTNEED);
> >  	env.vm = vm;
> >  
> >  	read_gt_stats_snapshot(fd, eci, &stats_before);
> > @@ -2344,6 +2366,22 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> >  
> >  		xe_run_intel_compute_kernel_on_engine(fd, eci, &env, EXECENV_PREF_SYSTEM);
> >  
> > +		if (flags & ACCESS_DEVICE_HOST) {
> > +			float total = 0;
> > +
> > +			if (flags & USE_MADV_DONTNEED)
> > +				igt_assert_eq(madvise(compute_input, size, MADV_DONTNEED), 0);
> > +
> > +			/*
> > +			 * No functional purpose, just force a read on host
> > +			 */
> > +			for (int j = 0; j < env.array_size; j++)
> > +				total += compute_input[j];
> > +
> > +			if (!total)
> > +				igt_debug("compute_input is zeros\n");
> > +		}
> > +
> >  		free(compute_input);
> >  	}
> >  
> > @@ -2365,6 +2403,18 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> >  		}
> >  	}
> >  
> > +	if ((flags & ACCESS_DEVICE_HOST) && (flags & USE_MADV_DONTNEED)) {
> > +		if (size == SZ_4K)
> > +			igt_assert_eq(stats_before.svm_4K_cpu_copy_kb,
> > +				      stats_after.svm_4K_cpu_copy_kb);
> > +		else if (size == SZ_64K)
> > +			igt_assert_eq(stats_before.svm_64K_cpu_copy_kb,
> > +				      stats_after.svm_64K_cpu_copy_kb);
> > +		else if (size == SZ_2M)
> > +			igt_assert_eq(stats_before.svm_2M_cpu_copy_kb,
> > +				      stats_after.svm_2M_cpu_copy_kb);
> > +	}
> > +
> >  	unbind_system_allocator();
> >  	xe_vm_destroy(fd, vm);
> >  }
> > @@ -2525,6 +2575,7 @@ int igt_main()
> >  		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> >  		{ "range-device", 0 },
> >  		{ "range-device-host", ACCESS_DEVICE_HOST },
> > +		{ "range-device-host-madvise-dontneed", ACCESS_DEVICE_HOST | USE_MADV_DONTNEED },
> >  		{ NULL },
> >  	};
> >  
> > -- 
> > 2.43.0
> >
> 
> For me this is fine, address what Kamil wants and from my:
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Kamil, are you fine addressing what you suggested in a follow-up?

> 
> --
> Zbigniew
