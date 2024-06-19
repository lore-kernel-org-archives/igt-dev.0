Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B59AC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 21:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA45C10E031;
	Wed, 19 Jun 2024 21:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QmMkAQ/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665E510E031
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 21:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718831587; x=1750367587;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=dKpE4vnG3U/FBvBK3CymBEIS4Suajll8c1wHLljWThY=;
 b=QmMkAQ/4za97jQhB/++efCqJjZB+R6ZNsHm0Lp0H/zwa+avpy7LHxBN5
 yebUQawAU5tytdvPGtbLrKF3Q3vjMpDNQidGjGJ1Wi8aCgdGoej7IrDPP
 Hd2SmvcSB+TjQW5HVXMqtZ4+CURsM1XTIsn7GHkxbgyxwtt2L39njZF4k
 HdXqDCxhhbw6jNNzwt0YAjwDMniG/f9kcUANrzpkr5wktBPVqAf1+kYwr
 agZU7nRA08RKc8ZcntcSu2AzeaU6dQmarhsuRZDqCx8UoQ6fCK05lgtKe
 T/L9kWCWDDmshv5eiiBIYp5v/HZA8W1ig49yzdd3+Wcu4Qn4WVnprvv2A A==;
X-CSE-ConnectionGUID: mlLpsIKtRmOuOLip8L/3MA==
X-CSE-MsgGUID: CxIxfJIXRsuWnIjEccuCcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27206984"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="27206984"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:13:06 -0700
X-CSE-ConnectionGUID: OZnJxV2MQLu5GFIooacRBg==
X-CSE-MsgGUID: N6zK2qZLT4+28ZYGr5ijNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42496840"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 14:13:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 14:13:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 14:13:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 14:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABNBtzGzFwJ4ik0UTt9yyByiEBK7+F7QLAcaPKwEwPiFdJkhsZBukMaZYLPyUtYMdazlvhxywPLA9BNgdIATtR3+L8F3LD2SYxqKfNJlDxFQGNroVhe9BwIXMUz69HXERKxWsU+Ot0ZVExQxGqi8WCGHMlwqHP3csxYNB5qfZdoNDp/I3nNhiDmmweH23/iSSGc/wsrLacSSTjq55atnI3r3P7i8dzZ8w9u9aAiICU2u7dkb51HZ704y3k+HXyIpwMHX3lN/UhjZezmQTQAHEmOwkhx/FRM34SVZqaJkqai7VjT0gFcBwGDviugJ5FqgR9GTmhEaX1yXTRI10I+kAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwHRdwUxm7BhfZMGTtO0HZ1ntB0Z/vGCrbRBMhWBgQU=;
 b=UIJPIiozsbqKjIhsgWyU79csjmGyK84p3REBSsKeNdO+O+sFMcCQ0aDFqgzYqRzZW9znQ8kMmecaEbQo3upOyPeVjRQgxJAbByyRPTmOCqjFSelmGbCg5ol6HA3Ci8VLX2Wkmvw/eQ2uaOTIE3mmVaeMX+MEU2X735NVV59fDliWwOm9cUSJhJpQYxiToJEf3fBaawb+SZTqFrdbYe2JjlJsE5QYJydyxFK3CliDKE0TZDOrgpYBDC+mcnXn2oU39bmdyK1xLJ252Vm2oBMHmeGlwg2QVo87IxoppT1yzaZY/XoDotsZqVr66So1aemtHD/dme6UkBfmll+3p7fTTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 21:13:03 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 21:13:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cpagq63o52papoxtexm7bthkigc6aw7vagmlq3qz6ohszjkfc6@wnavlnjdv6sy>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <20240509152442.189166-2-gustavo.sousa@intel.com>
 <cpagq63o52papoxtexm7bthkigc6aw7vagmlq3qz6ohszjkfc6@wnavlnjdv6sy>
Subject: Re: [PATCH i-g-t 1/3] igt_hook: Add feature
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Wed, 19 Jun 2024 18:12:53 -0300
Message-ID: <171883157362.2358.4692119154210725467@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc1fc16-486d-4899-34dd-08dc90a49ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUsvZG9IS1c5Ym9ia0MxSExzQXRjQmJwbm1ReWdvQ1IwZ00xbDhObVVwMDcy?=
 =?utf-8?B?NGgwMDRQUWZobzd3b05oRDZxbi9kbm9NU3p0blFyY2xQR3MwLzh1QlNhbGRD?=
 =?utf-8?B?UFVReWdkcFhpUndpZExPa1lSN2ZQNDZsYndSMHBTV2M4MFZSaFFVeFVxWnVi?=
 =?utf-8?B?ZEphVzc3K2t6ZXdPa2haTDFOWHJnUCtEZDYycG9jUmUwQXl1SnRlT2FjdDYy?=
 =?utf-8?B?SDA0VkRGbHdWbXh0N2VmNW9rdjVOM20xT1dFWXlGWCtXeXNLVUR1WEJKODlO?=
 =?utf-8?B?dTh6OEFrRHNTZGEwRmo5RjFsOVhBbjNGeGJLbnFiQkVmYW5BYUQvMzIrRkdX?=
 =?utf-8?B?bG9tSFFwNUh4NHB3b1A2TkZGVnR2bStBNmlrY2lkMEljbU1LTU5IWFdjSkdp?=
 =?utf-8?B?K2k3TEJkL2l1TVgrdWJlODh3cUVzYUNhY0R4V1haUHV2T2U3bXMxZnBvaXhR?=
 =?utf-8?B?ZFJQTVF1aHJ3TGZNaEo2QnZ4UTBvaWw3dFk2L3dxUERKWENBTnp2bXIzUWhm?=
 =?utf-8?B?Ty9IZXhhZWpsRE5kMlIwR3RaY3p3YTlUaSs2MGh6U0tPWEg4M01QdlFuWnZz?=
 =?utf-8?B?OVRxdFBkUWZBTE9ZMThUV1VJUEdEZGh0cm92Ym9iTFJQb0lieVVDYVViQVhH?=
 =?utf-8?B?UlZSSjBwaU11NXlKS1NOeldCdFJSWVlORVJDOU9mRVovc2pGSkFlbFRNUEFE?=
 =?utf-8?B?c1J3WjlpeEZuRE5WWHI4a2VMaStvQ0RVRWhuRzFvRGFEVDlFc2kyeERHR1h0?=
 =?utf-8?B?d2gvdkZxakZKQ1N0SkNZRCtmS3VFditVS3ZwQnJEZElrREVhS3NNQ3kzZmFD?=
 =?utf-8?B?RnFLL2hkbEhEbEt4bDRyRVc3SmhzMmZIMklOUWI5WmhkL012OGZSS0t0OGRr?=
 =?utf-8?B?SlhmSTJtYnNLdjQ4STU4VVJQUWZDZmxCblRzazFwbkZacm1WL3BrTklFbjQ4?=
 =?utf-8?B?ODJjYW1QVExORGsweEx5ZG1helNTNnV2WVVPQVNPd0h3MzlNZmRzS0pIYlRZ?=
 =?utf-8?B?eHBoNGs3VGNqTzRHeGFoV2R3WFg5ckFPbHJHN1h3dnV5SVE0b0lONXUvbENK?=
 =?utf-8?B?TWE3OEVrL2xULzk5TDlkK3RCa2prVW1FV3NjOW4zYkxkWm5TRDllK2NnNzNq?=
 =?utf-8?B?Yk5FVWxCVEpXZ3A1U0Qvck9Tc29FaExOYzh0M000Z0hscERESVl0N2VYeWpS?=
 =?utf-8?B?bk96cUs5SWhuUWFsVnFOS2FtSjNvdTJrcDZEdTZjU0U3cEJWZ3NlWi9wRkhy?=
 =?utf-8?B?a1o1eHl1OW5HZDVvOFdmRlk0MHBnTDl2anNVMUJGTE1WRUdPemNGMWtZRlFy?=
 =?utf-8?B?NnNGWXZtbURjY1ViZXplNlRUU1VZOFZKb05GSENIakhtbDkzR3NvaytZSEEr?=
 =?utf-8?B?L0syMGF1Sk83K2tXNDN3b1BEaFM5Y1d5RXkxRXBGZXRzNVgvdVVScGY4Mmdw?=
 =?utf-8?B?cGhXRTNwdDZiQlNiNzBEZnNScFdiMDhGVlhnVXdLYzZpNmMrbUpicDZpMGNw?=
 =?utf-8?B?NGQ1RkM1OUpoRVVDZi8vblJ4ZS9MbnQwZHNYY0RFVEU1ZnVETjhlQ2oyM0RC?=
 =?utf-8?B?bVZ6WDlwVUlpOUM2eTV5QVdMV29tMXE2aXBMVjJOUWd1VTAxWUtkL2NsVFJS?=
 =?utf-8?B?elFnS2FxTzlqU3gvMFp6RnBSZ1V4QTIwQmhWdS9XdXVNbERhTHgreFVxT3A1?=
 =?utf-8?B?UndaVHkxeHkxNk1SQ0JWaVFGckdwOUh5d0pvS2RUL2FyMVZXbnVaMTRjMklK?=
 =?utf-8?Q?srQ+6L5I5lsVfqR88mUZaSSpAz84eo8TJUVIfoK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkxPUzhwWm1ZdmVldHE0U1BiTTZreTRNSnA2cDVsUkhtUkxKM25PN1MxeFpx?=
 =?utf-8?B?OUJYbTVLaGVacWFOb0FFQUtRU1BQWmZuY0pZU2NZYWN5dFZpdmxTTzBubUo2?=
 =?utf-8?B?RFJLMGgvUVVTN0tIOVB5RGRKa3o5YS9kRS9VemM4ZTFrUWhsMHk0QWlXVU01?=
 =?utf-8?B?Mk0wdEdqQ1c1eGE4ZzZGZ3ZqY3pSU0RxcVNORXRoWEVPN3plQUliLytSa2NH?=
 =?utf-8?B?YXJiUmliUHl2c1BYVkVZdktWV1h0eG1UeW9kOVY3M1VuUW43cjdWeHpTSTFX?=
 =?utf-8?B?K05CTUVpZGJZUVNOVU1pTm4rOEFLNmVlNEljQ2FZVmVOTHRSUDRFVDhBR1dL?=
 =?utf-8?B?VFFwNVFTNEowVERFbGZqdEg0R0NjcGNXY2xwQ0k2TEgvU0libHEya1RVNUQv?=
 =?utf-8?B?S3hPdWRCNVdIc3k5Q0czRENRQTRrRks2L0cxOG56cDhaOW53UFN2WXRVWHFt?=
 =?utf-8?B?c2tzeHErZEFGdG1zcVd0REE4MkxkU05NSTlHWllGSjJ3MzlvNnZCekFFa0Rx?=
 =?utf-8?B?Zm1jUURybmlXaUVFRkVvclUwWnhlQWRVclRaVHNnSEJQY01aeWtCSjhyaHp3?=
 =?utf-8?B?M0FRVVM2R0hFTm5pY3ZmU01rdHZBVm5xbTV4Vk5EUHY0ay9Vd0N0d1hRbnAx?=
 =?utf-8?B?NkE5RmpyYndIWm8ydWZ1bXNGeW94dEdIV3FYWU9zZ1pwNUtMNytiL1BsSFRJ?=
 =?utf-8?B?LzNlYnVndHlIVEJoZGtWWU9oZ01vWDlOMDArcDBuRFUyNmd0NXlFZlpvcDVm?=
 =?utf-8?B?UnFYUkY0ZU1PV0d3Y3FNVmp2elZ1VnFjQmlSdnVZM1FPVVdJdFdUKytXNVFV?=
 =?utf-8?B?SkQ4Y1dPMkROZlg5anJ3K2IwampsQk5CNXB3REZiVXpLVmFLaC8xc3Q5SkRQ?=
 =?utf-8?B?RXRyYkt3TDZ6U0hxTUZlWE5KcVlVL0NFT3JLdnRDdk04bDBBWEkrTXV3K1Nu?=
 =?utf-8?B?b0pOaGt4WnFuN1RnQXBJWUxibUlYalFNWi9rZEIyZUc1ekowdEhtRm01dWV1?=
 =?utf-8?B?eG9ranhHTGdQWmVEMnFlVjlLdlhuN1Q2MmRJejQvbmdSNTR6WVhjV3p5U0RN?=
 =?utf-8?B?OE42WEd2RHZQWHJuRGZnZGhzR3F1eEo3M2kzVlFnZ0htZW5xSG00NjRqTlRi?=
 =?utf-8?B?a1RRa0pnOWdVMEZrNDhGcUNnKzBYVW9IUkVKa1J2QjZtMHhRVVp2V2JoZE5t?=
 =?utf-8?B?Zm16NlhDMzdHQ0xMbTgyb3pKUGpSV3F2NFVhM1FISGVnOXlXWEdXSmZMcWFp?=
 =?utf-8?B?blZPTW5NT29NaXFYbW9KUTdrVjJCYWR0VmVpWW5vSjRVRHJCdXZwSk00VTdY?=
 =?utf-8?B?UFB4c1Y0bkFHb0dyenRvMVRIVHBxUE5XQjA4UDFSOTVVbHJBOVNYMDFnam1s?=
 =?utf-8?B?ZTRmQTcxZit5SFJpUWZhb2hIenhpT0lUYy9SQTFpclZseUE1QTRIS0xHaGk1?=
 =?utf-8?B?V0VrRnNhYUd5NFV2cjNPOUxHOUtBaEU2NXZYaHZvK2wxTGMvSWFGZ2RSejN4?=
 =?utf-8?B?V0dGSDA3WWZIWk94U25jVmkwcElSU3orTEt6OTI3bHJrVzNOY0VVdVRhOHp3?=
 =?utf-8?B?c2g3ZFlid2xHRkhNTi8wNVoxMzZIcjBBZkxjTlVRRDROWGRDVWxQd25GcXo5?=
 =?utf-8?B?ell1UGRueklOWHBneVZXMm9KT3Z3aDBxTXBESmF4eVdRREhqVU0rM0hRbW5n?=
 =?utf-8?B?Nlp5OGRza0xROEJYbnpPTDIwU200SXQ0d0YxRUQvd2lTR0xqRERSY3pBZ1BC?=
 =?utf-8?B?UFg5YnU5QTErTFlYNlNiRUJPRE5RTEdTeDN1TGQ4OFpmb1ZiN1doVy9oSW54?=
 =?utf-8?B?Z012bEYzemkxaHhkWmQ1MmNtOU5RdEczT0kzQUc3bEl6Uy9DZWp6TG9FVlNO?=
 =?utf-8?B?Sk1BblBLa0FvWEFTSjN6cno0OERrSWd6MUtJajgxbVhkZ0Z1dkVPU016RGQ0?=
 =?utf-8?B?QmNCc2tZOHQvZFJjdHdoNFpFTVJKQnIrVXFiR2ZrT29VaDNkQStyNzRzM0pj?=
 =?utf-8?B?cDJ4TTFYdHk1ZmRMRk1YcnE4UVBHNUhJOS80VG5XRHVGdTFKak9lQktEWkRZ?=
 =?utf-8?B?QXI4ZERYOWdKL1lhNnJGR1d4MTJWbmIrcjdnQmhlbXIzZWlyREY5a0hWTUtC?=
 =?utf-8?B?QmYwb3k0SGljTG5EMjNTZXNIMDlWaUVmUEt5UHFVY21KNCtuZThRVWZlenVj?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc1fc16-486d-4899-34dd-08dc90a49ad4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 21:13:02.9577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJ0u6qkcGkV7bZEl8690PKMLwCizD1YkcR6CDW2EsChFSryXk5sGloN8/A4l0eOpBURpsXJwEWWViNVaL91OKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
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

Quoting Lucas De Marchi (2024-05-21 16:40:56-03:00)
>On Thu, May 09, 2024 at 12:24:29PM GMT, Gustavo Sousa wrote:
>>For development purposes, sometimes it is useful to have a way of
>>running custom scripts at certain points of test executions. A
>>real-world example I bumped into recently is to collect information from
>>sysfs before and after running each entry of a testlist.
>>
>>While it is possible for the user to handcraft a script that calls each
>>test with the correct actions before and after execution, we can provide
>>a better experience by adding built-in support for running hooks during
>>test execution.
>>
>>That would be even better when adding the same kind of support for
>>igt_runner (which is done in an upcoming change), since the user can
>>also nicely resume with igt_resume with the hook already setup in case a
>>crash happens during execution of the test list.
>>
>>As such provide implement support for hooks, integrate it into
>>igt_core and expose the functionality via --hook CLI option on test
>>executables.
>>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>---
>> .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>> lib/igt_core.c                                | 116 +++-
>> lib/igt_hook.c                                | 499 ++++++++++++++++++
>> lib/igt_hook.h                                |  86 +++
>> lib/meson.build                               |   1 +
>> lib/tests/igt_hook.c                          | 187 +++++++
>> lib/tests/igt_hook_integration.c              | 297 +++++++++++
>> lib/tests/meson.build                         |   2 +
>> 8 files changed, 1180 insertions(+), 9 deletions(-)
>> create mode 100644 lib/igt_hook.c
>> create mode 100644 lib/igt_hook.h
>> create mode 100644 lib/tests/igt_hook.c
>> create mode 100644 lib/tests/igt_hook_integration.c
>>
>>diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/r=
eference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>index 9085eb924e85..11458c68124b 100644
>>--- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>+++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
>>@@ -32,6 +32,7 @@
>>     <xi:include href=3D"xml/igt_fb.xml"/>
>>     <xi:include href=3D"xml/igt_frame.xml"/>
>>     <xi:include href=3D"xml/igt_gt.xml"/>
>>+    <xi:include href=3D"xml/igt_hook.xml"/>
>>     <xi:include href=3D"xml/igt_io.xml"/>
>>     <xi:include href=3D"xml/igt_kmod.xml"/>
>>     <xi:include href=3D"xml/igt_kms.xml"/>
>>diff --git a/lib/igt_core.c b/lib/igt_core.c
>>index 3ff3e0392316..291d891cf884 100644
>>--- a/lib/igt_core.c
>>+++ b/lib/igt_core.c
>>@@ -70,6 +70,7 @@
>>
>> #include "igt_core.h"
>> #include "igt_aux.h"
>>+#include "igt_hook.h"
>> #include "igt_sysfs.h"
>> #include "igt_sysrq.h"
>> #include "igt_rc.h"
>>@@ -241,6 +242,9 @@
>>  * - '*,!basic*' match any subtest not starting basic
>>  * - 'basic*,!basic-render*' match any subtest starting basic but not st=
arting basic-render
>>  *
>>+ * It is possible to run a shell script at certain points of test execut=
ion with
>>+ * "--hook". See the usage description with "--help-hook" for details.
>>+ *
>>  * # Configuration
>>  *
>>  * Some of IGT's behavior can be configured through a configuration file=
.
>>@@ -273,6 +277,8 @@ static unsigned int exit_handler_count;
>> const char *igt_interactive_debug;
>> bool igt_skip_crc_compare;
>>
>>+static struct igt_hook *igt_hook =3D NULL;
>>+
>> /* subtests helpers */
>> static bool show_testlist =3D false;
>> static bool list_subtests =3D false;
>>@@ -338,6 +344,8 @@ enum {
>>         OPT_INTERACTIVE_DEBUG,
>>         OPT_SKIP_CRC,
>>         OPT_TRACE_OOPS,
>>+        OPT_HOOK,
>>+        OPT_HELP_HOOK,
>>         OPT_DEVICE,
>>         OPT_VERSION,
>>         OPT_HELP =3D 'h'
>>@@ -810,6 +818,8 @@ static void common_exit_handler(int sig)
>>                 bind_fbcon(true);
>>         }
>>
>>+        igt_hook_free(igt_hook);
>>+
>>         /* When not killed by a signal check that igt_exit() has been pr=
operly
>>          * called. */
>>         assert(sig !=3D 0 || igt_exit_called || igt_is_aborting);
>>@@ -907,6 +917,8 @@ static void print_usage(const char *help_str, bool ou=
tput_on_stderr)
>>                    "  --interactive-debug[=3Ddomain]\n"
>>                    "  --skip-crc-compare\n"
>>                    "  --trace-on-oops\n"
>>+                   "  --hook [<events>:]<cmd>\n"
>>+                   "  --help-hook\n"
>>                    "  --help-description\n"
>>                    "  --describe\n"
>>                    "  --device filters\n"
>>@@ -1090,6 +1102,8 @@ static int common_init(int *argc, char **argv,
>>                 {"interactive-debug", optional_argument, NULL, OPT_INTER=
ACTIVE_DEBUG},
>>                 {"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_=
CRC},
>>                 {"trace-on-oops",     no_argument,       NULL, OPT_TRACE=
_OOPS},
>>+                {"hook",              required_argument, NULL, OPT_HOOK}=
,
>>+                {"help-hook",         no_argument,       NULL, OPT_HELP_=
HOOK},
>>                 {"device",            required_argument, NULL, OPT_DEVIC=
E},
>>                 {"version",           no_argument,       NULL, OPT_VERSI=
ON},
>>                 {"help",              no_argument,       NULL, OPT_HELP}=
,
>>@@ -1225,6 +1239,24 @@ static int common_init(int *argc, char **argv,
>>                 case OPT_TRACE_OOPS:
>>                         show_ftrace =3D true;
>>                         break;
>>+                case OPT_HOOK:
>>+                        assert(optarg);
>>+                        if (igt_hook) {
>>+                                igt_warn("Overriding previous hook descr=
iptor\n");
>>+                                igt_hook_free(igt_hook);
>>+                        }
>>+                        igt_hook =3D igt_hook_init(optarg, &ret);
>
>this is a pair with igt_hook_free(). I think it's more common to
>call it either _new() or _create() rather than _init().

Okay. Decided to go with igt_hook_create().

>
>
>>+                        if (!igt_hook) {
>>+                                igt_critical("Failed to initialize hook =
data: %s\n",
>>+                                             igt_hook_error_str(ret));
>>+                                ret =3D ret > 0 ? -2 : -3;
>>+                                goto out;
>>+                        }
>>+                        break;
>>+                case OPT_HELP_HOOK:
>>+                        igt_hook_print_help(stdout, "--hook");
>>+                        ret =3D -1;
>>+                        goto out;
>>                 case OPT_DEVICE:
>>                         assert(optarg);
>>                         /* if set by env IGT_DEVICE we need to free it *=
/
>>@@ -1274,9 +1306,24 @@ out:
>>                         exit(IGT_EXIT_INVALID);
>>         }
>>
>>-        if (ret < 0)
>>-                /* exit with no error for -h/--help */
>>-                exit(ret =3D=3D -1 ? 0 : IGT_EXIT_INVALID);
>>+        if (ret < 0) {
>>+                free(igt_hook);
>>+                igt_hook =3D NULL;
>>+
>>+                switch (ret) {
>>+                case -1: /* exit with no error for -h/--help */
>>+                        exit(0);
>>+                        break;
>>+                case -2:
>>+                        exit(IGT_EXIT_INVALID);
>>+                        break;
>>+                case -3:
>>+                        exit(IGT_EXIT_ABORT);
>>+                        break;
>>+                default:
>>+                        assert(0);
>>+                }
>>+        }
>>
>>         if (!igt_only_list_subtests()) {
>>                 bind_fbcon(false);
>>@@ -1284,6 +1331,15 @@ out:
>>                 print_version();
>>                 igt_srandom();
>>
>>+                if (igt_hook) {
>>+                        struct igt_hook_evt hook_evt =3D {
>>+                                .evt_type =3D IGT_HOOK_PRE_TEST,
>>+                                .target_name =3D command_str,
>>+                        };
>>+
>>+                        igt_hook_push_evt(igt_hook, &hook_evt);
>>+                }
>>+
>>                 sync();
>>                 oom_adjust_for_doom();
>>                 ftrace_dump_on_oops(show_ftrace);
>>@@ -1487,6 +1543,16 @@ bool __igt_run_subtest(const char *subtest_name, c=
onst char *file, const int lin
>>         igt_thread_clear_fail_state();
>>
>>         igt_gettime(&subtest_time);
>>+
>>+        if (igt_hook) {
>>+                struct igt_hook_evt hook_evt =3D {
>>+                        .evt_type =3D IGT_HOOK_PRE_SUBTEST,
>>+                        .target_name =3D subtest_name,
>>+                };
>>+
>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>+        }
>>+
>>         return (in_subtest =3D subtest_name);
>> }
>>
>>@@ -1517,6 +1583,16 @@ bool __igt_run_dynamic_subtest(const char *dynamic=
_subtest_name)
>>         _igt_dynamic_tests_executed++;
>>
>>         igt_gettime(&dynamic_subtest_time);
>>+
>>+        if (igt_hook) {
>>+                struct igt_hook_evt hook_evt =3D {
>>+                        .evt_type =3D IGT_HOOK_PRE_DYN_SUBTEST,
>>+                        .target_name =3D dynamic_subtest_name,
>>+                };
>>+
>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>+        }
>>+
>>         return (in_dynamic_subtest =3D dynamic_subtest_name);
>> }
>>
>>@@ -1602,6 +1678,17 @@ __noreturn static void exit_subtest(const char *re=
sult)
>>         struct timespec *thentime =3D in_dynamic_subtest ? &dynamic_subt=
est_time : &subtest_time;
>>         jmp_buf *jmptarget =3D in_dynamic_subtest ? &igt_dynamic_jmpbuf =
: &igt_subtest_jmpbuf;
>>
>>+        if (igt_hook) {
>>+                struct igt_hook_evt hook_evt =3D {
>>+                        .evt_type =3D (in_dynamic_subtest
>>+                                        ? IGT_HOOK_POST_DYN_SUBTEST
>>+                                        : IGT_HOOK_POST_SUBTEST),
>>+                        .result =3D result,
>>+                };
>>+
>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>+        }
>>+
>>         if (!igt_thread_is_main()) {
>>                 igt_thread_fail();
>>                 pthread_exit(NULL);
>>@@ -2274,6 +2361,7 @@ void __igt_abort(const char *domain, const char *fi=
le, const int line,
>> void igt_exit(void)
>> {
>>         int tmp;
>>+        const char *result;
>>
>>         if (!test_with_subtests)
>>                 igt_thread_assert_no_failures();
>>@@ -2318,12 +2406,7 @@ void igt_exit(void)
>>
>>         assert(waitpid(-1, &tmp, WNOHANG) =3D=3D -1 && errno =3D=3D ECHI=
LD);
>>
>>-        if (!test_with_subtests) {
>>-                struct timespec now;
>>-                const char *result;
>>-
>>-                igt_gettime(&now);
>>-
>>+        if (!test_with_subtests || igt_hook) {
>>                 switch (igt_exitcode) {
>>                         case IGT_EXIT_SUCCESS:
>>                                 result =3D "SUCCESS";
>>@@ -2334,6 +2417,12 @@ void igt_exit(void)
>>                         default:
>>                                 result =3D "FAIL";
>>                 }
>>+        }
>>+
>>+        if (!test_with_subtests) {
>>+                struct timespec now;
>>+
>>+                igt_gettime(&now);
>>
>>                 if (test_multi_fork_child) /* parent will do the yelling=
 */
>>                         _log_line_fprintf(stdout, "dyn_child pid:%d (%.3=
fs) ends with err=3D%d\n",
>>@@ -2344,6 +2433,15 @@ void igt_exit(void)
>>                                           result, igt_time_elapsed(&subt=
est_time, &now));
>>         }
>>
>>+        if (igt_hook) {
>>+                struct igt_hook_evt hook_evt =3D {
>>+                        .evt_type =3D IGT_HOOK_POST_TEST,
>>+                        .result =3D result,
>>+                };
>>+
>>+                igt_hook_push_evt(igt_hook, &hook_evt);
>>+        }
>>+
>>         exit(igt_exitcode);
>> }
>>
>>diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>>new file mode 100644
>>index 000000000000..8a39e19e3e5f
>>--- /dev/null
>>+++ b/lib/igt_hook.c
>>@@ -0,0 +1,499 @@
>>+/*
>>+ * Copyright =C2=A9 2024 Intel Corporation
>>+ *
>>+ * Permission is hereby granted, free of charge, to any person obtaining=
 a
>>+ * copy of this software and associated documentation files (the "Softwa=
re"),
>>+ * to deal in the Software without restriction, including without limita=
tion
>>+ * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
>>+ * and/or sell copies of the Software, and to permit persons to whom the
>>+ * Software is furnished to do so, subject to the following conditions:
>>+ *
>>+ * The above copyright notice and this permission notice (including the =
next
>>+ * paragraph) shall be included in all copies or substantial portions of=
 the
>>+ * Software.
>>+ *
>>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
>>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
>>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
>>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
>>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
>>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
>>+ * IN THE SOFTWARE.
>
>
>I think this should follow kernel and some of our igt and just use SPDX.

Done. Thanks.

>
>>+ */
>>+#include <assert.h>
>>+#include <errno.h>
>>+#include <limits.h>
>>+#include <stdbool.h>
>>+#include <stddef.h>
>>+#include <stdint.h>
>>+#include <stdio.h>
>>+#include <stdlib.h>
>>+#include <string.h>
>>+
>>+#include "igt_hook.h"
>>+
>>+/**
>>+ * SECTION:igt_hook
>>+ * @short_description: Support for running a hook script on test executi=
on
>>+ * @title: Hook support
>>+ *
>>+ * IGT provides support for running a hook script when executing tests. =
This
>>+ * support is provided to users via CLI option `--hook` available in tes=
t
>>+ * binaries. Users should use `--help-hook` for detailed usaged descript=
ion of
>>+ * the feature.
>>+ *
>>+ * The sole user of the exposed API is `igt_core`, which calls @igt_hook=
_init()
>>+ * when initializing a test case, then calls @igt_hook_push_evt() for ea=
ch event
>>+ * that occurs during that test's execution and finally calls @igt_hook_=
free()
>>+ * to clean up at the end.
>>+ */
>>+
>>+#define TEST_NAME_INITIAL_SIZE 16
>>+
>>+typedef uint16_t evt_mask_t;
>>+
>>+struct igt_hook {
>>+        evt_mask_t evt_mask;
>>+        char *cmd;
>>+        char *test_name;
>>+        size_t test_name_size;
>>+        char *subtest_name;
>>+        size_t subtest_name_size;
>>+        char *dyn_subtest_name;
>>+        size_t dyn_subtest_name_size;
>>+        char *test_fullname;
>>+};
>>+
>>+enum igt_hook_error {
>>+        IGT_HOOK_EVT_EMPTY_NAME =3D 1,
>>+        IGT_HOOK_EVT_NO_MATCH,
>>+};
>>+
>>+static_assert(IGT_HOOK_NUM_EVENTS <=3D sizeof(evt_mask_t) * CHAR_BIT,
>>+              "Number of event types does not fit event type mask");
>>+
>>+static const char *igt_hook_evt_type_to_name(enum igt_hook_evt_type evt_=
type)
>>+{
>>+        switch (evt_type) {
>>+        case IGT_HOOK_PRE_TEST:
>>+                return "pre-test";
>>+        case IGT_HOOK_PRE_SUBTEST:
>>+                return "pre-subtest";
>>+        case IGT_HOOK_PRE_DYN_SUBTEST:
>>+                return "pre-dyn-subtest";
>>+        case IGT_HOOK_POST_DYN_SUBTEST:
>>+                return "post-dyn-subtest";
>>+        case IGT_HOOK_POST_SUBTEST:
>>+                return "post-subtest";
>>+        case IGT_HOOK_POST_TEST:
>>+                return "post-test";
>>+        case IGT_HOOK_NUM_EVENTS:
>>+                break;
>>+        /* No "default:" case, to force a warning from -Wswitch in case =
we miss
>>+         * any new event type. */
>
>yeah, I like -Wswitch for this purpose, but I don't think we need a
>comment. Instead return something here.
>
>>+        }
>>+        return "?";
>
>and return nothing here=20

Not sure I understand your suggestion. Since we do not have a default
case, we would need this return at the end of the function, no? Without
this return the build fails because of -Werror=3Dreturn-type:

   error: control reaches end of non-void function [-Werror=3Dreturn-type]

Also note that the -Wswitch is not being treated as error with the
current build config.

>
>>+}
>>+
>>+static int igt_hook_parse_hook_str(const char *hook_str, evt_mask_t *evt=
_mask, const char **cmd)
>>+{
>>+        const char *s;
>>+
>>+        if (!strchr(hook_str, ':')) {
>>+                *evt_mask =3D ~0;
>>+                *cmd =3D hook_str;
>>+                return 0;
>>+        }
>>+
>>+        s =3D hook_str;
>>+        *evt_mask =3D 0;
>>+
>>+        while (1) {
>>+                const char *evt_name;
>>+                bool has_match;
>>+                bool is_star;
>>+                enum igt_hook_evt_type evt_type;
>>+
>>+                evt_name =3D s;
>>+
>>+                while (*s !=3D ':' && *s !=3D ',')
>>+                        s++;
>>+
>>+                if (evt_name =3D=3D s)
>>+                        return IGT_HOOK_EVT_EMPTY_NAME;
>>+
>>+                has_match =3D false;
>>+                is_star =3D *evt_name =3D=3D '*' && evt_name + 1 =3D=3D =
s;
>>+
>>+                for (evt_type =3D IGT_HOOK_PRE_TEST; evt_type < IGT_HOOK=
_NUM_EVENTS; evt_type++) {
>>+                        if (!is_star) {
>>+                                const char *this_event_name =3D igt_hook=
_evt_type_to_name(evt_type);
>>+                                size_t len =3D s - evt_name;
>>+
>>+                                if (len !=3D strlen(this_event_name))
>>+                                        continue;
>>+
>>+                                if (strncmp(evt_name, this_event_name, l=
en))
>>+                                        continue;
>>+                        }
>>+
>>+                        *evt_mask |=3D 1 << evt_type;
>
>pre-test,pre-test,pre-test:echo foo
>
>^ shouldn't this cause a warning?

I don't think it shouldn't. There is no harm in passing the same event
type multiple times and I don't see strong reasons to complain about it.

>
>but see below for alternative interface
>
>>+                        has_match =3D true;
>>+
>>+                        if (!is_star)
>>+                                break;
>>+                }
>>+
>>+                if (!has_match)
>>+                        return IGT_HOOK_EVT_NO_MATCH;
>>+
>>+                if (*s++ =3D=3D ':')
>>+                        break;
>>+        }
>>+
>>+        *cmd =3D s;
>>+
>>+        return 0;
>>+}
>>+
>>+static size_t igt_hook_calc_test_fullname_size(struct igt_hook *igt_hook=
) {
>>+        /* The maximum size of test_fullname will be the maximum length =
of
>>+         * "igt@<test_name>@<subtest_name>@<dyn_subtest_name>" plus 1 fo=
r the
>>+         * null byte. */
>>+        return (igt_hook->test_name_size +
>>+                igt_hook->subtest_name_size +
>>+                igt_hook->dyn_subtest_name_size) + 4;
>>+}
>>+
>>+static void igt_hook_update_test_fullname(struct igt_hook *igt_hook)
>>+{
>>+        int i;
>>+        char *s;
>>+        const char *values[3] =3D {
>>+                igt_hook->test_name,
>>+                igt_hook->subtest_name,
>>+                igt_hook->dyn_subtest_name,
>>+        };
>>+
>>+        if (igt_hook->test_name[0] =3D=3D '\0') {
>>+                igt_hook->test_fullname[0] =3D '\0';
>>+                return;
>>+        }
>>+
>>+        s =3D stpcpy(igt_hook->test_fullname, "igt");
>>+        for (i =3D 0; i < 3 && values[i][0] !=3D '\0'; i++) {
>
>                        ^ ARRAY_SIZE()

Decided to fix this with a sentinel value (NULL).

>
>>+                *s++ =3D '@';
>>+                s =3D stpcpy(s, values[i]);
>>+        }
>>+}
>>+
>>+/**
>>+ * igt_hook_init:
>>+ * @hook_str: Hook descriptor string.
>>+ * @error: Pointer to error number.
>>+ *
>>+ * Allocate and initialize an #igt_hook structure.
>>+ *
>>+ * This function parses the hook descriptor @hook_str and initializes th=
e struct
>>+ * to be returned.
>>+ *
>>+ * The hook descriptor comes from the argument to `--hook` of the test
>>+ * executable being run.
>>+ *
>>+ * If not #NULL, @error is used to store a non-zero error number if an e=
rror
>>+ * happens. A human-readable string for that error number can be obtaine=
d with
>>+ * @igt_hook_error_str().
>>+ *
>>+ * Returns: The pointer to the #igt_hook structure on success or #NULL o=
n error.
>>+ */
>>+struct igt_hook *igt_hook_init(const char *hook_str, int *error)
>>+{
>>+        int err;
>>+        evt_mask_t evt_mask;
>>+        const char *cmd;
>>+        struct igt_hook *igt_hook =3D NULL;
>>+
>>+
>>+        err =3D igt_hook_parse_hook_str(hook_str, &evt_mask, &cmd);
>>+        if (err)
>>+                goto out;
>>+
>>+        igt_hook =3D calloc(1, sizeof(*igt_hook));
>>+        igt_hook->evt_mask =3D evt_mask;
>>+
>>+        igt_hook->cmd =3D strdup(cmd);
>>+        if (!igt_hook->cmd) {
>>+                err =3D -errno;
>>+                goto out;
>>+        }
>>+
>>+        igt_hook->test_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>>+        igt_hook->test_name_size =3D TEST_NAME_INITIAL_SIZE;
>>+        igt_hook->subtest_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>>+        igt_hook->subtest_name_size =3D TEST_NAME_INITIAL_SIZE;
>>+        igt_hook->dyn_subtest_name =3D malloc(TEST_NAME_INITIAL_SIZE);
>>+        igt_hook->dyn_subtest_name_size =3D TEST_NAME_INITIAL_SIZE;
>
>up to you, but in this kind of things I tend to prefer the strings in
>the outer struct so we have fewer separate malloc()'s and thus fewer
>chances of leaking them

What would be the "outer struct" in this case?

>
>just calculate the size ahead and then update igt_hook->test_name,
>igt_hook->subtest_name and igt_hook->dyn_subtest_name to point to the righ=
t part.

Hm... Do you mean to have a single memory allocation to keep those three
strings? One issue I see with this approach is the complication when new
names would cause overlap, which would require us to shift stuff when
doing realloc().

>
>>+        igt_hook->test_fullname =3D malloc(igt_hook_calc_test_fullname_s=
ize(igt_hook));
>>+
>>+        igt_hook->test_name[0] =3D '\0';
>>+        igt_hook->subtest_name[0] =3D '\0';
>>+        igt_hook->dyn_subtest_name[0] =3D '\0';
>>+        igt_hook->test_fullname[0] =3D '\0';
>
>with the benefit that then these are covered by the calloc.
>
>up to you.

I'll send the v2 with this part as is for now. We can discuss more if
you'd like.

>
>>+
>>+out:
>>+        if (err) {
>>+                if (error)
>>+                        *error =3D err;
>>+
>>+                igt_hook_free(igt_hook);
>>+
>>+                return NULL;
>>+        }
>>+
>>+        return igt_hook;
>>+}
>>+
>>+/**
>>+ * igt_hook_free:
>>+ * @igt_hook: The igt_hook struct.
>>+ *
>>+ * De-initialize an igt_hook struct returned by @igt_hook_init().
>>+ *
>>+ * This is a no-op if @igt_hook is #NULL.
>>+ */
>>+void igt_hook_free(struct igt_hook *igt_hook)
>>+{
>>+        if (!igt_hook)
>>+                return;
>>+
>>+        free(igt_hook->cmd);
>>+        free(igt_hook->test_name);
>>+        free(igt_hook->subtest_name);
>>+        free(igt_hook->dyn_subtest_name);
>>+        free(igt_hook);
>>+}
>>+
>>+static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook=
, struct igt_hook_evt *evt)
>>+{
>>+        char **name_ptr;
>>+        size_t *size_ptr;
>>+        size_t len;
>>+
>>+        switch (evt->evt_type) {
>>+        case IGT_HOOK_PRE_TEST:
>>+                name_ptr =3D &igt_hook->test_name;
>>+                size_ptr =3D &igt_hook->test_name_size;
>>+                break;
>>+        case IGT_HOOK_PRE_SUBTEST:
>>+                name_ptr =3D &igt_hook->subtest_name;
>>+                size_ptr =3D &igt_hook->subtest_name_size;
>>+                break;
>>+        case IGT_HOOK_PRE_DYN_SUBTEST:
>>+                name_ptr =3D &igt_hook->dyn_subtest_name;
>>+                size_ptr =3D &igt_hook->dyn_subtest_name_size;
>>+                break;
>>+        default:
>>+                return;
>>+        }
>>+
>>+        len =3D strlen(evt->target_name);
>>+        if (len + 1 > *size_ptr) {
>>+                size_t fullname_size;
>>+
>>+                *size_ptr *=3D 2;
>>+                *name_ptr =3D realloc(*name_ptr, *size_ptr);
>>+
>>+                fullname_size =3D igt_hook_calc_test_fullname_size(igt_h=
ook);
>>+                igt_hook->test_fullname =3D realloc(igt_hook->test_fulln=
ame, fullname_size);
>>+        }
>>+
>>+        strcpy(*name_ptr, evt->target_name);
>>+        igt_hook_update_test_fullname(igt_hook);
>>+}
>>+
>>+static void igt_hook_update_test_name_post_call(struct igt_hook *igt_hoo=
k, struct igt_hook_evt *evt)
>>+{
>>+        switch (evt->evt_type) {
>>+        case IGT_HOOK_POST_TEST:
>>+                igt_hook->test_name[0] =3D '\0';
>>+                break;
>>+        case IGT_HOOK_POST_SUBTEST:
>>+                igt_hook->subtest_name[0] =3D '\0';
>>+                break;
>>+        case IGT_HOOK_POST_DYN_SUBTEST:
>>+                igt_hook->dyn_subtest_name[0] =3D '\0';
>>+                break;
>>+        default:
>>+                return;
>>+        }
>>+
>>+        igt_hook_update_test_fullname(igt_hook);
>>+}
>>+
>>+static void igt_hook_update_env_vars(struct igt_hook *igt_hook, struct i=
gt_hook_evt *evt)
>>+{
>>+        setenv("IGT_HOOK_EVENT", igt_hook_evt_type_to_name(evt->evt_type=
), 1);
>>+        setenv("IGT_HOOK_TEST_FULLNAME", igt_hook->test_fullname, 1);
>>+        setenv("IGT_HOOK_TEST", igt_hook->test_name, 1);
>>+        setenv("IGT_HOOK_SUBTEST", igt_hook->subtest_name, 1);
>>+        setenv("IGT_HOOK_DYN_SUBTEST", igt_hook->dyn_subtest_name, 1);
>>+        setenv("IGT_HOOK_RESULT", evt->result ?: "", 1);
>>+}
>>+
>>+/**
>>+ * igt_hook_push_evt:
>>+ * @igt_hook: The igt_hook structure.
>>+ * @evt: The event to be pushed.
>>+ *
>>+ * Push a new igt_hook event.
>>+ *
>>+ * This function must be used to register a new igt_hook event. Calling =
it will
>>+ * cause execution of the hook script if the event type matches the filt=
ers
>>+ * provided during initialization of @igt_hook.
>>+ */
>>+void igt_hook_push_evt(struct igt_hook *igt_hook, struct igt_hook_evt *e=
vt)
>>+{
>>+        typeof(igt_hook->evt_mask) evt_bit =3D (1 << evt->evt_type);
>>+
>>+        igt_hook_update_test_name_pre_call(igt_hook, evt);
>>+
>>+        if ((evt_bit & igt_hook->evt_mask)) {
>>+                igt_hook_update_env_vars(igt_hook, evt);
>>+                system(igt_hook->cmd);
>
>this polutes the env for the current process just so the child process
>has those env vars. We could either duplicate the environ on startup and
>use execle(), or to be simpler, just make sure to zap our env just after
>running the command.  This avoids undesirable behavior because we didn't
>clean up the environ.

Yeah, that makes sense. Decided to go with:

		struct igt_helper_process proc =3D {};

		igt_fork_helper(&proc) {
			igt_hook_update_env_vars(igt_hook, evt);
			system(igt_hook->cmd);
		}
		igt_wait_helper(&proc);

This does end up creating a "grandchild" process because we are still
using system(), but it keeps the code simple.

>
>
>>+        }
>>+
>>+        igt_hook_update_test_name_post_call(igt_hook, evt);
>>+}
>>+
>>+/**
>>+ * igt_hook_error_str:
>>+ * @error: Non-zero error number.
>>+ *
>>+ * Return a human-readable string containing a description of an error n=
umber
>>+ * generated by one of the `igt_hook_*` functions.
>>+ *
>>+ * The string will be the result of strerror() for errors from the C sta=
ndard
>>+ * library or a custom description specific to igt_hook.
>>+ */
>>+const char *igt_hook_error_str(int error)
>>+{
>>+        if (!error)
>>+                return "No error";
>>+
>>+        if (error > 0) {
>>+                enum igt_hook_error hook_error =3D error;
>>+
>>+                switch (hook_error) {
>>+                case IGT_HOOK_EVT_EMPTY_NAME:
>>+                        return "Empty name in event descriptor";
>>+                case IGT_HOOK_EVT_NO_MATCH:
>>+                        return "Event name in event descriptor does not =
match any event type";
>>+                default:
>>+                        return "Unknown error";
>>+                }
>>+        } else {
>>+                return strerror(-error);
>>+        }
>>+}
>>+
>>+/**
>>+ * igt_hook_print_help:
>>+ * @f: File pointer where to write the output.
>>+ * @option_name: Name of the CLI option that accepts the hook descriptor=
.
>>+ *
>>+ * Print a detailed user help text on hook usage.
>>+ */
>>+void igt_hook_print_help(FILE *f, const char *option_name)
>>+{
>>+        fprintf(f, "\
>>+The option %1$s receives as argument a \"hook descriptor\" and allows th=
e\n\
>>+execution of a shell command at different points during execution of tes=
ts. Each\n\
>>+such a point is called a \"hook event\".\n\
>>+\n\
>>+Examples:\n\
>>+\n\
>>+  # Prints hook-specic env vars for every event.\n\
>>+  %1$s 'printenv | grep ^IGT_HOOK_'\n\
>>+\n\
>>+  # Equivalent to the above. Useful if command contains ':'.\n\
>>+  %1$s '*:printenv | grep ^IGT_HOOK_'\n\
>>+\n\
>>+  # Adds a line to out.txt containing the result of each test case.\n\
>>+  %1$s 'post-test:echo $IGT_HOOK_TEST_FULLNAME $IGT_HOOK_RESULT >> out.t=
xt'\n\
>>+\n\
>>+The accepted format for a hook descriptor is `[<events>:]<cmd>`, where:\=
n\
>>+\n\
>>+  - <events> is a comma-separated list of event descriptors, which defin=
es the\n\
>>+    set of events be tracked. If omitted, all events are tracked.\n\
>>+\n\
>
>
>I think the interface git-rebase is more natural for this kind of
>thing. You have 2 concepts: event and hook with n:1 relationship
>because of the interface chosen.
>
>Why not simply use 1:1 and then allow the program to have multiple
>hooks?

Yep, I thought about doing it, but was a bit lazy and decided to have a
single hook string instead of an array :-P

>
>
>Just in git-rebase we do  `git rebase -x "echo foo" -x "echo bar"` and
>the commands are appended, we could have:
>
>igt_runner -x 'pre-test:echo foo' -x 'post-test:echo bar'. Then you only
>warn when you user incorrectly used the same hook type.  I think it

I like this.

I personally do not see a problem with having multiple hook commands for
the same event. We would just end up running each of them in turn.

I guess we could basically extend the current code to accept multiple
`--hook` options, in the same format as with the current implementation
here. That would allow something like

  my_test --hook pre-test,pre-subtest:some-command-common-to-both \
          --hook post-test:some-command-only-for-post-test

I'll work on this.

>would be more natural to eventually embed the support on a test list
>(with the exception we'd not warn anymore), with something like:
>
>hook@pre-test@echo foo
>hook@post-test@echo bar
>igt@...
>igt@...
>igt@...
>hook@pre-test@ ....
>igt@...
>

Yeah. Maybe in a future series :-)

Thanks for all the feedback!

--
Gustavo Sousa

>
>
>
>
>>+  - <cmd> is a shell command to be executed on the occurrence each track=
ed\n\
>>+    event. If the command contains ':', then passing <events> is require=
d,\n\
>>+    otherwise part of the command would be treated as an event descripto=
r.\n\
>>+\n\
>>+", option_name);
>>+
>>+        fprintf(f, "\
>>+An \"event descriptor\" is either the name of an event or the string '*'=
. The\n\
>>+latter matches all event names. The list of possible event names is prov=
ided\n\
>>+below:\n\
>>+\n\
>>+");
>>+
>>+        for (enum igt_hook_evt_type et =3D 0; et < IGT_HOOK_NUM_EVENTS; =
et++) {
>>+                const char *desc;
>>+
>>+                switch (et) {
>>+                case IGT_HOOK_PRE_TEST:
>>+                        desc =3D "Occurs before a test case starts.";
>>+                        break;
>>+                case IGT_HOOK_PRE_SUBTEST:
>>+                        desc =3D "Occurs before the execution of a subte=
st.";
>>+                        break;
>>+                case IGT_HOOK_PRE_DYN_SUBTEST:
>>+                        desc =3D "Occurs before the execution of a dynam=
ic subtest.";
>>+                        break;
>>+                case IGT_HOOK_POST_DYN_SUBTEST:
>>+                        desc =3D "Occurs after the execution of a dynami=
c subtest.";
>>+                        break;
>>+                case IGT_HOOK_POST_SUBTEST:
>>+                        desc =3D "Occurs after the execution of a subtes=
t.";
>>+                        break;
>>+                case IGT_HOOK_POST_TEST:
>>+                        desc =3D "Occurs after a test case has finished.=
";
>>+                        break;
>>+                default:
>>+                        desc =3D "MISSING DESCRIPTION";
>>+                }
>>+
>>+                fprintf(f, "  %s\n  %s\n\n", igt_hook_evt_type_to_name(e=
t), desc);
>>+        }
>>+
>>+        fprintf(f, "\
>>+For each event matched by <events>, <cmd> is executed as a shell command=
. The\n\
>>+exit status of the command is ignored. The following environment variabl=
es are\n\
>>+available to the command:\n\
>>+\n\
>>+  IGT_HOOK_EVENT\n\
>>+  Name of the current event.\n\
>>+\n\
>>+  IGT_HOOK_TEST_FULLNAME\n\
>>+  Full name of the test in the format `igt@<test>[@<subtest>[@<dyn_subte=
st>]]`.\n\
>>+\n\
>>+  IGT_HOOK_TEST                   \n\
>>+  Name of the current test.\n\
>>+\n\
>>+  IGT_HOOK_SUBTEST\n\
>>+  Name of the current subtest. Will be the empty string if not running a=
\n\
>>+  subtest.\n\
>>+\n\
>>+  IGT_HOOK_DYN_SUBTEST\n\
>>+  Name of the current dynamic subtest. Will be the empty string if not r=
unning a\n\
>>+  dynamic subtest.\n\
>>+\n\
>>+  IGT_HOOK_RESULT\n\
>>+  String representing the result of the test/subtest/dynamic subtest. Po=
ssible\n\
>>+  values are: SUCCESS, SKIP or FAIL. This is only applicable on \"post-*=
\"\n\
>>+  events and will be the empty string for other types of events.\n\
>>+\n\
>>+");
>>+}
>>diff --git a/lib/igt_hook.h b/lib/igt_hook.h
>>new file mode 100644
>>index 000000000000..6fef7254a317
>>--- /dev/null
>>+++ b/lib/igt_hook.h
>>@@ -0,0 +1,86 @@
>>+/*
>>+ * Copyright =C2=A9 2024 Intel Corporation
>>+ *
>>+ * Permission is hereby granted, free of charge, to any person obtaining=
 a
>>+ * copy of this software and associated documentation files (the "Softwa=
re"),
>>+ * to deal in the Software without restriction, including without limita=
tion
>>+ * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
>>+ * and/or sell copies of the Software, and to permit persons to whom the
>>+ * Software is furnished to do so, subject to the following conditions:
>>+ *
>>+ * The above copyright notice and this permission notice (including the =
next
>>+ * paragraph) shall be included in all copies or substantial portions of=
 the
>>+ * Software.
>>+ *
>>+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
>>+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
>>+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
>>+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
>>+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
>>+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
>>+ * IN THE SOFTWARE.
>>+ */
>
>ditto on SPDX
>
>
>Lucas De Marchi
