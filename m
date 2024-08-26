Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B5DC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 18:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C8A10E284;
	Mon, 26 Aug 2024 18:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQBQKiML";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C90810E284
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724697506; x=1756233506;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=hKC7r56XSkxP4z1+TDzlw1y5sZPhwDK3jIihTlg3j3w=;
 b=OQBQKiMLbuOMdksrF85j0Iwjd7LFMseZsaSLKmFCDK+5vKWVxBdX6go9
 No+AF6lq+rAbP7hSxsRx2yY7247uLcoZJXswECS8Qn92PthZAz6P3Lkxr
 Mnl2PrHfPDo0aAjvfwkIQh/3S+YvzrSQQgovJpal1CSkhFdLLb+sMvtaO
 71hsUkoSpwqpIN4kl17xnzfHk04kBsyyhdXC4Wh+Dg51/OSyO3xy4Fs62
 uI96KhmxJ71+Py+p5Tn4CYr4ITVZZuOgSaUppuNhbaZBQAVpJl/SYz6Hg
 x56q6niBQoyB3FKoMABVMZStTbUB52G1nmVVMnBTLRbNpTD497aLI1dMt Q==;
X-CSE-ConnectionGUID: +vzpPeqQRE+bGpzyx8WRXQ==
X-CSE-MsgGUID: 9TQoHRwiRfGYezhoQV4Bzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23028018"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="23028018"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 11:38:25 -0700
X-CSE-ConnectionGUID: Kttm73ZNRXSFEfRibVAlJw==
X-CSE-MsgGUID: caskwIFdRdmrdIWSuTaIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="67531452"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 11:38:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 11:38:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 11:38:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 11:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9bR3XcRgqT8CAt+4mZMZqG41UCT6kpb53MUz6iLW+099tbuVGzaUqWLVBNbT7riYeAdqCAisGOgIVv+GS52OGyLZxWTjMr6pYLIUdbfOI/oWssCff4ePTMj/T2NwBRpCvjOAhiOhGyG83Oy3RwvChpQ5dRgSrUTh2GMaMfr6n6ThfMesFlzeVyzHQmVL9icUfiz+a1bKrE1z8XiqHybyKzJ2aAP7HX0jX3bZ1Ql7DhrY+ZZo0GSU7WzI4EE+DGc0Gyw314C/ke+kNwpqvBB4hm/BOwxxLhkFcnefsE+yWPUD2sFVe+QNKuBKWQdhjQrsj6BZs4nXPYcdW9RVTVqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j75dxR0V7r2TYIYVVtQnP1gUvmZbaPaFVhmRoffPVuc=;
 b=HMIA1UoBVYjxDhRITXrWgZWMWh/GPHje3MXkf786Hoesl24THjBOMFUk+f0wK+gwPCa/z0qmA7eM20RwGhBEn1KQYOQS6vSFhu/V89IVNJQNsPNWcPXAem9L5zYNuZD9cVCZNmr2N3Y8buNr7JNqyytmyEguoMomTsTj5CItv/Wcq3pQs7GWTQUD7cFXb7ap3bkJx8C4qRR5ZulwNk9GvEs14zrnajskby6cygforeAeT6p1lDJ2LXdyTtCm254o9KwjN5tz4aSukLzRNxLYtbk8glQw5EjvStVnhlE2t4YpENvg6U+fmWmQZ5RJSMjV46oQuaawBGB1/qQjx+VFjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 18:38:17 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 18:38:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240826152656.1306490-7-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
 <20240826152656.1306490-7-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 6/6] tools/intel-gfx-fw-info: Add proper HuC
 parser
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Aug 2024 15:38:09 -0300
Message-ID: <172469748936.6014.14245867020935461577@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW2PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:907:1::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW3PR11MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7e3712-20e3-428e-cf53-08dcc5fe402c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFJaR2x0SmoxUDhMSkFFdCtaV2FnbWpVclRKWkl2M2lreHZWcHB6WXAvcW54?=
 =?utf-8?B?a3RyaUhRdlNBUi9QV2wzOXVBMFhEWVdBYXpUN1JqbFh4NVlrQ1pUYW9INXl0?=
 =?utf-8?B?YTNSTk80OERqTTRlSzBxMkllTDNsR1Q2dHBjVzgrejd0YllKRFB6QkFOUVRB?=
 =?utf-8?B?UjQ3T3IvVmJqMXBZYkN6akVHMldwWHc2YkFtRHlBK0hYamNOeXBrbmVEZDRa?=
 =?utf-8?B?T0k1VjVnRzJpR2ZxbCtONzVQRm5zbzJQTjViY3NWcmYyV0NpbktKQVhmOGFT?=
 =?utf-8?B?MC81Z3FqODNhaWpXeWlDaVI3Z1gxNjE3R2xlSzFFd1dpWUMwOEpkWEFaSVEw?=
 =?utf-8?B?Z3dtV2lUZUh4VnlISmdnazRKWGFtV3NhVUJsVE5DMzNFemhWdXd6dUE0UGtV?=
 =?utf-8?B?d0Q0YThFMVNOTVYyUEU1emxmaTc0Q0NmM3pqY0ZBOWowVk9UbHB1Ym5QRWZO?=
 =?utf-8?B?RitVaG5pOGx2NXg4amhiUnlYSXZGU3daeDJOajVQR0pCUVgyOW9JT2UzQjh2?=
 =?utf-8?B?aENyUFZsRDJvME4zVnpZbEt5SzRBNmorNUpFbHVpYVpWYUpXbmFaK3pjeWs1?=
 =?utf-8?B?dGc4aVQzRUUzYWJQcVpMK096Q1pzeG80SHpjdE52SUxnV0d0Z0hYZzZZdzNj?=
 =?utf-8?B?b3puT3Vta25OR1BkcG1QdmZ6NUNXQW8vaE9pNHlGSllQWDBzZDMxNGJKb3JH?=
 =?utf-8?B?emIrZHhMek51djdia2Zodis5bjRmQVErYmxjOVBRZU93bjBLMlljOVNWREZZ?=
 =?utf-8?B?SzYyajlTcGhHNDN3cUZqdHVzazlWZW95dXBJTUdoM3pMTkE5bHBPaFJXRmg3?=
 =?utf-8?B?RWJoeFJyS2g3VU9sT1M5czVHSjF2UW5vSUpaMXZoWkdITDRTejQrQ3hYYTMr?=
 =?utf-8?B?ZWwzWDN0SWY1S0pGcEJUbldXdTc1M093bUhzWEYreXIxWEJRVVVjdVVtaEk5?=
 =?utf-8?B?ZENqaytSZVRkajUxdXlWd2hmMTlEZzN5M1haemFwd0lKaE1Ea2ZPek40Y1FK?=
 =?utf-8?B?OGZWSUIzdjIrOFNyWjVmbm8vK3FucENhZ3lIK3R5cHlOSS9ONDNldkdkdEky?=
 =?utf-8?B?VHFSbXo1cFlpSUloY29sT21HQXlxZ0Mxa2dkYWttTXdtcWNtOEZvWlc1ekhI?=
 =?utf-8?B?T0lOSm1iZEMrdGU4YkY1WGJJRllsd2g2SStHV1NTZDJRQkVaRzdDc24vSWJo?=
 =?utf-8?B?enFTS3RFaFhKbFZ0bWZqSUh4SFFnSG9yYS9oVXNnYXUwS2tHVVcyQ21Hbk1j?=
 =?utf-8?B?NExsOXFXWWR2ZVFwNjM5SlVhVFNTcG5EaW5YZzlLbkNZdzR0akxBbDBCNi9k?=
 =?utf-8?B?bTNIenprUDA4b1FDSGRFdElrNUlFL3JxZEs4MXJURXJCNFZDRmh2UmxNN2hB?=
 =?utf-8?B?TFRKb01LQVRCY0ZLS0tPcTlkb0E1MDhDUmFZVzRoNkR1dDQwSHM5UGh1SmxU?=
 =?utf-8?B?SDByeU5aWG9ZRzJFZlg0eThyanR5M3pvOWpISGcycDAwN1E0ekUveEFrdkpx?=
 =?utf-8?B?RXhNR01kTlY3bFFIcDVzOFAyNkpFMWlqdzlscHErSmE1MDBsWW54OFVzMWZy?=
 =?utf-8?B?WllpdDBENlV0WUJuSHhsbjUySFJlbzNkT2dmZU5lbnJQaWYreklvS2FzekVO?=
 =?utf-8?B?aHJNRStSNlArOFArcWV2OTZrdEhBZHpYczNwSXJHVWltZGZTa2xJUmFyNjk1?=
 =?utf-8?B?VDBwRmp5OWpURHpqcFBJZVR1cytEaXNFa3liOGFwUCs2SEpDOWY5MmZLb0NZ?=
 =?utf-8?Q?z4prQqAHhChOigWm5w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRVK0FBZmpKaE5zaTVpb1lSbTNmTmVVb2tXMkMzUnphZGp3UFQyZXB0TnVY?=
 =?utf-8?B?YklEUXR3SjA1bUZPQWluR2FkYSs1T1JFRUlrU1U3NFVVc05OdnJaTWg5YS83?=
 =?utf-8?B?enJOUDIzM0RJVGhlWTJKeHJkeEZKK1AwYmVqM3dVNlpzZGRJQVMwcWJQN3Zv?=
 =?utf-8?B?UjRMRjZSK3Y5V2FZYUVZaWpSWkZWK0wrUGtFL1ZVdkNTOWRpK3cwZkJzT1ZB?=
 =?utf-8?B?WXFCaElwY0tNQ1VJajVWL204eGhST1VCNG9CSzlVckJ0UXo4TWhGVmQ2aHhi?=
 =?utf-8?B?WXpyNzA3SmxxbHZmdEhzaHRUNFNVdFhleUZOMW91QUNOTWNFU0p2K0w3b2gz?=
 =?utf-8?B?L0swYmRad1c5NVh5RFVxYmJ6cGZiR2xHUk1KOWR2OVEzeDd2NGlXWkxYNXF4?=
 =?utf-8?B?U2JxcCswV2RmTUJqVlJLdEJGeUZzMmI0TFVNK0E4Zkx2VHphZWdHbGlpa2g4?=
 =?utf-8?B?ZmRzcnBoQ3NLell2cGlRYis1MTBxVnExWTcwQWRRcE5FYlhuVTQ4WUZjOWx0?=
 =?utf-8?B?OWJ1YVhpeSt1N0dvdzZkaTV3VnNJQ0wwRlFMNmJjMEFma2ZjV1hIcTJxcHVo?=
 =?utf-8?B?ZWg3TUFnT2pEQk5ZMytSS1gzVHBhMzA3Z1U3bFpCOUhVUlhodHpUc1lIRGlq?=
 =?utf-8?B?V29mTXAxSU5NQVRwZW9UNXp3UThTeVJ6WjhwOWNiaHdwV21uaTV1c3dsejVR?=
 =?utf-8?B?RjhudU9pZjdLdlBwVVlPbForOGUwNWN3bUhmTnd0Vk8yV0gzM25kVjR2ZEh3?=
 =?utf-8?B?WktidTY0ekVJY3JYSkh2d293V0RMTjVubytpU3gvL0dDemw5NEEzNXg1eXBR?=
 =?utf-8?B?VlY3SllIdjZUdGdJOCtDRjZvVkVkLzBHdC8vb2RpUDVTbTc2NGwyNmcxN1o0?=
 =?utf-8?B?Y211emFva0JMQjhRL1hNM3lUd3BMaVJPZ0pGdjBjZldPYnVFN003bXVwRFIr?=
 =?utf-8?B?OVFXZFhwZkR5SFdrMWJrUHluTG1VdEVKbUlGa1JWSHVKU2ZiNmFoUE40cUU3?=
 =?utf-8?B?QWpOQmYzalU5U05QeDdoMkpObm5lSjFnNHZBUmlQckNrOXhMejl3YVN2UDZU?=
 =?utf-8?B?QzE4RTBNRG1MMzZKa29EL20rNnZha0lESUN0L09TWU9ESFlJVlRyakIrNUdv?=
 =?utf-8?B?VndjbDhYMVgvWFFiZTA4UnNQMlVRazNOeVJoZVFKcFZLYmxNVUpoNHJIbGVU?=
 =?utf-8?B?a2cvV3k5NDdyQ01sYTVRbHpYY3drN2crK1pEMHRRYWswT0txanRrTGV3RHVx?=
 =?utf-8?B?N1ZqN0toQmsrQVZlWm9uL0o2dS91L2VqRjZJZFRWY21XNm8wc3l6bmlhNkVH?=
 =?utf-8?B?RDJRTGV5b00vckhtUERvUGFSWndiSUhiSVpkR2plbk5VMnBCQjVVMzJmUGpt?=
 =?utf-8?B?ZVVsYjlqN3o4RDRzdWZOS1Jacnc5TzEwakVINEhidy9Rdy9GeDY2Y3BlVzcy?=
 =?utf-8?B?eXNhcHM1eEhFZ0dIZ29VZUpwZjFpcFVXVEhqNVY0NGEyQW9kaFFvVVgvTms5?=
 =?utf-8?B?S1lyZ3pNWVl2UytOb1dHR0xoSHRjc0IwUWFXSVhNSktGNnZVTFdPdVA1UnVx?=
 =?utf-8?B?U1JZVUl6Qm03SHFtMmFhMWZWVVlzeHE4QkRNckQxaTcrVVdBYkZMd3lGdkI3?=
 =?utf-8?B?dURuK255ZnVmaCtRTHdZYUpCR1NUS2VJODc2ZEV6enN0QVJBVmZqMk5TT2FB?=
 =?utf-8?B?dUFLQkgyN2RlNW0xUCtTbkQrTE1HN2Z1bEJNdG14eWN3eXhFRUZuS2NTbE54?=
 =?utf-8?B?SjRIY1A3YXdIZTZuZTFFQ1hZbmlFN0lkRnBvd2t0TWZhZEVJT1gxbXBzY0Zx?=
 =?utf-8?B?NkJXRWRSWWg4eG03WWZpeEFrbUpKR3IvYlJnLytxVU5qalZVUm4vYkdDWU5o?=
 =?utf-8?B?YzFTZ1lPWXBJdFVvdDgyY1ZDdnN2SjFRVGVUdmx1bnFieUhvWmI2OU80R01w?=
 =?utf-8?B?c2JrcnRQbVd1cVNFeFpyV0lQWCtGSmR5RkNzbGxpelVoL1Q4MjVVZ2dHSXN6?=
 =?utf-8?B?VUdJS3FvcXRER24wM1kvejl3a2NtTzV0bXZmTHU0Zlp4NFpPYnpGSjc5QUlk?=
 =?utf-8?B?OG5hdVN0d3NPenVFeG02T1ZZd3U3anpTQ2NjODBoOUhDcDgrT3IxNGIzMkRx?=
 =?utf-8?B?UVorbGhNQk5LWEMrc3l2RFFZNFlpdlFNTTJCZ3ZsYXB0UmJkRENBSXFXMnBC?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7e3712-20e3-428e-cf53-08dcc5fe402c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 18:38:17.1228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBmWuXS5AawQ4nNOCrquR5TwQABbgfTN+Du/qn1zytMxVi/cMktduA+g/wjzg6qPjA/cZ4ATojhsZZdthI+GNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
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

Quoting Lucas De Marchi (2024-08-26 12:26:56-03:00)
>Initial implementation to parse HuC's header was lazy and assumed the
>manifest was the first entry in the cpd, which is not necessarily true.
>Add proper parsing for the headers that matches the one documented
>in https://docs.kernel.org/gpu/xe/xe_firmware.html#firmware-layout
>as "GSC-based HuC firmware layout ".
>
>Before (wrong):
>        $ intel-gfx-fw-info -c /lib/firmware/xe/lnl_huc.bin
>        header-type: GSC
>        version: 13.91.1
>        checksum: 320e765cbe42b0f5f95333794a6a00a4e67246d6ad8393b59b64efdc=
3506cfe9
>
>After (fixed):
>        $ intel-gfx-fw-info -c /lib/firmware/xe/lnl_huc.bin
>        header-type: GSC
>        version: 9.4.13
>        checksum: 320e765cbe42b0f5f95333794a6a00a4e67246d6ad8393b59b64efdc=
3506cfe9
>
>Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tools/intel-gfx-fw-info | 105 ++++++++++++++++++++++++++++++++--------
> 1 file changed, 84 insertions(+), 21 deletions(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index fb98f1bcc..c3b98ebc1 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -60,19 +60,68 @@ struct uc_css_header {
>         u32 header_info;
> };
>=20
>-#define HUC_GSC_VERSION_HI_DW                44
>-#define   HUC_GSC_MAJOR_VER_HI_MASK        (0xFF << 0)
>-#define   HUC_GSC_MINOR_VER_HI_MASK        (0xFF << 16)
>-#define HUC_GSC_VERSION_LO_DW                45
>-#define   HUC_GSC_PATCH_VER_LO_MASK        (0xFF << 0)
>-
>-// Add a fake definition for the GSC's header so this script can still
>-// check the version
>-
>-struct uc_huc_gsc_header {
>-        u32 rsvd[HUC_GSC_VERSION_HI_DW];
>-        u32 ver_hi;
>-        u32 ver_lo;
>+/* Code partition directory (CPD) structures */
>+#define GSC_CPD_HEADER_MARKER 0x44504324
>+struct gsc_cpd_header_v2 {
>+        u32 header_marker;
>+
>+        u32 num_of_entries;
>+        u8 header_version;
>+        u8 entry_version;
>+        u8 header_length; /* in bytes */
>+        u8 flags;
>+        u32 partition_name;
>+        u32 crc32;
>+};
>+
>+// Added as python code
>+// #define GSC_CPD_ENTRY_OFFSET_MASK GENMASK(24, 0)
>+
>+struct gsc_version {
>+        u16 major;
>+        u16 minor;
>+        u16 hotfix;
>+        u16 build;
>+};
>+
>+struct gsc_cpd_entry {
>+        u8 name[12];
>+
>+        /*
>+         * Bits 0-24: offset from the beginning of the code partition
>+         * Bit 25: huffman compressed
>+         * Bits 26-31: reserved
>+         */
>+        u32 offset;
>+
>+        /*
>+         * Module/Item length, in bytes. For Huffman-compressed modules, =
this
>+         * refers to the uncompressed size. For software-compressed modul=
es,
>+         * this refers to the compressed size.
>+         */
>+        u32 length;
>+
>+        u8 reserved[4];
>+};
>+
>+struct gsc_manifest_header {
>+        u32 header_type; /* 0x4 for manifest type */
>+        u32 header_length; /* in dwords */
>+        u32 header_version;
>+        u32 flags;
>+        u32 vendor;
>+        u32 date;
>+        u32 size; /* In dwords, size of entire manifest (header + extensi=
ons) */
>+        u32 header_id;
>+        u32 internal_data;
>+        struct gsc_version fw_version;
>+        u32 security_version;
>+        struct gsc_version meu_kit_version;
>+        u32 meu_manifest_version;
>+        u8 general_data[4];
>+        u8 reserved3[56];
>+        u32 modulus_size; /* in dwords */
>+        u32 exponent_size; /* in dwords */
> };
>=20
> struct magic {
>@@ -91,6 +140,9 @@ except ImportError as e:
>     raise SystemExit(1) from e
>=20
>=20
>+GSC_CPD_ENTRY_OFFSET_MASK =3D 0x1FFFFFF
>+
>+
> def ffs(x: int) -> int:
>     """Returns the index, counting from 0, of the
>     least significant set bit in `x`.
>@@ -181,17 +233,28 @@ class FwGsc(Fw):
>=20
>     def decode(self):
>         self.f.seek(0, 0)
>-        self.fw =3D self.cparser.uc_huc_gsc_header(self.f)
>+        self.fw =3D self.cparser.gsc_cpd_header_v2(self.f)
>=20
>         data =3D ["header-type: GSC"]
>=20
>-        HUC_GSC_MINOR_VER_HI_MASK =3D 0xFF << 16
>-        HUC_GSC_MAJOR_VER_HI_MASK =3D 0xFF
>-        HUC_GSC_PATCH_VER_LO_MASK =3D 0xFF
>-        major =3D FIELD_GET(HUC_GSC_MAJOR_VER_HI_MASK, self.fw.ver_hi)
>-        minor =3D FIELD_GET(HUC_GSC_MINOR_VER_HI_MASK, self.fw.ver_hi)
>-        patch =3D FIELD_GET(HUC_GSC_PATCH_VER_LO_MASK, self.fw.ver_lo)
>-        data +=3D [f"version: {major}.{minor}.{patch}"]
>+        # find manifest entry
>+        self.f.seek(self.fw.header_length, 0)
>+        for _ in range(self.fw.num_of_entries):
>+            entry =3D self.cparser.gsc_cpd_entry(self.f)
>+            s =3D "".join(map(chr, entry.name)).rstrip("\x00")
>+            if s =3D=3D "HUCP.man":
>+                offset =3D entry.offset & GSC_CPD_ENTRY_OFFSET_MASK
>+                self.f.seek(offset, 0)
>+                break
>+        else:
>+            logging.fatal("Unknown/corrupted firmware - no manifest avail=
able")
>+            sys.exit(1)
>+
>+        self.fw =3D self.cparser.gsc_manifest_header(self.f)

I think this is the only meaningful assignment to self.fw. I think we
could use a local variable for the CPD header.

Other than that,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+        major =3D self.fw.fw_version.major
>+        minor =3D self.fw.fw_version.minor
>+        hotfix =3D self.fw.fw_version.hotfix
>+        data +=3D [f"version: {major}.{minor}.{hotfix}"]
>=20
>         return data
>=20
>--=20
>2.43.0
>
