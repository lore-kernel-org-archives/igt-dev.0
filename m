Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC00C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 08:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6945E113220;
	Tue, 23 Apr 2024 08:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCobTKpK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A0C113220
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713862548; x=1745398548;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cj3HS/RZygOamHEGXej/edKRfXtXjMQRuFEWu7yCgB8=;
 b=KCobTKpKb0/7rLmjOCiMUp/tyrD9g2GOzWDkayZeaZdobhzXLM6Ve98+
 bkf2x4+J4yP7r9NJT8tr4A783hag62i+Tq4EDrDrHee9pESxhuvfPh26E
 U1CXkGtxe8Mbv65l1y8IGp32K82KGn+UnnfbeaVXcbHjlZK3+MIg4WYBL
 jIyfkED45FSnDHQC0aJBYueyPtzihz6lSzFcRt3HQYjsN6ojgDDh4a3TZ
 uB1CTVFXnbbVjZ454WG0P0d/Sc70W55S+o7LW4JWpWgKOGJATLgP+M3uL
 e1szScORJHnn4H4xrLPVEYgtyeLRODp4rZGe+JqODy+yHs5kBSRJDvvjC Q==;
X-CSE-ConnectionGUID: 9yfNZWPoTMuvS7WCBthpyA==
X-CSE-MsgGUID: gUj6iODTQfSC3sZP3Ehmtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9266966"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9266966"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 01:55:48 -0700
X-CSE-ConnectionGUID: 252ZROL7QgCWDEhePNLUSQ==
X-CSE-MsgGUID: JQEONm9GSx2yupa9dwk14g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="61760558"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 01:55:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 01:55:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 01:55:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 01:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDpZTElh5eZv+F8Ybw8nrxSwulgiPR6kwoUpSLacqNz7DvTDPZN4koIHZVqBfM/PCG5yFVOrwJYDHHwhP+upkKep0PehUxQM+NMHo3IDAXHplEPFVRa0OKYPmfExzMZvWtsRTGDSs7nyRLUpsBr+4LTIqmhG0rd1V+8I4SzMlvNxvDXYNYgcdZmhFoFY1FxSTVER7U+zJqHmEWi+x2z86yDylzvOFSce4NjPMte5rWnL4VU42Z/gJzW/XzMv55YqsdRNlSxvtdp1XD4iz3OL3QYDtAoSsiJJfr0ouAaARrcWj7EkW5sO8GuBJJ5qCofn5pmWaIxHEgfFejun90FBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZJlZQ5+H2ri2RNC69yo5C2rI4Jiq0ZUMf3lNK1b9YI=;
 b=RKYcTuxezlmj/l4Z77BUi6infdjBTqcCtWHBjX3grmy6ow3fqQ+YB566eYIrjhskVKgo+sJ5AtxSTp1na8ODwsjmbGIOnvTnUrXtk7gDySyVWLXmQRtgxXjE3wSZQoWNAg5acT7BLL/BrhlGHQQGps/qDobr0sdKQnmXUNRGyi/AVSrpA0uH0ZoVfitkC0SLpO70P58w1o3DeCwKu0sGCAk9VU8lrli0Q0oFe3TQ5Q/BIjTRe7iZJ1uBuDYco/GSukN9jUyICCDExP4Xv2kGiehvxVqBuRQ7wk5C0DZ5ndPPNwNP7N/Ti9SII3UEzYHK7l+DJe8rHYiiKsG9JUk5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.19; Tue, 23 Apr 2024 08:55:45 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::f58b:e2d4:835d:d592%4]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 08:55:45 +0000
Message-ID: <08239f56-e521-41d7-b688-c0e3a8ea9fee@intel.com>
Date: Tue, 23 Apr 2024 14:25:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/7] cleanup and fixes for kms_big_joiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240422053454.2523989-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::10) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS0PR11MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 71112b1e-c489-4d54-2b37-08dc637329c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG5pRzlFdkJOQzBhdWxpc25mWFFzY1pUSGFIRFNweDJIWC9idy9TdWJraEYz?=
 =?utf-8?B?N1RoNjJvNFJaV3dNQTdmQVFmTVRqNUU1ZHBIQ0N1S3pBelpkZlRDMUZySUJk?=
 =?utf-8?B?RUJBL1RONy9pSmI0S21ySEVZcFFlUmJRRE80SW9UNURBaGUxN3hBT3hTd25m?=
 =?utf-8?B?djJ4RU5VVXNBMlpOU2J4RkhmTENVeG1HME0rZEtkWUx5NDk0QWp6eVZJVzU0?=
 =?utf-8?B?V2RmS0FWanJwZkNiOWVFazUrbWVicTNaUit6N20xMTNzVlBaYlFYTlhzQ2pj?=
 =?utf-8?B?MHdqRGw0cVJqR0daY1dtdGF0c3BPaHBPdTQwNVJVS1pYUnFpYUd4Ky94YUpz?=
 =?utf-8?B?WnNTZ2lSeTM0ZEswSkovRnAzS2FkalBsamhBbXdUVDlUSVBEQkRoeWNpMFFF?=
 =?utf-8?B?U1g2MmJyaWZ0WjVaVzFZaG45RGliUmEwWWtwZWN2b2J6SDY2eDIvbTNCNUsx?=
 =?utf-8?B?R2dnR2R6TEgrZFV0RUFlbXlrS0NKRkZCcHFBU3pYL2hXeUE0VXI5dUZORWdM?=
 =?utf-8?B?YzNxTlFzUnhrcjlKSmRPNlZZbnlnd3l0bndYSWo4aXdNbUJKQ3E2YnVrRGlC?=
 =?utf-8?B?SnEySXFJd2ZWc1oxZG40T2FvbUVhMlp0MUpNeEZySUJwc1hQakIyRTBDei9r?=
 =?utf-8?B?dUg4YnVBS0lTREFucEd3TXpVYU43ZHM2bEdhOWc2S0J1cUgrb1k0eHBoT1d6?=
 =?utf-8?B?dnFqMnBmSDlsaDNtcy9zNXAyNmhsWWtCVVJxNlpzcDJZZXE2elgzSW96bEJt?=
 =?utf-8?B?dXFZWUtKWGx2SGttZndpenhyVmEwaTZyTFQ1eU5CcGtGcHR5S0k5MVNXblo1?=
 =?utf-8?B?bGs5WDNEY3VtY2hsakh1RzY2cWc2ZTJ4eFFJcjZCNmZpWmJ0VmpLaG85bEkr?=
 =?utf-8?B?K2RzYlJtdjVXV2ZObVNwSEUybFVDcjNWUCs0VHZlVXQyNFBkdGQ3S2JUUzBD?=
 =?utf-8?B?VzRUeE1wS2Y3M0dGTHE3TVUzS2RzMUpySWxjL0t2UHdFbE9jYVo1VFZzYVhQ?=
 =?utf-8?B?SjJ4MkU3K0JWaWpDUzdHWGt6NXVHRjhqeXRnUlEvUkd3cmRuOHMwVUlOWkll?=
 =?utf-8?B?ZjNqeFIra3hGK0gwUE44bnhOelJXWXlXNTVwbW9iYTk5OHUvdHNCY25nNEFO?=
 =?utf-8?B?ZzQ1eU9GSGE3aVFHOFZTMHIxTkw4Mms2UEd3Yis4UTZ3OXBTK1YyZ3doVVYv?=
 =?utf-8?B?VlV0MVViTUtjU2xkWTNReW50Z3FlTUk2eTBMVEZYVko2RmdHZE1rRzVuNEp3?=
 =?utf-8?B?SXlqQjRLY1BJSkoxbHJaelpKaTUxS0kybHFxZDRxOGlhWXJjdTkwdTJnMjBF?=
 =?utf-8?B?WHlKMkZlRHVZaVhiaVZZNUhOWDF1ZENCdVEwMmdVTjhsZXJmUGRDZm5FSitJ?=
 =?utf-8?B?MGFoYTBvSHlGK1k2ZGs0RnFYSTdqOW5XR3BBUkZxaFJNSVlLMGwvOG5HUngw?=
 =?utf-8?B?WEN4OGVhVFliYVdTS0tqN05VTkRseDFZNlBySmdVSE12SFFlTjhabzUvYUlX?=
 =?utf-8?B?ZHc3cWdEM1o1MUQzaWQ1RGlSQkgramd3VFNYR1JkTnIzV29zT1lVakNOSUxC?=
 =?utf-8?B?ZEVQU3p0emtlSHRndElGeEcwMXUwWkVZZndSenZza3NURlFZWEsxV0RkdnVt?=
 =?utf-8?B?Lys1aVQxMTN6MWtleHEzWjYwclBIRUF1U3RSVlVOWDJPc2haRURQU3dzZG5W?=
 =?utf-8?B?TjZ1NW1NYzd3aEd0S1VNM2E3aFI0dWl6L1NZeXAwanR6bmU5R2hyenZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVRjZldqZ1YwdWltYlBZdkQ0Z0FXZ1k2RHhkSnF5RFdqei9YZnVoUzdQa0Vv?=
 =?utf-8?B?aEFidStzSklVcnNrTGZiL0hjNUpqRHp3dzhxV3dPUU0vYW5wQVpvRVk5K3ZQ?=
 =?utf-8?B?UnVRZG5pamNBZUNQY01YcnF5TWRMeExsK2RsOXQ5MWUxRjZhOUJJTGM0S2la?=
 =?utf-8?B?NUJoMXJkUUxEZWF0QXpnNGpaUHplUVlJbjk3QXh3SW5PQ2JBQy8wVmVML1RK?=
 =?utf-8?B?YTFYdUhWcDFTdnNIOHorNjNFOUFmOWVQWWxwN3ZhRlIrTXNaSll6VjR0NVlK?=
 =?utf-8?B?eW1HTDZ2WHRoQXM3NXNQRVBVN3JqNUk2bm5iZDd6MksrQUIyVlkyd0NSZGMw?=
 =?utf-8?B?ekl4S3dKNzFNYlMyeVpON1lkMWRJZnJINDRNQTVoWUFzUnhYaVhHejVidTBo?=
 =?utf-8?B?U3N1eVppbVEwZGY0dmZIdlpvenRoQU13UVp6OUZXQktqdmpJWGMzQ3QyZ0NO?=
 =?utf-8?B?TVBHOFFBTk9wd1lVeHVKRnNiM1BVNllQek5Yd244Q1dDdGZZVEZ4ZFFQY2JI?=
 =?utf-8?B?NEc4RzI2T3ZEeGtLRzJJa1FhSXlYUUp2MytKU2JBdzE0Z2pLaFFMZnM5R0Nw?=
 =?utf-8?B?OUZrcmZtYUJ4dm5vR20wdFBJOWJheHUvL0dNb0RkWkoycm81V3BKZVVNZmRt?=
 =?utf-8?B?SzFmMEF4WUNUTVRLNzNvMDE3SnZkT09SK2JROFFRRDFXT0wrbXJNMTZVNllH?=
 =?utf-8?B?K2ZiRHdJRGlxckdLRkYxcjNyZnhScGRWaElsZEYvdVFZL1pwRUdTTHpIV3gx?=
 =?utf-8?B?OXRFcklDY08vMVhqN3NwdzV5c0JQdWFoWTNBb29BVjF3OWxEbzBaYjlyQW54?=
 =?utf-8?B?R0htakErVTg5SnhpR0VTT3hnYVVNMnpQTGpEV09NSCtnY2lCSDVmd3ZEUWhi?=
 =?utf-8?B?NHUxaElQcE1keGIxbHE1UlR0SUtIRjJLb0NYdU96djZzQ0tuaDJ1UmkyRDU3?=
 =?utf-8?B?YlJqeWxSSVl4ZDBwTUdnNzVqcjFFUXRKOHV6YzlhblFBZzRLNjA1alFBb2ht?=
 =?utf-8?B?VU13MWE0Qmh5UVF2Uk51K056dXIrb2EyWnRzenRJT1dWWldZRnBId1k2MUlx?=
 =?utf-8?B?WDNLbllLcmFCTG5UbjhSMXJGNHNnYTY1alAxOGI3ZnFkS0tuVHlnbUcxUzh0?=
 =?utf-8?B?WG1VY3Z1SktrZVUvVHJJV2Z6Q1pkRDYxckc1VlF0MlI5VnpkakNJdUN4a3Bp?=
 =?utf-8?B?TVFyRXRnZDZkQ2Ezdm5DN2dOVTd1U1F4SktYeUo5b1UyQ0xvZHpYSG5uSkQv?=
 =?utf-8?B?RjhIMEpDNjRORjZoKzg5bHNHWkpRaUdSM3p3STZCanV0R1VFYjdpOEYzaDk1?=
 =?utf-8?B?cnB2Y1JuYU00ZEJ0ODhQMEtrcUxQTkxFYVZHNkpHTkV4SkoxQlZpVmcreGF1?=
 =?utf-8?B?ZGJ1MFJKdUJqQytmSE0wMkZUS1NZbGdSUVU3YjJ5aW1pSnBkVWkxVEgyRUFF?=
 =?utf-8?B?V0dLT3ZMaWt3VmQ4bWxwbGdaN0RadVM4NUU2VmVvK0VESkl0R1B5Z2pPbitR?=
 =?utf-8?B?L0NoVTBtVnpSQmhKbGFsOXMyZ1RLcFRLNUtGTEp5NkFrVWhOUWoxWEVBbG5l?=
 =?utf-8?B?bUp0N3c0cXowS1NiWm9DRjFlaml1enZ5a01DWkxCdDBVNW5KUmdleUVDbEJw?=
 =?utf-8?B?eXNsZS9YblIzaEJOVFl5ZzFIWmYvN2EvMUtjanFFVDZEYW1RLzZ1MHB4NldD?=
 =?utf-8?B?Z0VhaSs2UStSeXpsM0NUZHNnd3RLajBKNVIxWTFzWHFuV3VKLzlBMVU4eWdw?=
 =?utf-8?B?bnhOT0szNFh0d3pUNlZGOVhwbml1dWZhSEgzQzZqRkk4UTJvUmg4NUc1c0dY?=
 =?utf-8?B?eks5UTVFKzhCR29lT1paV3BqS0Fad2xncVk5cjRvSTlaMTBBaEV1QW00VXg0?=
 =?utf-8?B?dXp3d0l1MkFyajhJalUrM21relE5enJsMU4vekNZOURCUUNPSUpSd3o1ZnBE?=
 =?utf-8?B?Y0pBekRIaXMwaHBKWG4vV0wzM3FsNjlxUEpHYWdNYXVkN2NOTE4wZUJLSXEz?=
 =?utf-8?B?NlNkVUNOT3BhcnZDT0hiTmVNQndScHdJT0oweXh2YjB0dlJFQ093ZXlrNjBL?=
 =?utf-8?B?MmJUeG1WMm5Jck9YOThsRGJOTXpCdldTQ1hPVTN1TG9XTEpuRnRFT0dHVlQx?=
 =?utf-8?B?bElRWm9yelRSU1FRZDZySVVPK0d6UElnZXUzdVNWK3phdXVaSlpnb1QzNG96?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71112b1e-c489-4d54-2b37-08dc637329c0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 08:55:45.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/UPBK8rDTLG80PaAjBzuzqkstpxvhjl96iNp9s08B6T3Z+BSOKpQJK6rQP9I4cPH6+toasgIR8q3w4pkB9wvlgmqC+CE5tJqwhT6Pa4ELw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
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

CI results are false positive & I'm going to merge this series without 
waiting for IGT full run (will address if any issues identified later).

- Bhanu

On 22-04-2024 11:04 am, Kunal Joshi wrote:
> fixes and cleanup for kms_big_joiner test
> 
> Kunal Joshi (7):
>    lib/igt_kms: don't run on unsupported platform
>    tests/intel/kms_big_joiner: fix crash in multi joiner test
>    tests/intel/kms_big_joiner: add missing commit after reset
>    lib/igt_kms: add support for forcing bigjoiner on particular connector
>    tests/intel/kms_big_joiner: use kmstest_force_connector_bigjoiner
>    lib/igt_kms: remove unused igt_force_and_check_bigjoiner_status
>    HAX: Do not merge
> 
>   lib/igt_kms.c                         | 109 +++++++++++++++++++-------
>   lib/igt_kms.h                         |   2 +-
>   tests/intel-ci/fast-feedback.testlist |   5 +-
>   tests/intel/kms_big_joiner.c          |  28 ++++---
>   4 files changed, 102 insertions(+), 42 deletions(-)
> 
