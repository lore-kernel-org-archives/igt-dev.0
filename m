Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E51CEDD86
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 11:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75DD710E163;
	Wed,  9 Oct 2024 11:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W35FvzWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23DE10E163
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728473982; x=1760009982;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3n5vcF1XmmLeLIAx+GJH8e4z7vnxoFxKY/Oh78nFgn8=;
 b=W35FvzWy9vPOkDjQ16jnmJhXAKzl5WuA94icSYAADBPW3UfGDmJGfD4X
 7KRXFoHpOeRVD7s0MHCFu9d/W044655y9WmSvCUO28djzjq4xobEPpfHy
 5lsdZ0W+5AAdSCRye7WgfXpYFC4BWyhEvBS+7DRMC2wrNmDZYDP4W+oJT
 Bmr/3kBxK5p0jf0Bj8hNZFuzgJK8KCGElVLFy305EDqRldJJOujot8Tqy
 P71h9lg4KhFHp/DZ2w3fpx00GimWeMsOnLd5vLEOGNkfA+rsC+YFxVDFs
 IOCL4sNH6Kmkx086JoQMZGHXF2XTRz/uVZpV/J8h7It+TlMJNQ9mWFcks Q==;
X-CSE-ConnectionGUID: XGTJjZc3Tey3CkgdIk3LMQ==
X-CSE-MsgGUID: /3ikbaHSSteYgz6iJGmG+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27660367"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27660367"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 04:39:41 -0700
X-CSE-ConnectionGUID: 8pnuRBc4QGCzTvMm1xMHUg==
X-CSE-MsgGUID: 5xSVY6lySKKrZbZ25HRY5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76450708"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 04:39:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 04:39:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 04:39:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 04:39:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 04:39:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zz7VvuZlw9ucZjJAmAt3uNxa6KMZMhU1RxWgQnqhxxLzE7FAJYoVlCQlS6gxuhqa10fnyRJk5x1/QOBR2IxZW+/7/3SP7d4fVq1G62LXMwaWNklI9AJaYMzHFoKjqhGhhMCh9I5Qml+Dsv+1MhIemJdelrGDz2oADdmo2MwGkolwjNyvnHWeF5h6tNaXXr5l5oxJubmR5I8BQNXS4xkAkQWyDZNpcc4Qw/xLRHL4nc5DbDWmgeL7a6FqJh+hSHw8MtIpgX3DmyX6W2VRB1fgr3u19XNm8T5vpvwsz2nnAiObu4VVCPt39RAOBtD0w/+VYcA8LR4E/RxO7vlebC1Orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuZ3e8g/eER0CjKmPSKvlQsK82TeEXqWwq6cjFYq5nk=;
 b=uVtCX26+TlblJwqTfES6XEyiFbBpi67PYT6BJHIFd2tboX4IqWXg0xU1EzmavEGzJgizAF3yrG5ZD1gQxhJOioIoRx3eA+/ayFcR41PwshS6h+rsNZqki04oWDiL918Ni9h5+sNfM70iVznAWpB/CTDrRtzbxUrgAOd2rR2L8dkZ6+pL8qtVatj29WBJWou8DvT1xd+Hde2FQkEKGkwwv9VaR149wbcHEbfX35jsKcpqh3yN13t3WWX6mMwwv/Bs2vJMznpAz+SKGu8eMphxmrBmm5dsIlvoW1R9yJl83EIfrE7DqjJC/0zL8+x1xUQgHL5jBxRrPKyuXwWSsxpm7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DS0PR11MB7381.namprd11.prod.outlook.com (2603:10b6:8:134::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.24; Wed, 9 Oct 2024 11:39:37 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 11:39:37 +0000
Message-ID: <d2b36ad8-3b44-40f6-858c-7a2e44c9ce0d@intel.com>
Date: Wed, 9 Oct 2024 17:09:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_histogram: Added IGT support to
 validate global histogram
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adarsh G M <adarsh.g.m@intel.com>
References: <20240705091333.328322-2-mohammed.thasleem@intel.com>
 <20240924122533.494165-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240924122533.494165-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DS0PR11MB7381:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4f1544-1c81-4b31-676c-08dce8570da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDlLOUZ3bnFkcTdPQkhMUURKdU1nZm1NdjlYdlRjVmxGME81OUZHS01aQjdI?=
 =?utf-8?B?OU4zUGhzalZlRmhuUmdUbklvSi9JQUtaa0VydGlSSC85ZmQwOGM5TXJkblAw?=
 =?utf-8?B?dzJvbDkrbDdMUU5OT1k0NkNmd29iZURDZHlKVjBhQXdXaDVvRnRZZGxIMGlh?=
 =?utf-8?B?OWx1RmhURjZxY28yTFJ5SkdybVV6TFlsMjhMSDVnTUFqUHR0TnNMbG9tNCs0?=
 =?utf-8?B?Njh0QVYrbkprdUVuYU1RL0V4cWdvaWdPK2RGM3EyQ3NyaVJQUWQxVyt5RTFv?=
 =?utf-8?B?Mjcwd1BIcTBZRDdQL29JaCtKUFlUUXhzdWdpMEFyOHJwVUp1QSsyemw3bkRR?=
 =?utf-8?B?ZTVmcVZKQzVXV0t4aEVjMTdJaE0xaEx1bHI2MGsyTGdCdEFodFNaV29yNC8z?=
 =?utf-8?B?NlhaQld1YXc2OHpwTEhNTGtpRlVTM3RYTktaY3FCZ3EyYmpHVUltMEJwY3Bz?=
 =?utf-8?B?NXBjSzBnUG1QRTRYeHRvWmxNK2N3RzBoVHRuYVBBMHNtem5udFV1NEZBWjVZ?=
 =?utf-8?B?MjVWczlWRFpORE5vZWgrbFdXU01iaWFiRjQ0NmFYUXIxcVlzNjdkVlVPVHZy?=
 =?utf-8?B?cTJqL3RpNG5nMVVpaDFHcFZheUowcnc0bTBWaWZFb1hkcHN4Ui9vN1VkUGpM?=
 =?utf-8?B?M2VPVnJneTdFUjRNZGtLOXpRTmNXKzlBV09ncjIwSjRSUUNIbkRjN1pXWVQx?=
 =?utf-8?B?YzFlc3JZbUQ1RWFiclEvSDlITEtneHovRGJ0TEh4YkhGMXZ4NkxyYWtrd2Vv?=
 =?utf-8?B?Z2JJaEt6cEhYUldCWkduYTBWQ05FVElrV3FScEVWaHZZcjFpc3BqNFlKTFhB?=
 =?utf-8?B?SFc4c2dyY0VFRGJ6cGRkYjhBMkhsZHZnK1VubjViTlROOFQwQmp1bFBDME1E?=
 =?utf-8?B?SDJtZnU4OW9yaFcvQTFVeTFtSE0waGxJQzYyRHNXNnFEZTZ1R3IxckNuWU4y?=
 =?utf-8?B?NjBuaDdUdHh3TXpvR0VkTUUzM0RySTFPUlNBbFNpZi9jQ0tWSVp2L21JZVFx?=
 =?utf-8?B?elVDYTVsY3hNUkluQ3VvMnlybVJiNktEV1IvZXRadFVyQkYycDdzNCtROWtX?=
 =?utf-8?B?L0pTdGRVOWZ4UUNYRXMybTc2OFNJejdIRWNCYXRCWExBTmpzYmZoN1Q3R2pl?=
 =?utf-8?B?SHRqN2YwUXNiZUVEVURWbmM1aTdnNURDNi9GVVJzMVJhejFqVUJ2SVN4NDJ0?=
 =?utf-8?B?TTlxOUxLYVorSUV1Y3k4Y1lnQkpzVnBQWlZGUWVSRkpzTGIwbjNKL1FBWGlJ?=
 =?utf-8?B?bldBVzBQc2ZwK2VST3ZPcXRBTVVXUUUwWHZOSEFRUStMWFBHVzBJUGRoay9x?=
 =?utf-8?B?V1VVbWJ2cFNwUXd3a085N212bklSU3RzV2VuOG1RQmVyZFEvbjk1MmkzUXpB?=
 =?utf-8?B?ZXlVNTlhUzZ1UFZRQ0o5RzVNcG5uTElra1JKZHVSb1J1YW1SbHBOazQ3Q1hT?=
 =?utf-8?B?WTcya0VxbU1ya2kvZnNtYWZTQzY0c0dJOGZjRy8zSXZFRnRZNjJUaUFod2VX?=
 =?utf-8?B?N0pUY0pNMldYbERwbjNwcFpKSkpBTUhLQVh1Q05nWjhabzFHUDJPN2pzUlYx?=
 =?utf-8?B?a0t2Q2hrMWZ5QXVTdEpSWkhieFhLeHE5bm9nWmZxY1d4S05nZ3VJQXNKdUs1?=
 =?utf-8?B?NXlHRGhkUENLZnluaEhmNWVKQmxFeWFzU1l2M0x5TGx5encxZWlRaDZ3cHFh?=
 =?utf-8?B?U0NFU05OQ1hRVVhhNXJkWlJlQ3l1ZE1tZXhxcytYbVVaMFgxaUNpaTR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekcxM3pheGtKRm9sS3UzRXJhSkNKYk0yUUUxVXlRN09Bdi9OYnZPWXlZeDZ1?=
 =?utf-8?B?bDQ4WXFRWFdlUWtnaGdGTnlnOGJZcEhzcW14VmJQVENLQTdHenRRWTVPdTZI?=
 =?utf-8?B?Q2RsOEQ0QytNRjRYbWhScHdrTDhDVG5HRU1NK0xUS3p6NXMzOFgvTWV5NDRK?=
 =?utf-8?B?eEhnNXZRL1M5Ymp4N1dGaFV1NWd1cHV3MS9aNVdSQXVPWk1MOHdPYk5ENit6?=
 =?utf-8?B?Y3RsOXBYUDhoMXVVSDJ5MEpUNTRJLys2WXowUi9PWWtub0pSZS9KRVZ6R1JR?=
 =?utf-8?B?TWpvcFRyU1ZSaWl5bmZQVWd5MEkxaWVXZCtrR2tSUitRMGxiTnJOaWs5TWxS?=
 =?utf-8?B?YmF4V0pDZ0o2bzdidlNvYmpRV2VmcEVIZWpxT3VnYWhsVXRSVmhYK2YweFl2?=
 =?utf-8?B?SWQxNUJ1VGkreTdEbnJTMHZGdVB2bjRJUXhaV3lKTkFzTUpGakZ1Q0tQTWZ3?=
 =?utf-8?B?MHA3dStpSDZxWS92eU1aVUMzam1BM2p0Z3JvSks3ejkzd2VlYkJrM0k3UnNs?=
 =?utf-8?B?akczbllOelZDbmVBMUNFLzVmZVNGeEltS2xoZldaY1VmcUE0NUkvbE5oMFhS?=
 =?utf-8?B?eXVGQWl5anh6RjZET21WWmV0S0tORWF0QTR5d3FjdVpBSFB4WERWVkI0NUJT?=
 =?utf-8?B?cmdGNzkxTnBoSTFCQ2FjUVlDWkdSYm9tUFlsd0s4ZnJZZEhnTW9NRmxHbys1?=
 =?utf-8?B?VEt2R3h4T0JocEtmV2I4Z1UzSWFLOE5GOTRiaVprdFlXN092UHdrclBidllS?=
 =?utf-8?B?cnJnQjRucTlPZXFmNVM0dER4cWw5SFRxUlFub0orNHcxY09XSzFVcUhBVEtp?=
 =?utf-8?B?eFo3SjczSElQQ1JwY0J5VFBDQUc0eDExeE1ieG9jcXpRaUF4bmRPYXFvWmhr?=
 =?utf-8?B?MHZVNDNieWt6VTFRQlF0SjdqQ0FodWR6TmROMWhIWno1S3FaUFdYanJ1bWF4?=
 =?utf-8?B?ZllISUJHYUIxZXkrR3FBd2phdFd0V0dvN3kvcjdka0gwZjd6emJIeGpoRDhY?=
 =?utf-8?B?ckFBbXFPbEFhbWxHWGtBcVYrK3ZzYnBDK1dnUWppYmpGdXBzTTRDMXhpTTlh?=
 =?utf-8?B?QWNuU2tHRkJSeUt1elZKMFM2UWthYWhMbU5oVitsZFhGYkUyMXFhUkZ6eGxZ?=
 =?utf-8?B?VTJmeGZ1Q2U1THlTUkVyTmJPeEdWZHdQWHJGRnFoVEpSUitnWXUvM3ZocjlP?=
 =?utf-8?B?ZkNpYnBoTFBpVW5xVzdhRkFRTmFBbHlhVGMvdzhYT1ZvWGZQL014eEo2OW5L?=
 =?utf-8?B?WXdZMmlGY1hzeXJKUjdUYzlYWllYZEZ1R0tGRkN6Zzd4MFZNY2tBN08rS2NI?=
 =?utf-8?B?VG83RUJtQ0MraTk0QUJrcHZjUFpaajVnS2hveUVPMEFuODB3eEV6bmNQUDZO?=
 =?utf-8?B?U2cySnZMU0E3TENOZEtJdm9OUWxJWDFYTkRQek5jQURWNXhwYlI3cEIwUitZ?=
 =?utf-8?B?cy8ydWV1bVhRWjhHamVaRTBVRzlhb0tNWXpYVGxNUFZMRHV5b1UvTWNlWW5u?=
 =?utf-8?B?N3V4Ulo3Y2lieUtsTm1jVmk2WjBPUEZoVFk0TjNiYUJnNzV4cm8wVC94RGVp?=
 =?utf-8?B?RU9ibEt5RTdRN29zYkV6ZmRJNXM3anc4alZ6Tk12ZHBMb1ljTGp6ZnQ1NUNW?=
 =?utf-8?B?bHdxUVdyUFd3QWFYSkgrRHhBNnV2UkhxL0FjVmpOa28zaU5jU1haNjkvb0hH?=
 =?utf-8?B?NVlTOGhEUkdGQWk5enBnZmprSGdBTG5Hamoyak5VMmhiaUtFL05GZnRZb1dn?=
 =?utf-8?B?S0pYcGxEMVRwOU1tZ0tZVFJEYzUzSFNBek1CZTh5ZjZxWnFKdDV5V25yaE9h?=
 =?utf-8?B?Zm5FOERCNm1wMng4N2xEZ2F3aEVKMGFvOVVxSW9kUFpZcktMdGx2THp0L3VW?=
 =?utf-8?B?M2VISnBkYzRFaS8yTDViaFhLNVQ5R3lLK0J6VjU5cHJGaFFkMWxLczg1WVJZ?=
 =?utf-8?B?aUFkWjlHSjBUdk42TWZKNmcxNkd4cWx5cWhhdUdUVHpzOUl1SUliaVRadE5m?=
 =?utf-8?B?WkVWV2F2Vnpzb2M4QnU4SkRhNjgyNFRIbHZpSVFmTHZKKzR1MlQrZzh2ZEUv?=
 =?utf-8?B?UE1tYlhDdVhiWW9Za29STXlUcmgzb0hPTVpuYnVNZVV1aFdEQ0ZxYnRhZU9Q?=
 =?utf-8?B?QUx4QUk1Q2dHbmdRNlIyRzgxNjdXaG9YTXM4NW1SWUdmVmxpcGRUbFViSHY0?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4f1544-1c81-4b31-676c-08dce8570da0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 11:39:37.2268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wM7c50fBWRp/lv2yKmxHT04GqoDTaSRAIYqH34Xncp4AinxURHxkVEUaSJ1rcWv9MQJqLMryaTpgW6CbC6MPeVEhGAwMiBgjHX80gWuckwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7381
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


On 24-09-2024 05:55 pm, Mohammed Thasleem wrote:
> The IGT changes included tests for enabling/disabling histogram.
> Validating the histogram event generation and if any One such library
> Global Histogram Enhancement(GHE) present, will feed the histogram to
> the library, get the enhanced LUT data and feed it back to the KMD.
> For histogram generation, black/white and color images are flipped.
> 
> TODO: Extend the tests for different formats/modifiers.
> 
> v2: Remove eDP restriction. (Vandita)
>      Update crtc property name. (Arun)
> 
> Signed-off-by: Adarsh G M <adarsh.g.m@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   lib/igt_kms.c         |  23 +++
>   lib/igt_kms.h         |   5 +
>   meson.build           |   7 +
>   tests/kms_histogram.c | 349 ++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build     |   2 +
>   5 files changed, 386 insertions(+)
>   create mode 100644 tests/kms_histogram.c
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b40470c02..a7a990fc2 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -700,6 +700,9 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>   	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
>   	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
>   	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
> +	[IGT_CRTC_HISTOGRAM] = "Histogram_Enable",
> +	[IGT_CRTC_GLOBAL_HISTOGRAM] = "Global Histogram",
> +	[IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR] = "Global IET",
>   };
>   
>   const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
> @@ -2562,6 +2565,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
>   	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
>   		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
>   
> +	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_HISTOGRAM))
> +		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_HISTOGRAM, 0);
> +
>   	pipe->out_fence_fd = -1;
>   }
>   
> @@ -5590,6 +5596,23 @@ bool igt_lease_change_detected(struct udev_monitor *mon, int timeout_secs)
>   			      ARRAY_SIZE(props));
>   }
>   
> +/**
> + * igt_global_histogram_event_detected:
> + * @mon: A udev monitor initialized with #igt_watch_uevents
> + * @timeout_secs: How long to wait for a lease change event to occur.
> + *
> + * Detect if a global Histogram event was received since we last checked the monitor.
> + *
> + * Returns: true if a sysfs global Histogram event was received, false if we timed out
> + */
> +bool igt_global_histogram_event_detected(struct udev_monitor *mon, int timeout_secs)
> +{
> +	const char *props[1] = {"HISTOGRAM"};
> +	int expected_val = 1;
> +
> +	return event_detected(mon, timeout_secs, props, &expected_val, ARRAY_SIZE(props));
> +}
> +
>   /**
>    * igt_flush_uevents:
>    * @mon: A udev monitor initialized with #igt_watch_uevents
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 25ba50916..598aa4b33 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -163,6 +163,9 @@ enum igt_atomic_crtc_properties {
>          IGT_CRTC_OUT_FENCE_PTR,
>          IGT_CRTC_VRR_ENABLED,
>          IGT_CRTC_SCALING_FILTER,
> +       IGT_CRTC_HISTOGRAM,
> +       IGT_CRTC_GLOBAL_HISTOGRAM,
> +       IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR,
>          IGT_NUM_CRTC_PROPS
>   };
>   
> @@ -1111,6 +1114,8 @@ void igt_cleanup_uevents(struct udev_monitor *mon);
>   bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, uint64_t modifier);
>   bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format, uint64_t modifier);
>   
> +bool igt_global_histogram_event_detected(struct udev_monitor *mon, int timeout_secs);
> +
>   /**
>    * igt_vblank_after_eq:
>    * @a: First vblank sequence number.
> diff --git a/meson.build b/meson.build
> index 0d06721b4..8ee4f6edc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -195,6 +195,13 @@ else
>   	chamelium = disabler()
>   endif
>   
> +libghe = dependency('libghe', required : false)
> +if libghe.found()
> +      config.set('HAVE_LIBGHE', 1)
> +else
> +      warning('LIBGHE not found')
> +endif
> +
>   build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
>   
>   pthreads = dependency('threads')
> diff --git a/tests/kms_histogram.c b/tests/kms_histogram.c
> new file mode 100644
> index 000000000..892291f1e
> --- /dev/null
> +++ b/tests/kms_histogram.c
> @@ -0,0 +1,349 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms histogram
> + * Category: Display
> + * Description: Test to verify histogram features.
> + * Driver requirement: i915, xe
> + * Functionality: histogram
> + * Mega feature: Display
> + * Test category: functionality test
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#include "igt.h"
> +#include "igt_vec.h"
> +#ifdef HAVE_LIBGHE
> +#include "ghe.h"
> +#endif
> +
> +#define GLOBAL_HIST_DISABLE		0
> +#define GLOBAL_HIST_ENABLE		1
> +#define GLOBAL_HIST_DELAY		2
> +#define FLIP_COUNT			20
> +
> +/**
> + * SUBTEST: global-histogram-basic
> + * Description: Test to enable histogram, flip monochrome fbs, wait for
> + *		histogram event and then read the histogram data
> + *
> + * SUBTEST: global-histogram-color
> + * Description: Test to enable histogram, flip color fbs, wait for
> + *		histogram event and then read the histogram data
> + *
> + * SUBTEST: histogram-algo-basic
> + * Description: Test to enable histogram, flip monochrome fbs, wait for
> + *		histogram event and then read the histogram data and enhance pixels by
> + *		multiplying by a pixel factor using algo
> + *
> + * SUBTEST: histogram-algo-color
> + * Description: Test to enable histogram, flip color fbs, wait for histogram event
> + *		and then read the histogram data and enhance pixels by multiplying
> + *		by a pixel factor using algo
> + */
> +
> +IGT_TEST_DESCRIPTION("This test will verify the display histogram.");
> +
> +typedef struct data {
> +	igt_display_t display;
> +	int drm_fd;
> +	igt_fb_t fb[5];
> +} data_t;
> +
> +typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, drmModePropertyBlobRes*);
> +void set_pixel_factor(igt_pipe_t *pipe, uint32_t *dietfactor, size_t size);
> +
> +static void enable_and_verify_global_histogram(data_t *data, enum pipe pipe)
> +{
> +	uint32_t global_hist_value;
> +
> +	/* Enable global_hist */
> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_HISTOGRAM, GLOBAL_HIST_ENABLE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	/* Verify if global_hist is enabled */
> +	global_hist_value = igt_pipe_obj_get_prop(&data->display.pipes[pipe], IGT_CRTC_HISTOGRAM);
> +	igt_assert_f(global_hist_value == GLOBAL_HIST_ENABLE, "Failed to enable global_hist\n");
> +}
> +
> +static void disable_and_verify_global_histogram(data_t *data, enum pipe pipe)
> +{
> +	uint32_t global_hist_value;
> +
> +	/* Disable global_hist */
> +	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_HISTOGRAM, GLOBAL_HIST_DISABLE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	/* Verify if global_hist is disabled */
> +	global_hist_value = igt_pipe_obj_get_prop(&data->display.pipes[pipe], IGT_CRTC_HISTOGRAM);
> +	igt_assert_f(global_hist_value == GLOBAL_HIST_DISABLE, "Failed to disable global_hist\n");
> +}
> +
> +static void cleanup_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> +{
> +	igt_plane_t *plane;
> +
> +	disable_and_verify_global_histogram(data, pipe);
> +
> +	for_each_plane_on_pipe(&data->display, pipe, plane)
> +		igt_plane_set_fb(plane, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_remove_fb(data->display.drm_fd, &data->fb[0]);
> +	igt_remove_fb(data->display.drm_fd, &data->fb[1]);
> +	igt_remove_fb(data->display.drm_fd, &data->fb[2]);
> +	igt_remove_fb(data->display.drm_fd, &data->fb[3]);
> +	igt_remove_fb(data->display.drm_fd, &data->fb[4]);
> +}
> +
> +static drmModePropertyBlobRes *get_global_histogram_data(data_t *data, enum pipe pipe)
> +{
> +	uint64_t blob_id;
> +
> +	blob_id = igt_pipe_obj_get_prop(&data->display.pipes[pipe],
> +					IGT_CRTC_GLOBAL_HISTOGRAM);
> +	if (blob_id == 0)
> +		return NULL;
> +
> +	return drmModeGetPropertyBlob(data->drm_fd, blob_id);
> +}
> +
> +static void read_global_histogram(data_t *data, enum pipe pipe,
> +			     drmModePropertyBlobRes **hist_blob_ptr)
> +{
> +	uint32_t *histogram_ptr;
> +	drmModePropertyBlobRes *global_hist_blob = NULL;
> +
> +	igt_set_timeout(GLOBAL_HIST_DELAY, "Waiting to read global histogram blob.\n");
> +	do {
> +		global_hist_blob = get_global_histogram_data(data, pipe);
> +	} while (global_hist_blob == NULL);
> +	igt_reset_timeout();
> +
> +	*hist_blob_ptr = global_hist_blob;
> +	histogram_ptr = (uint32_t *) global_hist_blob->data;
> +	for (int i = 0; i < global_hist_blob->length / sizeof(*histogram_ptr); i++)
> +		igt_debug("Histogram[%d] = %d\n", i, *(histogram_ptr++));
> +}
> +
> +void set_pixel_factor(igt_pipe_t *pipe, uint32_t *dietfactor, size_t size)
> +{
> +	uint32_t i;
> +
> +	for (i = 0; i < size; i++) {
> +		/* Displaying IET LUT */
> +		igt_debug("Pixel Factor[%d] = %d\n", i, *(dietfactor + i));
> +	}
> +	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GLOBAL_HIST_PIXEL_FACTOR,
> +				       dietfactor, size);
> +}
> +
> +#ifdef HAVE_LIBGHE
> +static struct globalhist_args *algo_get_pixel_factor(drmModePropertyBlobRes *global_hist_blob,
> +						    igt_output_t *output)
> +{
> +	struct globalhist_args *argsPtr =
> +		(struct globalhist_args *)malloc(sizeof(struct globalhist_args));
> +
> +	drmModeModeInfo *mode;
> +
> +	mode = igt_output_get_mode(output);
> +
> +	memcpy(argsPtr->histogram, global_hist_blob->data, global_hist_blob->length);
> +	argsPtr->resolution_x = mode->hdisplay;
> +	argsPtr->resolution_y = mode->vdisplay;
> +
> +	igt_debug("Making call to global histogram algorithm.\n");
> +	set_histogram_data_bin(argsPtr);
> +
> +	return argsPtr;
> +}
> +
> +static void algo_image_enhancement_factor(data_t *data, enum pipe pipe,
> +					 igt_output_t *output,
> +					 drmModePropertyBlobRes *global_hist_blob)
> +{
> +	struct globalhist_args *args = algo_get_pixel_factor(global_hist_blob, output);
> +
> +	igt_assert(args);
> +	igt_debug("Writing pixel factor blob.\n");
> +
> +	set_pixel_factor(&data->display.pipes[pipe], args->dietfactor,
> +			 ARRAY_SIZE(args->dietfactor));
> +	free(args);
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +#endif
> +
> +static void create_monochrome_fbs(data_t *data, drmModeModeInfo *mode)
> +{
> +	/* TODO: Extend the tests for different formats/modifiers. */
> +	/* These frame buffers used to flip monochrome fbs to get histogram event. */
> +	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					       0, 0, 0, &data->fb[0]));
> +
> +	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					       1, 1, 1, &data->fb[1]));
> +}
> +
> +static void create_color_fbs(data_t *data, drmModeModeInfo *mode)
> +{
> +	/* TODO: Extend the tests for different formats/modifiers. */
> +	/* These frame buffers used to flip color fbs to get histogram event. */
> +	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					       0.5, 0, 0.5, &data->fb[0]));
> +
> +	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					       1, 0, 0, &data->fb[1]));
> +
> +	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					       0, 1, 0, &data->fb[2]));
> +
> +	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					       0, 0, 1, &data->fb[3]));
> +
> +	igt_assert(igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> +					       DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +					       1, 0, 1, &data->fb[4]));
> +}
> +
> +static void flip_fb(data_t *data, enum pipe pipe, igt_output_t *output, struct igt_fb *fb)
> +{
> +	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static void prepare_pipe(data_t *data, enum pipe pipe, igt_output_t *output, bool color_fb)
> +{
> +	int i;
> +	struct udev_monitor *mon = igt_watch_uevents();
> +	drmModeModeInfo *mode = igt_output_get_mode(output);
> +	bool event_detected = false;
> +	int fb_count = color_fb ? 5 : 2;
> +
> +	if (color_fb)
> +		create_color_fbs(data, mode);
> +	else
> +		create_monochrome_fbs(data, mode);
> +
> +	flip_fb(data, pipe, output, &data->fb[0]);
> +	enable_and_verify_global_histogram(data, pipe);
> +
> +	igt_flush_uevents(mon);
> +	for (i = 1; i <= FLIP_COUNT; i++) {
> +		flip_fb(data, pipe, output, &data->fb[i % fb_count]);
> +
> +		/* Check for histogram event on every flip and break the loop if detected. */
> +		if (igt_global_histogram_event_detected(mon, 0)) {
> +			event_detected = true;
> +			break;
> +		}
> +	}
> +
> +	igt_cleanup_uevents(mon);
> +	igt_assert_f(event_detected, "Histogram event not generated.\n");
> +}
> +
> +static void run_global_histogram_pipeline(data_t *data, enum pipe pipe, igt_output_t *output,
> +				     bool color_fb, test_t test_pixel_factor)
> +{
> +	drmModePropertyBlobRes *global_hist_blob = NULL;
> +
> +	prepare_pipe(data, pipe, output, color_fb);
> +
> +	read_global_histogram(data, pipe, &global_hist_blob);
> +
> +	if (test_pixel_factor)
> +		test_pixel_factor(data, pipe, output, global_hist_blob);
> +
> +	drmModeFreePropertyBlob(global_hist_blob);
> +	cleanup_pipe(data, pipe, output);
> +}
> +
> +static void run_tests_for_global_histogram(data_t *data, bool color_fb,
> +					   test_t test_pixel_factor)
> +{
> +	enum pipe pipe;
> +	igt_output_t *output;
> +
> +	for_each_connected_output(&data->display, output) {
> +		for_each_pipe(&data->display, pipe) {
> +			if (!igt_pipe_obj_has_prop(&data->display.pipes[pipe], IGT_CRTC_HISTOGRAM))
> +				continue;
> +
> +			igt_display_reset(&data->display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(&data->display))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
> +				run_global_histogram_pipeline(data, pipe, output, color_fb, test_pixel_factor);
> +		}
> +	}
> +}
> +
> +static void run_algo_test(data_t *data, bool color_fb)
> +{
> +#ifdef HAVE_LIBGHE
> +	run_tests_for_global_histogram(data, color_fb, algo_image_enhancement_factor);
> +#else
> +	igt_skip("Histogram algorithm library not found.\n");
> +#endif
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +		igt_require(data.display.is_atomic);
> +	}
> +
> +	igt_describe("Test to enable histogram, flip monochrome fbs, wait for histogram "
> +		     "event and then read the histogram data.");
> +	igt_subtest_with_dynamic("global-histogram-basic")
> +		run_tests_for_global_histogram(&data, false, NULL);
> +
> +	igt_describe("Test to enable histogram, flip color fbs, wait for histogram event "
> +		     "and then read the histogram data.");
> +	igt_subtest_with_dynamic("global-histogram-color")
> +		run_tests_for_global_histogram(&data, true, NULL);
> +
> +	igt_describe("Test to enable histogram, flip monochrome fbs, wait for histogram "
> +		     "event and then read the histogram data and enhance pixels by multiplying "
> +		     "by a pixel factor using algo.");
> +	igt_subtest_with_dynamic("histogram-algo-basic")
> +		run_algo_test(&data, false);
> +
> +	igt_describe("Test to enable histogram, flip color fbs, wait for histogram event "
> +		     "and then read the histogram data and enhance pixels by multiplying "
> +		     "by a pixel factor using algo.");
> +	igt_subtest_with_dynamic("histogram-algo-color")
> +		run_algo_test(&data, true);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index e5d8852f3..0f32dec04 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -35,6 +35,7 @@ test_progs = [
>   	'kms_flip_event_leak',
>   	'kms_force_connector_basic',
>   	'kms_getfb',
> +	'kms_histogram',
>   	'kms_hdmi_inject',
>   	'kms_hdr',
>   	'kms_invalid_mode',
> @@ -375,6 +376,7 @@ extra_dependencies = {
>   	'gem_eio': [ realtime ],
>   	'gem_exec_balancer': [ lib_igt_perf ],
>   	'gem_mmap_offset': [ libatomic ],
> +	'kms_histogram': [ libghe ],
>   	'i915_pm_freq_mult': [ lib_igt_perf ],
>   	'i915_pm_rc6_residency': [ lib_igt_perf ],
>   	'perf': [ lib_igt_i915_perf ],

