Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23935E78D44
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 08:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE78110E347;
	Mon,  9 Feb 2026 08:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhOeRln1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A6610E347
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770626768; x=1802162768;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7dLJVvKCPdnsOJICuDEIhkxGuN+BaNRKICk3EhhTF8I=;
 b=lhOeRln1cyYAslkPSXTs8V3EO1DsbAWJKx8f2VZOOi8yzjzZIVlXFmL4
 jx98mFU65NeSCbl5vc9poFR5V6ord+KPDrvdfKAoJWInnMUAvzH6pYmC3
 dPv4I46qIVQynyISsSmwOhFP0VJ0F8DqDPP6o8iHq8/lmBHmqNH12dMT7
 kKD/d0LiQij27GBnAOKVkCSV7J81K8PdOihP9i7Qkb1MbSNWrkcf8aGBY
 eMuWAo/IpKjtsDJv6bjOyzlbIxD6ECNd2BTt8J5W36DAV14ruxily2IJK
 TC6agdzycJivdrQPDCa/yu+xOI3L4hud31WhMTugy6gpaUAdV7GpaAhdL Q==;
X-CSE-ConnectionGUID: Ib2p5kS7TtuLxDd11y9qyQ==
X-CSE-MsgGUID: rTyy43kkQl6J3T9DT/F9qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="70749248"
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="70749248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:46:08 -0800
X-CSE-ConnectionGUID: 3tbY7fI1Ts627zKf1roa9w==
X-CSE-MsgGUID: 83BoeLisT52OHmaeeV8SkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,281,1763452800"; d="scan'208";a="210711895"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 00:46:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:46:07 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 00:46:07 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 00:46:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWPbvgpK+gDL4vJ3EKLrQ6L2ZszQP+O/hyKTxLKhlD0ugGgq4bd0BU9o2qPiq48rNZiqYK3JJG08U+POcn5Wo/auvYyDBP7nosk6JJ+uIBe2YnTXYVG2uPBno2OxH86ndz7KS7aeOKCov2u0mDOToRCfgFXxye9DkDuLsKHoCGWZq5YdSnxJLpjqatSvyTh3sAFBktouTYLGb9UrVJIiXW4+OuaTvmzMrb4e3HBxe9Qmh1cbPPDjQ6uOieQwzs5pxMnARRX7IHHnDmuCQpZv4o+7UZ+8ThPQ/VMfLKbXt5gvpr5gIzGGaQ/Ung2uavkxHiRRByg9qL3re071q+adKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnTbPD16udgzg7PZTjbqxW3MvqHug63EKbldUKsH6eQ=;
 b=RzOqKhPN545Wsf4TmoWwsg5VPpUka5+yQABL4F+ZxjAy8Cj7s+9JPpDNwFxSNd2crVT17+hucDYs9uRIm79Y9i0B89Vo3CuACuEV/ZevNZwMdNomGKYS80kumjqwVg9I17NBSR1Gnh/uZK+PDn2MMwR0kJxQNgygxdEOZvqQfudeHruZdKacuvgrKO4G+4f+AYgREuYnMKpaS7tGXMkP2I2xJgMqDQOEKZBIjtEG5Lbyx7w0O9y5n9mtPpH1Gp/H3XpRqROVXmODR41vWpaRRU3fGKzyF3zW6ChF2HVgnKBtto6WYn+EzxJxXsmovua9HS7xZTwC4bZSsyIYdCQ2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV1PR11MB8841.namprd11.prod.outlook.com (2603:10b6:408:2b2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 08:46:04 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 08:46:04 +0000
Date: Mon, 9 Feb 2026 08:45:54 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 4/6] tools/lsgpu: drop cairo and switch to igt_core
Message-ID: <tbhkbnq7xehchf7qscpkwwocneoosum3adto3hfkil57wjclgv@xdw2bstwlose>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
 <9f557fba7fae384937686edc8a376c10197085c4.1770212190.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <9f557fba7fae384937686edc8a376c10197085c4.1770212190.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV1PR11MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: c3bf7353-d124-46a1-dd60-08de67b7a8e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9VaGI2WnFuTmdmdXBxcGxUdXMrWTg2cWRZNHJHNGd2VXB3MER3K3dzOGl3?=
 =?utf-8?B?enRlSlpMcStyUlRKVk1UM280TWxBRkxndlhuWGNnL0Q4WWp0ZWN3MVB0VjhE?=
 =?utf-8?B?UmpObVlBS0Nuc0JNb0ZKeHlLcHRrS0JuU0NhSTl0Z1pNSGd6ZWN2WHF1Y2lW?=
 =?utf-8?B?cEt4b3gwaGRZS0l4YjUwSXN3K2ZROVZJTEY5M1VtTW9sWVZFNnNJV3lpZkJT?=
 =?utf-8?B?SHE2V08zMGVaakRTVEJjTVcvZkFEL2ZEc2x2aUlRNjErSjlTbkpHUUJMcWxQ?=
 =?utf-8?B?K2ZDK1ZGeW1vckpNU01jNGNpcnU3VzdJV05IVmlUV2RDcW1WcUw3dW5WT0d4?=
 =?utf-8?B?b2hJeFoyMHM5MGU2YkhobnBpY1NtbDRLYWhoRnMzVDlkNWUrcEZzaFovY2xW?=
 =?utf-8?B?V2RnYkExdzVCd0U1WXRURGRTb0hsN1BzaERNYklnVGhCblluK3ArTzlMTXRv?=
 =?utf-8?B?azRDdnlCUzVndGs4Q2VLNjMxR2VSSXVNdU9jOHZSWXg0QXMwNFptNUVCcytQ?=
 =?utf-8?B?RXNvWThnajYwYWRKeENTSDUzU3dLVHRweHNOOWNHL2NkZmNvcis0MUE5a3ht?=
 =?utf-8?B?b2lzb29jSDJIME0xQkV1Q3RqUWNwWnhiZ1IvRHQ1T2tiVUphaEZPcStocnF0?=
 =?utf-8?B?VXZZa1BsS1hHd3lpYmZQMEUrNzRFZ2dMbnN6ekFjbEdPMEV6Z3VkV2hCK3lB?=
 =?utf-8?B?cWh2S1dwdmlSSnhaRXJQekFxOTIzOTFkVmpOdHM5ZXN3SmFZR2NsbFQ1STU2?=
 =?utf-8?B?OFkrNmlqdFJaSmdUUG9oMmJNM0F0VEppSEFvZ2pEd1ZhU29UalVxQm5KSDJW?=
 =?utf-8?B?YThTZmJkNEwwK2xyYUcrL0pBTXB3WjNjd0xpUkgrMnNJL1dZMndydEZ6SzNa?=
 =?utf-8?B?ZGhoN3Qvai91bzQ3Y1NUU3ZkWVpiUmFXakg2RDBCVy82RWxRMUtER1A5aDIy?=
 =?utf-8?B?ckhIZW55eWUrT1NJa0JKd3NEbkJsTHB2T21sdUFvWkdxYUxCaVZXM2V3eUZY?=
 =?utf-8?B?Wkx3dDRkSFoyYVNqQzl1YlBtSXB4eEhuTndSNzZwZUJEUk5UbUxNOEpJa2hB?=
 =?utf-8?B?UXlpbmFkT0V0ZjNPWkNMaStmWCtGekltQWROREFCZ3lxZzI4WElsZkYrRHQz?=
 =?utf-8?B?R3VZQWpueVdMTit4TVZKK1YvbHo1OW95aXpTYWJFRnZwWW5KNmNiNEhvT0Nn?=
 =?utf-8?B?QnpGTFdpUldMNXRJZnpnR1BCVStmT0xLWFh6ZXVTSXdnT1pIcm5aZVFJNS9O?=
 =?utf-8?B?OW9XcDhYeDFxMWpVYS9PRUVKeU43SHFpMDY1MEF2Y3YxRUt6SjB4RXk2MTUx?=
 =?utf-8?B?UHQ3NllYaFhBNENja2psb1VkYnFkRDczQW9pSTE4MEpBSFgvdEVxZGNXbWpn?=
 =?utf-8?B?akIrdjdySlBNT0dNK3dOUXNjUExXdlAvc1gzUnBLL0xVLzg3SFQ3c0ZHbmNx?=
 =?utf-8?B?Yy9yWHlQbGNYTFhNc2lDNmcyRHFpaGNvakJKWFVaYm1WdTdNNGp5YStWVkNM?=
 =?utf-8?B?dEhBMWNTWkdkaDlYYjYvZlY0Snk3cVVQem8vaWZZdzhyaTFsVXp4TTQ2ZmFD?=
 =?utf-8?B?T0E3WlhIQWtEZUJrWnNzK3hNcWtqdmo0eUttVlN5YUQ2K1ZrV3pHTXdGRVNh?=
 =?utf-8?B?SjRCMzkzeTdqdlUrQ3gyQU9FVU1wcWNxRVdFSzEwUUlqd0lubGlLQ3JWQWt1?=
 =?utf-8?B?bTFyNnBYVmlpSk1DNXhBWmwyUElkZVo2WEhnQ0pFS2NKN1Z6aGRWUHBMV3ZJ?=
 =?utf-8?B?R0JoUXlNU1NJK2RObXhZckRoN2R2N0U5YURYdUJDR1pCRlhXems1SE9mUlRF?=
 =?utf-8?B?OUliVzdGdVJvRzNOS0pPWno3V1oySE40WHN1QXd4djIrNDVDdGp1TVZneWl0?=
 =?utf-8?B?SHVZQVRjcm5vN1hSNFFROHgxbEl6ZHNHcUsvdkNERjl5VDdzbVhCSWE1aEpC?=
 =?utf-8?B?Rmg0RlJtUzQ4cis4NGp4ZmtlU2FHeE1RM2ovZmxTNDJvY0FGeG5MZjd4QnRt?=
 =?utf-8?B?RVdjSVMxQ3RzbVlYbzdJdlRVTkUyc2cxdjZsN2NSSEQxaW84MGRBTXFEaWRn?=
 =?utf-8?B?YTU3TlVVdFI4U2ZqK3FQT1BBSytIZktWQmNpSHl4b1ZpUjl5bkVrUnU0Z1BM?=
 =?utf-8?Q?Rtx4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVdjNDZ1S2x2Y0N0a01hMjJwOXhyK0lKYktST3dmMURZcG9OUzB6VU9TclNF?=
 =?utf-8?B?ZDlnU1Q0b0dKUnNjaHdlK3V6MDlnT0R4Y1hEbUl5STdsWkRzRjk1aE5WSlBX?=
 =?utf-8?B?YTNGZEloT3Z4cHJhRUVna01Td0Z5NEJBM1o1WWo1NkRDVXQ0Z29rUlJHNzZL?=
 =?utf-8?B?TWNHMGE0OU5INTR0VTR4b0lyTTdlR2VvUDQ2ZngrZndrWmxLb0t2MHRoN1NT?=
 =?utf-8?B?NTA2cjNQaEQ5eXIzM2tqdDZNK2xXRTVJNWtZQVZrV3k1R09RU3Jzb3VQYU93?=
 =?utf-8?B?R1BXemlpZ2Z3ZjhrZTRWZ01BMWFVUUE1ZkhxN3M1T0NtWG5Vb0o3bW81N3Zv?=
 =?utf-8?B?Mm1SbEZDNkFJdmYydGpmREt5dlg2ZFFNSGFTSkFtK2dlWXRSdnk4QTJZdzAx?=
 =?utf-8?B?U2dOZ1E2cEkyc0ZtOW5kSnh6Y29wQncyaENlVVpwZ0JYQWFkMFdTTFZDOW5O?=
 =?utf-8?B?N0R6ZEpuRFBKYWpiV2lWWTh0TUFDQURCYXdMMGg2amcxdnkzbGFCSTFaczdP?=
 =?utf-8?B?TzJScGhUbzcxV21JM1VBTkNaVTVPYWs4TFY1NXgrNkF4cm5iSVd3YTMrdzFs?=
 =?utf-8?B?eEVoc1FUNTVvSTFmZks2TlVId2Qvb3JPVHAxcDRuSm5Nc3hZRXAxMTZhanRS?=
 =?utf-8?B?VG43Y0ozVmhJdTc3NWNjUTlvaGE4QTVEejQ2SXEvTEtQUkZXcnJvVlgyTS9j?=
 =?utf-8?B?dW9HUm4zY2o5NFF6RkdCUEVtZGxwVTluMzh4MFVaL0NzRTd5VUFGRWFXTXlT?=
 =?utf-8?B?ejVTTWtzM3d0RGVCUkpTdHY2SGR3cUdXK2FlaDNyOGtRQlA2MUQxYmh2NnZq?=
 =?utf-8?B?Y3ZaYWhicDFsVmp0akpqVW9sTVdzakYweWdQT1hSWjBxS2dqZmEvVkcrQWRH?=
 =?utf-8?B?dEpHV1BMVVRmVmxONU51Q3ErNFZoYWh5cXlCdDVWcVNzV21NU09aTEkrMWgz?=
 =?utf-8?B?ZVpUZmk3dHJ4MlZTN2ZhNCtZaHM5Vy9GQ0ZlVEF0dDBOUGt6TWl1MmlFK0s2?=
 =?utf-8?B?RDBUcGduaHh1d1Vsd3MxZlJwRjg5RWNIV0JRNERQaXFXYTJLdE1LcG4xV2VM?=
 =?utf-8?B?WkJJOFdFRHdoak95aUdheGo0cHlYQi8zaEhudVJ1bGV1WGJkaGpwSzhmMkQ0?=
 =?utf-8?B?U0plejRSMzFOZ01QSTZScm8vQlBUTms4cmUzMUlpbjFzcUQydXh4NTBkSzh1?=
 =?utf-8?B?SnordW5rbHhMYnJGNXpzQnphUVpERTY5UkJjMzNER1Zla3oxU1RnbWtuOHlV?=
 =?utf-8?B?WnJ3OHp2d1Z5Z2F0aFJuZ0VRRmJqR0FEeFNMdllpTG9DTENhNU4vMWIvTThK?=
 =?utf-8?B?dHJRTFp0Z1JNYnA3c1NySkhUVitPcm5tRjVEY2wrM3RSaUJQZGhPQmtnckV4?=
 =?utf-8?B?ZkY1U244WkpMam9ZVnRnbVAwNlRuSnlCRENkaDYzV0dncnpmV0llcy94SUVn?=
 =?utf-8?B?czliVTdOYlR5bXlOSTZFMGRwUGNpelJITTFJZnk2UVZvN2FreVl5UmY2VUcv?=
 =?utf-8?B?aFpjMWpIdFNJUmNSRnJzUm9VVU5McWRzSHpiclltR2VnRTdyMmhvV1pzQlV4?=
 =?utf-8?B?SWUzSW9SWmNkcExyVi9xR2ZjR2Y4aG13WXlzVlNRS1dhcFo1YWY2eVVKaHlq?=
 =?utf-8?B?L2RrODhCZStDK20wbjZKRy8wdTdJcExCMFJ6a3ZLWjFNODZhMVgxbDlLWk9K?=
 =?utf-8?B?OW9yUVU0aFZEUWRKa3pwWDFLQnVhOE11SmJBa3V4SGF0cWhFUWM1VUYzcXRp?=
 =?utf-8?B?SUdJQVF5ZC9sVmRtRW83WXRmRFNwYmx0SmNxVFhSUWg4UVhOVW5WT0NLUmI1?=
 =?utf-8?B?L0grTVdkSEZNSmZwOEFXV0NGVHNneGllQmw2ZFlRaHNrbCtJUmdUcjFpVG5I?=
 =?utf-8?B?N2RVYnlSSGJZdzBYbFZ0SUc0Uk5mTFYwZ09scVpONjkyUFlQUHNpUm5zaSsw?=
 =?utf-8?B?cmJJVGpPUTFwcVEyU28wYkdjNHplT2FSVEJHd1gyTWdnV2RQUnA4YkYxalQx?=
 =?utf-8?B?YW9Tby9SZmVxV1EreFBFK0dzblpsNEhodUY4U0UyRUtNOXFvaHNlTXBmNXpp?=
 =?utf-8?B?YWk4QnlVdXZOV3BIRGFBck10OVlmTi9JaDZGWndNQlo4a0ZBcGFoY0hpSGNO?=
 =?utf-8?B?b0FyR2Jwd05ISlY4UnRiN0JydERsZWlOVWppTE9aQWNSK3N1R1UxRzZrWjlz?=
 =?utf-8?B?MUJQSzVBZWtxTG54akVvN1FKTUdESFRNbldlVGltejFnUS9CTnB2bjQwS3hY?=
 =?utf-8?B?U3lCSzl3WjMvMklNVGVjYkpLWUgxRitqdXg0ZVJVMC9WWlh6MFIrTFBEdjE0?=
 =?utf-8?B?WUdkb2xvZWk5SVZmbW9Tb3pxczMvcVVmUWVDQUhvemlST2sxMFhKMkM4RTJs?=
 =?utf-8?Q?0cs5zxyys9csrSwQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3bf7353-d124-46a1-dd60-08de67b7a8e8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 08:46:04.4545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZ108ukVVZVbWW3weJbKT1MdCEaL5FscwkfJ4X1w7kJXssuA9SOcxdP4aXhR+i9b3y+49jXl4gq4nyJD5tjVq/RxBehhTai45Wd7xYyaBP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8841
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

On 2026-02-04 at 15:16:06 +0100, Sebastian Brzezinka wrote:
> Replace the full igt.h include with igt_core.h and link lsgpu against
> lib_core_igt.
> 
> This removes the cairo dependency and limits lsgpu to the minimal core
> IGT functionality required for device enumeration.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tools/lsgpu.c     | 3 +--
>  tools/meson.build | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/lsgpu.c b/tools/lsgpu.c
> index 935371dea..057a594ea 100644
> --- a/tools/lsgpu.c
> +++ b/tools/lsgpu.c
> @@ -33,8 +33,7 @@
>  #include <string.h>
>  #include <signal.h>
>  #include <sys/ioctl.h>
> -
> -#include "igt.h"
> +#include "igt_core.h"
>  #include "igt_device_scan.h"
>  
>  /**
> diff --git a/tools/meson.build b/tools/meson.build
> index f7874cf82..dc56f68a4 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -57,7 +57,7 @@ tools_progs = {
>  	'intel_tiling_detect': [tool_deps, cairo],
>  	'intel_vbt_decode': [tool_deps],
>  	'intel_watermark': [tool_deps],
> -	'lsgpu': [tool_deps, libudev, glib, cairo],
> +	'lsgpu': [lib_core_igt, libudev, glib],
>  }
>  
>  foreach prog, deps : tools_progs
> -- 
> 2.52.0
> 
This patch should be the last one in the current series, as
"lib_core_igt" is undefined until:
lib/meson: build core sources as per-file static libs with minimal deps.

-- 
Best Regards,
Krzysztof
