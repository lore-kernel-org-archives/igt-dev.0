Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E03CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 06:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1C610E03D;
	Tue,  6 Oct 2026 06:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wzaj/Rhi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16E610E03D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 06:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791268359; x=1822804359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ilZP5hJOyHaMLrGDQY/0wbaCzyJCeFNnGOnMS2EP+IY=;
 b=Wzaj/RhiXkhjWow3ycEdpzC6qlY0coV1kwt21wP/kT+QR+4FSvto0zmm
 j8JcekOVv/eB+lrz3Q+BEfb7KCZKPXofW05+eJVAnQt/BsHzvdoq6O4e3
 Qlyy/LFVXmdfY1Dz7QuAH8L8zwOdJsBu0W+6pbrUrZGl5iTqJ1A5E1Tje
 dBUscSJXe4kNfRZYPyF8WCdDgMFQ1u0JVgo3ye6jYTMjZIqp3Ev/7WEkH
 6m/98Ak95iiN2GL4gwR3IcAVBodpkQOQHfskmy/JJc/HGX0jAFWeWrhFC
 g9H09buzxGj1gBoqjYhoAzPi0uBXbq7bwYt4XnjEt9PyogGZhIpNYQzYs w==;
X-CSE-ConnectionGUID: Wxgv06YdSuSdX2G5UxCHMA==
X-CSE-MsgGUID: Kambo//gRqSiFuLHPCK65Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102618655"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="102618655"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 23:32:38 -0700
X-CSE-ConnectionGUID: yy9YpYAvRtmkMNfM5Aq2Jw==
X-CSE-MsgGUID: 9n8/ZZNuQd+NuesuNzDMzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="273441963"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 23:32:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 23:32:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 23:32:37 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 23:32:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYRGY5ZGw+LjdAW0Ms1p02pUJqEu4nkq6QDkMEplT61T/nnLCkS1eIxBkBE3ELEGIO4KRoC5d2ernXPEcSfAmx0jEczvQsMAGxRlygckEnQ+ovheQvn5QbqdW26wGTljxU6b/zPTCeMy72FQ+lzD2AEBjt7DtC/9+I7WIjYrgRjr7c6pLzvq3Sz9Go/hnUOf6rCFY7dXIEjUQbJjoUFjOpuXYONYsuEzdvq6Uzqu7/vJKwaRV9d4qsmOoPUvQVgoJasHZ69qJdxFcSvK5/D29smD8gWKzAjSLwfzZn1o22BNcV3CAnIVw8QCrWD8i/UZcofNj8+bWu5jW/e45u63LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX65eIWJL4ZopvHY+z37V+rqbKS4a9m5r50o2oYPTSA=;
 b=DateFiiVkbCkJybJhA+0F8hXXjH5RNW8dlEO8W21t9zBM6DUm/uUAOFBG1QvIeCDVQkW24I5TRinQG7fnOrMrWyxgYMPceYwKaTOmMPDSczwpmiZM4Ts/Axe35Rg4JBKuBq+Y7W6Rwkxexq+aBTInvUh1i3xgX+6z/hgQMAxVZQi7g0zag+ycF4RX1Y6Q6Y6i/82W0IOCFPP6dnL+XvCtVMYoILsKndMOiPNtuj4NTrOAwfew4zVTOexnmYdrxTebGLxuMDyhfYZylP3gaviYbf9u30fHPwydmkBNbp0eWpX8yWavbKmbg/tLZ7xkH2DD5/Sq9qIIN2pFK7mcWnKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by MN7PR11MB297008.namprd11.prod.outlook.com (2603:10b6:208:631::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 06:32:35 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 06:32:35 +0000
Date: Tue, 6 Oct 2026 06:32:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t v2 4/8] tools/gputop/i915_gputop: add i915 PMU
 engine monitoring
Message-ID: <pwexmhb4bvujbvfvgxl32sdsxnk6ina5h73qnpnjzb6yiyugag@mzbs5pyu6cva>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790853076.git.sebastian.brzezinka@intel.com>
 <08d2be1618ac8a0c19d4b5b37da37903f86b26f8.1790853076.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <08d2be1618ac8a0c19d4b5b37da37903f86b26f8.1790853076.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: DUZP191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::18) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|MN7PR11MB297008:EE_
X-MS-Office365-Filtering-Correlation-Id: 9667aef9-f73f-44c1-b1e4-08df23739b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|10067099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: gi+wHgEk5oRYmIs8q8kh9U/7ss+5fIYgtlZpgU9pCovKLLiw7PsyTUKtniR5fJAWkNbedmc9M2FeNMP7dsiuHtlWlWCuhSQ335Ff9tcOM6F7uIG+PDKKsa9BxBkM8xmUifKd4+t6mQ1aEPR8x7FWz6JWom5AbX+ypQdfFFS0XANIszbwQVnynMXljLJ6Ljt79aqhR7//SBoshc/cFDpSpCjJxJQdQeFbwJYQVIhH4gfS1+V43GUF8tekM8QUZ76rAmiN0UA0vMp00xiocf0DLEA3lGlOAjQbbBgJ70adybPN3x02AvwXERrfjqa9SpH4VY3in4ETmdgkQboo/msSWgJ60PQVW9BQAZlNVXepJmaC/sNndJYmqvz3DTAwVa9a3tNaKAx8ik317E1BVniJygHa50C1HrvFc6gtMlB5W/qNICSitL2cWVEV4/0L9JAqDuxv6X4QVtaYgUuWSrMA664X9FwcOhKPebT69UC+U/bK2Bc2Td0TTtxdJQtd8ugyQKVusAGbAupooJ5zSGarSIITSYpOYaC96awDOMbirBjY++NiZ5zCGiAz5nwrGsSUYunK+p4ICHojZ5W9LrVLat/yuIA7vTC2HZnSFqgCH5aCXamgf+MvdlGVzTwHaiE9eeBii9Vryl0T+Uv9LuvX+i+CPeOeUgiHgD4U4WNz6lM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(10067099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0xVc3BnZ3pyaVhKeHVIMnFpU2FUZ09rNkxDS1JZVzVPNFpLN001K0FvVjc0?=
 =?utf-8?B?RmN3bU9kNGlFRVJQZDlrWHhsdGkyOFFDTzdla0pXTm5ud1lhY0lrZG02T2dQ?=
 =?utf-8?B?anNZQW9MSGVlcnpTeHVoTzFYSDlldTNkeEc3Nmp6dUUrVDhoQnk3NksvaFBu?=
 =?utf-8?B?R0I4cktKdjJPc0d3VGYwcXQ5R2UxcytubndiYWJ2eXZNeXdyTndFb01JZlAz?=
 =?utf-8?B?Q2FEWVFIeFRPSG03OStCakV6RjNVVy9wKzBoaFViQmxYN0FOcnllZjFTc1Ns?=
 =?utf-8?B?NkVLancvaDMxcmJWTWRNT3RwS2NocWJEME9OclduQWRZQ0hkMkFqRHR1TzZ5?=
 =?utf-8?B?NnV3ZlprQmVFUXBqWVllbytBUUI0bmg4eVNuU0Q1SXJ1SzlIR1V4TWVJeG9k?=
 =?utf-8?B?UDVpdzZtRlRrRk5ULzRKOGhFZFNHa0NxTWdHeVR0R2IrUEJRUlhuN3hqL1NR?=
 =?utf-8?B?M2NPWEpCVVlTRkdpWkZ6TDRDSklwdTNUM21YRE9ZRlhwSU40VmJ1b05hTEpu?=
 =?utf-8?B?eGhQMFc4VTRTL2E5MmZTeGRGNFNSM3oyRUdmTVFXaHdxYVNwKzVOa3VkMGpY?=
 =?utf-8?B?VEJtMVRZMmtNZWNnRFRMQUsvNVpZUld0ZlVmelF0bXg5cC9uQW4yNVpIdFc4?=
 =?utf-8?B?WmtNNmtlVXluZmQyakwwWTB5ZmVlUDR6d1phVzBHYU5pemY5c2NhZHpSdEx2?=
 =?utf-8?B?akJQL2NBNytPcExkQ1ByYWN0RVJScG5FMWFwVGF0OENta055eE5zQ244WmVx?=
 =?utf-8?B?ZFFmTlIrTXVLSzhNa1hmRVAxcCtDVWM5ZzFZV1ZraGd2Tld5K2FpTjRTWWRL?=
 =?utf-8?B?ejVrVFBQaHJ0WWpmcUI4YkZEbVRvS0ZtazdTanhmeXYxbzVMNzZkb0lZb0N0?=
 =?utf-8?B?UFNaSW84cy9SZUc5aGJDMjUya2dybjFOZ1FFMmE3Rk9RTGhGQlpCUmVRSjBX?=
 =?utf-8?B?VFhBVmR3ekxrVVdCaERSRFZsQlBXTEora0NseHhpc0JLS3paTFRLSk85bjEw?=
 =?utf-8?B?a2VFdkMzMjhybVZadUtIVmJRQy9rQk1ZN1hmMG9NWC9lcjVkRXJzcnV0eVlt?=
 =?utf-8?B?anpFM1JpVkVKV3BDWmEvYTBKVDZnbk84QUJNckFDYW1DZ0tDRHZJSENaU0k5?=
 =?utf-8?B?T2hhMFpJRU45dzV3aHdBNVVPNzVock5zRGI0U2FLU0l2TnBNcHRsajMxUnND?=
 =?utf-8?B?eW1iMjliVjRzZVZIR2VsaDRvL3U1dUF5dkZnaWVwZENqQXFQendaamNNR1JF?=
 =?utf-8?B?WEdFdTl3Wnc2OFN4dWRJbnZPZXNkNnBMNlBaRUZ5WEVHckcyUTFYdlora3pH?=
 =?utf-8?B?eUMxakN0NlVNcE15WERTak5rSjR1d1pGZi9laTJVdm55dEpzdjBnZ2s5S3pj?=
 =?utf-8?B?VzA5Q0tMbHlCUC82YjQ5R2RNcW9sYnRPb1lvVzBBZllJSHNYR1dMeGkwTWpl?=
 =?utf-8?B?VVRxT0VlYk5pejRaZ3M3OVE5SWtuTHZ1MC9JV204WXB5TE5TYkhyTDhXdFBH?=
 =?utf-8?B?bGdLWWV4ZHBiSVhRMW51cXJTWE9qUjU1K3RlaDliN01qNVEzQ0h3aGFQd3B2?=
 =?utf-8?B?bXNZUS9uNytqZVpuQUtBYXJPVG9DcU1vbDVKNG9uZnlaNUZDRnV1VUpkemtj?=
 =?utf-8?B?WmQyOUwzaDNkdndZR3cwWDdHSHhlMUU5QlFBUVhZdjAvMjJHUnM3a1lFNGFM?=
 =?utf-8?B?VGVTOVNiYjJkQ3FtZW1rNFhiOWZ3eUJnOUYvNzFGcFpnaWRTVloxZkJrT0N0?=
 =?utf-8?B?bElWSHVsRnJwUlM0UXhCVUZmSnc3c2dadzdvL0p4K002OVEzblFSU1U0L1V0?=
 =?utf-8?B?SkFkbjRWR0RsazNOSkxQbFhsc2drandyYUtLblVBWi9acXlaUE1HbE9hQmJE?=
 =?utf-8?B?TnkrK3RBZWpYTlVidGpnVlA5cDRlMDBHdHJIRVFHVjVHY0hROWJvUUd3WkxN?=
 =?utf-8?B?bXRkR1RGR2tKNm41MmMxVVlYTHVjaS9qQ0dYem5tZXdSeVpzS00yRkNyc21v?=
 =?utf-8?B?b1Jra3RKYjkyNlR4YjJWRUVTZDZnazNvMlRORU9iV3ZOR053S3ByaDMxMW1W?=
 =?utf-8?B?Q1ROeW4wSjNUclNja1JheWZJa1dvSEJ0VjZtRHNGKzc5L0hXejF0QzhjZVow?=
 =?utf-8?B?THJtTkl1N291M2VEaXJ3ZWRxYTc5S2xzdmFFeVdhZGYra1ZPRTNXRStSYkhk?=
 =?utf-8?B?S01lRDZjRE1JNGg4bE5wOEc4Z3Z4VXJaSkExQlJwSkRqa04rTUdlWjEzMmFF?=
 =?utf-8?B?ZDZmR0FWU0dDYnlNNVBNUWV5WHFqeGVMaXhpbEVDa0VIWWVFeFdxYVpzblNB?=
 =?utf-8?B?OVJuMGRXcGZOalhydEhNVGI4TUg1WWhQaHNxaXoyTEc1b0RpRHZ4bnpPUXpZ?=
 =?utf-8?Q?LNkwGayR2+B1iSZk=3D?=
X-Exchange-RoutingPolicyChecked: AJmPne0E1AhRjqmph+ycs983Ic9Nv+ECrt4dlsx5BKLYZ/m3E0BQ/2w62AqLPNb/FLgc0BsmgfmsD/8kq1KYWKbi5qNhwzktTFQzrFMTZu6fq36gCqGhlVUiXMJ9RKDVlNyGCPxnf2Pq1WL/Tcsg6ukNDngz12XrjrDYd2M2yStCwDAqmUV72Wuuw7zZ9b0diLEkDIP9ZU23FXhrN4TKVvanCMgmz+BNz7We8ikgqRZrmFrJY07Qo14HOAxJicPCVvNQ/2qCfxVgDpTy3OiDTHR+g/P828uRzb+lgeIOY+C6yQFhLzNINXw9DlF1UrPspUhZWuyS1mQKcK1wjZORzw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9667aef9-f73f-44c1-b1e4-08df23739b87
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 06:32:35.2700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOKgn7GIPJ4DEKu8Uca9uHsQ0ZSLrbmawyyNXUsCDbuD53heJfOsVlTF8Ia8jtqQy3SuPR0z+hqdlAYBmYLhnx4H8sJuKmQWJwTj8pWYHRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB297008
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

Hi Sebastian,

On 2026-10-01 at 13:13:57 +0200, Sebastian Brzezinka wrote:
> Add an i915 backend for gputop's PMU-based engine monitoring,
> implementing the device_operations interface from utils.h.
> 
> i915_populate_engines() opens the render node (no DRM master needed),
> scans /sys/bus/event_source/devices/<dev>/events/ for "*-busy" entries,
> and decodes engine class/instance from the PMU config value.
> 
> i915_pmu_init() opens a perf event group via igt_perf_open_group()
> (requires CAP_PERFMON or root) and cleans up FDs on partial failure.
> 
> i915_pmu_sample() reads all counters atomically from the group leader
> fd into a heap-allocated buffer, and tracks read success explicitly
> so a failed/short read leaves counters and timestamps unchanged
> instead of using garbage.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
