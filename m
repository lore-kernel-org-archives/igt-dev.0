Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E488DC2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 19:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92E610E0BD;
	Mon,  1 Jul 2024 19:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWVQUaKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE4310E0BD
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 19:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719863604; x=1751399604;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/9V/DHSuAF7oDc87pq2UCzxJSKTUizN4h4/6EhTb0+4=;
 b=lWVQUaKSTTHxQqGOaU1vqRExXh0XVjEbtk8+k2/pv6MFlVxWs7Url3qo
 PM65rfC8pfWCRtcgdOyr6sJwIEz0XwXwpIMNZccu1v81TeMAdFdHG6ypL
 MQdeUTZaXLHHvT/3DVecAMea8tYL4TGFspJ0ZcnmpT0Nw+EAFn9FW00g/
 x+KGrZ5/iqUj0a9reZE7RDGPnf/fuJiCkkRZCEAHkYxF7jVUaOkJoQIxn
 mtbg9JX20tfc+yoY4E0QbHfdNIhee5gEOyv3j7W5WO5o45TUsLipHh4NR
 I5vsAzEwlbRRzZok50mGhU8x/qozNOdRsridB1GxneIxrZYCqxopcTAAM w==;
X-CSE-ConnectionGUID: fFR8m5rlSlO4cDIszFN5vw==
X-CSE-MsgGUID: 0+ZcftYxSNOanHOECMl4qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16675731"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="16675731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 12:53:24 -0700
X-CSE-ConnectionGUID: TWZbXl8uTFuVAy2rGqe5Vg==
X-CSE-MsgGUID: 6xEkFy0iSamJLXfefTM2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="50589968"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 12:53:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:53:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:53:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 12:53:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 12:53:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ci+6G3aXy4LlkpJi+3k0ZYeElVRUnnASYzaeSOfrUHcji4vey2dgnODpKQ6IrvxuWDU8ZcR1f27oBpJUjc476AH5h/zdA5O0p8cVjYruaX4p8bEMbE0USKfQl1kuriI3z2dlLYsKhAgMd+LJuTDgTmNah16A3XFQDSlcIS46crB5Ltjmvrqe4Xa/3943VQeEpZ6cZeW5MB6ox8culWlb+hbVcGKmit6GHQ6jA2XHnvgWbpdaAkBYTwN3Hc8+n6SeW3IOzNGVGIkGlJrTrjIBjbMFVN6d6b/rIk5l9OtUi/xMx1Vdbb+wVNQ1B59F+YuTZpXc37qQl8YmddwLGVfzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIDmsCniLBJv17wBu4qodiwYYwxQKMWIn6PX/kLoGkA=;
 b=Dq3gRZK3hCuvP20JQTwQVx96wKtzlaoz7nLxVGrMsgkuBFD+BXwmijDoQWu8D8T1C5BDCBwPsrBJQKo5+t8HrEmF1GNbOnDxzZ0IzQbZAiHQiRNFIKwxLcmV4ySz2bCuTNJOb6TAlL5QTST+b7EZNmscJgtbX2vJ9y23tK/XbA1RPsS9VXi2Ots9GMwn1/XIG96KwY5q0UGoqBjl7gT9cZC+4F5EyFg5b6t9bfJqF/Y7VQoHmrePzDLjZ5Ly37em7/4O1ckJm5FOcmDI845N6hGKCHV2i8fjZItgqCo7O0iRk4BO3m5ZnJde69rSrcyQZJBvFsEp+KsjsZs4v5c91Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 19:53:20 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 19:53:20 +0000
Date: Mon, 1 Jul 2024 12:53:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 13/14] tests/intel/xe_oa: Drop "xe-ref-count" subtest
Message-ID: <ZoMJLlx1JEM+DTR+@orsosgc001>
References: <20240701025309.2416653-1-ashutosh.dixit@intel.com>
 <20240701025309.2416653-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240701025309.2416653-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:303:b4::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: b5210576-406d-4ba5-ef5e-08dc9a077546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QS9pWXJ5UnRqT2E3WHRJamtXV1RuOTFndjJUbjYxWkMySGVtVmNlWHB3STF0?=
 =?utf-8?B?VGFvYUcwdmI2T0Q2VUJ0czZIOHd3MnBtNnRDYXBxd2kzUmV5V0NSclhTMjl0?=
 =?utf-8?B?bTNNWlZ3SWRNUlVoaGZMaHpWT0tvTGJQZUV0WVBVUXhRZHZtaE1Ka2FRQUJo?=
 =?utf-8?B?OHQrZ3JGaSt5d1ozUGhITFMxaFg0M1lQQ2VGTGJzTFBUOXY3YmM5UTBYQ3Zi?=
 =?utf-8?B?MHVmYVJpdTJ5bTl2Kzg0bTlVSkNxNUNTZDVTVXo3em5IbVVucjcwR0xrRjFZ?=
 =?utf-8?B?UFZqTVhGWk8xM0FjTUE1QmNjTGZNbjhxaUVIWVhpUXJJbFc0QlR6L3VCZGhP?=
 =?utf-8?B?QTNneVc1SlluZlp0Q2JjUEFvMVp3WTZ6NE5kaGZmYnptZHhYZ0dRbkVGWjNh?=
 =?utf-8?B?bmY1b3pCK1ZYN1BZTzZHTUJZemxQZ0JBV3dEM2RPdGtZSjdsVzNHTXJWcE1s?=
 =?utf-8?B?TG5iV1Y3UXNBQXcxaDQvMCtHLzVvT2Mrb3ROK3pYcWlkMHF0VFFlZm5JSE5s?=
 =?utf-8?B?N0d5YkUzU1RlcTV2NzJpYU0yVEx1dFRxRXV4Ri9xYXBVZTUwWXorSXc5dTdx?=
 =?utf-8?B?VEhYZEtSL0k4WHgxWm12U0lXQmYxY0dndGoxbDkyMnRseU9pTkNyWjhqaGI0?=
 =?utf-8?B?U0QwdmMyOE5qN1hIMVNjczYwZFJUOTNiQ0ViU3BMemVlaUliMUFtbnZYM3V2?=
 =?utf-8?B?SVdQZ2d3alVON21KeFI4UzRPRzBuaU0xTDd4cmVVUThKMlRLRmFlU294b0RS?=
 =?utf-8?B?cGhLU2VYbmdjWWRvT0FOVW5nbmcrQ0laTVo0Q2ZtUWozSTd6aE5PRWlNUCtY?=
 =?utf-8?B?MmRhN0hzdUUwSFRtSGU4ODluQlRHWnVMTDJEN1ZKQWFnVXZxejVyY2wzS05I?=
 =?utf-8?B?cEp1dVp2S0hJSGc0bFF0Q2lmL2M3SW8yeDRWSDFWQTVicVRBQmI3N1RnajVG?=
 =?utf-8?B?WG4wamFleFhoM1QwK2ZCZ082SHBsbzlac0hzRHNJOU1rNW5WaXFBZTR6eW0z?=
 =?utf-8?B?ZTgwc3hBRkNMb0dIWFYrZEhjUWtWdXN2UzZLak5SS0NjbHEveEFweG54OG14?=
 =?utf-8?B?NVFKbXN5Qm1naitwZzdsUlJmV0VQRXZCclQ3blN2WWZCSW05c0M3cS95b1hH?=
 =?utf-8?B?YVJ3cFozZnloZlFLK1ZSVlhwdWE1M2NMR1dWZVBKUGJtWlVKQzh4VXFkV1RE?=
 =?utf-8?B?ekw1ZVVGMms0QUtndm9zOU1aZHV2b25sOWxWWnBjVVhPendsL2Q1bW9hcHZY?=
 =?utf-8?B?TklSSFRpaG5SalF5OC9LVk5UNmc0U0VRNllZRVNHVFEzYW1sanFuY0V1dzhP?=
 =?utf-8?B?bjVFZElORGRiZXdRZjIycnA5cjFmQW44Vk4vWWloNVFnanFFa3JPb1NGdE8y?=
 =?utf-8?B?ZTltR003ZWNJYTVQTUtSR0Z5T0JDS1BKU3Q4Snc5dFUrSzE4RlFDWVZBV2Nh?=
 =?utf-8?B?czZtdDZrMnVYWlpqKzNPSHNZTld3MXhLU20yS29udzNmRmpWek56aERmeDUv?=
 =?utf-8?B?aVBEeXdBUDkrN0hDQ0NLZVdaT2dYbU5ORTdNWHpOQlM0ZDNadE9HcVUrNkVs?=
 =?utf-8?B?VGVWajVidnpXQ3E4MDhFK2w0c25UZDJ1bjd5SEtMR0RtR3dBbjdIQnhuL3NN?=
 =?utf-8?B?QnBRR1FFNzNtTzVyWGkvQ282TGt1RkJwOGREdDBmVS9nVHFpUEhTNkFTb0dW?=
 =?utf-8?B?bnd3TEROaUVGb2Rvb0dUV29MLzgxWE51UmNUVGtzQlNzVVkxVlgvR1d3S2tX?=
 =?utf-8?B?WWl0dU8vWkM5ZHdsVktWSG44aUw1bGE2ZWxzaUtyZFNLL2R4OS8rUS9jQi83?=
 =?utf-8?B?NjB5REtmbk1zNUlQRmpNQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHNzc0lzazhFRnRrVUxDMXNIcXJDUmNpcW9ObnFrcXVtY2NHWTJlZ00rSkxR?=
 =?utf-8?B?Mnk3RVRYSVNQR2UxUTN0My9POE91UXBwZEEyNGxZV294dWxFUE93K1hmZDNj?=
 =?utf-8?B?M3ZoTzF1ekFvcURLM09JN1ZDYXl5MTBpVU4wNjVUNlg3Rmc4dnlQdWh1eXNs?=
 =?utf-8?B?c2N3V0ZsQjVmWUhTZDByZlgwZHQ2VlFOZUdLcFJHakRUSFduaWV6TE9XOU1x?=
 =?utf-8?B?bjVJb3BkUWRFUFlaVnlJU2h5ekgyWW5lNlpjeWFpZFVTblJMMzJEYy9JblB6?=
 =?utf-8?B?cFRRd2p4N2FxT2hzYmx0YzduOHNvV3k1LzF1Uk1rV2lkeitWQWpldDZ1V2Yv?=
 =?utf-8?B?cG1DK1NPV1liWjNVNUZyUDllM2FUb096SVRuZUltU2czZUhIcGtTL3kyWFJZ?=
 =?utf-8?B?cnlSVGNGM0N5WE9EZFpKL0pIbExwRm54dXBFdnpHNXU2QkRiUDROdU5zYkZB?=
 =?utf-8?B?M3JtWnYranl4dEhwcmhkVDV5dXM4d1hldExyNWYrNFhhZHlvcjBIVEljRkov?=
 =?utf-8?B?NzFkNkVFaWFYSmZjYWlTNnJyRWZsR05JR1hlem9xY2hCL3ArWU03TXpRODBD?=
 =?utf-8?B?d2RLdVlZZDVpKzE1anQ0VmE0TWNMNHN6bWhYRmU0MGY0bzJqT21oaklJa1p3?=
 =?utf-8?B?V1h5SFZ5UGdPSlZ1MkFMc3pNbTJScVBPNVFVaVFzRnQrdzVUWHFqTlF0amp1?=
 =?utf-8?B?MVowUjVTcko1c3EzZ1c3SWhENTVQQnRBd0xlbE9VdWRTbC9ObFdKOEVnWHVr?=
 =?utf-8?B?WEtCaGdZYStQT3A5QURtQjJEazVwc3hza2lCNVRSWmJXVThtUnRsWFByS0Qy?=
 =?utf-8?B?SEdkcDFZelJhVDB4ZGlqMVRXb0FrcjVVV3p6SDN2bndaTWZMWlRVWkJpVDUv?=
 =?utf-8?B?R3hKL2ZsRXFrS0xtWU1Fa2ZkUEhMYWVlZndramdpS2Q1Q00zalQ5eEs3Y0tS?=
 =?utf-8?B?L2M4cS9iSjZhU1lhdnNDSHpvNUZBaUhVVjVsd3h4TENSblVkeUozc1MrNGZC?=
 =?utf-8?B?aS80cGdOdHRSSmFtMFh5bE1vQ0RaaGpCNytJOXd4cHdIMk1vMVFiU2NxK3la?=
 =?utf-8?B?Uy9uaXBLZFRZT0hCR3hQcWlYdEp2S3IybW9USXdzQ2gyNXRpSVlmWmtRVzQv?=
 =?utf-8?B?TmpOVzczSys1bDgyaXV6Y1UzZ1dGdzRyVytRYVhuNThTSHZ2eDNSUDRIZ2xS?=
 =?utf-8?B?UGdsT3UvaTRhY0lVQ2ZFd0NFMFhPd2taK1JwWGhiQ1haTkd4QzF0KzlnV01t?=
 =?utf-8?B?bzc0Yk5WRlBUNVZORm1sM3lQeWw1cmlCOUJTZG5iVGxld2l3c255QUYwNUw1?=
 =?utf-8?B?NTB3cy9lL1owLzJobU04N1JSakJaVVZtQ21aTEhSRHJDVDAwRzdoNko5L2F5?=
 =?utf-8?B?S0FFaUlSTlNiaklZK3hUSktTUnJBWGc0bkpBTjlGZ25sVm5WUFEvU29PT3NC?=
 =?utf-8?B?MTdYWFg3eHUvd2NzYkNhbjNFd0M4RCtOdzBvaXpCc09Fb2wrZmlrVVA3NXM1?=
 =?utf-8?B?emJrSC9KQlhyM1dKTEtEY3ZiTTVHMm1RUWY1ZG9oRXRrLzh2cldVZEhUTmwy?=
 =?utf-8?B?ZkJoc2dxdTIyeVU3WXFiYmNyeTg0bGZUQWU5Uy9FYXBUWHgzalVObmc4SW16?=
 =?utf-8?B?V1VqZUtaQlpQcVNNd1NPN3NkNWxDY1FlVk5DbEw4VksyTElNUzBySTN1bzZl?=
 =?utf-8?B?UURFWHJhQ3hlb21wc0xEemhhQ1VYRE1YTnEybXlJcmIxNkMwV01IQlJveWVM?=
 =?utf-8?B?cDBFbzAxakRpVFV4TW9oT25LQVloQ1RKQTZXSExmUlBRSTgveUQweGRVdWg4?=
 =?utf-8?B?dFlrRE95WlptRWxnQUowZUNDemV2MXkyc0ZlZmo5RktWNyt3NGN1RWxCakJr?=
 =?utf-8?B?UDhoTWE2TmdrcWtJVjZkbWUvZXRON1lsaFBSQkltMWVIRDkvSWNXeGZ2UGtJ?=
 =?utf-8?B?N1d2WjdZYjNkQ1ZwSWlrbG8ranBTbjNrMG5BQlhKeGQrT2UzQ3hUWlAveXBN?=
 =?utf-8?B?SFA5QXB6UWV3RGlweEM3WUhDRVlocjJlVXdOVmxtVTU5dUtyc3B4NGhhcWZO?=
 =?utf-8?B?aVFuQXdvdGJGcTQzM0dEVXVSWURRODFkek5VbUhKa09lT1lnVDhLa0EzZi9O?=
 =?utf-8?B?VTJ3Nmp3M0tTN21yQWlRQVpWNWFoYzJVUWVRdmdnSnNBbWlFMm5MTkJxdkhE?=
 =?utf-8?Q?msYQNLRQtHzCYWqKHZCxNpc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5210576-406d-4ba5-ef5e-08dc9a077546
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 19:53:20.4065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFK28OgSH3n7QLnHJlevhHWCoQ5zh9WiHifGOyezSFScIrVVux3uySAi6kZfd3EdNo01L5M2RtBmpszl+B8Bk6qpI7DiqlTg8r/btAGIbMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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

On Sun, Jun 30, 2024 at 07:53:08PM -0700, Ashutosh Dixit wrote:
>Sometime other modules (such as those for child devices) take or drop
>references on the xe module. This results in "xe-ref-count" subtest unable
>to accurately predict what the module refcount should be, resulting in
>frequent false positives in the test.
>
>Drop the test till we are able to devise a robust method to predict xe
>module refcount.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 107 --------------------------------------------
> 1 file changed, 107 deletions(-)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 965ea05d9a..9d4402d9bf 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -3371,36 +3371,6 @@ test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instan
> 	} while (WEXITSTATUS(child_ret) == EAGAIN);
> }
>
>-static unsigned read_xe_module_ref(void)
>-{
>-	FILE *fp = fopen("/proc/modules", "r");
>-	char *line = NULL;
>-	size_t line_buf_size = 0;
>-	int len = 0;
>-	unsigned ref_count;
>-	char mod[8];
>-	int modn = 3;
>-
>-	igt_assert(fp);
>-
>-	strcpy(mod, "xe ");
>-	while ((len = getline(&line, &line_buf_size, fp)) > 0) {
>-		if (strncmp(line, mod, modn) == 0) {
>-			unsigned long mem;
>-			int ret = sscanf(line + 5, "%lu %u", &mem, &ref_count);
>-			igt_assert(ret == 2);
>-			goto done;
>-		}
>-	}
>-
>-	igt_assert(!"reached");
>-
>-done:
>-	free(line);
>-	fclose(fp);
>-	return ref_count;
>-}
>-
> /**
>  * SUBTEST: rc6-disable
>  * Description: Check that opening an OA stream disables RC6
>@@ -4116,80 +4086,6 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
> 		   WEXITSTATUS(ret) == 0);
> }
>
>-/**
>- * SUBTEST: xe-ref-count
>- * Description: Check that an open oa stream holds a reference on the xe module
>- */
>-static void
>-test_xe_ref_count(void)
>-{
>-	uint64_t properties[] = {
>-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>-
>-		/* Include OA reports in samples */
>-		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>-
>-		/* OA unit configuration */
>-		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0 /* updated below */,
>-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0), /* update below */
>-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, 0, /* update below */
>-	};
>-	struct intel_xe_oa_open_prop param = {
>-		.num_properties = ARRAY_SIZE(properties) / 2,
>-		.properties_ptr = to_user_pointer(properties),
>-	};
>-	unsigned baseline, ref_count0, ref_count1;
>-	uint32_t oa_report0[64];
>-	uint32_t oa_report1[64];
>-
>-	/* This should be the first test before the first fixture so no drm_fd
>-	 * should have been opened so far...
>-	 */
>-	igt_assert_eq(drm_fd, -1);
>-
>-	baseline = read_xe_module_ref();
>-	igt_debug("baseline ref count (drm fd closed) = %u\n", baseline);
>-
>-	drm_fd = __drm_open_driver(DRIVER_XE);
>-	if (is_xe_device(drm_fd))
>-		xe_device_get(drm_fd);
>-	devid = intel_get_drm_devid(drm_fd);
>-	sysfs = igt_sysfs_open(drm_fd);
>-
>-	/* Note: these global variables are only initialized after calling
>-	 * init_sys_info()...
>-	 */
>-	igt_require(init_sys_info());
>-	properties[5] = default_test_set->perf_oa_metrics_set;
>-	properties[7] = __ff(default_test_set->perf_oa_format);
>-	properties[9] = oa_exp_1_millisec;
>-
>-	ref_count0 = read_xe_module_ref();
>-	igt_debug("initial ref count with drm_fd open = %u\n", ref_count0);
>-
>-	stream_fd = __perf_open(drm_fd, &param, false);
>-        set_fd_flags(stream_fd, O_CLOEXEC);
>-	ref_count1 = read_xe_module_ref();
>-	igt_debug("ref count after opening oa stream = %u\n", ref_count1);
>-
>-	drm_close_driver(drm_fd);
>-	close(sysfs);
>-	drm_fd = -1;
>-	sysfs = -1;
>-	ref_count0 = read_xe_module_ref();
>-	igt_debug("ref count after closing drm fd = %u\n", ref_count0);
>-
>-	read_2_oa_reports(default_test_set->perf_oa_format,
>-			  oa_exp_1_millisec,
>-			  oa_report0,
>-			  oa_report1,
>-			  false); /* not just timer reports */
>-
>-	__perf_close(stream_fd);
>-	ref_count0 = read_xe_module_ref();
>-	igt_debug("ref count after closing oa stream fd = %u\n", ref_count0);
>-}
>-
> /**
>  * SUBTEST: sysctl-defaults
>  * Description: Test that perf_stream_paranoid sysctl exists
>@@ -4621,9 +4517,6 @@ igt_main
> 		igt_require(!stat("/proc/sys/dev/xe/perf_stream_paranoid", &sb));
> 	}
>
>-	igt_subtest("xe-ref-count")
>-		test_xe_ref_count();
>-
> 	igt_subtest("sysctl-defaults")
> 		test_sysctl_defaults();
>
>-- 
>2.41.0
>
