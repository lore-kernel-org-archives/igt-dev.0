Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E0AD7877C
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 15:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A6D10E98D;
	Thu, 21 Nov 2024 15:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KyYNU1nJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A85B10E990
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 15:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732201578; x=1763737578;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=7RYgXCn6VkG2kZgOwmdNclgeaHjpOPDXX02d9eDm9Kg=;
 b=KyYNU1nJhUcD3KR/iXRrBnM5V8lgHg5pxMO37qOTkRBzwVpeb9gOk/lX
 5+2iH4ogRusBv99ZACIIV0CbPVCYgEGKfk0PvnICXxJw+z9kARVn8+h3s
 mtyBQM14y7okByLpuuwQsvi+xj21rdQJ5bf3DILFdhUFTfRJAswFW09hD
 wzcV4nzRVRYl9vRlGjW1d6MDJXTn+FA77zavO8S0HLkZDEGKGMl/LI0R0
 y9h1g6rordSnRIJztOFzSmgSUyQGkOU5GiXv0lR9wsXAfm1H3BIZGzY7F
 ZkLNrkxnUg9YwL++TgDfL8Ocld3OZYjuVIFoj8tBi8GDEq4hMPxV9W9GE w==;
X-CSE-ConnectionGUID: fu56JQOdRNCjFpLXOuyFyQ==
X-CSE-MsgGUID: 88XKRwcHRmyGnb1dGQTqTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32463624"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32463624"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 07:06:17 -0800
X-CSE-ConnectionGUID: 89mzJh72TkKKYop+DgVPww==
X-CSE-MsgGUID: X7WJa4TVRf2TIEzsAExSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90663746"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 07:06:16 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 07:06:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 07:06:15 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 07:06:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaasBDUV2F3Tv32uscrFjvMhvo7Cu/1TwgC+ISTYqDdXmw45fQnY40d42SS4Tck6mcYBH7JkewV+1mAMy08VKyr4kltbQWjcHJ3wN1LXeudxGnuJz02OWFZs0HSi+4d3lVjMTH9TpaD8LXC07XSYSBcNvthCTqddye5q0MU4DLFtBkeEcm6usJ+dnvN7O7iuoSHxAHtx5x9QU1k6DLf9KWO594cY6Y5/hZh07pgSkXUFZ11ZTgzcmk431Y2ajBU3z/EiZA5Zru90/wOdF+PgulGoKt1nX97tSpdYoiTd1nmWLTmwJr30cvfebFDTUv6oKlNhfvLauk0PKJ/2Br0Dag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPCT+1bHrBst6hvcVgzdBbhq6EWo4cieZG6v3j75eMw=;
 b=hs+QTshEKTj4rWEpUtpmGVkdHOMWC/1OfW4EbUZVuu2tWWBWGuF8AFOqU5Ge+0q2IM5GpT3yvNvp1Ve1NGhtf3zu+auzazAfQF80fp4IoIZyrhlyw4ryKr2QWrAObsYi0bDhZqM2oSXCN2BeYxmDAJO8oNMngtbODZz0vQbq8q7+7Ewmp+8gJd572DCFxYQIjXoHdlwEaeuvdqxCv8+YzgZNCkNBQOPXPgKPJVDj2sKqJlsDMSYo5Y+8iI0X4iZLLELJyyr7N/jjC9RNU8pCkth4kBZ9eaFzn/VvXsIml0oPzQx+KMbRVrTd1XpWWF3PgIlf8v5bbAWeL+Z8AGBeXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 15:06:11 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 15:06:11 +0000
Date: Thu, 21 Nov 2024 16:06:06 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests=2Fsyn?=
 =?utf-8?Q?cobj=5Fwait=3A?= Update invalid-wait-zero-handles test (rev5)
Message-ID: <yixceuvhxbpsgkvwjxygnbsv7qno6dqqnazkncynncto6vcwru@7vjfiec4nnh3>
References: <20241120103507.7653-1-krzysztof.niemiec@intel.com>
 <173213122570.818432.14436221159998973355@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173213122570.818432.14436221159998973355@b555e5b46a47>
X-ClientProxiedBy: WA0P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::13) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|BL3PR11MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf17987-4de7-4608-a01a-08dd0a3e08dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXN6T056QXp0anhTMml2a0hyRWIwejZWWllVcFIyamR6a2czRXphVUNGc3I2?=
 =?utf-8?B?VGR4QjY4ZEIrNEx1Q2FiUFJIVVdqTURLQXg3bndBQVVIOGs3WklCcGtZUDh1?=
 =?utf-8?B?ZVE0WXhNZHU0NGdwb2tQOWlJWjlhclFJanZsaGhBMnV1eWNLdDRqL29qbzV5?=
 =?utf-8?B?SGtGby9VNG9pQjFWYTNBaGZ3Sjc1Um9BWUYwRGhvNlJySzAycE1heXliRUM0?=
 =?utf-8?B?aUc0OTZ0VDBLdUxVTElLTFFBK3l4YmRLTXdVUXY5UlNxWjBVY0Zod053OG5p?=
 =?utf-8?B?SzJjZlk0VUNBVExORXJzNzllUzczWnBqRkpDRkV1VjBUSVJiNDdnUGxhWjlS?=
 =?utf-8?B?dnBHR202eHZHY2lpakQwUktKdkhKYXpBcWF2SFY1WlYzSmNlc1RkV21OUFBX?=
 =?utf-8?B?WTBkbVd1cWFPNkFlR1RpVXBsd09wSWZTdHNlSWtEbkZUZDljeUwvc0o4Q1Uz?=
 =?utf-8?B?YVlrYWUwY3ZKVWp4R1hmdFhaQmZ5WDFsU2JWc1lRNmE3N3NBR010Zm5yK3FM?=
 =?utf-8?B?YjVIcXcranA5RENyUWhhMkpZMGdITTdkY0JPVXMzSGdUZjVuUHg3dFF3YTZz?=
 =?utf-8?B?YTAyb1ZKWDJPZmp1bUlJdVI0YUd5QUdxS0xlSjlXOFM1UFhFcjFRRjlPRTVO?=
 =?utf-8?B?bGNnNFlFbXJUamp6ZmxIS2xUYnRROUVPWE9ucmN6L0p1bUlkeFB6cGVjcjFX?=
 =?utf-8?B?aUtjaFJsQ3BlSXk0QUZhNWVNRzhvQzdvUld4K3JpR1ljSjd4bEF3NHRQRVJ2?=
 =?utf-8?B?M214VVNVNmFCU2hYQjZIeHl2eHd1RXlkTjkrYnBOZHd5dmdUV0lvNUNCbERO?=
 =?utf-8?B?ZjVTdWlieGg2c0g2L2cvVFdyZDdia1BpekRVbzhYalMxQi9LcCtDdkhiVUtE?=
 =?utf-8?B?TkJVbUpLNVJRajgxMmhJbEdZUkQ5dG9qNzc1YmFhKzVzNUhtWHd3eFM2ODFQ?=
 =?utf-8?B?RXBHQ01iMk5ELytmN081NVFWNWhScGF5SVhhRXZZbEpsdSs4SnVLYUZyUGU4?=
 =?utf-8?B?UTMyckI5TXlzalV5d1psMVJ2VDRuN1pWMUJuSWNXWWFxZHNKT2xkYmNoTnZM?=
 =?utf-8?B?anAvbnhGSlV4Q2E5WHRROXV5U1dab3I0WFVFMDA3d0hTbUs0cXpuT1Z4eGYr?=
 =?utf-8?B?M1lZUi9qbUJ5VUp2UVErZW5zc0ExZXdwRWdqNUN2M1VzQW1XQVlCS3JDTFg1?=
 =?utf-8?B?OWtZdjZnRjhuZGUwVVZFa3RBSDl6cmMxNnpyV3hWVE45TlVLR1VlTmZJQk5F?=
 =?utf-8?B?MTdSanVzNlo2d3BSdTRuZjcrS1RUOTA1OUtWWGNmTUgwVmZhK2xUUHlSQ1Ra?=
 =?utf-8?B?RmpRNkZEK3FvYXZHcDZyNGxseEljT0RiYkk3YkFuRmZXcUh1MnhiNXRVYUZD?=
 =?utf-8?B?MjlYeVowTEMzZjJrdkZPcTcvNTVuZUFpQ0ZsaEFkWElocjhYVDV1VVQ3R0dE?=
 =?utf-8?B?Rnh6MFFMYTlyY0RWeGZ0UERybTNqK3FtbmFBajhyUGR4dXFoMlNTTU5VSXR4?=
 =?utf-8?B?YXhZeE5SdDFoVkduUUNmYkhSQjg5S1kvMmRrQklrMTZ6U0tYVWlMUndPRTJy?=
 =?utf-8?B?SWl3Z3dlVFpuVGUralcyQkd0U0k3QkVBVnQwTFN3c1FmQXZ6Um5JVWpXcGU5?=
 =?utf-8?B?NzJ0d0xNQlF3cDczdGdYNE96ZkpOOWMxQVFURkhqaHlWZDloZlJRd3cvQ28z?=
 =?utf-8?B?aG00aHora2RUejJjT0l6T1ZDYjdGZHM1UTZUTTJGeUdjL0cxMTc2UGlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cU85aEVJTmJqRHBPaU1HeG96cEQ2Y1c4OWFqRGNQRmJOU09oaUtZRUgwQitR?=
 =?utf-8?B?eEtrYXRpeXBqbVZuQmZVTmFoczVla0krZjF1Zm8wQmxtWGptZC9RcC9BN1JQ?=
 =?utf-8?B?cWE2TEZlZ2Q3SkhPQkhtdkVkSFZwQnRRMjhqc1Q3aENDVk1kanUzWkdENzQ4?=
 =?utf-8?B?TDBqbUp2bVZUZWdYMjJoWGxnNFpCbHZCNVFtcWdNWmpGUHdHMG9rQzFtV3Fj?=
 =?utf-8?B?WXVSV1BRbkNpNDZEMU9GZmNuR0VPMUxENHJwdEpFRmJFUXBnY09lZnlCUGwx?=
 =?utf-8?B?bUFjYWM2WCtOQlE2clhZKzVlMC96V2tHOVAzdmwxZFdNZlZocWdiMWFOUWh4?=
 =?utf-8?B?aFVQbVMzbXRvVmQrUjRsWDJlbWFPb3lFLzAxNThoY2phLzRZNjhuakFKb2M0?=
 =?utf-8?B?UVdKY09EbjdZSUZqckdKbVgzVnYvaTVSSG1PbWFCTGpRYXBaS3VLcktrSmVi?=
 =?utf-8?B?RjFzaUMrTVhBUjBpelVOSE4rZ3ZIdnpJS1NXZGdzaGZBeXkvTTY4amd5RTNC?=
 =?utf-8?B?R0hQbnAwOGVkT2dMUWNrejJKVjJZVm5ic2Rqb29Ca3RWM2MybGVVSHRDckd2?=
 =?utf-8?B?MFBQYzJEN0gvOU8renhXbG8zNDdxRWFJYWM2UVNqYlRBd3g3U2IwYXhyQkhP?=
 =?utf-8?B?NWxYaCtXcCtKRHFONitUNW1maHNzK1hyTXhXOXk1T21NQ0dkRDRKN295bWlq?=
 =?utf-8?B?QVloeDVlWEZXMjdmT3lIcjZYQ1VtN1FwT2w0WTdyQmRHTHdGalVqemdYd3hE?=
 =?utf-8?B?UWU0ZHpGNk9UKytGM2RmaE0vQlA4NEl0eTY5MUR6QXFMaFpaNFRVMUpqNW5P?=
 =?utf-8?B?YjBDWVdySUtsQ1k0K2RaYWpQbGxzQUdVM3ZaaE04eEhrWnAzRldzMDQ5bnVS?=
 =?utf-8?B?bXVtRVpwRlFtL3I4bi9EdWpicEVNYlBmZEY4Q1RYQ0lEcEtnU21qQllQZE5Z?=
 =?utf-8?B?WmIxQXdTSllKUFVQRldGWjlUWGUyYVVuelFsMTQySGJRMnMzYXA3Q290M3hj?=
 =?utf-8?B?MDJjMSttNmZTVVI4WGZhRzhQc2ZITm5ZQkxEMkJ1bmJzdUVhemhlY1RUbm1F?=
 =?utf-8?B?L2w0ek45eXZNbmNjcnBrQm5QSG1GN1ZJNFR4aHJHNnhReHZaUzlaQmRKeWJt?=
 =?utf-8?B?Q01yRGN3Z3dta2YvR0c4QUwrcDhrdDY3UDNJTDZjMFJMeGRDSGw5clJYeXRS?=
 =?utf-8?B?NnB1b2EyOFgwS3VjTVhzUnhtZ0ZsUlVCN3BzZnExTW9iY2QzWWUwL28yd2xm?=
 =?utf-8?B?VmlEUVZSazdseWxOazVsZElEWWZmOUZzZjhoNWRweE83MmROWlJpYm9FTzAw?=
 =?utf-8?B?VzdNYWpTU3pyR1RRM3l1Mkt4UU1ZblJFRDFEM0xXNExIR08vUEZ4b25wSWNE?=
 =?utf-8?B?dU9YaEpzT1laQlpIc09hQ3A4cVhZV2J6dG83dUsrRW9sZG0zNVYveXNkbzVh?=
 =?utf-8?B?SWU3RE1qN1c4OFdOREplZTB0Z3Z6OGRjRnc2ZTl2aVpDUmdwbTJQY1dUTHhQ?=
 =?utf-8?B?OW9FMHA0eHBGUS9xNUh5RVJOc0xYU3VhVkRkVGhTMlRpUUZyUmRUaklZbllJ?=
 =?utf-8?B?NFZObGlJeGxFWEFmMGxlSElSVFVBbHBWUDYvbFZsQmoxZVpiZFB1V3pMUWNx?=
 =?utf-8?B?S04yZ0RvaWIrc3l5dk9ZdUVtZ3ZSS3VWSjZsZUtWVkVpZGNVemdLUU0yTENJ?=
 =?utf-8?B?VHlsR0dGQk1adWI3OU1oaWJpUHA1NDhHQUtxSFhwZnFKSnFoeS9wTWVHZzVU?=
 =?utf-8?B?NlV2ODlZRFkwa2tteDB4aGc3b2Npb2hIZzFMa0RCdGhkT2tNRjRtTmVxUGV4?=
 =?utf-8?B?blZMc3NjMlAyVk1oRWhMM0luTExBL2FDcHh0bFJrMXowMVdkY05TNnJBWGNG?=
 =?utf-8?B?QjNrMGNXc3dSVk1jb2RRWitaNVBoWjczSU1ST09VcUxIemtnQVFzdGU2UG1t?=
 =?utf-8?B?UDBidUtpRnZlVkxmUGRqZnVaakVzcG96b09SOXA4aDhTaTYzVmp3bnk2L3Zw?=
 =?utf-8?B?OGhsRi9taWZ2djhlVjhtT2huZ1JrLzliU3RRZVB1TjdqUnp0UHdXNW5uaDVG?=
 =?utf-8?B?NFNnOVY2bDdOdit1M3ZDU2ZwY3dYZU91dmMwaFUwa0pPSnZpUUZDQWRtUnQ0?=
 =?utf-8?B?L1YwK1pQdEhIWWxEb0xQNkJUS2RqR0FVYTNPMklPVitoRkZ1OFJhcEdHdDRi?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf17987-4de7-4608-a01a-08dd0a3e08dd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 15:06:11.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FLbIWYEtTrRGhaEgk3TWXEWq2CvSULq/kgkqtXp+agPbuduFqB2j1IhrZA0SdRahNh7PS4BB7/7CM+37tCZyWvUfot0gMgZa3a18fJwgzKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
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

On 2024-11-20 at 19:33:45 GMT, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev5)
> URL   : https://patchwork.freedesktop.org/series/140727/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8118_full -> XEIGTPW_12146_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12146_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12146_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12146_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-4/igt@core_hotunplug@hotreplug-lateclose.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5] +2 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [PASS][6] -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_plane_lowres@tiling-none@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_plane_lowres@tiling-none@pipe-d-dp-4.html
> 
>   * igt@syncobj_basic@bad-pad-fd-to-handle:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][9] +3 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-2/igt@syncobj_basic@bad-pad-fd-to-handle.html
> 
>   * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
>     - shard-lnl:          [PASS][10] -> [DMESG-WARN][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-lnl-1/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-lnl-7/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
> 
>   * igt@xe_prime_self_import@reimport-vs-gem_close-race:
>     - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] +1 other test dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-464/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
> 
>   * igt@xe_query@query-config:
>     - shard-bmg:          [PASS][14] -> [DMESG-WARN][15] +1 other test dmesg-warn
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-bmg-1/igt@xe_query@query-config.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-bmg-6/igt@xe_query@query-config.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [SKIP][16] ([Intel XE#2136]) -> [DMESG-WARN][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_plane_lowres@tiling-none:
>     - shard-dg2-set2:     [SKIP][18] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@kms_plane_lowres@tiling-none.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-464/igt@kms_plane_lowres@tiling-none.html
> 
>   * igt@xe_vm@large-misaligned-binds-2097152:
>     - shard-dg2-set2:     [SKIP][20] ([Intel XE#1130]) -> [DMESG-WARN][21]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8118/shard-dg2-466/igt@xe_vm@large-misaligned-binds-2097152.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/shard-dg2-433/igt@xe_vm@large-misaligned-binds-2097152.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8118_full and XEIGTPW_12146_full:
> 
> ### New IGT tests (13) ###
> 
>   * igt@kms_color@deep-color@pipe-a-hdmi-a-3-ctm:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.66] s
> 
>   * igt@kms_color@deep-color@pipe-a-hdmi-a-3-degamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.62] s
> 
>   * igt@kms_color@deep-color@pipe-a-hdmi-a-3-gamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.73] s
> 
>   * igt@kms_color@deep-color@pipe-b-hdmi-a-3-ctm:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.63] s
> 
>   * igt@kms_color@deep-color@pipe-b-hdmi-a-3-degamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.59] s
> 
>   * igt@kms_color@deep-color@pipe-b-hdmi-a-3-gamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.66] s
> 
>   * igt@kms_color@deep-color@pipe-c-hdmi-a-3-ctm:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.64] s
> 
>   * igt@kms_color@deep-color@pipe-c-hdmi-a-3-degamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.63] s
> 
>   * igt@kms_color@deep-color@pipe-c-hdmi-a-3-gamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.73] s
> 
>   * igt@kms_color@deep-color@pipe-d-hdmi-a-3-ctm:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.65] s
> 
>   * igt@kms_color@deep-color@pipe-d-hdmi-a-3-degamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.68] s
> 
>   * igt@kms_color@deep-color@pipe-d-hdmi-a-3-gamma:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [22.73] s
> 
>   * igt@syncobj_wait@wait-zero-handles:
>     - Statuses : 2 pass(s) 1 skip(s)
>     - Exec time: [0.0] s
> 

Most failures here are unrelated as the change doesn't affect other
tests; The skip is because the machine can't find the driver (not a test
issue per se).

Thanks
Krzysztof

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12146_full that come from known issues:

(snip)

> Build changes
> -------------
> 
>   * IGT: IGT_8118 -> IGTPW_12146
>   * Linux: xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd -> xe-2254-ccf64319402f90f68549e2047a7f985a46436e41
> 
>   IGTPW_12146: 12146
>   IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2252-f8f85a38f6c75e091805f01ceff4041ac2fdf3fd: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd
>   xe-2254-ccf64319402f90f68549e2047a7f985a46436e41: ccf64319402f90f68549e2047a7f985a46436e41
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12146/index.html
