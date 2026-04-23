Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7323F589C8
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 12:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533FE10E289;
	Thu, 23 Apr 2026 12:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AofHkcNe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8E510F0FC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776948765; x=1808484765;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=Xzegma27d2sw765yqhJHfuWvQGLWa/XotDMs4HIKf50=;
 b=AofHkcNetV8l3gQ770Pml6yJDxEHQ7vEFMvQnhq0Jku6ydBiS/p6/xn3
 LnthuTynnn53WTBccnqg1+1kB8ztLnujxdRSH2p2G+q4yQDjeitfVUkOb
 npi+vw9tWyNVktANI99NR/bhSAHxezNsUQtYlkEjjCdpEcw2XcTtSMdSw
 kpzDyXGgIMsX/M164fCf7+xIsKJTirWe7usKMx3ZL+4ba2LvGRNGHVy8n
 JSsvEd8Trzup/rjZJoqn//rsWnYTnTjViorxTPMBwp9HqMT6hLUVLQ5Ik
 R17P/VQG7QOaNcIsXNmwnuIqXM5pCGO5XLTl10dKoJj17jULRrtid4lkO w==;
X-CSE-ConnectionGUID: flh+dGHFSsKBytM+jBQ9hA==
X-CSE-MsgGUID: 9nMr/sZGT8SJQcXHoWMy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77795530"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77795530"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 05:52:45 -0700
X-CSE-ConnectionGUID: 83VtoasjRq2H1DUnsKpx1Q==
X-CSE-MsgGUID: HdTrXvokTme2t1lY+ZQ1cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="256137333"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 05:52:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 05:52:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 05:52:40 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 05:52:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOMr9ow0G9uUbGG1Hpv/XggukCkrrnr1z1aJvzMtlopvklpKNnHk7jQKjTTGtfJhXioJyaPWelgjhyoOqOFOnuOS31GR7JPI4gaAMqZLGol3tBbjCUsMBzuMBEcz14D9pNDHdM8AD3LC/zd4WTlusV6xVIvfZZBkY4iSSbbUIMMQH/1xKN0hgdBraGfcjLVJNoQrhWvBy8/nyG0shk9QK9vqAb3szC57ozrVglk8z+qhIGfQE7JW7ue9xDVMrEWT+UPoMBQ3nW4vuVncsGnux8BXzRBF0DSQNChNkFFEnuhanC1+HFk8fP7nLzi0F5g2FmuvarshqX9wkwJ0tSkk/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKIT0uw4smRn7PncxZkLYhSIliSSYxPEVZsIXXCGlyA=;
 b=L+0kbG6oruXY3vT+GkJZp6BdOhkaZETQ5B18K9ne+4Xlcr/AFR0hsW/+wmXhdbLvO4I0/bYjeDA+TW0dkH+EaH+zLtvnCyokq0z/V3fNpjdUGf9/7KoS1492mAihis5U9QH8avaAkQPHegCR8oIwmei0+1YBOXOVVg2TWu5fLKdxNc+bCW4RDgXXM7lWy8yDZ9iLyAmYP6SpCwwzeWReWZ50n7w/saOyV3nQDeX0/tAtITKCLQ2XqtAgthqlr25dziZOG7oPBnzFDMBcpMEC6lZMbd3Se4A3oRTfYG7Lp0Rp69URG0YdndIZpDJHCEYXoSc94PlhOTufPBCxSk2jTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by SA1PR11MB6845.namprd11.prod.outlook.com (2603:10b6:806:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 12:52:34 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::fce1:3bde:b383:e801%3]) with mapi id 15.20.9846.014; Thu, 23 Apr 2026
 12:52:34 +0000
Date: Thu, 23 Apr 2026 14:52:28 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests=2Fi?=
 =?utf-8?Q?ntel=2Fgem=5Fexec=5Fendless?= =?utf-8?Q?=3A?= Use the per-gt
 interface to set frequencies (rev3)
Message-ID: <iwqfloyfnq3lso6ozlur5hogasakl3gix7t3z5rhvzu32feo3t@wdmtw26qbe7r>
References: <20260409140640.48827-2-krzysztof.niemiec@intel.com>
 <177586075988.452684.2824690911063544830@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <177586075988.452684.2824690911063544830@a3b018990fe9>
X-ClientProxiedBy: DUZP191CA0046.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::15) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|SA1PR11MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fef6a66-c394-447d-bd73-08dea1373080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: zfnZMpLGy3cmwEeDwfZx73r4zkF8nKWXn7Pu2gEaRHeyKk/R5fFgV7BvvCyLuzyXYcQiQHl2dUn1IyzE4OgbFTjqtOkpBkknb6E26Gp3O8aL+ILM4b1XlRgnTtOMlaeTECyOhCHuUshqLgKBOUqKbWvoLZtPIR60Gj9liXL+oW1CSIizXJizqTckXjIJwnWi1Dtlz4eaeOzDgzn2ULORONgjh9h2MDPWB9G+uvatCKZ3AcMpfuS3/OqOb4F2PcYs/o0SjlFM2iKofZYgC0MED0zUQkiZs2lRi2puZpIsHL7wtWY/WJ1VyrOeTwCFsGQQAQQ7vcYQ75p8dCQhw9JFelgrNSyG8ueuXKGyh3B7QAM4d2NyIA62i3MKD6zLuQsoWcJLufXCaE1bhhbochAmDM2GNi0OLMBgZeT4U8wVozAHBs7rUOniNJlC6vD+10DqmM536iBXlVtSqjQKGoWMgFsv1FcbF6StzYc3vUbXUirZkN++lVZu/e89f+e0LRTgLkwZLprOQXboOg9FtuBhEXNq4Z4Sg4PIfpgOVB7FPSgWAh52VuywpaQSQg4Jlz0nEH/YvDHcoLlgJI7bXJsxNnd47tVybGoOorjnuc9IXOtWRLfiG6F0rzTzde+7k/YWo/GquQaLkzQvALnDZe1kJz+w3W6Yy2IxzuNb1S2Hzrm0pGFRHMSph2uKE1isgCaq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(13003099007)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZOSmx4dmFHTXZIbmh0UnV1MFFkRmVWODdlQmp4VElVU0oxN0hTUytISTVw?=
 =?utf-8?B?NTJKdUFYMFBLeTFSc0NFOVU4QXNvR2tBNTJ2T2I4Q1Q1K2h6aklBSjhiQ3Ry?=
 =?utf-8?B?amFheGFNZ2FzYmoxRzJMcDlJbzdZRVkvT0haeUZSR3NmZk1uQ3FMYlBjVUZs?=
 =?utf-8?B?ZHR3bkVaOFJjU1M2M296UjkzY2hEdW1GMDlaZUtzZFltSXJsU25KcU82VTBp?=
 =?utf-8?B?bmRqaG1JNWd0TkxhMTVSaDdNU2RYREx4ZUFWNTBXYit4eEFqZVpURFlmUE0z?=
 =?utf-8?B?MzRpajk4aTM4V3NNRVNOUzNrd1R3Q2NWR3JodU0xUlJ4TjFNVEoxdzcrd3RC?=
 =?utf-8?B?bUkxTS9adHhheGtRRWtzZTNJZjNJclkxeUZoOEphMVlibTNkYTlIS090OXVU?=
 =?utf-8?B?Y0NVOWZmNWZtVXpwVGpTbmw4OSs2TDIzQ3BkQnBEV0U2WHZMK1FEOG5SR1cx?=
 =?utf-8?B?NnVYQTYrVWtzcHB4bUc0ZFR1L3VtVW52dWIrUW1LMWkySHBjU1NidHY0ZXRh?=
 =?utf-8?B?TC9XTFN4Y0JrejNMRmpianUybWVEc0FJQ096MVkyYTZlNmdGVnVKRHpleUJD?=
 =?utf-8?B?dXRGS1oyemw4SjNGUGpoamNwSlBRekVQZWhYVU9CTHJNb1lEc04zYXQreUxp?=
 =?utf-8?B?M1BQY3JxUElHYWdXNkxJWE0rMkFqM0VrcEFtWUZybkdMUXVUNlFXaEpENWYy?=
 =?utf-8?B?UTcvbjJPMVVFaS9ncVpaTWVJck9rWS9jNjUrZDQ3dkN1ek5ZWTFTQzlZbnJw?=
 =?utf-8?B?TVNaRnlzcGNZdkpybVNBMUY3VkFibUlnK3orT3JndHAwelc5RnZHSUNDZjJK?=
 =?utf-8?B?dHo1elp0Vm1xU29HQVYwTW5xdnlZdUQyUzNITGpTU09hZ1dlUklnZ1haWXRB?=
 =?utf-8?B?aVB3dVRyTFM2SmFNUy9QcU1hRFF1NTZXSFNldktaZlVaQmVXMVV5WEZMVFR1?=
 =?utf-8?B?ZzJGZE1mRE5XZGFPZCthNER5bUVLcTJPRExXeTVVMUhLTlFuRVg5VUQzMUdp?=
 =?utf-8?B?YTljQUtrcW5RWFlSVGJHaXZreUwxOUZ2TVVqOHpKRFhWZzZOcGxBb1dpZjA2?=
 =?utf-8?B?U3IzYmN5SGx3dWJzYXBhbDU3MkViVTVKQ0RXK0loMTB1VUU1VWlBYmsxemV4?=
 =?utf-8?B?U0VBOE9sWmpyY3dFTzJHYmowU0I3dWRaVXVYVXBQUkdZYlphTm01MFZSUnFw?=
 =?utf-8?B?SlppTVl5dFhMZDdCWk1ubkhmWGRBZm41WE9QVCt3NjFWdHZ4ZWk5V2hGUlo5?=
 =?utf-8?B?Q0tOVFErODJ5R2oyL3FEalJqdVBVSXRjb2k4VzEwZ3FOenU5SmprQnkrK0kv?=
 =?utf-8?B?d0syUEVad1lTS2Nod09pTXhRMWNjNWtkMHBEWWkrNkcyMnBpUzlTVnRycHk0?=
 =?utf-8?B?bzF5SmxVQnhMeWltT21FbklRcXZpVEd0eXM4OFIwSm0vYzgzV1cycDhoenN6?=
 =?utf-8?B?aXhXMW9rTythYld3YjlnZW5LdEt5TlpWQkFMbjZ6RlpyUXFWcWpNWHBZa3Zn?=
 =?utf-8?B?VHdVeGc4am12ejVKT0VNYVlVQ2EyM2hXTVA2UnJtK0hoQ1RjSUdoMEZONURV?=
 =?utf-8?B?WVVvU1EwQmllV3VBSEVucTJKM3QrTlBYazNIQVFUZllrQk5OVm5HM1J0Y2Ix?=
 =?utf-8?B?c3ZkL3pRZjJvek95anJ1ZEg3WE5oRjVVNjJDeS9UcFZnejZkQ3JITmlCbk9n?=
 =?utf-8?B?T2NBS3A0QnIwZTZrS1EwZG50VE02U2lleGFabkxkbUJXQjlLaWQ5SC9kSDRN?=
 =?utf-8?B?VnUvOHEweDVaQmdXc2t3K1d3Q1pNSWZ4NnVSWjlHMEhqRzM2T0JuVm1HdjhH?=
 =?utf-8?B?NmxFQlF3dmx1eGx2R1l3WU5mK0FMS2xFb2hVREFtd1BkWFViR0lTZkY4QjFh?=
 =?utf-8?B?bnN5YVdCQUZRaE5PUXkvTDZoYU9qc0MzMnRtUWpyWlJRamJRc0FPTDhkUmk0?=
 =?utf-8?B?WDcxSXh0dGcrcGZIbFdpWUE2MjlYb09ZTElYd2JqQ2dwWjJ3Z3MvUVJSRTdj?=
 =?utf-8?B?THczeHNJSkZZUGpOc3o1ZHczN3RvVjF5WlVuYUVKMnVobnpnUmN6UngxS0pn?=
 =?utf-8?B?Z0tHb0U2VndMS0tWV25LM1hTeE9OWGFZQlh2UDRBeWJsTDhvUFpQbWFxSTlq?=
 =?utf-8?B?Rk5tY3h6di9tV2NaNWFFZzJJNE5qNVhiWGNGQUduU1lwMnUzNWwvTEc5YXRl?=
 =?utf-8?B?a3hoN1VaMWFlOGh6OTdla0JGYUl3d1ZtaDJIMkQvbEplUnlWVk1HSjNnYjlX?=
 =?utf-8?B?OXNSWU85SW1GT1RqMzMrbnU1UkxPOTBYY3Z4dnFlSkhOUHY3UFFCaVFRYWll?=
 =?utf-8?B?MzhDYktaQ2FCK0JvREFtNGxmMnBpU2lBWENBVGQ1WEJzNHRLaEsxVHg4aG1D?=
 =?utf-8?Q?SSc1ZlLMHxvaScFM=3D?=
X-Exchange-RoutingPolicyChecked: wqlwJFX+iJl2qXojgAuOlVS7BSIHtLrc3LhkZ6zqjVY/d7nVQP07+qP1foNHQmFqZ6/+0Ia+dqzbVrt7sVdw8y4NxdDTt4Fn5YOMNXc6thDpSJD8IGMZDAAuwVgSqlkrOeOIMNm13CzpI3EYcVtrk72hxIzYqvHFruFdCOcogn0IfiM7lu9AQ9YO2MwFmdZxAlGsxlozGEc1F5AqYeGRe87TdPUQrVPGqNw5vH2EdzFSI+oqaLsBdcCGgAre07klXVsatzewI1idCExvk7nAgg/2vHFTR8iwTpvNoITxNuohA7BqAO82yNn1nIeZuNJrFcUjd4ZZvqsAWp6KBbhB3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fef6a66-c394-447d-bd73-08dea1373080
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 12:52:34.3633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: no3xSEAy5nE5QdzGeXNMbtVevfTOS/ey+0tfHNGcXv8Shp0tqxr7K1cOjFgagX0mqIoH0f7mB3bS1PCjomt/solj3vDQ4Wk5Gf9Z7Qy2Cqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6845
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

On 2026-04-10 at 22:39:19 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_exec_endless: Use the per-gt interface to set frequencies (rev3)
> URL   : https://patchwork.freedesktop.org/series/164291/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18306_full -> IGTPW_14957_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14957_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14957_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14957/index.html
> 
> Participating hosts (11 -> 10)
> ------------------------------
> 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14957_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_busy@close-race:
>     - shard-dg1:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18306/shard-dg1-17/igt@gem_busy@close-race.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14957/shard-dg1-13/igt@gem_busy@close-race.html
> 
>   * igt@gem_exec_suspend@basic-s0@lmem0:
>     - shard-dg2:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18306/shard-dg2-8/igt@gem_exec_suspend@basic-s0@lmem0.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14957/shard-dg2-10/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>   

These are unrelated to the patch.

> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_18306_full and IGTPW_14957_full:
> 
> ### New IGT tests (27) ###
> 
>   * igt@gem_softpin@256x256-right-edge:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@2x-flip-vs-panning:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@2x-scaler-multi-pipe:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@bad-aux-stride-4-tiled-mtl-rc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@bad-pixel-format-y-tiled-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@bad-register:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@create-invalid-size:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@cursor-offscreen-128x128:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@cursor-size-change:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@cursorb-vs-flipa-toggle:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@fbc-1p-offscreen-pri-shrfb-draw-mmap-cpu:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@fbc-psr-cursor-render:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@full-late-pulse:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@idempotent:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@plane-scaler-unity-scaling-with-modifiers:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@query-regions-unallocated:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@set-priority-range:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@stress-xrgb8888-untiled:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@switch-modeset-ultra-joiner-big-joiner:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@y-tiled-to-vebox-linear:
>     - Statuses :
>     - Exec time: [None] s
> 
>   * igt@gem_softpin@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 

The patch also doesn't touch these, unrelated as well.

Thanks
Krzysztof.

> Known issues
> ------------
> 

<snip>

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14957/index.html
