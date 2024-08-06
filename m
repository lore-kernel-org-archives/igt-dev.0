Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FEEC3DA64
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 06:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D7510E009;
	Tue,  6 Aug 2024 06:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktqe248Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141A710E009
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 06:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722925266; x=1754461266;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L3lMjSawSy1jK/qbaByJXGiN1mbnXPfdhbZS9zY0EoM=;
 b=ktqe248ZMB6Hvg/YaY9njZEysGAQt0Godd4JKqmdP/+s1Vh5UsEIhJWi
 creWVzT11O389cUCg38dnda40/DOS40My9qXoCOs5DNn3NBqSNv4Y5QsO
 Uo9cti9zdxz4e2uxMLQQF47CKeKH6kKVpuTSsQ34qBXI5e7AiyrPVY2I7
 T56VOMW2FVsC4KSCkkPARTJQ8x2W6Nt2Gpgs/bdlmolNZ+jNEAJ8HVUfY
 XdDlGkey8OyyoWuGhI2Y+AhI2DfH5DzWNrvCM3/dqgwONRZuSiv6N44Ty
 0CSM5nLoLvZJuwP/tQsPwwLlrGYOWd+3koN4JxHgvGwfcZ4W7OwPw3Gky g==;
X-CSE-ConnectionGUID: wFgR80spSRSmzAyEnDlgkQ==
X-CSE-MsgGUID: 3rEJnjH4RzmOkDGW0v5/8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="31495592"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="31495592"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 23:21:05 -0700
X-CSE-ConnectionGUID: qX3MrlMrQiGTC0Ji/Ej4HA==
X-CSE-MsgGUID: VqFuNeZPTLeYb4/CQKh6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; d="scan'208";a="79661483"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 23:21:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 23:21:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 23:21:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 23:21:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 23:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZka7s/yq5iUin1OVb4K468IdSNlObZf2KqEUNo76xIUmi42EWZmCuzRPjVbnxdIynNuVhRLuABGewUWGHMYJCI9JuWaaztXjZ4kNag2GhIjRn5nzHIyrTmvee0Tzs8TglMg2cLdqyXS/E8PYNsUCeVJRPqDDOkp0mFoZtk8jX32w6NLGpn8XIGulmdOTYLsQukvdA0AtQSOW4fvmiQ7zyQmok4937KFfJwYXP0/lUT3YVjMvEWHvPYGH1auBcusLgbbHvnKYbMOxSOoZmjcLIf7GCYEmEp75JC6TiuAlK0deZwVlcaC5JadRh64z3kHF8MASthEZgXHc4Pks4nCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQuPIqzLq6ywYHWsKcRBN39jxtEnMkvFZ9vo+k4mk8A=;
 b=XqXmMtui2JP0l4Lp/dGlHNlqg9N7Y1W0g1Ub52ke+9teikYjIyIYuXcdHRxSLciVF5+MM0OsmtDFBffYLayetwBo3P5JPMPNvGa4IYuPHkB5KiKZpsR7iZuq4Y0jL1FXttcG+aoMwYlbpY4IjaZFJ/D4NxdP5rNLRIJ7+4domxdas7T7hAU66mpWas+H62Q2A6tSSbr4rknUS7nmfc5bQMW9G0wHM1/Zgr8V81+0odUKnW+sCCPWurKrDmrRjH5oYlgT/UzxkH9uEM861fosVksQVahdWtHlfc0tfqxIYOhTJ3VpBfiUT2UcBPLUqobHaaWKCN9fkn9F80IrdhalvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Tue, 6 Aug
 2024 06:20:56 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 06:20:54 +0000
Message-ID: <8fba7a7c-47f0-436c-b839-635a5edec4f9@intel.com>
Date: Tue, 6 Aug 2024 11:50:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without
 display
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b221f39-93d9-4d7f-1618-08dcb5dfed49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGR1MUtOV01VYmpvRkt6dDVDaHdPR2oyd2RJYmtMUHNGOG1vaWc0RU5PcDBs?=
 =?utf-8?B?S2l0VVFUR1ZYWS80MlZPYVo3ZUxhbmlwdmNIWFBpMnZTTW9PbTBNakNCUTlU?=
 =?utf-8?B?eDlNYlh1bE80K0R3b2ozS2l2SWwzOXRsMGpKMDJuK20rb29zajFCS1dzSHRm?=
 =?utf-8?B?YzBaWFcvTEVJa2NXUHB1UkhVMS9hNGJadGtUTGkzWEZiSGxRMENpbUdLa1Ra?=
 =?utf-8?B?NkdyenVFc3JJWjMyOVFiL2tnSUV1dWk3QmNGTElRMThiSVdxOVR3WXI4cXpN?=
 =?utf-8?B?UkVqSk9jaDRGSkNCcXZzUHB1L1ZLYjA3aytVMG82cGRhNmJWcEo2M3B1UDFs?=
 =?utf-8?B?aUtHOUh1YmFxUG9CYUZKNGpxM0VybkIwSWJBYTZ0UzJBZHVkNXluSlFmT1p4?=
 =?utf-8?B?RjRXM0FrMVk3STduOUtXRG1qS1N4V2hSYjdoaFJUNUdCeDJDODJ6M29WTEpt?=
 =?utf-8?B?WWdtUGZFT2sxcGFTMjBqN3N5cE9EblhrejNLQmxlVTdlUzZuRm93OGt2VzJP?=
 =?utf-8?B?VjFQdGVlVTdSN2JqWG94YWljYTZ4MXJBM0V1ZGZ1ZjFkMjZXajE1eEFxc3RR?=
 =?utf-8?B?RHhFVkRvbkVLRXVoQ3lSOURDZmdWa3ZFY25URzc2RkVoQjNIbS9ZSytZT2Rj?=
 =?utf-8?B?SS9KdS9Ca3MwSWdEZEJzTXVPZ3hBNWtJb3FmUi9DaElyT1VnZURPcDhYaitq?=
 =?utf-8?B?OWU2aFAvZkE5M2h2d1pqUHgrcG9leTRTSUtpWTRkMlo5L0pOQkYxWnJKaDBX?=
 =?utf-8?B?K2dGUXF3WktoTzZId053VXlFSnJDaWVjS1JQb2RGaW85U2hrVityUTVGUGM4?=
 =?utf-8?B?VVZiSUlqcHljUHJYWGkxcTNmRms3cldlUk5ubll5ZC9tSG9ydDFwenhKbU9G?=
 =?utf-8?B?V293TE5XcWc5NFBPY0lhRDRmM0F3dXEzRzRMaTBXTE9kWGtlZTdRQzE0TUdk?=
 =?utf-8?B?eHk1N3I5VkE1bnJiZ09Zd0kvNVNzdjBwUEF5anB0eElwbkdTMjNuNmtRcFFH?=
 =?utf-8?B?ZWF4M05zWGZtYUF6U2hMYlRuUDRJMzNwak5tYkIzL0pFTnJEc2FPT3plRGl6?=
 =?utf-8?B?SFNIODlBZHRWejBLTVF2ZDAxdEs5QUw1RWU1bkNQSWxOVnlyYXVWNy9WZXJu?=
 =?utf-8?B?eE02VThrRDR1RFF6QnIwTGc4VW1xeTU0QTNlbVVVSjdPOW81a2g0N2M2WHd5?=
 =?utf-8?B?VWVja0FVT3pseEFQbnV4OXkraUdlYWNHQit1ZHB5VjlpV3Q1UE96bkRSSVBP?=
 =?utf-8?B?QU9jTjVJNmU1b3p6S0RDRTl3SlcvUlJHRDArMGVxNElyS0dyam1FaitOU05J?=
 =?utf-8?B?aUdtanlOSG9sOE02aGR5V2ErK1N1WlM1bFpnOC95MWVnTDR3dDh5WHdhNXdN?=
 =?utf-8?B?VkdXdHNwSk1kUThlcW1zQzZkdlV5MUtNVW9ZcXh3aUNqNUwrckxGVFd0Q3Vt?=
 =?utf-8?B?MDhESjZ1L2hlUU5NMy9UckNkeDlWN0pGMkF0NjJPRnhIVWhWNlJHSTJPSitt?=
 =?utf-8?B?T0drUWsrS1Z3MlExNUh2Qm9UNjQ2M3JZcnZLcHFRWU52UWFFQmlBYTlyTi9M?=
 =?utf-8?B?SjNCaElXRmZZRUxCbXo5dHFlQ0JwT0c0WWh1cHNaTzVjcHowWHdBTDF3RDVj?=
 =?utf-8?B?bkhEeG9Lcy9HRSt2VVNxS2FMRkFNT050OHBXT254Z0RhQTBpSFZtSkJEaFE2?=
 =?utf-8?B?dCtVN2NtdVQxSzRncXVlNWhpKzNMWWF2RjYrdFNMbS95aDBEUmw3SURRYXJM?=
 =?utf-8?B?RzBnNWRUTmRmdmRYcTl4KzRoV25vT213QUsxYWRyR01CcGNGd0tFRllwOHh4?=
 =?utf-8?B?bmlaYXBVZzVzUzI2dzJhZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFlU0xtNXJ2OUlwcG5CWStoRnJ4bnJFdDVsT0E5citrOTFKYTJpb2tmVUZZ?=
 =?utf-8?B?NnVxeDBFSVVQaEh2WWxHeWExRHlkTFJXK3g3QVFmTURnNlNCaTBpUUhLMjFX?=
 =?utf-8?B?T3RIeFJtbGNzc1NjeWp0TmM5c3RQNW1TWlZCWloxNlV6VXNGSXpXYzdiMTMr?=
 =?utf-8?B?R2JVSkg2ZEdpNzhHQ25nU2lsQlpOUUdzbnVXaU5uTVZ6SGVEZG9vWE5CZTJl?=
 =?utf-8?B?SFN0SzRIZ0R1aWxQeDR2dlFqUmNIbDByQmFKa3pxN0tMdHJOOUxhbnR0U1J0?=
 =?utf-8?B?L3pqRnhTSkwzb0k1QXpTL2RMVFFncUdFZGpSeFNKK1Y5dXdZZUFDY09MWEpE?=
 =?utf-8?B?NXl1MHhpQVJkQnQ1OXZWMEJQMjZFb1k4L3VJR3VqS3B4Y2Fpc1VKNlUrS1dI?=
 =?utf-8?B?Y1hOaHREdlF3RFAvbzlyS0JhTzZCNkNJMGdvbTB4N1diNWV2dU0zMG01bTlj?=
 =?utf-8?B?MmxKdE5FZmxMdVdkS01rY3dRSzlSYzdHR0VwdjVyL2hRbnBibFFCMTRQRUhI?=
 =?utf-8?B?UlFoa2lRYlR0NzlSTW8zNVoxNS9QUmtsWnpCdTBPUlJxVHlYbnVGNElDZFIr?=
 =?utf-8?B?bjdrcDhlOTBSMDh3dzhCa29hQTM2cjc0Tk1HWGNFcmpUTGVESXdyc1p5UWVX?=
 =?utf-8?B?R2xxLzhYQy9QdzllWFN6MHJCZzh5S2dPU3N5WHdadzlIdHlickxQUjNKMkMr?=
 =?utf-8?B?aDI4VTVEWG0wL0xQSEJNTEtKWXN1VmwrU0RNUDJQRUw1SVpJalcwYmQwQldX?=
 =?utf-8?B?YkRaMXdGK1RTNE9VVGtybEhwdWhWdEFXUlVmSm9HTmlTcFBFaTJlSDRPR3E4?=
 =?utf-8?B?QXVOdFJzWGg4NUt1Ny9LRGszcHd5L25VT3RIVXhtYm1WN3lxaVg5UDFDK1Vp?=
 =?utf-8?B?QzZNWjlBbGl3Z3RGenk2dWt4SHBzSjM4dlNCRFRKR3p4TlhjWUxLYWNOZ1lm?=
 =?utf-8?B?eE1qZEFTZm9VWXdKNjlQY0JkbzdEaWE0aCtsZDE0N0k2eGlvZzk3SHdzQWxP?=
 =?utf-8?B?WDdCcmFnRWV6U2JFZEp6Qm1DdGNwUHZYV2habmdJMCtNTWNlYUFlZXJPSldE?=
 =?utf-8?B?OEpnbkVReG9WWTROeTBubjZSNGh3ZTRGV1c3SDBpenZIRjg0QUNhVEhOS2dK?=
 =?utf-8?B?dUJMNEtXcU1pblZDdlBNTWlqOWZrSWg5TGp1cndCZkdlU2RDOEsxUGhjcXZB?=
 =?utf-8?B?TFlrUWVlRTBxRy9ITzF3LzdHcFZCbHAxTlZDaW1JYkI5di9FVjkrTDdNRmhx?=
 =?utf-8?B?K2M2WHlkRDI0ZkN3NnlNOTY0MGxiUFYvTTFoK3FGdkNDMkFnOWhqVERMc0py?=
 =?utf-8?B?Y2ordGZmbFIxbTQ1MzVwajVFYXZUNmtKY29FN2k2OXlCVlJDQkRoOGZFanIw?=
 =?utf-8?B?ekk2cFZuZmZSVklRS0VvQnRzMlRoRXBFNFZkanVTTGVrSmxEQ3E3UXkrT2Nu?=
 =?utf-8?B?a0NWS2ErSHNPQmcxUmlETmtWSkxGaFQwa3piVEFHUFRwSllaQURFTkZLNE44?=
 =?utf-8?B?RXV3WXNORWZGVnVldkxBaVNqN0lEWVJaZ0doU2VTR1RMOFVReXoydzZiWWVt?=
 =?utf-8?B?YURjVWw3dTkxd2RiRTRyWWtONEwzNHhjdVBZenpFWllmazhUNEpYdzhHcXhB?=
 =?utf-8?B?NmduRm5KeVpnSTlvQVplQWlOSGJSeVlTVk91TkVjUzg2SWI5ZFVYWm9FYy9I?=
 =?utf-8?B?RU5mVmk0VlpmTTdqMUxIVW9xM1hBOUVVSDRuZmRiTWJ6MmlCRk5ISDZueDY5?=
 =?utf-8?B?eUJoMnpFRjJNMXQ4WmVOejdZQ3lJTEd5RHFhZks1ajJONVlqdjVBZFRSMGV1?=
 =?utf-8?B?MnVLWkdYRkl6V2graVdsUFp4bjBWV25EOUtpNVNXY1V1Tis2VmxZeTlSejFi?=
 =?utf-8?B?ZjFXTjdsV2xaUmJkcitLcUVCeFJBK21yTWYrMVI0VDBPZ1lMc0dabmxmWkpE?=
 =?utf-8?B?SFAzQktURWJidjRuREpwbE11azBKTHVnZFVIWlcrN3R1d1F0UjJ6RXJIdXNq?=
 =?utf-8?B?N25CK2tnZHdZOThtQkN2R1dJK2x2N253VUlJdVZRL1NicnJBMkZmTzdhN0R4?=
 =?utf-8?B?d3dBK1NZUWorbUEwU1ZyaTJhRnoxVmJYaVdpTlo5Nm5IYjlncFRlbXhnVmk1?=
 =?utf-8?B?QWErVXFFOGRZQXgvc0Jma1ZFWHRFMzlLZGtoVk1uSGVFNzdRYUROa21DTUNZ?=
 =?utf-8?Q?4T5/7GGRAANQIJleFP/+ULY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b221f39-93d9-4d7f-1618-08dcb5dfed49
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 06:20:54.6510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skDvArxyiMlGhfihT7Y6+Br8x9qIxK8alx7xFEpm7Km35EC/S9Lw159ObooLtCtN1sxGA5vjpUMZeRvh/QqcETV0wPwLWXWG/9YD7IhzUKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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


On 8/1/2024 5:15 PM, Kamil Konieczny wrote:
> Hi Sujaritha,
> On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:
>
> small nit about subject, you wrote:
>
> [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display
>
> imho this should be:
>
> [PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display
>
> More nits below.

Hey Kamil,

Sure this change I can make.

>
>> Add tests to validate basic execution suspend/resume cycle
>> without display module to rule out display related issues
>> from the suspend/resume stack.
>>
>> v2: Add normal reload cycle after running test (Anshuman)
>>
>> v3: Rebase
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>>   tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 8b115e2f6..03f742265 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -17,6 +17,7 @@
>>   
>>   #include "igt.h"
>>   #include "lib/igt_device.h"
>> +#include "lib/igt_kmod.h"
>>   #include "lib/igt_pm.h"
>>   #include "lib/igt_sysfs.h"
>>   #include "lib/igt_syncobj.h"
>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>    * Description: suspend/autoresume on %arg[1] state and exec after RPM
>>    * Functionality: pm - %arg[1]
>>    *
>> + * SUBTEST: %s-without-display
>> + * Description: suspend/autoresume on %arg[1] state without display
>> + * Functionality: pm - %arg[1]
> I see you copy-pasted it but imho both Description and
> Functionality documentation fields should be static, here and
> in other places.
> +cc Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>
>> + *
>>    * arg[1]:
>>    *
>>    * @s2idle:	s2idle
>> @@ -681,6 +686,7 @@ igt_main
>>   	struct drm_xe_engine_class_instance *hwe;
>>   	device_t device;
>>   	uint32_t d3cold_allowed;
>> +	const char *opts;
>>   	int sysfs_fd;
>>   
>>   	const struct s_state {
>> @@ -757,6 +763,34 @@ igt_main
>>   					  NO_RPM, 0);
>>   		}
>>   
>> +		igt_subtest_f("%s-without-display", s->name) {
>> +
>> +			if (!drmModeGetResources(device.fd_xe))
>> +				return;
> Why 'return' here?! Imho this should be checked in fixture
> or be a skip. Or other way around - what about a headless board
> or one without any connected display?
>
> Regards,
> Kamil

I think this patch idea sort stemmed from the cases where we have a 
display connected and

want to make sure that the suspend/resume issues are not being caused by 
the display.

But would you suggest expanding the test to have the headless/no display 
situations? If so what changes are you suggesting for that ?

Thanks,

Suja

>
>> +
>> +			xe_for_each_engine(device.fd_xe, hwe) {
>> +
>> +				igt_debug("Reload w/o display\n");
>> +
>> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
>> +				igt_assert_eq(igt_xe_driver_unload(), 0);
>> +
>> +				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
>> +				igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>> +
>> +				test_exec(device, hwe, 1, 2, s->state,
>> +					  NO_RPM, 0);
>> +
>> +				igt_debug("Reload as normal\n");
>> +
>> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
>> +				igt_assert_eq(igt_xe_driver_unload(), 0);
>> +
>> +				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
>> +				igt_assert_eq(igt_xe_driver_load(opts), 0);
>> +			}
>> +		}
>> +
>>   		for (const struct vm_op *op = vm_op; op->name; op++) {
>>   			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>>   				xe_for_each_engine(device.fd_xe, hwe)
>> -- 
>> 2.34.1
>>
