Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA49C54754
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 04:10:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD5610E31E;
	Tue, 20 May 2025 04:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5O5uym/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD9A10E31E
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 04:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747714227; x=1779250227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wRz61zXPv8MVmRwcG+XyfFSPtH4B9rnzJviiHC8BrQ8=;
 b=J5O5uym/HtMZCbLJBbZhL6SLmklBPp6pmgYKx2tH4Pq4VMqI0u/RNAwV
 pNc7fTDDL+CGmms52gh4zzILMyJEepxliy4jjBCPbGVHyL92LMJddbza7
 SRHGRCdDYn84iO2/NBUbxQEga+y8e2jwfPld/IA8K7uG64uZRV2I9V7Pp
 tdE7Odl5hGuKhg724FvwiynEeLEW+NYbAS6OinP+E9Z8hK5ZX8R4aCQ0S
 S3xSi+/md6jT/z3IaFy39TPP0W1pLBGcEWVWcZ2KQyXLs/okiYt8yOUde
 xweledn86aYCWWJezA3g4Ysr0GcgSOk9vRzenpDHJW26QNHgRtNPBNdM1 w==;
X-CSE-ConnectionGUID: 7aF8qvWkT2KEvjZf8r1A9w==
X-CSE-MsgGUID: 8q3lhIpiR/iFj4pXYlNcbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60974591"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60974591"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 21:10:18 -0700
X-CSE-ConnectionGUID: jjs7ujK+TAiZ57Jt/gg6Bw==
X-CSE-MsgGUID: O9NC6vfGRnOQku28uxNhGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="139980330"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 21:10:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 21:10:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 21:10:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 19 May 2025 21:10:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJWW/YqWFSs8cnlmN4MM4UHLP4ucizJ1e1dfZvvpiSat9TeJv0edQMinPkGXYRgRj3OxBO/941gV+40u2I3fazeuMoouEsdbnKKlhNJTi+nqJicNf6jq2C/2SgDurIJhoq9/+zB9rFvWWY87VUeG092amFSivSsPf1Qd16OebyYw/A5JJnvBLHXeAwbpVKKBNkc/8knWBTvuTHG3stT1dsv3cRmOJxihJxnGl6DXdtBJ7hUXt3IICWQcIbYsmQXeE2P9kYCPTc3VMU5KZvyK/MQ/d9+iVJ/SwFheCxdpuXpGgIkig53BTx+jE8ak1Pv4Uz0r6Xbv/L8WTHYLhVJwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hMS2LwAnHFH90Kzm/g5D8sSeB5hnKpHOGZpvPjd9GA=;
 b=AIMzYNdXlKehV/0FhSD6kfu2VjqWGkLMeDdCYz4Nl2hBev9gl8cCfO6E2+Bb+Os9L5liL9iYSh9LSErLpBrJyRAN5M9pqju9eofB/EB7Ih2ji9H1PajEMDRs+KrokSuuKKOQgpRae7LQZTI8onniBLqrcBJJaEGjr5FoRcilGKGEw0gP5ppqPq3WIC0VCrDnSw20J0Dsqpx+Knv4aFn9wWDn30D7rgrI3sEJbJbsgkgc82+Nzf7CcoMiGAzvnsXy3Fog9Xt/OXAgsKO8II85sjeHAzDa38v5nURpNNQ0EZyrJ2E3a5ynppMqI/lnLKMKvEjJJcqzP7fSJIO7xZX4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by BY1PR11MB8054.namprd11.prod.outlook.com (2603:10b6:a03:52f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 04:09:30 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%7]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 04:09:30 +0000
Date: Mon, 19 May 2025 21:09:06 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/xe_eu_stall: Do not check for
 presence of data on simulation
Message-ID: <aCwAYhr9WPaUqY9I@intel.com>
References: <7480b4adc93d3606d60d718d269c92791c22df68.1747105491.git.harish.chegondi@intel.com>
 <85a57glavf.wl-ashutosh.dixit@intel.com>
 <aCOyRTu5s_Is5etp@intel.com>
 <87wmak6tsh.wl-ashutosh.dixit@intel.com>
 <87v7q37mpi.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87v7q37mpi.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:303:8f::21) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|BY1PR11MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 6da49f75-b9d1-46e9-fd02-08dd97541e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzNET2FteEtYb2dzaUQ5L1owUGlIZzljRkZ2bXRRbm1Ybk9pN3hqOTVWblRJ?=
 =?utf-8?B?VFNIN002ZVdWa3JjV3dRU0RFTW9MVzJvVnFhMElQSmE0L1NnVjFKRjFuUEZO?=
 =?utf-8?B?T3FuYXZjVkZTeis3d1J5QWhLM1lLeGNTd2dZYWYxWVQyVXFvS0hCaHdDL1B4?=
 =?utf-8?B?NXkrK1M2K2cvWlN2cmY1Mjh3aW5MQmZUYTFZaDd1YmIzQXZqMXdOQWRFYXRE?=
 =?utf-8?B?eTMxUUExU291djlTbTIxOW1xc2M1TWRybUhDQmtBTm8xODFVempIMnU5U2F1?=
 =?utf-8?B?aUVibENhVldFUnRxZGp2QldkVS9DWS91S1BOa1ZHWnNxa2cySTF6U1JBQlE5?=
 =?utf-8?B?SHlsZlNLUnlpVGFQR1BBR3RxOEd0Mmh4d21qa3hLRk1aWkdjd052bFIvaGs5?=
 =?utf-8?B?THViZjFoMjR6WE9GL2J3YmdkSUdKZTZPT3hFZHVWalpCQ3VlajZqUTMwRWxE?=
 =?utf-8?B?V2trSlpzbDhWYlJ0YkNMd0hGUmVUeFNWMTdldGh0MHl5bXJtL09pOGUxNkJE?=
 =?utf-8?B?dS92Q1IvNFdQeTlTV1BMeG9MZ0EyK25pNi80RWlhNC8yaDhENXpDdjJaWXJC?=
 =?utf-8?B?RDIxYlJJdm9CZXg0SUtqbG8rak10TlhSWEZkRllmNTIvQWxWZzJXUGNEVlU1?=
 =?utf-8?B?dFdDOStjYmZPTnpXQnU1OWtqZjBmWHZMSDI0K3FMQlFOU0lWRlhINmJ5cEMw?=
 =?utf-8?B?N3JMc3Q1QW5HeVh3MmFnLzBwWEl5V2c2eXZFNU03UVA4Mm5mbjVaWXB1VzNp?=
 =?utf-8?B?NjllWHBKNC9ZMFFVQkwwb1FPUmxjbk1vMnQ3UGhuQjBWaFZhb1prN1BDVS9Y?=
 =?utf-8?B?L1V0TGk1WDJta1B1L1haYjJHSkxRRll0b3JZbFFyS0ZCbCtZbW9lYzlTa0R0?=
 =?utf-8?B?Um84YlQ1cDR6bWZ0RG1HZTBxbjBVTmZkYzlHUUIyQXlJOE81cHRaWkJoUlM3?=
 =?utf-8?B?Rjdib0JORXpmK0Iya3JmZ2E2eVhtaVdreklSL085ZEwvVjUwbE1HMkVIUmxx?=
 =?utf-8?B?UHhMYU9WZTN1R09oVmpma1hpdkpBRklpbVhkbjNDekZ1WVhtU3RjcXlnam9q?=
 =?utf-8?B?QTVCUTZhQ2hFN1ppcldZYVNLdHJGbVRLM1UzM3hsTysxc2oxU0ZneXJWVXMr?=
 =?utf-8?B?N0FyUjUrc1FuSWNSVFhkYWdHLzE3ajJqOE5YNUR3NkR4VjBRd3BYWVhEdkpr?=
 =?utf-8?B?RklIcEp1bTluMjFkV0RRb0IvV1ZHdi93WnhPakVoS0thSllSTk0zWlIxZjdI?=
 =?utf-8?B?QTIyQkpMcUdQVit0R2cySDZsNGpESG15Wm40S3lCVzlLazlCdDVOZDRHVGtJ?=
 =?utf-8?B?eXJ4OGdCT3hZQXhSUFlucS9RZ24yNmVSUENRUm9LYWVveTZlL0FCTWZnWXI4?=
 =?utf-8?B?dHdBczY1dmtBcVEwRG1iL2wxN0dnUGcrVWp2VllvYnlqSXRnU2ZHTFZXbU16?=
 =?utf-8?B?V3ZCa2s0OGF4NDRIMXJXdXhwSTlNUXQ3QUFmTHlTM1N6bnpwRjJXVnhnbDlG?=
 =?utf-8?B?eXFmanZ6TWtBVE9ncG1nVkxmbG1xRk5NYmFMTU1CMDBPKy9RdmZlaE4vd05w?=
 =?utf-8?B?RU95bEgwbURwOUxKWmhCU0NMYk1ZdDRic0xCOXBENXFaeTRyN21iM0x1UE9l?=
 =?utf-8?B?LzdHME1yUmRIRUhLeGd1SXBiTisrbzgxYkxlbm9HU0hySG11N0d4V1NKb1g1?=
 =?utf-8?B?cDM3NTU1blBOY3k2VnBYWU5tbkdyMVU2ZTBZZ2wwWlZwZlNtQmhFTUtJZzJu?=
 =?utf-8?B?VEFnZnFCUGJ5VjV6M00zVWhLUHhKZG9Sa1UvQWlja0NTcGYxdG5UcThrK2Zq?=
 =?utf-8?B?RWtHWUlrU0VKL04ybVdCYzVCaDFBVlBEeXlyYzlsRTVVRlhiclRsRXhaSndM?=
 =?utf-8?B?S3ZkSktMOEJKRlRjREMzb1lmZ2d3VnlDYlROQnlVbnh0TWZhT2RKRXowc29l?=
 =?utf-8?Q?XqLhXY+yqrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkhYanNJN1Uya00zUUlYWDVQYjluVGxZdGlsMjJxRDBPV1NPOFF3NUdjZk1I?=
 =?utf-8?B?cDdWRkRkcXpDb3JIT1g0d1RoelRIa080ajIwaGN0ajEvRk42ckZkNXgwekd4?=
 =?utf-8?B?cG11SmZwQ3RoQk1HZ0J3Qnd1RmoxRmRrcFhTcXQweTlBcUFGZnJMSGhienln?=
 =?utf-8?B?SGIvWmtkbmJjaXN1clVlUWtpUmJ1Qm9wQi82anByOHRnSSs5OUxCeXBMT2Zo?=
 =?utf-8?B?R0hmRjk0Mnh5YjNueFJFQVF2V1dxaWJDcWdFTWNoUUNvM0l5blVjbXo2NUhr?=
 =?utf-8?B?bG5kM1gwY1dyYkFUaTlGeVc2ZSs4UVEyVnp2YWxNTGZEdVFBWUYzK3FPL2l6?=
 =?utf-8?B?bFNJZy93UlBWMUVaWUVqMmpVZkZVWVJSVEw2NUVQdSsyVEtpZVdmcUxHb1pl?=
 =?utf-8?B?Q0xUODh4SlZtaUwxOWNJUS9ieGk3WWExa09PdHNuVjVHQmw5R2RKZ21QNytY?=
 =?utf-8?B?U3FVS3lkekZTSEtSTHN0aGpORkJONGs3KzhPd2tEWFpVUHdSUUpRTjNUdVlL?=
 =?utf-8?B?V3lMRkJGaE5BajhzdEJjZFlkcTlGQ2xFeHREOXlUNXZIaHBGVjVEVzd1NjR1?=
 =?utf-8?B?VmQxVE5zYmdBK0R2NGFhSURxR3lwVnhzMzZQRjE4Y29OWGFIUndmQmtkb005?=
 =?utf-8?B?VjYvUDVwekRJa3lFL082NVNuM1JDcmloWWRFMldKeUhIUEF4dDJGNWVlQzYy?=
 =?utf-8?B?NnhYK3ZTdjRmdFBpWFBQMTBpU3RYNjNOVEd3VHV6eGxleXJycTZqZ2YxN0JS?=
 =?utf-8?B?YjRzQk1QZmtVT2F3REY4TUdBOE1LbElrVXJIV3FiNjBrYUw5NlJmdGpDZ3Jl?=
 =?utf-8?B?L0hpYWt0T3VFZkhtNEd0cVNzSG1HTWUvVnM0bmxWRnVpS2N0SEppRnRMYkVY?=
 =?utf-8?B?aTFKeS9rTTRVYkcydEk3MUhhYmtubG9OYnFmd3M4TFdxbWlFeWttTU9pZ3pa?=
 =?utf-8?B?c093RXplQ3ZQTTM0ZnBiOHpEamZEaG5oT2hvS3BnY2J4NkNqOHZuSGpYUkFU?=
 =?utf-8?B?bnlGalJzWjNPdExvZmVWM2xkWmtvcmd5eE9ZYTdGV0dvblBjcVArK3gvTGFZ?=
 =?utf-8?B?dHU2VzYvMW1aUVVnblQ3cGI4MTh6NUppRVYyS2llV0xLVlEzSTU3ankyai9w?=
 =?utf-8?B?YXFvaWJlTE9TNWtoeFRCNjliemhidmFpUGVLdi9RNFVRQ2ZZajNWd1Uwb3p3?=
 =?utf-8?B?b21CTmtOUXZuSHF0R1FwSkhjMG0zdWJIMWl1VFBTVStMNUpDQlBRNDhMV3Bz?=
 =?utf-8?B?Sms1eCtVOFpvaE52TGh2dk10NlJtdzUxeENxUzJRbURNNDRFK0UreHNKcWRn?=
 =?utf-8?B?WlVUek9LNFpBNi9iYnp1U044VmxsaGVGWkRTKzJSVDhrdjNzZU5abmV6dklS?=
 =?utf-8?B?clR4RTdVR3diVyttZTc2YnpTSG52Z2FSckVaaUZGblAzSXU2N2plQk9BcXcy?=
 =?utf-8?B?ZEtXS2lmTGc0Tit6K2RoRFZGVzJ5Z1hCZE84NXdKczdHSmoyTzhSTVZIb0p4?=
 =?utf-8?B?aUVPZnpIdHpOd1JiYlRjOWVBYzErdUJEUDdnRmZxK2dwelZiWUMyQldpdWJG?=
 =?utf-8?B?bnVUejdMRHVva1hvZ0FtLzg2K0VWdjlPR1Byb3l6dUNSZTB5M3h3bkxJMlU2?=
 =?utf-8?B?NzNtNEMrRzlDU0Z4eXlOSWNFNFF4SEVVRjhodm9rVytaMDlaV3RmRjN0NWJp?=
 =?utf-8?B?dUY2ZURRK04xR0RzWDNPTzN2cFRtdUtXRm9SWDBCMWYrS0QraFFmVjY4MlZM?=
 =?utf-8?B?NXpGSUFhSkRjRU96cDMyd3c5dExhQkxFWGNBTENmdDZ1VE9lVnNhWkg3aUxK?=
 =?utf-8?B?QmFESHlKeXN2NU52T0VocGsyQWROSndEYTdUWVJqL01WV1JRdno1VDB6Y0tp?=
 =?utf-8?B?VWh2K096aCtxY2dUL0tieE9meTlUdUJMcnlYdGxnWC92QWRLdkM4ZExNOUFs?=
 =?utf-8?B?Y1RSQ0l0RDdRTXFzWTFJYkxCaTZ0QWhVTy9Ga1pTMEhPQWxkSVhXczdPeXox?=
 =?utf-8?B?OFZOWTBEKzNWbGFYaVdVYUI2UmZ6ZzdEcUZFdEdodTd5aEpHYzNTY1MrWWRV?=
 =?utf-8?B?VjYrUlR3emkxNUwxQU5YSnJHYi9xMjhQdWxQajNDUXpiM2JUZDByT1ZDQ0lv?=
 =?utf-8?B?YXBtazM2YXJHZU9WOWZPQS93VzFNMngrRExTdDVMdzlwUi9DVk5jZ2d4b3dK?=
 =?utf-8?B?REE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da49f75-b9d1-46e9-fd02-08dd97541e65
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 04:09:30.1560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GgzeZho3hg3IayFC5sIS1mBBGKxLhmiU7mtbNgEF9QdSZ+8Ocoodii3YD4dDZHrnYE/IHlGiLEMConKdlAmN6yh/+YAd05GC95vXB8JfN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8054
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

On Tue, May 13, 2025 at 11:03:53PM -0700, Dixit, Ashutosh wrote:
> On Tue, 13 May 2025 15:16:14 -0700, Dixit, Ashutosh wrote:
> >
> > On Tue, 13 May 2025 13:57:41 -0700, Harish Chegondi wrote:
> > >
> > > On Tue, May 13, 2025 at 09:43:32AM -0700, Dixit, Ashutosh wrote:
> > > > On Mon, 12 May 2025 20:07:38 -0700, Harish Chegondi wrote:
> > > > >
> > > > > Some simulation models may not have full EU stall sampling support.
> > > > >
> > > > > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > > > > ---
> > > > >  tests/intel/xe_eu_stall.c | 4 +++-
> > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
> > > > > index 411c30871..bdfa0fc4b 100644
> > > > > --- a/tests/intel/xe_eu_stall.c
> > > > > +++ b/tests/intel/xe_eu_stall.c
> > > > > @@ -586,7 +586,6 @@ enable:
> > > > >
> > > > >	ret = wait_child(&work_load);
> > > > >	igt_assert_f(ret == 0, "waitpid() - ret: %d, errno: %d\n", ret, errno);
> > > > > -	igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> > > > >
> > > > >	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
> > > > >	if (--iter)
> > > > > @@ -594,6 +593,9 @@ enable:
> > > > >
> > > > >	close(stream_fd);
> > > > >	free(buf);
> > > > > +
> > > > > +	if (!igt_run_in_simulation())
> > > > > +		igt_assert_f(num_samples, "No EU stalls detected during the workload\n");
> > > >
> > > > Do we really want to move this here? Wasn't the earlier location better
> > > > since it checked num_samples for every iteration, whereas now we'd check it
> > > > only for the last iteration?
> > > Hi Ashutosh,
> > >
> > > Initially I didn't move. When testing I noticed that if there is no
> > > data, the assert triggers and the following close() and free() are not
> > > called. When the next sub-test gets executed, it returns EBUSY as the
> > > stream is not closed in the previous test. So, I moved this check here.
> > > Anyhow the data from the first iteration is checked in the blocking-read
> > > and non-blocking-read subtests where there is only one iteration.
> >
> > Hmm, the problem is, it's making the code look weird now. Also, if the
> > process dies in an assert, the fd should get closed when the process
> > died.
> 
> Actually, not sure about this, because it is not a fd created by the
> process but an anon fd returned by the open ioctl, so not sure if it gets
> closed. I have seen similar EBUSY's happening in OA tests too when things
> fail. Anyway, take a quick look and see what's happening, if release() is
> getting called or not.
> 
> If EBUSY's are ok, we can add the sim check in the previous place.
Hi Ashutosh,

I have put prints in the driver release() function and ran several
tests. I see that if the test doesn't explicitly close the fd, the fd
gets closed at the end of the test. If no subtest is specified to run,
all sub-tests are run one after another. If one subtest opens an fd but
doesn't close it (due to an assert before close()), it will be closed
only after all subtests have run. Buf if only one subtest is run and the
fd isn't closed in the test due to an assert, the fd gets closed and
release() called at the end of the subtest.

Since I moved the assert() after close(), if the assert gets triggered,
it doesn't affect the next subtest as the close() was called. If I don't
move the assert() after close(), an assert will not close fd and the
next subtest, if it calls open to get another fd, the driver returns
-EBUSY as an earlier session was not closed.
> 
> >
> > Or is there a delay between the process dying and fd getting closed? And
> > the next process is trying to open the fd before the previous process
> > closed the fd? Where did you see the EBUSY issue, is it happening in CI? Or
> > what are you executing to reproduce the EBUSY issue?
If a subtest doesn't call close() due to an assert() and the next
subtest calls open(), the driver while initializing notices that there
is an open session and returns -EBUSY.
> >
> > Can you please add a print in the eu stall release fops and see if
> > release() is not getting called when the process dies (put an artificial
> > assert in igt if needed).
Please see above. I can confirm that if the test doesn't close the fd,
the fd is getting closed at the end of the test.
> >
> > Better to investigate this a little bit more I think.
> >
> > Thanks.
> > --
> > Ashutosh
> >
Thank you
Harish.

> >
> > > >
> > > >
> > > > >  }
> > > > >
> > > > >  static int opt_handler(int opt, int opt_index, void *data)
> > > > > --
> > > > > 2.48.1
> > > > >
