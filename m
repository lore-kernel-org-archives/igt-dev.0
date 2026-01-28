Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F79D35662
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 07:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C7B10E62F;
	Wed, 28 Jan 2026 07:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2CzSlZc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF0610E62B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769586132; x=1801122132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ElnjyZt21vm84LILAXqwuIzuRyEpqxE5x2PTR5UkcNY=;
 b=A2CzSlZcfGzBfGPJX0Ia62b6jfnzrfHKHsz5Y73KuZ8lQ4tO0meDYayg
 Gxy3o6dc1DEo6SPzRzvb6p8wotdiGsxOihs0w+lkbd5Ywafe8wSN+7u1g
 YQGLcEPL3Vv5xG9wkQZyddp7yAipoiMzKJK3x/LkG9c9lPL2zcgKppqOj
 gbfqqh/OozmgZ2lJD26dBu8+EbDuE9pmOsvR6SjBBy0yqyCqveP246NXh
 owMSen9YKD/n/TH4g8O6tcmhUluMTAE70g9EfPx+J6l5dl1ujuE2FcIEo
 bEJhBN18HpsbtTtNVLBqtWaFwlrT3mG7M+1ZthQxOiaX3WFibzB3GqhyN A==;
X-CSE-ConnectionGUID: 1LR04CF8QxCJP2RI4us64Q==
X-CSE-MsgGUID: XjfMuWNySYCmzGycX2fAJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70880060"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70880060"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:42:12 -0800
X-CSE-ConnectionGUID: mlLxLueYQfS/EaChc7cXUQ==
X-CSE-MsgGUID: c2SsxC33RrueWNGycEuzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="231149257"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 23:42:11 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:42:11 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 23:42:11 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 23:42:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHg/Av80hx8t4WePoaiIvoAjg+4iVzP/uK65weO6a9a7tXZKvzizT8CYiDq8yY/S85yK3mQk86w4AvbXoF3baHQuBI58/3qdenuEFihuNh5K0Uv/LJ+EpsllY0PjbThFFx5GfK9ND4vSUkEr51zKgwyNDLM+Hez+T9D+jY3f4MGKghdgITbXdcM5s/FeooNH2ZqC0kZ+L4aXo2glsEnoSdNhJDZGxPQEHoRQD/C3x6P9hapXtbIdXCXGlsHdRNS8hoq8u2neB6gH4KrwV+XoMjKNZQNjEj2hhzxmhMNumdjs6Mhv2ElwFHfEX8HaS3GM+NctEvBLMZlhX8PYGpmSIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPnj/Kkb8BFpUKewX3SjpOK3PKipF5CEy2tKGg8TWlQ=;
 b=cLwNMl0wnjuHnGHmms7eVBk8aiDXPkHbr0D8YdkP2oPRhEaBBjBAnuCxaG50jvM04b40/oiK30MtgzJL2Ii0HooH7El4bhBlga9rot4QNJ7Ybx5PBiXn1TraRkXrAhGLstjP8p+2lhQ8QBJMuouWx33p6MrTeiOYWnNORQnq6QaQAbDhaJoV2hRIXUb0nKF+uYXdZVYFwivlVGY7m+sl8oxNlgRFiEMZbLJBicxpVk29cVk+0Jl9I1nRim8DR8Mu1VDo7Yioq6EGJvBebMHGUU3dqqu40nI4uFHzSZFOhyC2H3TKjbKWKUtwGNDNlqgkl7hzQwlYLNEELXhG013E7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH3PPF801A91A7D.namprd11.prod.outlook.com (2603:10b6:518:1::d34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 07:41:57 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 07:41:57 +0000
Message-ID: <3797dd31-e7bc-45ec-a3cf-1f28b7180229@intel.com>
Date: Wed, 28 Jan 2026 08:41:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/igt_pci: Add generic PCI driver override
 and bind/unbind helpers
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.winiarski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260115131812.256678-1-marcin.bernatowicz@linux.intel.com>
 <20260115131812.256678-3-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20260115131812.256678-3-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIYP296CA0007.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::12) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH3PPF801A91A7D:EE_
X-MS-Office365-Filtering-Correlation-Id: 148473a0-caeb-498a-a223-08de5e40b6e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmdUTXN5VjMyQ3M1cXlIVEpSTXpRd1NRdzJhRzA1cVpPeUtEWWVnVXBndVpk?=
 =?utf-8?B?aTNGZGUxQjlXSk5rbzVYUU9aV3l1dFdLRjZ3L0NQRjNIMmNoVXdNQ29rYko2?=
 =?utf-8?B?LzVHRC9tb1hLaWYrbVRYYVRjVmRBZVZyTDFzandyWmxnKzZwVGhBcHNDNFM3?=
 =?utf-8?B?enpGT3pDSDQ4NjhlcGdseVVYNTlZNUtGWHBwSDNrZ2g3UGtCQzlBS09iQVRs?=
 =?utf-8?B?bnpZZlRLYWZxLzFuV2pPMU5BcHRMZkwwMTRkZzhRaTc5U1VlNWVBVzdvS2Q4?=
 =?utf-8?B?cWREQlM4citYMC9qTyt2ZWxwSlBRQUJPb0kxbkw2MFNvRGsxb2J2N1gyWHlD?=
 =?utf-8?B?bGZHWmFnK3BzQkMrYytYakMrL0NWWExxT1M3ZHR0VGh2cjAwSG5Zd0lvVk40?=
 =?utf-8?B?KzMyVndkZllCbENxWlFhcnJaSk5BZnRtYklkdDQ1T1BYYkgxR0pkaDJnWE5T?=
 =?utf-8?B?bzlGR2xmTHJDMEVLQ2VlaEhtaUFyL1RyM1lMMEpGNU8rVHQ3QjJCUlN6N0tN?=
 =?utf-8?B?S29PSlZGR3FKbDNuaTF1ZG8rZVB5dlBvcFh1Z0Q0YmRTZVMxblBEdHhxWW91?=
 =?utf-8?B?WnhTK085UVdPR01VT1JnWC8wZi9rM1lpdmtYc05CZ1Y5ejZkdFFaMGUzbGRl?=
 =?utf-8?B?cjg4MHRscDJMTTU1MDgxN2FXY2RwTHNUNHc2QWp2T2FKL0VER2F6QmhwbGty?=
 =?utf-8?B?R21rRXVKR081K3lHK2N5VjlLbjlzUm10VzFMRWlwSzVxODZZRldlR3dkcy9C?=
 =?utf-8?B?c0NRbTR1YTVhT3RNcTVNRWtsNWJRNWtqUXIzVHZkMExEZkJuR3k5YkpEclB6?=
 =?utf-8?B?aDJJYVZkNStJU1JmUE9mWVBDejlCWWY2dmVzaWNEL0N3NXFrekoxdVl2Mzln?=
 =?utf-8?B?U20yUnd2eVhMNzN1cDBJanNIVUhzUHZqUjVzcklhaCs3Z0szR3dSRXRvcXlJ?=
 =?utf-8?B?R29UWEhlVEJ1V2hpTW5JQ01mZUcxVFFkQzdqQ2t4SzZnMmtjaTVBTklCSWVq?=
 =?utf-8?B?clRuQm4yc0FMblUvT3Z0K3dhaHdhYURMc3pBdjZLcERNOHhHd080TXhsLzJH?=
 =?utf-8?B?ZUZWVTZYOGNBcFEvN0VLeG9wTit3cnhDRGxuUmFiczNwYmE3MkNDZlFsMTFo?=
 =?utf-8?B?K3AxUERNbXZ5R2cvYVdvRE9mSVlhU3NxeWs4YjZnKzFsejV1VTVlclpzdU5p?=
 =?utf-8?B?ZGk2VnVoam8wTnRIanp4ekROV1o5SVQrdUJoNVJsaUl2bTA4cEMyKzFwS0NE?=
 =?utf-8?B?RVVhMzg3UnNKZ2VqVWpRMis0Nk81WFlON2ZQZFNaV0NiYmpGaDArY0lVWEVC?=
 =?utf-8?B?dkttNE8xU0VTSlVCUEhVV1plREMyTmlSWDJLdWVwK203TW1pRklLZWVNb2dp?=
 =?utf-8?B?bnpyaEwyTEU4cFRaUnovRGZLSFY4UUxrdkFzMW9wdjdIWk1xdURSKzJMV2dW?=
 =?utf-8?B?Nzk0TXpEMzhGZmFLZGtmQ0YxNVJpWjJpbFFwUVdUanltZDNrVWRUd3ZldGJj?=
 =?utf-8?B?ejB6QndMOFdZaDVaRzl1TDY3bElFS2lyVFgrWG5lSDRaSlJFNzJzbnZsdTh3?=
 =?utf-8?B?dHlPRFU3eWJRb1JqaENBT3prRmFMRmg3OHRQY2paVW03a2RGYU9ZMG1pT0k1?=
 =?utf-8?B?NXJwbVF3TUNwWVZnSk0zNDFleGNtVnVjT0FsTHFGSmhkS0ZMVjRPK0x1NnBK?=
 =?utf-8?B?V3hSTTBtQWx1ZDFnTTZaVGgzc3ptQjFwaGFIby9uTjNob1FmNGJiMGhoVm9o?=
 =?utf-8?B?Tk11SllaSXdnSVBCcEZ4UWswbUUrTmcrbmZCVi90aDkxRGJWd2lsdzlPZ1hi?=
 =?utf-8?B?c210aEw1d0QwamFITmNvOWF2UGJkYlhMRGw4d0FldG1YcUV2QVRLS0ZRNkpD?=
 =?utf-8?B?UXhCd0I1VlVCWmk4V3dFSlpHK0VwbzEwQ20rUUs4OW5aRlQ3OURyM0YyUmNB?=
 =?utf-8?B?S3dlY1E3UWFaTXNPL2pidE5LMU9YRzR4ZDMxNzB0MisrMGZYMHgrTzVoRWc3?=
 =?utf-8?B?NlZ5SUw0dnRZMm9ud0d3UVRCbjRnUkFiN1hseGo3eHhGcXZoTjhuZTZQUDlM?=
 =?utf-8?B?djRucVNZRlE5bE93S3BiWmhROGFraGxNeWNhNW81cGRVRDl2bjcxdzQyOC9z?=
 =?utf-8?Q?+bWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVFaZUpuWjNqRjF3TGtIMU1TQUtneFhCRENZdWRtVGJ2WjJQQzZVM3luRjRF?=
 =?utf-8?B?NUpKdVZKNko5OGJHUUZrVGhoc3VCcXdGTkIrNDlWdmprSHBoNWdVSjlhVlRT?=
 =?utf-8?B?V3VKbE5TNGQ1SmhVekNTNHlFV0xzaVBTZDFWRmFseFZEVElWdUZsZkpuNGUr?=
 =?utf-8?B?MEdHOVlFbnlScU5SdnhFV1Nud2xyTFpDWUlQREpVc1oxU1ZxMTU5bXZnRHYw?=
 =?utf-8?B?VXREY3Rxa05YdnkrR0JGRXdSYlc0SHVvN0oxbUJ3aTQ3WjlvS25FSEtSMzNS?=
 =?utf-8?B?S0V2WVhiL01UaGV1OExMdktaM0dTUDJtVzVoVHA2MERLbFBZbUZDeGMvNE1p?=
 =?utf-8?B?ejd1UWtvQlpuNHJOeHl0UlUxZ2xFQWxIMHdxeUYyQWN2Wnk5YlQwMmtvL3JY?=
 =?utf-8?B?Sk9UdjlZOUgydjFkRXNveis2ZjhtQnBrMzQxdzBSYlNGRnVOdEpKYkhRTGc0?=
 =?utf-8?B?N3NHWVh6TTlnQVU5VWRCbW1lWXY5S0JwR0Z1R0R4Wko2UU5ydmNEclZ2Q0ps?=
 =?utf-8?B?bHArRUlCRHdNdVlGRS83VXcyRXVmWmpMbEhGVjY4WFRXNE1EN2ZuYzljRG1k?=
 =?utf-8?B?NXh3QlNrKzVMNHVKQVEyYzc1eloxTkdUaExjWnVuZmgyUUd0SktiMEJ0b1J5?=
 =?utf-8?B?M2w4Y0ZlYkdJckxsYkRzMnY4ajBOOUVUSTRJNE82WHFMSno3SG1Leno5UEcv?=
 =?utf-8?B?VFhVMnlYQ0hVbVI3NlhWaHZEMUREQVhxa1dvOEFOZGNUZjBxQTFzYlFCZGtY?=
 =?utf-8?B?OVVLb29kOWIzUWdWS2tqRHhwSUc1REF5RnFCR1Y2dTRQQWQ1eGNSNS8zckcw?=
 =?utf-8?B?bWlzMTkxZ1krVi9OcjM3R1BFbHN2T3dtRFk1czZ5TTk2bWRXemZmU1VhUnhL?=
 =?utf-8?B?OUxraW1DMWxEaFN6NVdrdEJEVGJmeDgvODVoOW0rVTVidnlrL3EyQjhKRXhV?=
 =?utf-8?B?eWZzcVhPSWxpSXF4QS80UjJwYnlvcDJQOVc1c1VjL0E2eDBVZ1ZKOWptMFV5?=
 =?utf-8?B?T2tqTnFxUllVSkZBSGhSRnZZTHNBdXZ5bHJENjgzRUlQVjFLTnVQUjgwWHJm?=
 =?utf-8?B?U29xWVJuNHdUSkpaSVVFNzhkck05TXJhejgvKzNUb1NSbjJSaVRsSzR2WGR1?=
 =?utf-8?B?cjJEbHp3T2dmeDlZQm8rRWNlNnVFUTB4aWhzN3JGc0FXdWlIRDlnQTNIbDFN?=
 =?utf-8?B?VnpmZ29GbFozd0xqR3JQVEFlZVZWbkZnVlZub0dQYnZLTVlmeVBzZ0hEclNp?=
 =?utf-8?B?enBXQktvYStLZGFJZE9rK1VPWTBmY21uUVd2RC9oU0RNODJFYW1Yd3NiRE03?=
 =?utf-8?B?aWVCNkR0TUgvK0pKbUZXVXlYSSthbWYvcTBEaXhGS2tpS2tWRE9kYlphdDB6?=
 =?utf-8?B?akdvbHVzeE5kQWk5TXQyZTVvRVJoK2NkaUE4cU1qZndFN0k1VmlWamo3WUpY?=
 =?utf-8?B?U0pqRTUyUEpvak8zVTFiQ21BcEUxTHR1bkJ2V3VxcWZnSzNYak5nUVV6Y3p4?=
 =?utf-8?B?M1RLZk90WSsxQkswb1BOekdPR1kxNndHTlJjalRjRnpRMCtScGJRS1AyaUxk?=
 =?utf-8?B?eU5GZjNLaHIybFZLWmpPckRUMTIzekQ0TGsraHRxa0RqZXB1cXR1S0dHZWd2?=
 =?utf-8?B?WXVrRmhCazhqcXU4c0M4ZEVueUV0cEtnQkp0VGNxTnp1K2xLdDE0Ly9qclpx?=
 =?utf-8?B?b0JoRVlNL3RkZG9WSmZrQ1dBbUZPek9GeGVoUzhqQ0hpd3k1QXNEaSswNzBS?=
 =?utf-8?B?V2dtZDNPcHV2c1hseSt6SG5YM1Y1MWFWblFONUpEb2pDSkxTZW1TTUJ2UGdq?=
 =?utf-8?B?azlrU1BBT1VoRkJzcHJzd2MxZTJyaTVyMzdBU3V2V1k0MUtDVE1JT1o1Tmc3?=
 =?utf-8?B?eHNZWHZFSXZWMkE0YnlBUWJyMlZtUUE5VzlJYkRXVmF4RXhkdzBCT2FjZmJt?=
 =?utf-8?B?TzJhT3MwZzhiQ0J5OG53Zi91M3Z5bHZmYUxJUXFac3N1OUhleDdqSmVkWEhT?=
 =?utf-8?B?NFEvSm5BV1hsdUNscjYycnd0ekRQMFhVWXFXMXh3VkRuNVJQUVN2a2t4N2J3?=
 =?utf-8?B?ZVM5Y3lzYkJCMVk5Uno0czR0WFRZY01Bd0lMcDVuK013eUw2dFd2TFF0a2hL?=
 =?utf-8?B?MkVOL0N1TXFnUWxDblQ0N0EwaUpsTkJrQU5nU205cW9teEltdTZhT3FEbVlE?=
 =?utf-8?B?bkFJSnF3d1phQXRiRTk3MG1pbUFOV1U4WStkdzc0ZVNXamJCS0pGY3dTUXQ3?=
 =?utf-8?B?SnlHbGUrdUJNSXViTkpjRjBPeEc4d3JaMXBkZWVjSDF4RU8rdERySFNjNjBZ?=
 =?utf-8?B?dDBNeGVMc0wzZ2RUVEdvV2NLZjNaZ0lXZzd0MUc1SjdLWHhqVWIzQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148473a0-caeb-498a-a223-08de5e40b6e3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 07:41:57.5240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgXr+I06XurCIeO/xEOnFOf/tH3YsacyD9uBPdDYzM/30yrKbjcRwxhfLINwHgdYYMR+0AeAF9zYS2vDoDXLWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF801A91A7D
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


On 1/15/2026 14:18, Marcin Bernatowicz wrote:
> Add generic helpers for controlling PCI driver binding via sysfs.
>
> The new APIs provide driver- and device-centric primitives for:
>    - setting and clearing driver_override
>    - triggering PCI driver reprobe
>    - binding and unbinding devices to a specific PCI driver
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   lib/igt_pci.c | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_pci.h |   8 ++
>   2 files changed, 236 insertions(+)
>
> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> index 61aaf939d..d4236ec5b 100644
> --- a/lib/igt_pci.c
> +++ b/lib/igt_pci.c
> @@ -3,9 +3,15 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include <ctype.h>
> +#include <dirent.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
>   #include <pciaccess.h>
>   #include "igt_core.h"
>   #include "igt_pci.h"
> +#include "igt_sysfs.h"
>   
>   static int find_pci_cap_offset_at(struct pci_device *dev, enum pci_cap_id cap_id,
>   				  int start_offset)
> @@ -51,3 +57,225 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
>   {
>   	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
>   }
> +
> +static int open_pci_driver_dir(const char *driver)
> +{
> +	char path[PATH_MAX];
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
> +	return open(path, O_RDONLY | O_CLOEXEC);
> +}
> +
> +/**
> + * igt_pci_device_unbind:
> + * @pci_slot: BDF like "0000:01:00.0"
> + *
> + * Unbind @pci_slot from its currently bound driver, if any.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_device_unbind(const char *pci_slot)
> +{
> +	char path[PATH_MAX];
> +	int dirfd;
> +	int ret;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/driver", pci_slot);
> +	dirfd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (dirfd < 0)
> +		return 0; /* already unbound */
> +
> +	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_bind:
> + * @driver: PCI driver name under /sys/bus/pci/drivers/<driver>
> + * @pci_slot: device to bind
> + *
> + * Bind @pci_slot to @driver. Driver must be present/loaded.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_bind(const char *driver, const char *pci_slot)
> +{
> +	int dirfd, ret;
> +
> +	dirfd = open_pci_driver_dir(driver);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	ret = igt_sysfs_set(dirfd, "bind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_unbind:
> + * @driver: PCI driver name
> + * @pci_slot: device to unbind
> + *
> + * Unbind @pci_slot from @driver.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot)
> +{
> +	int dirfd, ret;
> +
> +	dirfd = open_pci_driver_dir(driver);
> +	if (dirfd < 0)
> +		return -errno;
> +
> +	ret = igt_sysfs_set(dirfd, "unbind", pci_slot) ? 0 : -errno;
> +	close(dirfd);
> +
> +	return ret;
> +}
> +
> +/**
> + * igt_pci_driver_unbind_all:
> + * @driver: PCI driver name
> + *
> + * Unbind all devices currently bound to @driver.
> + * Returns 0 on success, or a negative errno-like value.
> + */
> +int igt_pci_driver_unbind_all(const char *driver)
> +{
> +	char path[PATH_MAX];
> +	DIR *dir;
> +	struct dirent *de;
> +	int driver_fd;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/drivers/%s", driver);
> +	dir = opendir(path);
> +	if (!dir)
> +		return -errno;
> +
> +	driver_fd = dirfd(dir);
> +
> +	while ((de = readdir(dir))) {
> +		bool ok;
> +
> +		/* BDF symlinks are like "0000:01:00.0" and start with digit */
> +		if (de->d_type != DT_LNK || !isdigit(de->d_name[0]))
> +			continue;
> +
> +		ok = igt_sysfs_set(driver_fd, "unbind", de->d_name);
> +		if (!ok) {
> +			int err = -errno;
> +
> +			closedir(dir);
> +			return err;
> +		}
> +	}
> +
> +	closedir(dir);
> +	return 0;
> +}
> +
> +/**
> + * igt_pci_set_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: PCI driver name to force-bind (e.g. "xe-vfio-pci"), or
> + *          NULL / empty string to clear an existing override
> + *
> + * Set or clear the PCI driver_override for @pci_slot via sysfs.
> + *
> + * This does not trigger driver reprobe by itself. Call
> + * igt_pci_probe_drivers() afterwards to apply the override.
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_set_driver_override(const char *pci_slot, const char *driver)
> +{
> +	char devpath[PATH_MAX];
> +	int dev;
> +	bool ok;
> +
> +	snprintf(devpath, sizeof(devpath), "/sys/bus/pci/devices/%s", pci_slot);
> +	dev = open(devpath, O_DIRECTORY | O_RDONLY);
> +	if (dev < 0)
> +		return -errno;
> +
> +	ok = igt_sysfs_set(dev, "driver_override", driver ? driver : "");
> +	close(dev);
> +
> +	return ok ? 0 : -errno;
> +}
> +
> +/**
> + * igt_pci_probe_drivers:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + *
> + * Trigger PCI driver reprobe for @pci_slot by writing to
> + * /sys/bus/pci/drivers_probe.
> + *
> + * This causes the kernel to attempt binding the device, honoring any
> + * driver_override previously set.
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_probe_drivers(const char *pci_slot)
> +{
> +	int pci;
> +	bool ok;
> +
> +	pci = open("/sys/bus/pci", O_DIRECTORY | O_RDONLY);
> +	if (pci < 0)
> +		return -errno;
> +
> +	ok = igt_sysfs_set(pci, "drivers_probe", pci_slot);
> +	close(pci);
> +
> +	return ok ? 0 : -errno;
> +}
> +
> +/**
> + * igt_pci_bind_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @driver: PCI driver name to bind (must not be NULL or empty)
> + *
> + * Bind @pci_slot to @driver using the driver_override mechanism.
> + *
> + * This helper sets driver_override and immediately triggers driver
> + * reprobe so that the device is bound to the requested driver.
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_bind_driver_override(const char *pci_slot, const char *driver)
> +{
> +	int ret;
> +
> +	if (!driver || !driver[0])
> +		return -EINVAL;
> +
> +	ret = igt_pci_set_driver_override(pci_slot, driver);
> +	if (ret)
> +		return ret;
> +
> +	return igt_pci_probe_drivers(pci_slot);
> +}
> +
> +/**
> + * igt_pci_unbind_driver_override:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + *
> + * Unbind @pci_slot from its currently bound driver (if any) and clear
> + * any driver_override setting.
> + *
> + * This is the inverse operation of igt_pci_bind_driver_override().
> + *
> + * Returns: 0 on success, negative errno on failure.
> + */
> +int igt_pci_unbind_driver_override(const char *pci_slot)
> +{
> +	int ret;
> +
> +	ret = igt_pci_device_unbind(pci_slot);
> +	if (ret)
> +		return ret;
> +
> +	return igt_pci_set_driver_override(pci_slot, "");
> +}
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 92b9cc392..76ccfa383 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -24,5 +24,13 @@ enum pci_cap_id {
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
>   int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
> +int igt_pci_device_unbind(const char *pci_slot);
> +int igt_pci_driver_bind(const char *driver, const char *pci_slot);
> +int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
> +int igt_pci_driver_unbind_all(const char *driver);
> +int igt_pci_set_driver_override(const char *pci_slot, const char *driver);
> +int igt_pci_probe_drivers(const char *pci_slot);
> +int igt_pci_bind_driver_override(const char *pci_slot, const char *driver);
> +int igt_pci_unbind_driver_override(const char *pci_slot);
>   
>   #endif
