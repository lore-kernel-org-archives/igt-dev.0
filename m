Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBF7C021B0
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 08:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07A10E477;
	Wed, 19 Feb 2025 08:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBCX+7Ea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9C010E477
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2025 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739952047; x=1771488047;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zHDA2zOspMF0M/D1XW/gY4JNx0eJV5vdrrTPuKn9GWk=;
 b=eBCX+7Ea7R/CvOI/VLVfvlHK4lKmexJrYMzreTpUa6+XmLWT/LOXdEK7
 g/3/qzpkUMqC9Pk58G3WVJqWrOKne+p1Y8SXlz0K7EGl/a9HJU/o1cf0a
 GRsJUUYlbyTN3HLD6O7qIC1/apCqE+gsyQjBv/1JvoVhjQmH4r4eBiLY4
 MlQ903anUfzKhY/ojEqjqkOBXIOPsEULitqol6hLNnRo3ZK5JUPJ2y4rt
 GugOivXl2C06onKGsMCwGpXciEbCiIqaSsOckPSoXCMB1Xw2ygeDlOiW6
 z1fzA+vN0Y5tv24lPGv7scW99LKaPWQQDbdZcytaK+lixFlokiqiuaW1A A==;
X-CSE-ConnectionGUID: J+k0TwzDTTCye/sWpjJDtA==
X-CSE-MsgGUID: LJUckuxET3OZNJLJ2DnttA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40888377"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40888377"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 00:00:46 -0800
X-CSE-ConnectionGUID: xkfOJXubSz+Rlj/XQUlZ0g==
X-CSE-MsgGUID: gkgp26ecS/adEMJ0OKL93w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; d="scan'208";a="119749600"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 00:00:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 19 Feb 2025 00:00:45 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 00:00:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 00:00:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYzB4+zi9eEwf/Dd7SZHX0si/GX3mVFAMAid70x4CvMIBSfcHggnPnHSxwqc1onZWeZs2Zno1ZfZAbKlXVAsgtVKJpvq+sEI/JRD3p7YkOA9pRY9SQLboV/PJZdSxngzJ3EmrtPGrG00d1qU1Al0/xcNaIBTSoXemAe/6C5xs8zpSplwfO+72mKEjgaqsLFpkW4RyLcUjsLL7Lwm2fHMF7FOXKk4Ryz1duWx+wMbvii/Ocxy7phdWwDe6f/uadck5XcUz5xbqNwWG9nxwh0j+IfxDxUvzJyGzFK+cNhcHXmp7ptUxwKzQ0FawSpIJ9VeSfd1YITzSq2LR4sgc9ISVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh6Es1rvw4PIyxQDP5Lv1R3xxQsqstrfqdoedFqeSvE=;
 b=k+6lWn6h0zk8cW45RLcIEoALPt+wYUL4cJlts5DMmGquHUHI3ODV+QVhrw3WbVNT8YbwbvEVQaxMXvrqKjDw5EOM3xfHxLSEmK9j6ZoGkjfPQppcaJn8RsOyHVZ/TGqgxtugcTIV7F3AXbw+fgdipxY4e2PogVUfL5lgBc4WHmVIdabwZ8XcZ4n7812f2txsgmxnMdG6ppPg0PUKswpw30F2vieSpA7Iap1Fdhz1s42WppsV+2s9rxqQufQpYOEAPpgx/rFgY1CQ53k0mZyrYwuisz43f5i/sCMmPx6VO4Z2RZtn7orjLPzWcK6xOZdgW7Idfh3NcSmfwLqt7U4ULA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 08:00:29 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 08:00:29 +0000
Message-ID: <e1dfcb72-a747-44a3-8961-7ee6d3980718@intel.com>
Date: Wed, 19 Feb 2025 13:30:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci: Add kms_sysfs_edid_timing to
 blocklist
To: "Sharma, Swati2" <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250213132802.357921-1-swati2.sharma@intel.com>
 <20250214104530.gsqrch2pg6h6owdg@kamilkon-desk.igk.intel.com>
 <b0cc7fba-8b80-4b51-bfef-1f258dd48cbf@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <b0cc7fba-8b80-4b51-bfef-1f258dd48cbf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: dc685392-60cc-460a-1dd8-08dd50bb79af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGYxaFVVUzdhN1pKTXhKSVQwTHNCZ1ozeXdmRkJUY0hKWWIyUDlZYXNIMW5D?=
 =?utf-8?B?WTZTRHNsYjZ3WUUrbS9vbGJKSHhmaWdvWkhocURzSDlaZ2x0RFlJYVVxUXp5?=
 =?utf-8?B?S2tOaTVKdmgvd2NBZVF5emZONzFmZ1ZTeFprWUs2WTBVYmRwRnZSbFQ1b1JH?=
 =?utf-8?B?YS93bmthS0wzd0VYelBqZ3lUWHB4ZDJPckY1SVVkMi9FZ01SMUwzbThCSlpW?=
 =?utf-8?B?OHIzZnVjU2YxWmJqU1g5aUVOU0pHRVVHelcrMXlWZ2pyMHRXMFl2cXV3akpa?=
 =?utf-8?B?T1FpbmpmcWs3NnpUUWVVSGl6Wkc4SFhUeTArQVRvSGdCclNYajFrNlFUdjY2?=
 =?utf-8?B?VmhUVXNrbTF4NzRYemlvbHpXK1hqWGNuRlZqdW1IVVQzRStBa3ZkK05pOVh3?=
 =?utf-8?B?aXdWckxnOFVHSjd1YW9FYWV5dFN4NjBwK3VJS1dmUnMrQkhJWi8wNHVKUHhn?=
 =?utf-8?B?Qm9hYnFJV1g4cjFXZC9LWkYrZ3NjaElTQzZjME1zdjN5TEdYcWhaVU53YzE3?=
 =?utf-8?B?djg5bzBNQVU4bEpHeU93NmJ3Q21iaitWYXpjT25rZit1S1pqWVhXYkU4NCtv?=
 =?utf-8?B?ZDBJRUlpTnBHMytrWHBybUE2QjY0K0RhWCtqajdFVWdqdHpKYmlPRFNBbW5x?=
 =?utf-8?B?eWJjTk8vV3liU2hqRFNRQitMOUlUbDRub0RLencyTE9QM0twR3BUVVp6NEJZ?=
 =?utf-8?B?YmFaaVYvYUJrdk84WTBxUWZXNlkzT1VObTI5dlVyQW5uODUwSVRKaitnM3BS?=
 =?utf-8?B?OWhDU0NUVGdHM29la0NjT01xY2dqbndXdHQvaFdZMU5HMjl0S1YzcG1KQi9i?=
 =?utf-8?B?TkFSRS9IRHJLV09VYm8vWDFJU0FQVDVnbHM4Nk1SbmRzNWRKU0ViT2ZBeXVa?=
 =?utf-8?B?a1hrVlFqSFlUWDZkQzZRRjR0dEQ5Ti9Fb0Vpa0lxb1E3OGozTFJJbHRXdHpG?=
 =?utf-8?B?cHFIaXoycGZEdGZrTFlYMW56UVNTSXNDZWh5VHNxOS9wa1BVVUkrWXdRMFFM?=
 =?utf-8?B?T29VT2o2ZEZMZk5jVVVGYTdLRlFKd1JZdG9vVDdWVVpIbjlXb0FwZ0puZHg5?=
 =?utf-8?B?U2pyc2tTSWVQUGgxa0pjRlF1WXQwN081NVpVa1NvL3lSZkVFMXlQYkptNGIv?=
 =?utf-8?B?YVNVT1BUa0xtbnlBUTIzWUFXdWVZZEVtRXJnMmhqR0VqQk8vUENLMCt2aFdJ?=
 =?utf-8?B?MzlFWGk0bGU2SWx4VVRuRXlEL1lwL3QwaXdmMlc2eUoyVHg5QnA4bC9BQXNo?=
 =?utf-8?B?cGUzN01uZHMzVGFSemM1eThpRlVLMVBvdmhVb1JFeDB1V3FtMTZlTjR2SlFk?=
 =?utf-8?B?YTl5akM2RmpkS1dvWXZ6VnhBZjE0NDRBVXZ3YmFtUFdRNmZOTWVPVUJnaXZ6?=
 =?utf-8?B?b29wOTREYWxPckZ5V3VaTnA0YW1yZmUxeTdZYVJmZktPc09yZFB1RGRpeUNY?=
 =?utf-8?B?eFJoK0lFRUMwVzNhWUplZURrVDFDN05IeE9iY0w2ekhmcDY3djB1U2d0cDJG?=
 =?utf-8?B?STB6VThHN0g3WGVNM2duK3NwL0VJU2ZZOVNSck8xMzNMWGdMaWtZWExPUWU1?=
 =?utf-8?B?eUVCZXZrcUFVYWxLWlN5dUlQTEtySDJxMzVyVmkwcU9EZVpZbzNZTUU5YnVY?=
 =?utf-8?B?ZEQxTUpvYVhRamhXY0NPQVRxQ2x2UEhtSXZFZVhjU3FzelR4ZHEvRE9ubkVP?=
 =?utf-8?B?Yk5kM0k4TGZqQXVpdmZXdUVDV3JyMDd1b0RjK3VNTENpTGpSQ2hlUlA2MEUw?=
 =?utf-8?B?K3JLMTJDdnhzT2JnaW5MTkE3eFlJdnFWOXhFVXAzaCtkOFlyQ1NwSm5GSTc4?=
 =?utf-8?B?WkV6TXdPQjI5UWpLck5ZQ2J5ZU9EQUtLMXllOGZqYVY5YzRaaFhsamZaeEF1?=
 =?utf-8?Q?Qj+/0/ZJhZdB2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWYrVDZQVnVneTg4S2hZOXhobmZ5WFl5Qmp0R01Bbms1Z282OGQ2czEzK1JP?=
 =?utf-8?B?ZmVzU2x0NTMzWnVKOXpnanZlUWcveTRkWm1ZOGkxQ1pMM0xvcStIdUUyaUVp?=
 =?utf-8?B?MHZud0tIdTN5Q1liVDF1VlJuNnpoamhzKytTSzFIdE5pV1A0M2dEaHdoWjB6?=
 =?utf-8?B?M25qMWxrUDJLYkpBb29JSHU0OElMSm1Nd3VuZVUzbmdLbjFDK3NKZkRnanNh?=
 =?utf-8?B?elFEckc2K2xoWmtmamJzOThlRDF2cnUvdVJqbVdvN3B6bWgyYXlYTFlMRVdR?=
 =?utf-8?B?YzFkbk8vVm1hd1pJR1o1NkdsMVFxL251K1dwNU94ajZyenJYdzlLd2FpMG9y?=
 =?utf-8?B?TGZreVA1dDYyRVNvZm0vdXZheVNhcHpSUUZ5SmEyOXhZZVRKOXJab0dvTnFT?=
 =?utf-8?B?REcyWVRBYTAzc3hDZldKVGk4RWlkemU0Q3Y5d3Y1WFFCN3hTK1ZkVEI0WCtD?=
 =?utf-8?B?QmMySnowRCtyaHVrRXlLTnppNGFsT0NlNTZUSEJ6U3h6YTdaRGNCOFRzY1E3?=
 =?utf-8?B?SnRNR3pDYWJnV2o5b3lYWXMxeUlCdGNrSXUwYjVvai9KbW82ckxtVjJ1b3lj?=
 =?utf-8?B?U2U2dVd5M1hkSS9Jc1BncGpzaFRVZXlYdHk1dlNSbDJSeTdMZzl2R21Dc3hF?=
 =?utf-8?B?RVJ6QjRkVVliT1AwQlR3Q3NXUDhhbDNpZllLaEhXZk8yRzR0eFlFd1loWmpE?=
 =?utf-8?B?RnpWOUFMM0FzZGJJREtTTlF5QmplNDI2Und0ZUJ6enRoUnFwVDJuOHlBcm8r?=
 =?utf-8?B?SlhLbnA2a2FsR2MwSmtSajJmenlvTERmL3lBU0hXNjFRUEhyVVJuY3FucXpW?=
 =?utf-8?B?Y2UwdlJhK3VYUCtYaHhqeUdSbndEbkVpMkMyUlRuVE1qTExRa0d6d2FZQ1ZP?=
 =?utf-8?B?a3RUMjJscjZEYUVsUE5IZ0t3d1d6REUrc0dZN3FCTk1vc3h0cGFpaEVhWSs0?=
 =?utf-8?B?RGs5VUhBSGN0cE9VSHI5UnhRR0lmMnNEaDNmUzJTWmtabDB4K2JwamRNWndB?=
 =?utf-8?B?R1EwbjZnQkI4SmhzWk1QSGJVUnRPQmhZYldGWFU1b0YrRy9MRTZtMzZvbGVN?=
 =?utf-8?B?Q3JsRGtldHIrQzdJMW55TU43MXh4SkRyL0FnQlhYVmtmTCt0TndyN3ZjZ0Ru?=
 =?utf-8?B?QXd5cTlDbUh1MDF3QThESHpWVkFjVFo2ZUFpVEpqZDBickpWbk5SbTc0dWVq?=
 =?utf-8?B?QzkyQi9ldTQxMzJIMDMwVWdZRVA0WmtTVWE2cjZmODhaVnhGcUplQjhhSUM1?=
 =?utf-8?B?VXVVSjFveElCdXRlSFJ3Y1RSUk9NeDJTcHdsWFVkbFFTTytsUG1TS0FsMWJt?=
 =?utf-8?B?N3N2c0NabkVZblZnQ2pOdndsYnlUVUg2UUlUMnNadkpZZVo3bU00Nk9GWGVS?=
 =?utf-8?B?Q2E2ckFYT1lVdXJEa2xoa0V5VmpHNGN3K3pkRkRWcDkrWFYyUitVNXBNNWJK?=
 =?utf-8?B?Y1VSOTJXM0RhK2FtM1NTcHV0WDhlS041VmdoZm1WcGZTaDhFc0VFanNLMDJo?=
 =?utf-8?B?cHNaVUU4WWRBUzExaHUyVHBiRmtJWjFYQU55RzZyVGozMjdkMFo4dzhVTUR2?=
 =?utf-8?B?YXV3YmNqcTZhc3FCOUZFL1JkQ2FHdndhMUg4WU1EVllmcy8zNEFkcmRwRldD?=
 =?utf-8?B?Q1Q2bUx1bFhjOFZ6QTd3dkh4OFFBOVdsVnp0LzdFeHVHRVB6UDEzZHBzTHky?=
 =?utf-8?B?cHdKME5VZUY0YkJnWkpxYkZQV3lndHp3Vk5tN05TMGxQamR5MW1JNm5Ua2RL?=
 =?utf-8?B?OVZPU1N4Q090VlVBZnU4RmZEalpiR01KS056bVdkWHNJcHk3MDBhNlBBWE1s?=
 =?utf-8?B?K2swRW9jWCtRWXhHYkxOUWxpUHI2bjdSaS9rRjNNbVVTWGtWZkRLMm9KWmcw?=
 =?utf-8?B?K0Z5NVhtQXg1MEZkMzQzRGRacHUxcDhBQjFVUiswanBpUzE5cVFvamVUbEtr?=
 =?utf-8?B?TDFVcVZmc3AvblNLS1FtcFlkTjZGajZBNkowVFQ4b2RMRFJnVHd2anFaVW9z?=
 =?utf-8?B?L0pwL01nMERIRmQ2K2ZnOUhCaFo2WmRsQjcrZENSN1VXMldub2pQa2lqV1My?=
 =?utf-8?B?eWx1YXhRVWtzQ2Y5KzRhaEdGUytOZVlqZnNyOW5KR2I0UUdHN0pPWmkra0tS?=
 =?utf-8?B?Y3oyZjc3aXRqNFNxNzhQMXEwNnlaUk1ucW02MWZBOUREamd3dUpqRVI0T1Y5?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc685392-60cc-460a-1dd8-08dd50bb79af
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 08:00:29.0559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvCMWyUwR1iPfv2ZTiYv9UgfaNEjuQCp1RK4oWvVlaLOnStyXp07MdmCB2MBm8bBISYGxsDW2ZEvqWgl5Tg/ucTDEl8VygX7aD6cEldJW6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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


On 2/18/2025 1:02 PM, Sharma, Swati2 wrote:
> Hi Kamil
>
> On 14-02-2025 04:15 pm, Kamil Konieczny wrote:
>> Hi Swati,
>> On 2025-02-13 at 18:58:02 +0530, Swati Sharma wrote:
>>> Add kms_sysfs_edid_timing to blocklist. Test was written with the
>>> idea that edid read shouldn't take an unreasonable amount of time.
>>> The timeout is an arbitrary value because it depends on when the
>>> display responds and, in some cases, especially when the display
>>> is coming back from sleep, it can take quite a while. This test
>>> has sporadic behavior across various platforms connected to
>>> different displays.
>>>
>>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Could such measurements be moved to tools into some generic one,
>> like display_wakeup or display_response?
> Even I had this proposal to move this test into tools.
> @ankit any feedback?

Perhaps there would be some value to have a tool to get the measurement.

I agree on adding the test to the CI blocklist to reduce noise due to 
this test.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>



>>
>> Regards,
>> Kamil
>>
>>> ---
>>>   tests/intel-ci/blacklist.txt    | 10 ++++++++++
>>>   tests/intel-ci/xe.blocklist.txt |  9 +++++++++
>>>   2 files changed, 19 insertions(+)
>>>
>>> diff --git a/tests/intel-ci/blacklist.txt 
>>> b/tests/intel-ci/blacklist.txt
>>> index 1236b8280..9917bf46a 100644
>>> --- a/tests/intel-ci/blacklist.txt
>>> +++ b/tests/intel-ci/blacklist.txt
>>> @@ -151,3 +151,13 @@ igt@kms_ccs@.*-4-tiled-xe2-ccs
>>>   igt@kms_frontbuffer_tracking@plane-fbc-rte
>>>   igt@kms_pm_dc@deep-pkgc
>>>   igt@kms_vrr@cmrr
>>> +
>>> +###############################################
>>> +# Test was written with the idea that edid read shouldn't take an
>>> +# unreasonable amount of time. The timeout is an arbitrary value
>>> +# because it depends on when the display responds and, in some cases,
>>> +# especially when the display is coming back from sleep, it can take
>>> +# quite a while. This test has sporadic behavior across various
>>> +# platforms connected to different displays.
>>> +###############################################
>>> +igt@kms_sysfs_edid_timing
>>> diff --git a/tests/intel-ci/xe.blocklist.txt 
>>> b/tests/intel-ci/xe.blocklist.txt
>>> index 6964628f1..80ceba9a5 100644
>>> --- a/tests/intel-ci/xe.blocklist.txt
>>> +++ b/tests/intel-ci/xe.blocklist.txt
>>> @@ -80,6 +80,15 @@ igt@kms_pm_rpm@cursor.*
>>> ##################################################################
>>>   igt@kms_prime@.*
>>> ##################################################################
>>> +# KMS: Test was written with the idea that edid read shouldn't take an
>>> +# unreasonable amount of time. The timeout is an arbitrary value
>>> +# because it depends on when the display responds and, in some cases,
>>> +# especially when the display is coming back from sleep, it can take
>>> +# quite a while. This test has sporadic behavior across various
>>> +# platforms connected to different displays.
>>> +##################################################################
>>> +igt@kms_sysfs_edid_timing
>>> +##################################################################
>>>   # KMS: Non-Intel tests
>>> ##################################################################
>>>   igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
>>> -- 
>>> 2.25.1
>>>
>
