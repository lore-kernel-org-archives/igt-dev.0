Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7188AD10F23
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0010E565;
	Wed, 26 Nov 2025 10:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aA0J1J9h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DAF10E5A9
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152931; x=1795688931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rMfECa8XjqQuNNEbwwdvu2gMRM3yo2pUWsXh6B1l50s=;
 b=aA0J1J9hsUW4qC/oBOJiNPmcc0PQ24mS4yYuR41o63Epe1PxORMLCw/6
 +q/vkDTo622C5gr5LZoEcjJBrTb6zu7D8zpfHDirG1TA+PMQmAUe7rtq5
 BTnZjhCT3DxzxR9a51JZBBvsgv1rLhfJA7i7eQW0mG4TcIWRe0mpZrgV7
 6FS1sexSgx2aeKeHh/kVfzxV/5Pw8FRLocwKCaAsA4OHVXheHeVyDHCE2
 J5g+L0zLIuhy2nC7mKmOrKraV5VTNXaasFuJom28YJl5fGoyeJexMhfXY
 G1UHoyiywhVXZIo6h6CVZ0GfI95izKhz7rDsS0EvBmIXvfQqthKZjVOgz A==;
X-CSE-ConnectionGUID: YV63ACaySRuX5swgf2v+XQ==
X-CSE-MsgGUID: tLnCv20jSeGVzf73a+muGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="77551129"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="77551129"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:50 -0800
X-CSE-ConnectionGUID: VsP8YpJVT4ywHX/xAmSm/Q==
X-CSE-MsgGUID: iPLBLFtZTziSnIfIh822Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192922545"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:28:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:28:49 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:28:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5B6FgoZncApgCtpJqSy6v8IidDVlOynsvzRPVo33GkBv2H2cw4ElrSsu5vtjejcDP8AFxmZaLnUZqmkEKwl1YaX0hKq590rrwpMupc5HZvhyuQ+j3EjqAXM+dImDZwzKdG7wmcXDP5FPUivumRMQ2S33mOk7+W1wjxQENurra2MSbnNT6OmTJud4/3DN/TMfV23Jlo9WThbw02EOWhj4SVQvU8no47ak06cq388zjQblaC7xVyuek/rzlcuHmcykDYWGKObaz6WYiPDNo4VJYOdtKtXWcsn46DdSR1N+y9uFMotKXvcY0fBjaQ+/AfbsYDv1ZC7KyPqqVN9jMe5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eKyDno1xiWPeO6Awy6r74DwiLQ1YfrFi6FfhL1ZkuM=;
 b=jrCRdQkSBB7kf56WeMjBhLi3i1OxL+bt0dJcfKODMuALVXT6FHLmw1meg9jcAK7B0oCDsLsj69YCLKVlHEKJ/EQUvKw0FV2x0J88JnqRSkLjrhf4dhsLxqgyTM74cYr3TD/ZUys1lYt4BHG78USNPR+0quCq50DnoAedPe5uVsuSihShamKUrKOAdksg9MNQPVTt+IyC6fFJeFwoRe7OoRYp08kXRdLAQubpIAu3u59F47iWtzyOueIoDz3FPs4qtwWbCusVxWQ99sCSnQSMWsZBnmKKvgAi3MNlI+v/s6ptgAybN7cMlN+SjYtyPUUCoLprENEyTrMJiknBIgA8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 10:28:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 10:28:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Peter
 Senna Tschudin" <peter.senna@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v3 4/5] tests/intel/debugfs: Add tile-dir subtest for per-tile
 debugfs validation
Date: Wed, 26 Nov 2025 11:28:26 +0100
Message-ID: <20251126102827.47844-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102827.47844-1-piotr.piorkowski@intel.com>
References: <20251126102827.47844-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c957326-fa4c-4f4a-e8e7-08de2cd6959c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUpDRVI5UlpHaUVLbFRPNHNHVlhhN09HTEdkV1I4VmNGRW41Zk16c0EzMjNl?=
 =?utf-8?B?VDgrdFhIOXBTRVoxK216Wms3TzhmeDNNOStQTk5xdkJNTVV2VTdIdlM3Zk9J?=
 =?utf-8?B?M3lVZnVYZENWL0ZKb3plcTI2eEJ5SHNwODBqQm5vZHFaNmJSOGErUlcybHNw?=
 =?utf-8?B?WTREWmN2TG1aS1BzODhyelFVYnc5Y1lRNkJFT3hqTWxpSXZBT1MySmo3OFZh?=
 =?utf-8?B?RWFOOG9RYXNFSFpsTFZaN3JIajk5N2tPeDhxNWp1ZE5YSkdBRUhuNVNCYklh?=
 =?utf-8?B?RjljT25VRVY2emcxN0NGbzVoSTdUT1NyZXRRT3YxTWlMSWlFcGFzVlVKbkkr?=
 =?utf-8?B?MnJlSmZ4bjhBdHVlSW9NWnhjaXhseWJyMDZDMkFGZHVGRnZra2p2S0VuR0F6?=
 =?utf-8?B?aEMrUzhuaXBuL3dDNmpXenNkU3QrZVUvdElIOEkvRVVLMWNpSDR3Nk0vSVFk?=
 =?utf-8?B?cjcrR0Y5ZW1COXRIcmxoZkszQ3duQjc1YkphRmtGODJJVEQwdStVVENsdnE0?=
 =?utf-8?B?ZWpBdWJiR1ZTa0RvaW44MCsvUkpHTVZ6ekIrWnA5T21IRVZ1SG9MK2JyVFhj?=
 =?utf-8?B?ai8ydDZTWGpQZkc3d0tiVzNYWWhrUGxzajZBblJacWMrZWM5TEtKMnZtMFFJ?=
 =?utf-8?B?NDBXVkVIMGJsdEtPcUpuU3M3b25wbTVmRzdJTmNYdVJGL1FyS0dPZCs1bWtC?=
 =?utf-8?B?WlBkZGlqTktwYkErclU1V3JJYXJDSk5uc1VaeVBqTm1lcFBpbWE4TlhBV3FR?=
 =?utf-8?B?Rm9nS2JPUWNhdnJmbHUySnd6S2o5S0l6clVKVHU5RENVU3JYYkdDM3I3a2NJ?=
 =?utf-8?B?QXRiblBFbzZwbm56ZitITTQyZnF4ekhQVGxtMVJlc1RjTUdHbXBucUFlbGlW?=
 =?utf-8?B?NXh4UE04TlpRSlFITmxoMkI5MG5jaUhDL0EraktMZS9qUTY0V05GeElvVHV4?=
 =?utf-8?B?QTAyWVJYZW81QmJKTjVwMkd5eWhwaXZ6c3lZakNocGRZMUNMa0ZOVFU0Qng0?=
 =?utf-8?B?aUtSSThld282MEVqRGdWSnMzSXp0dTA2TnBjRnRLdUFTT2s0clRyYW9IQzJL?=
 =?utf-8?B?K01aSldtdExQdmFVNnJJUzFOWFpBZFhkZXkwMnRWZHRuazhwaHYwZENsNU9I?=
 =?utf-8?B?TkJ5ekZIV1l2VXRWZENJSVl2bllqWXcya0RsTjAxMW5keTUyUmcxRXNGQ3B2?=
 =?utf-8?B?U2MyMG1pcGZlemg2N2lpemFtcVNuTjQ4cXFNcVdvNk9jaHFtQkJXb2xUcmVS?=
 =?utf-8?B?NFdKQzJqTWlHUWs1YmszWWhycitIb3JIU3lQMjB2b040am9qQzdNY2dLUTR0?=
 =?utf-8?B?NHU5VjN0dnBJRTlqdnNwZXBYeEZZdnVhcmpjdG9MTEd6aTVtY1VVSzd1bUFT?=
 =?utf-8?B?eEh3cGV1dUNzdDd2K28ySFVmWkgzUTkxbnovUytIQjNzc0UvZlVUVEM4S2FC?=
 =?utf-8?B?b2FPeHl0TFptUWpXNHRLQTduMy93bDFXemo3eUpPS3VsbmRJeHNPdUhyNnla?=
 =?utf-8?B?K1NnR0xYWHlWUUR0STVPRVFSa250NFk2T0pVOHE1NmlNMzIxMjgyMzY2WTBZ?=
 =?utf-8?B?OHBmTVBObUI5aFpoRUFYTGIzVERTZndobHVMT2JINEtTd2MzMU1aYjFNZkll?=
 =?utf-8?B?WU52Q3B1OUJrV0dPb2FDdnFNMWJNT1AwdUlLMkpTOHZjeStPd2IrNmYxQllZ?=
 =?utf-8?B?LyswbXdmSmFycTNSSGtSMW4ySGJsVWtaSkw3dG81ang5MnVzSE1aTlFOZE9N?=
 =?utf-8?B?Z3FkSld3R0hSOU5uOGtld2tHc3huUXNHVE1hVjlUblNCTUx2V2drSmZmTWwx?=
 =?utf-8?B?Nnd5cU83MGdHUDRhZVVkSzE5T0ozbHg3RFd2bGFwOER1MWFBWGRmNWZlTHhG?=
 =?utf-8?B?U2x4N1h4MDQzUXkrbDRydzZGVVAxYUpjNk5IeDJ2ZGZqZ0VFZXhnZmptUEh0?=
 =?utf-8?Q?KtS9u2aH1ljMK+w+vje73xp8ayVTIjZV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2tTVkJDQkx5eGhIWjlZUTl0ZXR2OWFxbjFYMFNEKzdHMElIeTljb2swWlli?=
 =?utf-8?B?NDFMb0JQV0E0ejI3Vzlxb0JObVZGRlNkUFN0UHo1QmhWWGtWcnNtdWg2Nmx0?=
 =?utf-8?B?YzFiSFRDbk55VGRvS2ZJc2x6TjdYWWxMd2RsTXZOWG9adlF4Z29kRisxTHdv?=
 =?utf-8?B?NExtalhIUkVla2hPakVVWWVSK2l4d1BuUk9IWTJsM2VGaEtIWmlRVTR6RVVH?=
 =?utf-8?B?Q1oreVNWUmRRNks1RGFlRy9KUXYrSk1raStwN3l1ZkdNSi9TZ3JiNmprWDBt?=
 =?utf-8?B?NndYa1VBY1NwTDlmSC9ac01EL25LTUlFU0phTlVySTk2OGJ4NzBXdU96YTU5?=
 =?utf-8?B?Q0ptNkZTakRTRmhVWXVhTStWK05mVVp4UGk3bURWNytpUVBjYlRhaXJpc0JG?=
 =?utf-8?B?Q3AyTUd0ZGYwaXRmWWhUVGpSNnNDUE1qQ2x0cFhqQkRPNEJhVUdvcy80amVP?=
 =?utf-8?B?VmFoaDVnZW9NVlZKZDdkc2tWQTVkRDE5NGF6NmhHdEFKSXhwL0J6RTFRV1FS?=
 =?utf-8?B?a2pXcGpWS1pWUXJXSmVkellMZnN4OWZTRVgzSVZhMFlqTEJWZXlxNGJ6MG9x?=
 =?utf-8?B?Y0hyY040dFFGVTdSeVlGQVVHUkpOTjlUYzdQSHl4UkhlK1ZaU3g0UEYxa1pD?=
 =?utf-8?B?NlA3NW1ubk1FcWpsbllpdTc2YzVNZGZqQzVuaXpRU0YrYVRwZ0ZJeXBheWhQ?=
 =?utf-8?B?UVp4NWRKSXhoRFdyWjB4L1hKUHNGSDVtNVIvaDhHTGEyZStrRVpRSWdhWFMx?=
 =?utf-8?B?SEw0bTNJa2NoT0pGaWdyQ1hJTFNsaVJZQS9nTS9PMFRnc0kxdmFJQ2Qrd1o4?=
 =?utf-8?B?YkZKMmhUZDdBcEp5cEdDUTlkWWRxVUt0eFdTVThmWU8vekJ4K0FmZVFUYW5Z?=
 =?utf-8?B?SEtxWU4ycTRlSE9GcFRwaWtTcTdkU0ZWaXJLWWlUcEJIRU9iWTJzUWdTczdm?=
 =?utf-8?B?Y1FJUk9NY2crWCtuWG9ISGlxdGNrK3RFZVp1ZmJXRWtGWGVWUUF3Mm9VR1Rx?=
 =?utf-8?B?QjJXRk5YMHQ5TDhnMGd5MTJ1eGFTaEFTRWNldjlLcUVvY3VvOWRvMjlGcUJR?=
 =?utf-8?B?b1h3NFRXTE1saWlEQzh0SEJTQ3NCNFU0L2k4cmcvTkhGWXFMdnVnQis5T1dC?=
 =?utf-8?B?a3JLcUhFeFU2b0c5S2Y3Tk0ya1JjNGhSWFgrU2l4TDRJNlQxOWs4SlZ5dGdx?=
 =?utf-8?B?cG9QNk42djVMOXlYQ2FBYkhReElEOFZpcC9ldy83ZDFVNUxXN0lmeWZhTDRy?=
 =?utf-8?B?Y1daREIyN2phOFVvMElmNkdiemNKZTBEaDUwcHJCb3hVV2MwZTIwc0RLbG82?=
 =?utf-8?B?eHQrTlFPRkkvaDdQRDR3b1dvS0lYZFJRT2ptSlpyQU9vNjBVWHhyQXViK0Qx?=
 =?utf-8?B?dG9GUkUwdjM1TXdyd3dOWHNRamRINXh3Nnd2QmJJdGFHSVlTUEFLL0tPWWNh?=
 =?utf-8?B?L3QwTHFJb1V5RXZCbnJ2QkJjK3Excit2YU5VdkRnbHRrV3lJTEtsb29DY0sx?=
 =?utf-8?B?cDFaRi90d201RVJtNCtodndJakMzN3pwUEJEbjJVTzhXa3lPekhVQXh1M3VU?=
 =?utf-8?B?ZnJ1Vk0xNGhjcUJLQWVuVllQSFpRZWpqbDUrZ2FaNlJiQjF2Rkc4V0Vxc3F6?=
 =?utf-8?B?c00wcXphbnBPblA4QWtGSFZKSWtUbzREYmlGR05GOUZJZFdyOFpzOTQwd3ZI?=
 =?utf-8?B?eDdLbUhRWUFZZHY0b3dNODVvMXRkUVBFZkJxMlJDVzJ0SXAyaG1XYjZpWlFr?=
 =?utf-8?B?UXdsZHRKZ0g5ZHBQZ0l5WkJkcXdQY3dFeUdpcjFRK3Frdm1tRS9zOTRxQmJs?=
 =?utf-8?B?VUtoYk1CNEh0K2U3a0RDQllIak1XazRlSG1TNEx5QUJmcGkrOEc3ZDBQYkpO?=
 =?utf-8?B?WHZiQ0FJd2NRZVp6YTE3dzVhMTJCemxsUTZLanNRUEd2WUxYa3dacjQ5SVkr?=
 =?utf-8?B?Zm1hdDg0VlMybmVzc2IvRVl0djFCYXFpaWUzcjdpUlNhcXZpSjhOamRWdXpR?=
 =?utf-8?B?LzVhbzlLdVF5LzljVm5zMEhwNE83Ym9xejR5S3VuTHh1L3dzWHU4VGpVVVMr?=
 =?utf-8?B?ZXJXbmp4RVc4b1g3MU96Z2Fzb2VoM3I3cTQyOE1LRndmWm1leE9tQ1lOSFZW?=
 =?utf-8?B?VTZhWmFnMVhrTDdJTDVoaWkvejN5d1FRclZ2bHZkdG4zV2NDeDhyMnZOeExW?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c957326-fa4c-4f4a-e8e7-08de2cd6959c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:28:47.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A9j7yPV/hwma9XHrrhJkYRYMALhjgQBRyJGabthW+uF3Vo4UpA95qvh2zJRsxIidxyScT7cCNH9C+y5Ss0lYiipwabxXKD2AgBNkmQQf+bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's add a dedicated subtest for tile-level debugfs validation.

v2:
- simplify skipping when debugfs is missing (Marcin)
- use %u instead of %d in tile format (Marxin)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_debugfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index cf464c5cb2..705b80ab80 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -266,6 +266,30 @@ skip:
 	igt_skip("Failed to open debugfs directory\n");
 }
 
+/**
+ * SUBTEST: tile-dir
+ * Description: Check required debugfs devnodes exist in the tile debugfs directory
+ */
+static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
+{
+	const struct check_entry expected_files[] = {
+		{ "ggtt", O_RDONLY },
+		{ "sa_info", O_RDONLY },
+	};
+	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
+	int missing_count;
+
+	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
+
+	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
+						 ARRAY_SIZE(expected_files));
+
+	close(debugfs_fd);
+
+	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
+		      missing_count);
+}
+
 /**
  * SUBTEST: info-read
  * Description: Check info debugfs devnode contents
@@ -365,6 +389,7 @@ static int opt_handler(int option, int option_index, void *input)
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct xe_device *xe_dev;
+	unsigned int t;
 	int fd = -1;
 
 	igt_fixture {
@@ -378,6 +403,12 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("root-dir")
 		test_root_dir(xe_dev);
 
+	igt_describe("Check required debugfs devnodes exist in the tile debugfs directory.");
+	igt_subtest_with_dynamic("tile-dir")
+			xe_for_each_tile(fd, t)
+				igt_dynamic_f("tile-%u", t)
+					test_tile_dir(xe_dev, t);
+
 	igt_describe("Check info debugfs devnode contents.");
 	igt_subtest("info-read")
 		test_info_read(xe_dev);
-- 
2.34.1

