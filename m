Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C03FC6168
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 17:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E724A10ED4D;
	Fri, 13 Sep 2024 17:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmij27La";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE22D10ED4D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726247014; x=1757783014;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3p26kgwJIeCDRnPamiGtLIqCpo9LW0IAsedJ+NyO75U=;
 b=mmij27LasZS/vJ8Bh8J8EWBQx18bS+mkuHxkWpeVgsIM6qainP4fJE/j
 HgTLv15mT9KhZAERAgGRrbiXiUZrVTVJlAr+5WtBzEDW6dBQSkBxOePfp
 StgtAYvU5oQIIoWPl2G/WQ5D/k/HPnYP80Rzz/dYbIRxfVGsIbEhGS3u/
 r0Zs3POnSr4PyVVLPIB4wO3g6+TA+h4nEzX4zY5sj88A6vGwCxxP/lj3R
 nJb7/kYiP5v3H//kwYDUITVrKQLSFtCnNU37iwSwZm1iB42dY95Vh406U
 e4g+o8/QmHQ9Yu4lySy9eS4cBPG4Y9T5iYxQjsP21d214Gt1fYDfvat/T Q==;
X-CSE-ConnectionGUID: KxXJnYGnR6yGAVBfNd8Xkg==
X-CSE-MsgGUID: /7MpBUdnRQ6VI8lk5PIp0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="13515411"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="13515411"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 10:03:34 -0700
X-CSE-ConnectionGUID: VbBCkHupQgWGXsikJZ3QgQ==
X-CSE-MsgGUID: Gk72BYzVS8eoIXi4sbj3Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; d="scan'208";a="105565186"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 10:03:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 10:03:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 10:03:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 10:03:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N4FYW5JN+vGy9zYOV0RiBgwrqexOhMs+RqkGaRRuq6OhJzBIUttt0B3sBa4ua24bs0c6aldpOuMgpdyh/KUX6GpizI6Ed9dIY15U/6fXFvk/0SGt68IRBhhJUumbBv5pUE1Jhftwf7R7iP5oJaBSq0L71IavswCmobtFp6adBHPkuNeP58xQ7CO8lkFAXoeCOOgPefBgX20Wub81K878JMOmdQCZB89URDouovo9rvNI8O1AspLaZoJZ85wUWx9uZYr21PBIdCI6PLvPX4K7aePFqjLWbErBoVhjZbAGgKjzpTfz8rIvP/b3Vu8TqBl/jRsdGM+an2vCksXTWu5gGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF9SLEd15qBjkahm0lWL2PsvhiMUT7LiT8zESc3OGl0=;
 b=oly+XckaeWpMxqNtJaIdM2D0dkNrTtHdzqaoO0dtK6S3DEAF3uRxKrB9paQMGlQ4VI8RLIh1OH17KBEJhkoLBeQIllQsSKuFtAllZFzAoVLLETTxLKqGozld91cjUNJT3WbmUwsqaU3tRbjwYwa4/LIJGuD996TLPNtjANO5e0nsOwlPqx2MI7Npzk3fg1KjKJnVbY9HTspggyqRM4y2uBZVU+twPur4W/MzinnqSCp5wNWN4CXExT51TbtSsq01WyfgTxCi7TXto5G9UlNimSswoDwdJ9lTAWDZtQk5WK5nV6sHuCX2zLcwBj2xstZOZoc9w6JuLW4J5U9RFs1FBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6949.namprd11.prod.outlook.com (2603:10b6:510:227::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 13 Sep
 2024 17:03:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Fri, 13 Sep 2024
 17:03:30 +0000
Date: Fri, 13 Sep 2024 12:03:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t] gputop: Print message without clients
Message-ID: <gi7o3hdi6nvgvov2kq3ihqvmsuhxzcxzfs5wg657vj4m73av7r@rdkrfek5mkwl>
References: <20240912141426.4115404-1-lucas.demarchi@intel.com>
 <20240912152459.mobiy2gamphm2amt@kamilkon-DESK.igk.intel.com>
 <sv3j2ncod3winjgli56hhcgctnl7f2tulzimrsd74jumq5cmgo@4via275aohjt>
 <20240913165205.jjcvkbbaw7ghtgjj@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913165205.jjcvkbbaw7ghtgjj@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:303:b5::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd4ede6-a19e-48b9-5890-08dcd415fdfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yjd4a1hEVXowTjZRdFBMcGNaNGtmYkVmczlSQi9ZNWtxY3hNQlJ1OXNWR2Jo?=
 =?utf-8?B?ODBDMmkxT21INEdCc2QrL1Y3eXBNNU9CSzVQRzljTXN2dEdDei9yUUoweGtM?=
 =?utf-8?B?VUxWY3dFRUxjZ29tSTY2NFlMazVsQTVuNzc4ZkE2YXVNZUlTTjRuQ056dWNP?=
 =?utf-8?B?dThpMW9wTTdwU1RSN05XNmorbklLYnZCZWdYcnhFZGZrTy9qb0RJaWdSWDBj?=
 =?utf-8?B?bG5DdGJMS3BBT09pYmU4Rm15bkh3akZYQ2I2c2M4Z1N2NVhXSUR1eVdYcVow?=
 =?utf-8?B?T1U4a05VQWxPK2Q4dzBSREh5dndoRlhvMDRnZEtYYjlQWTNJdkx5c2JRd2lz?=
 =?utf-8?B?RkxaVXVDV0pOdElsdU9uN2ZLSGVuOXBEL0s4bUw0M2dGYTc3Vy9ta2xjR3JM?=
 =?utf-8?B?WWVRS25GT0RVaGpnV0dON3d5YXZDRmRmSnRiREdKdjVMc2JlM1NPNk8xME5h?=
 =?utf-8?B?YnB3bklCRnVLakQyY3ZNR1FjZWZMKzc3bjlYV2pJaEd4L0lYeE5OR0Jvc2lp?=
 =?utf-8?B?NExYWFhKWHJBaW1Lc2JkUVY3emk5ekJvUmJ0RTJ5TGxMQmVBKzZXM0p1eldi?=
 =?utf-8?B?aVgxUVJwNUh6dkZlajFVK1hXbmRMWXFTaHd5RkV2L01VbG96aG1rMmdFaThv?=
 =?utf-8?B?NGpjTDd2OTM4ZFZBL0lMaC9yVmc3UFQ0azg5WG4ybk5uNGFDdjlzM3BnSnhy?=
 =?utf-8?B?bmRGclNxcHZEMlI5bkNIaitNWlVYdUZvTEEyS0hSTTUxdE1ndWxVRzJoZmxO?=
 =?utf-8?B?RFJlZlBoT2JSUXU3bkUxdlVSc3c1UDE2blA5ZEhNNTFRVkRPNS95ZGJvWG1u?=
 =?utf-8?B?Wmxnd3g5djV6TnlWUnA5b0pEUCtjNGEyYmMyREFCTDdFOGhMczlGT3hadmhV?=
 =?utf-8?B?NUlaeWFxSFZ2OGcxSEZXMi9IUS9HZjQ4a2U2bnNoZVpWeEdzN01rSnY5cmw5?=
 =?utf-8?B?T1YvV0RXQ05ON1M4VUQxMXROVy9POVVKSEtRaGpQYzY5SmFWanR6blo2c3pC?=
 =?utf-8?B?dlFwZ3c4M3VjVzZ6WFlrNE9IRXRFQVFla1phMlE4UjZ2YTkydmx4MkVUdENm?=
 =?utf-8?B?NHI5aUFYU05CeXJ0OVNtYThtUUYzbVFVRWZnRU0vUHNtTlBaMFFvVHhCcGZZ?=
 =?utf-8?B?Skp3VWhnZWdIMGRxdlNKVHpZRVdsUjNyeHA2R3hoeFdpc0YyME5DOEtWb3JO?=
 =?utf-8?B?MjF5Z3g5ejhRWDR1OTJBTjFSQnZMNnhHL0xpQmVSOWdMRmxMdlB4NjBNRkVR?=
 =?utf-8?B?ajZza1ZBWkNEUUUvcDFFbzRESHQwaGR6NFlaWjR4TzgyYk40N1p4eU9nOWhi?=
 =?utf-8?B?amdwaTdBYkM5eVpTZCsreTh5eFJMRmUwQ1AyV1NvUXk1bUYwTHMvM1dNK2Ft?=
 =?utf-8?B?U054SVhpS1VEVlcrUExuRC9ramFMSGNqZzJnUURhSnJ3cmsxeTdDaXA0ajNN?=
 =?utf-8?B?UWJ0Z253ZWxySkw0NEJsV1NYS3MrejNCQlljdU1CZFV3OHNLVnZaUjhkYTAy?=
 =?utf-8?B?OUNkbmZsZExvalJnb3R6cXhtUUtlaFNwcUd6UmdwbEdlTHZEMmZ6QXRKREJR?=
 =?utf-8?B?ejB1VU9mazFjSW95dVpHZ2Z3Ris2RHltSlVQQm9wdXpwTjdNeHBpVS9sYVFo?=
 =?utf-8?B?ajNkOWN5SkFhSlF3SjVNaytOTGlXclJELzVoWDF2T29kTGlSVHNIemw1T0hB?=
 =?utf-8?B?ajA4bmNySmRUa2x1emdiWHlOOXU2UUxCWXMraDJrZWZXd0JqTWRWa2s0ZW52?=
 =?utf-8?B?YWlMSi9JVVI1QWJSZi8zWi9MQlhLS3MwRm5pbUttRkV3aVdINU9ORDI4SW1N?=
 =?utf-8?B?MVBjdTNUUmNxYThZT3A0QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDhUeUZCT3huS2E2Rzc5SWM1WitvbHdjMitwQUMrdk9yaXBuai9rWXhWTnRp?=
 =?utf-8?B?T0ViTVhxZFhuNlJoLzRaV01XOEE2aFJXZUFIa3MwRVppL2REcDBqMFY2bFJ1?=
 =?utf-8?B?andkMnNyOG1nSFFBLzVnRFRxR3pmWjRrd1J6NWl4VnFuNHMwbHRzR3hHbXQ4?=
 =?utf-8?B?cWd1TzJEV0NFV3ZMUXhOUXNPTG1zdFl3dmt2ZjNVVC9IQnhFMkRTbkFVTDlo?=
 =?utf-8?B?QUhQT2JPOVV2bWxrODRMRmdvSTJlVjVUeFFtNHI1RlM4RzZYR0NPTzVzTDFl?=
 =?utf-8?B?NEpuUU81NlZSbmJycExuTmtmUy80bzZzNU1TSEN6c25kSXZVSGtqRll0aktX?=
 =?utf-8?B?a1MxYjZwczJZeXh2QjlkcFhiZVdRZXNuSFRjYTljQWFIZmlKTjZvdlR2TzEy?=
 =?utf-8?B?Rk9DVGM0Yk0wRjNFM1p3b0lFbHMzaUo0UEEvVjZYaklZR2VrWnMrVHludDA4?=
 =?utf-8?B?czQrdDVENlJza29yaUQrRVpSTitYT24wTy8zeEdaeDhVeTVpRWdOUFpmM0s2?=
 =?utf-8?B?VnVjR0Z6VnUwSlcvcFpqVUtXWHVOV1pEZGxBVHNpbzRlV25uV2NnbUt4R2NW?=
 =?utf-8?B?enJHOVlhREFrK3RPREZqOGk5YlNOSGFJdHdiYk8wOUV2YWFxL2gvZ2Z2aFhk?=
 =?utf-8?B?aVptS1Jwa3lHbTJZNFNnY2QzTksrcjBYMWhyWWYzMUxjVWpqYWREMEw3YUFv?=
 =?utf-8?B?QitRK3IxUEowV0h2ZUI0cTJZUmpaaC9HVlF0akh0cmpqZER5Wm1EaTVudTUz?=
 =?utf-8?B?eVNEL0JoWGZTT3VpQnd1YzVmTkwzeng4Wnp4TnRqNHVuN1VPZ05pRC93TUJ5?=
 =?utf-8?B?aUIzeHB1WHFlZ0ZRbDNKbFovOHZLQU0yaURYekZmTEJzbjh5aytDdjF5dTN5?=
 =?utf-8?B?dktyajFOSE5GQUtuc3lRL0dNejlZLzQ3QXcwTXRzQm02ZTFZWlNtUVpXQlJT?=
 =?utf-8?B?UWVHdEIyTFdlRytsMktxT0FhbWM5WHhKamV0Nm1pa01RQlAwSTNsVFdPV3pF?=
 =?utf-8?B?Uk8xam84ZnM1eFR6Um9nYkRLRVBtQXhySmI1WDllTVFrQmNXSkN3ekFSbCtT?=
 =?utf-8?B?LzNWdkVxUUt1R3VHejF3MXpUMXBsYlZIY09NVDIycm50anRLeHloaWs3Sm8w?=
 =?utf-8?B?MEZxbWhQZHNMSlJLM2NseEVMdVVvUkZRSzF0RzVvZzdqQVJTWXlYRVF1SjFi?=
 =?utf-8?B?c1h6R0Q4VWk5RmlaNENaZFJzaldqaURUcXNDTkF5N1lRczFGcEV5a2RHdGxj?=
 =?utf-8?B?V3JtL21TSGVoTkc5Z012RXhqWkc4UGFxOWk0Smh3SHkvRUh1Q1NXR0wzWTlq?=
 =?utf-8?B?ckE0R0oreGhNRVpaZEMwakk3RlZRUjJKQWVKcTVVUG5QRC9oZ3RhLytDbTl3?=
 =?utf-8?B?TTBUQnZ4UXE3Vllva2NvQmlzc3l0UFBWTWxkOW1JeGNNUWlQS3R5RWduMHFF?=
 =?utf-8?B?c0pYTkRrT09sTnluM2Jtd3BUaVNscWZmZEZDUVVLR2E2Mk1JWUtBWWVOTS9p?=
 =?utf-8?B?amtSNDZwT1ZFcENXd29LbmxLV0doNVZXYS8ya1F2V0MzNkN1YUovS1VjR3Vw?=
 =?utf-8?B?VWhWeTV2dVhoUm9uaEJhc1E5YTJBQjBLanQ2cmg0bEM5N2NWbHEzaFlGZm90?=
 =?utf-8?B?U0F4blBmWlVWYnVQN0h4bFRra2UvdlRndkVWRU5mbWRzSGZXNzFtUjVLN291?=
 =?utf-8?B?RW9oMXNRU3UvWFNwTVZxV1FQVkNrNmQrSXNNc1VzSmJVeTdNeW5KYkNBRVc0?=
 =?utf-8?B?VU9pNnlxRmVLaDNvVUJrVlYzNlM0eUtOMytldDNWcC9vUWxsSHB2R21iNEpC?=
 =?utf-8?B?MmxPbW1NSnRzVnQrZ2pCNmJYcDFwT01YdlJlbloxKy9pWlJDQjNUajdrdVNy?=
 =?utf-8?B?cmNDRUVCejgzTVcwNUJ4cmk5c1pCYm5qdkpvTURhbys4ZUM1WVRIQXZhZitp?=
 =?utf-8?B?R1JNMm1NbFJIWUZxN3A2dnR6TjhkQ3ZwVUp5Ry9SZ1RnM0JWb0pTZytXNHUz?=
 =?utf-8?B?R1pDQktvRlRrVjFYbVVNWGNneURPcHh4ME1zUzRsdnBzTUoyYnpTcmJyaHF5?=
 =?utf-8?B?aG1DeDE1WmFvMmVYajJBb280VnhMS0lVQmRSakZIQmlrY0xuUWIzZ1BIYmZF?=
 =?utf-8?B?RysyUDhVVWFXbmFzM2R1SVZoM0hYYkg5UGs3NmxiaW5qWGhNc1IzNUo2ZEJ6?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd4ede6-a19e-48b9-5890-08dcd415fdfc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 17:03:30.1711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvo7I4fF47oPRB7h1fTiHYPqvgeX3mhzBsqOkobn+GOcQbr4SJ4W5MYJAiSE38RhxL+pBq0e7GFzr0kTE96Ia/uKRCs7SdBjT82mBElMxgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6949
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

On Fri, Sep 13, 2024 at 06:52:05PM GMT, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-09-12 at 11:06:09 -0500, Lucas De Marchi wrote:
>> On Thu, Sep 12, 2024 at 05:24:59PM GMT, Kamil Konieczny wrote:
>> > Hi Lucas,
>> > On 2024-09-12 at 07:14:26 -0700, Lucas De Marchi wrote:
>> > > Devs are often confused why gputop doesn't display anything and think it
>> > > doesn't yet support the driver/platform. This is different from
>> > > intel_gpu_top that can display a header with engines, because in that
>> > > case there is a fixed set of engines and no variance according to the
>> > > driver.
>> > >
>> > > Print a message to give a hint that nothing is displayed because there's
>> > > nothing running.
>> >
>> > Could we diplay at least current power consumption and accumulated one?
>>
>> but those are not supported in gputop yet, AFAIK. What igt functions
>> and/or kernel interfaces are you suggesting?
>>
>> Lucas De Marchi
>>
>
>I didn't have time for looking how/what to use,
>just used intel_gpu_top -c and see:
>
>
>Freq MHz req,Freq MHz act,IRQ /s,RC6 %,Power W gpu,Power W pkg,IMC MiB/s rd,IMC MiB/s wr,RCS %,RCS se,RCS wa,BCS %,BCS se,BCS wa,VCS %,VCS se,VCS wa,VECS %,VECS se,VECS wa
>0.000000,0.000000,0.000000,99.993090,0.000000,4.020512,1051.870011,24.579949,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
>0.000000,0.000000,0.991862,100.000000,0.000000,0.656479,200.265345,3.654343,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000
>0.
>
>The one interesting field is 'Power W gpu', I assume most drm/gpu
>drivers have it? Next one is Freq MHz act.

Those are obtained via PMU, not currently supported in gputop (or even
in xe). For freq, we could fallback to sysfs for xe, sampling it at a
higher freq than the update rate... But we'd also need to figure out how
to do it for other drivers. For xe, adding the fallback is under
discussion, but we may also soon gain PMU support.

So... let's go with this for now.


Applied, thanks.

Lucas De Marchi

>
>Regards,
>Kamil
>
>> >
>> > It is only a suggestion, so
>> > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> >
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  tools/gputop.c | 14 ++++++++++++--
>> > >  1 file changed, 12 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/tools/gputop.c b/tools/gputop.c
>> > > index 8842eebbd..43b01f566 100644
>> > > --- a/tools/gputop.c
>> > > +++ b/tools/gputop.c
>> > > @@ -39,6 +39,9 @@ enum utilization_type {
>> > >
>> > >  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>> > >
>> > > +#define ANSI_HEADER "\033[7m"
>> > > +#define ANSI_RESET "\033[0m"
>> > > +
>> > >  static void n_spaces(const unsigned int n)
>> > >  {
>> > >  	unsigned int i;
>> > > @@ -82,7 +85,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>> > >  	if (lines++ >= con_h)
>> > >  		return lines;
>> > >
>> > > -	printf("\033[7m");
>> > > +	printf(ANSI_HEADER);
>> > >  	ret = printf("DRM minor %u", c->drm_minor);
>> > >  	n_spaces(con_w - ret);
>> > >
>> > > @@ -123,7 +126,7 @@ print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>> > >  		}
>> > >  	}
>> > >
>> > > -	printf(" %-*s\033[0m\n", con_w - len - 1, "NAME");
>> > > +	printf(" %-*s" ANSI_RESET "\n", con_w - len - 1, "NAME");
>> > >
>> > >  	return lines;
>> > >  }
>> > > @@ -447,6 +450,13 @@ int main(int argc, char **argv)
>> > >  		update_console_size(&con_w, &con_h);
>> > >  		clrscr();
>> > >
>> > > +		if (!clients->num_clients) {
>> > > +			const char *msg = " (No GPU clients yet. Start workload to see stats)";
>> > > +
>> > > +			printf(ANSI_HEADER "%-*s" ANSI_RESET "\n",
>> > > +			       (int)(con_w - strlen(msg) - 1), msg);
>> > > +		}
>> > > +
>> > >  		igt_for_each_drm_client(clients, c, i) {
>> > >  			assert(c->status != IGT_DRM_CLIENT_PROBE);
>> > >  			if (c->status != IGT_DRM_CLIENT_ALIVE)
>> > > --
>> > > 2.43.0
>> > >
